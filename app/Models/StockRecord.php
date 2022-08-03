<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StockRecord extends Model
{
    use HasFactory;

    public function contract_record()
    {
        return $this->belongsTo(ContractRecord::class, 'contract_record_id');
    }
    protected $fillable = [
        'contract_record_id',
        'administrator_id',
        'fuel_type',
        'title',
        'source_type',
        'quantity',
        'is_add_stock',
        'from_tank_id',
        'to_tank_id',
        'details',
    ];

}
