<?php

namespace App\Admin\Controllers;

use App\Models\WpPost;
use Carbon\Carbon;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Form\NestedForm;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class WpPostController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'WpPost';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new WpPost());

        $grid->model()->orderBy('ID', 'desc');
        $grid->disableBatchActions();
        $grid->model()
            ->where([
                'post_type' => 'post',
            ]);

        $grid->column('ID', __('ID'))->sortable();
        $grid->column('image', __('thumb'))->display(function ($x) {
            return $this->getThumb() ;
            return '<img width="100" src="' . $this->getThumb() . '" alt="Image">';
        });

        $grid->column('post_title', __('Title'))->sortable();
        $grid->column('post_date', __('Posted'))->display(function ($t) {
            return Carbon::parse($t)->diffForHumans();
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
        $show = new Show(WpPost::findOrFail($id));

        $show->field('id', __('Id'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new WpPost());

        $form->text('ID', __('ID'))
            ->required();
        return $form;
    }
}
