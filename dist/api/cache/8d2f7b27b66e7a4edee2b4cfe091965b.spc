a:4:{s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"feed";a:1:{i:0;a:6:{s:4:"data";s:52:"
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
";s:7:"attribs";a:1:{s:36:"http://www.w3.org/XML/1998/namespace";a:1:{s:4:"lang";s:5:"en-US";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:5:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:38:"tag:tutorials.tutsplus.com,2005:/posts";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:2:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:29:"http://tutorials.tutsplus.com";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}i:1;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:4:"self";s:4:"type";s:20:"application/atom+xml";s:4:"href";s:40:"http://tutorials.tutsplus.com/posts.atom";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:9:"Tuts+ All";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:20:"2014-05-23T19:00:08Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"entry";a:12:{i:0;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21213";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:99:"http://code.tutsplus.com/tutorials/refactoring-legacy-code-part-5-games-testable-methods--cms-21213";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:57:"Refactoring Legacy Code: Part 5 - Game's Testable Methods";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:21648:"<p>Old code. Ugly code. Complicated code. Spaghetti code. Gibberish nonsense. In two words, <em>Legacy Code</em>. This is a series that will help you work and deal with it.<br></p>

<p>In our previous tutorial, we tested our Runner functions. In this lesson, it is time to continue where we left off by testing our <code>Game</code> class. Now, when you start with such a big chunk of code like we have here, it is tempting to start to test in a top-down manner, method by method. This is, most of the time, impossible. It is much better to start testing it by its short, testable methods. This is what we'll do in this lesson: find and test those methods.</p>

<h2>Creating a Game</h2>

<p>In order to test a class we need to initialize an object of that specific type. We can consider that our first test is to create such a new object. You will be surprised how many secrets constructors can hide.</p>

<pre class="brush: php">require_once __DIR__ . '/../trivia/php/Game.php';

class GameTest extends PHPUnit_Framework_TestCase {

	function testWeCanCreateAGame() {
		$game = new Game();
	}

}</pre>

<p>To our surprise, <code>Game</code> can actually be created quite easily. No problems while running just <code>new Game()</code>. Nothing breaks. This is a very good start, especially considering that <code>Game</code>'s constructor is quite large and it does a lot of things.</p>

<h2>Finding the First Testable Method</h2>

<p>It is tempting to simplify the constructor right now. But we have only the golden master to make sure we do not break anything. Before we go to the constructor, we need to test most of the rest of the class. So, where should we start?</p>

<p>Look for the first method that returns a value and ask yourself, "Can I call and control the return value of this method?". If the answer is yes, it is a good candidate for our test.</p>

<pre class="brush: php">function isPlayable() {
	$minimumNumberOfPlayers = 2;
	return ($this-&gt;howManyPlayers() &gt;= $minimumNumberOfPlayers);
}</pre>

<p>What about this method? It seems like a good candidate. Only two lines and it returns a boolean value. But wait, it calls another method, <code>howManyPlayers()</code>.</p>

<pre class="brush: php">function howManyPlayers() {
	return count($this-&gt;players);
}</pre>

<p>This is basically just a method that counts the elements in the class' <code>players</code> array. OK, so if we do not add any players, it should be zero. <code>isPlayable()</code> should return false. Let's see if our assumption is correct.</p>

<pre class="brush: php">function testAJustCreatedNewGameIsNotPlayable() {
	$game = new Game();
	$this-&gt;assertFalse($game-&gt;isPlayable());
}</pre>

<p>We renamed our previous test method to reflect what we really want to test. Then we just asserted the game is not playable. The test passes. But false positives are common in many cases. So for piece of mind, we can assert true and make sure the test fails.</p>

<pre class="brush: php">$this-&gt;assertTrue($game-&gt;isPlayable());</pre>

<p>And it does!</p>

<pre class="brush: bash">PHPUnit_Framework_ExpectationFailedException :
Failed asserting that false is true.</pre>

<p>So far, pretty promising. We managed to test the method's initial return value, the value represented by the initial <em>state</em> of the <code>Game</code> class. Please note the emphasized word: "state". We need to find a way to control the state of the game. We need to change it, so it will have the minimum number of players.</p>

<p>If we analyze <code>Game</code>'s <code>add()</code> method, we will see that it adds elements to our array.</p>

<pre class="brush: php">array_push($this-&gt;players, $playerName);</pre>

<p>Our assumption is enforced by the way the <code>add()</code> method is used in <code>RunnerFunctions.php</code>.</p>

<pre class="brush: php">function run() {

	$aGame = new Game();
	$aGame-&gt;add("Chet");
	$aGame-&gt;add("Pat");
	$aGame-&gt;add("Sue");

	// ... //
}</pre>

<p>Based on these observations, we can conclude that by using <code>add()</code> twice, we should be able to bring our <code>Game</code> into a state with two players.</p>

<pre class="brush: php">function testAfterAddingTwoPlayersToANewGameItIsPlayable() {
	$game = new Game();
	$game-&gt;add('First Player');
	$game-&gt;add('Second Player');
	$this-&gt;assertTrue($game-&gt;isPlayable());
}</pre>

<p>By adding this second test method, we can ensure <code>isPlayable()</code> returns true, if conditions are met.</p>

<p>But you may think this is not quite a unit test. We use the <code>add()</code> method! We exercise more than the bare minimum of code. We could instead just add the elements to the <code>$players</code> array and not rely on the <code>add()</code> method at all.</p>

<p>Well, the answer is yes and no. We could do that, from a technical point of view. It will have the advantage of direct control over the array. However, it will have the disadvantage of code duplication between code and tests. So, pick one of the bad options that you think you can live with and use that one. I personally prefer to reuse methods like <code>add()</code>.</p>

<h3>Refactoring Tests</h3>

<p>We are on green, we refactor. Can we make our tests better? Well yes, we can. We could transform our first test to verify all conditions of not enough players.</p>

<pre class="brush: php">function testAGameWithNotEnoughPlayersIsNotPlayable() {
	$game = new Game();
	$this-&gt;assertFalse($game-&gt;isPlayable());
	$game-&gt;add('A player');
	$this-&gt;assertFalse($game-&gt;isPlayable());
}</pre>

<p>You may have heard about the concept of, "One assertion per test". I mostly agree with it, but if you have a test that verifies a single concept and requires multiple assertions to do its verification, I think it is acceptable to use more than one assertion. This view is also strongly promoted by Robert C. Martin in his teachings.</p>

<p>But what about our second test method? Is that good enough? I say no.</p>

<pre class="brush: php">$game-&gt;add('First Player');
$game-&gt;add('Second Player');</pre>

<p>These two calls bother me a little. They are a detailed implementation without an explicit explanation in our method. Why not extract them into a private method?</p>

<pre class="brush: php">function testAfterAddingEnoughPlayersToANewGameItIsPlayable() {
	$game = new Game();
	$this-&gt;addEnoughPlayers($game);
	$this-&gt;assertTrue($game-&gt;isPlayable());
}

private function addEnoughPlayers($game) {
	$game-&gt;add('First Player');
	$game-&gt;add('Second Player');
}</pre>

<p>This is much better and it also leads us to another concept that we missed. In both tests, we expressed in one way or another the concept of "enough players". But how much is enough? Is it two? Yes, for now it is. But do we want our test to fail if the <code>Game</code>'s logic will require at least three players? We do not want this to happen. We can introduce a public static class field for it.</p>

<pre class="brush: php">class Game {
	static $minimumNumberOfPlayers = 2;

	// ... //

	function  __construct() {
		// ... //
	}

	function isPlayable() {
		return ($this-&gt;howManyPlayers() &gt;= self::$minimumNumberOfPlayers);
	}

	// ... //
}</pre>

<p>This will allow us to use it in our tests.</p>

<pre class="brush: php">private function addEnoughPlayers($game) {
	for($i = 0; $i &lt; Game::$minimumNumberOfPlayers; $i++) {
		$game-&gt;add('A Player');
	}
}</pre>

<p>Our little helper method will just add players until enough is added. We can even create another such method for our first test, so we add almost enough players.</p>

<pre class="brush: php">function testAGameWithNotEnoughPlayersIsNotPlayable() {
	$game = new Game();
	$this-&gt;assertFalse($game-&gt;isPlayable());
	$this-&gt;addJustNothEnoughPlayers($game);
	$this-&gt;assertFalse($game-&gt;isPlayable());
}

private function addJustNothEnoughPlayers($game) {
	for($i = 0; $i &lt; Game::$minimumNumberOfPlayers - 1; $i++) {
		$game-&gt;add('A player');
	}
}</pre>

<p>But this introduced some duplication. Our two helper methods are fairly similar. Can't we extract a third one from them?</p>

<pre class="brush: php">private function addEnoughPlayers($game) {
	$this-&gt;addManyPlayers($game, Game::$minimumNumberOfPlayers);
}

private function addJustNothEnoughPlayers($game) {
	$this-&gt;addManyPlayers($game, Game::$minimumNumberOfPlayers - 1);
}

private function addManyPlayers($game, $numberOfPlayers) {
	for ($i = 0; $i &lt; $numberOfPlayers; $i++) {
		$game-&gt;add('A Player');
	}
}</pre>

<p>That is better, but it introduces a different problem. We reduced duplication in these methods, but our <code>$game</code> object is now passed down three levels. It is getting difficult to manage. It's time to initialize it in the test's <code>setUp()</code> method and reuse it.</p>

<pre class="brush: php">class GameTest extends PHPUnit_Framework_TestCase {

	private $game;

	function setUp() {
		$this-&gt;game = new Game;
	}

	function testAGameWithNotEnoughPlayersIsNotPlayable() {
		$this-&gt;assertFalse($this-&gt;game-&gt;isPlayable());
		$this-&gt;addJustNothEnoughPlayers();
		$this-&gt;assertFalse($this-&gt;game-&gt;isPlayable());
	}

	function testAfterAddingEnoughPlayersToANewGameItIsPlayable() {
		$this-&gt;addEnoughPlayers($this-&gt;game);
		$this-&gt;assertTrue($this-&gt;game-&gt;isPlayable());
	}

	private function addEnoughPlayers() {
		$this-&gt;addManyPlayers(Game::$minimumNumberOfPlayers);
	}

	private function addJustNothEnoughPlayers() {
		$this-&gt;addManyPlayers(Game::$minimumNumberOfPlayers - 1);
	}

	private function addManyPlayers($numberOfPlayers) {
		for ($i = 0; $i &lt; $numberOfPlayers; $i++) {
			$this-&gt;game-&gt;add('A Player');
		}
	}

}</pre>

<p>Much better. All irrelevant code is in private methods, <code>$game</code> is initialized in <code>setUp()</code> and a lot of pollution was removed from the test methods. However, we did have to make a compromise here. In our first test, we start with an assertion. This presumes that <code>setUp()</code> will always create an empty game. This is OK for now. But at the end of the day, you must realize there is no such thing as perfect code. There is just code with compromises that you are willing to live with.</p>

<h2>The Second Testable Method</h2>

<p>If we are scanning our <code>Game</code> class from the top towards the bottom, the next method on our list is <code>add()</code>. Yes, the same method we used in our tests in the previous paragraph. But can we test it?</p>

<pre class="brush: php">function testItCanAddANewPlayer() {
	$this-&gt;game-&gt;add('A player');
	$this-&gt;assertEquals(1, count($this-&gt;game-&gt;players));
}</pre>

<p>Now this is a different way of testing objects. We call our method and then we verify the object's state. As <code>add()</code> always returns <code>true</code>, there is no way we can test its output. But we can start with an empty <code>Game</code> object and then check if there is a single user after we add one. But is that enough verification?</p>

<pre class="brush: php">function testItCanAddANewPlayer() {
	$this-&gt;assertEquals(0, count($this-&gt;game-&gt;players));
	$this-&gt;game-&gt;add('A player');
	$this-&gt;assertEquals(1, count($this-&gt;game-&gt;players));
}</pre>

<p>Wouldn't it be better to also verify if there are no players before we call <code>add()</code>? Well, it may be a little bit too much here, but as you can see in the code above, we could do it. And whenever you are not sure of the initial state, you should do an assertion on it. This also protects you from future code changes that may change your object's initial state.</p>

<p>But are we testing all of the things the <code>add()</code> method does? I say no. Besides adding a user, it also sets a lot of settings for it. We should also check for those.</p>

<pre class="brush: php">function testItCanAddANewPlayer() {
	$this-&gt;assertEquals(0, count($this-&gt;game-&gt;players));
	$this-&gt;game-&gt;add('A player');
	$this-&gt;assertEquals(1, count($this-&gt;game-&gt;players));
	$this-&gt;assertEquals(0, $this-&gt;game-&gt;places[1]);
	$this-&gt;assertEquals(0, $this-&gt;game-&gt;purses[1]);
	$this-&gt;assertFalse($this-&gt;game-&gt;inPenaltyBox[1]);
}</pre>

<p>This is better. We verify each action that the <code>add()</code> method does. This time, I preferred to directly test the <code>$players</code> array. Why? We could have used the <code>howManyPlayers()</code> method which basically does the same thing, right? Well, in this case we considered that it is more important to describe our assertions by the effects that the <code>add()</code> method has on the state of the object. If we need to change <code>add()</code>, we would expect that the test which is testing its strict behavior, will fail. I've had endless debates with my colleagues at Syneto about this. Especially because this type of testing introduces a strong coupling between the test and how the <code>add()</code> method is actually implemented. So, if you prefer to test it the other way around, that does not mean your ideas are wrong.</p>

<p> We can safely ignore the testing of the output, the <code>echoln()</code> lines. They are just outputting content on the screen. We don't want to touch these methods, yet. Our golden master totally relies on this output.</p>

<h3>Refactoring Tests (Bis)</h3>

<p>We have another tested method with a brand new passing test. It's time to refactor both of them, just a little bit. Let's start with our tests. Aren't the last three assertions a little bit confusing? They don't seem to be related strictly to adding a player. Let's change it:</p>

<pre class="brush: php">function testItCanAddANewPlayer() {
	$this-&gt;assertEquals(0, count($this-&gt;game-&gt;players));
	$this-&gt;game-&gt;add('A player');
	$this-&gt;assertEquals(1, count($this-&gt;game-&gt;players));
	$this-&gt;assertDefaultPlayerParametersAreSetFor(1);
}</pre>

<p>That's better. The method is now more abstract, reusable, expressively named and hides all of the unimportant details.</p>

<h3>Refactoring the <code>add()</code> Method</h3>

<p>We can do something similar with our production code.</p>

<pre class="brush: php">function add($playerName) {
	array_push($this-&gt;players, $playerName);
	$this-&gt;setDefaultPlayerParametersFor($this-&gt;howManyPlayers());

	echoln($playerName . " was added");
	echoln("They are player number " . count($this-&gt;players));
	return true;
}</pre>

<p>We extracted the unimportant details into <code>setDefaultPlayerParametersFor()</code>.</p>

<pre class="brush: php">private function setDefaultPlayerParametersFor($playerId) {
	$this-&gt;places[$playerId] = 0;
	$this-&gt;purses[$playerId] = 0;
	$this-&gt;inPenaltyBox[$playerId] = false;
}</pre>

<p>Actually this idea came to me after I wrote the test. This is another nice example of how tests force us to think about our code from a different point of view. This different angle on the problem, is what we must exploit and let our tests guide our design of the production code.</p>

<h2>The Third Testable Method</h2>

<p>Let's find our third candidate for testing. <code>howManyPlayers()</code> is too simple and indirectly already tested. <code>roll()</code> is too complex to be tested directly. Plus it returns <code>null</code>. <code>askQuestions()</code> seems to be interesting at first sight, but it is all presentation, no return value.</p>

<p><code>currentCategory()</code> is testable, but it is pretty <em>difficult</em> to test. It is a huge selector with ten conditions. We need a ten lines long test and then we need to seriously refactor this method and most certainly the tests as well. We should take note of this method and come back to it after we are finished with the easier ones. For us, this will be in our next tutorial.</p>

<p><code>wasCorrectlyAnswered()</code> is to complicated again. We will need to extract from it, small pieces of code that are testable. However, <code>wrongAnswer()</code> seems promising. It outputs stuff on the screen, but it also changes the state of our object. Let's see if we can control it and test it.</p>

<pre class="brush: php">function testWhenAPlayerEntersAWrongAnswerItIsSentToThePenaltyBox() {
	$this-&gt;game-&gt;add('A player');
	$this-&gt;game-&gt;currentPlayer = 0;
	$this-&gt;game-&gt;wrongAnswer();
	$this-&gt;assertTrue($this-&gt;game-&gt;inPenaltyBox[0]);
}</pre>

<p>Grrr... It was quite hard to write this test method. <code>wrongAnswer()</code> relies on <code>$this-&gt;currentPlayer</code> for its behavioral logic, but it also uses <code>$this-&gt;players</code> in its presentation part. One ugly example of why you should not mix logic and presentation. We will deal with this in a future tutorial. For now, we tested that the user enters the penalty box. We must also observe that there is an <code>if()</code> statement in the method. This is a condition that we do not yet test, as we only have a single player and thus we are not satisfying the condition. We could test for the final value of <code>$currentPlayer</code> though. But adding this line of code to the test will make it fail.</p>

<pre class="brush: php">$this-&gt;assertEquals(1, $this-&gt;game-&gt;currentPlayer);</pre>

<p>A closer look at the private method <code>shouldResetCurrentPlayer()</code> reveals the problem. If the index of the current player equals with the number of players, it will be reset to zero. Aaaahhh! We actually enter the <code>if()</code>!</p>

<pre class="brush: php">function testWhenAPlayerEntersAWrongAnswerItIsSentToThePenaltyBox() {
	$this-&gt;game-&gt;add('A player');
	$this-&gt;game-&gt;currentPlayer = 0;
	$this-&gt;game-&gt;wrongAnswer();
	$this-&gt;assertTrue($this-&gt;game-&gt;inPenaltyBox[0]);
	$this-&gt;assertEquals(0, $this-&gt;game-&gt;currentPlayer);
}

function testCurrentPlayerIsNotResetAfterWrongAnswerIfOtherPlayersDidNotYetPlay() {
	$this-&gt;addManyPlayers(2);
	$this-&gt;game-&gt;currentPlayer = 0;
	$this-&gt;game-&gt;wrongAnswer();
	$this-&gt;assertEquals(1, $this-&gt;game-&gt;currentPlayer);
}</pre>

<p>Good. We created a second test, to test the specific case when there are still players who did not play. We don't care about the <code>inPenaltyBox</code> state for the second test. We are only interested in the index of the current player.</p>

<h2>The Final Testable Method</h2>

<p>The last method we can test and then refactor is <code>didPlayerWin()</code>.</p>

<pre class="brush: php">function didPlayerWin() {
	$numberOfCoinsToWin = 6;
	return !($this-&gt;purses[$this-&gt;currentPlayer] == $numberOfCoinsToWin);
}</pre>

<p>We can immediately observe that its code structure is very similar to <code>isPlayable()</code>, the method we tested first. Our solution should be something similar as well. When your code is so short, only two to three lines, doing more than one tiny step is not that big of a risk. In worst case scenarios, you revert three lines of code. So let's do this in a single step.</p>

<pre class="brush: php">function testTestPlayerWinsWithTheCorrectNumberOfCoins() {
	$this-&gt;game-&gt;currentPlayer = 0;
	$this-&gt;game-&gt;purses[0] = Game::$numberOfCoinsToWin;
	$this-&gt;assertTrue($this-&gt;game-&gt;didPlayerWin());
}</pre>

<p>But wait! That fails. How is that possible? Shouldn't it pass? We provided the correct number of coins. If we study our method, we'll discover a little misleading fact.</p>

<pre class="brush: php">return !($this-&gt;purses[$this-&gt;currentPlayer] == $numberOfCoinsToWin);</pre>

<p>The return value is actually negated. So the method is not telling us if a player won, it tells us if a player did not win the game. We could go in and find the places where this method is used and negate its value there. Then change its behavior here, to not falsely negate the answer. But it is used in <code>wasCorrectlyAnswered()</code>, a method we can not yet unit test. Maybe for the time being, a simple renaming to highlight the correct functionality will be enough.</p>

<pre class="brush: php">function didPlayerNotWin() {
	return !($this-&gt;purses[$this-&gt;currentPlayer] == self::$numberOfCoinsToWin);
}</pre>

<h2>Thoughts &amp; Conclusion</h2>

<p>So this about wraps up the tutorial. While we do not like the negation in the name, this is a compromise we can make at this point. This name will surely change when we start refactoring other parts of the code. Additionally, if you take a look at our tests, they look odd now:</p>

<pre class="brush: php">function testTestPlayerWinsWithTheCorrectNumberOfCoins() {
	$this-&gt;game-&gt;currentPlayer = 0;
	$this-&gt;game-&gt;purses[0] = Game::$numberOfCoinsToWin;
	$this-&gt;assertFalse($this-&gt;game-&gt;didPlayerNotWin());
}</pre>

<p>By testing false on a negated method, exercised with a value that suggests a true result, we introduced quite a lot of confusion to our codes readability. But this is good for now, as we do need to stop at some point, right?</p>

<p>In our next tutorial, we will start working on some of the more difficult methods within the <code>Game</code> class. Thank you for reading.</p><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21213/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21213/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21213/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21213/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-23T19:00:08.451Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-23T19:00:08.451Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:12:"Patkos Csaba";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:1;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21196";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:91:"http://code.tutsplus.com/tutorials/ios-fundamentals-frames-bounds-and-cggeometry--cms-21196";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:48:"iOS Fundamentals: Frames, Bounds, and CGGeometry";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:12447:"<p>Working with <code class="inline">CGPoint</code>, <code class="inline">CGSize</code>, and <code class="inline">CGRect</code>&nbsp;structures isn't difficult if you're used to a language that supports the dot syntax. However, programmatically positioning views or writing drawing code is verbose and can become difficult to read.</p><p>In this tutorial, I'd like to clear out a few misconceptions about frames and bounds, and introduce you to <b>CGGeometry</b>, a collection of structures, constants, and functions that make working with <code class="inline">CGPoint</code>, <code class="inline">CGSize</code>, and <code class="inline">CGRect</code>&nbsp;that much easier.<br></p><h2><span class="sectionnum">1.</span> Data Types</h2><p>If you're new to iOS or OS X development, you may be wondering what <code class="inline">CGPoint</code>, <code class="inline">CGSize</code>, and <code class="inline">CGRect</code> structures are. The CGGeometry Reference defines a number of geometric primitives or structures and the ones we are interested in are <code class="inline">CGPoint</code>, <code class="inline">CGSize</code>, and <code class="inline">CGRect</code>.</p><p>As most of you probably know,&nbsp;<code class="inline">CGPoint</code> is a C structure that defines a point in a coordinate system. The origin of this coordinate system is at the top left on iOS and at the bottom left on OS X. In other words, the orientation of its vertical axis differs on iOS and OS X.<br></p><p><code class="inline">CGSize</code> is another simple C structure that defines a width and a height value, and <code class="inline">CGRect</code> has an <code class="inline">origin</code> field, a <code class="inline">CGPoint</code>, and a <code class="inline">size</code> field, a <code class="inline">CGSize</code>. Together the <code class="inline">origin</code> and <code class="inline">size</code> fields define the position and size of a rectangle.</p><p>The CGGeometry Reference also defines other types, such as <code class="inline">CGFloat</code> and <code class="inline">CGVector</code>. <code class="inline">CGFloat</code> is nothing more than a <code class="inline">typedef</code> for <code class="inline">float</code>&nbsp;or <code class="inline">double</code>, depending on the architecture the application runs on, 32-bit or 64-bit.</p><h2><span class="sectionnum">2.</span>&nbsp;Frames and Bounds</h2><p>The first thing I want to clarify is the difference between a view's <code class="inline">frame</code> and its <code class="inline">bounds</code>, because this is something that trips up a lot of beginning iOS developers. The difference isn't difficult though.</p><p>On iOS and OS X, an application has multiple coordinate systems. On iOS, for example, the application's window is positioned in the screen's coordinate system and every subview of the window is positioned in the window's coordinate system. In other words, the subviews of a view are always positioned in the view's coordinate system.</p><h3>Frame<br></h3><p>As the documentation clarifies, the <code class="inline">frame</code> of a view is a structure, a <code class="inline">CGRect</code>, that defines the size of the view and its position in the view's superview, the superview's coordinate system. Take a look at the following diagram for clarification.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/41/posts/21196/image/figure-1.jpg"></figure><h3>Bounds<br></h3><p>The <code class="inline">bounds</code>&nbsp;property of a view defines the size of the view and its position in the view's own coordinate system. This means that in most cases the origin of the bounds of a view are set to <code class="inline">{0,0}</code>&nbsp;as shown in the following diagram. The view's <code class="inline">bounds</code> is important for drawing the view.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/41/posts/21196/image/figure-2.jpg"></figure><p>When the <code class="inline">frame</code>&nbsp;property of a view is modified, the view's <code class="inline">center</code>&nbsp;and/or&nbsp;<code class="inline">bounds</code>&nbsp;are also modified.</p><h2><span class="sectionnum">3.</span> CGGeometry Reference</h2><h3>Convenient Getters</h3><p>As I mentioned earlier, the CGGeometry Reference is a collection of structures, constants, and functions that make it easier to work with coordinates and rectangles. You may have run into code snippets similar to this:</p><pre class="brush: objc">CGPoint point = CGPointMake(self.view.frame.origin.x + self.view.frame.size.width, self.view.frame.origin.y + self.view.frame.size.height);</pre><p>Not only is this snippet hard to read, it's also quite verbose. We can rewrite this code snippet using two convenient functions defined in the CGGeometry Reference.</p><pre class="brush: objc">CGRect frame = self.view.frame;
CGPoint point = CGPointMake(CGRectGetMaxX(frame), CGRectGetMaxY(frame));</pre><p>To simplify the above code snippet, we store the view's <code class="inline">frame</code> in a variable named <code class="inline">frame</code> and use <code class="inline">CGRectGetMaxX</code> and <code class="inline">CGRectGetMaxY</code>. The names of the functions are self-explanatory.</p><p>The CGGeometry Reference defines functions to return the smallest and largest values for the x- and y-coordinates of a rectangle as well as the x- and y-coordinates that lie at the rectangle's center. Two other convenient getter functions are <code class="inline">CGRectGetWidth</code> and&nbsp;<code class="inline">CGRectGetHeight</code>.<br></p><h3>Creating Structures</h3><p>When it comes to creating <code class="inline">CGPoint</code>, <code class="inline">CGSize</code>, and <code class="inline">CGRect</code> structures, most of us use&nbsp;<code class="inline">CGPointMake</code> and its cousins. These functions are also defined in the CGGeometry Reference. Even though their implementation is surprisingly easy, they are incredibly useful and make you write less code. For example, this is how <code class="inline">CGRectMake</code> is actually implemented:</p><pre class="brush: c">CGRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
  CGRect rect;
  rect.origin.x = x; rect.origin.y = y;
  rect.size.width = width; rect.size.height = height;
  return rect;
}</pre><h3>Modifying Rectangles</h3><p>The functions we've covered so far are pretty well known among iOS developers and help us write less code that is more readable. However, the CGGeometry Reference also defines a number of other functions that are less known. For example, the CGGeometry Reference defines half a dozen functions for modifying <code class="inline">CGRect</code> structures. Let's take a look at a few of these functions.</p><h4><code class="inline">CGRectUnion</code></h4><p><code class="inline">CGRectUnion</code> accepts two <code class="inline">CGRect</code> structures and returns the smallest possible rectangle that contains both rectangles. This may sound trivial and I'm sure you can easily accomplish the same task with a few lines of code, but CGGeometry is all about providing you with a few dozen functions that make your code cleaner and more readable.</p><p>If you add the following code snippet to a view controller's <code class="inline">viewDidLoad</code> method, you should get the following result in the iOS Simulator. The gray rectangle is the result of using&nbsp;<code class="inline">CGRectUnion</code>.</p><pre class="brush: objc">// CGRectUnion
CGRect frame1 = CGRectMake(80.0, 100.0, 150.0, 240.0);
CGRect frame2 = CGRectMake(140.0, 240.0, 120.0, 120.0);
CGRect frame3 = CGRectUnion(frame1, frame2);

UIView *view1 = [[UIView alloc] initWithFrame:frame1];
[view1 setBackgroundColor:[UIColor redColor]];

UIView *view2 = [[UIView alloc] initWithFrame:frame2];
[view2 setBackgroundColor:[UIColor orangeColor]];

UIView *view3 = [[UIView alloc] initWithFrame:frame3];
[view3 setBackgroundColor:[UIColor grayColor]];

[self.view addSubview:view3];
[self.view addSubview:view2];
[self.view addSubview:view1];</pre><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/41/posts/21196/image/figure-3.jpg"></figure><h4><code class="inline">CGRectDivide</code></h4><p>Another useful function is <code class="inline">CGRectDivide</code>, which lets you divide a given rectangle into two rectangles. Take a look at the following code snippet and screenshot to see how it's used.</p><pre class="brush: objc">// CGRectDivide
CGRect frame = CGRectMake(10.0, 50.0, 300.0, 300.0);
CGRect part1;
CGRect part2;
CGRectDivide(frame, &amp;part1, &amp;part2, 100.0, CGRectMaxYEdge);

UIView *view1 = [[UIView alloc] initWithFrame:frame];
[view1 setBackgroundColor:[UIColor grayColor]];

UIView *view2 = [[UIView alloc] initWithFrame:part1];
[view2 setBackgroundColor:[UIColor orangeColor]];

UIView *view3 = [[UIView alloc] initWithFrame:part2];
[view3 setBackgroundColor:[UIColor redColor]];

[self.view addSubview:view1];
[self.view addSubview:view2];
[self.view addSubview:view3];</pre><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/41/posts/21196/image/figure-4.jpg"></figure><p>If you were to calculate the red and orange rectangle without using <code class="inline">CGRectDivide</code>, you'd end up with a few dozen lines of code. Give it a try if you don't believe me.</p><h3>Comparison and Containment</h3><p>Comparing geometric structure and checking for membership is very easy with the following six functions:</p><ul><li><code class="inline">CGPointEqualToPoint</code></li><li><code class="inline">CGSizeEqualToSize</code></li><li><code class="inline">CGRectEqualToRect</code></li><li><code class="inline">CGRectIntersectsRect</code></li><li><code class="inline">CGRectContainsPoint</code></li><li><code class="inline">CGRectContainsRect</code></li></ul><p>The CGGeometry Reference has a few other gems, such as&nbsp;<code class="inline">CGPointCreateDictionaryRepresentation</code> for converting a CGPoint structure to a&nbsp;<code class="inline">CFDictionaryRef</code>, and&nbsp;<code class="inline">CGRectIsEmpty</code>&nbsp;to check if a rectangle's width and height are equal to <code class="inline">0.0</code>. Read the <a href="https://developer.apple.com/library/mac/documentation/graphicsimaging/reference/CGGeometry/Reference/reference.html" target="_self">documentation of the CGGeometry Reference</a> to find out more.</p><h2><span class="sectionnum">4.</span> Bonus: Logging</h2><p>Logging structures to Xcode's console is cumbersome without a few helper functions. Luckily, the UIKit framework defines a handful of functions that make this very easy to do. I use them all the time. Take a look at the following code snippet to see how they work. It's no rocket science.</p>























<pre class="brush: objc">CGPoint point = CGPointMake(10.0, 25.0);
CGSize size = CGSizeMake(103.0, 223.0);
CGRect frame = CGRectMake(point.x, point.y, size.width, size.height);
NSLog(@"\n%@\n%@\n%@", NSStringFromCGPoint(point), NSStringFromCGSize(size), NSStringFromCGRect(frame));</pre><p>There are also convenience functions for logging affine transforms (<code class="inline">NSStringFromCGAffineTransform</code>), edge insets structs (<code class="inline">NSStringFromUIEdgeInsets</code>), and offset structs (<code class="inline">NSStringFromUIOffset</code>).</p><h2>Conclusion</h2><p>The iOS SDK contains a lot of gems many developers don't know about. I hope I've convinced you of the usefulness of the <a href="https://developer.apple.com/library/mac/documentation/graphicsimaging/reference/CGGeometry/Reference/reference.html" target="_self">CGGeometry Reference</a>. Once you start using its collection of functions, you'll start wondering how you used to manage without it.</p><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21196/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21196/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21196/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21196/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-23T18:45:13.627Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-23T18:45:13.627Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:11:"Bart Jacobs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:2;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-20861";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:123:"http://gamedevelopment.tutsplus.com/tutorials/build-arkanoid-with-unity-block-mechanics-prefabs-and-level-design--cms-20861";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:69:"Build Arkanoid With Unity: Block Mechanics, Prefabs, and Level Design";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:16728:"<figure class="final-product final-product--image"><img src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/262/posts/20861/final_image/FinalProduct.jpg" alt="Final product image" /><figcaption>What You'll Be Creating</figcaption></figure><p>In this tutorial series, we'll show you how to recreate the classic Arkanoid (or Breakout) game in Unity, using Unity's native 2D tools. In each post, we'll focus on a specific part of the game; in this post, we'll handle the block mechanics and the creation of Prefabs.<br></p><h2>Where We Left Off	</h2><p>In the previous tutorials, you <a href="https://gamedevelopment.tutsplus.com/tutorials/build-arkanoid-with-unity-project-setup--cms-20767" target="_self">set up the project</a> and <a href="https://gamedevelopment.tutsplus.com/tutorials/build-arkanoid-with-unity-player-and-ball-mechanics--cms-20860" target="_self">coded the behaviors of the paddle and ball</a>. If you haven't completed the previous tutorials yet, we strongly recommend you do so before continuing.</p><h2>Final Preview</h2><p>Take a look at this demo to see what we're aiming for across the whole series:<br></p><figure><iframe src="https://tutsplus.github.io/build-arkanoid-with-unity/Part4/playable_web_demo/ArkanoidTutorialPart4.html" width="600" height="400" frameborder="0" scrolling="no"></iframe></figure><p>And here's what we'll have at the end of this post:</p><figure><iframe src="https://tutsplus.github.io/build-arkanoid-with-unity/Part3/playable_web_demo/ArkanoidTutorialPart3.html" width="600" height="400" frameborder="0" scrolling="no"></iframe></figure><h2>Creating the Block Script<br></h2><p>Right now, almost all of the base mechanics are ready. The missing part is related to the block object. Since blocks are an important and active part of the game, we need to create a custom script for it.&nbsp;<br></p><p>The block script must contain information regarding:<br></p><ul><li>Total hits that it can handle.</li><li>Points to award upon breaking.</li></ul><p>(Note that the number of hits and points can change according to the block color.)&nbsp;Based on this, let's give the block three variables:<br></p><ul><li>A variable to store the number of hits the block can take.</li><li>A variable to store the score value of the block.</li><li>A variable to store the number of times the block has <i>already</i> been hit.</li></ul><p>The first two will be <code class="inline">public</code>, since you may want to modify their values in the editor. The third will be <code class="inline">private</code>, since it is for internal use only.&nbsp;</p><p>Thus, create a new script called&nbsp;<code class="inline">BlockScript</code>. Define those variables and&nbsp;initialise&nbsp;the number of hits to <code class="inline">0</code>:</p><pre class="brush: csharp">public class BlockScript : MonoBehaviour {

    public int hitsToKill:
	public int points;
	private int numberOfHits;

	// Use this for initialization
	void Start () {
		numberOfHits = 0;
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}</pre><p>The next step is to detect when the balls hit a block. When this collision occurs, we check whether the block has been hit enough times to be destroyed, or whether it's still intact. For that, we can use a specific method called <code class="inline">OnCollisionEnter2D</code>, which is called every time that a collision occurs to your object.</p><p>To check whether this collision is between the ball and the block, we must <i>tag</i> the ball object. In the editor, select the ball from the <b>Hierarchy</b> tab and then the <b>Inspector</b>. On the top of the <b>Inspector</b>, just under the game object name, there is a field called <b>Tag</b> that is currently defined as <code class="inline">Untagged</code>.&nbsp;Click the button, and a drop-down menu will pop up with the different tag possibilities:</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/262/posts/20861/image/02.png"></figure><p>We want a specific tag for the ball, so hit <b>Add Tag</b> to create a new tag. Once you press the option a new interface appears:</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/262/posts/20861/image/03.png"></figure><p>For this tutorial, we will only focus on the <b>Element 0</b> property. This defines the name of the tag, so type the name <code class="inline">Ball</code>&nbsp;into it.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/262/posts/20861/image/04.png"></figure><p>Now that you have the new <code class="inline">Ball</code> tag, change the ball object's tag to <code class="inline">Ball</code>.</p><p><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/262/posts/20861/image/05.png"><br></p><p>Open the <code class="inline">BlockScript</code> file so we can code the <code class="inline">OnCollisionEnter2D</code>&nbsp;method. To identify the ball game object, check whether the game object tag is <code class="inline">Ball</code>; if so, then the collision was between the block and the ball. Add the following code to your script.</p><pre class="brush: csharp">    void OnCollisionEnter2D(Collision2D collision){

		if (collision.gameObject.tag == "Ball"){

        }
	}</pre><p>Now you can detect collisions with the ball. Upon every collision, we want to increase the record of the number of times the block got hit and, if the number the times the block got hit is the same as the maximum number of hits the block can take, destroy the block. For the latter, we can use the <a href="https://docs.unity3d.com/Documentation/ScriptReference/Object.Destroy.html" target="_self">Destroy</a> method.</p><p>&nbsp;The updated <code class="inline">OnCollisionEnter2D</code> to do this looks like the following:</p><pre class="brush: csharp">    void OnCollisionEnter2D(Collision2D collision){

		if (collision.gameObject.tag == "Ball"){
			numberOfHits++;

			if (numberOfHits == hitsToKill){
				// destroy the object
				Destroy(this.gameObject);
			}
		}
	}</pre><p>Now add the <code class="inline">BlockScript</code> to the <b>Ball</b> object (<b>Hierarchy &gt; Inspector &gt; Add Component</b>):</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/262/posts/20861/image/06.png"></figure><p>It is now time to check that everything is fine. Change the <b>Hits To Kill</b>&nbsp;value in the editor to <code class="inline">1</code> and <b>Play</b> the game. When the ball hit the block, the block should disappear.</p><h2>	Creating a Prefab</h2><p>Now that the block mechanics are ready, we will populate the level. Since you will use several blocks for this, this is a good time to introduce Unity's <i>Prefabs</i>.&nbsp;</p><p>A Prefab is a reusable game object that can be inserted several times in the same scene. Basically, this means that if you want, for example, to change the value of points of the blue blocks, you don't have to do it to every single blue block on the scene: if you have a Prefab of a blue block, you just adjust the Prefab value and all the blocks on the scene will be updated.</p><p>To create a Prefab for the blue blocks, start by renaming the <b>Block</b> object to <b>Blue Block</b>. Next, create a new folder in the <b>Assets</b> folder called <b>Prefabs</b>. Now, drag the <b>Blue Blocks</b> object inside the new folder.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/262/posts/20861/image/07.png"></figure><p>As you may have noticed, the cube icon on the top of the <b>Inspector</b> is now blue. Also, the name of the game object in the scene <b>Hierarchy</b> is also blue. This means that the block is now a Prefab. Quite simple, isn't it? From now on, selecting the Prefab and changing its values will apply every change you make to the parameters of all our blue blocks.</p><p>To test the Prefab, drag it from the folder to our <b>Hierarchy</b> tab. As you can see, now we have two blue blocks, but they share the same position, which was defined by the Prefab.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/262/posts/20861/image/08.png"></figure><p>To have the two blocks in different positions, just select one of them from the <b>Hierarchy</b> tab and move it around the scene. This way, you change the values of that specific copy of the block and not all of the blocks.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/262/posts/20861/image/09.jpg"></figure><p>You can <b>Play</b> the game and test the Prefabs.</p><h2>	Recreating Prefabs</h2><p>Now you will create the remaining Prefabs for the other blocks (green, yellow, and red). The main steps for each one are:</p><ol><li>Create a new Sprite.</li><li>Add the corresponding image.</li><li>Add a Box Collider 2D.</li><li>Add the BlockScript.</li><li>Name it accordingly.</li><li>Create a Prefab.</li></ol><p>In the end you should have four different Prefabs (one for each type of block):</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/262/posts/20861/image/10.png"></figure><p>In order to make the gameplay more interesting, change the <b>Hits To Kill</b> for each type of block like so:</p><ul><li>Blue: <code class="inline">1</code> hit.</li><li>Green: <code class="inline">2</code> hits.</li><li>Yellow: <code class="inline">3</code> hits.</li><li>Red: <code class="inline">4</code> hits.</li></ul><p>Add some blocks and <b>Play</b> the game; check that everything is running as expected.</p><h2>	Level Design</h2><p>It is now time to create your first level. Using the Prefabs, populate the game area with several blocks. If you have been placing as many blocks as we did, your <b>Hierarchy</b> tab is probably overpopulated with block game objects! In order to keep your project well&nbsp;organised, let's create empty game objects for the four types of blocks, and then group the blocks by color:</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/262/posts/20861/image/11.png"></figure><p>At this point, your game is almost ready, your basic mechanics are implemented, and it should look similar to the next figure:</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/262/posts/20861/image/12.jpg"></figure><h2>	Score and Lives System</h2><p>The score and life system is one way to test the players and introduce new dynamics into games. At this point, your game don't have any way for players to progress or lose. Let's change that now.&nbsp;</p><p>Open the <code class="inline">PlayerScript</code> and add two variables: one for score, and one for the number of lives the player has. We'll let the player start the game with three lives and no points:</p><pre class="brush: csharp">private int playerLives;
    private int playerPoints;

	// Use this for initialization
	void Start () {
		// get the initial position of the game object
		playerPosition = gameObject.transform.position;

		playerLives = 3;
		playerPoints = 0;

	}</pre><p>We need a method that increases the number of points the player has every time they destroy a block. Create a new method called <code class="inline">addPoints</code>&nbsp;to do this:</p><pre class="brush: csharp">void addPoints(int points){
    playerPoints += points;
}</pre><p>Now we have the new method that is expecting a value—but how it will receive it? There are too many blocks to make references to the player's paddle object in each...&nbsp;</p><p>The best way to solve this is to send a message from the block object to the paddle object.&nbsp;How we do that? Well, first you need to tag the paddle (<b>Hierarchy &gt; Inspector &gt; Tag</b>) with the <b>Player</b> tag.</p><p><br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/262/posts/20861/image/13.png"></figure><p>With the paddle tagged, it's time to move to the block script, where we will change the method <code class="inline">OnCollisionEnter2D</code> to send the points to the player object: before the block is destroyed, we'll search for a game object with the <code class="inline">Player</code> tag using the <code class="inline">FindGameObjectsWithTag</code> method; this will return an array of matching object, ans since there's only one object with that tag, we know that the object in position 0 of the returned array is the player's paddle object.</p><p>Now that you have your player reference, you can send it a message using the <code class="inline">SendMessage</code> method. With this, you can call a specific method of the player object—in this case, the <code class="inline">addPoints</code> method.&nbsp;</p><p>The next snippet shows you how all this works:</p><pre class="brush: csharp">void OnCollisionEnter2D(Collision2D collision){

    if (collision.gameObject.tag == "Ball"){
		numberOfHits++;

		if (numberOfHits == hitsToKill){
			// get reference of player object
			GameObject player = GameObject.FindGameObjectsWithTag("Player")[0];

			// send message
			player.SendMessage("addPoints", points);

			// destroy the object
			Destroy(this.gameObject);
		}
	}
}</pre><p>The next thing we need to do is edit the Prefabs and give specific point values to each block type. You can use the following values:</p><ul><li>Blue: <code class="inline">10</code> points;</li><li>Green: <code class="inline">20</code> points;</li><li>Yellow: <code class="inline">35</code> points;</li><li>Red: <code class="inline">50</code> points;</li></ul><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/262/posts/20861/image/14.png"></figure><p>Now, let's show these points and lives in the game interface. In the player script, create a method called <code class="inline">OnGUI</code>. This method will present the GUI of your game; it is one of the basic methods to present information in the gaming area. (Note the case-sensitive characters).</p><p>To present the points and lives, we need to create a <code class="inline">Label</code> with the desired text. In the <code class="inline">PlayerScript</code>, add the <code class="inline">OnGUI</code> method, and create this label&nbsp;in it:</p><pre class="brush: csharp">void OnGUI(){
    GUI.Label (new Rect(5.0f,3.0f,200.0f,200.0f),"Live's: " + playerLives + "  Score: " + playerPoints);
}</pre><p>You can now <b>Play</b> the game and the label will be presented in the top left part of the screen. However, you have not yet programmed the lives and points display to update accordingly!&nbsp;</p><p>Using the same <code class="inline">PlayerScript</code>, add the following <code class="inline">TakeLife</code>&nbsp;method. The method will only subtract one life from the player pool each time it is called:</p><pre class="brush: csharp">void TakeLife(){
    playerLives--;
}</pre><p>Finally, move to the <code class="inline">BallScript</code>, and, in the section where you check if the ball has fallen off the screen, send a message to the player object with the <code class="inline">TakeLife</code> method. The complete snippet is presented below:</p><pre class="brush: csharp">// Check if ball falls
    if (ballIsActive &amp;&amp; transform.position.y &lt; -6) {
		ballIsActive = !ballIsActive;
		ballPosition.x = playerObject.transform.position.x;
		ballPosition.y = -4.2f;
		transform.position = ballPosition;
				
		rigidbody2D.isKinematic = true;

		// New code - Send Message
		playerObject.SendMessage("TakeLife");
	}</pre><p>Play your game and verify that the score and lives system works as expected.<br></p><h2>Next Time</h2><p>This concludes the third post in the series. The basic game mechanics are all in place, so next time we'll add audio and new levels, and deploy the finished game.</p><p>If you have any questions or feedback on what we've covered so far, feel free to leave a comment below.</p><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/20861/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20861/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20861/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20861/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-23T17:00:11.535Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-23T17:00:11.535Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:33:"Orlando Pereira and Pedro Pereira";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:3;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-20340";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:87:"http://code.tutsplus.com/tutorials/taxonomy-archives-list-posts-by-post-type--cms-20340";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:42:"Taxonomy Archives: List Posts by Post Type";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:11517:"<figure class="final-product final-product--image"><img src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/227/posts/20340/final_image/creating-taxonomy-archive-to-list-by-post-type-final-archive.jpg" alt="Final product image" /><figcaption>What You'll Be Creating</figcaption></figure><p>In an <a href="https://webdesign.tutsplus.com/tutorials/create-a-post-type-archive-to-list-posts-by-taxonomy-terms--cms-20045" target="_self">earlier tutorial</a>, I demonstrated how to create a taxonomy archive which lists posts by taxonomy term.</p><p>This tutorial is similar in that it shows you how to separate out posts in your archives, but it uses a different structure and a different template file. What I'll show you how to do here is to create an archive template for a taxonomy which lists posts by post type.</p><p>This might be useful if you have registered a post type which you want to keep separate from normal posts or from another post type, but have a taxonomy which applies to both. For example, if you're listing books and articles as different post types, but will have common topics as your taxonomy (e.g. WordPress!).</p><p>In the example I'll use here, I'll work with the 'animals' post type as I did in the previous tutorial, but this time I'll also be working with normal posts. I'll list animals with the queried term first and then I'll list blog posts with that term.</p><h2>1. Getting Started: Creating the Theme<br></h2><p>I'll create a theme which is a child theme of twentyfourteen, so if you're using the source files for this tutorial you'll also need that theme installed in your site. In my theme's stylesheet, I add the following:</p><pre class="brush: css">/*
