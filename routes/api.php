<?php

use App\Http\Controllers\ApiPostsController;
use App\Http\Controllers\MarkController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('/marks', [MarkController::class, 'index']); 
Route::get('/posts', [ApiPostsController::class, 'index']); 
Route::get('/news-posts', [ApiPostsController::class, 'index']); 

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
