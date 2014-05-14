<?php

/*
 | ------------------------------------------
 | Home Controller Class
 | ------------------------------------------
*/

class AuthService extends Controller
{

	/**
	 * Post
	 */
	public function get($id, $query)
	{

		// Get passed Facebook access token
		$fbtoken = Http::getHeader('Authorization');
		// Tell facebook sdk to use that token
		$this->facebook->setAccessToken( $fbtoken );

		// Fetch facebook profile
		$profile = json_decode( json_encode( $this->facebook->api('/me', 'GET') ), false);

		// If facebook profile are verifed authorize user
		if ( $profile->verified ) {

			// Generate unique token
			$authtoken = $this->token->generate();

			// Store user tokens
			$this->token->add(array(
				'id' => hash('md5', $profile->id),
				'authtoken' => $authtoken,
				'fbtoken' => $fbtoken
			));

			// Store user
			$this->user->add(array(
				'id' => hash('md5', $profile->id),
				'fbId' => $profile->id
			));

			// Response to client with user id and authorize token
			Response::json(array(
				'userid' => hash('md5', $profile->id),
				'authtoken' => $authtoken
			));

		} else {

			Response::unauthorized(array(
				'status' => '401',
				'message' => 'Given access token is invalid.'
			));

		}

	}

	/**
	 * Construct
	 * Each controller must construct parent base controller class
	 * @param Object $model Models passed to controller
	 */
	function __construct($models)
	{
		parent::__construct($models);
	}
}
