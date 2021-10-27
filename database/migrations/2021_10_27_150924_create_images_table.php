<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateImagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('images', function (Blueprint $table) {
            $table->id();
            $table->integer('parent_id')->unsigned()->nullable();
            $table->string('title')->nullable();
            $table->string('alt')->nullable();
            $table->string('category')->nullable();
            $table->string('path');
            $table->string('path_resized');
            $table->string('type')->nullable();
            $table->integer('sequence')->nullable();
            $table->string('temporary_id')->nullable();
            $table->string('file_name')->nullable();
            $table->string('file_size')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('images');
    }
}
