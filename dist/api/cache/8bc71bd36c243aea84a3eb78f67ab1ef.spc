a:4:{s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"feed";a:1:{i:0;a:6:{s:4:"data";s:55:"
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:27:"http://www.w3.org/2005/Atom";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"DailyJS";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:3:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"href";s:18:"http://dailyjs.com";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:4:"self";s:4:"type";s:20:"application/atom+xml";s:4:"href";s:35:"http://feeds.feedburner.com/dailyjs";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:2:{s:3:"rel";s:3:"hub";s:4:"href";s:32:"http://pubsubhubbub.appspot.com/";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:25:"2014-06-18T18:46:27+01:00";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:19:"http://dailyjs.com/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:6:"
   
 ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:7:"DailyJS";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}s:5:"entry";a:10:{i:0;a:6:{s:4:"data";s:22:"
   
   
   
   
   
 ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:27:"http://www.w3.org/2005/Atom";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:53:"Node Roundup: Node 0.8.27 and 0.10.29, BipIO, Reducto";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"href";s:66:"http://feedproxy.google.com/~r/dailyjs/~3/8a65nIky4Cg/node-roundup";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:25:"2014-06-18T00:00:00+01:00";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:42:"http://dailyjs.com/2014/06/18/node-roundup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:3343:"
     <h3 id='node_0827_and_01029'>Node 0.8.27 and 0.10.29</h3>

<p>You may be surprised to see a Node 0.8 release here, but <a href='http://blog.nodejs.org/2014/06/16/openssl-and-breaking-utf-8-change/'>0.8.27 and 0.10.29 have been updated</a> to fix an OpenSSL and UTF-8 encoding issue:</p>

<blockquote>
<p>Additionally these releases address the fact that V8 UTF-8 encoding would allow unmatched surrogate pairs. That is to say, previously you could construct a valid JavaScript string (which are stored internally as UCS-2), pass it to a Buffer as UTF-8, send and consume that string in another process and it would fail to interpret because the UTF-8 string was invalid.</p>

<p>This breaks backward compatibility for the specific reason that unsanitized strings sent as a text payload for an RFC compliant WebSocket implementation should result in the disconnection of the client. If the client attempts to reconnect and receives another invalid payload it must disconnect again. If there is no logic to handle the reconnection attempts, this may lead to a denial of service attack.</p>
</blockquote>

<p>The post includes an example with <code>Buffer</code>, and demonstrates how even if you&#8217;re not explicitly creating <code>Buffer</code> instances from strings Node might still do it behind the scenes.</p>

<h3 id='bipio'>BipIO</h3>

<p><a href='https://bip.io/'>BipIO</a> (GitHub: <a href='https://github.com/bipio-server/bipio'>bipio-server / bipio</a>, License: <em>GPLv3</em>) an API platform for consuming and composing APIs based on graph definitions and pipelines. You can run your own server, and there&#8217;s a closed source web UI that you can <a href='https://bip.io/signup'>sign up to</a>:</p>

<blockquote>
<p>If you&#8217;re familiar with Yahoo Pipes, IFTTT, Zapier, Mulesoft, Cloudwork or Temboo - the concept is a little similar. The server has a small footprint which lets you create and automate an internet of things that matter to you. It can be installed alongside your existing open source app or prototype for out-of-band message transformation, feed aggregation, queuing, social network fanout or whatever you like, even on your Rasberry Pi.</p>
</blockquote>

<p>It uses MongoDB and RabbitMQ, and the readme has help for setting it up on a server with Monit.</p>

<h3 id='reducto'>Reducto</h3>

<p>Reducto (GitHub: <a href='https://github.com/michaelleeallen/reducto'>michaelleeallen / reducto</a>, License: <em>MIT</em>, npm: <a href='https://www.npmjs.org/package/reducto'>reducto</a>) by Michael Allen is configuration framework for Express that aims to simplify the creation of routes for APIs.</p>

<blockquote>
<p>The main goal of reducto is to break apart the routing mechanism into smaller, more cohesive components. By reducing your app to just middleware, data transforms, and reusable service calls you end up with a smaller set of code to reason about and thus make your app easier to write and maintain.</p>
</blockquote>

<p>You can create routes using JSON files that map middleware, service handlers, data fixtures, and transform functions to routes. It also supports services, which are callable HTTP endpoints. It comes with an example application that shows weather for a given zip code.</p>
   <img src="http://feeds.feedburner.com/~r/dailyjs/~4/8a65nIky4Cg" height="1" width="1"/>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:1:{i:0;a:5:{s:4:"data";s:42:"http://dailyjs.com/2014/06/18/node-roundup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:22:"
   
   
   
   
   
 ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:27:"http://www.w3.org/2005/Atom";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"Hya: JavaScript Synths and Plugins";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"href";s:57:"http://feedproxy.google.com/~r/dailyjs/~3/_j_wM8bDJyc/hya";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:25:"2014-06-17T00:00:00+01:00";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:33:"http://dailyjs.com/2014/06/17/hya";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:1620:"
     <div class='image'>
  <img src='http://dailyjs.com/images/posts/hya.png' />
  <small>A Hya session.</small>
</div>
<p>Cristiano Belloni has relaunched <a href='http://dailyjs.com/2013/03/22/kievll-capturing/'>KievII Host</a> as <a href='http://app.hya.io/'>Hya.io</a>. This is a web-based plugin-based audio application that supports hardware MIDI though <a href='http://webaudio.github.io/web-midi-api/'>Web MIDI</a>, audio synthesis, sequencers, and lots of plugins.</p>

<p>The project has a <a href='http://blog.hya.io/'>blog</a> with announcements about updates, plugins, and some technical background. The web interface is closed source, but the plugins Cristiano has written are open source. For example, <a href='https://github.com/janesconference/hy-osc'>hy-osc</a> is an oscillator, and <a href='https://github.com/janesconference/kmx'>kmx</a> is a mixer.</p>

<p>Hya supports AMD and ES6 modules. They use a simple JSON object that describes the plugin, and a constructor function. You can bind to the Hya GUI using various events, like <code>handleMouseOver</code> and <code>handleMouseDown</code>. The post <a href='http://blog.hya.io/developing-a-canvas-plugin-for-hyacinth/'>Developing a canvas plugin for Hya.io</a> explains how to create plugins in detail.</p>

<p><a href='http://hya.io/#/docs'>The documentation</a> has details on MIDI interaction and the <code>initPlugin</code> constructor. It&#8217;s amazing to think that you could connect a MIDI control surface or keyboard to a web application.</p>
   <img src="http://feeds.feedburner.com/~r/dailyjs/~4/_j_wM8bDJyc" height="1" width="1"/>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:1:{i:0;a:5:{s:4:"data";s:33:"http://dailyjs.com/2014/06/17/hya";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:22:"
   
   
   
   
   
 ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:27:"http://www.w3.org/2005/Atom";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Miminal Promises with Thenable";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"href";s:62:"http://feedproxy.google.com/~r/dailyjs/~3/SjL3CvGHMAU/thenable";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:25:"2014-06-16T00:00:00+01:00";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:38:"http://dailyjs.com/2014/06/16/thenable";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:2113:"
     <p><img src='http://dailyjs.com/images/posts/thenable.png' alt='Thenable' /></p>

<p>If you want to use ES6 promises using the <code>Promise</code> object in a library or module, then there&#8217;s a new implementation that you might want to check out. Thenable (GitHub: <a href='https://github.com/rse/thenable'>rse / thenable</a>, License: <em>MIT</em>) by Ralf S. Engelschall is a <code>Promise</code> implementation based on <a href='http://promisesaplus.com/'>Promises/A+</a>.</p>

<blockquote>
<p>This is a strictly-compliant Promises/A+ 1.1.1 implementation in just 2KB of (compressed) code, which passes the official Promises/A+ Test-Suite and includes back-references to the relevant specification statements. It just provides a minimum Promise functionality, because it is intended to be directly embedded into ECMAScript 5 based libraries and frameworks, in order to dependency-free leverage from Promises and be able to return &#8220;thenable&#8221; Promise objects to applications.</p>
</blockquote>

<p>Because Thenable is a minimum implementation of Promises/A+, it&#8217;s suited to the creation of libraries that are forwards compatible, rather than for consumption in JavaScript applications. To reinforce the point, Ralf hasn&#8217;t published it to npm or Bower.</p>

<blockquote>
<p>Instead, please download the raw thenable.min.js and include it verbatim into your library/framework. The usual approach for this is to temporarily emulate a CommonJS environment within your library/framework to get its Thenable object.</p>
</blockquote>

<p>It has a <code>noConflict</code> option for browsers, and supports AMD, CommonJS, and browsers.</p>

<p>If you want to use Promises/A+ in your applications, Ralf recommends <a href='https://github.com/petkaantonov/bluebird'>Bluebird</a>, and there&#8217;s a large list of other implementations on the promises spec wiki: <a href='https://github.com/promises-aplus/promises-spec/blob/master/implementations.md'>promises-spec / implementations.md</a>.</p>
   <img src="http://feeds.feedburner.com/~r/dailyjs/~4/SjL3CvGHMAU" height="1" width="1"/>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:1:{i:0;a:5:{s:4:"data";s:38:"http://dailyjs.com/2014/06/16/thenable";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:22:"
   
   
   
   
   
 ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:27:"http://www.w3.org/2005/Atom";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:56:"Web Worker Contest, Steady.js, Jasmine Integration Tests";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"href";s:83:"http://feedproxy.google.com/~r/dailyjs/~3/oswj2RXPy5A/web-worker-steady-jasmine-int";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:25:"2014-06-13T00:00:00+01:00";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:59:"http://dailyjs.com/2014/06/13/web-worker-steady-jasmine-int";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:4595:"
     <h3 id='web_worker_contest'>Web Worker Contest</h3>

<p>The <a href='http://www.webworkercontest.net/'>Web Worker Contest</a>, sent in by Stefan Trenkel, is a JavaScript game where two programs compete to conquer a two-dimensional space using simple movement commands.</p>

<blockquote>
<p>On a playing area of 100 x 100 square fields two JavaScript programs compete against each other. From a randomly allotted starting point they must conquer as many fields as possible. The winner is who occupies most fields at the end. A move is to conquer from the current field either the upper, lower, right or left adjacent field. The new field can be occupied only if it was not previously occupied by the opponent&#8217;s program. If a move is possible (the new field is free) the current position changes to the desired field. If a move is not possible (the field is occupied by the opponent or you want to leave the playing area), you stay on the current position. Fields that one has previously occupied can be used again (but do not count double). The programs do not have any information about the playing area.</p>
</blockquote>

<p>The contest is based on the Web Worker API:</p>

<blockquote>
<p>Your own Web Worker is simply a local JavaScript file with appropriate code. In this case your own Web Worker is not uploaded to the server. This option is primarily for testing and optimizing your own Web Worker. If you want to participate in the WWC you have to upload your Worker on the Upload page.</p>
</blockquote>

<p>You can view <a href='http://www.webworkercontest.net/game.php'>running games</a> and read more about the concept in the <a href='http://www.webworkercontest.net/guide.php'>guide</a>.</p>

<h3 id='steadyjs'>Steady.js</h3>

<p><a href='http://lafikl.github.io/steady.js/'>Steady.js</a> (GitHub: <a href='https://github.com/lafikl/Steady.js'>lafikl / steady.js</a>, License: <em>MIT</em>) by Khalid Lafi is a library for elegantly responding to <code>onscroll</code> events. With Steady.js, the <code>onscroll</code> handler collects data, then offloads the work to <code>requestAnimationFrame</code>. It throttles events, and works like <code>@media-query</code>.</p>

<p>Steady.js is based around &#8220;trackers&#8221;: these provide the logic that the data collector uses. An example of a built-in tracker is <code>scrollTop</code> which indicates how far a scrollable element has moved from the top.</p>

<p>Basic usage looks like this:</p>
<div class='highlight'><pre><code class='javascript'><span class='kd'>var</span> <span class='nx'>s</span> <span class='o'>=</span> <span class='k'>new</span> <span class='nx'>Steady</span><span class='p'>({</span>
  <span class='nx'>conditions</span><span class='o'>:</span> <span class='p'>{</span>
    <span class='nx'>width</span><span class='o'>:</span> <span class='mi'>400</span><span class='p'>,</span>
    <span class='nx'>scrollX</span><span class='o'>:</span> <span class='mi'>0</span><span class='p'>,</span>
    <span class='nx'>max</span><span class='o'>-</span><span class='nx'>bottom</span><span class='o'>:</span> <span class='mi'>200</span>
  <span class='p'>},</span>
  <span class='nx'>throttle</span><span class='o'>:</span> <span class='mi'>100</span><span class='p'>,</span>
  <span class='nx'>handler</span><span class='o'>:</span> <span class='nx'>fn</span>
<span class='p'>});</span>

<span class='nx'>s</span><span class='p'>.</span><span class='nx'>addCondition</span><span class='p'>(</span><span class='s1'>&#39;scrollX&#39;</span><span class='p'>,</span> <span class='mi'>0</span><span class='p'>);</span>
</code></pre>
</div>
<p>The documentation has an example of a custom tracker that you can extend with your own behaviour.</p>

<h3 id='jasmine_integration_tests'>Jasmine Integration Tests</h3>

<p><a href='https://github.com/jordinl/jasmine-integration'>jasmine-integration</a> by Jordi Noguera is an integration testing extension for Jasmine. It allows you to run tests in browsers by using an <code>iframe</code>, or in headless mode using PhantomJS.</p>

<p>The documentation shows how to use it with Grunt, so you can execute your tests against a browser with <code>grunt jasmine:server</code>, or in headless mode using <code>grunt jasmine:server:ci</code>.</p>

<p>Jordi has written a sample app with tests called <a href='https://github.com/jordinl/node-todo'>node-todo</a> which demonstrates how the same specs can be used for browser testing and headless tests on the command-line.</p>
   <img src="http://feeds.feedburner.com/~r/dailyjs/~4/oswj2RXPy5A" height="1" width="1"/>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:1:{i:0;a:5:{s:4:"data";s:59:"http://dailyjs.com/2014/06/13/web-worker-steady-jasmine-int";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:22:"
   
   
   
   
   
 ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:27:"http://www.w3.org/2005/Atom";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:39:"Why Ramda?, Two-Way Data Binding Review";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"href";s:67:"http://feedproxy.google.com/~r/dailyjs/~3/_SbkZ7gKrw4/ramda-two-way";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:25:"2014-06-12T00:00:00+01:00";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:43:"http://dailyjs.com/2014/06/12/ramda-two-way";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:2573:"
     <h3 id='why_ramda'>Why Ramda?</h3>

<p>Scott Sauyet sent in <a href='http://fr.umio.us/why-ramda/'>Why Ramda?</a>, a post that attempts to explain the <a href='https://github.com/CrossEye/ramda'>Ramda</a> library:</p>

<blockquote>
<p>To those not used to functional programming, Ramda seems to serve no purpose whatsoever. Most of its major capabilities are already covered by libraries like Underscore and LoDash.</p>

<p>These folks are right. If you want to keep coding with the same imperative and object-oriented styles you&#8217;ve been using, Ramda does not have much to offer you.</p>

<p>However, it does offer a different style of coding, a style that&#8217;s taken for granted in purely functional programming languages: Ramda makes it simple for you to build complex logic through functional composition. Note that any library with a compose function will allow you do functional composition; the real point here is: &#8220;makes it simple&#8221;.</p>
</blockquote>

<p>The article builds on the functional composition idea and leads up to the kind of data-focused programming that Ramda makes possible.</p>

<h3 id='twoway_data_binding_review'>Two-Way Data Binding Review</h3>

<p><a href='http://n12v.com/2-way-data-binding/'>Two-Way Data Binding</a> by Nikita Vasilyev is a review of two-way data binding in Backbone, React, Angular, Meteor and plain JavaScript.</p>

<p>It highlights an issue that some libraries might have if they change fields at the wrong time:</p>

<blockquote>
<p>The problem is that data flows from an input field to a model, and then back to the same input field, overriding the current value even if it&#8217;s exactly the same.</p>

<p>React.js doesn&#8217;t have Backbone&#8217;s problem with moving the cursor position. Its virtual DOM, a layer between the actual DOM and React&#8217;s state, prevents React from unnecessary DOM changes.</p>
</blockquote>

<p>There&#8217;s also an informative comment by Leo Horie about the effort required to learn each framework:</p>

<blockquote>
<p>Something that strikes me about the framework versions is the amount of framework-specific knowledge required to get these examples working. It&#8217;s one thing to say &#8220;here&#8217;s a version in framework X&#8221;, and it&#8217;s quite another to actually write the code (from the standpoint of someone who&#8217;s still considering framework options and who is not familiar with the lingo and caveats for any of them.)</p>
</blockquote>
   <img src="http://feeds.feedburner.com/~r/dailyjs/~4/_SbkZ7gKrw4" height="1" width="1"/>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:1:{i:0;a:5:{s:4:"data";s:43:"http://dailyjs.com/2014/06/12/ramda-two-way";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:22:"
   
   
   
   
   
 ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:27:"http://www.w3.org/2005/Atom";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:81:"Node Roundup: npm's New Web Framework, Notes from the Road, TJ Fontaine Interview";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"href";s:66:"http://feedproxy.google.com/~r/dailyjs/~3/E3dvqvwzX3k/node-roundup";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:25:"2014-06-11T00:00:00+01:00";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:42:"http://dailyjs.com/2014/06/11/node-roundup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:3579:"
     <h3 id='npms_new_web_framework'>npm&#8217;s New Web Framework</h3>

<p>In <a href='http://blog.npmjs.org/post/88024339405/nearing-practical-maintainability'>Nearing Practical Maintainability</a> on the official npm blog, there&#8217;s a discussion about the decision to use <a href='http://hapijs.com/'>hapi.js</a> for npm&#8217;s new site:</p>

<blockquote>
<p>Both Hapi and Express rate extremely well against our juding criteria. To choose between the two, it pretty much came down to the framework architecture: Hapi&#8217;s plugin system means that we can isolate different facets and services of the application in ways that would allow for microservices in the future. Express, on the other hand, requires a bit more configuration to get the same functionality (it&#8217;s certainly capable!).</p>
</blockquote>

<p>The current <a href='https://github.com/npm/npm-www'>npm-www</a> has a lot of dependencies that you might have seen before: browserify, uglifyjs, moment, ejs, and nodemailer are all popular modules. I think using something like hapi.js or Express makes sense, even if it just gives the project some architectural hints.</p>

<blockquote>
<p>While, yes, we could use barebones Node.js and roll our own framework, we want to avoid the same &#8220;special snowflake&#8221; situation that we&#8217;re currently in. Plus, by using a framework, we can focus more on pushing out the features our community wants and needs, instead of debugging some weird nook and/or cranny that someone forgot about.</p>
</blockquote>

<h3 id='notes_from_the_road'>Notes from the Road</h3>

<p><a href='http://blog.nodejs.org/2014/06/11/notes-from-the-road/'>Notes from the Road</a> is a post on Node&#8217;s official blog by TJ Fontaine about the <em>Node on the Road</em> events:</p>

<blockquote>
<p>These Node on the Road events are successful because of the incredible support from the community and the existing meetup organizations in their respective cities. But the biggest advantage is that the project gets to solicit feedback directly from our users about what is and isn&#8217;t working for them in Node.js, what modules they&#8217;re using, and where they need Node to do better.</p>
</blockquote>

<p>From these experiences TJ has written up some notes about Node&#8217;s release schedule, future documentation improvements, and the path to becoming a Node contributor:</p>

<blockquote>
<p>In an effort to make it easier for users to contribute to Node.js the project has decided to lift the requirement of signing the CLA before contributions are eligible for integration. Having to sign the CLA could at times be a stumbling block for a contribution. It could involve a long conversation with your legal department to ultimately contribute typo corrections.</p>
</blockquote>

<h3 id='tj_fontaine_interview'>TJ Fontaine Interview</h3>

<p>Meanwhile, the Node hosting company Modulus has <a href='http://blog.modulus.io/tj-fontaine-interview'>interviewed TJ Fontaine</a>, where some of these points are reiterated:</p>

<blockquote>
<p>If you&#8217;re looking for ways to contribute to Node itself, the website will be soon be going through an overhaul to improve our documentation. We&#8217;re going to be adding a lot more documentation, cleaning up what we already have, as well as designing the pieces to help internationalize the site. Node&#8217;s community is globally diverse, we should be working to enable Node users everywhere they are.</p>
</blockquote>
   <img src="http://feeds.feedburner.com/~r/dailyjs/~4/E3dvqvwzX3k" height="1" width="1"/>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:1:{i:0;a:5:{s:4:"data";s:42:"http://dailyjs.com/2014/06/11/node-roundup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:22:"
   
   
   
   
   
 ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:27:"http://www.w3.org/2005/Atom";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"Node Hardware Hacking with Tessel";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"href";s:60:"http://feedproxy.google.com/~r/dailyjs/~3/3vJEi0F2CC8/tessel";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:25:"2014-06-10T00:00:00+01:00";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:36:"http://dailyjs.com/2014/06/10/tessel";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:2727:"
     <div class='image'>
  <img src='http://dailyjs.com/images/posts/tessel-horizontal.png' width='530' />
  <small>Node-compatible hardware.</small>
</div>
<p>Imagine being able to run <code>npm install gprs</code> to add GPRS tracking support to a hardware project&#8230; Well, now you can with <a href='https://tessel.io/'>Tessel</a>!</p>

<p>The idea behind hardware platforms like Tessel is to make it easier for software developers to interface with hardware. This is ideal if you&#8217;ve ever thought it would be nice to hook up a movement sensor to a camera to take a photo whenever your dog or cat moves.</p>

<p>Microcontrollers are chips that contain a processor, memory, and I/O. You can hook them up to sensors for input, and things like servos and speakers for output. Unfortunately microcontrollers have limitations &#8211; once you start adding the amount of RAM and processing power required for a high-level language like JavaScript then the costs add up. Also, while they can be programmed, most of them aren&#8217;t trivial to program &#8211; some have to be flashed with special hardware.</p>

<p>This is why Arduino was such a big deal: it made it easier for programmers and non-technical tinkerers to upload code to a microcontroller using a computer and USB cable.</p>

<p>Tessel and <a href='http://www.espruino.com/'>Espruino</a> have iterated on Arduino by using slightly more powerful hardware to allow JavaScript to run. Espruino&#8217;s strength is it uses a specialised version of JavaScript that means it can use cheaper, low-powered hardware.</p>

<p>On the other hand, Tessel has built-in Wi-Fi and an ARM Cortex-M3 microcontroller. Because it&#8217;s so powerful, it can run thousands of standard Node modules straight from npm. And even better, <a href='https://tessel.io/modules'>Tessel has a wide selection of hardware modules</a>, including:</p>

<ul>
<li>Accelerometer</li>

<li>Audio (MP3/AAC/WMA/MIDI/FLAC/Ogg Vorbis)</li>

<li>Bluetooth LE</li>

<li>Camera</li>

<li>MicroSD</li>

<li>Relay (for controlling higher-powered devices)</li>

<li>Servo</li>
</ul>

<p>Naturally all of these toys come at a price: Tessel with a single module costs $99. You can also buy Tessel with all available modules for $599.</p>

<p>I have an Espruino, but I don&#8217;t have a Tessel yet. I like the idea of using <code>npm install</code> with Tessel, but Espruino is already easy to connect to sensors and other hardware, particularly for those with Arduino experience.</p>

<p>My recommendation is to try Tessel if you&#8217;re perplexed by hardware but good at Node, and have some free time and cash.</p>
   <img src="http://feeds.feedburner.com/~r/dailyjs/~4/3vJEi0F2CC8" height="1" width="1"/>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:1:{i:0;a:5:{s:4:"data";s:36:"http://dailyjs.com/2014/06/10/tessel";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:22:"
   
   
   
   
   
 ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:27:"http://www.w3.org/2005/Atom";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"jsEq, Angular-breadcrumb";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"href";s:77:"http://feedproxy.google.com/~r/dailyjs/~3/6d01jDXe1tg/jseq-angular-breadcrumb";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:25:"2014-06-09T00:00:00+01:00";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:53:"http://dailyjs.com/2014/06/09/jseq-angular-breadcrumb";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:2276:"
     <h3 id='jseq'>jsEq</h3>

<p>jsEq (GitHub: <a href='https://github.com/loveencounterflow/jseq'>loveencounterflow / jseq</a>, License: <em>ISC</em>) is a deep equality test suite:</p>

<blockquote>
<p>There are a couple of related, recurrent and, well, relatively &#8216;deep&#8217; problems that vex many people who program in JavaScript on a daily base, and those are sane (deep) equality testing, sane deep copying, and sane type checking.</p>
</blockquote>

<p>It highlights how much variance there is between different equality implementations, including lodash, Underscore, Node&#8217;s <code>assert.deepEqual</code>, and more.</p>

<p>The project uses dependencies from npm, so even though it uses lots of dependencies it&#8217;s easy to install and run the tests.</p>

<p>The readme has a list of axioms that are used to design the tests. So far, Underscore and lodash seem to be winning:</p>

<blockquote>
<p>I sorted the results, and seeing that underscore got the highscore (pun intended), it surprised me to see that it insisted on treating +0 and -0 as not equal. Ultimately, this led to the discovery of the second Axiom, and with that in my hands, it became clear that underscore got this one right and my test case got it wrong: Since there are known programs that behave differently with positive and negative zero, these two values must not be considered equal.</p>
</blockquote>

<p>The output of the test suite looks incredibly cool &#8211; you can easily see the output of a huge amount of tests. There&#8217;s a glorious console screenshot in the readme.</p>

<h3 id='angularbreadcrumb'>Angular-breadcrumb</h3>

<p>Angular-breadcrumb (GitHub: <a href='https://github.com/ncuillery/angular-breadcrumb'>ncuillery / angular-breadcrumb</a>, License: <em>MIT</em>) by Nicolas Cuillery is a module for generating breadcrumb navigation. You can use the <code>ncy-breadcrumb</code> directive to apply it.</p>

<p>It&#8217;s based on the <a href='https://github.com/angular-ui/ui-router'>AngularUI Router</a>, and Nicolas has been writing pretty solid documentation in the <a href='https://github.com/ncuillery/angular-breadcrumb/wiki'>Angular-breadcrumb wiki</a>.</p>
   <img src="http://feeds.feedburner.com/~r/dailyjs/~4/6d01jDXe1tg" height="1" width="1"/>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:1:{i:0;a:5:{s:4:"data";s:53:"http://dailyjs.com/2014/06/09/jseq-angular-breadcrumb";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:22:"
   
   
   
   
   
 ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:27:"http://www.w3.org/2005/Atom";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:46:"MotorCortex.js, Testing AngularJS with Jasmine";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"href";s:81:"http://feedproxy.google.com/~r/dailyjs/~3/FnrsGseIrAQ/motorcortex-angular-testing";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:25:"2014-06-06T00:00:00+01:00";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:57:"http://dailyjs.com/2014/06/06/motorcortex-angular-testing";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:3025:"
     <h3 id='motorcortexjs'>MotorCortex.js</h3>

<blockquote>
<p>Think of dancer dancing or a human just walking the street. It is extremely unnatural to think that each part of the body acts independently. A centralized mechanism controls all parts in order to produce a smooth, elastic and natural movement. The &#8220;motor cortex&#8221;, is the specific part of the brain that does exactly this job.</p>
</blockquote>

<p>The idea of declarative templates seems to be spilling into the world of client-side animation. <a href='http://motorcortexjs.com/'>MotorCortex.js</a> (GitHub: <a href='https://github.com/andreas-trad/motorcortexjs'>andreas-trad / motorcortexjs</a>, License: <em>WTFPL</em>) by Andreas Trantidi is a new library that builds on Velocity.js to provide an animation API that&#8217;s based on CSS syntax.</p>

<p>With MotorCortex.js, external <code>*.mss</code> files determine animation parameters. These are based on the CSS parameters that are supported by Velocity.js:</p>
<div class='highlight'><pre><code class='css'><span class='nc'>.section</span><span class='nd'>:myEvent</span><span class='p'>{</span>
  <span class='n'>duration</span><span class='o'>:</span> <span class='m'>400</span><span class='p'>;</span>
  <span class='k'>top</span><span class='o'>:</span> <span class='m'>300px</span><span class='p'>;</span>
<span class='p'>}</span>
</code></pre>
</div>
<p>For more examples with the associated CSS and JavaScript, see <a href='http://motorcortexjs.com/#examples'>http://motorcortexjs.com/#examples</a>.</p>

<h3 id='testing_angularjs_with_jasmine'>Testing AngularJS with Jasmine</h3>

<p>David Posin sent in <a href='http://randomjavascript.blogspot.co.uk/2014/06/angular-and-jasmine-injecting-into-test.html'>Angular and Jasmine: Injecting into the test environment</a>. He&#8217;s been using Jasmine for tests in both Node and client-side JavaScript, so he wanted to use it with Angular as well:</p>

<blockquote>
<p>Angular requires a very specific environment in which to function. The result of that can be a significant amount of boilerplate when creating tests for Angular applications in Jasmine. The good news is that the amount of redundancy can be minimized with careful test organization.</p>
</blockquote>

<p>The way he does this is by creating embedded suites:</p>

<blockquote>
<p>The spec file will have one <code>describe</code> that contains that spec&#8217;s entire content. Inner <code>describe</code> clauses will be used to manage and break up the tests. Inside of the main over-arching <code>describe</code> we will add variables to contain the services that all the clauses will need.</p>
</blockquote>

<p>I too find it frustrating to have to switch my preferred test library because of a framework&#8217;s design, so it&#8217;s interesting that he managed to get Jasmine working in the end. It can be quite hard to think the Angular way for relative newcomers.</p>
   <img src="http://feeds.feedburner.com/~r/dailyjs/~4/FnrsGseIrAQ" height="1" width="1"/>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:1:{i:0;a:5:{s:4:"data";s:57:"http://dailyjs.com/2014/06/06/motorcortex-angular-testing";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:22:"
   
   
   
   
   
 ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:27:"http://www.w3.org/2005/Atom";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"Receiving Emails with Node";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"href";s:60:"http://feedproxy.google.com/~r/dailyjs/~3/qXFtpcIhnX8/mailin";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:25:"2014-06-05T00:00:00+01:00";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:36:"http://dailyjs.com/2014/06/05/mailin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:3039:"
     <p>One of the things I like to evangelise about Node is the fact it&#8217;s good for creating any network servers, not just web stuff. Florent Galland sent in <a href='http://mailin.io/'>Mailin</a> (GitHub: <a href='https://github.com/Flolagale/mailin'>Flolagale / mailin</a>, License: <em>MIT</em>, npm: <a href='http://mailin.io/'>mailin</a>), which allows your web apps to receive inbound emails. What&#8217;s cool about Mailin is it runs as an SMTP server, so rather than having to configure a mail server you can just use Mailin by itself.</p>

<p><a href='http://mailin.io'>Mailin&#8217;s homepage</a> has a cool demo that allows you to send it an email and see it appear on the page. This works using Mailin&#8217;s webhook.</p>

<p><img src='http://dailyjs.com/images/posts/mailin.png' alt='Mailin' /></p>

<p>You can configure the webhook when the server is started:</p>
<div class='highlight'><pre><code class='javascript'><span class='nx'>mailin</span> <span class='o'>--</span><span class='nx'>webhook</span> <span class='nx'>http</span><span class='o'>:</span><span class='c1'>//example.com/incoming_emails</span>
</code></pre>
</div>
<p>The documentation explains how to install it with <code>authbind</code> for safe binding to port 25, otherwise <code>sudo</code> or a root user would be required.</p>

<p>The documentation also mentions optional spam detection support.</p>

<p>Mailin is built with the <a href='https://www.npmjs.org/package/simplesmtp'>simplesmtp</a> module. This provides a Node API for building SMTP servers. It has an API that should be familiar to anyone who has written HTTP code with Node:</p>
<div class='highlight'><pre><code class='javascript'><span class='nx'>simplesmtp</span><span class='p'>.</span><span class='nx'>createSimpleServer</span><span class='p'>({</span> <span class='nx'>SMTPBanner</span><span class='o'>:</span> <span class='s1'>&#39;My Server&#39;</span> <span class='p'>},</span> <span class='kd'>function</span><span class='p'>(</span><span class='nx'>req</span><span class='p'>)</span> <span class='p'>{</span>
  <span class='nx'>req</span><span class='p'>.</span><span class='nx'>pipe</span><span class='p'>(</span><span class='nx'>process</span><span class='p'>.</span><span class='nx'>stdout</span><span class='p'>);</span>
  <span class='nx'>req</span><span class='p'>.</span><span class='nx'>accept</span><span class='p'>();</span>
<span class='p'>}).</span><span class='nx'>listen</span><span class='p'>(</span><span class='nx'>port</span><span class='p'>);</span>
</code></pre>
</div>
<p>simplesmtp even supports connection pools, and TLS. I love the idea of using Node for servers that I can customise, but I&#8217;m not a security expert so I don&#8217;t know what the implications of using these modules in production might be. Maybe it&#8217;s time I read <a href='http://www.packtpub.com/secure-your-node-applications-with-node-security/book'>Node Security</a>!</p>
   <img src="http://feeds.feedburner.com/~r/dailyjs/~4/qXFtpcIhnX8" height="1" width="1"/>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:1:{i:0;a:5:{s:4:"data";s:36:"http://dailyjs.com/2014/06/05/mailin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:3:{s:4:"info";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:1:{s:3:"uri";s:7:"dailyjs";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:14:"emailServiceId";a:1:{i:0;a:5:{s:4:"data";s:7:"dailyjs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:18:"feedburnerHostname";a:1:{i:0;a:5:{s:4:"data";s:28:"http://feedburner.google.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}s:4:"type";i:512;s:7:"headers";a:11:{s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:4:"etag";s:27:"IjcSLDWoMgQm08QSDob8dwudRno";s:13:"last-modified";s:29:"Thu, 19 Jun 2014 13:00:04 GMT";s:16:"content-encoding";s:4:"gzip";s:4:"date";s:29:"Thu, 19 Jun 2014 13:14:38 GMT";s:7:"expires";s:29:"Thu, 19 Jun 2014 13:14:38 GMT";s:13:"cache-control";s:18:"private, max-age=0";s:22:"x-content-type-options";s:7:"nosniff";s:16:"x-xss-protection";s:13:"1; mode=block";s:6:"server";s:3:"GSE";s:18:"alternate-protocol";s:7:"80:quic";}s:5:"build";s:14:"20121030085402";}