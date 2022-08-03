<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GeneralExam extends Model
{
    use HasFactory;

    public function term()
    {
        return $this->belongsTo(Term::class);
    }

    public $fillable = [
        'name',
        'short_name',
        'max_marks',
        'published',
        'details',
    ];
}
