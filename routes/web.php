<?php

/** @var \Laravel\Lumen\Routing\Router $router */

use App\Http\Controllers\UploadController;

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get("/", function () use ($router) {
    return $router->app->version();
});

$router->get("/ppdb/print/{id}", "PpdbAdminController@print");

$router->get("/blogs", "BlogController@list");
$router->get("/blogs/{id}", "BlogController@show");
$router->get("/jobs", "JobController@list");
$router->get("/job_categories", "JobCategoryController@list");

// Auth
$router->group(["prefix" => "auth"], function () use ($router) {
    $router->post("/register", "AuthController@register");
    $router->post("/login", "AuthController@login");

    $router->group(["middleware" => "auth"], function ($router) {
        $router->post("/logout", "AuthController@logout");
        $router->post("/refresh", "AuthController@refresh");
        $router->get("/user", "AuthController@userIsLogin");
    });
});

$router->group(["middleware" => "auth"], function ($router) {
    // User
    $router->group(["prefix" => "user"], function () use ($router) {
        $router->get("/", "UserController@index");
        $router->put("/profile", "UserController@update");
        $router->post("/upload", "UserController@upload");
        $router->post("/store", "UserController@store");
        $router->delete("/destroy/{id}", "UserController@destroy");
    });

    // Admin
    $router->group(["prefix" => "admin"], function () use ($router) {
        
        $router->get('/dashboard', 'DashboardController@index');
        $router->get("/", "AdminController@index");


        // Admin
        $router->put("/user/update/{id}", "AdminController@update");

        // PPDB
        $router->get("/ppdb", "PpdbController@list");
        $router->get("/ppdb/{id}", "PpdbController@show");
        $router->post("/ppdb/store", "PpdbAdminController@store");
        $router->put("/ppdb/update", "PpdbAdminController@update");

        // Registration
        $router->get("/registration", "RegistrationAdminController@index");
        $router->post(
            "/registration/code",
            "RegistrationController@checkCodeRegistration"
        );
        $router->put(
            "/registration/update/{id}",
            "RegistrationController@updateStatusRegistration"
        );

        // User Type
        $router->get("/user_type", "UserTypeController@list");

        // Job
        $router->get("/jobs", "JobController@list");
        $router->get("/jobs/{id}", "JobController@show");
        $router->post("/jobs", "JobController@store");
        $router->put("/jobs/{id}", "JobController@update");
        $router->delete("/jobs/{id}", "JobController@destroy");

        // Job Category
        $router->get("/job_categories", "JobCategoryController@list");
        $router->get("/job_categories/{id}", "JobCategoryController@show");
        $router->post("/job_categories", "JobCategoryController@store");
        $router->put("/job_categories/{id}", "JobCategoryController@update");
        $router->delete(
            "/job_categories/{id}",
            "JobCategoryController@destroy"
        );

        // Blog
        $router->get("/blogs", "BlogController@list");
        $router->get("/blogs/{id}", "BlogController@show");
        $router->post("/blogs", "BlogController@store");
        $router->put("/blogs/{id}", "BlogController@update");
        $router->delete("/blogs/{id}", "BlogController@destroy");

        // Blog Category
        $router->get("/blog_categories", "BlogCategoryController@list");
        $router->get("/blog_categories/{id}", "BlogCategoryController@show");
        $router->post("/blog_categories", "BlogCategoryController@store");
        $router->put("/blog_categories/{id}", "BlogCategoryController@update");
        $router->delete(
            "/blog_categories/{id}",
            "BlogCategoryController@destroy"
        );
    });

    // Student
    $router->group(["prefix" => "student"], function () use ($router) {
        // PPDB
        $router->get("/ppdb", "PpdbController@list");
        $router->get("/ppdb/{id}", "PpdbController@show");
        $router->post("/ppdb/store", "PpdbController@store");
        $router->put("/ppdb/update", "PpdbController@update");

        // Registration
        $router->get("/registration", "RegistrationController@index");
        $router->get("/registration/detail", "RegistrationController@show");

        $router->post("/registration/upload", "RegistrationController@upload");
    });

    // Upload
    $router->post("/upload_image", "UploadController@store");
});
