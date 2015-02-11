<?php

// Routes to model injection
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
Route::any('/form/{node}', array(
	'as' 		=> 'node.form',
	'uses'	=> 'NodeController@form'
));

Route::get('/form/{node}', array('as' => 'node.form', function($id = null) {
	$node = null;

	if($id !== null) {
		$node = with(new \Cms\Repositories\NodeRepository())->findById($id);
	}

	return \App::make('\Cms\Controllers\NodeController')->form($node);
}));