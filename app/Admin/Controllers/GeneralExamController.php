<?php

namespace App\Admin\Controllers;

use App\Models\GeneralExam;
use App\Models\Term;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Form\NestedForm;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class GeneralExamController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Exams';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new GeneralExam());

        $grid->column('id', __('Id'))
            ->sortable();
        $grid->column('term', __('Term'))->display(function ($term) {
            return $term['name'];
        });
        $grid->column('name', __('Name')); 
        $grid->column('max_marks', __('Max marks'));
        $grid->column('published', __('Published'));

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
        $show = new Show(GeneralExam::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('term_id', __('Term id'));
        $show->field('name', __('Name'));
        $show->field('details', __('Details'));
        $show->field('max_marks', __('Max marks'));
        $show->field('published', __('Published'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new GeneralExam());
        $form->html('<h3>General exam information</h3>');
        $form->setWidth(8, 4);
        $form->select('term_id', __('Term'))
            ->options(Term::all()->pluck('name', 'id'))
            ->required();
        $form->text('name', __('General Examination Name'))->required();
        $form->text('details', __('Details'));
        $form->text('max_marks', __('Maximum marks'))->attribute('type', 'number')->required();
        $form->switch('published', __('Publish exams'))->required();

 

        return $form;
    }
}
