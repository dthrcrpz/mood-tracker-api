<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Question;
use App\Models\AnswerGroup;
use Illuminate\Http\Request;
use App\Models\ScoringSetting;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class QuestionController extends Controller
{
    public $scoringSettings;

    public function __construct() {
        $this->scoringSettings = ScoringSetting::orderByDesc('score')
        ->get();
    }

    public function index () {
        $questions = Question::with([
            'choices'
        ])
        ->get();

        foreach ($questions as $key => $question) {
            $question->active = ($key == 0) ? true : false;
        }

        return response([
            'questions' => $questions
        ]);
    }

    public function store (Request $r) {
        $validator = Validator::make($r->all(), [
            'question' => 'required',
            'question_sequence' => 'sometimes',

            'choice' => 'required',
            'choice.*' => 'required',
            'choice_score' => 'required',
            'choice_score.*' => 'required',
        ]);

        if ($validator->fails()) {
            return response([
                'errors' => $validator->errors()->all()
            ], 400);
        }

        $question = Question::create([
            'question' => $r->question,
            'sequence' => ($r->sequence) ? $r->sequence : Question::count() + 1,
        ]);

        foreach ($r->choice as $key => $choice) {
            $question->choices()->create([
                'choice' => $choice,
                'score' => $r->choice_score[$key],
            ]);
        }

        return response([
            'question' => $question
        ]);
    }

    public function show (Question $question) {
        $question->load('choices');

        return response([
            'question' => $question
        ]);
    }

    public function update (Question $question, Request $r) {
        $validator = Validator::make($r->all(), [
            'question' => 'required',
            'question_sequence' => 'sometimes',

            'choice' => 'required',
            'choice.*' => 'required',
            'choice_score' => 'required',
            'choice_score.*' => 'required',
        ]);

        if ($validator->fails()) {
            return response([
                'errors' => $validator->errors()->all()
            ], 400);
        }

        $question->update([
            'question' => $r->question,
            'sequence' => ($r->sequence) ? $r->sequence : Question::count() + 1,
        ]);

        $question->choices()->forceDelete();

        foreach ($r->choice as $key => $choice) {
            $question->choices()->create([
                'choice' => $choice,
                'score' => $r->choice_score[$key],
            ]);
        }

        return response([
            'question' => $question
        ]);
    }

    public function destroy (Question $question) {
        $question->delete();

        return response([
            'message' => 'Question deleted'
        ]);
    }

    public function submit (Request $r) {
        $user = $r->user();
        $answerGroup = $user->answer_groups()->create();

        foreach ($r->questions as $key => $question) {
            $question = json_decode(json_encode($question));
            foreach ($question->choices as $key => $choice) {
                if ($choice->selected) {
                    $answerGroup->answers()->create([
                        'choice_id' => $choice->id,
                        'user_id' => $user->id
                    ]);
                }
            }
        }

        $result = $this->computeAnswerGroup($answerGroup)['result'];

        return response([
            'result' => $result
        ]);
    }

    public function userAndHistory (User $user) {
        $history = $this->getHistory($user);

        return response([
            'user' => $user,
            'history' => $history
        ]);
    }

    public function history (Request $r) {
        $user = $r->user();
        
        $history = $this->getHistory($user);

        return response([
            'history' => $history
        ]);
    }

    protected function getHistory ($user) {
        $answerGroups = AnswerGroup::where('user_id', $user->id)
        ->orderByDesc('created_at')
        ->get();

        $history = [];

        foreach ($answerGroups as $key => $answerGroup) {
            $result = $this->computeAnswerGroup($answerGroup);
            // $result->date = $answerGroup->created_at;
            // $result->date = Carbon::parse($answerGroup->created_at)->format('(l) M d, Y - h:i A');
            array_push($history, $result);
        }

        return $history;
    }

    protected function computeAnswerGroup ($answerGroup) {
        $answerGroup->load([
            'answers.choice' => function ($q) {
                $q->orderByDesc('score')
                ->with([
                    'question'
                ]);
            }
        ]);

        $score = 0;

        foreach ($answerGroup->answers as $key => $answer) {
            $score += $answer->choice->score;
        }

        $score = $score / count($answerGroup->answers);

        $result = null;

        foreach ($this->scoringSettings as $key => $scoringSetting) {
            if ($score >= $scoringSetting->score) {
                $result = $scoringSetting;
                break;
            }
        }

        $date = Carbon::parse($answerGroup->created_at)->format('(l) M d, Y - h:i A');

        return [
            'result' => $result,
            'date' => $date
        ];
    }
}
