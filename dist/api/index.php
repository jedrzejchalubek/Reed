<?php

require_once 'bootstrap/head.php';


/*
 | ---------------------------------------------------
 | Home route
 | ---------------------------------------------------
 | Generate, store and send back authorization tokens.
 | Each client before be able to access api should submit
 | for token and include it in every api request.
 | Should accept requests:
 | GET => throw error
 | POST => generate, store and send back authorization token
 | PUT => throw error
 | DELETE => throw error
*/
$router->map('/auth', 'AuthService', array(
	'user' => $user,
	'token' => $token,
	'facebook' => $facebook
));





/*
 | ---------------------------------------------------
 | Discovery Feeds route
 | ---------------------------------------------------
 | Discovery feeds collection. Should accept requests:
 | GET => list discovery feeds collection
 | POST => throw error
 | PUT => throw error
 | DELETE => throw error
 |
 | Optional reqest parameters:
 | ?limit={int}
 | ?offset={int}
*/
$router->map('/discovery/feeds', 'FeedsDiscovery', array(
	'feed' => $feed,
	'user' => $user
));




/*
 | ---------------------------------------------------
 | Discovery Articles route
 | ---------------------------------------------------
 | Discovery articles collection. Should accept requests:
 | GET => list of discovered articles
 | POST => throw error
 | PUT => throw error
 | DELETE => throw error
 |
 | Optional reqest parameters:
 | ?limit={int}
 | ?offset={int}
*/
$router->map('/discovery/articles', 'ArticlesDiscovery', array(
	'article' => $article
));




/*
 | ---------------------------------------------------
 | Feeds route
 | ---------------------------------------------------
 | Feeds collection. Should accept requests:
 | GET => list feeds collection
 | POST => throw error
 | PUT => throw error
 | DELETE => throw error
 |
 | Optional reqest parameters:
 | ?limit={int}
 | ?offset={int}
*/
$router->map('/feeds', 'Feeds', array(
	'feed' => $feed
));




/*
 | ---------------------------------------------------
 | Feed route
 | ---------------------------------------------------
 | Single feed. Should accept requests:
 | GET => single feed details
 | POST => throw error
 | PUT => throw error
 | DELETE => throw error
*/
$router->map('/feeds/:id', 'Feed', array(
	'feed' => $feed
));



/*
 | ---------------------------------------------------
 | Articles route
 | ---------------------------------------------------
 | Articles collection. Should accept requests:
 | GET => list articles collection
 | POST => throw error
 | PUT => throw error
 | DELETE => throw error
 |
 | Optional reqest parameters:
 | ?limit={int}
 | ?offset={int}
*/
$router->map('/articles', 'Articles', array(
	'article' => $article
));




/*
 | ---------------------------------------------------
 | Article route
 | ---------------------------------------------------
 | Single article. Should accept requests:
 | GET => article details
 | POST => throw error
 | PUT => throw error
 | DELETE => throw error
*/
$router->map('/articles/:id', 'Article', array(
	'article' => $article
));




/*
 | ---------------------------------------------------
 | Users route
 | ---------------------------------------------------
 | Users collection. Should accept requests:
 | GET => users collection
 | POST => add new user to users collection
 | PUT => throw error
 | DELETE => throw error
*/

$router->map('/users', function(){});




/*
 | ---------------------------------------------------
 | User route
 | ---------------------------------------------------
 | User details. Should accept requests:
 | GET => user details
 | POST => throw error
 | PUT => (exist) ? update user details : throw error
 | DELETE => delete user
*/
$router->map('/users/:id', 'User', array(
	'user' => $user,
));





/*
 | ---------------------------------------------------
 | User feeds route
 | ---------------------------------------------------
 | User feeds collection. Should accept requests:
 | GET => list user feeds collection
 | POST => add new feed to user feeds collection
 | PUT => throw error
 | DELETE => throw error
 |
 | Optional reqest parameters:
 | ?limit={int}
 | ?offset={int}
*/
$router->map('/users/:id/feeds', 'UserFeeds', array(
	'feed' => $feed,
	'userFeed' => $userFeed,
	'article' => $article,
	'userArticle' => $userArticle
));




/*
 | ---------------------------------------------------
 | User feed route
 | ---------------------------------------------------
 | User single feed. Should accept requests:
 | GET => feed details
 | POST => throw error
 | PUT => (exist) ? update feed details : throw error
 | DELETE => delete user feed
*/
$router->map('/users/:id/feeds/:id', function(){});




/*
 | ---------------------------------------------------
 | User articles route
 | ---------------------------------------------------
 | User articles collection. Should accept requests:
 | GET => list user articles collection
 | POST => add new article to user articles collection
 | PUT => throw error
 | DELETE => throw error
 |
 | Optional reqest parameters:
 | ?limit={int}
 | ?offset={int}
*/
$router->map('/users/:id/articles', 'UserArticles', array(
	'userArticle' => $userArticle
));




/*
 | ---------------------------------------------------
 | User article route
 | ---------------------------------------------------
 | User single article. Should accept requests:
 | GET => article details
 | POST => throw error
 | PUT => (exist) ? update article details : throw error
 | DELETE => delete user article
*/
$router->map('/users/:id/articles/:id', 'UserArticle', array(
	'userArticle' => $userArticle
));

$router->map('/csv', function() use($feed, $article, $userFeed) {

	$streams = $userFeed->fetch();

	foreach( $streams as $stream ) {

		$source = $feed->get($stream['feedid']);

		$channel = new SimplePie();
		$channel->set_feed_url($source['url']);
		$channel->set_autodiscovery_level(SIMPLEPIE_LOCATOR_ALL);
		$channel->init();
		$channel->handle_content_type();

		foreach ($channel->get_items() as $material) {

			preg_match('/(<img[^>]+>)/i', $material->get_content(), $images);
			$xpath = new DOMXPath(@DOMDocument::loadHTML($images[0]));
			$imagesrc = $xpath->evaluate("string(//img/@src)");
			$imagesize = getimagesize($imagesrc);
			$imagesrc = ($imagesize[0] > 200 && $imagesize[1] > 200) ? $imagesrc : 'app/images/icon-blank.png';

			$article->addOverwrite(array(
				'id' => String::md5(String::normalizeUrl($material->get_link())),
				'feed' => String::md5(String::normalizeUrl($channel->get_permalink())),
				'created' => $material->get_gmdate('Y-m-d H:i:s'),
				'modifed' => $material->get_updated_gmdate('Y-m-d H:i:s'),
				'url' => String::normalizeUrl($material->get_link()),
				'title' => String::stripAllTags($material->get_title()),
				'description' => String::cut(String::stripAllTags($material->get_description())),
				'content' => String::stripRiskyTags($material->get_content()),
				'image' => $imagesrc,
				'stars' => '222',
				'unread' => '1',
				'favourite' => '0',
				'later' => '0'
			));

		}

	}

});


/*
 | ---------------------------------------------------
 | Execute router
 | ---------------------------------------------------
 | Perform uri match with routes collection
*/
$router->execute();


/*
 | ---------------------------------------------------
 | Debug routes
 | ---------------------------------------------------
*/
// var_dump($routes)
