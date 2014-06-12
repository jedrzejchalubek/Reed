<?php

/*
 | ------------------------------------------
 | User feeds Controller Class
 | ------------------------------------------
*/

class UserFeeds extends Controller
{


	public function get($id, $query)
	{

		$data = $this->userFeed->fetch($id[0]);

		if ($data) {
			Response::json($data);
		} else {
			echo "[]";
		}

	}


	/**
	 * Post
	 */
	public function post($id, $query)
	{

		$request = Request::getData();
		$articles = array();

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
				'updated' => date('Y-m-d H:i:s'),
				'created' => date('Y-m-d H:i:s'),
				'modifed' => date('Y-m-d H:i:s'),
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

				$item = array(
					'id' => String::md5(String::normalizeUrl($article->get_link())),
					'feed' => String::md5(String::normalizeUrl($feed->get_permalink())),
					'created' => $article->get_gmdate('Y-m-d H:i:s'),
					'modifed' => $article->get_updated_gmdate('Y-m-d H:i:s'),
					'url' => String::normalizeUrl($article->get_link()),
					'title' => String::stripAllTags($article->get_title()),
					'description' => String::cut(String::stripAllTags($article->get_description())),
					'content' => String::stripRiskyTags($article->get_content()),
					'image' => $imagesrc,
					'stars' => '222'
				);

				$this->article->addOverwrite($item);

				$this->userArticle->addOverwrite(array(
					'id' => $id[0],
					'articleid' => String::md5(String::normalizeUrl($article->get_link())),
					'unread' => 1,
					'later' => 0,
					'favourite' => 0,
					'created' => date('Y-m-d H:i:s')
				));

				array_push($articles, $item);

			}

			Response::added(array(
				'status' => 'success',
				'message' => 'User feed added',
				'items' => $articles
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