Theme Name:     WPTutsPlus Creating a Taxonomy Archive to List Posts by Post Type
Theme URI:      http://rachelmccollin.co.uk/wptutsplus-tax-archive-by-post-type/
Description:    Theme to support WPTutsPlus tutorial on creating a custom taxonomy archive. Child theme for the Twenty Fourteen theme.
Author:         Rachel McCollin
Author URI:     http://rachelmccollin.co.uk/
Template:       twentyfourteen
Version:        1.0
*/

@import url("../twentyfourteen/style.css");</pre><p>That's all I need to add to create my child theme. If you're using your own theme, you can skip this step.</p><h2>2. Registering the Post Type and Taxonomy<br></h2><p><i>Note: If you followed my other tutorial about creating a custom post type archive template, you can use the theme you created for that as it uses the same post types and taxonomy. You'll just need to make one tweak which I'll highlight in this section, and add a new template file for the taxonomy archive.</i></p><p>The next step is to register the 'animal' post type and a 'animal family' taxonomy. Create a <code class="inline">functions.php</code> file for your theme and firstly add the function to register the post type:</p><pre class="brush: php">// register a custom post type called 'animals'
function wptp_create_post_type() {
    $labels = array( 
		'name' =&gt; __( 'Animals' ),
		'singular_name' =&gt; __( 'animal' ),
		'add_new' =&gt; __( 'New animal' ),
		'add_new_item' =&gt; __( 'Add New animal' ),
		'edit_item' =&gt; __( 'Edit animal' ),
		'new_item' =&gt; __( 'New animal' ),
		'view_item' =&gt; __( 'View animal' ),
		'search_items' =&gt; __( 'Search animals' ),
		'not_found' =&gt;  __( 'No animals Found' ),
		'not_found_in_trash' =&gt; __( 'No animals found in Trash' ),
	);
	$args = array(
		'labels' =&gt; $labels,
		'has_archive' =&gt; true,
		'public' =&gt; true,
		'hierarchical' =&gt; false,
		'supports' =&gt; array(
			'title', 
			'editor', 
			'excerpt', 
			'custom-fields', 
			'thumbnail',
			'page-attributes'
		),
		'taxonomies' =&gt; array( 'post_tag', 'category'), 
	);
	register_post_type( 'animal', $args );
} 
add_action( 'init', 'wptp_create_post_type' );</pre><p>Next below that step, register the aminal family taxonomy.</p><p><i>If you're working with the theme created in the earlier tutorial, you'll need to add <code class="inline">array('animal,'post')</code> to your arguments for the function, intend of just <code class="inline">'animal'</code>.</i></p><pre class="brush: php">// register a taxonomy called 'Animal Family'
function wptp_register_taxonomy() {
    register_taxonomy( 'animal_cat', array( 'animal', 'post' ),
		array(
			'labels' =&gt; array(
				'name'              =&gt; 'Animal Families',
				'singular_name'     =&gt; 'Animal Family',
				'search_items'      =&gt; 'Search Animal Families',
				'all_items'         =&gt; 'All Animal Families',
				'edit_item'         =&gt; 'Edit Animal Families',
				'update_item'       =&gt; 'Update Animal Family',
				'add_new_item'      =&gt; 'Add New Animal Family',
				'new_item_name'     =&gt; 'New Animal Family Name',
				'menu_name'         =&gt; 'Animal Family',
			),
			'hierarchical' =&gt; true,
			'sort' =&gt; true,
			'args' =&gt; array( 'orderby' =&gt; 'term_order' ),
			'rewrite' =&gt; array( 'slug' =&gt; 'animal-family' ),
			'show_admin_column' =&gt; true
		)
	);
}
add_action( 'init', 'wptp_register_taxonomy' );</pre><p>Save your functions file and you'll find your new post type and taxonomy appear in your site admin.</p><p>Now add some data - I've added some animals and posts to the 'Canines' family.</p><h2>3. Creating the Archive Template<br></h2><p>Now create a file called <code class="inline">taxonomy-animal_cat.php</code>. This will be the archive template for the new taxonomy.</p><p>Copy the wrapper code from your theme to this file so it has elements and classes in common with the rest of your theme. I'm copying from twentyfourteen - if you're using your own theme, copy from that. Copy everything except the heading and the loop, and add some comments at the top to remind you what this file is for:</p><pre class="brush: php">&lt;?php
/*
WpTutsPlus tutorial for creating archive to display posts by taxonomy term
Archive template for animal_cat taxonomy
*/
?&gt;

&lt;?php get_header(); ?&gt;

&lt;div id="main-content" class="main-content"&gt;

    &lt;div id="primary" class="content-area"&gt;
		&lt;div id="content" class="site-content" role="main"&gt;

			
			
		&lt;/div&gt;&lt;!-- #content --&gt;
	&lt;/div&gt;&lt;!-- #primary --&gt;
	&lt;?php get_sidebar( 'content' ); ?&gt;
&lt;/div&gt;&lt;!-- #main-content --&gt;

&lt;?php
get_sidebar();
get_footer();</pre><h2>4. Identifying the Queried Object<br></h2><p>So that you can display the name of the term being queried and define your queries in the two loops you'll be creating, you need to identify the queried object and save it as a variable.</p><p>Add the following somewhere near the top of your archive template (I'm adding it below the <code class="inline">get_header()</code> call):</p><pre class="brush: php">&lt;?php
// get the currently queried taxonomy term, for use later in the template file
$term = get_queried_object();
?&gt;</pre><p>You'll be using that in the next&nbsp;step.</p><h2>5. Outputting the Archive Heading<br></h2><p>Before adding your loops, you need to output a heading for your archive page. Inside the opening of the <code class="inline">#content</code> div, add the code below:</p><pre class="brush: php">&lt;header class="archive-header"&gt;
    &lt;h1 class="archive-title"&gt;
		&lt;?php echo $term-&gt;name; ?&gt;
		&lt;?php //post_type_archive_title(); ?&gt;
	&lt;/h1&gt;
