<?php

/*
 | ------------------------------------------
 | Require application configuration file
 | ------------------------------------------
 | That file stores configuration data
*/
require_once 'bootstrap/config.php';



/*
 | ------------------------------------------
 | Require all application classes
 | ------------------------------------------
 | Require all files from classes directory
*/
foreach(glob('includes/classes/*.php') as $class){
	require_once $class;
}



/*
 | ------------------------------------------
 | Require all application controllers
 | ------------------------------------------
 | Require all files from controllers directory
*/
foreach(glob('includes/controllers/*.php') as $controller){
    require_once $controller;
}



/*
 | ------------------------------------------
 | Require all application models
 | ------------------------------------------
 | Require all files from models directory
*/
foreach(glob('includes/models/*.php') as $model){
    require_once $model;
}



/*
 | ------------------------------------------
 | Init
 | ------------------------------------------
 | Initialize application classes and models
*/
$router = new Router();

$database = new Database(
	$DBconfig['host'],
	$DBconfig['name'],
	$DBconfig['user'],
	$DBconfig['pass']
);

$feed = new Feed($database);
$article = new Article($database);