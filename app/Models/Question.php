<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Question extends Model
{
    use HasFactory, SoftDeletes;

    protected $guarded = ['created_at'];
    protected $hidden = ['created_at', 'updated_at', 'deleted_at'];

    public function choices () {
        return $this->hasMany(Choice::class);
    }
}