&lt;/header&gt;&lt;!-- .archive-header --&gt;</pre><h2>6. The First Loop<br></h2><p>Below the heading, you need to add your first loop, using <code class="inline">WP_Query</code> as you'll need to define the arguments.&nbsp;</p><p>First define the query:</p><pre class="brush: php">// Define the query
$args = array(
    'post_type' =&gt; 'animal',
	'animal_cat' =&gt; $term-&gt;slug
);
$query = new WP_Query( $args );</pre><p>Note that this uses the<code class="inline">$term</code> variable you've already defined.</p><p>And then add the loop, outputting a link to each animal in an unordered list:</p><pre class="brush: php">if ($query-&gt;have_posts()) {
    	
	// output the term name in a heading tag				
	echo'&lt;h2&gt;Animals in the ' . $term-&gt;name . ' Family&lt;/h2&gt;';
	
	// output the post titles in a list
	echo '&lt;ul&gt;';
	
		// Start the Loop
		while ( $query-&gt;have_posts() ) : $query-&gt;the_post(); ?&gt;

		&lt;li class="animal-listing" id="post-&lt;?php the_ID(); ?&gt;"&gt;
			&lt;a href="&lt;?php the_permalink(); ?&gt;"&gt;&lt;?php the_title(); ?&gt;&lt;/a&gt;
		&lt;/li&gt;
		
		&lt;?php endwhile;
		
		echo '&lt;/ul&gt;';
		
} // end of check for query having posts
	
