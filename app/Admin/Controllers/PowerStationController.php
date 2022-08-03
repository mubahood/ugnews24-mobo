<?php

namespace App\Admin\Controllers;

use App\Models\PowerStation;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class PowerStationController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Power Stations';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new PowerStation());

        $grid->column('id', __('#'));
        $grid->column('name', __('Name'));
        $grid->column('administrator_id', __('Manager'))
            ->display(function ($userId) {
                $u = Administrator::find($userId);
                if (!$u)
                    return "-";
                return $u->name;
            })->sortable();

        $grid->column('address', __('Tanks'));
        $grid->column('details', __('Engines'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(PowerStation::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'))
        ->as(function ($item) {
            return Carbon::parse($item)->diffForHumans();
        });
        $show->field('administrator_id', __('Station manager'))
        ->as(function ($userId) {
            $u = Administrator::find($userId);
            if (!$u)
                return "-";
            return $u->name;
        });

        $show->field('name', __('Name'));
        $show->field('address', __('Address'));
        $show->field('details', __('Details'));
        $show->field('photo', __('Photo'))->image();

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new PowerStation());
        $form->text('name', __('Power Station Name'))
            ->required();
        $form->select('administrator_id', __('Manager'))
            ->options(Administrator::all()->pluck('name', 'id'))
            ->required();
        $form->text('address', __('Address'));
        $form->textarea('details', __('Details'));
        $form->image('photo', __('Photo'));

        return $form;
    }
}
