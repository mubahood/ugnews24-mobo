<?php

namespace App\Admin\Controllers;

use App\Models\Contract;
use App\Models\ContractRecord;
use App\Models\StockRecord;
use App\Models\Tank;
use Carbon\Carbon;
use Encore\Admin\Admin;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin as FacadesAdmin;
use Encore\Admin\Form;
use Encore\Admin\Form\NestedForm;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ContractRecordController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Contract Records';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ContractRecord());

        $grid->column('id', __('Id'))
        ->display(function($item){
            return Carbon::parse($item)->diffForHumans();
        });

        $grid->column('created_at', __('Created'))
        ->display(function($item){
            return Carbon::parse($item)->diffForHumans();
        });
        $grid->column('updated_at', __('Updated'));
        $grid->column('contract_id', __('Contract id'));
        $grid->column('administrator_id', __('administrator_id'));
        $grid->column('title', __('Title'));
        $grid->column('fuel_type', __('Fuel type'));
        $grid->column('quantity', __('Quantity'));
        $grid->column('details', __('Details'));
        $grid->column('delivery_note', __('Delivery note'));
        $grid->column('goods_received_note', __('Goods received note'));

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
        $show = new Show(ContractRecord::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('contract_id', __('Contract id'));
        $show->field('administrator_id', __('administrator_id'));
        $show->field('title', __('Title'));
        $show->field('fuel_type', __('Fuel type'));
        $show->field('quantity', __('Quantity'));
        $show->field('details', __('Details'));
        $show->field('delivery_note', __('Delivery note'));
        $show->field('goods_received_note', __('Goods received note'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new ContractRecord());
        $contract_id = "";
        $contract = null;
        $form->setWidth(8, 4);
        $form->submitted(function (Form $form) {
            $form->ignore('contract_title');
            $form->ignore('contract_quantity');
            $form->ignore('contract_suplied');
            $form->ignore('contract_remaining');
        });

        if ($form->isCreating()) {
            if (!isset($_POST['fuel_type'])) {
                if (!isset($_GET['contract_id'])) {
                    admin_warning("Warning", "Contract 111lected.");
                    return redirect(admin_url('contract-records'));
                }
            }
        }

        if (isset($_GET['contract_id'])) {
            $contract_id = trim($_GET['contract_id']);
        }else if (isset($_POST['contract_id'])) {
            $contract_id = trim($_POST['contract_id']);
        }


        $contract = Contract::where(['id' => $contract_id])->first();

        if ($contract == null) {
            die("not found 1  ==> ".$contract_id);
            admin_warning("Warning", "Contract not found.");
            return redirect(admin_url('contract-records'));
        }

        $form->html('<h3>About contract:</h3>');

        $form->text('contract_id', __('Contract id'))->value($contract->id)
            ->readonly();
        $form->text('contract_title', __('Contract title'))->value($contract->title)
            ->readonly();
        $form->text('contract_quantity', __('Total quantity (Ltrs)'))->value(number_format($contract->total_quantity) . "")
            ->readonly();
        $form->text('contract_suplied', __('Quantity supplied (Ltrs)'))->value(number_format($contract->total_quantity) . "")
            ->readonly();
        $form->text('contract_remaining', __('Quantity remaining (Ltrs)'))->value(number_format($contract->total_quantity) . "")
            ->readonly();

        $form->divider();
        $form->html('<h3>Supply record:</h3>');
        $form->hidden('administrator_id', __('Recorded by'))->value(FacadesAdmin::user()->id)
            ->required();
        $form->text('title', __('Title'))
            ->required();
        $form->select('fuel_type', __('Fuel type'))
            ->options([
                'Hard fuel' => 'Hard fuel',
                'Light fuel' => 'Light fuel',
            ])
            ->value($contract->fuel_type)
            ->readonly()
            ->required();
        $form->text('quantity', __('Total quantity supplied (Ltrs)'))
            ->attribute('type', 'number')
            ->required();
        $form->file('delivery_note', __('Delivery note'));
        $form->file('goods_received_note', __('Goods received note'));
        $form->textarea('details', __('Remarks'));


        $form->divider();
        $form->html('<h3>Add suplied fuel to tank(s):</h3>');

        $form->hasMany('stock_records', __('Click on "New" to Add a record'), function (NestedForm $form) {
            $form->setWidth(8, 4);

            if (isset($_GET['contract_id'])) {
                $contract_id = trim($_GET['contract_id']);
            }else if (isset($_POST['contract_id'])) {
                $contract_id = trim($_POST['contract_id']);
            }
            
            $contract = Contract::find($contract_id);
            $_items = [];
            foreach (Tank::all() as $key => $item) {
                $_items[$item->id] = "Tank: " . $item->name . ", ID: " . $item->id;
            }
            $form->select('to_tank', 'Select tank')->options($_items)
                ->required();
            $form->text('fuel_type', __('Fuel type'))
                ->value($contract->fuel_type)
                ->readonly()
                ->required();
            $form->text('quantity', __('Quantity'))
                ->attribute('type', 'number')
                ->required();
            $form->text('source_type', __('Source type'))
                ->value('Contract Supply')
                ->readonly()
                ->required();
            $form->text('contract_id', __('Contract id'))
                ->value($contract->id)
                ->readonly()
                ->required();
            $form->textarea('details', __('Remarks'));
            $form->hidden('is_add_stock', __('is_add_stock'))->value(1)
                ->readonly()
                ->required();

            $form->hidden('administrator_id', __('Recorded by'))->value(FacadesAdmin::user()->id)
                ->required();
        });

        return $form;
    }
}
