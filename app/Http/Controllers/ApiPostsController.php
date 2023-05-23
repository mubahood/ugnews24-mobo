<?php

namespace App\Http\Controllers;

use App\Models\Mark;
use App\Models\Utils;
use App\Models\WpPost;
use Illuminate\Http\Request;

class ApiPostsController extends Controller
{
    public function index(Request $r)
    {
        $posts = [];
        $excludes = [];
        if (isset($r->excludes) && strlen($r->excludes) > 2) {
            $_ex = json_decode($r->excludes);
            if (is_array($_ex)) {
                foreach ($_ex as $key => $val) {
                    $excludes[] = ((int)($val));
                }
            }
        }

        foreach (WpPost::WHERE([
            'post_type' => 'post',
        ])
        ->whereNotIn('ID',$excludes)
        ->orderBy('id', 'Desc')->limit(100)->get() as $key => $p) {

            unset($p->post_author);
            unset($p->post_date_gmt);
            unset($p->post_content); 
            unset($p->post_excerpt);
            unset($p->post_status);
            unset($p->post_status);
            unset($p->ping_status);
            unset($p->post_password);
            unset($p->post_name);
            unset($p->to_ping);
            unset($p->post_modified);
            unset($p->pinged);
            unset($p->post_modified_gmt);
            //unset($p->post_content_filtered);
            unset($p->post_parent);
            unset($p->post_type);
            unset($p->menu_order);
            unset($p->post_mime_type);
            unset($p->comment_status);
            unset($p->audios);
            unset($p->videos);
            unset($p->youtube_videos);
            unset($p->images);
            unset($p->processed);
            $p->thumb = $p->getThumb(); 
            $p->guid = '1'; 
            $posts[] = $p;
        }
        return Utils::success($posts);
    }
    //
}
