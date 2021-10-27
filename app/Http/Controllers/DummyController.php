<?php

namespace App\Http\Controllers;

use App\Models\Dummy;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

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

    public function productIndex () {
        $products = Dummy::where('id', '!=', 1)
        ->with([
            'images'
        ])
        ->paginate(20);

        return response([
            'products' => $products
        ]);
    }

    public function storeProduct (Request $r) {
        $validator = Validator::make($r->all(), [
            'product_name' => 'required',
            'product_description' => 'required',
            'product_price' => 'required',
        ]);

        if ($validator->fails()) {
            return response([
                'errors' => $validator->errors()->all()
            ], 400);
        }

        $product = Dummy::create([
            'product_name' => $r->product_name,
            'product_description' => $r->product_description,
            'product_price' => $r->product_price,
        ]);

        addImages('dummy', $r, $product);

        return response([
            'product' => $product
        ]);
    }

    public function showProduct (Dummy $product) {
        $product->load('images');

        return response([
            'product' => $product
        ]);
    }

    public function updateProduct (Dummy $product, Request $r) {
        $validator = Validator::make($r->all(), [
            'product_name' => 'required',
            'product_description' => 'required',
            'product_price' => 'required',
        ]);

        if ($validator->fails()) {
            return response([
                'errors' => $validator->errors()->all()
            ], 400);
        }

        $product->update([
            'product_name' => $r->product_name,
            'product_description' => $r->product_description,
            'product_price' => $r->product_price,
        ]);

        updateImages('dummy', $r, $product);

        return response([
            'product' => $product
        ]);
    }

    public function destroyProduct (Dummy $product) {
        $product->delete();

        return response([
            'message' => 'Product deleted'
        ]);
    }
}
