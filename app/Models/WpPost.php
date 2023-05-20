<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WpPost extends Model
{
    use HasFactory;

  
    public function getThumb()
    {
        $thumb = WpPost::where([
            'post_parent' => $this->ID,
            'post_type' => 'attachment',
        ])->first();
        if ($thumb != null) {
            return $thumb->guid;
        }
        $imgs = [];
        $img = '';
        if ($this->images != null) {
            if (strlen($this->images) > 3) {
                try {
                    $imgs = json_decode($this->images);
                    if (is_array($imgs)) {
                        if (isset($imgs[0])) {
                            $img = $imgs[0];
                        }
                    }
                } catch (\Throwable $th) {
                    //throw $th;
                }
            }
        }
        return $img;
    }
}
