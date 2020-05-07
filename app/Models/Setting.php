<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    //
    protected $table = "settings";
    //protected $primaryKey = "id";
    protected $fillable = [
        'title','api_key','web_status'
    ];
}
