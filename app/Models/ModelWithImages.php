<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ModelWithImages extends Model
{
    public function images () {
        return $this->hasMany(Image::class, 'parent_id', 'id')
        ->where('type', $this->modelName)
        ->orderBy('sequence');
    }

    public function uploadImage ($data) {
    	Image::create([
    		'parent_id' => $this->id,
    		'type' => $data['type'],
    		'title' => $data['title'],
            'alt' => $data['alt'],
    		'sequence' => $data['sequence'],
    		'path' => $data['path'],
            'path_resized' => $data['path_resized'],
            'category' => $data['category'],
            'file_name' => $data['file_name'],
            'file_size' => $data['file_size']
    	]);
    }
}
