<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRoomTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('conf_rooms', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('sid');
            $table->string('room_name');
            $table->string('type');
            $table->integer('max_participant');
            $table->dateTime('start_time', 0)->nullable();
            $table->dateTime('end_time', 0)->nullable();
            $table->float('duration', 8, 2);
            $table->string('url')->nullable();
            $table->string('active_status');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('conf_rooms');
    }
}
