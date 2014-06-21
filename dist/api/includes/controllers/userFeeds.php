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
		Response::json($this->userFeed->get($id[0]));
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

			$feedId 	= Handy::makeId($feed->get_permalink());
			$feedUrl 	= String::normalizeUrl($feed->subscribe_url());
			$feedLink 	= String::normalizeUrl($feed->get_permalink());
			$feedTitle 	= String::stripAllTags($feed->get_title());
			$feedDesc 	=String::cut(String::stripAllTags($feed->get_description()));
			$feedImg 	= Handy::findIcon(file_get_contents($feed->get_permalink()));
			$feedItems	= $feed->get_items();
			$date 		= date('Y-m-d H:i:s');

			$source = array(
				'id' => $feedId,
				'url' => $feedUrl,
				'link' => $feedLink,
				'title' => $feedTitle,
				'description' => $feedDesc,
				'subscribers' => '2222',
				'status' => '1',
				'image' => $feedImg,
				'updated' => $date,
				'created' => $date,
				'modifed' => $date
			);

			$this->feed->addOverwrite($source);

			$this->userFeed->addOverwrite(array(
				'id' => $id[0],
				'feedid' => $feedId,
				'folder' => 'Uncategorized',
				'created' => $date
			));

			foreach ($feedItems as $article) {

				$articleId 		= Handy::makeId($article->get_link());
				$articleUrl 	= $article->get_link();
				$articleTitle 	= String::stripAllTags($article->get_title());
				$articleDesc 	= String::cut(String::stripAllTags($article->get_description()));
				$articleContent = String::stripRiskyTags($article->get_content());
				$articleImg 	= Handy::findImage($article->get_content());
				$articleCreated = $article->get_gmdate('Y-m-d H:i:s');
				$articleUpdated = $article->get_updated_gmdate('Y-m-d H:i:s');

				$item = array(
					'id' => $articleId,
					'feed' => $feedId,
					'url' => $articleUrl,
					'title' => $articleTitle,
					'description' => $articleDesc,
					'content' => $articleContent,
					'image' => $articleImg,
					'stars' => '222',
					'unread' => '1',
					'favourite' => '0',
					'later' => '0',
					'created' => $articleCreated,
					'modifed' => $articleUpdated
				);

				$this->article->addOverwrite($item);

				$this->userArticle->addOverwrite(array(
					'id' => $id[0],
					'articleid' => Handy::makeId($article->get_link()),
					'unread' => ($articleCreated >= date('Y-m-d H:i:s', strtotime("$date -7 day"))) ? 1 : 0,
					'later' => 0,
					'favourite' => 0,
					'created' => date('Y-m-d H:i:s')
				));

				if( $articleCreated >= date('Y-m-d H:i:s', strtotime("$date -7 day")) ) {
					array_push($articles, $item);
				}


			}

			Response::added(array(
				'status' => 'success',
				'message' => 'User feed added',
				'source' => $source,
				'folder' => 'Uncategorized',
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
