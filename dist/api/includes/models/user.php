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
	 * Database table name
	 * @var String
	 */
	protected $table = 'user';

	/**
	 * Database table columns
	 * @var String
	 */
	protected $columns = 'id, fbId, name, last, email';

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


	/**
	 * Get user id from cookie
	 * @return String
	 */
	public function getId()
	{
		return $_COOKIE['reed_userid'];
	}


	/**
	 * Get user profile
	 * @return Array
	 */
	public function getFacebookProfile()
	{
		$token = $this->getFbToken();
		return \Request::make("https://graph.facebook.com/me?access_token={$token}");
	}


	/**
	 * Get user authorization token from database
	 * @return String
	 */
	public function getAuthToken()
	{
		$tokens = $this->token->get($this->getId());
		return $tokens['authtoken'];
	}


	/**
	 * Get user facebook token form database
	 * @return String
	 */
	public function getFbToken()
	{
		$tokens = $this->token->get($this->getId());
		return $tokens['fbtoken'];
	}


	/**
	 * Is user authorized
	 * Return error when user not exsist or something went wrong
	 * @return boolean
	 */
	public function isLogin()
	{

		// Auth route don't need login
		if(\Route::is('auth')) return true;

		// User loggedin to facebook
		if ( $this->getFacebookProfile() ) {

			try {
				return true;
			} catch (FacebookApiException $e) {
				// Facebook Access Token expired
				error_log($e);
				return false;
			}

		} else {

			// Not authorized no facebook session
			return false;

		}


	}

	public function __construct($facebook, $token, $db)
	{
		$this->facebook = $facebook;
		$this->token = $token;
		$this->db = $db;
	}

}