// use reset postdata to restore orginal query
wp_reset_postdata();

?&gt;</pre><p>It's important to include two things here:</p><ul><li>A check that the query has posts - you don't want to output a heading with no list beneath it.</li><li><code class="inline">wp_reset_postdata()</code> to reset the query - you must always use this with <code class="inline">WP_Query</code>.</li></ul><h2>7. The Second Loop<br></h2><p>The second loop is almost identical to the first loop except for the query arguments:</p><pre class="brush: php">&lt;?php //second query - posts

// Define the query
$args = array(
    'post_type' =&gt; 'post',
	'animal_cat' =&gt; $term-&gt;slug
);
$query = new WP_Query( $args );

if ($query-&gt;have_posts()) {

		
	// output the term name in a heading tag				
	echo'&lt;h2&gt;Blog Posts About the ' . $term-&gt;name . ' Family&lt;/h2&gt;';
	
	// output the post titles in a list
	echo '&lt;ul&gt;';
	
		// Start the Loop
		while ( $query-&gt;have_posts() ) : $query-&gt;the_post(); ?&gt;

		&lt;li class="animal-listing" id="post-&lt;?php the_ID(); ?&gt;"&gt;
			&lt;a href="&lt;?php the_permalink(); ?&gt;"&gt;&lt;?php the_title(); ?&gt;&lt;/a&gt;
		&lt;/li&gt;
		
		&lt;?php endwhile;
		
		echo '&lt;/ul&gt;';
		
} // end of check for query having posts
	
// use reset postdata to restore orginal query
wp_reset_postdata();

?&gt;</pre><p>Now save your template file and preview the archive. You should see two lists, one of animals and the other of posts:</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/227/posts/20340/image/creating-taxonomy-archive-to-list-by-post-type-final-archive.jpg"></figure><h2>Summary</h2><p>That's how you create a taxonomy archive to list posts by post type. You could extend this technique to make your archive&nbsp;pages more interesting:</p><ul><li>Varying the loops so that different content is output for each one, for example outputting a featured image or excerpt for some post types.</li><li>Adding different styling for each post type.</li><li>Changing the layout so the archives are side by side or in a grid. You can see and example of a site where I did this at&nbsp;<a href="http://type-academy.co.uk/temperament-intro/">http://type-academy.co.uk/temperament-intro/</a></li><li>Adapting this technique to category or tag archives by altering your query arguments.</li></ul><p>I'm sure you can think of more possibilities!</p><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/20340/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20340/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20340/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20340/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-23T15:00:08.624Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-23T15:00:08.624Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:15:"Rachel McCollin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:4;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-20577";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:102:"http://design.tutsplus.com/tutorials/create-a-retro-phone-illustration-in-adobe-illustrator--cms-20577";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:54:"Create a Retro Phone Illustration in Adobe Illustrator";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:12656:"<figure class="final-product final-product--image"><img src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/117/posts/20577/final_image/princessphone.jpg" alt="Final product image" /><figcaption>What You'll Be Creating</figcaption></figure><p>I'd like to share with you today a quick tutorial on creating a retro phone illustration in Adobe Illustrator. This is a get taster of my new Tuts+ course, <a href="http://courses.tutsplus.com/courses/mastering-sketch-design-in-illustrator" rel="external" target="_blank">Mastering Sketch Design in Illustrator</a>.</p><p>In that course, you’ll dive right in and create a still life entirely in Illustrator. You’ll learn to sketch it all out with various drawing tools, and render your objects with layered gradients, transparent shapes, and various Blending Modes. By the end of the course, you’ll know how to freely sketch, draw, and paint complete designs in Illustrator without using any additional applications.</p><figure data-video-embed="true" data-original-url="http://www.youtube.com/embed/2Jk1F07rzy0" class="embedded-video">
  <iframe src="//www.youtube.com/embed/2Jk1F07rzy0?rel=0" frameborder="0" webkitallowfullscreen="webkitallowfullscreen" mozallowfullscreen="mozallowfullscreen" allowfullscreen="allowfullscreen"></iframe>
</figure>

