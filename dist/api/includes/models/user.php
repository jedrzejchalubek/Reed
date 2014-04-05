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
	 * Get user pprofile
	 * @return Array
	 */
	public function getProfile()
	{
		return $this->facebook->api('/me', 'GET');
	}

	/**
	 * Get user id
	 * @return Int
	 */
	public function getId()
	{
		return $this->facebook->getUser();
	}

	/**
	 * Get user friends
	 * @return Array
	 */
	public function getFriends()
	{
		return $this->facebook->api('/me/friends');
	}

	/**
	 * Is user authorized
	 * Return error when user id not exsist
	 * or Access Token expired
	 * @return boolean
	 */
	public function isLogin()
	{

		// !!!!!!!!!!!!!!!
		// For development
		// !!!!!!!!!!!!!!!
		return true;

		// User logedin to facebook
		if ( $this->getProfile() ) {
			try {
				// ==TODO== Application Access Token valid
				if ( $token ) {
					// User authorized
					return true;
				}
			} catch (FacebookApiException $e) {
				// Facebook Access Token expired
				error_log($e);
			}
		} else {
			// Not authorized no facebook session
		}

	}

	public function __construct($facebook, $db)
	{
		$this->facebook = $facebook;
		$this->db = $db;
	}

}
