<?php

/** @var \Laravel\Lumen\Routing\Router $router */

use App\Models\User;

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

$router->get('/', function () use ($router) {
    return $router->app->version();
});

// Auth
$router->group(['prefix' => 'auth'], function () use ($router) {
    $router->post('/register', 'AuthController@register');
    $router->post('/login', 'AuthController@login');
    $router->post('/logout', 'AuthController@logout');
    $router->post('/refresh', 'AuthController@refresh');
    $router->get('/user', 'AuthController@userIsLogin');
});

// Admin 
$router->group(['prefix' => 'admin'], function () use ($router) {
    // PPDB
    $router->get('/ppdb', 'PpdbController@list');
    $router->get('/ppdb/{id}', 'PpdbController@show');
    
    // Registration
    $router->get('/registration', 'RegistrationController@index');
    $router->get('/registration/getByIsPaid/{ispaid}', 'RegistrationController@getByIsPaid');
    $router->post('/registration/code', 'RegistrationController@checkCodeRegistration');
    $router->put('/registration/update/{id}', 'RegistrationController@updateStatusRegistration');

    // User Typ e 
    $router->get('/user_type', 'UserTypeController@list');
});

// Student
$router->group(['prefix' => 'student'], function () use ($router) {
    // PPDB
    $router->get('/ppdb', 'PpdbController@list');
    $router->get('/ppdb/{id}', 'PpdbController@show');
    $router->post('/ppdb/store', 'PpdbController@store');
    $router->put('/ppdb/update/{id}', 'PpdbController@update');
    
    // Registration
    $router->get('/registration/{id}', 'RegistrationController@show');
    $router->post('/registration/upload', 'RegistrationController@upload');


});

