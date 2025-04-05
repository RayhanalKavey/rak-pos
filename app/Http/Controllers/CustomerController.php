<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use Exception;
use Illuminate\Http\Request;
use Inertia\Inertia;

class CustomerController extends Controller
{
    public function CustomerPage(Request $request)
    {
        $user_id = $request->header('id');
        $customers = Customer::where('user_id', $user_id)->get();
        return Inertia::render('CustomerPage', ['customers' => $customers]);
    }
    public function createCustomer(Request $request)
    {
        try {
            $user_id = $request->header('id');
            $request->validate([
                'name' => 'required',
                'email' => 'required|email|unique:customers,email',
                'mobile' => 'required',
            ]);
            $customer = Customer::create([
                'name' => $request->input('name'),
                'email' => $request->input('email'),
                'mobile' => $request->input('mobile'),
                'user_id' => $user_id,
            ]);
            // return response()->json([
            //     'status' => true,
            //     'message' => 'Category created successfully',
            //     'category' => $customer,
            // ]);
            $data = ['message' => 'Customer created successfully', 'status' => true, 'error' => ''];
            return redirect('/customer')->with($data);

        } catch (Exception $e) {
            // return response()->json([
            //     'status' => false,
            //     'message' => $e->getMessage(),
            // ]);
            $data = ['message' => $e->getMessage(), 'status' => false, 'error' => ''];
            return redirect('/customer')->with($data);
        }
    }
    public function listCustomer(Request $request)
    {
        try {
            $user_id = $request->header('id');
            $customers = Customer::where('user_id', $user_id)->get();
            return response()->json([
                'status' => true,
                'message' => 'get customers successfully',
                'customers' => $customers,
            ]);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e->getMessage(),
            ]);
        }
    }
    public function customerById(Request $request)
    {
        $user_id = $request->header('id');
        $id = $request->id;
        $customer = Customer::where('id', $id)->where('user_id', $user_id)->first();
        return $customer;
    }
    public function updateCustomer(Request $request)
    {
        try {


            $user_id = $request->header('id');
            $id = $request->input('id');
            $customer = Customer::where('user_id', $user_id)->findOrFail($id);

            $customer->name = $request->input('name');
            $customer->email = $request->input('email');
            $customer->mobile = $request->input('mobile');


            $customer->save();
            // return response()->json([
            //     'status' => true,
            //     'message' => 'customer updated successfully'
            //     // 'categories' => Category::where('id', $id)->get(),
            // ]);
            $data = ['message' => 'Customer updated successfully', 'status' => true, 'error' => ''];
            return redirect('/customer')->with($data);
        } catch (Exception $e) {
            // return response()->json([
            //     'status' => false,
            //     'message' => $e->getMessage(),
            // ]);
            $data = ['message' => $e->getMessage(), 'status' => false, 'error' => ''];
            return redirect('/customer')->with($data);
        }
    }
    public function deleteCustomer(Request $request, $id)
    {
        try {
            $user_id = $request->header('id');
            Customer::where('user_id', $user_id)->where('id', $id)->delete();
            // return response()->json([
            //     'status' => true,
            //     'message' => 'customer deleted successfully'
            // ]);
            $data = ['message' => 'Customer Deleted successfully', 'status' => true, 'error' => ''];
            return redirect('/customer')->with($data);
        } catch (Exception $e) {
            // return response()->json([
            //     'status' => false,
            //     'message' => $e->getMessage(),
            // ]);
            $data = ['message' => $e->getMessage(), 'status' => false, 'error' => ''];
            return redirect('/customer')->with($data);
        }
    }
    public function customerSavePage(Request $request)
    {
        $user_id = $request->header('id');
        $id = $request->query('id');
        $customer = Customer::where('id', $id)->where('user_id', $user_id)->first();
        return Inertia::render('CustomerSavePage', ['customer' => $customer]);
    }
}
