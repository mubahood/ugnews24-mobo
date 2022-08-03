<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ContractRecord extends Model
{
    use HasFactory;

    public function stock_records()
    {
        return $this->hasMany(StockRecord::class, 'contract_record_id');
    }
}
