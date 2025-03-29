<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Exception;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function createProduct(Request $request)
    {
        // dd($request->all());
        $request->validate([
            'category_id' => 'required',
            'name' => 'required',
            'price' => 'required',
            'unit' => 'required',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp,svg|max:2048'
        ]);
        try {
            $user_id = $request->header('id');
            $data = [
                'category_id' => $request->input('category_id'),
                'user_id' => $user_id,
                'name' => $request->input('name'),
                'price' => $request->input('price'),
                'unit' => $request->input('name'),
            ];
            if ($request->hasFile('image')) {
                $image = $request->file('image');
                $fileName = time() . '.' . $image->getClientOriginalExtension();
                $filePath = 'uploads/' . $fileName;
                $image->move(public_path('uploads'), $fileName);
                $data['image'] = $filePath;
            }
            $product = Product::create(
                $data
            );
            return response()->json([
                'status' => true,
                'message' => 'product created successfully',
                'product' => $product
            ]);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e->getMessage(),
            ]);
        }
    }

    public function listProduct(Request $request)
    {
        $user_id = $request->header('id');
        $products = Product::where('user_id', $user_id)->get();
        return $products;
    }
    public function productById(Request $request)
    {
        $user_id = $request->header('id');
        $id = $request->id;
        $product = Product::where('id', $id)->where('user_id', $user_id)->first();
        return $product;
    }
    public function updateProduct(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'price' => 'required',
            'unit' => 'required',
        ]);

        try {
            $user_id = $request->header('id');
            $product = Product::where('user_id', $user_id)->findOrFail($request->id);

            $product->name = $request->name;
            $product->price = $request->price;
            $product->unit = $request->unit;

            if ($request->hasFile('image')) {
                $request->validate([
                    'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp,svg|max:2048'
                ]);

                if ($product->image && file_exists(public_path($product->image))) {
                    unlink(public_path($product->image));
                }
                $image = $request->file('image');
                $fileName = time() . '.' . $image->getClientOriginalExtension();
                $filePath = 'uploads/' . $fileName;
                $image->move(public_path('uploads'), $fileName);
                $product->image = $filePath;

            }
            $product->save();

            return response()->json([
                'status' => true,
                'message' => 'product updated successfully',
                // 'product' => $product
            ]);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e->getMessage(),
            ]);
        }
    }
    public function deleteProduct(Request $request, $id)
    {
        try {
            $user_id = $request->header('id');
            // $product = Product::where('user_id', $user_id)->where('id', $id)->first();
            $product = Product::where('user_id', $user_id)->findOrFail($id);

            if ($product->image && file_exists(public_path($product->image))) {
                unlink(public_path($product->image));
            }
            $product->delete();
            return response()->json([
                'status' => true,
                'message' => 'product deleted successfully'
            ]);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e->getMessage(),
            ]);
        }
    }

}
