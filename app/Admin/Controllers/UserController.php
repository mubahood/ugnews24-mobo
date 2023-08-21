<?php

namespace App\Admin\Controllers;

use App\models\User;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class UserController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Members';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        /* foreach (User::all() as $key => $u) {
            $now = Carbon::now();
            $joined = $now->subMonth(rand(0, 12));
            $joined = $joined->subDays(rand(0, 45));
            $u->created_at = $joined;
            $u->save();
        } */

        $grid = new Grid(new User());
        $grid->disableBatchActions();
        $grid->quickSearch('name', 'phone_number')->placeholder('Search by name or phone number');
        $grid->model()->orderBy('id', 'desc');
        $grid->column('id', __('ID'))->sortable();
        $grid->column('created_at', __('Joined'))
            ->display(function ($x) {
                return Carbon::parse($x)->format('d-m-y');
            })
            ->sortable();
        $grid->column('name', __('Name'))->sortable();
        $grid->column('phone_number', __('Phone Number'))->sortable();
        $grid->column('email', __('Email'));
        $grid->column('gender', __('Gender'));
        /*
        $grid->column('email_verified_at', __('Email verified at'));
        $grid->column('password', __('Password')); */
        /*
        $grid->column('remember_token', __('Remember token'));
        */
        $grid->column('updated_at', __('Updated at'))->hide();

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
        $show = new Show(User::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('phone_number', __('phone number'));
        $show->field('email', __('Email'));
        $show->field('gender', __('Gender'));
        /*         $show->field('email_verified_at', __('Email verified at'));
 */
        $show->field('password', __('Password'));
        /*         $show->field('remember_token', __('Remember token'));
 */
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Administrator());

        $form->text('name', __('Name'))->rules('required');
        $form->text('phone_number', __('phone number'));
        $form->radioCard('gender', __('Gender'))
            ->options([
                'male' => 'male',
                'female' => 'female',

            ]);
        $form->email('username', __('Email/username'));
        $form->datetime('dated_joined', __('Date Joined'))->rules('required');

        /*         $form->datetime('email_verified_at', __('Email verified at'))->default(date('Y-m-d H:i:s'));
 */
        $form->password('password', __('Password'));
        $form->text('remember_token', __('Remember token'));


        return $form;
    }
}
