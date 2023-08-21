<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Subscription;
use App\Models\User;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\Box;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    public function index(Content $content)
    {

        $u = Auth::user();
        $content
            ->title('Employee Management - Dashboard')
            ->description('Hello ' . $u->name . "!")
            ->row(function (row $row) {
                $row->column(3, function (Column $column) {
                    $box = new Box('Registered Members', number_format(User::where([])->count()));
                    $box->style('danger');
                    $column->append($box);
                });
                $row->column(3, function (Column $column) {
                    $box = new Box('Total Amount Collected', 'UGX ' . number_format(Subscription::where(['paid' => 'Yes'])->sum('amount')));
                    $box->style('danger');
                    $column->append($box);
                });
                $row->column(3, function (Column $column) {
                    $box = new Box('Debtors', 'UGX ' . number_format(Subscription::where('paid', '!=', 'Yes')->sum('amount')));
                    $box->style('danger');
                    $column->append($box);
                });
            });
        return $content;
    }
}
