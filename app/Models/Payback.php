<?php

namespace App\Models;


class Payback extends Model
{
    protected $table = 'payback';
	
	public function user()
    {
        return User::find($this->attributes['userid']);
    }
}