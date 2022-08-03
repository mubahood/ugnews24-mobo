<?php

namespace App\Admin\Controllers;

use App\Models\Contract;
use Carbon\Carbon;
use Encore\Admin\Actions\RowAction;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;



class ContractController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Contract';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Contract());
     

        $grid->actions(function ($actions) {
            $actions->add(new Comments($actions->row->id.""));
        });
        
        

        $grid->column('id', __('#'));
        $grid->column('created_at', __('Created'))
            ->display(function ($item) {
                return Carbon::parse($item)->diffForHumans();
            })->sortable();

        $grid->column('administrator_id', __('Contractor'))
            ->display(function ($userId) {
                $u = Administrator::find($userId);
                if (!$u)
                    return "-";
                return $u->name;
            })->sortable();
        $grid->column('title', __('Contract Title'));
        $grid->column('fuel_type', __('Fuel type'));
        $grid->column('total_quantity', __('Quantity'));
        $grid->column('contract_period', __('Period'));
        $grid->column('contract_period', __('Contract status'));
        $grid->column('price', __('Price'));

        

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
        $show = new Show(Contract::findOrFail($id));

        $show->field('id', __('Contract Id'));
        $show->field('created_at', __('Created at'))
            ->as(function ($item) {
                return Carbon::parse($item)->diffForHumans();
            });
        $show->field('administrator_id', __('Contractor'))
            ->as(function ($userId) {
                $u = Administrator::find($userId);
                if (!$u)
                    return "-";
                return $u->name;
            });
        $show->field('title', __('Title'));
        $show->field('fuel_type', __('Fuel type'));
        $show->field('total_quantity', __('Total quantity (in Litres)'));
        $show->field('attachment', __('Contract Attachment'))->file();
        $show->field('contract_period', __('Contract period (In months)'));
        $show->field('price', __('Price (In GMD)'))
            ->as(function ($item) {
                return number_format($item);
            });
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
        $form = new Form(new Contract());
        

        $items = Administrator::all();
        $_items = [];
        foreach ($items as $key => $item) {
            if (!$item->isRole("contractor")) {
                continue;
            }
            $_items[$item->id] = $item->name . " - " . $item->id;
        }
        $form->select('administrator_id', __('Contractor'))
            ->options($_items)
            ->rules('required');

        $form->text('title', __('Contract Title'))
            ->rules('required');
        $form->select('fuel_type', __('Fuel type'))
            ->options([
                'Hard fuel' => 'Hard fuel',
                'Light fuel' => 'Light fuel',
            ])
            ->required();
        $form->text('total_quantity', __('Total quantity (In Ltrs)'))
            ->attribute('type', 'number')
            ->required();
        $form->file('attachment', __('Contract Attachment'));
        $form->text('contract_period', __('Contract period (In months)'))
            ->attribute('type', 'number')
            ->required();
        $form->text('price', __('Price (GMD)'))
            ->attribute('type', 'number')
            ->required();
        $form->textarea('details', __('Details'));

        return $form;
    }
}



class Comments extends RowAction
{
    public $name = 'Add record';
    public $id = '';

    public function __construct($id)
    {
        $this->id = $id;

    }
    public function href()
    { 
        return admin_url('/contract-records/create?contract_id='.$this->id);
    }
}