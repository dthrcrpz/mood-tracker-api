<?php

namespace App\Http\Controllers;

use App\Models\Diary;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class DiaryController extends Controller
{
    public function index (Request $r) {
        $user = $r->user();

        $diaries = Diary::select('id', 'user_id', 'date')
        ->where('user_id', $user->id)
        ->orderByDesc('date')
        ->get();

        return response([
            'diaries' => $diaries
        ]);
    }

    public function store (Request $r) {
        $validator = Validator::make($r->all(), [
            'date' => 'required',
            'body' => 'sometimes',
        ]);

        if ($validator->fails()) {
            return response([
                'errors' => $validator->errors()->all()
            ], 400);
        }

        $user = $r->user();

        $diary = Diary::where('user_id', $user->id)
        ->where('date', $r->date)
        ->first();

        $payload = [
            'date' => $r->date,
            'body' => $r->body,
            'user_id' => $user->id
        ];

        if ($diary) {
            $diary->update($payload);
        } else {
            $diary = Diary::create($payload);
        }

        return response([
            'message' => 'Entry saved'
        ]);
    }

    public function show (Diary $diary, Request $r) {
        $user = $r->user();

        if ($diary->user_id != $user->id) {
            return response([
                'errors' => [
                    'Unable to view this'
                ]
            ], 403);
        }

        return response([
            'diary' => $diary
        ]);
    }
}
