<?php

require_once 'bootstrap/head.php';


$streams = $feed->fetch();

foreach( $streams as $stream ) {


		$feed = new SimplePie();
		$feed->set_feed_url($stream['url']);
		$feed->set_cache_location('./cache');
		$feed->set_cache_duration(999999);
		$feed->set_timeout(1);
		$feed->force_feed(true);
		$feed->init();
		$feed->handle_content_type();

		if(!$feed->error()) {

			$feedId = Handy::makeId($feed->get_link());

			foreach ($feed->get_items() as $source) {

				$sourceId 		= Handy::makeId($source->get_link());
				$sourceUrl 		= $source->get_link();
				$sourceTitle 	= String::stripAllTags($source->get_title());
				$sourceDesc 	= String::cut(String::stripAllTags($source->get_description()));
				$sourceContent = String::stripRiskyTags($source->get_content());
				$sourceImg 	= Handy::findImage($source->get_content());
				$sourceCreated = $source->get_gmdate('Y-m-d H:i:s');
				$sourceUpdated = $source->get_updated_gmdate('Y-m-d H:i:s');

				$article->addOverwrite(array(
					'id' 			=> $sourceId,
					'feed' 			=> $feedId,
					'url' 			=> $sourceUrl,
					'title' 		=> $sourceTitle,
					'description' 	=> $sourceDesc,
					'content' 		=> $sourceContent,
					'image' 		=> $sourceImg,
					'stars' 		=> '222',
					'unread' 		=> '1',
					'favourite' 	=> '0',
					'later' 		=> '0',
					'created' 		=> $sourceCreated,
					'modifed' 		=> $sourceUpdated
				));

			}

		} else {
			// $stream->update(array(
			// 	'id' => $stream->id,
			// 	'status' => 0
			// ));
		}


}
