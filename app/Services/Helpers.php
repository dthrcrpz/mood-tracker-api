<?php

use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;

/**
 * [addImages description]
 * @param [string] $type  Name of the model in kebab case. Make it singular (e.g. product-variant, customer-detail)
 * @param [object/array] $r     [The Request object. It contains the images]
 * @param [Model instance] $model [Model!!!]
 */
function addImages ($type, $r, $model) {
    $existingImagesCount = $model->images($type)->count();
    foreach ($r->file as $key => $image) {
        $proceed = true;

        if ($proceed) {
            $uploadedImage = uploadFile($image);
            $imageData = [
                'title' => (isset($r->file_title)) ? $r->file_title[$key] : null,
                'alt' => (isset($r->file_alt)) ? $r->file_alt[$key] : null,
                'sequence' => (isset($r->file_sequence)) ? $r->file_sequence[$key] : $existingImagesCount + 1,
                'path' => $uploadedImage->path,
                'path_resized' => $uploadedImage->path_resized,
                'category' => (isset($r->file_category)) ? $r->file_category[$key] : null,
                'type' => $type,
                'file_name' => $uploadedImage->original_file_name,
                'file_size' => $uploadedImage->file_size
            ];
            $model->uploadImage($imageData);
        }
    }
}

function updateImages ($type, $r, $model) {
    $existingImagesCount = $model->images($type)->count();

    if ($r->file_id) {
        foreach ($r->file_id as $key => $image_id) {
            if ($image_id == 0) { # if new image, upload this
                $image = $r->file[$key];
                $uploadedImage = uploadFile($image);
                $imageData = [
                    'title' => (isset($r->file_title)) ? $r->file_title[$key] : null,
                    'alt' => (isset($r->file_alt)) ? $r->file_alt[$key] : null,
                    'sequence' => (isset($r->file_sequence)) ? $r->file_sequence[$key] : $existingImagesCount + 1,
                    'path' => $uploadedImage->path,
                    'path_resized' => $uploadedImage->path_resized,
                    'category' => (isset($r->file_category)) ? $r->file_category[$key] : null,
                    'type' => $type,
                    'file_name' => $uploadedImage->original_file_name,
                    'file_size' => $uploadedImage->file_size
                ];
                $model->uploadImage($imageData);
            } else { # if old image
                if (isset($r->file[$key])) { # if a new image is selected
                    # update the old image data
                    $existingImage = App\Models\Image::where('id', $image_id)->first();
                    $uploadedImage = uploadFile($r->file[$key], $existingImage->path, $existingImage->path_resized);
                    $existingImage->update([
                        'title' => (isset($r->file_title)) ? $r->file_title[$key] : null,
                        'alt' => (isset($r->file_alt)) ? $r->file_alt[$key] : null,
                        'sequence' => (isset($r->file_sequence)) ? $r->file_sequence[$key] : $existingImagesCount + 1,
                        'path' => $uploadedImage->path,
                        'path_resized' => $uploadedImage->path_resized,
                        'file_name' => $uploadedImage->original_file_name,
                        'file_size' => $uploadedImage->file_size
                    ]);
                } else { # if no new image is selected
                    $existingImage = App\Models\Image::where('id', $image_id)->first();
                    $existingImage->update([
                        'title' => (isset($r->file_title)) ? $r->file_title[$key] : null,
                        'alt' => (isset($r->file_alt)) ? $r->file_alt[$key] : null,
                        'sequence' => (isset($r->file_sequence)) ? $r->file_sequence[$key] : $existingImagesCount + 1,
                    ]);
                }
            }
        }
    }
}

