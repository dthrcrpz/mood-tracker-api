<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Answer extends Model
{
    use HasFactory, SoftDeletes;

    protected $guarded = ['created_at'];

    public function answer_group () {
        return $this->belongsTo(AnswerGroup::class);
    }

    public function choice () {
        return $this->belongsTo(Choice::class);
    }

    public function user () {
        return $this->belongsTo(User::class);
    }
}