<h2><span class="sectionnum">1.</span> Create the Phone</h2><h3>Step 1</h3><p>Start with a simple, quick sketch of an object. You can use a stock photo for reference, set up a still-life, or a photo of your own. I used the&nbsp;<b>Paintbrush Tool (B)</b> and the default&nbsp;<b>Calligraphic Brush</b> in quickly sketching out this Princess telephone.&nbsp;<b>Group (Control-G)</b> together your stroked lines and reduce the group's&nbsp;<b>Opacity</b> to&nbsp;<b>40%</b> in the&nbsp;<b>Transparency</b> panel.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/117/posts/20577/image/phone_001.jpg"></figure><h3>Step 2</h3><p>Using the&nbsp;<b>Pen Tool (P)</b>, I traced each section of the phone. In order to keep each plane separate for when I create the line art, I changed colors frequently.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/117/posts/20577/image/phone_002.jpg"></figure><h3>Step 3</h3><p>Continue tracing each section of the object until you have the entire thing drawn out. It's up to you how detailed you choose to make your drawing. Hide the sketch group in the&nbsp;<b>Layers</b> panel. We'll handle the phone's cord later.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/117/posts/20577/image/phone_003.jpg"></figure><h2><span class="sectionnum">2.</span> Creating the Line Art</h2><h3>Step 1</h3><p>In order to create the line art, I found it easiest to use the&nbsp;<b>Shape Builder Tool (Shift-M)</b> in order to separate overlapping portions of objects so each shape ends where the next begins.</p><ol><li>Select two overlapping shapes.&nbsp;</li><li>With the&nbsp;<b>Shape Builder Tool</b> in use, select the intersecting portion of the two shapes.</li><li><b>Deselect</b> the bottom shape and combine the top two into a single shape.</li></ol><p>Repeat this technique throughout your object and&nbsp;<b>Group</b> everything together.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/117/posts/20577/image/phone_004.jpg"></figure><h3>Step 2</h3><p><b>Copy (Control-C)</b> and&nbsp;<b>Paste (Control-V)</b> the object group and change the fill color to null and the stroke color to a dark purple, blue, or black. In the&nbsp;<b>Stroke</b> panel, set the caps and corners to&nbsp;<b>Rounded</b> and the <b>Stroke Weight</b> to&nbsp;<b>3pts</b>. In the&nbsp;<b>Transparency</b> panel set the&nbsp;<b>Blend Mode</b> to&nbsp;<b>Overlay</b>.&nbsp;<b></b><b>Paste</b> another line art group and set the <b>Blend Mode</b> to&nbsp;<b>Normal</b>, <b>Opacity</b> to <b>60%</b>,&nbsp;<b></b>and the <b>Stroke Weight</b> to <b>0.5pt</b>.&nbsp;<b>Align</b> both line art groups with the main object group.&nbsp;<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/117/posts/20577/image/phone_005.jpg"></figure><h2><span class="sectionnum">3.</span> Drawing the Phone Cord</h2><h3>Step 1</h3><p>Using the&nbsp;<b>Pencil Tool (N)</b>, set the <b>Stroke Weight</b> to <b>10pts</b> and start drawing a spiraled line. In order to keep the line from being deformed, I set the <b>Fidelity</b> to <b>Smooth</b> in the <b>Pencil Tool's Options</b>. You'll find that the line can only be drawn for so long, so make you you can&nbsp;<b>Edit Selected Paths</b> (again in the tool's options) and pick up where you left off in order to have the phone cord be one complete path.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/117/posts/20577/image/phone_006.jpg"></figure><h3>Step 2</h3><p><b>Copy</b> and&nbsp;<b>Paste</b> the cord. <b>Hide </b>or set<b>&nbsp;</b>the copy aside.&nbsp;<b>Expand</b> your cord under&nbsp;<b>Object</b>. Set the fill color to whatever your phone will be (in this case a blue).&nbsp;<b>Copy</b> and&nbsp;<b>Paste</b> the expanded cord line twice and use the same settings for the cord's line art as was used for the phone in the previous section. <b>Unhide</b> the stroked cord line, set the <b>Stroke Weight</b> to <b>2-4pts</b>, the color to something lighter than your cord base color, and the Blend Mode to Overlay. <b>Group</b> together all cord objects and place behind the phone group.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/117/posts/20577/image/phone_007.jpg"></figure><h2><span class="sectionnum">4.</span> Render the Phone</h2><h3>Step 1</h3><p>Choose a color for your phone to be. I chose a pastel blue, as seen in the phone cord in the previous section. Typically, Princess phones come in assorted pastels.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/117/posts/20577/image/phone_008.jpg"></figure><h3>Step 2</h3><p>Start with shadows: cast, form, core, and middle tone areas. I drew gradient shapes with the&nbsp;<b>Pencil Tool</b> and layered them on top of each other. The gradient is dark purple at <b>100% Opacity</b> to <b>0% Opacity</b>. The <b>Blending Modes</b> vary from <b>Hard Light</b> to <b>Normal</b>, each shape's overall opacity varies from <b>40%-100%</b>, and I altered the angles of the gradients with the&nbsp;<b>Gradient Tool (G)</b>.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/117/posts/20577/image/phone_009.jpg"></figure><h3>Step 3</h3><p>In the case of this phone there's three main sections that will be rendered: the handset, the top of the housing (where the dial is), and the front of the housing (facing the viewer).&nbsp;<b>Copy</b> and&nbsp;<b>Paste</b> the phone base group and&nbsp;<b>Unite</b> the shapes in each of these sections in the&nbsp;<b>Pathfinder</b> panel. You should have three phone pieces. These will be used to&nbsp;<b>Make Clipping Masks (Control-7)</b>.</p><ol><li><b>Group</b> together your shadow gradient shapes you worked on throughout the previous step.</li><li><b>Select</b> the newly united handset shape. Make sure it aligns with the rest of the phone illustration and is above the shadow gradient group in the&nbsp;<b>Layers</b> panel.&nbsp;<b>Make a Clipping Mask</b> either by hitting&nbsp;<b>Control-7</b> or going to&nbsp;<b>Object &gt; Clipping Mask &gt; Make</b>.<br></li><li>Continue creating shadow and highlight gradients. For the highlights, I used a&nbsp;<b>Radial Gradient</b> of light yellow (similar to what's used for the background) at&nbsp;<b>100% to 0% Opacity</b>. The&nbsp;<b>Blend Mode</b> was set to&nbsp;<b>Overlay</b> and I reduced the overall&nbsp;<b>Opacity</b> of each shape to&nbsp;<b>60%</b> in the&nbsp;<b>Transparency&nbsp;</b>panel.</li></ol><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/117/posts/20577/image/phone_010.jpg"></figure><h3>Step 4</h3><ol><li>Continue working on each section of the phone. Consider how the handset is casting shadows onto the housing.</li><li>When you've finished rendering the phone,&nbsp;<b>Group</b> everything<b>&nbsp;</b>together and create cast shadows on the background below the phone. In this case, it'll be carpeting, so no highlighting (for a shiny table or floor) will be needed.</li><li>Some of the shadows are large shapes drawn with the&nbsp;<b>Ellipse Tool (L)</b> with a&nbsp;<b>Radial Gradient</b> version of the shadow gradients used previously. Three of them are layered beneath the phone group which keeps some of the shadows harsh and dark, and others diffused. When finished,&nbsp;<b>Group</b> together all of your shadow layers.</li></ol><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/117/posts/20577/image/phone_011.jpg"></figure><h2><span class="sectionnum">5.</span> Background and Final Touches</h2><p>Use the&nbsp;<b>Rectangle Tool (M)</b> to draw two large rectangles to create your background. The floor has been created from three separate layers: a flat gray color, a gradient layer using the same shadow gradient from earlier in this tutorial, and an additional gray layer with the&nbsp;<b>Note Paper&nbsp;</b>effect applied in the&nbsp;<b>Appearance</b> panel with the settings seen below. The&nbsp;<b>Note Paper</b> layer is, finally, set to&nbsp;<b>Multiply</b>, and all three are&nbsp;<b>Grouped</b> together.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/117/posts/20577/image/phone_012.jpg"></figure><h3>Step 2</h3><p>For the polka dots in the background, draw four small circles with the&nbsp;<b>Ellipse Tool</b>, making each one a different color.&nbsp;<b>Copy</b> and&nbsp;<b>Paste</b> all four so you have two staggered lines of circles.&nbsp;<b>Select</b> all eight circles and create a new pattern in the&nbsp;<b>Pattern Options</b> panel. Use this for a layer above the yellow background and set it to&nbsp;<b>Multiply</b>.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/117/posts/20577/image/phone_013.jpg"></figure><h3>Step 3</h3><p>Finally, let's add some sparkles as a finishing touch. Draw a small white circle with the&nbsp;<b>Ellipse Tool</b> and apply the effect under&nbsp;<b>Effects &gt; Distort &amp; Transform &gt; Pucker &amp; Bloat</b>. &nbsp;Set the&nbsp;<b>Pucker</b> percentage to&nbsp;<b>103</b> and&nbsp;<b>Expand</b> the shape under&nbsp;<b>Object</b>.&nbsp;<b></b>Either&nbsp;<b>Copy</b> and&nbsp;<b>Paste</b> the sparkle around your composition, or create a&nbsp;<b>Scatter Brush</b>. Go to the&nbsp;<b>Brushes</b> panel,&nbsp;<b></b>select&nbsp;<b>New Brush</b><b></b> and choose&nbsp;<b>Scatter Brush</b>. Choose from the options below in creating your brush, hit&nbsp;<b>OK</b>, and use the&nbsp;<b>Paintbrush Tool</b> to scatter sparkles around your illustration.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/117/posts/20577/image/phone_014.jpg"></figure><h2>Great Job, You're Done!</h2><p>Now that you've completed this teaser tutorial, check out the full course, <b><a href="http://courses.tutsplus.com/courses/mastering-sketch-design-in-illustrator" target="_self">Mastering Sketch Design in Illustrator</a></b>. In it you'll sketch out your composition with a series of thumbnails, utilize 2-point perspective in order to create an 80's inspired still life, create perfect line art, render each object, and create a fun patterned background to bring it all together.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/117/posts/20577/image/princessphone.jpg"></figure><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/20577/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20577/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20577/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20577/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-23T14:13:07.438Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-23T14:13:07.438Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:12:"Mary Winkler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:5;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-20652";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:110:"http://design.tutsplus.com/tutorials/get-yourself-noticed-create-a-simple-business-card-in-indesign--cms-20652";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:63:"Get Yourself Noticed! Create a Simple Business Card in InDesign";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:26793:"<figure class="final-product final-product--image"><img src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/final_image/Final-Product_600.jpg" alt="Final product image" /><figcaption>What You'll Be Creating</figcaption></figure><p>Though we may be increasingly digital in the way we network and seek new business, a print business card is still one of the most important self-promotional tools you can have to hand. You never know when a new networking opportunity might arise!</p><p>In this tutorial we’ll explore how to create high-impact, audience-appropriate business cards for your own promotional purposes. You can look at how I put together inspiring examples for a fictional Graphic Designer, Illustrator and Photographer using InDesign, and lay down the Golden Rules of creating striking and unforgettable cards: minimal design, legible text, and appropriate audience! With these rules in mind, you can experiment to your heart’s content with text styles, color and even graphics.</p><p>During this tutorial I will hop over to Illustrator and Photoshop to create some of the artwork, but this is optional for your own designs. After all, simple designs which emphasize typography and white space really can look the business!</p><p>Firstly, let’s put together a basic template for your business card, which you can use to experiment with your own card designs.</p><h2><b></b><span class="sectionnum">1.</span>&nbsp;Set Up the Template for Your Business Card</h2>
<h3>Step 1</h3>
<p><b>Open InDesign</b> and select <b>File &gt; New Document</b>. In the <b>New Document</b> window set the <b>Intent</b> to <b>Print</b> and set the <b>No. of Pages</b> to <b>2</b>. <b>Deselect Facing Pages</b>.&nbsp;</p><p>Under <b>Page Size</b> select <b>Custom...</b> from the drop-down menu to open the <b>Custom Page Size</b> window. Under name type ‘<i>Business Card</i>’ and set the <b>Width</b> to <b>84 mm </b>and <b>Height </b>to <b>55 mm</b>. This is a standard card size for some popular online card printers and is generous enough to give your design some space. Click <b>Add</b>, and then <b>OK</b>.&nbsp;</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/1_Step1_1.png"></figure>
<p>Set the <b>Margins</b> on all sides to <b>10 mm</b> for now, though we can change this later depending on the design. Set the <b>Bleed </b>all round to a generous <b>4 mm</b>. Click <b>OK</b>.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/1_Step1_2.png"></figure><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/1_Step1_3.png"></figure>
<h2><span class="sectionnum">2.</span> If You’re a <i>Graphic Designer</i>...</h2>
<p>...your clients will come to you for potentially all sorts of things: print work, websites, exhibition materials etc. It’s likely that at least some of your clients are commercial businesses, and they want to hire a designer for their professionalism as well as their talent for typography.</p>
<p>Because your business is multi-faceted, and can include all sorts of different projects, it would be unwise to feature just one, or even a couple of, project images on your card to risk being pigeon-holed as being only capable of doing book covers, for example.&nbsp;</p>
<p>You also don’t want to crowd your tiny card with images, which leads to the first <i>Golden Rule</i> of business card design: if in doubt a <i>Minimal Design</i> always has the most impact. So, for this example of a card that might suit a graphic designer, I’ve given <i>emphasis to the typography</i>, <i>stripped out any images</i> and stuck to a <i>limited color palette</i>.</p><h3>Step 1</h3><p>Return to your InDesign template that we set up in <b>Section 1 (above)</b>.&nbsp;</p><p>With the first page brought up on screen, go to the <b>Pages Tool (Shift-P)</b> in the <b>Tools</b> panel. Go to <b>Layout &gt; Margins and Columns...</b> and set the <b>Margins</b> to <b>5 mm</b>. Repeat for <b>Page 2</b>.&nbsp;</p><p>Return to <b>Page 1</b> of the document and use the <b>Rectangle Tool (M)</b> to create a frame that extends across the whole card up to the edges of the bleed. Set the <b>Fill</b> to <b>[Paper]</b>. With the frame selected, <b>Edit &gt; Copy</b> and click on the <b>Page 2 </b>icon in the <b>Pages</b> panel (<b>Window &gt; Pages</b>) to bring up <b>Page 2</b> on screen. Click <b>Edit &gt; Paste in Place</b>.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/2_Step1.png"></figure><h3>Step 2</h3><p>Open the <b>Swatches</b> panel if not already open by going to <b>Window &gt; Color &gt; Swatches</b>. Click the <b>New Swatch</b> icon at the bottom of the <b>Swatches</b> panel to open a new window.</p><p>With the <b>CMYK</b> mode selected, set the <b>Cyan</b> slider to <b>9</b>, <b>Magenta</b> to <b>7</b>, <b>Yellow</b> to <b>9</b>, and <b>Black</b> to <b>89</b>. Rename this swatch ‘<i>Light Black</i>’. A pure black can be harsh; this will soften the appearance of the card.</p><p>Set the <b>Fill</b> of the pasted frame on <b>Page 2</b> to ‘<i>Light Black</i>’.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/2_Step2.png"></figure><h3>Step 3</h3><p>Return to <b>Page 1</b> of the document, or the <b>FRONT</b> of the business card. This should be the right place for a logo, if you have one, or simply your name and job title.&nbsp;</p><p>Use the <b>Type Tool (T)</b> to create a text frame <b>84 mm</b> in <b>Width</b> and <b>10 mm</b> in <b>Height</b>. Type ‘<i>your or your business’ name</i>’; in this example ‘<i>jon tate creative</i>’. Set the text to <b>Align Center</b> from the <b>Character Formatting Controls</b> panel at the top of the screen.</p><p>Now you can select a font that is either your brand type, or find something that you feel reflects your design aesthetic and looks cutting-edge and contemporary. I went for a playful Sans Serif font, <b><a href="http://www.dafont.com/poetsen-one.font" rel="external" target="_blank">Poetsen One</a></b>.</p><p>Set the <b>Font Size</b> to <b>28 pt</b>, <b>Tracking</b> to <b>50</b> and the <b>Color </b>to ‘<i>Light Black</i>’, as before.</p><p>Drag a horizontal <b>guideline</b> down from the top ruler to the center point of the card (<b>27.5 mm</b>) and use this to position the text frame on the horizontal center of the front of your card.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/2_Step3_1.png"></figure><p>For a color ‘pop’ create a <b>New Swatch</b> in the <b>Swatches</b> panel, and set the values to <b>C=100, M=13, Y=10, K=0</b>. you can rename this ‘<i>Graphic Design Blue</i>’. Note: if you use a brand color that you’d like to also use on your cards, it may be best to use a <b>Spot Pantone</b> color to produce the correct printed result.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/2_Step3_2.png"></figure><p>As tempting as it may be to add more ‘stuff’ to the front of your card, practice restraint and keep it minimal. You can now add your contact details on the reverse of your card.</p><h3>Step 4</h3><p>Bring up <b>Page 2</b> of your document on screen. This will be the <b>REVERSE</b> of your business card.&nbsp;</p><p>Introduce a new text frame using the <b>Type Tool (T) 74 mm</b> in <b>Width</b> and <b>19 mm</b> in <b>Height</b>. <b>Center</b> the frame on the card between the margins, resting the bottom edge against the lower margin.&nbsp;</p><p>Type ‘<i>Name</i> (paragraph break) <i>Job Title</i> (paragraph break) <i>Optional Description of Services</i> (paragraph break x2) <i>Telephone Number(s), Email Address and/or Website</i>’.</p><p>Choose a different font to use here to the front of your card; it’s really important you use something that’s going to be <i>clear</i> and <i>legible</i>, even at a reduced size. I’ve gone for an all-caps Sans Serif, <b><a href="https://www.behance.net/gallery/Mojave-Typeface/8668939" rel="external" target="_blank">Mohave</a>,</b>&nbsp;which is a great choice for making your contact details stand-out while maintaining a graphic, contemporary look.</p><p>Set the <b>Font </b>of all the text to <b>Mohave Regular</b>, <b>Size</b> to <b>10 pt</b>, <b>Leading</b> to <b>14 pt</b> and <b>Tracking</b> to <b>20</b>. Highlight ‘<i>Name</i>’ alone and set the <b>Size</b> to <b>12 pt</b> and the <b>Color</b> to <b>[Paper]</b>. Highlight the remaining text and set the <b>Color</b> to ‘<i>Graphic Design Blue</i>’. Highlight your website or email address and set the<b> Weight</b> to <b>Bold </b>to make it really stand-out. This is how most clients will initially search for you or contact you.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/2_Step4_1.png"></figure><p>You can also introduce a <b>solid 1 pt </b>stroke in <b>[Paper]</b> between the telephone number and website address using the <b>Line Tool (\)</b> to visually separate the information.</p><p><b>Great work</b> - you have a minimal yet striking card design that will attract new clients! Skip to the bottom of the tutorial to read how to export your card for print.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/2_Step4_2.png"></figure><h2><span class="sectionnum">3.</span> If You’re an <i>Illustrator</i>...</h2><p>...you want to attract clients who are looking to commission creative, unique work from a talented, artistic individual with a head for business. Phew, that’s quite a big impression to give using just a tiny piece of card!</p><p>You will have your own illustrative style, and this should be brought out in the design of your card. You shouldn’t try to cram your card with images of your work, but a small graphic can look great and be uniquely tailored to your business venture.</p><p>In the example detailed below, I’ve used my own sketched graphics to give you an idea of how you can maintain a minimal design while including pieces of your illustration work. You may even want to custom-produce an illustration for your business card.</p><h3>Step 1</h3><p>Return to your InDesign template that we set up in <b>Section 1 (Above)</b>.&nbsp;</p><p>Flip the page’s dimensions by going to <b>File &gt; Document Setup...</b> to open the <b>Document Setup</b> panel and clicking on <b>Portrait Orientation</b>.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/3_Step1_1.png"></figure><p>Go to <b>Page 1</b> of the document and use the <b>Rectangle Tool (M)</b> to create a frame that extends across the whole card up to the edges of the bleed. Set the <b>Fill</b> to<b> [Paper]</b>. With the frame selected, <b>Edit &gt; Copy</b> and click on the <b>Page 2</b> icon in the <b>Pages</b> panel (<b>Window &gt; Pages</b>) to bring up <b>Page 2</b> on screen. Click <b>Edit &gt; Paste in Place</b>.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/3_Step1_2.png"></figure><h3>Step 2</h3><p>So now we have an unusual layout for this card - it’s a great tip to switch the orientation of your card to a portrait format; it provides interest and more vertical length for any tall graphics.</p><p>Return to <b>Page 1</b> of your document and use the <b>Type Tool (T)</b> to create a new text frame <b>55 mm</b> in <b>Width</b> and <b>17 mm</b> in <b>Height</b>. Position this at the top of your card, close to the top margin. Type ‘<i>Name</i> (paragraph break) <i>Job Title</i>’ or ‘<i>Business Name </i>(paragraph break) <i>Your Name</i>’; or in this fictional example ‘<i>Katy Foal</i> (paragraph break) <i>Illustration</i>’.</p><p>Because this card is tailored for an Illustrator, we might want to use a font that reflects what you do for a living - which is at its most traditional, drawing with pencil and paper. So I’ve gone for a scrawly, handwritten font which is still lovely and legible, <b><a href="http://www.urbanfonts.com/fonts/Bon_Iver.htm" rel="external" target="_blank">Bon Iver</a></b>. There are lots of handwritten fonts out there, some are great and some are...well...less great, so choose wisely!&nbsp;</p><p>Highlight all the text and set the <b>Font </b>to <b>Bon Iver Regular;</b> select <b>Align Center</b> from the <b>Character Formatting Controls</b> panel at the top of your screen.&nbsp;</p><p>Highlight ‘<i>Name</i>’ and set the <b>Size</b> to <b>27 pt</b>. Set the <b>Color</b> to a <b>Tint</b> of <b>85% [Black]</b>. Highlight ‘<i>Job Title</i>’ and set the <b>Size</b> to <b>24 pt</b> (unless your name is longer than your job title) and <b>Color</b> to a <b>Tint</b> of <b>65% [Black]</b>. The text should fit within the margins, leaving a good <b>10 mm</b> space between the text frame and the printable edge of the card.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/3_Step2.png"></figure><h3>Step 3</h3><p>This is a great place to add a little illustration to your card. I put together a couple of balloon sketches which I then post-edited in <b>Photoshop</b> to remove any background discoloration and improve <b>Contrast</b>.</p><p>Use the <b>Rectangle Frame Tool (F)</b> and <b>File &gt; Place</b> to insert a suitable image and <b>Click Open</b>. Use the <b>Fill Frame Proportionally</b> option from the top control panel to adjust the image scale until you are happy with the result. To directly adjust the scale of the image <b>Double-click</b> within the image frame and hold down <b>Shift</b> as you resize.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/3_Step3.png"></figure><h3>Step 4</h3><p><b>Double-click</b> the <b>Page 2 icon</b> in the <b>Pages </b>panel (<b>Window &gt; Pages</b>) to bring the page up on screen. This will be the <b>REVERSE</b> of your card.</p><p>Use the <b>Type Tool (T) </b>to create a new frame <b>55 mm</b> in <b>Width</b> and <b>5 mm</b> in <b>Height</b>. Place this just above the horizontal halfway point of the reverse of your card. Type ‘<i>your website</i>’ and set the <b>Font </b>to <b>Bon Iver Regular</b>, <b>Size 14 pt </b>and <b>Align Center</b>. Set the <b>Color </b>of the central website name to a <b>Tint</b> of <b>85% [Black] </b>and the ‘<i>www.</i>’ and ‘<i>.com</i>’ to a <b>Tint</b> of <b>65% [Black]</b>.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/3_Step4.png"></figure><h3>Step 5</h3><p>Use the <b>Rectangle Frame Tool (F)</b> to create a new image frame and <b>File &gt; Place</b>. Select a related, but slightly different image, to the one on the front of your card, and <b>Click Open</b>. Adjust the scale, as before, until you are happy with the result.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/3_Step5.png"></figure><h3>Step 6</h3><p>You can list your contact details at the top of the card, but here presents an opportunity to stress my second <i>Golden Rule</i> of business card design: <i>Always </i><i>choose </i><i>legibility of text over style!</i></p><p>The handwritten font we’ve used so far has been great for creating an eye-catching headline, and a large-scale website address; but it won’t be suitable at smaller-scale as it may become difficult to read. So I’ve chosen a second font in this example, a classic and clear Serif, <b><a href="http://www.calendasplus.com/index.html" rel="external" target="_blank">Calendas Plus</a></b>.&nbsp;</p><p>Create a new text frame using the <b>Type Tool (T)</b> and type ‘<i>telephone number </i>(paragraph break) <i>email address</i>’. Set the <b>Font </b>to <b>Calendas Plus Regular</b>, <b>Size 7 pt</b>, <b>Leading 10 pt</b> and set the <b>Color to [Black]</b>, <b>Tint 65%</b>. Pull out any more important words or details in a <b>Tint</b> of <b>85%</b>.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/3_Step6.png"></figure><p>Awesome work - you now have a beautiful business card design for attracting some potential commissions! Skip to the bottom of the tutorial to read how to export your card for print.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/3_Step6_2.png"></figure><h2><span class="sectionnum">4.</span> If You’re a <i>Photographer</i>...</h2><p>...you may have a specialism within your field, such as Events, Travel or Portraiture. You may have several different specialisms, and in this case one business card design might not be enough to reach a variety of different clients who are looking for different things. Many printers now offer the technology to print several different designs on the reverse of your cards for little or no extra cost - for photographers this is a great way of showing a potential client your range of work, or targeting a client with a particular photo or design you feel will have greater appeal for them.</p><p>In the example below, I put together a card with a photo reverse - you can interchange this with a number of different options of your own work. Because a photographer’s trade is heavily visual, you should use your business card as an opportunity to showcase your best work (or, even better, your most commercially appealing work).&nbsp;</p><p>This leads to the last <i>Golden Rule</i> of business card design: <i>design a card that is audience-appropriate!</i> Research your target market - what would they want from a photographer? You might want to show off shots from your most creative shoot on your cards, but a client might prioritise the relevance of content and a professional attitude over your artistic ability.&nbsp;</p><h3>Step 1</h3><p>Return to your InDesign template that we set up in <b>Section 1 (Above)</b>.&nbsp;</p><p>With <b>Page 2</b> of the document brought up on screen, go to the <b>Pages Tool (Shift + P)</b> in the <b>Tools </b>panel. Go to <b>Layout &gt; Margins and Columns...</b> and set the <b>Margins</b> to <b>0.5 mm</b>.&nbsp;</p><p>Return to <b>Page 1</b> of the document and use the <b>Rectangle Tool (M) </b>to create a frame that extends across the whole card up to the edges of the bleed. Set the <b>Fill </b>to <b>[Paper]</b>. With the frame selected, <b>Edit &gt; Copy</b> and click on the <b>Page 2</b> icon in the <b>Pages</b> panel (<b>Window &gt; Pages</b>) to bring up <b>Page 2</b> on screen. Click <b>Edit &gt; Paste in Place</b>.</p><p>With the frame selected, open the <b>Swatches</b> panel (<b>Window &gt; Swatches</b>) and click the <b>New Swatch</b> icon at the bottom of the panel. Set the values to <b>Cyan=74, Magenta=13, Yellow=77</b> and <b>Black=4</b>. Rename this swatch ‘<i>Business Card Green</i>’. Ensure the <b>Fill </b>of the frame on <b>Page 2</b> is set to ‘<i>Business Card Green</i>’.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/4_Step1.png"></figure><h3>Step 2</h3><p>Return to <b>Page 1</b> and drag a horizontal <b>guideline</b> down from the top ruler (go to <b>View &gt; Show Rulers</b>, if not already visible) to the center point of the card, at <b>27.5 mm</b>. Introduce a new text frame using the <b>Type Tool (T) 31 mm</b> in <b>Width </b>and <b>9 mm</b> in <b>Height</b> and position this on the left of the card, resting against the left margin and centered on the guideline.</p><p>Type ‘<i>Name</i> (paragraph break) <i>Job Title</i>’ and set the <b>Font </b>to a classic Serif font. I’ve gone for <b><i>Adobe Garamond Pro</i></b>. Highlight the ‘<i>Name</i>’ alone, and set the <b>Font</b> to <b>Regular, Size 12 pt,</b> and <b>Leading 15 pt</b>.&nbsp;</p><p>Highlight ‘<i>Job Title</i>’ alone and set the <b>Weight</b> to <b>Semibold, Size 11 pt</b>, and <b>Leading</b> to <b>15 pt</b> (unless your name is longer than the job title, in which case reverse the sizing).</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/4_Step2.png"></figure><h3>Step 3</h3><p>Remaining on <b>Page 1</b>, introduce a second <b>text frame</b> <b>26 mm</b> in <b>Width</b> and <b>17 mm</b> in <b>Height</b> and position this on the right-hand side of the card, centered on the guideline, with the right-hand edge of the frame resting against the right-hand margin.&nbsp;</p><p>Type ‘<i>Website Address</i> (paragraph break) <i>Telephone Number </i>(paragraph break) <i>Email Address</i>’ and set the <b>Font</b> to <b>Adobe Garamond Pro Regular</b>, <b>Size</b> to <b>9 pt</b> and <b>Leading </b>to <b>20 pt</b>. You can pull out key words or details in <b>Bold</b>, and give less important letters and glyphs a <b>Color </b>of ‘<i>Business Card Green</i>’.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/4_Step3.png"></figure><h3>Step 4</h3><p>Use the <b>Line Tool (\) </b>from the <b>Tools</b> panel to create a vertical stroke (hold down <b>Shift </b>to keep it straight) <b>18.5 mm</b> in <b>Length</b>. Open the <b>Stroke </b>panel by going to <b>Window &gt; Stroke</b>. Set the <b>Weight</b> to <b>1 mm</b>, and the <b>Type</b> to <b>Thick-Thick</b>.&nbsp;</p><p>Position this between the two text frames on <b>Page 1</b>.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/4_Step4.png"></figure><h3>Step 5</h3><p>You can introduce a background vector graphic on the front of your business card to sit behind the text and give the card some context. As this is a Travel Photographer’s card, I’ve introduced an <b>Illustrator</b> graphic of palm fronds (set with a <b>Black Fill,</b> with an <b>Opacity</b> of <b>20%</b> in Illustrator) in two image frames using the <b>Rectangle Frame Tool (F)</b>.&nbsp;</p><p>The first image frame is copied and pasted (<b>Edit &gt; Copy &gt; Paste</b>) and flipped (<b>Ctrl-Click (Mac) </b>or <b>right-Click (PC) </b>and<b> Transform &gt; Flip Vertical</b>, and <b>Repeat, </b>selecting<b>&nbsp;Flip Horizontal</b>) and each frame positioned in the opposite corners of the card.</p><p>I drag to select both frames and <b>Object &gt; Effects &gt; Transparency...</b> and set the <b>Opacity</b> to <b>40%</b>. Click <b>OK</b>.&nbsp;</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/4_Step5_1.png"></figure><p>With the two image frames and the background White frame selected, <b>Right-Click</b>&nbsp;and <b>Arrange &gt; Send to Back</b>.&nbsp;</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/4_Step5_2.png"></figure><h3>Step 6</h3><p>Go to <b>Page 2 </b>of the document and use the <b>Rectangle Frame Tool (F)</b> to create a frame that extends to the edges of the margins (not all the way to the edges of the card). Go to <b>File &gt; Place</b>, select a suitable photo (here I used&nbsp;<a href="http://photodune.net/item/ta-prohm-temple-angkor-cambodia/4022152?ref=VectorPremium" rel="external" target="_blank">Photodune_AngkorTempleCambodia</a>), and <b>Open</b>. Use the <b>Fill Frame Proportionally</b> option in the top control panel to scale the image.&nbsp;</p><p>You can drag the <b>Page 2</b> page icon in the <b>Pages</b> panel down to the <b>Create New Page</b> icon to copy this reverse page of the card, and introduce a variety of photo options.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/4_Step6_1.png"></figure><p>Great work - you have a gorgeous card design that showcases your work and will engage potential new clients! Read on to learn how to export your card for print.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/4_Step6_2.png"></figure><h2><span class="sectionnum">5.</span> Export Your Card Ready For Print</h2><h3>Step 1</h3><p>With your chosen card design open in InDesign, go to <b>File &gt; Export...</b> to open the <b>Export</b> window. Select <b>Adobe PDF (Print)</b> from the <b>Format</b> drop-down menu. Name the file and click <b>Save</b>.</p><p>In the <b>Export Adobe PDF </b>window select <b>Press Quality</b> from the <b>Adobe PDF Preset</b> drop-down menu, and keep <b>Pages</b> selected.&nbsp;</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/5_Step1.png"></figure><p>Under the <b>Marks and Bleeds</b> section, click to select <b>All Printer’s Marks</b> under the <b>Marks</b> menu and click to select <b>Use Document Bleed Settings</b> under the <b>Bleed and Slug</b> menu. Click <b>Export</b>.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/5_Step2.png"></figure><h2>Happy Networking!</h2><p>You now have your business card ready to be sent to the printers. Specify a minimum paper weight of 350 gsm (maximum weight of 600 gsm) for a beautiful printed result.&nbsp;</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/114/posts/20652/image/5_Final-Image.png"></figure><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/20652/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20652/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20652/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20652/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-23T14:12:07.429Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-23T14:12:07.429Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:13:"Grace Fussell";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:6;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21212";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:92:"http://computers.tutsplus.com/tutorials/how-to-silence-the-startup-chime-on-a-mac--cms-21212";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:41:"How To Silence the Startup Chime on a Mac";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:8135:"<p>Each time you start a Mac, you'll hear a familiar start-up chime. You may have noticed that sometimes it seems louder, or perhaps quieter, than usual. Or perhaps there is no chime at all. &nbsp;In this tutorial I'll show you how to change the volume of the Mac start up chime, or mute it completely.<br></p><p>There may be good reasons as to why you want to mute the start up chime on a Mac. Or change the volume.<br></p><h2>The Start Up Chime</h2><p>If you are unfamiliar with the Mac start up chime–perhaps your has been muted all along–click on the audio snippet, below, to listen:</p><audio src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/31/posts/21212/audio/MacStartUpChime.mp3" controls="controls"></audio><h2>Chime Volume Explained<br></h2><p>Whilst it might seem that the volume of the chime is somewhat random, the reason for its volume is surprisingly simple and easy to control. How to adjust it will depend upon whether you have any external speakers, or headphones, plugged into the Mac or whether the start up chime comes from the internal speakers.<br></p><p>Either way, the volume of the chime, or whether it is muted, is all controlled by the system volume through the <b>Sound</b>&nbsp;preference pane within <b>System Preferences</b>.<br></p><h2>Adjust Chime Volume on Next Start Up</h2><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/31/posts/21212/image/syspref.png"><figcaption>Sound preference pane in <b>Apple &gt; System Preferences</b></figcaption></figure><p>Deceptively simple to adjust, you might well wonder why you didn't know how to do this before now. &nbsp;Adjusting the start up chime volume is dependent upon a couple of factors:<br></p><ol><li>Whether you have any headphones or external speakers plugged in, and</li><li>The current volume in <b>System Preferences &gt; Sound</b><br></li></ol><h3>Adjust Chime Volume for Built-in Speakers</h3><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/31/posts/21212/image/internal-speakers.png"><figcaption>Adjusting internal speaker volume in the Sound preferences</figcaption></figure><ol><li>Ensure that any headphones or external speakers are disconnected and that there is nothing plugged into the audio-out socket on the Mac</li><li>Navigate from the <b>Apple icon</b>, on the menubar, to <b>System Preferences &gt; Sound</b><br></li><li>Select<b> Internal Speakers - Built In<br></b></li><li>Using the <b>Output Volume</b> slider, at the bottom of the window, adjust the volume. &nbsp;Note, if you move the control to the extreme left, the volume will be muted. &nbsp;Alternatively, tick or untick the <b>Mute</b> tickbox as desired<b><br></b></li></ol><p>The next time that the Mac is shut down and restarted, the volume of the start up chime from the internal speakers will be determined by the setting that you chose in&nbsp;<b>System Preferences &gt; Sound</b><b><br></b></p><h3><b></b>Adjust Chime Volume for Display Audio, Headphones or External Speakers</h3><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/31/posts/21212/image/display-audio.png"><figcaption>Adjusting Display Audio volume in Sound preferences, same principle for headphones</figcaption></figure><ol><li>Ensure that any headphones or external speakers are disconnected and that there is nothing plugged into the audio-out socket on the Mac</li><li>Navigate from the&nbsp;<b>Apple icon</b>, on the menubar, to&nbsp;<b>System Preferences &gt; Sound</b></li><li>Select <b>Headphones - Headphone port</b></li><li>Using the&nbsp;<b>Output Volume</b>&nbsp;slider, at the bottom of the window, adjust the volume. &nbsp;Note, if you move the control to the extreme left, the volume will be muted. &nbsp;Alternatively, tick or untick the&nbsp;<b>Mute</b>&nbsp;tickbox as desired</li></ol><p>The next time that the Mac is shut down and restarted, the volume of the start up chime from the headphones will be determined by the setting that you chose in&nbsp;<b>System Preferences &gt; Sound</b><br></p><p>The same principle is used for any external speakers that have been attached to the Mac via the audio-out port, whether that is Thunderbolt Display speakers or a set of powered external speakers.<b><br></b></p><h2>A Quicker Way to Change Start Up Chime Volume</h2><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/31/posts/21212/image/media-keys.png"><figcaption>The media keys on a modern Apple keyboard</figcaption></figure><p>Having to go to <b>System Preferences &gt; Sound</b>, each time, to change the start up chime volume is a bit of a hassle. &nbsp;An even quicker way to adjust the volume is to use the <b>F10</b>, <b>F11</b> and <b>F12</b> media keys on a Mac keyboard.<br></p><p>The <b>F10</b>, <b>F11</b> and <b>F12</b> media keys toggle mute on or off, decrease volume and increase volume respectively.<br></p><p>For example, if you prefer no start up chime when you next restart the Mac, just press <b>F10</b> on the Mac keyboard before shutting down the Mac.<br></p><p>Note, if you have changed the default behaviour of the media keys, you will need to hold down the <b>Fn</b>&nbsp;key in conjunction with the <b>F10</b>, <b>F11</b> and <b>F12</b> media keys.<br></p><p>Bear in mind that using the mute key on the keyboard will not mute the internal speakers, on next start up, if there is anything plugged into the audio-out port.<br></p><h2>Using Terminal<br></h2><p>With the method, from the command line, it is possible to completely disable the start up chime. &nbsp;Even on subsequent reboots, the chime will remain muted.<br></p><p>To permanently mute the chime–or at least until such time that you wish to unmute it–navigate to <b>Terminal</b>. &nbsp;A quick way is to press the <b>Command-Space</b> keys, to open <b>Spotlight</b>, and type the word <b>Terminal</b>, select the <b>Terminal</b> app and press <b>Enter</b>. &nbsp;It's quicker to do it than it is to tell you how to do it!<br></p><h2><b></b>Permanently Mute the Chime</h2><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/31/posts/21212/image/chime-mute.png"><figcaption>Entering a command to permanently mute the start up chime</figcaption></figure><p><b></b>Once in Terminal, enter the following command on the command line:</p><pre class="brush: bash">sudo nvram SystemAudioVolume=%80</pre><p>Enter the administrator password when prompted. &nbsp;The start up chime is now permanently disabled.</p><h2>Re-enable the Chime</h2><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/31/posts/21212/image/chime-unmute.png"><figcaption>Entering a command to permanently unmute the start up chime</figcaption></figure><p>If, at a point in the future, you decide that it is best to have the start up chime afterall, open the Terminal application and enter the following command:</p><pre class="brush: bash">sudo nvram -d SystemAudioVolume</pre><p>This will restore the start up chime.</p><h2>Conclusion<br></h2><p>The start up chime is actually there for a reason: to indicate that the Mac has performed initial diagnostics tests and there are no fundamental hardware or software problems.<br></p><p>Having the start up chime is useful; press the Option key, immediately after the chime, to access available start-up volumes, for instance. &nbsp;That said, there are sometimes circumstances where controlling the chime volume is preferable.<br></p><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21212/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21212/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21212/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21212/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-23T12:00:04.400Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-23T12:00:04.400Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:13:"Johnny Winter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:7;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21165";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:85:"http://music.tutsplus.com/tutorials/mixing-within-the-soundstage-part-1-eq--cms-21165";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:39:"Mixing Within the Soundstage Part 1: EQ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:14918:"<p>Mixing
any track to a professional standard is a craft that takes time and experience to
master, as well as a good monitoring environment. A great mix will have energy,
excitement, and the potential to make an immediate impact. But at a deeper level, it will feature details and a sonic richness that captivates the listener.&nbsp;</p><p>When
you listen up close, nothing in particular sounds out of place—the arrangement
suits the musical style. Yet somehow the end result is so much more than the sum
of the parts—there’s a distinctive flair that sets it apart.&nbsp;</p><p>Here’s an example
in an R&amp;B music style from the recent 2014 pop charts:</p><figure data-video-embed="true" data-original-url="https://www.youtube.com/watch?v=fZswz64dFlw&amp;list=PLG-6sLnL75vYuJx7WS3SFlmK5urM2LQRf" class="embedded-video">
  <iframe src="//www.youtube.com/embed/fZswz64dFlw?rel=0" frameborder="0" webkitallowfullscreen="webkitallowfullscreen" mozallowfullscreen="mozallowfullscreen" allowfullscreen="allowfullscreen"></iframe>
