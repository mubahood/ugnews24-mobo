<?php

namespace App\Admin\Controllers;

use App\models\Subscription;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class SubscriptionController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Subscription';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Subscription());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('image', __('Image'));
        $grid->column('user_id', __('User id'));
        $grid->column('paid', __('Paid'));
        $grid->column('amount', __('Amount'));
        $grid->column('due_date', __('Due date'));

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
        $show = new Show(Subscription::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('image', __('Image'));
        $show->field('user_id', __('User id'));
        $show->field('paid', __('Paid'));
        $show->field('amount', __('Amount'));
        $show->field('due_date', __('Due date'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Subscription());

        $form->image('image', __('Image'));
        $form->number('user_id', __('User id'));
        $form->text('paid', __('Paid'));
        $form->number('amount', __('Amount'));
        $form->text('due_date', __('Due date'));

        return $form;
    }
}
