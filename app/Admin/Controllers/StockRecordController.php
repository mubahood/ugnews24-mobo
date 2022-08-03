<?php

namespace App\Admin\Controllers;

use App\Models\StockRecord;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class StockRecordController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'StockRecord';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new StockRecord());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('contract_id', __('Contract id'));
        $grid->column('Encore\Admin\Auth\Database\Administrator', __('Encore\Admin\Auth\Database\Administrator'));
        $grid->column('fuel_type', __('Fuel type'));
        $grid->column('title', __('Title'));
        $grid->column('source_type', __('Source type'));
        $grid->column('quantity', __('Quantity'));
        $grid->column('is_add_stock', __('Is add stock'));
        $grid->column('from_tank_id', __('From tank id'));
        $grid->column('to_tank_id', __('To tank id'));
        $grid->column('details', __('Details'));

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
        $show = new Show(StockRecord::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('contract_id', __('Contract id'));
        $show->field('Encore\Admin\Auth\Database\Administrator', __('Encore\Admin\Auth\Database\Administrator'));
        $show->field('fuel_type', __('Fuel type'));
        $show->field('title', __('Title'));
        $show->field('source_type', __('Source type'));
        $show->field('quantity', __('Quantity'));
        $show->field('is_add_stock', __('Is add stock'));
        $show->field('from_tank_id', __('From tank id'));
        $show->field('to_tank_id', __('To tank id'));
        $show->field('details', __('Details'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new StockRecord());

        $form->number('contract_id', __('Contract id'));
        $form->textarea('Encore\Admin\Auth\Database\Administrator', __('Encore\Admin\Auth\Database\Administrator'));
        $form->textarea('fuel_type', __('Fuel type'));
        $form->textarea('title', __('Title'));
        $form->textarea('source_type', __('Source type'));
        $form->textarea('quantity', __('Quantity'));
        $form->switch('is_add_stock', __('Is add stock'));
        $form->number('from_tank_id', __('From tank id'));
        $form->number('to_tank_id', __('To tank id'));
        $form->textarea('details', __('Details'));

        return $form;
    }
}