</figure><p>Of
course, all pop/rock music is a fashion statement of sorts. Opinions about
artistes and their output are often highly subjective and widely diverse!&nbsp;But, focussing
purely on the music and trying to be objective from the mix engineers point of
view, I would suggest that when the main track groove arrives, it seems to
deliver all that’s expected; everything ‘fits’ given the style it sets out to
be.&nbsp;</p><p>When mixing, every instrument has its own place within the sonic spectrum, and needs to be treated as such. So how is this achieved?&nbsp;</p><p>Developing a good
comprehension of the natural frequency range of each instrument (and vocals) and
learning how they might dovetail together to make a perfect, natural fit is
certainly going to be an invaluable help to us when the time comes to mix that
track!</p><h2>The Aural Soundstage</h2><p>Let’s begin by introducing the ‘soundstage’ concept – a three dimensional aural
space that we are going to work within as our track mix comes together.&nbsp;The mix
‘soundstage’ is like the aural equivalent of a theatre stage; it has width—from low frequencies to very high—but also depth, which can be thought of as
volume or level, and positional focus.&nbsp;</p><p>For example, in a typical professional rock
mix designed to be listened to within a stereo context, bass drum and snare,
bass guitar and lead vocal will tend to sit in a central position. The rest of
the kit, guitars and keyboards, and any percussion will tend to be offset
against this to some degree; adding width to the track.&nbsp;</p><p>The lead vocal, in
particular, will command the track, because the energy and urgency of a great
song performance is obviously crucial. Many mix engineers will spend a great
deal of time and focus right here, getting this exactly right.<br></p><h2>The Art of Equalisation: Understanding Frequency Ranges</h2><p>How can our understanding of EQ transform our ability to mix a track? Every
instrument has a natural frequency range it tends to function within. In
addition to this natural frequency range, there will be associated harmonics
which are usually somewhat less pronounced but these help define the natural
tone or character of the instrument.&nbsp;</p><p>The chart below illustrates this:</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/340/posts/21165/image/Frequency chart.jpg"><figcaption>EQ Frequency Chart courtesy The Independent Recording Network. <a href="http://www.independentrecording.net/irn/resources/freqchart/main_display.htm" target="_self">Click here for their interactive version</a>.</figcaption></figure><p>You’ll see at the bottom of the chart there are
various descriptive words sound engineers and musicians alike commonly use. Though
these are somewhat vague and certainly not technical terms, they can be helpful
in working out how to EQ more effectively.&nbsp;</p><p>For example, a male vocal tends to
work in the 100kHz–1K range. Its area of particular warmth might be around
200 kHz. A female vocal will usually have its area of warmth a little higher
than this—maybe around 400 kHz, depending on the singers range and tone.&nbsp;</p><p>Note
that the yellow bar extensions indicate that the upper harmonics of both male
and female vocals range much higher than 1.5kHz. These higher harmonics are
critical in giving character to the voice. Higher still above 8kHz is where
the crispness of the vocal will be heard. The clarity of the diction and the
sibilant sounds ‘s’ and ‘c’ tend to happen here.&nbsp;</p><p>Every track poses different
challenges, and only your own ears can be the judge of how to space everything
perfectly across the sonic spectrum. But learning how to EQ the ‘muddiness’ out of that power electric guitar part, or EQ in a little more high end clarity to
that vocal—all of this is key to setting up a great mix.<br></p><h2>Track Laying and Mixing: What's the Difference?</h2><p>Track
recording and mixing are totally different disciplines. When recording, your
focus will likely be on getting a solid performance at a decent level but without
risking any distortion or overload. Whether you are merely printing a midi
programmed part or capturing a live performance, your aim will likely be to
capture the natural warmth and fullness of the part.&nbsp;</p><p>The result may be a rather
fuller and bigger sound than you will actually need when you come to mix later
on, but at this stage this isn’t generally a concern. It fact it’s often better
to have a slightly fuller sound; you can always EQ it a little more tightly by
‘sculpting’ out a little in frequency areas you don’t need later on.&nbsp;</p><p>To
illustrate the mix EQ process, here’s a recording of a piano part I made. A tiny bit of compression and EQ was applied on the way in, but mainly just to
ensure the sound was as complete as possible:</p><audio src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/340/posts/21165/audio/Piano no eq.mp3" controls="controls"></audio><p><i>Piano Part: no EQ</i><br></p><p>When
mixing, however, the focus shifts entirely. Now the piano part has to be fitted
into an overall sonic picture within the soundstage.&nbsp;</p><p>In this classical-sounding
instrumental track, the piano is actually a lead feature, so I decided it needed
a touch more low end at around 100kHz to add some commanding ‘weight’. I also added
a strong lift at 5.8kHz—mainly because I really wanted the high thirds in the
arrangement to sparkle and cut through a touch more.&nbsp;</p><p>Here’s a screenshot of the
actual EQ I used at the time using a Waves Renaissance EQ plug-in:<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/340/posts/21165/image/REQ piano.jpg"></figure><p>Now
listen to the mixed version of the piano, using the above EQ settings:</p><audio src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/340/posts/21165/audio/Piano with eq.mp3" controls="controls"></audio><p><i>Piano Part: EQ now added</i><br></p><p>The
differences are quite subtle, but clearly audible. In fact, the raw recorded
piano version probably sounds better when heard on its own! But that’s not
untypical—the mixed version has to sit within the context of a busy
arrangement.&nbsp;</p><p>Have a listen to <a href="http://audiojungle.net/item/elegant-piano-rhapsody/6620354" target="_self">the final mix</a>, and judge the end result for
yourself.</p><h2>Strings: Cutting Weight and Adding Presence</h2><p>Let’s
look at another example; string parts within a mix. Typically, violins don’t
offer anything below 200kHz, and they are always rich in harmonic overtones so
to capture that classy ‘sizzle’ will likely mean cutting out some of the weight
of the part lower down the frequency range—and maybe finding that sweet spot
higher up to just give them enough of an ‘edge’ or a bit more ‘air’ if they
need it.&nbsp;</p><p>Here’s a short excerpt of programmed strings in four parts written for a
cinematic instrumental piece, recorded in the raw:</p><audio src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/340/posts/21165/audio/Strings no eq.mp3" controls="controls"></audio><p><i>Strings: no EQ</i><br></p><p>Now here’s the same part with the Waves
EQ screenshot below. Some low end has been added at 140Hz mainly to draw out
the depth of the low cello fifths, but to compensate there is quite a strong cut
at 500Hz with a fairly wide ‘Q’ setting, to get rid of a lot of low-mid
weight.&nbsp; Presence and ‘air’ have been
added higher up:</p><audio src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/340/posts/21165/audio/Strings with eq.mp3" controls="controls"></audio><p><i>Strings: EQ added</i><br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/340/posts/21165/image/REQ strings.jpg"></figure><p>Have a listen to the final mix <a href="http://audiojungle.net/item/mystic-fever/6875557" target="_self">here</a>. The strings enter at 0:45".</p><h2>A Word about 'Q'</h2><p>With a parametric EQ, apart from setting a
frequency and boosting or cutting gain, you can set the width of the frequency
band over which your equalization changes apply. This is called the ‘Q’
setting.&nbsp;</p><p>A single octave change is a ‘Q’ value of 1; so anything below 0.7 or
so will be a broad, general equalization change, whereas a ‘Q’ setting of 5 or 6
would be a very narrow, precise notch of frequency cut (or gain). You might use
this to deal with a specific noise issue for example.&nbsp;</p><p>In the above REQ plug-in,
the lowest row is where the ‘Q’ setting is applied.<br></p><h2>Pads Are Great: But Don't Lose the Energy!</h2><p>I’m
a keen user of all kinds of pads within a track; soft, airy, evolving, or
ethereal. They can certainly add drama to a ballad and give a sense of depth to
any mix, but they also come with a risk factor to my mind. If they are too full
sounding or just too loud, they can often seem to drain the energy out of the
track.&nbsp;</p><p>To my mind, many manufacturers seem to design pads very rich and full
sounding, maybe just to impress the listener into buying them in the first
place! But the risk is they will just dominate and take over all your available
soundstage space.&nbsp;</p><p>So I think the lesson here is: Be brutal when you need to be.
Don’t be afraid to sculpt the EQ weight out of that pad so it doesn’t interfere
with the rhythm section of your track. Some pads have natural ‘air’ which you
might want to emphasise a little, but for me it often seems to be mostly about cutting
away what you don’t need—and keeping the levels well under control.&nbsp;</p><p>Do the AB
test. Is the track energy still there? And does the pad add just a little
something indefinable to your track? Maybe that’s all it needs to do.<br></p><h2>Plug-Ins: A Complete Signal Processing Chain?</h2><p>Plug-ins
that sit within your DAW now exist in abundance, and have been commonly used for
a long time now to process sound. There are many examples that are capable of
being highly forensic and do a great job. A few are designed to actually
emulate the whole mix process that top sound engineers go through to obtain a
finished professional sound on certain instruments.&nbsp;</p><p>For example, the Waves <a href="http://www.waves.com/bundles/tony-maserati-signature-series" target="_self">Maserati</a> plug-ins have settings that emulate closely a chain of processors the
top professional engineer Tony Maserati might commonly use on guitars. They are
very effective, but additionally they also demonstrate how a top mix engineer
might want to sculpt a sound to achieve a professional mix result.&nbsp;</p><p>Have a
listen to this pick guitar part with and without the plug-in enhancements. The
delay part was also put through the same process and is included in these MP3
examples:</p><audio src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/340/posts/21165/audio/Pick gtr no maserati.mp3" controls="controls"></audio><p><i>Pick Guitar Part: no processing</i></p><audio src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/340/posts/21165/audio/Pick gtr with maserati.mp3" controls="controls"></audio><p><i>Pick Guitar Part: Maserati Plug-In added</i><br></p><p>What’s
the difference? A little less weight, it seems to me, and a presence emphasis to
ensure the pick rhythm cuts through.&nbsp;Of course, the guitarist had already
provided plenty of compression—and perhaps a little EQ—to the ‘raw’ recorded
sound through his own amp and pedalboard, so here the mix processing just takes
the same logic a little further.&nbsp;</p><p>Here’s the plug-in screenshot. Unfortunately
this plug-in doesn’t say very much about the actual signal chain used, but I
guess the sonic end result is what matters.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/340/posts/21165/image/Maserati pick gtr.jpg"></figure><h2>A Rough Guide to Instrument Equalisation</h2><p>Where
to cut and when to boost? Only time and experience can really help you as so
much depends on musical context and style, plus your own ears working within a
familiar monitoring environment.&nbsp;</p><p>But here’s a useful guide that might be of
help, if the world of frequency numbers leaves you a touch mystified at times:</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/29/posts/21165/image/Frequency-Guide.jpg"></figure><p>In the comments column, I’ve put a
few personal observations that tend to be things I am typically on the lookout
for when mixing, when it comes to that particular instrument.<br></p><h2>Conclusion</h2><p>



