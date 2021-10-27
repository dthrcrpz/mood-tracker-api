<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Image extends Model
{
    use HasFactory, SoftDeletes;
    
    protected $guarded = ['created_at'];
    protected $hidden = ['created_at', 'updated_at'];
    protected $appends = ['filename'];

    public function getFilenameAttribute () {
        return $this->attributes['path'];
    }

    public function getPathAttribute ($value) {
        return url('/') . '/storage/' . $value;
    }

    public function getPathResizedAttribute ($value) {
        return url('/') . '/storage/' . $value;
    }
}
