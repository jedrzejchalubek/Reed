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
		$fbtoken = Http::getHeader('Authorization');

		$profile = json_decode( \Request::make("https://graph.facebook.com/me?access_token={$fbtoken}") );

		if ( $profile->verified ) {

			// generuje unikalny token
			$authtoken = $this->token->generate();

			// zapisuje usera ktory zglosil sie po token
			$this->token->update(array(
				'id' => $profile->id,
				'authtoken' => $authtoken,
				'fbtoken' => $fbtoken
			));

			// zapis do bazy tabli user -> userid:token do weryfikacji zapytan
			// ustalić czas wygasania tokenów
			// po wygasnieciu klient bedzie musial sie jeszcze raz zglosic po token

			Response::json(array(
				'userid' => $profile->id,
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
