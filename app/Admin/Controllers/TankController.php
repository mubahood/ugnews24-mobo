<?php

namespace App\Admin\Controllers;

use App\Models\PowerStation;
use App\Models\Tank;
use Carbon\Carbon;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class TankController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Tank';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Tank());

        $grid->column('id', __('#'));
        $grid->column('power_station_id', __('Power station'))
        ->display(function ($userId) {
            $u = PowerStation::find($userId);
            if (!$u)
                return "-";
            return $u->name;
        })
        ->sortable(); 
        $grid->column('name', __('Tank Name'))
            ->sortable();
        $grid->column('fuel_type', __('Fuel type'))
            ->sortable();
        $grid->column('capacity', __('Capacity'))
            ->display(function ($item) {
                return number_format($item);
            })
            ->sortable();

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
        $show = new Show(Tank::findOrFail($id));


        $show->field('name', __('Name'));
        $show->field('power_station_id', __('Power station id'))
            ->as(function ($userId) {
                $u = PowerStation::find($userId);
                if (!$u)
                    return "-";
                return $u->name;
            });
        $show->field('fuel_type', __('Fuel type'));
        $show->field('capacity', __('Capacity'))
            ->as(function ($item) {
                return number_format($item);
            });
        $show->field('details', __('Details'));
        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'))
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
        $form = new Form(new Tank());

        $form->select('power_station_id', __('Power station'))
            ->options(PowerStation::all()->pluck('name', 'id'))
            ->required();
        $form->text('name', __('Name'))
            ->required();
        $form->select('fuel_type', __('Fuel type'))
            ->options([
                'Hard fuel' => 'Hard fuel',
                'Light fuel' => 'Light fuel',
            ])
            ->required();
        $form->text('capacity', __('Tank Capacity (in Ltrs)'))
            ->attribute(['type' => 'number'])
            ->required();
        $form->textarea('details', __('Details'));

        return $form;
    }
}
