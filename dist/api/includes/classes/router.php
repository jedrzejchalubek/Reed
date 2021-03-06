<?php

/*
 | ------------------------------------------
 | Router Class
 | ------------------------------------------
 | This is general class for mapping
 | and executing application routes.
*/

class Router
{
	/**
	 * Routes collection
	 * @var array
	 */
	private $routes = array();

	/**
	 * User
	 * @var Object
	 */
	private $user;

	/**
	 * Map route
	 * Adding new route to routes collection
	 * @param  String $pattern Route uri pattern
	 * @param  Mixed  $method Route method
	 * @param  Array  $model Route models
	 */
	public function map($pattern, $method = null, $model = array())
	{
		$this->routes[] = new Route(trim($pattern, '/'), $method, $model);
	}

	/**
	 * Execute routes
	 * Perform uri match with routes collection
	 */
	public function execute()
	{

		if ( ($this->token->isValid() && $this->user->isLogin()) ) {

			$uri = Server::uri();

			/**
			 * Each route in routes collection
			 * @var Array
			 */
			foreach ($this->routes as $item => $route)
			{

				/**
				 * Replace URI "id" parameter with route ":id" attribute
				 * This allows for later URI and route comparison
				 * @var String
				 */
				$preparedUri = preg_replace("/[a-z0-9]{32}/i", ":id", isset($uri) ? $uri : '/');

				/**
				 * Compare current uri with route
				 * from routes collection
				 */
				if ($route->match( trim($preparedUri,'/') )) {

					// On match get route method and models
					$Controller = $route->getController();
					$Models = $route->getModel();

					// Add user object to route models
					$Models['user'] = $this->user;


					try {

						$this->database->beginTransaction();
						/**
						 * While method is string, call controller
						 * Otherwise call passed to route anonymous function
						 */
						if (is_string($Controller)) new $Controller($Models);
						else call_user_func($Controller);

						$this->database->commitTransaction();

					} catch (Exception $e) {

					    // An exception has been thrown
					    // We must rollback the transaction
					    $this->database->rollbackTransaction();

					    Response::failed(array(
					    	'message' => $e
					    ));

					}

					return true;

				}

			}

			Response::failed(array(
				'message' => 'Bad route'
			));

		}

	}

	public function __construct($user, $token, $database)
	{
		$this->user = $user;
		$this->token = $token;
		$this->database = $database;
	}

}
