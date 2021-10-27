<?php

namespace App\Models;

use App\Models\ModelWithImages;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Dummy extends ModelWithImages
{
    use HasFactory, SoftDeletes;

    public $modelName = 'dummy';

    protected $guarded = ['created_at'];

    public function tags () {
        return $this->belongsToMany(Tag::class);
    }
}
