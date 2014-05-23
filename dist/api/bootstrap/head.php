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
 | Require Facebook SDK
 | ------------------------------------------
 | To making Facebook API calls
*/
require_once 'includes/classes/facebook.php';

/*
 | ------------------------------------------
 | Require Facebook SDK
 | ------------------------------------------
 | To making Facebook API calls
*/
require_once 'includes/classes/autoloader.php';

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

$database = new Reed\Models\Database(
	$DbConfig['host'],
	$DbConfig['name'],
	$DbConfig['user'],
	$DbConfig['pass']
);

$facebook = new Facebook($FacebookConfig);
$token = new Reed\Models\Token($database);
$feed = new Reed\Models\Feed($database);
$article = new Reed\Models\Article($database);
$userFeed = new Reed\Models\UserFeed($database);
$userArticle = new Reed\Models\UserArticle($database);

$user = new Reed\Models\User($facebook, $token, $database);
$router = new Router($user, $token, $database);
