<?php

namespace App\Http\Controllers;

use App\Models\Mark;
use App\Models\WpPost;
use Illuminate\Http\Request;

class ApiPostsController extends Controller
{
    public function index()
    {
        return WpPost::WHERE([])->orderBy('id', 'Desc')->limit(2)->get();
    }
    //
}
