<?php

namespace App\Admin\Controllers;

use App\Models\Teacher;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class TeacherController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Teacher';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Teacher());

        $grid->column('id', __('Id'));
        $grid->column('name', __('Name'));
        $grid->column('gender', __('Gender'));
        $grid->column('phone_number', __('Phone number'));
        $grid->column('salary', __('Salary'));

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
        $show = new Show(Teacher::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));  
        $show->field('name', __('Name'));
        $show->field('gender', __('Gender'));
        $show->field('phone_number', __('Phone number'));
        $show->field('salary', __('Salary'));
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
        $form = new Form(new Teacher());
        if ($form->isCreating()) {
            $form->saving(function (Form $form) {

                $admin = new Administrator();
                $admin->username =  strtolower(Str::slug($form->name, "-"));
                $admin->name =  $form->name;
                $admin->password = Hash::make('4321');

                $old_user = Administrator::where('username',  $admin->username)->first();
                if ($old_user) {
                    $admin->username = $admin->username . rand(1000, 10000);
                }

                if ($admin->save()) {
                    DB::table('admin_role_users')->insert([
                        'role_id' => 3,
                        'user_id' => $admin->id
                    ]);
                    $form->administrator_id = $admin->id;
                } else {
                    dd("failed to create account");
                    die();
                }
            });
        }

        $form->hidden('administrator_id', __('Administrator id'));
        $form->text('name', __('Name'))->required();
        $form->select('gender', __('Gender'))
            ->options([
                'Male' => 'Male',
                'Female' => 'Female',
            ])
            ->required();
        $form->text('phone_number', __('Phone number'));
        $form->text('salary', __('Salary (UGX)'));
        $form->textarea('details', __('Details'));

        return $form;
    }
}
