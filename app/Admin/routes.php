<?php

use Illuminate\Routing\Router;
 
Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');
    $router->resource('power-stations', PowerStationController::class);
    $router->resource('tanks', TankController::class);
    $router->resource('engines', EngineController::class);
    $router->resource('contracts', ContractController::class);
    $router->resource('contract-records', ContractRecordController::class);
    $router->resource('stock-records', StockRecordController::class);


    $router->resource('terms', TermController::class);
    $router->resource('my-classes', MyClassController::class);
    $router->resource('students', StudentController::class);
    $router->resource('teachers', TeacherController::class);
    $router->resource('subjects', SubjectController::class);
    $router->resource('exams', ExamController::class);
    $router->resource('general-exams', GeneralExamController::class);
    $router->resource('marks', MarkController::class);
    $router->resource('posts', WpPostController::class);

    $router->get('/', 'HomeController@index')->name('home');
    $router->resource('users', UserController::class);
    $router->resource('subscriptions', SubscriptionController::class);

});
