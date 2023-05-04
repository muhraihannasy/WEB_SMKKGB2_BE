<?php

namespace App\Http\Controllers;

use App\Http\Requests\BlogRequest;
use App\Http\Resources\blog\BlogResourse;
use App\Http\Resources\blog\BlogResourseList;
use Exception;
use Illuminate\Http\Request;

// Model
use App\Models\Blog;
use Illuminate\Support\Facades\Auth;

class BlogController extends Controller
{
    protected $table = Blog::class;

    public function list()
    {
        $data = BlogResourseList::collection(
            $this->table::with(["category", "user"])->get()
        );
        return response()->json($data);
    }

    public function show($id)
    {
        $data = BlogResourse::collection(
            $this->table
                ::with(["category", "user"])
                ->whereId($id)
                ->get()
        );
        return response()->json($data);
    }

    public function store(BlogRequest $request)
    {
        $data = $request->all();
        $data["user_id"] = Auth::user()->id;

        try {
            $this->table::create($data);
        } catch (Exception $e) {
            return response()->json($e->getMessage());
        }

        return response()->json([
            "message" => "Berhasil Menambahkan",
            "status" => 200,
        ]);
    }

    public function update(BlogRequest $request)
    {
        $data = $this->table::find($request->id);
        try {
            $data->update([
                "title" => $request->title,
                "name" => $request->name,
                "blog_category_id" => $request->blog_category_id,
                "body" => $request->body,
                "image" => $request->image,
            ]);
        } catch (Exception $e) {
            return response()->json($e->getMessage());
        }

        return response()->json([
            "message" => "Berhasil Mengubah",
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
