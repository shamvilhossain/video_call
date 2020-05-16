<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRoomParticipantTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('conf_room_participants', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('user_identity');
            $table->string('user_type');
            $table->string('room_sid');
            $table->dateTime('join_time', 0)->nullable();
            $table->dateTime('disconnect_time', 0)->nullable();
            $table->tinyInteger('status');
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
        Schema::dropIfExists('conf_room_participants');
    }
}
