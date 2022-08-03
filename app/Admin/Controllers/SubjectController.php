<?php

namespace App\Admin\Controllers;

use App\Models\MyClass;
use App\Models\Subject;
use App\Models\Teacher;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class SubjectController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Subject';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Subject());

        $grid->column('id', __('#'))->sortable();
        $grid->column('name', __('Subject Name'))->sortable();
        $grid->column('my_class_id', __('Class'))->display(function ($id){
            $clas = MyClass::find($id);
            if($clas == null){
                return "-";
            }
            return $clas->name;
        })->sortable();
        $grid->column('administrator_id', __('Teacher'))->display(function ($id){
            $clas = Teacher::find($id);
            if($clas == null){
                return "-";
            }
            return $clas->name;
        })->sortable();

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
        $show = new Show(Subject::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('my_class_id', __('My class id'));
        $show->field('name', __('Name'));
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
        $form = new Form(new Subject());
        $form->text('name', __('Subject Name'));

        $form->select('my_class_id', __('Class'))
        ->options(MyClass::all()->pluck('name','id'))->required();
        
        $form->select('administrator_id', __('Subject teacher'))
        ->options(Teacher::all()->pluck('name','id'))->required();

        $form->textarea('details', __('Subject Details'));

        return $form;
    }
}
