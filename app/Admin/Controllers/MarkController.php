<?php

namespace App\Admin\Controllers;

use App\Models\GeneralExam;
use App\Models\Mark;
use App\Models\Student;
use App\Models\Subject;
use App\Models\Term;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Mockery\Matcher\Subset;

class MarkController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Marks';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Mark());




        $grid->disableCreateButton();
        $grid->disableRowSelector();

        $grid->disableColumnSelector();




        $user = Admin::user();
        $exams = GeneralExam::all();
        $subjects = Subject::all();
        $students = Student::all();
        $grid->disableActions();
        $grid->actions(function ($actions) {
            $actions->disableDelete();
            $actions->disableEdit();
            $actions->disableView();
        });

        $grid->filter(function ($filter) {
            $filter->equal('term_id', "Term")
                ->select(Term::all()->pluck('name', 'id'));
            $filter->equal('general_exam_id', "Exam")
                ->select(GeneralExam::all()->pluck('name', 'id'));
            $filter->equal('subject_id', "Subject")
                ->select(Subject::all()->pluck('name', 'id'));
        });



        foreach ($exams as $_key => $exam) {
            foreach ($subjects as $__key => $subject) {
                foreach ($students as $___key => $student) {
                    $m = Mark::where([
                        'general_exam_id' => $exam->id,
                        'subject_id' => $subject->id,
                        'student_id' => $student->id
                    ])->get();
                    if (count($m) == 0) {
                        $new_mark = new  Mark();
                        $new_mark->general_exam_id = $exam->id;
                        $new_mark->term_id = $exam->term_id;
                        $new_mark->subject_id = $subject->id;
                        $new_mark->student_id = $student->id;
                        $new_mark->administrator_id = $subject->administrator_id;
                        $new_mark->mark = 0;
                        $new_mark->remarks = "";
                        $new_mark->save();
                    }
                }
            }
        }


        if ($user->isRole('teacher')) {
            $grid->model()->where('administrator_id', '=', $user->id);
        }

        if ($user->isRole('student')) {
            $grid->model()->where('student_id', '=', $user->id);
        }
        $grid->column('id', __('Id'))
            ->sortable();
        $grid->column('term_id', __('Term'))
            ->display(function ($t) {
                $t = Term::find($t);
                return $t->name;
            })->sortable();

        $grid->column('general_exam_id', __('Exam'))->display(function ($t) {
            $e = GeneralExam::find($t);
            return $e->short_name . " - (" . $e->max_marks . ") ";
        })->sortable();
        $grid->column('subject_id', __('Subject'))->display(function ($t) {
            $e = Subject::find($t);
            return $e->name;
        })->sortable();
        //$grid->column('administrator_id', __('Teacher'));

        if ($user->isRole('teacher')) {
            $grid->column('mark', __('Mark'))->editable();
            $grid->column('remarks', __('Remarks'))->editable();
        } else {
            $grid->column('mark', __('Mark'));
            $grid->column('remarks', __('Remarks'));
        }
        $grid->column('published', __('Status'))->display(function ($t) {
            if ($t) {
                return '<span class=" text-success">Submited</span>';
            } else {
                return '<span class="text-danger">Missing</span>';
            }
        })
            ->sortable();
        $grid->column('updated_at', __('Last update'))->display(function ($t) {
            return Carbon::parse($t)->diffForHumans();
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
        $show = new Show(Mark::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('term_id', __('Term id'));
        $show->field('general_exam_id', __('General exam id'));
        $show->field('subject_id', __('Subject id'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('mark', __('Mark'));
        $show->field('remarks', __('Remarks'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Mark());



        $form->number('term_id', __('Term id'));
        $form->number('general_exam_id', __('General exam id'));
        $form->number('subject_id', __('Subject id'));
        $form->number('administrator_id', __('Administrator id'));
        $form->number('mark', __('Mark'));
        $form->textarea('remarks', __('Remarks'));

        return $form;
    }
}
