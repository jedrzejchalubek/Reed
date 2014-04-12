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
		$headers = getallheaders();
		$passed_token = $headers['Authorization'];

		/**
		 * expired access tokens tests
		 */
      // $url = "https://graph.facebook.com/oauth/access_token?client_id="
      // . "676983059011847" . "&redirect_uri=" . "http://localhost/reed/dist/"
      // . "&client_secret=" . "e30a10b27c33467aae28ea0763e5f56e"
      // . "&code=" . $passed_token . "&display=popup";

      // Http::header(array(
      // 	"Location: {$url}"
      // ));

		$profile = json_decode( \Request::make("https://graph.facebook.com/me?access_token={$passed_token}") );

		if ( $profile->verified && ($this->user->getId() == $profile->id) ) {

			// generuje unikalny token
			$authToken = hash('sha256', uniqid(microtime(true), true) );

			// zapisuje usera ktory zglosil sie po token
			$this->token->update(array(
				'id' => $profile->id,
				'token' => $authToken
			));

			// zapis do bazy tabli user -> userid:token do weryfikacji zapytan
			// ustalić czas wygasania tokenów
			// po wygasnieciu klient bedzie musial sie jeszcze raz zglosic po token

			Response::json(array(
				'userId' => $profile->id,
				'token' => $authToken
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
