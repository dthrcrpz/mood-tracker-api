<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Choice extends Model
{
    use HasFactory, SoftDeletes;

    protected $guarded = ['created_at'];

    public function question () {
        return $this->belongsTo(Question::class);
    }
}
