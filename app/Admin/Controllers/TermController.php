<?php

namespace App\Admin\Controllers;

use App\Models\Term;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Form\NestedForm;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class TermController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Term';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Term());

        $grid->column('id', __('Id'))->sortable();
        $grid->column('name', __('Name'))->sortable();
        $grid->column('short_name', __('Short name'))->sortable();
        $grid->column('academic_year', __('Academic year'))->sortable();
        $grid->column('general_exams', __('Exams'))->display(function ($terms) {
            return count($terms);
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
        $show = new Show(Term::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('short_name', __('Short name'));
        $show->field('academic_year', __('Academic year'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Term());

        $form->text('name', __('Term Name'))
            ->required();
        $form->text('short_name', __('Short name'))
            ->required();
        $form->select('academic_year', __('Academic year'))
            ->options([
                '2019' => '2019',
                '2020' => '2020',
                '2021' => '2021',
                '2022' => '2022',
                '2023' => '2023',
                '2024' => '2024',
                '2025' => '2025',
            ])
            ->required();

        $form->divider();
        $form->html('<h3>Click on "New" to add an exam</h3>');

        $form->hasMany('general_exams', __(''), function (NestedForm $form) {
            $form->setWidth(8, 4);
            $form->text('name', __('Examination Name'))->required();
            $form->text('short_name', __('Short Name'))->required();
            $form->text('max_marks', __('Maximum marks'))->attribute('type', 'number')->required();
            $form->radio('published', __('Publish exams'))
                ->options([
                    '0' => 'Unpublished',
                    '1' => 'Publish exams',
                ])
                ->required();
            //$form->text('details', __('Details'));
        });

        return $form;
    }
}