function getContentType ($extension) {
    $result = null;
    switch ($extension) {
        case 'svg':
        case 'SVG':
            $result = 'image/svg+xml';
            break;
        case 'gif':
        case 'GIF':
            $result = 'image/gif';
            break;
        case 'pdf':
        case 'PDF':
            $result = 'application/pdf';
            break;
        case 'ppt':
        case 'PPT':
            $result = 'application/vnd.ms-powerpoint';
            break;
        case 'pptx':
        case 'PPTX':
            $result = 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
            break;
        case 'xls':
        case 'XLS':
            $result = 'application/vnd.ms-excel';
            break;
        case 'xlsx':
        case 'XLSX':
            $result = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
            break;
        case 'docx':
        case 'DOCX':
            $result = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
            break;
        case 'doc':
        case 'DOC':
            $result = 'application/msword';
            break;
        case 'txt':
        case 'TXT':
            $result = 'text/plain';
            break;
    }

    return $result;
}

function uploadFile ($file, $oldFilePath = null, $oldFilePathResized = null) {
    $disk = 'public'; # s3 kapag s3. public kapag sa local lang isesave

    # get the file size
    $size = filesize($file);
    $units = array( 'B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB');
    $power = $size > 0 ? floor(log($size, 1024)) : 0;
    $fileSize = number_format($size / pow(1024, $power), 2, '.', ',') . ' ' . $units[$power];

    # delete the old file if it exists
    if ($oldFilePath != null) {
        Storage::disk($disk)->delete("uploads/$oldFilePath");
    }
    if ($oldFilePathResized != null) {
        Storage::disk($disk)->delete("uploads/$oldFilePathResized");
    }

    $filenameWithExtension = $file->getClientOriginalName();
    $extension = $file->getClientOriginalExtension();
    $filename = pathinfo($filenameWithExtension, PATHINFO_FILENAME);
    $folderDate = Carbon::now()->format('Y-m-d');
    $folderTime = Carbon::now()->format('H-i-s-u');
    $filenameToStore = $filename . '.' . $extension;
    $otherAcceptedExtensions = ['svg', 'gif', 'pdf', 'ppt', 'pptx', 'xls', 'xlsx', 'docx', 'doc', 'txt', 'SVG', 'GIF', 'PDF', 'PPT', 'PPTX', 'XLS', 'XLSX', 'DOCX', 'DOC', 'TXT'];
    $uploadPath = "uploads/$folderDate/$folderTime/$filenameToStore";

    # if the file is svg or gif, directly upload it and stop the function immediately by returning the path names
    if (in_array($extension, $otherAcceptedExtensions)) {
        Storage::disk($disk)->put($uploadPath, file_get_contents($file), [
            'visibility' => 'public',
            'ContentType' => getContentType($extension)
        ]);

        $toReturn = (object) [
            'path' => $uploadPath,
            'path_resized' => $uploadPath,
            'original_file_name' => $filenameToStore,
            'file_size' => $fileSize
        ];

        return $toReturn;
    }

    $unresizedFile = Image::make($file->getRealPath())->interlace()->encode($extension, 80)->orientate();
    Storage::disk($disk)->put($uploadPath, $unresizedFile->getEncoded(), 'public');

    # upload resized file
    $resizedFile = Image::make($file->getRealPath())->resize(750, 750, function ($c) {
        $c->aspectRatio();
        $c->upsize();
    })->interlace()->encode($extension, 80)
    ->orientate();

    $filenameToStore_resized = $filename . '_thumbnail.' . $extension;
    $uploadPathResized = "uploads/$folderDate/$folderTime/$filenameToStore_resized";

    Storage::disk($disk)->put($uploadPathResized, $resizedFile->getEncoded(), 'public');

    $toReturn = (object) [
        'path' => "uploads/$folderDate/$folderTime/$filenameToStore",
        'path_resized' => "uploads/$folderDate/$folderTime/$filenameToStore_resized",
        'original_file_name' => $filenameWithExtension,
        'file_size' => $fileSize
    ];

    return $toReturn;
}

function fileIsImage ($file) {
    $result = false;
    if (@is_array(getimagesize($file))){
        $result = true;
    }

    return $result;
}