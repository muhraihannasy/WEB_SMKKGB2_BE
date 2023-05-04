<?php

namespace App\Http\Controllers;
use Exception;

// Model
use App\Models\Job;

// Request
use App\Http\Requests\JobRequest;
use App\Http\Resources\job\JobResourceList;
use App\Http\Resources\job\JobResourceShow;
use App\Models\JobCategory;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class JobController extends Controller
{
    protected $table = Job::class;

    public function list()
    {
        $query = $this->table::with(["category", "user"]);

        if (request()->has("filter")) {
            $filter = request()->filter;

            $query->where("name", "like", "%$filter%");
        }

        if (request()->has("by") && request("by") !== "") {
            $by = request()->by;
            $category = JobCategory::where("name", "like", "%$by%")
                ->get()
                ->first();

            $query->Where("job_category_id", "$category->id");
        }

        $data["count_job"] = $query->count();

        $data["data"] = JobResourceList::collection($query->get());
        return response()->json($data);
    }

    public function show($id)
    {
        $data = JobResourceShow::collection(
            $this->table
                ::with(["category", "user"])
                ->whereId($id)
                ->get()
        );
        return response()->json($data);
    }

    public function store(JobRequest $request)
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

    public function update(JobRequest $request)
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
