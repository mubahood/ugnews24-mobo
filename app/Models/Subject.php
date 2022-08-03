<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subject extends Model
{
    use HasFactory;

    public function my_class()
    { 
        return $this->belongsTo(MyClass::class, 'my_class_id');
    }
}
