<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
      protected $fillable=[
        'total',
        'discount',
        'vat',
        'payable',
        'user_id',
        'customer_id'
    ];
    public function user(){
        return $this->belongsTo(User::class);
    }
    public function customer(){
        return $this->belongsTo(Customer::class);
    }
    public function invoice_product(){
        return $this->hasMany(InvoiceProduct::class);
    }
}
