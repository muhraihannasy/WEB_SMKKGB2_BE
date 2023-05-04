<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

class UploadController extends Controller
{
    public function store(Request $request)
    {
        $imageOld = public_path($request->image_old);
        if (file_exists($imageOld)) {
            File::delete($imageOld);
        }

        $this->validate(
            $request,
            [
                "image" => "mimes:jpeg,png",
            ],
            ["image.mimes" => "Hanya Format PNG, JPG"]
        );

        try {
            $image = $request->file("image");
            $imageName = time() . "." . $image->getClientOriginalExtension();

            // $image->move("/home/smkb7435/public_html/api/upload/", $imageName);
            $image->move(public_path("upload"), $imageName);
            $url = url("upload/" . $imageName);
        } catch (Exception $e) {
            return response()->json($e->getMessage());
        }

        return response()->json([
            "url" => $url,
            "message" => "Upload Berhasil",
            "status" => 200,
        ]);
    }
}
