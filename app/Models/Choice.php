<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Choice extends Model
{
    use HasFactory, SoftDeletes;

    protected $guarded = ['created_at'];
    protected $hidden = ['created_at', 'updated_at', 'deleted_at'];
    protected $appends = ['selected'];

    public function question () {
        return $this->belongsTo(Question::class);
    }

    protected function getSelectedAttribute () {
        return false;
    }
}
