<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ScoringSetting;
use Illuminate\Support\Facades\Validator;

class ScoringSettingController extends Controller
{
    public function index () {
        $scoringSettings = ScoringSetting::all();

        return response([
            'scoringSettings' => $scoringSettings
        ]);
    }

    public function store (Request $r) {
        $validator = Validator::make($r->all(), [
            'score' => 'required',
            'result' => 'required',
        ]);

        if ($validator->fails()) {
            return response([
                'errors' => $validator->errors()->all()
            ], 400);
        }

        $scoringSetting = ScoringSetting::create([
            'score' => $r->score,
            'result' => $r->result,
        ]);

        return response([
            'scoringSetting' => $scoringSetting
        ]);
    }

    public function show (ScoringSetting $scoringSetting) {
        return response([
            'scoringSetting' => $scoringSetting
        ]);
    }

    public function update (ScoringSetting $scoringSetting, Request $r) {
        $validator = Validator::make($r->all(), [
            'score' => 'required',
            'result' => 'required',
        ]);

        if ($validator->fails()) {
            return response([
                'errors' => $validator->errors()->all()
            ], 400);
        }

        $scoringSetting->update([
            'score' => $r->score,
            'result' => $r->result,
        ]);

        return response([
            'scoringSetting' => $scoringSetting
        ]);
    }

    public function destroy (ScoringSetting $scoringSetting) {
        $scoringSetting->delete();

        return response([
            'message' => 'Scoring setting deleted'
        ]);
    }
}
