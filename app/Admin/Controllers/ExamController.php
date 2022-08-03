<?php

namespace App\Admin\Controllers;

use App\Models\Exam;
use App\Models\MyClass;
use App\Models\Subject;
use App\Models\Teacher;
use App\Models\Term;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;

class ExamController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Exam';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Exam());

        $grid->column('id', __('Id'));
        $grid->column('my_class_id', __('Class'))->display(function ($id) {
            $clas = MyClass::find($id);
            if ($clas == null) {
                return "-";
            }
            return $clas->name;
        })->sortable();
        $grid->column('subject_id', __('Subject'))->display(function ($id) {
            $clas = Subject::find($id);
            if ($clas == null) {
                return "-";
            }
            return $clas->name;
        })->sortable();
        $grid->column('administrator_id', __('Teacher responsible'))->display(function ($id) {
            $clas = Teacher::find($id);
            if ($clas == null) {
                return "-";
            }
            return $clas->name;
        })->sortable();
        $grid->column('term_id', __('Term'))->display(function ($id) {
            $clas = Term::find($id);
            if ($clas == null) {
                return "-";
            }
            return $clas->name;
        })->sortable();

        if (!Auth::user()->isRole('administrator')) {
            $grid->disableActions();
        }

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * 
     * 
     

     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Exam::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('my_class_id', __('Class'));
        $show->field('subject_id', __('Subject id'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('term_id', __('Term id'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Exam());
        $form->saving(function ($form) {
            $sub = Subject::find($form->subject_id);
            $form->administrator_id = $sub->administrator_id;
            $form->my_class_id = $sub->my_class->id;
        });

        $form->hidden('my_class_id', __('Class'));
        $form->hidden('administrator_id', __('Administrator id'));
        $itmes = [];
        foreach (Subject::all() as $key => $sub) {
            $itmes[$sub->id] = $sub->name . " of " . $sub->my_class->name;
        }
        $form->select('subject_id', __('Subject'))
            ->options($itmes)->required();

        $form->select('term_id', __('Term'))
            ->options(Term::all()->pluck('name', 'id'))->required();



        return $form;
    }
}