In this tutorial, I’ve only been able to touch on
a few aspects of what is a highly complex craft. Equalisation is a key aspect
of track mixing, but in practice it is used interactively together with
compression, reverb, delay, and quite possibly various other processes.&nbsp;</p><p>In the
next article, I’ll be looking at a couple of other key aspects when it comes to
mixing within the soundstage; reverb and delay.<br></p><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21165/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21165/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21165/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21165/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-23T08:19:33.757Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-23T08:19:33.757Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:13:"Dave Bankhead";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:8;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21193";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:89:"http://cgi.tutsplus.com/tutorials/extreme-eye-closeup-with-freeform-pro-part-2--cms-21193";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:45:"Extreme Eye Closeup with FreeForm PRO: Part 2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:1757:"<figure class="final-product final-product--video"><iframe src="//www.youtube.com/embed/ObPXPkdLELk?rel=0" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe><figcaption>What You'll Be Creating</figcaption></figure><p>In the second part, we'll focus on animating the camera and the 3D shape itself as well as different parts and elements of the depth and color maps. We'll create the sclera with its own depth, color and animated reflection map. And finally add the stars background and DOF.&nbsp;</p><p><i>FreeForm PRO </i>is available <a target="_blank" rel="external" href="http://www.mettle.com/freeform-pro/">here</a>.</p><p><i>FL Depth Of Field </i>is available <a target="_blank" rel="external" href="http://www.frischluft.com/lenscare/index.php">here</a>.</p><h2>Part 2</h2><figure class="embedded-video" data-original-url="https://www.youtube.com/watch?v=UlUI5EDEsZo" data-video-embed="true">
  <iframe allowfullscreen="allowfullscreen" mozallowfullscreen="mozallowfullscreen" webkitallowfullscreen="webkitallowfullscreen" src="//www.youtube.com/embed/UlUI5EDEsZo?rel=0" frameborder="0"></iframe>
</figure><h3><a target="_self" href="http://cdn.tutsplus.com/cg/video/AE-Eye-Tutorial-Part-2-Tutorial-Video.rar">Download this Tutorial</a></h3><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21193/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21193/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21193/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21193/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-23T08:01:52.787Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-23T08:01:52.787Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:15:"Ran Ben Avraham";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:9;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21100";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:93:"http://computers.tutsplus.com/tutorials/the-tuts-guide-to-transcribing-audio-notes--cms-21100";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:43:"The Tuts+ Guide to Transcribing Audio Notes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:13832:"<p>Even though technology has come so far, completely automated speech-to-text transcription still isn't a reality. If you want to turn audio from interviews, meetings, lectures, personal voice memos, and more into text, you'll still have to spend hours transcribing it. But it doesn't have to be a painful process. Using the right techniques and tools, you can make light work of your transcription tasks.</p><p>In this tutorial, you'll learn everything you need about recording audio quickly on your mobile device, and then how to use the best tools available to transcribe that text easily.</p><h2>Recording Your Audio<br></h2><p>Capturing clear audio is the key to getting a recording that's easy to transcribe. The first thing you'll want to do is choose a quiet environment to record in—if possible—and reducing as much ambient noise as possible. Depending on what you're recording and where, that might mean closing windows to cut out street noise and wind, or moving to a quieter corner of the coffee shop or conference hall you're in.</p><p>Next, you'll want to have your recording equipment reasonably close to audio sources, whether that's on the desk at a meeting, at the front of the class during a lecture or close to your mouth when capturing a personal voice memo. Naturally, the ideal distance depends on the volume of sound you're capturing and the sensitivity of the microphone on your recording device, so be sure to test for optimal quality by recording a short snippet and playing it back before you begin.<br></p><p>When you're recording a meeting, conversation or personal voice memo, try to speak slowly and clearly, and encourage others to do so as well. Similarly, ask participants to take turns speaking one at a time, so that voices don't overlap.This will make it a lot easier to transcribe quotes accurately, and will help you avoid playing back your audio repeatedly to figure out what was said. And of course, always ask for permission before recording conversations, whether in person or over the phone.<br></p><p>Finally, make sure your recording device is ready for the task: free up storage space by backing up old recordings and deleting them from the device memory, use fresh or fully charged batteries and set your device to record in the highest quality format possible for clear audio with minimal noise.<br></p><h3>Recording Devices<br></h3><p>Now it's time to pick the right equipment for the job. If you own a smartphone or tablet, you already have a pretty good recorder in the palm of your hand: all you need is an app that lets you record and export high quality format audio.&nbsp;</p><figure class="post_image"><img alt="Notability for iOS" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/284/posts/21100/image/Notability on iOS records audio and saves your handwriting or text too.jpg"><figcaption>Notability on iOS records audio and saves your handwriting or text too</figcaption></figure><p>On iOS, <a href="https://itunes.apple.com/us/app/notability/id360593530" rel="external" target="_blank">Notability</a> records voice notes and syncs them (along with your accompanying handwritten or typed notes) with your iCloud, Dropbox, Google Drive, Box or DAV cloud storage accounts (<a href="https://soundcloud.com/abe/tutsplus-notability-recording-on-ios" rel="external" target="_blank">here's a sample recording</a><a href="https://soundcloud.com/abe/tutsplus-notability-recording-on-ios)">)</a>. Android users can turn to <a href="https://play.google.com/store/apps/details?id=com.coffeebeanventures.easyvoicerecorder" rel="external" target="_blank">Easy Voice Recorder</a>, which generates high-quality WAV format files when you enable PCM recording.</p><figure class="post_image"><img alt="Easy Voice Recorder for Android" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/284/posts/21100/image/Easy Voice Recorder for Android lets you record and export high quality WAV files.jpg"><figcaption>Easy Voice Recorder for Android lets you record and export high quality WAV files</figcaption></figure><p>It's important to choose an app for your device that supports high-quality formats. <a href="https://soundcloud.com/abe/easy-voice-recorder-pro-amr-vs." rel="external" target="_blank">Here's an audio sample that illustrates the difference</a> between low-quality (compressed) and high-quality recording formats on an Android device (Google Nexus 7).&nbsp;&nbsp;It may not be a big deal if you're just recording a short voice memo by yourself in a quiet room, but if you're transcribing long audio clips, clarity is a must.<br></p><p>If you're interested in a standalone recording device, the Sony ICD-AX412 (<a href="http://www.amazon.com/gp/product/B004M8STL8" rel="external" target="_blank">$75 on Amazon</a>) -and Olympus VN-702PC (<a href="http://www.amazon.com/gp/product/B006ZW4HY2" rel="external" target="_blank">$44 on Amazon</a>)&nbsp;come <a href="http://thewirecutter.com/reviews/the-best-voice-recorder/" rel="external" target="_blank">highly recommended</a>, and offer both on-board and expandable storage.<br></p><p>Once you've got your environment and equipment set up, you're ready to record: just hit the red button on your device or app and you're good to go!<br></p><h3>Transferring your recordings<br></h3><p>When you're finished recording, you can transfer your audio files to your computer so you can use them with apps for easy transcription. </p><p>For Android devices with Easy Voice Recorder installed, connect your device via USB cable to your computer, and access your files via My Computer (Windows) or from the drive icon on &nbsp;your desktop (Mac). Alternatively, install and use AirDroid on your Android device to sync with your computer over Wi-Fi via your web browser. Then,&nbsp;navigate to the EasyVoiceRecorder folder in your device storage and copy the recording files over to your computer.</p><p>For iOS devices with Notability, enable syncing to your cloud account of choice and grab the recordings from the downloadable zip files that the app exports.</p><p>For standalone recorders, connect your device via USB cable to your computer, and access your files via My Computer (Windows) or from the drive icon on &nbsp;your desktop (Mac). Copy the recording files over to your computer.</p><p>You can then use these files with a transcription tool.</p><h2>Transcribing Tools<br></h2><p>Now that we've got our audio files ready to go, we can begin transcribing them. The main issue we face is typing out notes while listening to audio is that sometimes you need to pause the recording to finish typing out a sentence. You might also need to slow down playback to hear a phrase correctly, or fast forward to the next important point. And on top of all this, you've got to deal with switching to your text editor window to type what you hear. Thankfully, there are a couple of great apps that can make the task a whole lot easier.</p><h3>Transcribe</h3><p><a href="http://transcribe.wreally.com" rel="external" target="_blank">Transcribe</a> by Wreally combines a text editor with an audio player that supports keyboard shortcuts. With Transcribe, you can type, pause, slow down or speed up playback without ever moving your hands away from your keyboard or even switching windows. The app costs $20/year to use, but includes a free 7-day trial so you can take it for a spin before you commit.</p><figure class="post_image"><img alt="Using Transcribe" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/284/posts/21100/image/Transcribe combines a text editor and keyboard-controlled audio playback in the same window.jpg"><figcaption>Transcribe combines a text editor and keyboard-controlled audio playback in the same window</figcaption></figure><p>To use <a href="http://transcribe.wreally.com" rel="external" target="_blank">Transcribe</a>, just sign up (no credit card required), log in and on the next screen with a blank document, click Choose File near the top of the window to locate and load your audio file. The app supports MP3, MP4, M4A, AMR, WMA, AAC and WAV files, so recordings from most smartphone apps and recorders will work just fine.<br></p><p>Once you've loaded your file, press your Esc key to play it back and begin typing in the text editor. You can then use the keyboard shortcuts shown in the audio player to control playback without having to use your mouse—press Esc to pause or resume playback, F1 to slow it down, and F2 to speed it up. And where you're done, click the Export button in the text formatting toolbar to export your file as a .doc that you can open with Microsoft Word or Google Docs. Transcribe also saves your transcribed text in the browser cache, so you can even use it offline and you don't have to worry about losing your work. &nbsp;<br></p><h3>Draft</h3><p><a href="http://draftin.com" rel="external" target="_blank">Draft</a> is another web app that helps with transcription. Although it primarily offers a Markdown-based text editor and document manager that you can use with any browser, it also packs a neat transcription tool that lets you load both audio and video files from the web, your local storage or cloud storage accounts. Draft is free and supports Vimeo, YouTube, MP4, and FLV video formats, and audio formats like MP3, M4A and AAC that you can load up just by pointing Draft to the source URL. You can also upload files in these formats from your computer, Dropbox, Google Drive, Evernote, Box or FTP storage.</p><figure class="post_image"><img alt="Draft for audio transcribing" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/284/posts/21100/image/Draft handles both audio and video files, including those hosted online.jpg"><figcaption>Draft handles both audio and video files, including those hosted online</figcaption></figure><p>To use <a href="http://draftin.com" rel="external" target="_blank">Draft</a> for transcription, sign up for a free account, log in, click the arrow next to the New Document button and select New Transcription. Next, upload your file or paste a URL to your audio or video content. When your file has finished loading, indicate a section to loop by entering its start and end points.</p><p>For example, if you'd like to loop the first ten seconds, enter 00:00 and 00:10 in the empty fields, and press <b>Play</b>. You can then skip forward (Ctrl/Cmd+Shift+P) or backward (Ctrl/Cmd+Shift+O) in increments equal to the length of the loop you first set up. The audio or video will loop repeatedly until you pause (Ctrl/Cmd+Spacebar) skip forward or backward, and you can get through your transcription quickly and easily.</p><figure class="post_image"><img alt="move through audio in Draft" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/284/posts/21100/image/Create loops and skip forward or backward in increments in Draft.jpg"><figcaption>Create loops and skip forward or backward in increments in Draft</figcaption></figure><p>When you're done with your transcription, Draft will save your document and allow you to export your file in a variety of formats. To do this, click the Home button at the top left of the screen, then click Export and select your preferred format (Text, Markdown, HTML, PDF, Word or Google Docs document, MOBI, PDF or ePUB) and you're done.<br></p><h3>Transcribing Offline</h3><p>Another way to transcribe files on your computer is to use global hotkeys with a desktop media player app while typing in your favorite text editor. Global hotkeys allow you to control playback in your media player using keyboard shortcuts without having to switch between apps. This works with QuickTime, VLC, and many other audio and video playback apps.</p><p>Of course, the caveat here is that your global hotkeys need to be configured so that they don't conflict with other shortcuts or programs on your computer—otherwise, you'll end up launching apps and ordering functions you don't intend to. Your best option is the play and pause buttons on your keyboard, if you have them, combined with other keyboard shortcuts for extra options like skipping and speeding up audio.<br></p><h2>Conclusion<br></h2><p>Choosing to record and transcribe content is a great way to free yourself from having to take notes while a meeting, conversation, lecture or train of thought is in progress. You can instead focus on listening and engaging with other participants, or in the case of personal voice memos, hear yourself think out loud and trash or build on your own ideas freely. And with the easy-to-use tools available today, you can breeze through your transcription tasks quickly and easily. </p><p>Do you have any tips for recording or transcribing notes? Let us know in the comments!</p><p><b>Resources</b>: <a href="http://thenounproject.com/term/microphone/2313/" target="_self">Microphone</a> icon by <a href="http://thenounproject.com/mr.yunis/" target="_self">Travis Yunis</a> from the <a href="http://thenounproject.com/" target="_self">Noun Project</a>; <a href="http://thenounproject.com/term/paper-shredder/5716/" target="_self">Paper-Shredder</a> icon by&nbsp;<a href="http://thenounproject.com/AchtSieben/" target="_self">Maximilian Becker</a> from&nbsp;the&nbsp;<a href="http://thenounproject.com/" target="_self">Noun Project</a>.<br></p><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21100/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21100/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21100/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21100/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-23T08:00:14.558Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-23T08:00:14.558Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:17:"Abhimanyu Ghoshal";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:10;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-20653";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:85:"http://crafts.tutsplus.com/tutorials/how-to-make-a-wooden-air-plant-holder--cms-20653";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:37:"How to Make a Wooden Air Plant Holder";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:5014:"<figure class="final-product final-product--image"><img src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/189/posts/20653/final_image/IMG_1531 (600x461).jpg" alt="Final product image" /><figcaption>What You'll Be Creating</figcaption></figure>Not all house plants need lots of care and sun light. This color-blocked wooden air plant holder will allow you to grown lovely greenery with no soil and very minimal care. Anyone can show off their green thumb (and craft skills) with this project!<h2>Supplies</h2><p><img src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/189/posts/20653/image/air%20plant%20holder%20supplies.jpg" alt=""><br></p><ul><li>Lumber, 10cm (4in) x 10cm (4in) at least 15cm (6in) long<br></li><li>Pencil</li><li>Miter saw</li><li>3cm (1.2in) Forstner bit <br></li><li>Painter's tape or masking tape</li><li>Sandpaper</li><li>Pattern</li><li>Acrylic paint in color of your choice<br></li><li>Air plant</li><li>Safety glasses</li></ul><h2><span class="sectionnum">1.</span>&nbsp;Make the Wooden&nbsp;Block</h2><h3>Step 1</h3><p>Work out the desired height of your planter and mark with pencil. Cut using a miter saw. You might like to experiment by holding the plant next to the timber and working out what height looks best. <br></p><figure class="post_image"><img src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/189/posts/20653/image/air%20plant%20holder%20cut.jpg" alt=""></figure><h3>Step 2</h3><p>Now mark the center of the top of the wooden block you just cut&nbsp;with a straight edge. This is the spot where you will drill the hole for the air plant.</p><figure class="post_image"><img src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/189/posts/20653/image/air%20plant%20holder%201.jpg" alt=""></figure><h3>Step 3</h3><p>Pop on a pair of safety glasses. Using a Forstner bit, carefully drill a hole approximately 2.5cm (1in) to 3.73cm (1.5in) deep.</p><figure class="post_image"><img src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/189/posts/20653/image/air%20plant%20holder%202.jpg" alt=""></figure><h3>Step 4</h3><p>Next, sand all the edges, faces, and corners of your project. Don't forget to sand around the hole you just drilled.</p><figure class="post_image"><img src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/189/posts/20653/image/air%20plant%20holder%203.jpg" alt=""></figure><h2><span class="sectionnum">2.</span>&nbsp;Paint the Block</h2><h3>Step 1</h3><p>Decide on where your paint line will be and mark the point lightly with pencil on all four corners of the block. Use a ruler to ensure your measurements line up.<br></p><figure class="post_image"><img src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/189/posts/20653/image/air%20plant%20holder%204.jpg" alt=""></figure><h3>Step 2</h3><p>Using the lines that you just plotted, tape off all four sides of the block with painter's tape or masking tape. This taped line will help keep your painted line nice and crisp.</p><figure class="post_image"><img src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/189/posts/20653/image/air%20plant%20holder%205.jpg" alt=""></figure><h3>Step 3</h3><p>Carefully paint the block, including the bottom side below the taped line.&nbsp;Once the paint has completely dried, carefully remove the tape and add your favorite air plant!&nbsp;</p><figure class="post_image"><img src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/189/posts/20653/image/air%20plant%20holder%206.jpg" alt=""></figure><h2>Pop In Your Air Plant<br></h2><p>In this tutorial, you learnt all the skills necessary to make a color-blocked wooden air plant holder, including how to mark and cut lumber, drill holes with a Forstner bit, plot drill points, and mask off ares to create blocks of painted color. <br></p><p>Using this skills, you can create a beautiful collection of air plant holders in various heights and colors.</p><figure class="post_image"><img src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/189/posts/20653/image/IMG_1514%20(600x468).jpg" alt=""></figure>Now all you need to do is pop your air plant in the hole your drilled and display your new planter.<br><br>If you enjoyed this tutorial, you might like to look at our other <a target="_blank" rel="external" href="http://crafts.tutsplus.com/categories/woodwork">woodworking tutorials</a>. <br><br>Tell me, how did you go with making your planter? What are you favorite air plants? <br><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/20653/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20653/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20653/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20653/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-23T05:09:22.223Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-23T05:09:22.223Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:14:"Erin Freuchtel";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:11;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21178";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:114:"http://business.tutsplus.com/articles/get-started-with-cause-and-effect-analysis-using-a-fishbone-chart--cms-21178";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:65:"Get Started With Cause and Effect Analysis Using a Fishbone Chart";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:11674:"<br>

