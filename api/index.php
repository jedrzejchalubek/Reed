<?php 

require_once 'bootstrap/head.php';

/*
 | ---------------------------------------------------
 | Feeds route
 | ---------------------------------------------------
 | Feeds collection. Should accept requests:
 | GET => list feeds collection
 | POST => add new feed to feeds collection
 | PUT => throw error
 | DELETE => throw error/delete feeds collection
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
 | GET => feed details
 | POST => throw error
 | PUT => (exist) ? update feed details : throw error
 | DELETE => delete feed
*/
$router->map('/feeds/:id', function(){});




/*
 | ---------------------------------------------------
 | Popular Feeds route
 | ---------------------------------------------------
 | Popular feeds collection. Should accept requests:
 | GET => list popular feeds collection
 | POST => add new feed to popular feeds collection
 | PUT => throw error
 | DELETE => throw error/delete popular feeds collection
 | 
 | Optional reqest parameters:
 | ?limit={int}
 | ?offset={int}
*/
$router->map('/feeds/popular', function(){});




/*
 | ---------------------------------------------------
 | Popular feed route
 | ---------------------------------------------------
 | Single popular feed. Should accept requests:
 | GET => feed details
 | POST => throw error
 | PUT => (exist) ? update feed details : throw error
 | DELETE => delete feed
*/
$router->map('/feeds/popular/:id/', function(){});




/*
 | ---------------------------------------------------
 | Articles route
 | ---------------------------------------------------
 | Articles collection. Should accept requests:
 | GET => list articles collection
 | POST => add new article to collection
 | PUT => throw error
 | DELETE => throw error/delete articles collection
 | 
 | Optional reqest parameters:
 | ?limit={int}
 | ?offset={int}
*/
$router->map('/articles', 'Articles', function(){});




/*
 | ---------------------------------------------------
 | Feed route
 | ---------------------------------------------------
 | Single feed. Should accept requests:
 | GET => feed details
 | POST => throw error
 | PUT => (exist) ? update feed detils : throw error
 | DELETE => delete feed
*/
$router->map('/articles/:id', function(){});




/*
 | ---------------------------------------------------
 | Popular Articles route
 | ---------------------------------------------------
 | Popular articles collection. Should accept requests:
 | GET => list popular articles collection
 | POST => add new article to popular articles collection
 | PUT => throw error
 | DELETE => throw error/delete popular articles collection
 | 
 | Optional reqest parameters:
 | ?limit={int}
 | ?offset={int}
*/
$router->map('/articles/popular', function(){});




/*
 | ---------------------------------------------------
 | Popular article route
 | ---------------------------------------------------
 | Single popular article. Should accept requests:
 | GET => article details
 | POST => throw error
 | PUT => (exist) ? update article details : throw error
 | DELETE => delete article
*/
$router->map('/articles/popular/:id', function(){});





/*
 | ---------------------------------------------------
 | Users route
 | ---------------------------------------------------
 | Users collection. Should accept requests:
 | GET => users collection
 | POST => add new user to users collection
 | PUT => throw error
 | DELETE => throw error/delete users collection
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
$router->map('/users/:id', function(){});





/*
 | ---------------------------------------------------
 | User feeds route
 | ---------------------------------------------------
 | User feeds collection. Should accept requests:
 | GET => list user feeds collection
 | POST => add new feed to user feeds collection
 | PUT => throw error
 | DELETE => delete user feeds collection
 | 
 | Optional reqest parameters:
 | ?limit={int}
 | ?offset={int}
*/
$router->map('/users/:id/feeds', function(){});




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
 | DELETE => delete user articles collection
 | 
 | Optional reqest parameters:
 | ?limit={int}
 | ?offset={int}
*/
$router->map('/users/:id/articles', function(){});




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
$router->map('/users/:id/articles/:id', function(){});




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
// echo "<pre>";
// print_r($router->getRoutes());