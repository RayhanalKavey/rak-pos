<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use App\Models\Invoice;
use App\Models\InvoiceProduct;
use App\Models\Product;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;

class InvoiceController extends Controller
{
    public function InvoiceListPage(Request $request)
    {
        $user_id = $request->header('id');
        $list = Invoice::where('user_id', $user_id)
            ->with('customer', 'invoiceProduct.product')->get();
        return Inertia::render('InvoiceListPage', ['list' => $list]);
    }
    public function createInvoice(Request $request)
    {
        // dd($request->all());
        DB::beginTransaction();
        try {
            $user_id = $request->header('id');
            $data = [
                'total' => $request->input('total'),
                'discount' => $request->input('discount'),
                'vat' => $request->input('vat'),
                'payable' => $request->input('payable'),
                'user_id' => $user_id,
                'customer_id' => $request->input('customer_id')
            ];
            $invoice = Invoice::create($data);
            $products = $request->input('products');

            foreach ($products as $product) {
                $productExists = Product::where("id", $product['id'])->first();
                if (!$productExists) {
                    return response()->json([
                        'status' => false,
                        'message' => "product with ID {$product['id']} does not exist"
                    ]);
                }
                if ($productExists->unit < $product['unit']) {
                    return response()->json([
                        'status' => false,
                        'message' => "only {$productExists->unit} units available in stock for product id {$product['id']}"
                    ]);
                }
                InvoiceProduct::create([
                    'invoice_id' => $invoice->id,
                    'product_id' => $product['id'],
                    'user_id' => $user_id,
                    'qty' => $product['unit'],
                    'sale_price' => $product['price']
                ]);

                Product::where("id", $product['id'])->update([
                    'unit' => $productExists->unit - $product['unit']
                ]);
            }

            DB::commit();
            // return response()->json([
            //     'status' => true,
            //     'message' => 'invoice created successfully',
            //     'category' => $invoice,
            // ]);
            $data = ['message' => 'Invoice created successfully', 'status' => true, 'error' => ''];
            return redirect('/InvoiceListPage')->with($data);
        } catch (Exception $e) {
            DB::rollback();
            // return response()->json([
            //     'status' => false,
            //     'message' => $e->getMessage(),
            // ]);
            $data = ['message' => 'Something went wrong', 'status' => false, 'error' => $e->getMessage()];
            return redirect()->back()->with($data);
        }
    }
    public function listInvoice(Request $request)
    {
        try {
            $user_id = $request->header('id');
            $invoices = Invoice::with('customer')->where('user_id', $user_id)->get();
            return $invoices;
            // return response()->json([
            //     'status' => true,
            //     'message' => 'get invoices successfully',
            //     'invoices' => $invoices,
            // ]);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e->getMessage(),
            ]);
        }
    }
    public function invoiceById(Request $request)
    {
        $user_id = $request->header('id');
        $invoice_id = $request->invoice_id;
        $customer_id = $request->customer_id;

        $customer = Customer::where('id', $customer_id)->where('user_id', $user_id)->first();
        $invoice = Invoice::where('id', $invoice_id)->where('user_id', $user_id)->first();
        $invoiceProduct = InvoiceProduct::where('user_id', $user_id)->where('invoice_id', $invoice_id)->get();
        return response()->json([
            "customer" => $customer,
            "invoice" => $invoice,
            "invoice-product" => $invoiceProduct,
        ]);
    }

    public function deleteInvoice(Request $request, $id)
    {
        DB::beginTransaction();
        try {
            $user_id = $request->header('id');

            InvoiceProduct::where('user_id', $user_id)->where('invoice_id', $id)->delete();
            Invoice::where('user_id', $user_id)->where('id', $id)->delete();

            DB::commit();
            // return response()->json([
            //     'status' => true,
            //     'message' => 'invoice deleted successfully',
            //     // 'category' => $invoice,
            // ]);
            $data = ['message' => 'Invoice deleted successfully', 'status' => true, 'error' => ''];
            return redirect()->back()->with($data);
        } catch (Exception $e) {
            DB::rollback();
            // return response()->json([
            //     'status' => false,
            //     'message' => $e->getMessage(),
            // ]);
            $data = ['message' => 'Something went wrong', 'status' => false, 'error' => $e->getMessage()];
            return redirect()->back()->with($data);
        }

    }
    public function InvoiceDetails(Request $request)
    {
        $user_id = request()->header('id');

        $customerDetails = Customer::where('user_id', $user_id)->where('id', $request->customer_id)->first();

        $invoiceDetails = Invoice::where('user_id', $user_id)->where('id', $request->invoice_id)->first();
        $invoiceProduct = InvoiceProduct::where('invoice_id', $request->invoice_id)
            ->where('user_id', $user_id)->with('product')
            ->get();

        return [
            'customer' => $customerDetails,
            'invoice' => $invoiceDetails,
            'product' => $invoiceProduct
        ];
    }
}
