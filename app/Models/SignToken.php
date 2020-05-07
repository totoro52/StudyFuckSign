<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SignToken extends Model
{
    protected $table = "sign_token";
    //protected $primaryKey = "id";
    protected $fillable = [
        'name','uuid','cookie'
    ];
}
