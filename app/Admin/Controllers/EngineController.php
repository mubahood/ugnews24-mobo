<?php

namespace App\Admin\Controllers;

use App\Models\Engine;
use App\Models\PowerStation;
use Carbon\Carbon;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class EngineController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Engines';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Engine());

        $grid->column('id', __('#'));
        $grid->column('power_station_id', __('Power station'))
            ->display(function ($userId) {
                $u = PowerStation::find($userId);
                if (!$u)
                    return "-";
                return $u->name;
            })
            ->sortable();
        $grid->column('name', __('Tank Name'));
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
        $show = new Show(Engine::findOrFail($id));

        $show->field('power_station_id', __('Power station id'))
        ->as(function ($userId) {
            $u = PowerStation::find($userId);
            if (!$u)
                return "-";
            return $u->name;
        });

        $show->field('name', __('Name'));
        $show->field('details', __('Details'));
        $show->field('photo', __('Photo'))->image();
        $show->field('id', __('Id'));
        $show->field('created_at', __('Created'))
            ->as(function ($item) {
                return Carbon::parse($item)->diffForHumans();
            });

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Engine());

        $form->text('name', __('Name'))
            ->required();
        $form->select('power_station_id', __('Power station'))
            ->options(PowerStation::all()->pluck('name', 'id'))
            ->required();
        $form->image('photo', __('Photo'));
        $form->textarea('details', __('Details'));

        return $form;
    }
}
