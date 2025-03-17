<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable=[
        'category_id',
        'user_id',
        'name',
        'price',
        'unit',
        'sale_status',
        'image'
    ];
    public function user(){
        return $this->belongsTo(User::class);
    }
    public function category(){
        return $this->belongsTo(Category::class);
    }
    public function invoice_product(){
        return $this->hasMany(InvoiceProduct::class);
    }
}
