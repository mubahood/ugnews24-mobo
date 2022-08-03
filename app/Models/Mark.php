<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Mark extends Model
{
    public function general_exam()
    {
        return $this->belongsTo(GeneralExam::class);
    }

    public function subject()
    {
        return $this->belongsTo(Subject::class);
    }



    public static function boot()
    {
        parent::boot();


        self::updating(function ($model) {
            if ($model->mark > $model->general_exam->max_marks) {
                return false;
            } else if ($model->mark > 0) {
                $model->published = true;
            }

            if ($model->general_exam->published) {
                return false;
            }
        });
    }
    use HasFactory;
}
