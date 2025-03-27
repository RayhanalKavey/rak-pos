<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Exception;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function createCategory(Request $request)
    {
        try {
            $user_id = $request->header('id');
            $category = Category::create([
                'name' => $request->input('name'),
                'user_id' => $user_id,
            ]);
            return response()->json([
                'status' => true,
                'message' => 'Category created successfully',
                'category' => $category,
            ]);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e->getMessage(),
            ]);
        }
    }

    public function listCategory(Request $request)
    {
        try {
            $user_id = $request->header('id');
            $categories = Category::where('user_id', $user_id)->get();
            return response()->json([
                'status' => true,
                'message' => 'get categories successfully',
                'categories' => $categories,
            ]);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e->getMessage(),
            ]);
        }
    }
    public function categoryById(Request $request)
    {
        $user_id = $request->header('id');
        $id = $request->id;
        $category = Category::where('id', $id)->where('user_id', $user_id)->first();
        return $category;
    }
    public function updateCategory(Request $request)
    {
        try {
            $user_id = $request->header('id');
            $id = $request->input('id');
            Category::where('id', $id)->where('user_id', $user_id)->update([
                "name" => $request->input('name')
            ]);
            return response()->json([
                'status' => true,
                'message' => 'category updated successfully'
                // 'categories' => Category::where('id', $id)->get(),
            ]);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e->getMessage(),
            ]);
        }
    }
    public function deleteCategory(Request $request, $id)
    {
        try {
            $user_id = $request->header('id');
            Category::where('user_id', $user_id)->where('id', $id)->delete();
            return response()->json([
                'status' => true,
                'message' => 'category deleted successfully'
            ]);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e->getMessage(),
            ]);
        }
    }
}
