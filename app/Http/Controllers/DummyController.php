<?php

namespace App\Http\Controllers;

use App\Models\Dummy;
use Illuminate\Http\Request;

class DummyController extends Controller
{
    public function getBannerData () {
        $bannerData = Dummy::where('id', 1)
        ->with([
            'images'
        ])
        ->first();

        return response([
            'bannerData' => $bannerData
        ]);
    }

    public function updateBannerData (Request $r) {
        $bannerData = Dummy::where('id', 1)->first();

        $bannerData->update([
            'banner_title' => $r->banner_title,
            'banner_description' => $r->banner_description,
        ]);

        updateImages('dummy', $r, $bannerData);

        return response([
            'bannerData' => $bannerData
        ]);
    }
}
