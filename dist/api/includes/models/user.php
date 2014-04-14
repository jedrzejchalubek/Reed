<?php

/*
 | ------------------------------------------
 | User Class
 | ------------------------------------------
 | This is general class for user data access
*/

namespace Reed\Models;

class User extends Model
{

	/**
	 * Facebook API
	 * @var Object
	 */
	protected $facebook;

	/**
	 * Token model
	 * @var Object
	 */
	protected $token;

	public function getId()
	{
		return $_COOKIE['reed_userid'];
	}

	/**
	 * Get user pprofile
	 * @return Array
	 */
	public function getFacebookProfile()
	{
		$token = $this->getFbToken();
		return \Request::make("https://graph.facebook.com/me?access_token={$token}");
	}

	public function getAuthToken()
	{
		return $this->token->get($this->getId())['authtoken'];
	}

	public function getFbToken()
	{
		return $this->token->get($this->getId())['fbtoken'];
	}

	/**
	 * Is user authorized
	 * Return error when user id not exsist
	 * or Access Token expired
	 * @return boolean
	 */
	public function isLogin()
	{

		if ($_SERVER["REQUEST_URI"] == "/reed/dist/api/auth") return true;

		// User logedin to facebook
		if ( $this->getFacebookProfile() ) {
			try {
				return true;
			} catch (FacebookApiException $e) {
				// Facebook Access Token expired
				error_log($e);
			}
		} else {
			// Not authorized no facebook session
		}


	}

	public function __construct($facebook, $token, $db)
	{
		$this->facebook = $facebook;
		$this->token = $token;
		$this->db = $db;
	}

}
