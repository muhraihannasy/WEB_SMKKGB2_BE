<?php

namespace App\Http\Controllers;
use Exception;
use Illuminate\Http\Request;

// Model
use App\Models\BlogCategory;

class BlogCategoryController extends Controller
{
    protected $table = BlogCategory::class;

    public function list()
    {
        $data = $this->table::all();
        return response()->json($data);
    }

    public function show($id)
    {
        $data = $this->table::find($id);
        return response()->json($data);
    }

    public function store(Request $request)
    {
        try {
            $this->table::create($request->all());
        } catch (Exception $e) {
            return response()->json($e->getMessage());
        }

        return response()->json([
            "message" => "Berhasil Menambahkan",
            "status" => 200,
        ]);
    }

    public function update(Request $request)
    {
        $data = $this->table::find($request->id);

        try {
            $data->update($request->all());
        } catch (Exception $e) {
            return response()->json($e->getMessage());
        }

        return response()->json([
            "message" => "Berhasil Mengedit",
            "status" => 200,
        ]);
    }
    public function destroy($id)
    {
        $data = $this->table::find($id);
        try {
            $data->delete();
        } catch (Exception $e) {
            return response()->json($e->getMessage());
        }

        return response()->json([
            "message" => "Berhasil Menghapus",
            "status" => 200,
        ]);
    }
}