<p>Why did that happen? How can we make that happen? These two questions, both of them critically
important in business settings, are essentially the same.</p>

<p>How can two such different questions be identical? After all, one involves analyzing a past event while the other involves
planning for the future. The answer is simple: in both cases you’re asking the
same basic question—that is: “what chain of events causes a particular
outcome?” Whether you’re looking forward
to plan a chain of events, or looking backward to better understand one, you
can use the same tool: Cause and Effect Analysis.</p>

<h2><b>Cause
and Effect: Looking Back</b></h2>

<p>Cause and Effect analysis is typically used
to figure out why something went wrong. Your product is failing, your clients
are frustrated, and you’re losing money. But why? After all, everything was fine up until three
months ago. By analyzing the production process, you may be able to pinpoint
the issues that are to blame. Once you’ve determined where the issues lie, you
can address them—and institute policies to ensure that those same issues don’t
arise again.</p>

<p>Cause and Effect analysis can also help you
to replicate a positive outcome. For example, this month—for the first time
ever—your team exceeded its sales goals. What went right? It’s easy to say “we got lucky,” but most of
the time we make or at least encourage our own luck. So what were the elements
that went into making this month’s sales calls so much more effective than
before?</p>

<h2><b>Cause
and Effect: Planning for the Future</b></h2>

<p>While Cause and Effect Analysis is typically
used to understand what has happened (usually in order to avoid having it
happen again), it can also be used to help plan for the future. How? Rather than attempting to explain an existing
outcome, it is possible to set up a hoped-for outcome, and then analyze the
elements required to bring the outcome about. Once you have a clear idea of
what’s needed, it’s much easier to create a plan of action that is likely to
succeed.</p>

<p>Because the process of analysis involves
breaking down the whole into a set of individual parts, you can also use the
chart created through Cause and Effect Analysis to determine who should take
responsibility for which aspects of the project. If you spent a good deal of
time on the process, you may even have the start of a to-do list for various
members of the project team.</p>

<h2><b>How to
Conduct Cause and Effect Analysis </b></h2>

<p>Cause and Effect Analysis, as it’s conducted in business
today, is one of several Japanese innovations intended to improve quality and
quality control. The process is conducted using a fishbone chart (so named
because it looks like a fish skeleton)—otherwise known as an Ishikawa diagram.
Ishikawa diagrams were designed
during the 1960’s by Kaoru Ishikawa, who managed quality control of processes
in the Kawasaki Shipyard.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/23/posts/21178/image/fishbone-diagram-template.png"><figcaption>Fishbone Chart Template: Use this tool to identify causes of a business problem.</figcaption></figure>

<p>The fishbone chart approach to cause and effect analysis
uses a standard chart to encourage brainstorming and to visually present
findings. When the chart is complete, it is possible to analyze findings
together, and to determine the most important factors involved in either
solving a problem or achieving success. There are four steps involved with
cause and effect analysis. They include identification of the problem or goal,
brainstorming, analysis, and development of an action plan.</p>

<h3>Step 1: Identify the Problem or Goal&nbsp;</h3><p>The entire team must
agree in order for the process to be successful. The goal or problem is then
written on the “head” of the fish. Let’s say that the team’s goal is to ensure
that sales reports are completed in a timely manner at the end of each month. Once
the team agrees to this, the facilitator draws a line with a box or “fish head”
at the end. The goal is written in the box.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/23/posts/21178/image/1-fishbone-diagram.png"><figcaption>Figure 1: The goal here is to deliver monthly sales reports on time.</figcaption></figure>

<h3>Step 2: Brainstorm</h3><p>What will it take to get your sales team, your
managers, and your report writer to work together and produce the needed
reports in a timely manner? Often, it’s
helpful to start with the six general areas that are most likely to impact
almost any business project; these become the primary bones of the fish. &nbsp;</p>

<ul><li>Management</li><li>Equipment</li><li>Material</li><li>People</li><li>Process</li><li>Environment</li></ul>

<p>Those six areas, however, are not
mandatory; <a href="http://quality.enr.state.nc.us/tools/fishbone.htm" target="_self">the State of North Carolina’s website</a> lists other options as
follows: &nbsp;<a href="http://quality.enr.state.nc.us/tools/fishbone.htm"></a></p>

<ul><li>The 4 M’s:&nbsp;Methods, Machines,
Materials, Manpower.</li><li>The 4 P’s:&nbsp;Place, Procedure,
People, Policies.</li><li>The 4 S’s:&nbsp;Surroundings,
Suppliers, Systems, Skills.</li></ul>





<p>Even these, however, are just suggestions. Many organizations
come up with their own categories, selected to reflect their real-world
situation.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/23/posts/21178/image/2-fishbone-diagram.png"><figcaption>Figure 2: The unique categories of production, research, distribution, and writing are identified as the categories reflective of this business problem.</figcaption></figure>

<p>Step two continues with additional brainstorming details
based on general categories. Which people are needed to meet the goal?&nbsp; Each new detail is indicated by a new line
drawn perpendicular to the bone before it. As details are added through the
brainstorming process, more “bones” are added to the chart; in some cases the
chart can wind up looking very complex, because there are so many levels of detail
to be considered.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/23/posts/21178/image/3-fishbone-diagram.png"><figcaption>Figure 3: Specific problems are added to each category—forming the detail (bones) of the diagram.</figcaption></figure>









<h3>Step 3:&nbsp;Chart Analysis</h3><p>Spend some time reviewing the
chart. Do you see the same needs or concerns popping up in different
places? What are the most critical
items, without which you are certain to fail?&nbsp;
</p>

<p>As you and your team look at the chart, it is very likely
that major themes will begin to emerge. You’ll circle those themes on the
fishbone chart, and then organize them on a separate page. You might want to
organize major themes by their importance, or in chronological order. </p>

<h3>Step 4:&nbsp;Develop an Action Plan&nbsp;</h3><p>Based on your
fish bone chart and your analysis, a clear set of priorities should emerge. These
priorities will help you to put together a plan that can be implemented immediately.</p>

<h2><b>Does Cause and Effect
Analysis Work?</b></h2>

<p>Like
any other business tool, Cause and Effect Analysis is just as effective as the
people involved in the process. It’s easy to do a poor job of identifying the
problem and the causes—and if the first part of the process is done
incorrectly, the outcomes will be less useful. That’s why it’s critical to have
a leader who is familiar with the process, and why it’s so important
that the people involved with the analysis fully understand the problem and can
think realistically about solutions.</p>









<p>An article in <a href="http://www.nursingtimes.net/Journals/2013/04/12/k/x/z/Using-fishbone-analysis--to-investigate-problems-160413.pdf" target="_self">Nursing Times</a>, describes
the use of a fish bone chart in Cause and Effect Analysis to determine the
causes of problems with long waiting lines at a clinic. The process was very
effective for the group, and resulted in some innovative ideas including “scoping the requirement for a patient
notes tracking system and considering moving the outpatient clinic to a clinic
with more space.” Once they’d come up
with these general ideas, they put together a specific plan of action, complete
with tasks and deadlines. You can see a simplified version of the chart they
created:</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/23/posts/21178/image/3-fishbone-diagram-waiting-time.png"><figcaption>Figure 4: An example of a patient waiting time problem.</figcaption></figure>

<p>Why did this process
work so well? The author says, “Having a
facilitator was key to progressing discussions as it let the group focus on
the problem at hand, while someone else facilitated the session.” She also describes some tools the group used
during the brainstorming process, including the Six Sigma tool called the “Five
Whys,” which involves drilling down from apparent causes to deep-rooted issues.</p>

<h2><b>Is Cause and Effect Analysis Right
for Our Team?</b></h2>

<p>Cause and
Effect Analysis may be a good tool for your organization—or it may create
more troubles than it solves. Bottom line, if your team doesn’t have the time,
authority, insight, or leadership to undertake meaningful Cause and Effect Analysis,
you could find yourself wasting time while also creating negative interactions
and frustration among your team members.</p>

<p>To determine
whether this tool is likely to be useful to you, go through this checklist; if
you find that you are answering most of the questions with a “yes,” then Cause
and Effect Analysis may be a good choice.</p>

<ol><li>Do you have a concrete problem or
goal upon which your team can agree?</li><li>Can you put together a group of
people who understand and have the authority to take action on the problem or
goal you’re considering?</li><li>Does your group have the time
available (at least a few hours) to take part in a Cause and Effect Analysis?</li><li>Do you have a facilitator (or have
access to a facilitator) who has experience in leading this type of
brainstorming process and who also understands your organization’s particular
needs and parameters?</li><li>Do you have dedicated space to use
for a Cause and Effect Analysis?</li></ol>









<p>If you feel
you’re ready to undertake a Cause and Effect Analysis, congratulations!&nbsp; You’re well on your way to a better process
for achieving your goals.</p><h2>Resources</h2><p>Graphic Credit: <a href="http://thenounproject.com/term/fish-skeleton/3167/" target="_self">Fish-Skeleton</a>&nbsp;designed by&nbsp;<a href="http://thenounproject.com/gilad1">Gilad Fried</a>&nbsp;from the&nbsp;<a href="http://www.thenounproject.com/">Noun Project</a>.<br></p><br><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21178/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21178/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21178/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21178/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-22T18:14:54.047Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-22T18:14:54.047Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:12:"Lisa Jo Rudy";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}}}}}}}}s:4:"type";i:512;s:7:"headers";a:23:{s:6:"server";s:16:"cloudflare-nginx";s:4:"date";s:29:"Fri, 23 May 2014 19:51:17 GMT";s:12:"content-type";s:35:"application/atom+xml; charset=utf-8";s:14:"content-length";s:6:"187643";s:10:"connection";s:10:"keep-alive";s:10:"set-cookie";s:134:"__cfduid=d15a10327c698e59c928fe950cc83ae411400874676690; expires=Mon, 23-Dec-2019 23:50:00 GMT; path=/; domain=.tutsplus.com; HttpOnly";s:13:"accept-ranges";s:5:"bytes";s:3:"age";s:2:"75";s:13:"cache-control";s:8:"no-cache";s:4:"etag";s:34:""0f05370da866a5b4bd2833d33f2eb605"";s:6:"status";s:6:"200 OK";s:4:"vary";s:22:"Accept,Accept-Encoding";s:3:"via";s:11:"1.1 varnish";s:22:"x-content-type-options";s:7:"nosniff";s:15:"x-frame-options";s:43:"ALLOW-FROM https://analytics.webtrends.com/";s:12:"x-powered-by";s:23:"Phusion Passenger 4.0.5";s:12:"x-request-id";s:36:"0bdf9010-29e2-4c36-9454-def74b879c11";s:9:"x-runtime";s:8:"0.052650";s:15:"x-ua-compatible";s:8:"chrome=1";s:9:"x-varnish";s:19:"185494442 185492487";s:15:"x-varnish-cache";s:3:"HIT";s:16:"x-xss-protection";s:13:"1; mode=block";s:6:"cf-ray";s:20:"12f3c9895fcc01b0-FRA";}s:5:"build";s:14:"20121030085402";}