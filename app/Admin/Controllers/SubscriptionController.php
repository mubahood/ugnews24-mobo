<?php

namespace App\Admin\Controllers;

use App\models\Subscription;
use App\Models\User;
use Carbon\Carbon;
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
    protected $title = 'Subscriptions';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Subscription());
        $grid->model()->orderBy('id', 'desc');

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $subs = User::where([])->orderBy('name', 'asc')->get()->pluck('name', 'id');


            $filter->equal('user_id', 'Seach by user')->select($subs);


            $filter->group('amount', function ($group) {
                $group->gt('greater than');
                $group->lt('less than');
                $group->nlt('not less than');
                $group->ngt('not greater than');
                $group->equal('equal to');
            });
        });


        $grid->model()->orderBy('id', 'desc');
        $grid->disableBatchActions();

        $grid->column('id', __('ID'))
            ->hide()
            ->sortable();
        $grid->column('created_at', __('Created'))
            ->display(function ($x) {
                return Carbon::parse($x)->format('d-m-y H:i:s');
            })
            ->sortable();
        $grid->column('updated_at', __('Updated'))->hide();
        /*         $grid->column('image', __('Subscriber'));
 */
        $grid->column('user_id', __('Subscriber'))
            ->display(function ($userId) {
                $u = User::find($userId);
                if ($u == null) {
                    return  "-";
                }
                return $u->name;
            })->sortable();

        $grid->column('paid', __('Paid'))
            ->editable('select', [
                'Yes'  => 'Yes',
                'No' => 'No'
            ])
            ->filter([
                'Yes'  => 'Paid',
                'No' => 'Not Paid'
            ])
            ->dot([
                'Yes'  => 'success',
                'No' => 'danger'
            ])
            ->sortable();


        $grid->column('amount', __('Amount (UGX)'))
            ->display(function ($x) {
                return number_format($x);
            })
            ->editable()
            ->totalRow(function ($x) {
                return number_format($x);
            });
        $grid->column('due_date', __('Due Month'))
            ->display(function ($x) {
                return Carbon::parse($x)->format('M-Y');
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

        /*         $form->image('image', __('Image'));
 */
        $form->select('user_id', __('Subscriber'))->options(User::all()->pluck('name', 'id'));;
        $form->radioCard('paid', __('Paid'))
            ->options([
                'Yes' => 'Yes',
                'No' => 'No'
            ]);
        $form->text('amount', __('Amount'))->default('1000');
        $form->date('due_date', __('Due date'))->default(date('Y-m-d'));

        return $form;
    }
}
