<?php

require_once 'bootstrap/head.php';

$streams = $feed->fetch();

		foreach( $streams as $stream ) {

			$channel = new SimplePie();
			$channel->set_feed_url($stream['url']);
			$channel->force_feed(true);
			$channel->set_cache_location('./cache');
		    $channel->set_cache_duration(3600);
       		$channel->set_timeout(1);
			$channel->init();
			$channel->handle_content_type();

			foreach ($channel->get_items() as $source) {

				preg_match('/(<img[^>]+>)/i', $source->get_content(), $images);
				$xpath = new DOMXPath(@DOMDocument::loadHTML($images[0]));
				$imagesrc = $xpath->evaluate("string(//img/@src)");
				$imagesize = getimagesize($imagesrc);
				$imagesrc = ($imagesize[0] > 200 && $imagesize[1] > 200) ? $imagesrc : 'app/images/icon-blank.png';

				$article->addOverwrite(array(
					'id' => String::md5(String::normalizeUrl($source->get_link())),
					'feed' => String::md5(String::normalizeUrl($channel->get_permalink())),
					'created' => $source->get_gmdate('Y-m-d H:i:s'),
					'modifed' => $source->get_updated_gmdate('Y-m-d H:i:s'),
					'url' => String::normalizeUrl($source->get_link()),
					'title' => String::stripAllTags($source->get_title()),
					'description' => String::cut(String::stripAllTags($source->get_description())),
					'content' => String::stripRiskyTags($source->get_content()),
					'image' => $imagesrc,
					'stars' => '222',
					'unread' => '1',
					'favourite' => '0',
					'later' => '0'
				));

			}

		}
