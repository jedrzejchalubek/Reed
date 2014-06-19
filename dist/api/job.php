<?php

require_once 'bootstrap/head.php';

$streams = $feed->fetch();

foreach( $streams as $stream ) {

	$feed = new SimplePie();
	$feed->set_feed_url($stream['url']);
	$feed->force_feed(true);
	$feed->set_cache_location('./cache');
	$feed->set_cache_duration(3600);
    $feed->set_timeout(1);
	$feed->init();
	$feed->handle_content_type();

	$feedId = Handy::makeId($feed->get_link());

	foreach ($feed->get_items() as $article) {

		$articleId 		= Handy::makeId($article->get_link());
		$articleUrl 	= String::normalizeUrl($article->get_link());
		$articleTitle 	= String::stripAllTags($article->get_title());
		$articleDesc 	= String::cut(String::stripAllTags($article->get_description()));
		$articleContent = String::stripRiskyTags($article->get_content());
		$articleImg 	= Handy::findImage($article->get_content());
		$articleCreated = $article->get_gmdate('Y-m-d H:i:s');
		$articleUpdated = $article->get_updated_gmdate('Y-m-d H:i:s');

		if( $articleCreated >= date('Y-m-d H:i:s', strtotime('-3 day')) ) {

			$this->article->addOverwrite(array(
				'id' 			=> $articleId,
				'feed' 			=> $feedId,
				'url' 			=> $articleUrl,
				'title' 		=> $articleTitle,
				'description' 	=> $articleDesc,
				'content' 		=> $articleContent,
				'image' 		=> $articleImg,
				'stars' 		=> '222',
				'unread' 		=> '1',
				'favourite' 	=> '0',
				'later' 		=> '0',
				'created' 		=> $articleCreated,
				'modifed' 		=> $articleUpdated
			));

		}

	}

}
