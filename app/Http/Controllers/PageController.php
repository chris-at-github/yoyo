<?php namespace App\Http\Controllers;

class PageController extends Controller {
	public function index() {
		return \View::make('page.index');
	}
}