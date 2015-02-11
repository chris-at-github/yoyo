<?php

// Routes to model injection
// Route::model('node', 'Cms\Models\Node');
Route::model('nodeType', 'Cms\Models\NodeType');

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/


Route::get('/', 'PageController@index');
Route::get('/create/{nodeType?}', array(
	'as' 		=> 'node.create',
	'uses'	=> 'NodeController@create'
));
Route::any('/save/{id?}', array(
	'as' 		=> 'node.save',
	'uses'	=> 'NodeController@save'
));
Route::any('/edit/{id}', array(
	'as' 		=> 'node.edit',
	'uses'	=> 'NodeController@edit'
));