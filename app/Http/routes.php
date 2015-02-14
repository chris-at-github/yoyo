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
Route::get('/create/{nodeType?}', array(
	'as' 		=> 'node.create',
	'uses'	=> 'NodeController@create'
));

Route::get('/form/{node}', array('as' => 'node.form', function($id = null) {
	$node = null;

	if($id !== null) {
		$node = \App::make('\Cms\Repositories\NodeRepository')->find(['id' => $id]);
	}

	return \App::make('\Cms\Controllers\NodeController')->form($node);
}));

Route::any('/store/{node?}', array('as' => 'node.store', function($id = null) {
	$node = null;
	$type = \App::make('\Cms\Repositories\NodeTypeRepository')->find(['id' => \Input::get('type', 0)]);

	if($type !== null) {
		$namespace 	= $type->namespace;
		$node 			= \App::make($namespace);

		if($id !==  null) {
			$node = \App::make('\Cms\Repositories\NodeRepository')->find(['id' => $id], $namespace);
		}

		return \App::make('\Cms\Controllers\NodeController')->store($node);
	}
}));

Route::get('{page?}', array(
	'as' 		=> 'page',
	'uses'	=> 'PageController@index'
));