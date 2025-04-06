<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Customer;
use App\Models\Invoice;
use App\Models\Product;
use Illuminate\Http\Request;
use Inertia\Inertia;

class DashboardController extends Controller
{
    // public function DashboardPage(Request $request)
    // {
    //     return Inertia::render('DashboardPage');
    // }
    public function DashboardPage(Request $request)
    {
        $user_id = request()->header('id');

        $product = Product::where('user_id', $user_id)->count();
        $category = Category::where('user_id', $user_id)->count();
        $customer = Customer::where('user_id', $user_id)->count();
        $invoice = Invoice::where('user_id', $user_id)->count();
        $total = Invoice::where('user_id', $user_id)->sum('total');
        $vat = Invoice::where('user_id', $user_id)->sum('vat');
        $payable = Invoice::where('user_id', $user_id)->sum('payable');
        $discount = Invoice::where('user_id', $user_id)->sum('discount');

        $data = [
            'product' => $product,
            'category' => $category,
            'customer' => $customer,
            'invoice' => $invoice,
            'total' => round($total),
            'vat' => round($vat),
            'payable' => round($payable),
            'discount' => $discount
        ];

        return Inertia::render('DashboardPage', ['list' => $data]);
    }
    public function dashboardSummary(Request $request)
    {
        $user_id = $request->header('id');

        $product = Product::where('user_id', $user_id)->count();
        $category = Category::where('user_id', $user_id)->count();
        $customer = Customer::where('user_id', $user_id)->count();
        $invoice = Invoice::where('user_id', $user_id)->count();

        $total = Invoice::where('user_id', $user_id)->sum('total');
        $vat = Invoice::where('user_id', $user_id)->sum('vat');
        $payable = Invoice::where('user_id', $user_id)->sum('payable');
        $discount = Invoice::where('user_id', $user_id)->sum('discount');
        $list = [
            "product" => $product,
            'category' => $category,
            "customer" => $customer,
            "invoice" => $invoice,
            "total" => $total,
            "vat" => $vat,
            "payable" => $payable,
            "discount" => $discount
        ];
        return Inertia::render('DashboardPage', ['list' => $list]);
        // return response()->json([
        //     "product" => $product,
        //     'category' => $category,
        //     "customer" => $customer,
        //     "invoice" => $invoice,
        //     "total" => $total,
        //     "vat" => $vat,
        //     "payable" => $payable,
        //     "discount" => $discount
        // ]);

    }

}
