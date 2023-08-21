<?php
use App\Models\NewUtils;
use Encore\Admin\Auth\Database\Administrator;
use App\Http\Controllers\PrintController;
use Illuminate\Support\Facades\Route;


use Illuminate\Http\Request as HttpRequest;
use Illuminate\Support\Facades\Request as FacadesRequest;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/', function () {
    return view('auth.register');
});
/* Route::get('/', function () {
    //header("Location: ./admin");
    //dd();
    return view('welcome');
}); */

Route::match(['get', 'post'], '/print', [PrintController::class, 'index']);

Auth::routes();

/* Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
 */
Route::get('billing', function () {
    NewUtils::billSubscrsibibers();
});
