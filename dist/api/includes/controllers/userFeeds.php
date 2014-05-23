<?php

/*
 | ------------------------------------------
 | User feeds Controller Class
 | ------------------------------------------
*/

class UserFeeds extends Controller
{

	/**
	 * Post
	 */
	public function post($id, $query)
	{

		$request = Request::getData();

		if (String::isUrl($request->rssUrl)) {

			$url = String::normalizeUrl($request->rssUrl);

			$feed = new SimplePie();
			$feed->set_feed_url($url);
			$feed->set_autodiscovery_level(SIMPLEPIE_LOCATOR_ALL);
			$feed->init();
			$feed->handle_content_type();

			$this->feed->addOverwrite(array(
				'id' => String::md5(String::normalizeUrl($feed->get_permalink())),
				'url' => String::normalizeUrl($feed->subscribe_url()),
				'link' => $feed->get_permalink(),
				'title' => String::stripAllTags($feed->get_title()),
				'description' => String::stripAllTags($feed->get_description()),
				'updated' => '2014-03-07 23:27:26',
				'created' => '2014-03-07 23:27:26',
				'modifed' => '2014-03-07 23:27:26',
				'image' => $feed->get_image_url(),
				'subscribers' => '2222',
				'status' => '1'
			));

			$this->userFeed->addOverwrite(array(
				'id' => $id[0],
				'feedid' => String::md5(String::normalizeUrl($feed->get_permalink()))
			));

			foreach ($feed->get_items() as $article) {

				preg_match('/(<img[^>]+>)/i', $article->get_content(), $images);
				$xpath = new DOMXPath(@DOMDocument::loadHTML($images[0]));
				$imagesrc = $xpath->evaluate("string(//img/@src)");
				$imagesize = getimagesize($imagesrc);
				$imagesrc = ($imagesize[0] > 200 && $imagesize[1] > 200) ? $imagesrc : 'app/images/icon-blank.png';

				$this->article->addOverwrite(array(
					'id' => String::md5(String::normalizeUrl($article->get_link())),
					'created' => '2014-03-07 23:27:26',
					'modifed' => '2014-03-07 23:27:26',
					'url' => String::normalizeUrl($article->get_link()),
					'title' => String::stripAllTags($article->get_title()),
					'description' => String::stripAllTags(substr($article->get_description(), 0, 255)),
					'content' => String::stripRiskyTags($article->get_content()),
					'image' => $imagesrc,
					'stars' => '222'
				));

				$this->userArticle->addOverwrite(array(
					'id' => $id[0],
					'articleid' => String::md5(String::normalizeUrl($article->get_link())),
					'later' => 0,
					'favourite' => 0,
				));

			}

			Response::added(array(
				'status' => 'success',
				'message' => 'User feed added'
			));

		} else {

			Response::failed(array(
				'status' => 'error',
				'message' => 'Not added'
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
