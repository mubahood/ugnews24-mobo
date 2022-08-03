<?php

namespace App\Admin\Controllers;

use App\Models\MyClass;
use App\Models\Student;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class StudentController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Student';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Student());

        $grid->column('id', __('Id')); 
        $grid->column('name', __('Name'));
        $grid->column('my_class_id', __('Class'))->display(function ($id){
            $class = MyClass::find($id);
            if($class == null){
                return "-";
            }
            return $class->name;
        });
        $grid->column('gender', __('Gender'));
        $grid->column('age', __('Age')); 

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
        $show = new Show(Student::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('my_class_id', __('My class id'));
        $show->field('name', __('Name'));
        $show->field('gender', __('Gender'));
        $show->field('age', __('Age'));
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
        $form = new Form(new Student());
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
                        'role_id' => 2,
                        'user_id' => $admin->id
                    ]);
                    $form->administrator_id = $admin->id;
                } else {
                    dd("failed to create account");
                    die();
                }
            });
        }


        $form->text('name', __('Name'))->required();
        $form->hidden('administrator_id', __('administrator_id'));
        $form->select('gender', __('Gender'))
            ->options([
                'Male' => 'Male',
                'Female' => 'Female',
            ])
            ->required();
        $form->text('age', __('Age'))
            ->attribute('type', 'number')
            ->required();
        $form->select('my_class_id', __('Class'))
            ->options(MyClass::all()->pluck('name', 'id'))
            ->required();
        $form->textarea('details', __('Details'));

        return $form;
    }
}
