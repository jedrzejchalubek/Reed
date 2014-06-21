a:4:{s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"feed";a:1:{i:0;a:6:{s:4:"data";s:52:"
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
";s:7:"attribs";a:1:{s:36:"http://www.w3.org/XML/1998/namespace";a:1:{s:4:"lang";s:5:"en-US";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:5:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:38:"tag:tutorials.tutsplus.com,2005:/posts";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:2:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:29:"http://tutorials.tutsplus.com";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}i:1;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:4:"self";s:4:"type";s:20:"application/atom+xml";s:4:"href";s:40:"http://tutorials.tutsplus.com/posts.atom";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:9:"Tuts+ All";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:20:"2014-06-20T19:59:21Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"entry";a:12:{i:0;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21478";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:68:"http://code.tutsplus.com/tutorials/google-chrome-hegemony--cms-21478";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:23:"Google Chrome Hegemony
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:16231:"<p><a href="https://www.google.com/intl/en/chrome/browser/">Google Chrome</a> is one of the biggest players in the Web today. It's fast, reliable, packed full of features, and is&nbsp;extremely helpful, especially if you are a web developer. &nbsp;Chrome also&nbsp;allows the installation of third party extensions. We build these extensions&nbsp;with pure HTML, CSS and JavaScript.&nbsp;The team at Google does a wonderful job.&nbsp;In this article, we will see several handy tools, in Chrome, that help with our development processes.</p>
<h2>Developing Responsive Web Applications</h2>
<p>Nowadays responsiveness is everywhere. With the rise of mobile devices, we have to make our applications run on many different resolutions. The latest versions of Chrome contain wonderful instruments to make our work easier. Let's start by defining a simple page and continuing by making it responsive. Here is the HTML markup:</p>
<pre class="brush: html">&lt;body&gt;
    &lt;h1&gt;Responsive Web Design&lt;/h1&gt;
    &lt;ul class="nav"&gt;
        &lt;li&gt;&lt;a href="#"&gt;About&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a href="#"&gt;Concept&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a href="#"&gt;Examples&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a href="#"&gt;Frameworks&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a href="#"&gt;Contacts&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
    &lt;section class="concept"&gt;
        &lt;p&gt;Responsive web design (RWD) is a web design approach ...
    &lt;/section&gt;
    &lt;section class="elements"&gt;            
        &lt;/p&gt;The fluid grid concept calls for page element sizing to be in relative units ...
    &lt;/section&gt;
&lt;/body&gt;
</pre>
<p>There is some basic styling on the page. The CSS rules, float the navigation's links and makes the two sections positioned next to each other. The result looks like this:</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/45/posts/21478/image/rwd_01.jpg"></figure>
<p>Now, having the HTML and the basic CSS in place, we can start experimenting. Let's place our media queries' breakpoints. It's important to choose them based on the content and where that content starts looking bad. Setting resolutions like 1024x768, just because it is popular, is not a good practice.</p><h3>Setting the Viewport</h3>
<p>Our content breaks and we want to see the exact size of the viewport. So we have to resize the browser's window. Under Chrome, we are able to open the <b>developer tools panel</b> and increase its size in there.</p>
<p>Notice that while we are changing the viewport's size, we see its size in the <b>upper right corner</b>. This little tooltip eliminates the need of a manual size check. In our case, both sections below the navigation became too squashed, around 500px. So, that's the place for our first media query:</p>
<pre class="brush: css">section {
    float: left;
    width: 50%;
}
@media all and (max-width: 550px) {
    section {
        float: none;
        width: 100%;
    }
}
</pre>
<p>If we go a little bit below 550px, we will see that the navigation causes a horizontal scroll around 540px. A new media query definition solves that problem.</p>
<pre class="brush: css">.nav {
    list-style: none;
    margin: 10px auto;
    padding: 0;
    width: 510px;
}
.nav li {
    float: left;
    margin: 0 20px 0 0;
}
@media all and (max-width: 540px) {
    .nav {
        width: auto;
    }
    .nav li {
        float: none;
        margin: 0;
        padding: 0;
        text-align: center;
    }
}
</pre>
<p>The result is a web page that works on a wide range of screens. Yes, our page is a simple one and has only two breakpoints, but the process of choosing them will be the same, even if we have a giant website.&nbsp;</p><h3>Device Simulation</h3>
<p>Often we receive bug reports that our application is not working properly on some specific device. Chrome can simulate various devices, to help solve this problem. It sets the exact screen resolution and defines the right HTTP headers. So, we are able to get a close view of what the real user sees. The JavaScript browser detection will work too because the browser modifies the request headers.</p>
<p>Let's say that we need to simulate an iPhone5 device. There is a small button that opens the <b>drawer</b> panel and then there is an <b>Emulation</b> tab.</p>
<p>We choose the device and Chrome applies all the settings in <b>Screen</b>, <b>User agent</b> and <b>Sensors</b> sections. The browser even emulates touch events.</p><h3>Making Modifications With the&nbsp;Elements Panel</h3>
<p>Our page is now responsive, but at some point we have to make modifications. Again, we are able to use Chrome as a tool and see what styles are applied to the document. For example, the text in the first section is too big. We want to change that and set a new color.</p>
<p>The <b>Elements</b> panel is also helpful if we need to see specific CSS rule, but we don't know where the definition of that rule is. There is a section on the right side,&nbsp;that shows the computed styles applied to the currently selected element and then we can modify it.</p><h3>Developers Tools Panel</h3>
<p>And then lastly, sometimes we need to&nbsp;search for certain CSS styles, but it is difficult to find them because there are a lot of definitions. In the <b>developers tools</b> panel, we have a nice filter field. Let's say that we want to access the rules for our <code>&lt;section&gt;</code> tag that has the&nbsp;<code>concept</code> class applied, here's how we could do that:</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/45/posts/21478/image/rwd_06.gif"></figure>
<h2>Debugging JavaScript</h2>
<p>Google Chrome is a universal tool. It has instruments for supporting designers like we did in the last section of this tutorial. But it can do the same for the developers, as we will see now.&nbsp;</p><h3>Integrated JS Debugging</h3><p>There is a nice JavaScript debugger, integrated within Chrome. There's also a&nbsp;wonderful console and source viewer. To illustrate how everything works, we will add a little logic to our example. We want to change the label <b>Examples</b> in the main menu to <b>Awesome examples</b> when we <b>click</b> on the link. We will use jQuery as a helper, so we can focus on the example better:</p>
<pre class="brush: javascript">$('.nav').on('click', function(e) {
    var clicked = e.currentTarget;
    if(clicked.innerHTML === 'Examples') {
        clicked.innerHTML = 'Awesome examples';
    } else {
        console.log('do nothing ...');
    }
});
</pre>
<p>You probably already know the problem, but let's see how the above code works.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/45/posts/21478/image/jsdebugging_01.gif"></figure>
<p>No matter what we <b>click</b> we get <code>do nothing ...</code> in the console. So, it looks like our <code>if</code> clause is always false. Let's set a breakpoint to see what's going on.</p>
<p>The debugger stops at our breakpoint and shows us the local defined variables. The variable&nbsp;<code>clicked</code>, points to the navigation element and not to the <code>&lt;a&gt;</code>&nbsp;element. So, its <code>innerHTML</code> property is definitely not <code>Examples</code>. That's why we got <code>do nothing ...</code> every time. To fix the bug, we could simply use <code>.nav a</code> instead of just <code>.nav</code>.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/45/posts/21478/image/jsdebugging_03.gif"></figure>
<p>Above is the traditional approach that works if we know where exactly to set the breakpoint. But if we work with a large code base and especially if we have to debug the concatenated file, it gets a little bit problematic. We start placing <code>console.log</code> here and there and check the console. It will work, but soon we will have a lot of data, it will be difficult to filter the data and find the needed information. Chrome has a solution for that problem too. We could style the output in the console by adding <code>%c</code> in front of the text, passed to the <code>.log</code> method. After that, attach a second parameter containing our styles. For example:</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/45/posts/21478/image/jsdebugging_04.gif"></figure>
<p>There is something else that we could add. The <code>console</code> object has two, not so popular methods - <code>group</code> and <code>groupEnd</code>. They give us the ability to group our logs.&nbsp;</p><h3>Using Deb.js</h3>
<p>There is also&nbsp;a library that combines both the&nbsp;styling and grouping of the output, Deb.js.&nbsp;The only thing that we have to do, is to include it in our page before the other scripts and attach <code>.deb()</code> at the end of the function that we want to inspect. There is also <code>.debc()</code> version that sends collapsed groups to the console.<br></p>
<p>With this library, we can&nbsp;get the arguments passed to the function, its stack trace return value and execution time. As we mentioned above, the messages are nicely grouped and nested into each other, so it is much easier to follow the application's flow.</p>
<h2>Terminal in the Browser</h2>
<p>One of the killer features of Google's browser, is the extension's ecosystem. There's a way for us to write installable programs that run in the browser and there are dozens of <a href="https://developer.chrome.com/extensions/api_index">helpful APIs</a> that we can use. The most important thing though, is that&nbsp;we don't have to learn a new language. The technologies that we'll&nbsp;use,&nbsp;are the usual HTML, CSS and JavaScript. Checkout the following&nbsp;<a href="http://code.tutsplus.com/tutorials/developing-google-chrome-extensions--net-33076" target="_self">introduction to Chrome's extension development</a>. </p><h3>Yez!</h3>
<p>There's even a separate section in the Chrome's web store called <a href="https://chrome.google.com/webstore/category/ext/11-web-development"><em>Web development</em></a>. It contains useful instruments made specifically for us - developers. There is one called <a href="https://chrome.google.com/webstore/detail/yez/acbhddemkmodoahhmnphpcfmcfgpjmap">Yez!</a>. It brings terminal like functionalities into the Developer Tools panel. We are able to execute shell commands and get their output in real time.</p>
<p>The extension itself is not enough to perform shell commands. That's because we don't have access to the operating system. That's why there is a Node.js module that acts as a proxy. Yez!&nbsp;connects to the running Node.js app via web sockets. We could install the module via the Node.js package manager using&nbsp;<code>npm install -g yez</code>.&nbsp;</p>
<h3>Yez! Git Integration</h3><p>Yez! also&nbsp;has nice Git integration and it shows us the branch in the current directory. We are able to execute terminal commands and get their output immediately. </p>
<p>The extension was originally developed as a task runner. So it has an interface for task definitions. In fact, that's just a series of shell commands run after each other. We are achieving the same results by creating shell scripts.</p>
<p>We can also&nbsp;see the terminal's output in real time. So the extension is suitable for developing Node.js applications. &nbsp;Normally we have to&nbsp;restart the Node.js process, but now, everything is visible inside Chrome.</p>
<h2>Performing HTTP Requests</h2>
<p>As web developers, it often happens that we have to perform HTTP request to our applications. Maybe we developed a&nbsp;REST API, or we have a&nbsp;PHP script that accepts POST parameters. There is a command line tool available called <a href="http://code.tutsplus.com/tutorials/techniques-for-mastering-curl--net-8470">cURL</a>. It's probably the most widely used instrument for querying the web.</p><p>With cURL,&nbsp;we don't have to jump to the terminal. There is <a href="https://chrome.google.com/webstore/detail/dhc-rest-http-api-client/aejoelaoggembcahagimdiliamlcdmfm">DHC (REST HTTP API Client)</a> available. It's an extension that gives us full control of the HTTP request. We could change the request method, the headers, or the&nbsp;GET and POST parameters. It also displays the result of the request, with its headers. A very useful instrument.</p>
<h2>Testing With Chrome's Web Driver</h2>
<p>We all know the importance of&nbsp;<a href="http://code.tutsplus.com/tutorials/the-newbies-guide-to-test-driven-development--net-13835">testing</a>. It is extremely important for us to know that our programs behave properly. Sometimes, the writing of tests can be challenging. Especially if we need to test the user interface. Thankfully, there is a Node.js module that controls our browser (Chrome) and triggers actions like visiting a page, clicking on a link or filling in a form. It's called <a href="http://dalekjs.com/">DalekJS</a>. It's easily installable by running:</p>
<pre class="brush: bash">npm install -g dalek-cli
</pre>
<p>Let's make a short experiment and see how everything works. In a newly created directory, we need a <code>package.json</code> file with the following content:</p>
<pre class="brush: javascript">{
  "name": "project",
  "description": "description",
  "version": "0.0.1",
  "devDependencies": {
    "dalekjs": "0.0.8",
    "dalek-browser-chrome": "0.0.10"
  }
}
</pre>
<p>After running <code>npm install</code> in the same directory, we will get <code>dalekjs</code> and <code>dalek-browser-chrome</code> installed  into a&nbsp;<code>node_modules</code> folder. We will place our test inside a file called <code>test.js</code>. Let's save it in the same folder. Here is a short script that tests the search functionality of GitHub:</p>
<pre class="brush: javascript">var url = 'https://github.com/';
module.exports = {
    'should perform search in GitHub': function (test) {
        test
        .open(url)
        .type('#js-command-bar-field', 'dalek')
        .submit('#top_search_form')
        .assert.text('.repolist h3 a', 'dalekjs/dalek', 'There is a link with label dalekjs')
        .click('[href="/dalekjs/dalek"]')
        .assert.text('.repository-description p', 'DalekJS Base framework', 'It is the right repository')
        .done()
    }
};
</pre>
<p>To run the test, we have to fire <code>dalek ./test.js -b chrome</code> in our console. The result is that DalekJS launches an instance of the Google Chrome browser. It then&nbsp;opens GitHub's site, at which point you can&nbsp;type&nbsp;<code>dalek</code> in the search field and it goes to the correct repository. In the end, Node.js simply closes the opened window. The output in the console looks like this:</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/45/posts/21478/image/dalekjs.jpg"></figure>
<p>DalekJS supports PhantomJS, Firefox, InternetExplorer and Safari. It's a useful tool, and it works on Windows, Linux and Mac. The documentation is available at the official page <a href="http://dalekjs.com/">dalekjs.com</a></p>
<h2>Summary</h2>
<p>When we are in front of our computer, we spend most of that time in the browser. It's good to know that Google Chrome is not only a&nbsp;program for browsing the Web, but it's also a&nbsp;powerful instrument for web development.&nbsp;</p><p>Now, there are tons of useful extensions and a constantly growing community, so I urge you to try Google Chrome, if you aren't already using it for your next web app.</p><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21478/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21478/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21478/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21478/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T19:59:21.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T19:59:21.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:15:"Krasimir Tsonev";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:1;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21345";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:127:"http://gamedevelopment.tutsplus.com/tutorials/using-the-html5-gamepad-api-to-add-controller-support-to-browser-games--cms-21345";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:70:"Using the HTML5 Gamepad API to Add Controller Support to Browser Games";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:23317:"<p>As web-based gaming gets more popular, one of the biggest sticking points for players is input control. While my first FPS games were purely mouse- and&nbsp;keyboard-based, I've now got so much more used to a proper console controller that I'd rather use it for everything, including web-based games.&nbsp;</p><p>Luckily, the <a href="https://dvcs.w3.org/hg/gamepad/raw-file/default/gamepad.html" target="_self">HTML5 Gamepad&nbsp;API</a>&nbsp;exists to allow web developers programmatic access to game controllers. Unluckily, although this API has been around for a long time, it&nbsp;is only now, slowly, moving into the most recent versions of desktop browsers. It languished for a long time in one build of Firefox (not one build higher, no—one <i>nightly</i> build) and was problematic in Chrome. Now it is—well—not perfect, but slightly less problematic and actually pretty easy to use.&nbsp;</p><p>In this article, I'll discuss the various features of the API, how to get it working in both Firefox and Chrome, and show a real (if simple) game and how easy it is to add gamepad support to it.<br></p><h2>The Basics</h2><p>The Gamepad API comprises the following features:</p><ul><li>The ability to listen for <code class="inline">connect</code> and <code class="inline">disconnect</code> events.</li><li>The ability to recognize multiple gamepads. (In theory, you could plug in as many gamepads as you have USB ports.)</li><li>The ability to inspect these gamepads and recognize how many axes they have (joysticks), how many buttons they have (have you played a modern game console lately?), and what state each of these individual items are in.</li></ul><p>Let's begin by discussing how you can detect support for a gamepad at a high level.&nbsp;</p><p>Both Firefox and Chrome support a method on <code class="inline">navigator</code>, <code class="inline">getGamepads()</code>, that returns an array of all connected gamepad devices. We can use this as a simple method of detecting whether the Gamepad API is present. Here is a simple function for that&nbsp;check:</p><pre class="brush: javascript">function canGame() {
    return "getGamepads" in navigator;
}</pre><p>So far so good. Now for the funky part. The Gamepad API has support for events that detect when a gamepad is connected and disconnected. But what happens if the user already has a gamepad connected to their laptop when they hit your page? Normally, the web page will wait for the user to do something, anything really, with the actual gamepad. This means we have to provide some type of message to the user that lets them know that they need to "wake up" support for the gamepad if it is connected. You could tell them to hit any button or move a stick.&nbsp;</p><p>To make things even more interesting, this particular check does not seem to be required when you reload the page. You'll find that once you've used the Gamepad API on a page and then reloaded it, the page recognizes this fact and automatically considers it connected.</p><p>But wait—it gets better. Chrome doesn't support the connected (or disconnected) events at this time. The typical work around for this (and the one demonstrated in the good <a href="https://developer.mozilla.org/en-US/docs/Web/Guide/API/Gamepad" target="_self">MDN docs</a> for the API) is to set up a poll and see whether a gamepad "shows up" in the list of connected devices.</p><p>Confusing? Let's start off with an example supporting Firefox only:</p><pre class="brush: html">&lt;!DOCTYPE html&gt;
&lt;html&gt;
    &lt;head&gt;
		&lt;meta charset="utf-8"&gt;
		&lt;meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"&gt;
		&lt;title&gt;&lt;/title&gt;
		&lt;meta name="description" content=""&gt;
		&lt;meta name="viewport" content="width=device-width"&gt;
		&lt;script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"&gt;&lt;/script&gt;

	&lt;/head&gt;
	&lt;body&gt;

	&lt;div id="gamepadPrompt"&gt;&lt;/div&gt;

	&lt;script&gt;
	function canGame() {
		return "getGamepads" in navigator;
	}

	$(document).ready(function() {

		if(canGame()) {

			var prompt = "To begin using your gamepad, connect it and press any button!";
			$("#gamepadPrompt").text(prompt);

			$(window).on("gamepadconnected", function() {
				$("#gamepadPrompt").html("Gamepad connected!");
				console.log("connection event");
			});

			$(window).on("gamepaddisconnected", function() {
				console.log("disconnection event");
				$("#gamepadPrompt").text(prompt);
			});

		}

	});
	&lt;/script&gt;
	&lt;/body&gt;
&lt;/html&gt;</pre><p>In the example above, we begin by checking to see whether the browser supports the Gamepad API. If it does, we first update a div with instructions for the user, and then begin listening immediately to both the <code class="inline">connect</code> and <code class="inline">disconnect</code> events.&nbsp;</p><p>If you <a href="http://tutsplus.github.io/Using-the-HTML5-Gamepad-API/test1.html" target="_self">run this with Firefox</a> and connect your gamepad, you should then have to also hit a button, at which point the event is fired and you're ready to go.&nbsp;</p><p>Again, though, in my testing, when I reload the page, the&nbsp;<code class="inline">connection</code> event is immediate. This does create a slight "flicker" effect that may be undeseriable. You could actually use an interval to set the directions for something like 250ms after the DOM has loaded and only prompt if a connection didn't occur in the meantime. I decided to keep things simple for this tutorial.</p><p>Our code works for Firefox, but now let's add Chrome support:</p><pre class="brush: html">&lt;!DOCTYPE html&gt;
&lt;html&gt;
    &lt;head&gt;
		&lt;meta charset="utf-8"&gt;
		&lt;meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"&gt;
		&lt;title&gt;&lt;/title&gt;
		&lt;meta name="description" content=""&gt;
		&lt;meta name="viewport" content="width=device-width"&gt;
		&lt;script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"&gt;&lt;/script&gt;

	&lt;/head&gt;
	&lt;body&gt;

	&lt;div id="gamepadPrompt"&gt;&lt;/div&gt;

	&lt;script&gt;
	var hasGP = false;

	function canGame() {
		return "getGamepads" in navigator;
	}

	$(document).ready(function() {

		if(canGame()) {

			var prompt = "To begin using your gamepad, connect it and press any button!";
			$("#gamepadPrompt").text(prompt);

			$(window).on("gamepadconnected", function() {
				hasGP = true;
				$("#gamepadPrompt").html("Gamepad connected!");
				console.log("connection event");
			});

			$(window).on("gamepaddisconnected", function() {
				console.log("disconnection event");
				$("#gamepadPrompt").text(prompt);
			});

			//setup an interval for Chrome
			var checkGP = window.setInterval(function() {
				if(navigator.getGamepads()[0]) {
					if(!hasGP) $(window).trigger("gamepadconnected");
					window.clearInterval(checkGP);
				}
			}, 500);
		}

	});
	&lt;/script&gt;
	&lt;/body&gt;
&lt;/html&gt;</pre><p>The code is&nbsp;a bit more complex now, but not terribly so. <a href="http://tutsplus.github.io/Using-the-HTML5-Gamepad-API/test2.html" target="_self">Load the demo in Chrome</a> and see what happens.</p><p>Note that we've got a new global variable, <code class="inline">hasGP</code>, that we'll use as a general flag for having a gamepad connected. As before, we have two event listeners, but now we've got a new interval set up to check to see whether a gamepad exists. This is the first time you've seen <code class="inline">getGamepads</code> in action, and we'll describe it a bit more in the next section, but for now know that it just returns an array, and if the first item exists, we can use that as a way of knowing that a gamepad is connected.&nbsp;</p><p>We use jQuery to fire off the same event Firefox would have received, and then clear the interval. Notice that this same interval will fire once in Firefox as well, which is slightly wasteful, but honestly I thought it was a waste of time adding in additional support to sniff Chrome versus Firefox. One small call like this wasted in Firefox should not matter at all.</p><p>Now that we've got a connected gamepad, let's work with it!</p><h2>The Gamepad Object</h2><p>To give you an idea of just how old I am - here is the state of the art joystick I used for my first gaming system.<br></p><p><br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/360/posts/21345/image/Atari-2600-Joystick copy.jpg"><figcaption>Image from <a href="http://en.wikipedia.org/wiki/Atari_2600#mediaviewer/File:Atari-2600-Joystick.jpg" target="_self">Wikimedia Commons</a>.</figcaption></figure><p>Nice - simple - and it hurt like hell after an hour of playing. Modern consoles have much more complex gamepads. Consider the PS4 controller:</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/360/posts/21345/image/DualShock_4 copy.jpg"><figcaption>Image from <a href="http://en.wikipedia.org/wiki/DualShock#mediaviewer/File:DualShock_4.jpg" target="_self">Wikimedia Commons</a>.</figcaption></figure><p>This controller has two sticks, a directional pad, four main buttons, four more on the back, a <b>Share</b> and <b>Options</b> button, a <b>PS</b> button, some funky touch control thing, a speaker, and a light. It also probably has a flux capaciter and a kitchen sink.&nbsp;</p><p>Luckily, we've got access to this beast via the <a href="https://developer.mozilla.org/en-US/docs/Web/API/Gamepad" target="_self">Gamepad object</a>. Properties include:<br></p><ul><li><code class="inline">id</code>: This is the name of the controller. Don't expect something friendly from this. My DualShock 4 was reported as <code class="inline">54c-5c4-Wireless Controller</code> in Firefox, whereas Chrome called the same controller <code class="inline">Wireless Controller (STANDARD GAMEPAD Vendor: 054c Product: 05c4)</code>.</li><li><code class="inline">index</code>: Since the Gamepad API supports multiple controllers, this one lets you determine which numbered controller it is. It could be used to identify player one, two, and so on.</li><li><code class="inline">mapping</code>: Mapping isn't something we're going to cover here, but essentially this is something the browser can do to help map your particular controller to a "standard" controller setup. If you've played multiple consoles you know they have some similarities in terms of control, and the API tries to "mash" your controller into a standard. You don't have to worry about this for now, but if you want more details, check the <a href="https://dvcs.w3.org/hg/gamepad/raw-file/default/gamepad.html#remapping" target="_self">mapping</a> section of the API docs.</li><li><code class="inline">connected</code>: A Boolean indicating whether the controller is still connected.</li><li><code class="inline">buttons</code>: An array of button values. Each button is an instance of <a href="https://dvcs.w3.org/hg/gamepad/raw-file/default/gamepad.html#gamepadbutton-interface" target="_self">GamepadButton</a>. Note that the <code class="inline">GamepadButton</code> object supports both a simple Boolean property (<code class="inline">pressed</code>) as well as a <code class="inline">value</code> property for analog buttons.</li><li><code class="inline">axes</code>: An array of values representing the different sticks on the gamepad. Given a gamepad with three&nbsp;sticks, you will have an array of six items, where each stick is represented by two&nbsp;array values. The first in the pair represents X, or left/right movement, while the second represents Y, up/down movement. In all cases the value will range from <code class="inline">-1</code> to <code class="inline">1</code>: for left/right values, <code class="inline">-1</code> is left and <code class="inline">1</code> is right; for up/down values, <code class="inline">-1</code> is up and <code class="inline">1</code> is down. According to the API, the array is sorted according to "importance", so in theory, you can focus on <code class="inline">axes[0]</code> and <code class="inline">axes[1]</code> for most gaming needs. To make things more interesting, using my DualShock 4, Firefox reported three axes (which makes sense—see the picture above), but Chrome reported two. It seems as if the d-pad stick is reported in Firefox as an axis, but no data seems to come out of it. In Chrome, the d-pad showed up as additional buttons, and was correctly read.</li><li><code class="inline">timestamp</code>: Finally, this value is a timestamp representing the last time the hardware was checked. In theory, this is probably not something you would use.</li></ul><p>Okay, so that's lot to digest. In the example below, we've simply added a interval to get, and inspect, the first gamepad, and&nbsp;print out the ID and then the buttons and axes:</p><pre class="brush: html">&lt;!DOCTYPE html&gt;
&lt;html&gt;
    &lt;head&gt;
		&lt;meta charset="utf-8"&gt;
		&lt;meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"&gt;
		&lt;title&gt;&lt;/title&gt;
		&lt;meta name="description" content=""&gt;
		&lt;meta name="viewport" content="width=device-width"&gt;
		&lt;script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"&gt;&lt;/script&gt;

	&lt;/head&gt;
	&lt;body&gt;

	&lt;div id="gamepadPrompt"&gt;&lt;/div&gt;
	&lt;div id="gamepadDisplay"&gt;&lt;/div&gt;

	&lt;script&gt;
	var hasGP = false;
	var repGP;

	function canGame() {
		return "getGamepads" in navigator;
	}

	function reportOnGamepad() {
		var gp = navigator.getGamepads()[0];
		var html = "";
			html += "id: "+gp.id+"&lt;br/&gt;";

		for(var i=0;i&lt;gp.buttons.length;i++) {
			html+= "Button "+(i+1)+": ";
			if(gp.buttons[i].pressed) html+= " pressed";
			html+= "&lt;br/&gt;";
		}

		for(var i=0;i&lt;gp.axes.length; i+=2) {
			html+= "Stick "+(Math.ceil(i/2)+1)+": "+gp.axes[i]+","+gp.axes[i+1]+"&lt;br/&gt;";
		}

		$("#gamepadDisplay").html(html);
	}

	$(document).ready(function() {

		if(canGame()) {

			var prompt = "To begin using your gamepad, connect it and press any button!";
			$("#gamepadPrompt").text(prompt);

			$(window).on("gamepadconnected", function() {
				hasGP = true;
				$("#gamepadPrompt").html("Gamepad connected!");
				console.log("connection event");
				repGP = window.setInterval(reportOnGamepad,100);
			});

			$(window).on("gamepaddisconnected", function() {
				console.log("disconnection event");
				$("#gamepadPrompt").text(prompt);
				window.clearInterval(repGP);
			});

			//setup an interval for Chrome
			var checkGP = window.setInterval(function() {
				console.log('checkGP');
				if(navigator.getGamepads()[0]) {
					if(!hasGP) $(window).trigger("gamepadconnected");
					window.clearInterval(checkGP);
				}
			}, 500);
		}

	});
	&lt;/script&gt;
	&lt;/body&gt;
&lt;/html&gt;</pre><p>You can <a href="http://tutsplus.github.io/Using-the-HTML5-Gamepad-API/test3.html" target="_self">try the demo in either Chrome or Firefox</a>.</p><p>I assume this is all pretty self explanatory; the only real difficult part was handling the axes. I loop over the array and count by twos to represent both the left/right, up/down values at once. If you open this up in Firefox and connect a DualShock, you may see something like this.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/360/posts/21345/image/ff1.png"></figure><p>As you can see, Button 2 was pressed when I took my screenshot. (In case you're curious, that was the <b>X</b> button.) Note the sticks; my gamepad was sitting on my laptop and those values were constantly fluctuating. Not in a way that would imply the values were <i>bad</i>, per se—if I picked up the game pad and pushed all the way in one direction, I saw the right value. But I believe what I was seeing was just how sensitive the controller is to the environment. Or maybe gremlins.</p><p>Here is an example of how Chrome displays it:</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/360/posts/21345/image/chrome1.png"></figure><p>I was, again, holding the <b>X</b> button—but notice how the button index is different here. As you can tell, you're going to need to do a bit of... massaging if you want to use this API for a game. I'd imagine you could check both Buttons 1 and 2 for "fire" and follow up with a good deal of testing.<br></p><h2>Putting It All Together<br></h2><p>So, how about a real demo? Like most coders who started their life playing video games, I dreamed of being a hotshot video game creator when I grew up. It turns out that math gets real hard after calculus, and apparently this "web" stuff has a future, so while that future didn't pan out for me, I'd still like to imagine that one day I could turn these web standards skills into a playable game. Until that day, what I've got today is a pretty lame canvas-based version of pong. Single-player pong. As I said, lame.</p><p>The game simply renders a paddle and&nbsp;a ball, and gives you keyboard control over the ball. Every time you miss the ball, the score goes up. Which makes sense for golf rather than pong, I suppose, but let's not worry too much about it. The code can be found in <a href="https://github.com/tutsplus/Using-the-HTML5-Gamepad-API/blob/master/game1.html" target="_self">game1.html</a> and you can <a href="http://tutsplus.github.io/Using-the-HTML5-Gamepad-API/game1.html" target="_self">play the demo in your browser</a>.&nbsp;</p><p>I won't go through all the code here,&nbsp;but let's look at a few snippets. First, here is the main loop function which handles all animation details:</p><pre class="brush: javascript">function loop() {
    draw.clear();
	ball.move();
	ball.draw();
	paddle.draw();
	paddle.move();
	draw.text("Score: "+score, 10, 20, 20);
}</pre><p>The paddle is driven by the keyboard using two simple event handlers:</p><pre class="brush: javascript">$(window).keydown(function(e) {
   switch (e.keyCode) {
    	case 37: input.left = true; break;                            
		case 39: input.right = true; break;                            
   } 
});

$(window).keyup(function(e) {
   switch (e.keyCode) {
		case 37: input.left = false; break;                            
		case 39: input.right = false; break;                            
   } 
});
</pre><p>The <code class="inline">input</code> variable is a global variable that is picked up by a paddle object <code class="inline">move</code> method:</p><pre class="brush: javascript">this.move = function() {
    if(input.left) {
		this.x -= this.speed;
		if(this.x &lt; 0) this.x=0;
	}
	if(input.right) {
		this.x += this.speed;
		if((this.x+this.w) &gt; canvas.width) this.x=canvas.width-this.w;
	}
}
</pre><p>Again, nothing too complex here. Here is a screenshot of the game in action. (I know—I shouldn't quit my day job.)</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/360/posts/21345/image/game1opt.jpg"></figure><p>So, how do we add gamepad support? Luckily, we've got the code done for us already. In the previous demo, we did everything required to check for and notice updates to the code. We can take that code and simply append it to the game's existing code.&nbsp;</p><p>Since it is (virtually) the same, I won't repeat it (though <a href="https://github.com/tutsplus/Using-the-HTML5-Gamepad-API/blob/master/game2.html" target="_self">the full listing is available</a> if you want it), but I will share the modified code run every 100ms once a gamepad is detected:</p><pre class="brush: javascript">function checkGamepad() {
    var gp = navigator.getGamepads()[0];
	var axeLF = gp.axes[0];
	if(axeLF &lt; -0.5) {
		input.left = true;
		input.right = false;
	} else if(axeLF &gt; 0.5) {
		input.left = false;
		input.right = true;
	} else {
		input.left = false;
		input.right = false;
	}
}
</pre><p>Again, you can <a href="http://tutsplus.github.io/Using-the-HTML5-Gamepad-API/game2.html" target="_self">try the demo in either browser</a>.</p><p>As with the previous example, we've assumed that we only care about one gamepad. Since our game only has a paddle and it only moves horizontally, we can get by by only&nbsp;checking the very first axis. Remember, according to the API this should be the "most important" one, and in my testing it was the left stick, which is pretty standard for games.&nbsp;</p><p>Since our game uses a global variable, <code class="inline">input</code>, to represent left and right movement, all I have to do is modify that value based on the axis value. Now, notice that I didn't simply check for&nbsp;"less than zero" and "greater than zero". Why? If you remember from <a href="http://tutsplus.github.io/Using-the-HTML5-Gamepad-API/test3.html" target="_self">the earlier demo</a>, the gamepad was very sensitive, and would often report values even when I didn't think I had actually moved the stick. Using a boundary value of&nbsp;<code class="inline">.5</code> gives the control a bit more stability. (And obviously this is the type of thing you would need to tweak to see what "feels" right.)&nbsp;</p><p>All in all, I added roughly 25 lines of code to my game to add gamepad support. That rocks.</p><h2>Game On!</h2><p>Hopefully you've seen that, while there are definitely some idiosyncrasies, the Gamepad API now has support in two major browsers, and it's something I think developers really should start considering for their games.<br></p><h2>Resources</h2><p>Here's a few additional resources to help you learn more about the Gamepad API.</p><ul><li><a href="https://developer.mozilla.org/en-US/docs/Web/Guide/API/Gamepad" target="_self">Using the Gamepad API</a></li><li><a href="https://dvcs.w3.org/hg/gamepad/raw-file/default/gamepad.html" target="_self">Gamepad Specification</a></li><li><a href="http://www.gamepadjs.com" target="_self">Gamepad.js</a> - A Javascript library to enable using gamepads and joysticks in the browser.</li><li><a href="http://blog.teamtreehouse.com/gamepad-controls-html5-games" target="_self">Gamepad Controls for HTML5 Games</a></li><li><a href="http://www.nintendo.com/wiiu/built-in-software/browser-specs/extended-functionality/" target="_self">Wii U's Version</a> (totally different from the specification - good job, Nintendo!)</li></ul><h2>References</h2><ul><li>Preview image credit: <a href="http://www.thenounproject.com/term/video-game-controller/17035/" target="_self">Video Game Controller</a> designed by <a href="http://www.thenounproject.com/usosa" target="_self">Uriel Sosa</a> from <a href="http://www.thenounproject.com/" target="_self">the Noun Project</a></li></ul><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21345/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21345/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21345/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21345/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T18:00:13.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T18:00:13.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:14:"Raymond Camden";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:2;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-20943";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:92:"http://code.tutsplus.com/tutorials/animated-components-with-uikit-dynamics-part-2--cms-20943";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:47:"Animated Components with UIKit Dynamics: Part 2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:26475:"<h2>Introduction</h2>

<p>In the <a href="https://code.tutsplus.com/tutorials/animated-components-with-uikit-dynamics-part-1--cms-20942" target="_self">first tutorial</a> of this short series on UIKit Dynamics, we learnt the basics of the API by creating an animated menu component. In this tutorial, we'll continue working on our project and implement another animated component, a custom alert view.</p>

<h2><span class="sectionnum">1.</span>&nbsp;Overview</h2>

<p>The default alert view on iOS is great, but it's not very customizable in terms of appearance and behavior. If you need an alert view that is customizable, then you need to create your own solution and that's what we'll do in this tutorial. The focus of this tutorial is on the behavior of the alert view and not so much on its functionality. Let's see what the result is that we're after</p>

<p>The alert view will be a&nbsp;<code class="inline">UIView</code> instance to which we'll add the following subviews:</p>

<ul>
<li>a&nbsp;<code class="inline">UILabel</code> object for displaying the alert view's title</li>
<li>a&nbsp;<code class="inline">UILabel</code> object for displaying the alert view's message</li>
<li>one or more <code class="inline">UIButton</code> instances for letting the user interact with the alert view</li>
</ul>

<p>We'll use the <code class="inline">UISnapBehavior</code>&nbsp;class to present the alert view. As its name indicates, this&nbsp;<code class="inline">UIDynamicBehavior</code>&nbsp;subclass forces a dynamic item to snap to a point as if it were magnetically drawn to it.</p><p>The <code class="inline">UISnapBehavior</code> class defines one additional property, <code class="inline">damping</code>, that defines the amount of oscillation when the dynamic item has reached the point to which it is attracted.</p><p>We'll use a gravity behavior, in combination with a collision and push behavior, to dismiss the alert view. Remember that we already used these behaviors in the <a href="https://code.tutsplus.com/tutorials/animated-components-with-uikit-dynamics-part-1--cms-20942" target="_self">previous tutorial</a>.</p>









<p>The alert view will animate in from the top of the screen. When the alert view is about to appear, the snap behavior will make it drop into view and snap to the center of the screen. To dismiss the alert view, a push behavior will briefly push it to the bottom of the screen and a gravity behavior will then pull it to the top of the screen and make it animate off-screen.</p>

<p>We'll create a custom initialization method for the alert view component that accepts the alert's title, message, button titles, and its parent view. We won't be implementing a delegate protocol for the alert view. Instead, we'll make use of blocks, which makes for a more elegant and modern solution. The block or handler will accept two parameters, the index and the title of the button the user tapped.</p><p>We'll also display a semi-transparent view behind the alert view to prevent the user from interacting with its parent view as long as the alert view is visible. Let's start by taking a look at the alert view's properties and the custom initializer.</p>

<h2><span class="sectionnum">2.</span> Properties and Initialization</h2>

<h3>Step 1: Creating the Alert View Class</h3>

<p>Press <b>Command-N</b>&nbsp;on your keyboard to create a new file and select <strong>Objective-C class </strong>from the list of <b>iOS</b> templates. Make it a subclass of&nbsp;<strong>NSObject</strong> and name it <strong>AlertComponent</strong>.</p>

<h3>Step 2: Declaring Properties</h3>

<p>The next step is to declare a few private properties. Open <b>AlertComponent.m</b>, add a class extension at the top, and declare the following properties:</p>

<pre class="brush: objc">@interface AlertComponent ()

@property (nonatomic, strong) UIView *alertView;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIView *targetView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSArray *buttonTitles;
@property (nonatomic) CGRect initialAlertViewFrame;

@end</pre>

<p>The function of each property will become clear as we implement the alert component. It's time to create the component's custom initializer.</p>

<h3>Step 3: Initialization</h3>

<p>As I already mentioned, we're going to use a custom initializer to make working with the alert component as easy as possible. The initializer accepts four parameters, alert's title, its message, the button titles, and the view to which the alert component will be added, its parent view. Open&nbsp;<b>AlertComponent.h</b>&nbsp;and add the following declaration:</p>

<pre class="brush: objc">@interface AlertComponent : NSObject

- (id)initAlertWithTitle:(NSString *)title andMessage:(NSString *)message andButtonTitles:(NSArray *)buttonTitles andTargetView:(UIView *)targetView;

@end</pre>

<h2><span class="sectionnum">3.</span>&nbsp;Setting Up the Alert View</h2>

<h3>Step 1: Declaring Setup Methods</h3>

<p>In this part the alert view is going to be set up, and all its subviews will be added to it. Also, the background view, as well as the dynamic animator will be set up too.</p>

<p>Open <b>AlertComponent.m</b>&nbsp;and declare the following private methods in the private class extension:</p>

<pre class="brush: objc">@interface AlertComponent()

...

- (void)setupBackgroundView;
- (void)setupAlertView;

@end</pre>

<p>The method names are self-explanatory. Let's start by implementing the <code>setupAlertView</code> method first since most of the alert's setup takes place in this method.</p>

<h3>Step 2: Setting Up the Alert View</h3>

<p>In <code class="inline">setupAlertView</code>, we do three things:</p>

<ul>
<li>initialize and configure the alert view</li>
<li>initialize and configure the alert view's labels</li>
<li>initialize and configure the alert view's buttons</li>
</ul>

<p>Let's start by calculating the alert view's size and position as shown in the code snippet below.</p>

<pre class="brush: objc">- (void)setupAlertView {
    // Set the size of the alert view.
    CGSize alertViewSize = CGSizeMake(250.0, 130.0 + 50.0 * self.buttonTitles.count);
    
    // Set the initial origin point depending on the direction of the alert view.
    CGPoint initialOriginPoint = CGPointMake(self.targetView.center.x, self.targetView.frame.origin.y - alertViewSize.height);
}</pre>

<p>We start by setting the alert view's size. To make the alert view dynamic, we add <code class="inline">50.0</code> points to its height for every button. Also note that the initial origin of the alert view is off-screen. The next step is initializing and setting up&nbsp;the alert view:</p>

<pre class="brush: objc">self.alertView = [[UIView alloc] initWithFrame:CGRectMake(initialOriginPoint.x, initialOriginPoint.y, alertViewSize.width, alertViewSize.height)];

// Background color.
[self.alertView setBackgroundColor:[UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.0]];

// Make the alert view with rounded corners.
[self.alertView.layer setCornerRadius:10.0];

// Set a border to the alert view.
[self.alertView.layer setBorderWidth:1.0];
[self.alertView.layer setBorderColor:[UIColor blackColor].CGColor];

    // Assign the initial alert view frame to the respective property.
    self.initialAlertViewFrame = self.alertView.frame;
</pre>

<p>Using <code class="inline">alertViewSize</code> and&nbsp;<code class="inline">initialOriginPoint</code>, we initialize the <code class="inline">alertView</code> object and set its background color. We round the alert view's corners by setting its <code class="inline">layer</code>'s <code class="inline">cornerRadius</code>&nbsp;to <code class="inline">10.0</code>, its&nbsp;<code>borderWidth</code>&nbsp;to <code class="inline">1.0</code>, and its&nbsp;<code>borderColor</code>&nbsp;to black. We also store the alert view's initial frame in its <code>initialAlertViewFrame</code> property as we'll be needing it later.</p>









<p>If Xcode tells you it doesn't know about the <code class="inline">alertView</code>'s <code class="inline">layer</code> property, then add the following import statement at the top of the implementation file:</p>

<pre class="brush: objc">#import &lt;QuartzCore/QuartzCore.h&gt;
</pre>

<p>It's time to add the labels. Let's start with the title label.</p>

<pre class="brush: objc">// Setup the title label.
self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 10.0, self.alertView.frame.size.width, 40.0)];
[self.titleLabel setText:self.title];
[self.titleLabel setTextAlignment:NSTextAlignmentCenter];
[self.titleLabel setFont:[UIFont fontWithName:@"Avenir-Heavy" size:14.0]];

// Add the title label to the alert view.
[self.alertView addSubview:self.titleLabel];</pre>

<p>Setting up the message label is pretty similar.</p>

<pre class="brush: objc">// Setup the message label.
self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height, self.alertView.frame.size.width, 80.0)];
[self.messageLabel setText:self.message];
[self.messageLabel setTextAlignment:NSTextAlignmentCenter];
[self.messageLabel setFont:[UIFont fontWithName:@"Avenir" size:14.0]];
[self.messageLabel setNumberOfLines:3];
[self.messageLabel setLineBreakMode:NSLineBreakByWordWrapping];

// Add the message label to the alert view.
[self.alertView addSubview:self.messageLabel];</pre>

<p>Note that the <code class="inline">numberOfLines</code> property is set to <code class="inline">3</code> and <code class="inline">lineBreakMode</code> is set to&nbsp;<code class="inline">NSLineBreakByWordWrapping</code>.</p>









<p>The last thing we need to set up are the alert view's buttons. Even though the number of buttons can vary, setting up and positioning the buttons is pretty simple. We separate the buttons by <code class="inline">5</code> points and use a <code class="inline">for</code> loop to initialize them.</p>

<pre class="brush: objc">CGFloat lastSubviewBottomY = self.messageLabel.frame.origin.y + self.messageLabel.frame.size.height;

for (int i=0; i&lt;[self.buttonTitles count]; i++) {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10.0, lastSubviewBottomY + 5.0, self.alertView.frame.size.width - 20.0, 40.0)];
    [button setTitle:[self.buttonTitles objectAtIndex:i] forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont fontWithName:@"Avenir" size:13.0]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [button setBackgroundColor:[UIColor colorWithRed:0.0 green:0.47 blue:0.39 alpha:1.0]];
    [button addTarget:self action:@selector(handleButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [button setTag:i + 1];
    
    [self.alertView addSubview:button];
    
    lastSubviewBottomY = button.frame.origin.y + button.frame.size.height;
}</pre>

<p>Note that each button invokes the&nbsp;<code>handleButtonTap:</code>&nbsp;method when it's tapped. We can determine which button the user tapped by inspecting the button's <code class="inline">tag</code> property.</p>

<p>Finally, add the alert view to the target or parent view by adding the following line at the bottom of the setupAlertView method:</p>

<pre class="brush: objc">// Add the alert view to the parent view.
[self.targetView addSubview:self.alertView];</pre>

<h3>Step 3: Setting Up the Background View</h3>

<p>The second method we need to implement is <code>setupBackgroundView</code>. The background view will prevent the user from interacting with the alert view's parent view as long as the alert view is shown. We initially set its <code class="inline">alpha</code>&nbsp;property to <code class="inline">0.0</code>, which means it's transparent.</p>

<pre class="brush: objc">- (void)setupBackgroundView {
    self.backgroundView = [[UIView alloc] initWithFrame:self.targetView.frame];
    [self.backgroundView setBackgroundColor:[UIColor grayColor]];
    [self.backgroundView setAlpha:0.0];
    [self.targetView addSubview:self.backgroundView];
}</pre>

<h3>Step 4: Implementing the Initializer</h3>

<p>With&nbsp;<code class="inline">setupAlertView</code> and&nbsp;<code class="inline">setupBackgroundView</code>&nbsp;ready to use, let's implement the custom initializer we declared earlier.</p>









<pre class="brush: objc">- (id)initAlertWithTitle:(NSString *)title andMessage:(NSString *)message andButtonTitles:(NSArray *)buttonTitles andTargetView:(UIView *)targetView {
    if (self = [super init]) {
        // Assign the parameter values to local properties.
        self.title = title;
        self.message = message;
        self.targetView = targetView;
        self.buttonTitles = buttonTitles;
        
        // Setup the background view.
        [self setupBackgroundView];
        
        // Setup the alert view.
        [self setupAlertView];
        
        // Setup the animator.
        self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.targetView];
    }
    
    return self;
}</pre>

<p>We set the <code class="inline">title</code>, <code class="inline">message</code>, <code class="inline">targetView</code>, and <code class="inline">buttonTitles</code> properties, invoke <code class="inline">setupBackgroundView</code> and <code class="inline">setupAlertView</code>, and initialize the dynamic animator, passing in <code class="inline">self.targetView</code> as its reference view.</p>

<h2><span class="sectionnum">4.</span> Showing the Alert View</h2>

<p>To show the alert view after it's been initialized, we need to declare and implement a public method that can be called by, for example, the view controller hosting the alert view. Open&nbsp;<b>AlertComponent.h</b>&nbsp;and add the following method declaration:</p>

<pre class="brush: objc">- (void)showAlertView;</pre>

<p>Head back to <b>AlertComponent.m</b> to implement <code class="inline">showAlertView</code>. As I mentioned earlier in this tutorial, we'll be using a new&nbsp;<code class="inline">UIDynamicBehavior</code> subclass to show the alert view,&nbsp;<code class="inline">UISnapBehavior</code>. Let's see how we use this class in <code class="inline">showAlertView</code>.</p>

<pre class="brush: objc">- (void)showAlertView {
    [self.animator removeAllBehaviors];
    
    UISnapBehavior *snapBehavior = [[UISnapBehavior alloc] initWithItem:self.alertView snapToPoint:self.targetView.center];
    snapBehavior.damping = 0.8;
    [self.animator addBehavior:snapBehavior];
    
    
    [UIView animateWithDuration:0.75 animations:^{
        [self.backgroundView setAlpha:0.5];
    }];
}</pre>

<p>We start by removing any existing dynamic behaviors from the dynamic animator to ensure that no conflicts pop up. Remember that some dynamic behaviors can only be added once to the dynamic animator, such as a gravity behavior. Also, we'll add other dynamic behaviors to dismiss the alert view.</p><p>As you can see, using a snap behavior isn't difficult. We specify which dynamic item the behavior should be applied to and set the point to which the dynamic item should snap. We also set the behavior's <code class="inline">damping</code> property as we discussed earlier. Also note that we animate the <code class="inline">alpha</code> property of the background view.</p>

<p>To test the alert view, we need to make some changes to the <code class="inline">ViewController</code> class. Let's start by adding&nbsp;a <code class="inline">UIButton</code>&nbsp;instance to the view controller's view to show the alert view. Open&nbsp;<b>Main.storyboard</b>&nbsp;and drag a <code class="inline">UIButton</code> instance from the <strong>Object Library</strong>&nbsp;to the view controller's view. Position the button near the bottom of the view and give it a title of <b>Show Alert View</b>.&nbsp;Add an action to <b>ViewController.h</b>&nbsp;as shown below.</p>

<pre class="brush: objc">@interface ViewController : UIViewController

- (IBAction)showAlertView:(id)sender;

@end</pre>

<p>Head back to the storyboard and connect the view controller's action to the button. Open <b>ViewController.m</b>&nbsp;and import the header file of the <code class="inline">AlertComponent</code> class.</p>

<pre class="brush: objc">#import "AlertComponent.h"</pre>

<p>Next, declare a property in the private class extension of type <code>AlertComponent</code> and name it <code class="inline">alertComponent</code>.</p>

<pre class="brush: objc">@interface ViewController ()

@property (nonatomic, strong) MenuComponent *menuComponent;
@property (nonatomic, strong) AlertComponent *alertComponent;

- (void)showMenu:(UIGestureRecognizer *)gestureRecognizer;

@end</pre>

<p>We then initialize the alert component in the view controller's <code>viewDidLoad</code> method.</p>

<pre class="brush: objc">- (void)viewDidLoad {
    ...
    
    // Initialize Alert Component
    self.alertComponent = [[AlertComponent alloc] initAlertWithTitle:@"Custom Alert"
                                                          andMessage:@"You have a new e-mail message, but I don't know from whom."
                                                     andButtonTitles:@[@"Show me", @"I don't care", @"For me, really?"]
                                                       andTargetView:self.view];
}</pre>

<p>To show the alert component, invoke <code>showAlertView:</code>&nbsp;in the action we just created, <code class="inline">showAlertView:</code>.</p>

<pre class="brush: objc">- (IBAction)showAlertView:(id)sender {
    [self.alertComponent showAlertView];
}</pre>

<p>Run your application and tap the button to show the alert view. The result should look similar to the one below.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/205/posts/20943/image/t10_9_alert_show.gif"></figure>

<h2><span class="sectionnum">5.</span> Hiding the Alert View</h2>

<p>As we saw earlier, the <code>handleButtonTap:</code> method is invoked when the user taps a button of the alert view. The alert view should hide when one of the buttons is tapped. Let's see how this works.<br></p>

<p>Revisit&nbsp;<b>AlertComponent.m</b>&nbsp;and, in the private class extension, declare the <code class="inline">handleButtonTap:</code> method.</p>

<pre class="brush: objc">@interface AlertComponent()

...

- (void)handleButtonTap:(UIButton *)sender;

@end</pre>

<p>In this method, we create a number of dynamic behaviors and add them to the dynamic animator object. The dynamic behaviors we need are:</p>

<ul>
<li>a gravity behavior that pulls&nbsp;the alert view towards the top of the screen</li><li>a collision behavior with an off-screen boundary that stops the alert view</li><li>a push behavior that gives the alert view little nudge towards the bottom of the screen</li>
</ul>

<p>After removing the existing behaviors from the dynamic animator and initialize the push behavior as shown below.</p>

<pre class="brush: objc">- (void)handleButtonTap:(UIButton *)sender {
    // Remove all behaviors from animator.
    [self.animator removeAllBehaviors];
    
    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[self.alertView] mode:UIPushBehaviorModeInstantaneous];
    [pushBehavior setAngle:M_PI_2 magnitude:20.0];
    [self.animator addBehavior:pushBehavior];
}</pre>

<p>The <code>angle</code> property of the push behavior defines the direction of the push. By setting the angle to <code class="inline">M_PI_2</code>, the force of the push behavior is directed towards the bottom of the screen.</p>

<p>The next step is adding the gravity behavior. The vector we pass to <code class="inline">setGravityDirection</code>&nbsp;will result in a force towards the top of the screen, pulling the alert view upwards.</p>

<pre class="brush: objc">UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.alertView]];
[gravityBehavior setGravityDirection:CGVectorMake(0.0, -1.0)];
[self.animator addBehavior:gravityBehavior];</pre>

<p>What's interesting about the collision behavior is that we define a boundary that is off-screen.<br></p>

<pre class="brush: objc">UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.alertView]];
[collisionBehavior addBoundaryWithIdentifier:@"alertCollisionBoundary"
                                   fromPoint:CGPointMake(self.initialAlertViewFrame.origin.x, self.initialAlertViewFrame.origin.y - 10.0)
                                     toPoint:CGPointMake(self.initialAlertViewFrame.origin.x + self.initialAlertViewFrame.size.width, self.initialAlertViewFrame.origin.y - 10.0)];

[self.animator addBehavior:collisionBehavior];</pre>

<p>We also need a dynamic item behavior for setting the elasticity of the collision. The result is that the alert view will bounce a little when it collides with the off-screen boundary.</p>

<pre class="brush: objc">UIDynamicItemBehavior *itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.alertView]];
itemBehavior.elasticity = 0.4;
[self.animator addBehavior:itemBehavior];</pre>

<p>We also need to make the background view transparent again. We do this by setting the background view's <code class="inline">alpha</code> property to <code class="inline">0.0</code> in an animation block.</p>

<pre class="brush: objc">[UIView animateWithDuration:2.0 animations:^{
    [self.backgroundView setAlpha:0.0];
}];</pre>

<p>Run your application once more to see the result.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/205/posts/20943/image/t10_10_alert_show_hide.gif"></figure>

<h2><span class="sectionnum">6.</span> Handling User Interaction</h2>

<p>Even though the alert view responds to user interaction, we currently don't know which button the user has tapped. That's what we'll focus on in this section.<br></p>

<p>As we did with the menu component, we're going to make use of blocks to solve this problem. Blocks make for an elegant solution and can often be easier to use than a delegate protocol.</p><p>We start by updating the public&nbsp;<code>showAlertView</code>&nbsp;method. The method needs to accept a completion handler that the alert view invokes when the user has tapped one of the buttons. In&nbsp;<b>AlertComponent.h</b>, update the declaration of the <code class="inline">showAlertView</code> method from:</p>

<pre class="brush: objc">- (void)showAlertView;</pre>

<p>to:</p>

<pre class="brush: objc">- (void)showAlertViewWithSelectionHandler:(void(^)(NSInteger buttonIndex, NSString *buttonTitle))handler;</pre>

<p>The completion handler accepts two parameters, the index, of type <code class="inline">NSInteger</code>, and the title, of type <code class="inline">NSString</code>, of the button that was tapped by the user. If we want to invoke the completion handler when the user taps a button of the alert view, we need to keep a reference to the completion handler. This means we need to declare a property for the completion handler. We do this in the private class extension in&nbsp;<b>AlertComponent.m</b>.</p>
<pre class="brush: objc">@interface AlertComponent ()

...

@property (nonatomic, strong) void(^selectionHandler)(NSInteger, NSString *);

...

@end</pre>
<p>Still in <b>AlertComponent.m</b>, update the method description like we did in the header file a moment ago and store the completion handler in the&nbsp;<code class="inline">selectionHandler</code>&nbsp;property, which just we declared.</p>

<pre class="brush: objc">- (void)showAlertViewWithSelectionHandler:(void (^)(NSInteger, NSString *))handler {
    self.selectionHandler = handler;
    
    ...
}</pre>

<p>The last piece of the puzzle is invoking the completion handler in <code class="inline">handleButtonTap:</code>, passing in the button's tag and title.</p>

<pre class="brush: objc">- (void)handleButtonTap:(UIButton *)sender {
    // Call the selection handler.
    self.selectionHandler(sender.tag, sender.titleLabel.text);
    
    ...
}</pre>

<p>The AlertComponent is complete. It's time to test everything. Head back to&nbsp;<b>ViewController.m</b>&nbsp;and update the showAlertView: action as shown below. As you can see, we invoke the new <code class="inline">showAlertViewWithSelectionHandler:</code> method and pass in a block, which will be called when a button in the alert view is tapped by the user.</p>

<pre class="brush: objc">- (IBAction)showAlertView:(id)sender {
    [self.alertComponent showAlertViewWithSelectionHandler:^(NSInteger buttonIndex, NSString *buttonTitle) {
        NSLog(@"%ld, %@", (long)buttonIndex, buttonTitle);
    }];
}
</pre>

<p>That's it. Run your application once more and inspect Xcode's console to see the result of our work.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/41/posts/20943/image/console.jpg"></figure>

<h2>Conclusion</h2>

<p>UIKit Dynamics was first introduced in iOS 7 and can help you create realistic animations quickly. This short series has illustrated that leveraging UIKit Dynamics in your projects isn't difficult and you don't need to be an expert in math or physics.</p><p>Note that UIKit Dynamics is primarily meant for using in view based applications. If you're looking for a similar solution for games, then I recommend taking a look at Apple's <a href="https://developer.apple.com/library/ios/documentation/GraphicsAnimation/Conceptual/SpriteKit_PG/Introduction/Introduction.html" target="_self">Sprite Kit</a>, which is aimed at game development.</p><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/20943/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20943/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20943/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20943/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T16:35:50.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T16:35:50.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:22:"Gabriel Theodoropoulos";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:3;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-20658";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:95:"http://code.tutsplus.com/tutorials/creating-and-submitting-a-patch-to-wordpress-core--cms-20658";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:49:"Creating and Submitting a Patch to WordPress Core";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:9711:"<p>If you are someone who uses WordPress to earn a living and to tell your story, seeing a change that you wrote added to the WordPress code base is a pretty exciting thing. I know it was for me.&nbsp;</p><p>In this tutorial, you will learn the few simple things you need to know in order to create a patch for WordPress that can be accepted into the core software.</p><p>While WordPress is open source software that anyone can download and modify, only a handful of core contributors are able to commit their changes to WordPress itself. If you'd like to make a change to WordPress' core files you can propose it either by creating a ticket detailing the proposed change and attaching a patch, or by attaching a patch to an existing ticket.</p><p>A patch or diff file is a file that details the changes you made to the source that a version control system such as SVN or GIT can use to apply your changes. Creating a patch is easy via the command line or via a GUI tool like <a href="http://www.sourcetreeapp.com/" rel="external" target="_blank">SourceTree</a>.</p><p>For this article, I will be detailing how to use the excellent GIT GUI app SourceTree to checkout the latest version of WordPress and create your patch file. You can use the GUI tool of your choice or the command line if you prefer.</p><h2>Find or Creating a Ticket in Core Trac</h2><p>When you submit your patch to WordPress core, it must be attached to a ticket in <a href="https://core.trac.wordpress.org" rel="external" target="_blank">WordPress' issue tracker, which is&nbsp;called trac</a>.&nbsp;Therefore, the first step in submitting a patch is finding or creating a ticket.</p><p>While it is possible that a new ticket with a new feature could be accepted, it is not very likely. WordPress has literally millions of users and it only makes sense that the lead developers are very&nbsp;cautious about introducing new features. Almost all new features are now developed separately as plugins first and only after extensive testing and development are they merged into core.</p><p>Your best bet for getting a patch accepted is to create a patch for an existing ticket. Recently core trac was redesigned to make it easier to find <a href="https://core.trac.wordpress.org/tickets/good-first-bugs" rel="external" target="_blank">tickets with easy fixes</a> and those that are most likely to be included in the next <a href="https://core.trac.wordpress.org/tickets/minor/workflow" target="_self">point release</a>&nbsp;and the <a href="https://core.trac.wordpress.org/tickets/major/workflow" target="_self">next version</a>&nbsp;of WordPress.&nbsp;</p><h2>Reporting Bugs</h2><p>If you would like to create a new ticket in core trac, which is a great thing to do if you have found a new bug you can do so <a href="https://core.trac.wordpress.org/newticket" rel="external" target="_blank">here</a>.&nbsp;Just make sure that you have searched trac for any reports of the same issue before creating a new ticket and that you have verified the bug exists with the most up to date version of WordPress.&nbsp;</p><p>By that I do not mean the most recent release, but the master branch in GIT terminology or trunk in SVN terminology. I will detail how to get the latest version in later on in this tutorial.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/238/posts/20658/image/new-ticket.png"></figure><p>At the minimum, you must fill out the summary field, which is the title of the ticket, and the description field, which is the ticket's content. In the ticket's description, be as descriptive as possible.&nbsp;</p><p>At the 2013 WordCamp Orlando contributor's workshop, which I attended, WordPress lead developers Mark Jaquith and Andrew Nacin created this list of what goes into good bug report:</p><ul><li>steps to reproduce issue, starting with the&nbsp;earliest step</li><li>description of the bug</li><li>what you saw versus what you expected</li><li>error messages or error codes</li><li>PHP errors (what was the&nbsp;warning on page, what went in log, are there any JavaScript or Apache/ nginx errors?)</li><li>what browser?</li><li>environment (your&nbsp;PHP version, MySQL Apache or nginx version)</li><li>Does it happen with no plugins and default theme?</li><li>screenshots for user interface&nbsp;issues</li><li>be clear and concise</li><li>get to point first, then details.</li><li>related ticket number&nbsp;</li><li>one bug per ticket&nbsp;</li><li>permalink settings</li><li>Is multisite enabled&nbsp;or not?</li><li>WP_DEBUG or equivalent enabled?</li><li>user role logged in when the issue happened (or changed roles in database)</li></ul><p>Keep in mind that not all of these are relevant to every bug, but there more relevant information you can add the better.</p><p>Unless&nbsp;you are sure of what to set in them, you&nbsp;should leave the fields below description alone and let a core contributor use them to categorize the ticket accordingly. I would recommend that you use the "Has Patch" or "Needs Patch" tag based on whether or not you are attaching a patch to fix the bug or not.</p><h2>Checking Out the Latest WordPress From GitHub Using a GUI Tool</h2><p>Before creating a patch for any ticket, it is important that you have the absolute latest version of WordPress as it there are many changes made to it every day. It is impossible to know if your fix works or your bug still exists unless you are using the most&nbsp;up-to-date code. Your patch will likely not be accepted if it modifies code that has already changed.</p><p>WordPress is managed in SVN, but that code is mirrored as a GIT repository in two places:</p><ol><li><code class="inline">git://core.git.wordpress.org/</code></li><li><a href="https://github.com/WordPress/WordPress">https://github.com/WordPress/WordPress</a></li></ol><p>The GitHub repository is the easiest to use. Just keep in mind that even though it is the official GitHub repo, it is still not used for issue tracking and you should not submit pull requests to it.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/238/posts/20658/image/clone.png"></figure><p>There are many ways to get the latest version of WordPress via SVN or Git. Personally, I&nbsp;find the easiest thing to do is to use the great GIT GUI tool <a href="http://sourcetreeapp.com/" rel="external" target="_blank">SourceTree</a> to clone the GitHub mirror. This is as simple as selecting "New/ Clone" from the file menu, entering the address for the Git repo in the "Source Path/ URL" field and then specifying a local path for cloning, which would be&nbsp;inside of your XAMMP or Vagrant testing environment.</p><p>Speaking of Vagrant, the popular <a href="https://github.com/Varying-Vagrant-Vagrants/VVV" rel="external" target="_blank">WordPress Vagrant configuration VVV</a> has a preconfigured testing environment for WordPress core, including the latest code and the unit tests.</p><h2>Creating a Patch File</h2><p>Once you have made the changes to WordPress that are needed to resolve the issue you are trying to fix and tested the fix you need to create a patch file to upload to the ticket. SourceTree includes a way to create a patch file or you can use the command line.</p><p>In SourceTree, you can create a patch file by going to your working copy, and right-clicking the file(s) that have changed. From the right-click menu select "Create Patch".</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/238/posts/20658/image/create-patch.png"></figure><p>Alternatively, in your terminal, navigate to the root directory for your WordPress repo and use this command to create the diff:</p><p><code class="inline">git diff —non-prefix ~/name.path&nbsp;</code>


<br></p><p>No matter how you create your patch file, you should name it after the ticket number it is intended for. If it is the second patch uploaded to the ticket append .2 to the end of the number, or .3 if it is the third and so forth. For example, the fifth patch for ticket #12358 would be called #12358.5</p><h2>Uploading a Patch to Trac</h2><p>Now that your patch is ready to go, you need to upload it to the ticket in core trac. On any existing ticket, under the description is an "Attach File" button that you can use to upload your patch. On the next screen be sure to add a description of what the patch does.</p><h2>Be Patient and Be Understanding</h2><p>WordPress is a massive project, so it is unreasonable to expect a response to your patch immediately. Also, understand that the standards for a patch being committed to WordPress have to be very high in order to best serve all of its users.</p><p>Once you've submitted your patch be patient and be understanding of any feedback you receive. The lead developers are very approachable, if you have questions about your patch or why it was not improved, feel free to ask one of them in the #wordpress-dev IRC channel.</p><p>While waiting for a responses and having to make changes can be frustrating, it's worth it when your patch is committed to WordPress and the changeset description acknowledges you.&nbsp;</p><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/20658/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20658/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20658/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20658/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T15:00:00.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T15:00:00.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:12:"Josh Pollock";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:4;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21475";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:82:"http://code.tutsplus.com/articles/envatos-most-wanted-ecommerce-plugins--cms-21475";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:40:"Envato's Most Wanted:  eCommerce Plugins";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:4533:"<p>Earlier this month, we ran <a href="http://code.tutsplus.com/articles/envatos-most-wanted-directory-listing-themes--cms-21407" rel="external" target="_blank">our first post promoting</a> <i>Envato's Most Wanted</i>. Recall that these are opportunities for which users, developers, and designers are offered significant rewards for delivering high-quality work assuming that it meets the criteria for the contest.</p><p>Today, we're offering up the same thing, except rather working with&nbsp;<i>Directing &amp; Listing Themes,&nbsp;</i>we're looking specifically at eCommerce Plugins (which is great considering we've been branching out - and will be continuing to branch out - into this material in current and future articles).</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/34/posts/21475/image/envato-most-wanted-ecommerce.png"></figure><p>Yup - <b>$9,000</b> offered up for work with PrestaShop, WooCommerce, and OpenCart? Pretty nice! Of course, just as with the previous contest - and with other contests, really - there are some terms and conditions.</p><h2>The Terms of eCommerce Plugins</h2><p>Directly from the event details:</p><blockquote>We’ve put $9,000 bounty on the heads of Envato’s most wanted file types –&nbsp;<a href="http://codecanyon.net/category/wordpress/ecommerce/woocommerce">WooCommerce Plugins</a>,<a href="http://codecanyon.net/category/plugins/opencart">OpenCart Extensions</a>&nbsp;and&nbsp;<a href="http://codecanyon.net/category/plugins/prestashop">PrestaShop Modules</a>.</blockquote><blockquote>How do you collect? Submit a new item between May 7th and July 11th 2014 and fill out an entry form to be in with a chance to win to a cash prize!</blockquote><p>But what does the contest actually entail? That is to say, what are the prizes that are offered for each of the various platforms plugins?</p><p>Great question:</p><h3>BEST WOOCOMMERCE PLUGINS</h3><ol><li><strong>$1,000</strong>: Best Back-End Enhancement Plugin</li><li><strong>$1,000</strong>: Best Front-End Enhancement Plugin</li><li><strong>$1,000</strong>: Best Marketing/Engagement Plugin</li></ol><h3>BEST OPENCART EXTENSIONS</h3><ol><li><strong>$1,000</strong>: Best Back-End Enhancement Plugin</li><li><strong>$1,000</strong>: Best Front-End Enhancement Plugin</li><li><strong>$1,000</strong>: Best Marketing/Engagement Plugin</li></ol><h3>BEST PRESTASHOP MODULES</h3><ol><li><strong>$1,000</strong>: Best Back-End Enhancement Plugin</li><li><strong>$1,000</strong>: Best Front-End Enhancement Plugin</li><li><strong>$1,000</strong>: Best Marketing/Engagement Plugin</li></ol><p>Given the fact that we've been covering eCommerce in several recent posts, and that we've got a queue of posts coming down the pipe for these topics as well, shows that there is a strong interest in the topic.</p><p>And since those of you who actively participate in the community are working to better yourself through the articles, tutorials, and contests, this contest is timed very well.</p><h2>I Want to Participate! What Do I Do?</h2><p>Great! For all of the details, make sure to check out <a href="http://enva.to/emwplugins" rel="external" target="_blank">the event page</a> as it covers&nbsp;<i>everything</i> you need to know about how to get involved with the contest.</p><p>As we mentioned in the last article, this is a new cross-promotional effort between the Marketplace Team and the Tuts+ Code Team in order to help bridge the gap that exists between the skills you guys and girls are learning here on the site, and an attempt to help put them to real-world practical use not only in day-to-day work, but in opportunities to win some cash.</p><p>If this particular contest doesn't work out with your schedule, no big deal! There are more <i>Envato's Most Wanted</i> events coming this way in the coming weeks - after all, see how quickly this one came up?</p><p>As usual, all feedback is welcome in the comments so don't hesitate to let us know. Good luck to those of you who enter!</p><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21475/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21475/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21475/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21475/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T14:59:44.868Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T14:59:44.868Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:12:"Tom McFarlin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:5;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21185";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:108:"http://design.tutsplus.com/tutorials/render-a-simple-3d-pixel-space-invaders-in-adobe-illustrator--cms-21185";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:60:"Render a Simple 3D Pixel Space Invaders in Adobe Illustrator";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:5647:"<figure class="final-product final-product--image"><img src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/21185/final_image/Space_invaders600.jpg" alt="Final product image" /><figcaption>What You'll Be Creating</figcaption></figure><p>Do you remember the good old video game, called Space Invaders? Let’s create something new in pixel art creation but it's going to be vector! We’ll draw the famous pixel aliens in Adobe Illustrator and liven them up with the help of the 3D effect!&nbsp;
</p><h2><span class="sectionnum">1.&nbsp;</span>Create a Pixel Monster</h2>
<h3>Step 1</h3><p>Make a <strong>New Document</strong> of <strong>600 x 600 px</strong> size.&nbsp;</p><p>To start with, we need a grid. Let’s use the&nbsp;<strong>Rectangle Grid Tool</strong>.<strong> Click </strong>on your Artboard once and<strong> </strong>release the left mouse  button.<strong> </strong>Make the following settings in the pop-up <strong>Options
</strong>menu:<strong> Width </strong>and<strong> Height</strong> values equal <strong>600 px; Horizontal Dividers Number</strong> equals <strong>15; Vertical&nbsp; Dividers Number</strong> equals <strong>15</strong> as well. Click <strong>OK</strong> after you’ve done with the settings.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/21185/image/1_3D-monsters-grid.jpg"></figure>
<h3>Step 2</h3>
<p>After you’ve created the grid, align it with your Artboard and go to <strong>Object &gt; Live Paint &gt; Make.</strong></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/21185/image/2_3D-monsters-grid.jpg"></figure>
<h3>Step 3</h3>
<p>Now we can start drawing our pixel monster! Grab the <strong>Live Paint Bucket (K),</strong> switch the color to pink and start filling in the cells closer to the left side of the Artboard.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/21185/image/3_3D-monsters-grid.jpg"></figure><h3>Step 4</h3>
<p>Continue filling up the blank squares.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/21185/image/4_3D-monsters-grid.jpg"></figure>
<h3>Step 5</h3>
<p>One half of the funny alien is ready! Draw out the second part in the same way.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/21185/image/5_3D-monsters-grid.jpg"></figure><h3>Step 6</h3>
<p>The alien is finished! Don’t forget to <strong>Object &gt;
Expand</strong> it in order to delete the grid.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/21185/image/6_3D-monsters-grid.jpg"></figure><h2><span class="sectionnum">2.</span> Make the
Monster Dimensional by Turning It into a 3D Shape</h2><h3>Step 1</h3><p>It’s time
for some simple magic trick! Select your object and go to <strong>Effect &gt; 3D &gt; Extrude &amp; 
Bevel.</strong></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-
assets.tutsplus.com/uploads/users/107/posts/21185/image/7_3D-monsters-grid.jpg"></figure><p>Ta-da! Our shape became dimensional. Now we can play with the settings a bit. Set the <strong>Bevel</strong> to <strong>Tall-Round</strong> and the <strong>Height</strong>
to <strong>3 pt.</strong>
</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-
assets.tutsplus.com/uploads/users/107/posts/21185/image/8_3D-monsters-grid.jpg"></figure><h3>Step 2</h3>
<p>Click the <strong>More Options</strong> button and reveal the hidden <strong>Surface</strong> options menu. You may leave the settings as default or increase some values a bit in order to make the alien more bright, slick and shiny.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-
assets.tutsplus.com/uploads/users/107/posts/21185/image/9_3D-monsters-grid.jpg"></figure>
<p>Our 3D pixel space Invader is finished!</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-
assets.tutsplus.com/uploads/users/107/posts/21185/image/10_3D-monsters-grid.jpg"></figure><h3>Step 3</h3>
<p>How about making the rest of them, using the same simple technique?</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/21185/image/11_3D-monsters-grid.jpg"></figure><p>After you’ve finished, just select the space invaders and go to <strong>Effect &gt; Apply Extrude &amp; Bevel (Shift-Control-E)</strong> to automatically apply the 3D effect with the same options that we’ve set earlier.<br></p>
<h2>Congratulations! The 3D Pixel Space Invaders are Finished!<strong> </strong></h2>
<p>I hope you’ve enjoyed using this simple and fun trick that you can use for creating other
pixel characters and objects. Good luck!</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/21185/image/Space_invaders600.jpg"></figure><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21185/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21185/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21185/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21185/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T13:20:40.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T13:20:40.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:14:"Yulia Sokolova";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:6;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-20679";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:83:"http://design.tutsplus.com/articles/color-fundamentals-advanced-coloring--cms-20679";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:37:"Color Fundamentals: Advanced Coloring";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:35074:"<p>What are materials and textures? How can we see transparent things? What makes a scene something more than a set of objects? How do you mix reflected colors? Learn tricks that will bring life to your realistic paintings!<br></p><p>This is the the last part of our mini series on color and light. In the first tutorial we <a href="http://design.tutsplus.com/articles/improve-your-artwork-by-learning-to-see-light-and-shadow--cms-20282" target="_self">learned how to see light and shadow</a>, and in the second one, the <a href="https://design.tutsplus.com/articles/color-fundamentals-shading--cms-20549" target="_self">principles of color</a>. Today we're going to learn some advanced tricks that will give your artwork a real spark. The key word here is variety, in color and form. If sometimes the things you draw look like plastic figurines, this tutorial should help you a lot!<br></p><h2>Materials<br></h2><p>Most of the problems with painting colors lies in the depiction of surfaces. The surface structure influences our perception of color and brightness,
 and there are a lot of issues you need to take control of. When ignored, it can make for a dull, "plastic" scene. Plastic is the default material of every beginner's drawings—let's move past that.<br></p><h3>Specular and Diffuse Reflection<br></h3><p>In the previous tutorial I mentioned glossiness, but I didn't emphasize how important it is. In general, there are two kinds of color-making reflections: diffuse, and specular. Usually they're mixed together, and the proportion between them creates the overall reflection we perceive. So we can see matte, gloss, matte shine and all the stages in between. <br></p><p>As we noticed before, specular reflection is made by a ray reflected perfectly by the surface straight to our eyes. The more specular the surface, the clearer image of the light source appears on it. The less specular it is, the fuzzier the image, until it eventually becomes just a blurry spot of a diffuse reflection shifted to the light source's color. The shiny layer may be a property of the material, or just an effect added by water.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-12.png"></figure><p>It's safe to treat every material as partially specular. Even a rubber ball or a plush has a little bit of shine. Using various specularity levels for the materials on your scene is very important for diversity. Shine is so powerful that it's tempting to use it everywhere, but flooding all the scene with oil isn't really the way to an attractive artwork.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-14.png"></figure><p>A clear specular reflection doesn't always have the color of the light source. It works like this only if the "specular layer" (that's a simplification, but there's no need to go into technical details) reflects all the colors. If it doesn't, we get a red ball with clear green opalescence. It's a nice effect for gemstones, expensive fabrics, feathers (for example, ravens are black with blue tint) and the carapaces of beetles (blue tint on a green body).<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-13.png"></figure><p>The level of specularity should also be used to show how rough or polished the material is. A rough material after careful polishing will reflect a lot of light, so you should use a different specularity for an old wooden table and a polished wooden bowl—although they are made of the same material, their tooling made the difference.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-15.png"></figure><p>Texture isn't only about shape of a surface and the way it should be drawn, but also about the reflective properties of the material. Every surface is made of tiny objects, and they all react to the light source too—they cast their tiny shadows and have their little highlights. That's why simply pasting a half-transparent textured photo over the top of a drawn material doesn't always make it look "right". The finer the texture, the less this effect occurs, but you need to be careful with bigger ones, like scales or bark. Also, every rough texture drastically decreases overall specularity of the surface!</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-28.png"><figcaption>A rugged or porous surface (like skin) disturbs the specular reflection<br></figcaption></figure><h3>Fresnel Effect</h3><p>The perceived specularity of a surface depends on the angle of view. The sharper the angle, the clearer the reflection. This effect is very helpful in finding a perfect place to define glossiness of our material, and it also tells us when to treat water or glass as a transparent material, and when it should work like perfect mirror. You can observe this phenomenon on wet floor—the lower you keep your head, the clearer the reflection.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-48.jpg"></figure><h3>Transparency and Refraction<br></h3><p>Transparency is troublesome, because its intuitive definition is almost impossible to be conveyed into drawing. A simple change in the opacity of an object makes it look like a ghost, not like a glass. That's because our casual definition of "transparency" simplifies the issue.<br></p><p>Let's see how it works. Colored glass is easy to explain: for example, red glass absorbs all the colors, and only red passes through. Putting it simply, it works like a color filter.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-17.png"></figure><p> Intuitively, a fully transparent material lets all the rays through, without 
any absorption or reflection. But if the rays didn't interact with the 
material in any way, how would we be able to see the material?</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-16.png"></figure><p>If you read the previous paragraphs carefully, you should guess the answer—<i>only a 100% matte material reflects nothing</i>. So even our pure glass reflects a bit of specular reflection, showing us the surface. <br></p><p>An interesting fact: specular reflection is what turns a lake of transparent water into a mirror!</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-18.png"></figure><p>But how do transparent objects like water drops or glass cast shadow? This is based on <b>refraction</b>, the bending of the rays when they pass between two media. Including this phenomenon in your painting gives a transparent object a sense of volume—this is the difference between a solid glass ball and a bubble.</p><p>You should remember this scheme from physics classes. The only thing we need to remember here is that the thicker the material, the more likely the rays will be disturbed.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-19.png"></figure><p>The situation gets even more interesting when the surface is bent, creating a <b>lens</b>. Lenses have an amazing ability to focus or scatter rays. And when rays are focused (bent from their initial direction to one single point), areas of shadow appear. That's how a transparent lens creates a shadow!<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-20.png"></figure><p>Every transparent object with bent surface makes a lens. Every convex lens is able to focus light to some extent. Therefore, a wine glass, a bottle of water or a drop will all cast a shadow and very bright spot (or smudge, depending on how good the lens is) of focused light. If, additionally, the lens is colored, the bright spot will be colored too.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-21.jpg"></figure><p>But what does such a convex lens do? Of course, it magnifies! That's the most important thing you need to paint realistic transparent, solid materials. <br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-22.jpg"><figcaption>A bubble and a solid glass ball<br></figcaption></figure><h3>Translucency and Subsurface Scattering (SSS)</h3><p>What if material doesn't let the light completely through? What if it gets blocked somewhere along the way? Well, then we get a situation like below. The leaf is backlit, but it looks as bright as if the light source was right in front of it. <br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-23.jpg"></figure><p>The mechanism behind this is very simple. Some materials are <b>translucent</b>—they're not fully opaque, nor transparent. Light that seems to be absorbed inside them sometimes finds its way out, but before this it gets scattered, creating an illusion of internal illumination. Of course, the longer the distance our light needs to travel, the weaker the transmission.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-25.png"></figure><p>The most popular semi-translucent material is human skin. Subsurface scattering is the most visible in soft parts of our body, like ears or nose, but to some extent it can be observed everywhere. If you ignore this phenomenon, your painted face will look like a statue. Also, grass owes SSS its juicy green, as it comes mainly from transmission, not reflection.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-24.jpg"></figure><p>What does subsurface scattering do to color? The most conspicuous sign of SSS is highly increased saturation in a place that isn't directly illuminated. Brightness can be higher too, and the temperature of hue shifts to the color of light.<br></p><p>The mechanism of SSS on a human skin is a big topic, but I've got something extremely helpful for you—an&nbsp;<a href="http://www.iryoku.com/separable-sss-released" target="_self">interactive human head model</a> where you can adjust all the options yourself and see how it works!<br></p><h3>Ambient Occlusion<br></h3><p>Multiple light sources, or just one light source naturally scattered in the scene don't leave too much space for edge-defining shadows. Therefore, there's a high risk of flattening the image or making it too "soft". To avoid it you can focus on the absolute shadows—those which will be there no matter how many lights you use.</p><p>Using ambient occlusion doesn't mean your objects need to look like 3D models (<a href="http://jiyu-kaze.deviantart.com/" target="_self">although it is possible</a>)—just define all the crevices. A good method for this is to imagine your object has been flooded with a non-stick dye. Most of it will run down, but some will be stuck in the crevices. The more dye there stays, the deeper the shadow.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-27.png"><figcaption>An example of an object illuminated by directional light and with ambient occlusion<br></figcaption></figure><h3>Fluorescence</h3><p>Some materials are able to transform invisible light hitting them into visible light. These objects seem to reflect more light that there is in the environment—they look like they're glowing, but they don't emit light on their own. This effect can be useful for magic things, plants, fungi and mysterious animals.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-57.png"></figure><h3>Emission of Light</h3><p>Sometimes we'll want to create the light 
source of some object of the scene. With all the things we've learned it
 should be a piece of cake! The brightness of our light source will define 
its power, and the hue and 
saturation are up to you—it's the source, it can be anything. 
Important: an illuminating object doesn't cast shadow!</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-26.png"></figure><h2>Scene Coherence</h2><p>I painted the picture below about two years ago. As you can see, the composition is great, the anatomy is decent, the colors are eye-catching, but...
 it doesn't look like a whole. Every object (dragons, reindeer, Santa) 
has their own set of colors and there's no relation between them. And 
how can there be no relation, if they're in the same scene, under the 
same light?<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-31.jpg"></figure><h3>Colorful Light<br></h3><p>Colorful light seems to be some additional, abstract topic. Sun gives us white light and it looks natural to us, and any colorful light needs to come from an artificial, man-made source. However, in the previous tutorial we noticed that sunlight is never perfectly white and neutral—it's either warm or cold. That leads directly to conclusion that it's white light that's artificial!</p><p>The hue of the light source affects all the objects in the scene, creating a coherent set. Look at these two pictures below. I'm sure you can easily tell which one is warm and which cold. They both look OK—the first one seems to be taken on a sunny day, and the other when it's more cloudy. What's important, is that if they weren't placed next to each other, you probably wouldn't even notice this yellow or blue tint! As we said before, color temperature comes from comparison.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-1.png"></figure><p>You may be familiar with the concept of white balance. Sometimes photos look too yellow, or too blue. This is because a camera takes a picture of what it "sees", and we don't only see, we have a brain that changes the image immediately and imperceptibly. A photographer needs to shift the colors to yellow (if the photo is too bluish) or to blue (if it's too yellow), but our brain makes this correction outside of our awareness.</p><p>What does this mean? You can tell when something is white even if it doesn't look white under some circumstances. Check it out in the evening, when everything is blue. You'll know a sheet of paper is white, even though it's not—it doesn't reflect full spectrum to you! It's called <b>chromatic adaptation</b> and it leads to various illusions, like the one below.<br></p><p>The circles on the right look red, blue and green to us. Our brain assumes the background would be white under perfect light conditions (like in the lefthand picture) and calculates the difference between the white and the actual background. Then it adds this value to the other colors.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-3.png"></figure><p>Of course, it's only an illusion. The colors are purple, blue and cyan, and these are the ones you should use in painting something lit by this kind of light source. In digital painting you can use a blue filter to shift all the colors to their proper hue, but it limits you to only one light source. How should you foresee how the colors will change under a colorful light? First we need to understand how it works.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-4.png"><figcaption>These are the same colors as in the righthand image above. Check in your graphic editor if you don't believe me.<br></figcaption></figure><p>Just for revision—when white light (made of all the colors) hits a red object, all colors except red are absorbed. Red itself is reflected to our eyes. A white object reflects all the colors. Hopefully you've got a good grip on that now, because we're going to take it one step further.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-5.png"></figure><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-5a.png"></figure><p>What happens if we remove all the colors from the light, leaving only red? Our red object will be the same red as before, but the white object, still reflecting everything, will reflect only red too! In fact, now both these objects are indistinguishable. <br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-6.png"></figure><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-6a.png"></figure><p>Let's leave only blue light now. This time the red object absorbs it all and nothing gets reflected—it appears black. The white object again takes on the color of the light.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-7.png"></figure><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-7a.png"></figure><p>But those were extreme examples—in nature it's rarely this dramatic. Usually colorful lights are made of all the components, and the objects aren't colored strictly in red, green or blue only. Let's create a more realistic situation and see what happens.<br></p><p>The object in the images below is dark green and slightly glossy, like grass. It's not pure green, but rather, a combination of green, red and blue. You can see some parts of the light rays in the first image were absorbed (this is what a plant uses for photosynthesis), but they each one was partially reflected. Now, if we change the light source to orange (a lot of red and a bit less green) the final image in our head lacks blue and a bit of green. It's still a green ball, but you can see the difference. This difference is crucial for the object to fit the scene under each particular light source.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-8.png"></figure><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-8a.png"></figure><p>You can easily replicate any of these experiments using your monitor as a color lamp—just wait until it gets dark, then open your graphic editor in full screen mode and fill the whole page with the color you need. But you don't need to do it every time you want to paint something that's under a colored light. To check how a color will change under a certain light, you need to answer these questions about the scene:</p><ul><li>What does the object need for its color to be shown?</li><li>What and how much color does it get from the light source?<br></li></ul><br><p>When we've got two colors—of the object and of the light—we need to find an intersection between them. A yellow object and a magenta light have the same intersection as a magenta object and a yellow light. Therefore, we're looking for an intersection of two colors, no matter which is which. To simulate this behavior digitally, you can use the <b>Multiply</b> blending mode.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-37.png"></figure><p>However, there's a funny thing about this mixing. Do you remember subtractive mixing, from the previous tutorial? This is just the same! It means you can use the four rules of subtractive mixing to foresee how an object will look under some light. Traditional artists shouldn't have any problems with this, but as a digital artist you just need to keep in mind a few other rules.<br></p><p>By reducing saturation you reduce the amount of "paint" and the presence of that color in the mixture. The brightness of the mixture is affected mostly by the luminance of the darker components. A small amount of paint means here your object is getting mostly white light, shifted slightly to another color.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-44.png"><br></figure><p>Brightness can be seen as the amount of ambient light in the environment. For example, in the night the light source should be dark blue, and in effect the objects should be dark too. In movies night is often simulated by strong blue light and the scene is actually bright!<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-45.png"></figure><p>The brightness of the mix drops quite drastically most of the time, and although it is realistic, realism isn't always welcome. For example, real night scenes are very, very dark, not romantic blue made by long exposure on your camera and a few edits in Photoshop. But we actually <i>want to</i> see this romantic blue instead of fuzzy shapes in the dark. So using perfectly calculated values of intersection isn't always the best way for a nice effect—like many things in art, your own way of estimating the final color forms a part of your style.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-46.jpg"><figcaption>From left to right: daylight (template colors), night (template colors with simple blue filter), night (colors shifted)<br></figcaption></figure><h3>Color Mixing: Reflected Light<br></h3><p>The process of reflecting light within the scene is crucial for 
making it a whole rather than a set of objects. It's a common mistake to
 shade every object totally on their own, which results in a fake-looking
 scene. Reflected light is nothing but a colorful light coming from a different direction than the direct light. Therefore, it obeys the rules we've just talked about.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-9.png"></figure><p>However, there's one more rule you need to remember. <i>Brighter light always beat weaker light</i>. It means that reflected light will never be stronger than direct light (it may be just exactly <i>as </i>strong, if it's perfectly specular reflection), and it will be observed in the shadow only. And if the reflected light is darker than the core shadow, it won't be visible too—there is no such thing as black light, only the lack of it. If you see a "reflection" of a dark object on a bright, specular surface, it's actually a kind of shadow—you see bright areas outlining the lack of reflection.<br></p><p>But reflection isn't only about what color is bounced between two surfaces. It's also about how and when it is bounced. So here come a bunch of simple rules that you need to keep in mind:<br></p><ol><li><b>Fully matte surfaces</b> don't reflect any light to each other;<br></li><li><b>Fully specular surfaces</b> reflect everything—they work like a light source with sharp edges. They are able to make the surface as bright as if it was illuminated directly by the light source;</li><li><b>Mixed surfaces</b> (slightly glossy or specular coated with matte) reflect as much light as there is specularity in them—the glossier, the stronger reflection;<br></li><li><b>Dark surfaces</b> are dark because they absorb a lot of light. Therefore, they don't influence matte objects. On glossy surfaces there may appear a shadow of them.<br></li><li><b>White surfaces</b> reflect everything—they brighten objects a lot.</li></ol><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-47.jpg"></figure><h3>Multiple Light Sources<br></h3><p>Let's talk some more about light sources. Since they create the color, they're crucial to painting a scene as we imagine it. We can distinguish many kinds of light sources, with the most characteristic being:</p><ol><li><b>Sunlight:</b>&nbsp;strong, but kind of diffuse light source. Its shadows can be soft or sharp depending on its power (e.g.: sun, fire, lamp);<br></li><li><b>Spotlight:</b>&nbsp;strong, directional light with sharp shadows (e.g. flashlight, sunlight passing through a hole); <br></li><li><b>Reflected light</b>: light bounced from an object to another;</li><li><b>Ambient light:</b>&nbsp;diffuse reflected light without a defined direction (e.g. sunlight reflected from the sky, light of fireplace reflected from the walls);<br></li><li><b>Transmitted light:</b>&nbsp;light passing through a translucent object.<br></li></ol><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-58.png"></figure><p>Mixing these light sources can help create a nice, appealing scene. Beginners often start with side sunlight only, since it's the most obvious. However, it creates dull shadows covering a big part of the scene. Ambient light helps fill these shadows to reveal the shapes hidden under them. On another level artists link all the objects on the scene by including reflected light. Sometimes transmitted light comes to play too. How to manage all this chaos?</p><p>Even if your scene seems to be flat, you'll need to use perspective for its lighting. That's a rule you can't break—shadows and highlights appear on forms, not on a flat sheet of paper. Side lighting is used the most because it's easy to place the light source mentally on the left or on the right of a 2D surface, but it's also overused and boring. If you want to take full control over the lighting in your scene, you need to plan it.</p><p>Let's say you want to draw a composition like this. It doesn't need to be that simple, but every scene can (and should) be simplified to primary forms in your mind.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-50.jpg"></figure><p>Now you can change your perspective. Take a sheet of paper and sketch your scene from above and/or in front view. This way you'll be able to place the light sources at any angle you wish. You'll also see how the objects interact and where the shadows are casted or overlapped. This sketch should be very, very simple - the details of objects will inherit their shading. You'll probably cope without it in simple scenes, but when things get complicated (uncommon light sources, a lot of transmission) it's indispensable.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-51.jpg"></figure><h3>Shadows</h3><p>When dealing with multiple light sources, including colorful ones, you may stumble upon a new problem—what happens to the shadows?</p><p><b>Ambient light</b> is known by its ability to color the shadows made by the primary light source. It'll never create new shadows in the light area, but it's able to cast its own shadows in the shadow area.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-46.png"></figure><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-47.png"></figure><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-48.png"></figure><p><b>Reflected light </b>is sometimes cast into shadow, coloring and brightening it.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-53.png"></figure><p><b>Transmitted light</b> is good at destroying the shadow of its object. Sometimes, when it's weak, it only colors the shadow as an ambient light.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-54.png"></figure><p>The rule of thumb has it that shadow should be a complementary color to the light. For example, blue light casts yellow shadows and vice versa. It's true only to some extent—we need two light sources to make it happen, and it's useful only if one of them is primary or secondary color, and the other one is white.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-55.png"></figure><p>This optical illusion is based on a very interesting vision mechanism called <b>color opponency</b>. Cones aren't the
 only middleman between what we look at and our brain. Surprisingly, the
 three signals aren't transferred directly—they go through three 
channels: <b>red/green</b> channel, <b>yellow/blue</b> channel and <b>light/dark</b> channel. That's why there's no bluish yellow—only one of these colors can go through a single channel at a time. <br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-9-1.png"></figure><p>The main conclusion we need to take from this is that our brain doesn't see red because it <i>receives red</i> signal, but only because it <i>doesn't </i>receive <i>green </i>nor<i> blue</i> at the same time. When you see a yellowish (<code class="inline">RG</code>) shadow casted by blue (<code class="inline">B</code>) light source in the presence of white (<code class="inline">RGB</code>) light source, it's because the shadow (<code class="inline">RGB</code>) is a bit less blue than the light area (<code class="inline">RGB+B</code>). And for our brain, if it's not blue, it's yellow! Analogously, when something isn't bright, it's dark. It's the same with the&nbsp;<b>afterimage</b> phenomenon—a white screen becomes less red after long time of looking at something <i>more</i> red, and thus it gets a complementary tint (cyan).<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-56.png"><figcaption>Look at the dot on the left by 15 seconds, then look at the dot on the right<br></figcaption></figure><p>Of course, it's a very subtle coloring and if you ignore it, no one should notice a thing. I described it only because I hear this rule quite often, and people seem to use it without trying to understand it. Most of the circumstances that seem to confirm this rule are a result of ambient light coloring (yellow sunlight—blue shadow made by sky; orange lantern light—dark blue sky in the night), so when you see an oddly colored shadow, check the ambient light first.<br></p><p>And what about another rule of thumb: "warm light—cold shadows; cold light—warm shadows"? Well, yes, it's kind of correct, but only if you expand it: warm primary light— cold ambient light and vice versa. This kind of contrast is very pleasant to the eye, but it's not some kind of rule that must be obeyed everywhere and at every time. It's you who chooses the color of ambient light. And most certainly you shouldn't try to add cold shadows when your ambient light is actually warm!<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-49.jpg"></figure><h2>Conclusion</h2><p>So, that would be all the fundamentals you need to know about color. Of course, it was just a concentrated summary and you're encouraged to study all these topics further. If you think there's too much to learn, just remember—painting isn't easy! It may look so when a professional creates a masterpiece in a matter of minutes, but it's only because they have spent <i>years</i> polishing their skills. Painting isn't just about putting colors on paper or screen, it's about knowing how to put them, knowing where they come from, where they should and shouldn't be, and what they should look like. If you really want to be good, don't rely on your talent or feeling only. Take the time to master theory, all this boring stuff hidden behind art. You'll be surprised how many of your unvoiced questions it can answer!</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-final.jpg"></figure><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/20679/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20679/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20679/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20679/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T13:00:12.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T13:00:12.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:17:"Monika Zagrobelna";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:7;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21455";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:98:"http://design.tutsplus.com/articles/community-project-creative-selfie-showcase-part-one--cms-21455";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:54:"Community Project: Creative Selfie Showcase - Part One";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:11766:"<p>Last month we asked you to join us in the first ever <a href="http://design.tutsplus.com/articles/design-illustration-community-project-show-us-your-creative-selfies--cms-21222" target="_self">Design &amp; Illustration Community Project</a> where we had you submit creative selfies to get to know our readers!&nbsp;</p><h2>Community Project:Creative Selfies Part One<br></h2><p>Today we're bringing you the first round of selfies for this project with 15 incredible submissions from talent all around the world. Check out these great designs and learn more about your fellow artists!<br></p><h3>Deadline Extended to July 22nd, 2014</h3><p>We're still accepting entries! If you're new to this project visit the <a href="http://design.tutsplus.com/articles/design-illustration-community-project-show-us-your-creative-selfies--cms-21222" target="_self">original announcement post</a> for the official guidelines and available templates. We would love to get to know more of you so submit your own brilliant selfie to be featured on Tuts+.&nbsp;</p><h2>Creative Selfies vy You!</h2><p>Here are the first 15 selfies by our readers. Feel free to show some love to these talented artists in the comments! Enjoy!<br></p><h2>Brennan Wyatt</h2><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/346/posts/21455/image/Brennan-Wyatt-Selfie.jpg"></figure><p>Hey there, my name's Brennan and I'm a design student from Halifax, Canada. <br>You can find some more of my work at <a href="https://www.facebook.com/brennanwyattdesign">https://www.facebook.com/brennanwyattdesign</a> (Updating soon, promise!) Feel free to drop me a line. I'm always looking for freelance work!</p><h2>Jamila Karlsson</h2><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/346/posts/21455/image/jamila-karlsson-selfie.jpg"></figure><p>Hey, my name is Jamila and I'm a graphic designer from sweden. I just
 got started but I found my passion and it is vector and Illustrator&lt;3. I play with it almost every day hoping to learn and get 
better and better. I love this community and look for new ways to 
create. My webpage is <a href="http://www.jamky.se" rel="nofollow">www.jamky.se</a></p><h2>ZoooP<br></h2><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/346/posts/21455/image/zooop-selfie.jpg"></figure><p>Hello, I'm a Graphic/MotionGraphic Designer from Finland. My original 
picture is 50x70cm and I made it last year. I'm mostly self learned 
during the years, but I have also degree in Graphic Design. I haven't 
got any portfolio website, but it is coming soon. Meanwhile if you are 
interested to see my animation, you can see them: <a href="http://www.vimeo.com/zooop" rel="nofollow">www.vimeo.com/zooop</a> (password if needed is 1234) Also you may take contact in my email: kooliko@gmail.com</p><h2>Cory Carr</h2><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/346/posts/21455/image/cory-carr-selfie.jpg"></figure><p><br></p><p>Hey! Whats up everybody! This is my selfie. I used Illustrator to piece 
together all different types of colors and shapes to make a face. I get a
 lot of buzz about this piece. Just graduated from college too wooop wooop!! You can check out some of my other  work 
here: <a href="http://www.corycarr.portfoliobox.me/">http://www.corycarr.portfoliobox.me/</a> <br></p><h2>Taras Yuskiv</h2><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/346/posts/21455/image/taras-yuskiv-selfie.jpg"></figure><p>I'm
 UI/UX designer. This is one of my works but you can also find more here:<br> <a href="http://www.pinterest.com/frankensheep/pins/" rel="nofollow">http://www.pinterest.com/frankensheep/pins/</a>&nbsp; When I have a free time I'm always drawing some illustrations. <br></p><h2>Charlie Knott</h2>
<figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/346/posts/21455/image/charlie-knott-selfie.jpg"></figure><p>Here is my selfie. I made it using a vector-bitmap technique that I learned at my high school. I am a high school student at an arts magnet high school, learning both digital illustration and film-making. Enjoy my selfie, titled "When The Rain Clears". DeviantArt -  <a href="http://cdak.deviantart.com/" rel="nofollow">http://cdak.deviantart.com/</a></p><div>

<h2>Matthew Njuguna<br></h2><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/346/posts/21455/image/matthew-njuguna-selfie.jpg"></figure><p>I am a Nairobi based designer, front end developer and photographer 
who loves coffee and loads of that. I created this selfie three years 
ago when I was still in design school and I still have it as my computer
 screen saver. <a href="http://www.matthewnjuguna.com/" rel="nofollow">http://www.matthewnjuguna.com/</a> is where you can find my work</p><h2>Kimmie R. Draper</h2><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/346/posts/21455/image/kimmie-r-draper-selfie.jpg"></figure><p>Hi everyone! I am just starting to learn Illustrator. Newbie! Any advice or recommendations for a tutorial..would be greatly appreciated.</p><h2>Kevin Fellows</h2><div>

<figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/346/posts/21455/image/kevin-fellows-selfie.jpg"></figure><p>Hello everyone! I'm Kevin Fellows. I am many things, I freelance 
design, Illustrator, cook, power lift/body build, and obsess over Zelda,
 and video games in general. One day I hope to fulfill my dreams as a 
video game designer/illustrator. I like to refer to myself as a child of
 the stars, which is the purpose of my selfie that I made awhile back. 
It's all done Photoshop, which is rare for me because I use Illustrator 
the most. Check out some of my other work! <a href="https://www.behance.net/kafellows">https://www.behance.net/kafellows</a></p><h2>Elmano Silva</h2><div>

<figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/346/posts/21455/image/elmano-silva-selfie.jpg"></figure><p>Hi, my name is Elmano Silva, I'm 22 years old and I'm currently in 
Madeira's University for my last year in the Interactive Media Design Course. I
 started drawing when I was 16/17, but only took it seriously about 3 
years ago. My goal is to be a mangaka and also game designer, creating 
nice stories and games and to entertain lots of people with my artwork. 
I've started with traditional drawings and gradually entered the digital
 world with Photoshop and my trusty Wacom Bamboo Tablet, but since last autumn I've moved on to Manga Studio.</p><p>If you wanna see more of my stuff, I have some other artworks from when I started until now, on DeviantArt: <a href="http://eldiogo.deviantart.com/" rel="nofollow">http://eldiogo.deviantart.com/</a> Twitter: <a href="https://twitter.com/ElDiogo09" rel="nofollow">https://twitter.com/ElDiogo09</a></p>

</div><h2>Snoopy Pham<br></h2><div>

<figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/346/posts/21455/image/snoopy-pham-selfie.jpg"></figure><p>Here's my selfie. I'm a UI designer, branding design, game design, and sometimes I'm a street life photographer. If you guys like it check out my work. Graphic design: <a href="http://snoopypham.tumblr.com" rel="nofollow">http://snoopypham.tumblr.com </a>Photography: <a href="https://www.flickr.com/photos/9601186@N08/">https://www.flickr.com/photos/9601186@N08/</a></p><h2>Alifa Saidi<br></h2><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/346/posts/21455/image/alifa-saidi-selfie.jpg"></figure><p>Hello ladies and gentlemen, my name is Alifa Saidi and I am an engineering student. I use illustrator as a hobby and have made a number of vectors with it :). Here is my selfie made with Illustrator. The background and splatters I made them with Photoshop :)</p><h2>Mike Lally<br></h2><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/346/posts/21455/image/mike-lally-selfie.jpg"></figure><p>Sometimes I sit and think . . .  and sometimes I just sit!</p>

<h2>Shernard Blake</h2><p><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/346/posts/21455/image/shernard-blake-selfie.jpg"></p><p>Graduated from Palm Beach State in Graphic Design. Website:<a href="http://tsoul98.deviantart.com/" rel="nofollow">http://tsoul98.deviantart.com/ </a></p><h2>Arjun Lama</h2><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/346/posts/21455/image/arjun-luma-selfie.jpg"></figure><p>Hello!! I did this one a few months back at the office when there was no one around.I took the photo of myself by setting the timer on the camera, gave a spiderman pose and 
manipulated it from Photoshop. I'm from Nepal and currently working in a
manufacturing company of handcrafted goods. Everybody calls me Arjun &amp;
 Graphic Design is my hobby. Check some of my work at <a href="http://adesignerarjun.wordpress.com/work-gallery/">http://adesignerarjun.wordpress.com/work-gallery/</a><br></p><h2>Hey, Where's My Entry?<br></h2><p>Don't worry! This is only part one of our showcase for the Creative Selfie Community Project. We've extended our deadline to allow for more submissions so take advantage of this great opportunity to meet other artists and get featured on Tuts+! Stay tuned for part two in July where you'll see your entry featured and more!<br></p><h2>Get Inspired</h2><p>In the meantime, feel free to check out these tutorials for more creative selfie inspiration!</p><ul><li><a href="http://courses.tutsplus.com/courses/vector-portraits-for-beginners" target="_self">Vector Portraits for Beginners</a></li><li><a href="http://courses.tutsplus.com/courses/advanced-vector-portraits" target="_self">Advanced Vector Portraits</a></li><li><a href="http://design.tutsplus.com/tutorials/illustrate-a-dramatic-feather-infused-portrait-in-adobe-photoshop--cms-20996" target="_self">Illustrate a Dramatic Feather-Infused Portrait in Adobe Photoshop</a><br></li><li><a href="http://design.tutsplus.com/tutorials/how-to-use-pixelmators-liquify-tools-to-make-an-eye-popping-portrait--cms-20585" target="_self">How to Use Pixelmator's Liquify Tools to Make an Eye Popping Portrait</a></li><li><a href="http://design.tutsplus.com/tutorials/how-to-create-a-self-portrait-in-a-geometric-style--vector-5992" target="_self">How to Create a Self-Portrait in a Geometric Style</a></li><li><a href="http://design.tutsplus.com/tutorials/use-retouching-techniques-to-create-a-caricature-from-a-photo--psd-30418" target="_self">Use Retouching Techniques to Create a Caricature From a Photo</a><br></li><li><a href="http://design.tutsplus.com/articles/the-differences-between-male-and-female-portraits--vector-14954" target="_self">The Differences Between Male and Female Portraits</a></li></ul></div></div></div><br><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21455/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21455/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21455/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21455/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T12:21:49.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T12:21:49.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:13:"Melody Nieves";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:8;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21183";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:109:"http://computers.tutsplus.com/tutorials/use-a-mac-to-monitor-website-uptime-or-other-regular-tasks--cms-21183";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:58:"Use a Mac to Monitor Website Uptime or Other Regular Tasks";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:13073:"<p>Time flies by no matter what you do. Using some automation techniques, you can get time to work for you. In this tutorial, I'll show you how to use two programs to run activities based on time: <strong><a href="http://www.packal.org/workflow/alfred-cron" rel="external" target="_blank">Alfred Cron workflow</a></strong> and <strong><a href="http://actproductions.net/clockwise/" rel="external" target="_blank">Clockwise</a></strong>.&nbsp;</p><p>In order to see how these programs work, I will automate the checking of your web site's status.<br></p>

<h2>Installing the Programs</h2>

<p><strong><a href="http://actproductions.net/clockwise/" rel="external" target="_blank">Clockwise</a></strong> is available in the <a href="http://www.apple.com/osx/apps/app-store.html" rel="external" target="_blank"><b>Mac App Store</b></a>. It is really easy to use and makes the creation and editing of timed tasks really easy. <strong>Clockwise</strong> makes use of AppleScript and shell scripts to extend functionality.&nbsp;</p><p>If you are not up to speed on AppleScript, please check out the tutorial <a href="http://computers.tutsplus.com/tutorials/the-ultimate-beginners-guide-to-applescript--mac-3436" rel="external" target="_blank"><i>The Ultimate Beginners Guide to AppleScript</i></a>. I will be writing the script in Ruby. If you want to learn more about Ruby, check <a href="http://code.tutsplus.com/series/ruby-for-newbies--net-18166" rel="external" target="_blank"><i>out this series on Net Tuts+</i></a>.</p>

<p>In order to use <strong>Afred Cron</strong> by Shawn Patrick Rice, you have to have <strong><a href="http://www.alfredapp.com/" rel="external" target="_blank">Alfred version 2.3</a></strong> and a <strong>Powerpack license</strong>. You can download <strong><a href="http://www.packal.org/workflow/alfred-cron" rel="external" target="_blank">Alfred Cron from Packal</a></strong>. When it is downloaded, double click on the workflow and <strong>Alfred</strong> will install it for you.&nbsp;</p><p>If you're interested in workflow development for <strong>Alfred</strong>, you might want to check out these tutorials: Alfred for <a href="https://computers.tutsplus.com/tutorials/alfred-workflows-for-beginners--mac-55446" rel="external" target="_blank"><i>Beginners</i></a><i>, </i><a href="https://computers.tutsplus.com/tutorials/alfred-workflows-for-intermediates--mac-60557" rel="external" target="_blank"><i>Intermediates</i></a><i>, </i><a href="https://computers.tutsplus.com/tutorials/alfred-workflows-for-advanced--mac-60963" rel="external" target="_blank"><i>Advanced</i></a>, and <a href="http://computers.tutsplus.com/tutorials/alfred-debugging--cms-20439" rel="external" target="_blank"><i>Alfred Debugging</i></a>.</p>

<h2>Website Monitoring</h2>

<p>If you own a web site, you will want to make sure it’s up all the time. There are for pay services that you could use, but not every blog merits a paid service just to monitor it. That’s where doing your own monitoring can help.</p>

<p>The easiest way to check for a site is with this simple Ruby script:</p>

<pre class="brush: ruby">#!/&lt;your ruby installation location&gt;/bin/ruby

#
# Include libraries used.
#
require 'open-uri'

#
# Data Storage files defined. These files contain
# a single number for quick processing.
#
countFile = "/&lt;your data file location&gt;/siteCount.txt"
UpcountFile = "/&lt;your data file location&gt;/UpCount.txt"

#
# Get the raw number of counts and increment it.
#
count = IO.readlines(countFile)[0]
count = 1 + count.to_i
IO.write(countFile,count)

#
# Get the number of the site being live count and
# increment it if and only if it is currently alive!
#
upcount = IO.readlines(UpcountFile)[0]

#
# The exception handling tells if the site is alive. If the
# site is not reachable, the "open" to read the site will
# throw an exception.
#
begin
	source = open("&lt;your web site address&gt;").read
	puts "Up"
	upcount = 1 + upcount.to_i
	rescue
		puts "Not up"
end

#
# Write the Upcount to the file.
#
IO.write(UpcountFile,upcount)

#
# If the upcount lags behind too much, say that the site is down.
#
if (count - upcount) &gt; 10 then
	`/usr/bin/osascript -e 'display notification "Site is Down!"'`
end
</pre>

<p>Save this to the file name <strong>checkWeb.sh</strong> in the home directory.&nbsp;</p><p>This script simply increments a number in a data file for the number of times it has run and the number of times the site was alive.&nbsp;</p><p>You just need to change <strong>&lt;your ruby installation location&gt;</strong> to the location of <strong>Ruby</strong> on your system. The default location for most Macs is the&nbsp;<code class="inline">usr</code>directory. To see where Ruby is, you can type this in the <b>Terminal</b>.</p>

<pre class="brush: bash">which ruby
</pre>

<p>Copy the path this gives into the file.</p>

<p>You'll also need to change the <strong>&lt;your data file location&gt;</strong> to a directory of your choice, and <strong>&lt;your web site address&gt;</strong> to the web address of the site you wish to check.&nbsp;</p><p>I created a directory in my home directory called <strong>data</strong> for the data files. Now, open a terminal to your home directory and type:</p>

<pre class="brush: bash">./checkWeb.sh
</pre>

<p>You should get an output of&nbsp;<b>Up</b> if your site is up. The script will also increase the counts in the data files.&nbsp;</p><p>If the up count lags behind the total number of counts by ten, the user gets a system notification. Unfortunately, this approach is manual since you have to launch it by hand. To be useful, this needs to automatically run every ten minutes or so.</p>

<h2>Clockwise</h2>

<p>The <strong>Clockwise</strong> application makes the creation of timed events very easy to do. Once you have it on the system, it sits in the menubar area.</p>

<figure class="post_image">
<img alt="Clockwise" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/71/posts/21183/image/TamingTime-01.jpg">
<figcaption>Clockwise</figcaption></figure>



<p>When you click on it’s hourglass icon, it shows you all of the timed events you have with it’s next trigger time. To create a new trigger, select the <strong>+</strong> at the bottom left corner. You can name it <strong>Site Check Timer</strong>.</p>

<figure class="post_image">
<img alt="Creating Site Check Timer Timer Configuration" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/71/posts/21183/image/TamingTime-02.jpg">
<figcaption>Creating Site Check Timer: Timer Configuration</figcaption></figure>



<p>Set the <strong>Timer</strong> to trigger every 10 minutes with the <strong>Run Forever</strong> option selected. Click the right pointed arrow in a circle under the clock on the left.</p>

<figure class="post_image">
<img alt="Creating Site Check Timer Actions Assignment" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/71/posts/21183/image/TamingTime-03.jpg">
<figcaption>Creating Site Check Timer: Actions Assignment</figcaption></figure>



<p>This is the <strong>Actions for this event</strong> area. Click the <strong>+</strong> in the bottom right corner to add a new <strong>Action</strong>. Clicking the top bar gives a full list of possible actions.</p>

<figure class="post_image">
<img alt="Creating Site Check Timer Setting User Script" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/71/posts/21183/image/TamingTime-04.jpg">
<figcaption>Creating Site Check Timer: Setting User Script</figcaption></figure>



<p>You can set up many types of actions here. Each event can run any number of actions. The one you want is <strong>Run user script</strong>.</p>

<figure class="post_image">
<img alt="Creating Site Check Timer Opening Script Folder" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/71/posts/21183/image/TamingTime-05.jpg">
<figcaption>Creating Site Check Timer: Opening Script Folder</figcaption></figure>



<p>In the <b>Available scripts</b> area, you will see a list of every script that <b>Clockwise</b> can run. You need to add a new script.&nbsp;</p><p>Therefore, click on the <strong>i</strong> in a circle to open the dialog for the <strong>Open folder</strong> option.</p>

<figure class="post_image">
<img alt="Creating Site Check Timer Copying the Script" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/71/posts/21183/image/TamingTime-06.jpg">
<figcaption>Creating Site Check Timer: Copying the Script</figcaption></figure>



<p>This will open a <strong>Finder</strong> window in the directory for scripts. Since <strong>Clockwise</strong> is a sandboxed application, it can only run scripts in this one directory.&nbsp;</p><p>Copy the script for checking the web site to this directory.</p>

<figure class="post_image">
<img alt="Creating Site Check Timer Setting the Script" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/71/posts/21183/image/TamingTime-07.jpg">
<figcaption>Creating Site Check Timer: Setting the Script</figcaption></figure>



<p>Select the script in the <strong>Available scripts</strong> dialog. Select the <strong>check mark</strong> at the top right of the dialog.</p>

<figure class="post_image">
<img alt="Creating Site Check Timer Finishing the Timer" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/71/posts/21183/image/TamingTime-08.jpg">
<figcaption>Creating Site Check Timer: Finishing the Timer</figcaption></figure>



<p>You will then see the <strong>Actions for this event</strong> with the script selected to run.&nbsp;</p><p>Click on the <strong>check mark</strong> at the top right of the dialog again.</p>

<figure class="post_image">
<img alt="Site Check Timer Running" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/71/posts/21183/image/TamingTime-01.jpg">
<figcaption>Site Check Timer Running</figcaption></figure>



<p>You will now see all of your timer events with the time till they will trigger. The <strong>Site Check Timer</strong> will trigger in <b>4 minutes and 50 seconds</b>.</p>

<p>When that time has elapsed, you will see the data files have the count numbers increased in them. The <strong>UpCount.txt</strong> file will only increase if the site checked was reachable. If the up count lags behind by more than ten counts, you will get a notification every ten minutes until you reset the count files.&nbsp;</p><p>You have just mastered time using <strong>Clockwise</strong>.</p>

<h2>Alfred Cron</h2>

<p>You might already have <strong>Alfred</strong> and you do not want to buy another program. You can do the same thing with <strong><a href="http://www.packal.org/workflow/alfred-cron" rel="external" target="_blank">Alfred Cron</a></strong>. Once you install the workflow, type <b>cron</b> in the <strong>Alfred Prompt</strong>.</p>

<figure class="post_image">
<img alt="Alfred Cron" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/71/posts/21183/image/TamingTime-09.jpg">
<figcaption>Alfred Cron</figcaption></figure>



<p>First, you need to select <strong>Add a Cron Entry</strong> to create a new cron job. <b>Cron</b> is a timer that is a part of any unix style system.&nbsp;</p><p>On the Mac, it is really controlled by <strong>launchd</strong> agent. It is what <strong>Clockwise</strong> makes use of also, just a little more transparently. <strong>Alfred Cron</strong> just gives a nice frontend to the background launchd daemon.</p>

<figure class="post_image">
<img alt="Adding a Cron Job" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/71/posts/21183/image/TamingTime-10.jpg">
<figcaption>Adding a Cron Job</figcaption></figure>



<p>Set up the new job just as you see here, <strong>Label</strong> is <strong>Site Checker Timer</strong>, <strong>Execution Interval</strong> is 600 seconds, and the script is the same as before. You now have new way to check your web site.</p>

<p>The jobs with <strong>Alfred Cron</strong> only allow you to set a delay time between triggering events, while <strong>Clockwise</strong> gives you many more options. It all depends on what your needs are as to which one is the best.</p>

<h2>Conclusion</h2>

<p>Now that you have tools to manage tasks on a time table, go and master them.&nbsp;</p><p>Experimenting with different tasks is a lot of fun. For an exercise, make the counting script an Alfred workflow accessed by a timer using the <strong>External Trigger</strong> block. That’s an easy modification that’s easy to maintain.</p><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21183/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21183/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21183/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21183/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T12:00:00.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T12:00:00.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:12:"Richard Guay";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:9;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21399";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:95:"http://webdesign.tutsplus.com/articles/quick-tip-set-relative-urls-with-the-base-tag--cms-21399";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:52:"Quick Tip: Set Relative URLs With the “Base” Tag";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:6680:"<p>The <code>&lt;base&gt;</code> tag in HTML is a relatively little known element, having&nbsp;become a fully fledged <a href="http://www.w3.org/TR/html5/document-metadata#the-base-element" target="_self">part of HTML5</a> quite recently. It enables you to do two things:</p>
<ol>
<li>Set any URL you choose as the base for all relative URLs.</li>
<li>Set default link targets.</li>
</ol>
<h2>The Base-ics</h2>
<p>The <code>&lt;base&gt;</code> element is defined in the <code>&lt;head&gt;</code> section&nbsp;and you can only use it&nbsp;once per document. You should place it as early as possible in&nbsp;your head section so you can use it from that point on. Its two possible attributes are <code>href</code> and <code>target</code>. You can use either of these&nbsp;attributes alone or both at once.</p>
<h3>Example 1: Asset Loading Shortcut</h3>
<p>Let's say you have a site which stores all its images and CSS in a folder named "assets". You might define your <code>&lt;base&gt;</code> tag like so:</p>
<pre class="brush: html">&lt;head&gt;
    &lt;base href="http://www.myepicsite.com/assets/"&gt;
&lt;/head&gt;</pre>
<p>This would then allow you to load in any images or CSS like this:</p>
<pre class="brush: html">&lt;head&gt;
    &lt;base href="http://www.myepicsite.com/assets/"&gt;
    &lt;link rel="stylesheet" href="style.css"&gt;
&lt;/head&gt;
&lt;body&gt;
    &lt;img src="image01.png" /&gt;
&lt;/body&gt;</pre>
<p>The link to <code>style.css</code> would resolve to <code>http://www.myepicsite.com/assets/style.css</code> and <code>image01.png</code> would load from <code>http://www.myepicsite.com/assets/image01.png</code>.</p>
<h3>Example 2: Internal Page URLs</h3>
<p>What if you have a top level domain which redirects to something&nbsp;like <code>http://thisrocks.com/app/</code>&nbsp;and all&nbsp;internal links need to include&nbsp;<code class="inline">app/</code> in their URLs.</p><p>You might set your base URL like this:</p>
<pre class="brush: html">&lt;base href="http://thisrocks.com/app/"&gt;</pre>
<p>From there whenever you wanted to link from one internal page to another you could simply use:</p>
<pre class="brush: html">&lt;a href="anotherpage.htm"&gt;LINK&lt;/a&gt; </pre>
<p>This link would resolve&nbsp;to <code>http://thisrocks.com/app/anotherpage.htm</code>.</p>
<h3>Example 3: Default Link Target</h3>
<p>You can also use <code>&lt;base&gt;</code> to set the default target for all links on your page. If you were to use:</p>
<pre class="brush: html"> &lt;base target="_blank"&gt; </pre>
<p>...any link that didn't explicitly set its own target would open in a new window. You can use the <code class="inline">target</code> attribute with or without an accompanying&nbsp;<code class="inline">href</code> attribute.</p>
<p>This functionality could potentially be useful for content loaded in via an iFrame, as you would be able to automatically have all links therein targeted to the parent frame.</p>
<h2>Drawbacks</h2>
<p>While the <code>&lt;base&gt;</code> url can be handy, its drawbacks center around the fact that after defining it once you're stuck with it. You can only use it in a single way and it will then affect all URLs. Wherever you don't want to use the defaults set in your <code>&lt;base&gt;</code> tag you have to specifically override them.</p>
<p>Should you use it to resolve to your <code>assets</code> folder as we did above, and you later wanted to link from one page of your site to another, you couldn't do so with the common HTML of <code>&lt;a href="page.html"&gt;Page&lt;/a&gt;</code>.&nbsp;</p><p>This is because with the base URL being <code>http://www.myepicsite.com/assets/</code> your visitors would be sent to <code>http://www.myepicsite.com/assets/page.html</code>. </p>
<p>As such you would have to override your <code>&lt;base&gt;</code> tag settings by using the absolute URL instead, i.e. <code>&lt;a href="http://www.myepicsite.com/page.html"&gt;Page&lt;/a&gt;</code>.</p>
<h3>In-Page Anchors</h3><p>When using <code>&lt;base&gt;</code> you can also run into problems linking to in-page anchors. </p>
<p>Normally, a link such as <code>&lt;a href="#top"&gt;Back to Top&lt;/a&gt;</code> would keep you on the same page but skip to the location of an element bearing <code>id="top"</code>, e.g. it would resolve to <code>http://thisrocks.com/app/article.html#top</code>. </p>
<p>However if you're using a <code>&lt;base&gt;</code> tag with an <code>href</code> attribute you'd instead be sent to the base URL with <code>#top</code> appended to the end, e.g. <code>http://thisrocks.com/app/#top</code>.</p>
<p>Again, in this case you'd have to override the defaults set in your <code class="inline">&lt;base&gt;</code> tag by specifying the page you want your link to be relative to, e.g. <code class="inline">&lt;a href="article.html#top"&gt;Back to Top&lt;/a&gt;</code>.<br></p><h2>Where &lt;base&gt; Works Best</h2>
<p>The <code>&lt;base&gt;</code> tag is best used in a scenario where you know you'll be able to exert complete control over the use of all URLs, i.e. you know you'll be able to override the defaults as required. If you're creating a theme for a CMS where there are many unknown variables it's probably a good idea to leave <code>&lt;base&gt;</code> out of the mix. </p>
<p>However, if you're building a static HTML site <code>&lt;base&gt;</code> can be very helpful. This is the case even more so if you're using a templating language such as Jade or Handlebars that will let you place shortcuts like <code>&lt;a href="{url}#top"&gt;Back to Top&lt;/a&gt;</code>, so if you need to override default settings it's still quick and easy.</p>
<p>If you have a good idea what your project's content will be, and its use of URLs and links is fully under your control, you might find the <code>&lt;base&gt;</code> tag saves you a lot of time.</p><p>Read more about <code class="inline">&lt;base&gt;</code> at the W3C wiki and HTML5 spec:</p><ul><li><a href="http://www.w3.org/wiki/HTML/Elements/base">http://www.w3.org/wiki/HTML/Elements/base</a></li><li><a href="http://www.w3.org/TR/html5/document-metadata.html#the-base-element">http://www.w3.org/TR/html5/document-metadata.html#the-base-element</a></li></ul><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21399/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21399/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21399/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21399/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T10:06:34.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T10:06:34.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:11:"Kezz Bracey";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:10;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21449";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:67:"http://cgi.tutsplus.com/articles/the-art-of-the-showreel--cms-21449";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:23:"The Art of the Showreel";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:18440:"<p>Your showreel is one of the most important things you have as an upcoming artist. It’s often seen before you are, so you need it to give the best representation of you that you can. For a fair few artists little thought is put into their showreel, as it seems simple compared to the art in which it contains.</p><p>This is true, everyone can put together clips and breakdowns in Premiere and add text to a start and end card. However why not tailor every attribute of your showreel to get you the job. Think of your showreel as an advert for you. Every part of an advert is aimed at getting you to buy the product, from the upbeat music to the flow of shots, this is how you need to think. Everything in your showreel needs to have been done to sell yourself. This subtle attention to detail can help differentiate two artists whose level of work is the same.</p><iframe src="//player.vimeo.com/video/66001741" frameborder="0" height="338" width="600"></iframe> <p><a href="http://vimeo.com/66001741">VFX Compositing &amp; Roto/Prep Summer Reel 2013</a> from <a href="http://vimeo.com/joshparks">Josh Parks</a></p><h2>What I've learnt working in the industry</h2><h3>Employers only have your showreel to build up a picture of what you are like as a person.</h3><p>The look of your title card, &nbsp;spelling, music used, what your email address is eg. <i>Coolguy56@hotmail.com </i>(not professional), colours used, order of shots, as the first and last shots are generally your best pieces, why does the artist think these are their best pieces?</p><p>These all contribute to the picture that is built of you, so you need to be aware of this when creating your showreel. As well as being aware of the picture that you are trying to convey of yourself. Something else to bare in mind is that due to the busy nature of the vfx industry there's often no time to watch a showreel more than once.</p><h3>Know where your skills stand compared to other artists and learn from their mistakes</h3><p>It is massively important to know where you stand in the vast talent pool of artists. If you know that you stand near the top end of work that you've seen, then you'll be more confident giving a day rate that is closer to what you want, however get this wrong and you can be undercut by another artist. This also allows you to judge your realistic chances of getting a job.</p><p>Constantly watch showreels at different skill levels of both artists and companies. Really analyse what pieces work well, what doesn't, and whether the editing/timing of shots work? Be aware that other artists will be doing the same to you. Knowing your worth is an important part of being an artist that comes with experience, it can be hard to not be biased towards your own work so you need to really be honest with yourself, as this will help you improve quicker.</p><h3>Music on Showreels</h3><p>My personal preference is to have music on my showreels. My reasoning is that it gives you something to edit to and if done well, gives a nice flow to your showreel. Even with the accompanying sound turned off, the showreel will still flow and have a nice natural pace to it, which will give the showreel a more professional feel.</p><p>Another reason for using music to accompany your work is that you want your showreel to be a completely rounded piece. &nbsp;You wouldn't see an advert without music that has been added to enhance the products appeal, your reel is no different to this. Its an advert that sells you, the product. Music has the potential to enhance the feeling someone gets towards a piece of work, however it can also have the opposite effect. I've seen this first hand at companies before, in which full screamo has been used to accompany an artists work. This results in the showreel instantly being turned off.</p><p>If you choose to accompany your work with music, an easy way of editing to it it is by using beat markers. Here's how to create them in Adobe Premiere<br></p><h2>Beat Markers<br></h2><h3>Step 1</h3><p>First import your music into Premiere, by <b>Right</b> <b>Clicking</b> in the left hand side.<br></p><figure class="post_image"><img src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/36/posts/21449/image/Cgtuts-Showreel-Article-1.jpg" alt=""></figure><h3>Step 2</h3><p>Now to get our audio into our timeline, click and drag it down to the audio section.<br></p><figure class="post_image"><img src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/36/posts/21449/image/Cgtuts-Showreel-Article-2.jpg" alt=""></figure><h3>Step 3</h3><p>To lay down our editing beat markers we can play through our audio and hit the <b>*</b> key on the num pad. So it’s just a case of listening through and tapping the <b>* </b>key to the beat of the song.<br></p><figure class="post_image"><img src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/36/posts/21449/image/Cgtuts-Showreel-Article-3.jpg" alt=""></figure><h3>Step 4</h3><p>Once your beat markers are laid down, your imported video can be snapped to the markers.<br></p><figure class="post_image"><img src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/36/posts/21449/image/Cgtuts-Showreel_Article-4.jpg" alt=""></figure><h2>Be Nosey</h2><p>As suggested above, watching other artists showreels is useful to see how the artists who are getting hired are presenting their work. It is also useful in the fact that it may introduce you to a new technique or way of tackling a problem (breakdowns with brief descriptions are best for this). If you do spot something that you couldn't create, find out how it was done, as this is something that another artist is offering, that you aren’t. &nbsp;</p><p>First do all the Googling you can until you hit a wall, then email the artist. Not only will this introduce you to a new technique improving your skill, but it also doubles up as an excuse to network. You now have a valid reason to email an artist as another artist, which differentiates you from the other upcoming artists who email asking whether they can be given a job. This shows that you are professional in your thinking and working. Again this builds towards the image that people will have of you</p><h2>Q &amp; A with Some of the Industry's Best<br></h2><iframe src="//player.vimeo.com/video/80989764" frameborder="0" height="256" width="600"></iframe> <p><a href="http://vimeo.com/80989764">MPC Film Reel 2014</a> from <a href="http://vimeo.com/mpcvfx">MPC</a></p><p>Showreels are a very subjective entity. In order to give you a rounded view of the area, I put some of the questions that had been put forward to me, to some high up artists at MPC and a lecturer at one of the best VFX/Game Art universities. These are the people within the company who have the final decision on whether you get the job within their department. Below are their answers.</p><p><b>MPC are currently hiring at all their studios. You can find all the info here: </b><b><a href="http://www.moving-picture.com/join-us/">http://www.moving-picture.com/join-us/</a></b></p><h3>Doug Larmour</h3><p><i>MPC Compositing Global HOD</i></p><p class="question">Is a showreel with two pieces in it too short?<br></p><p>Not if you have nothing else you are proud of. Ideally you will show about two mins worth of your best material, but if you only have two pieces which are good, don't flesh it out with bad stuff.<br></p><p class="question">What's too long for a showreel?</p><p>I won't watch for longer than 4 minutes, so don't put your best shot at the end, stick it right at the front.<br></p><p class="question">Do you want to see render passes or is it all about the final outcome?<br></p><p>From a comp point of view, I want to see the final output and ideally the original plate - and a couple of layers in between isn't awful, but if you don't have access to those, then the final output on its own will do. We're fairly good at recognising what you've done.<br></p><p class="question">What's the most common mistake you feel that artists make with showreels?<br></p><p>They don't specialise it enough. At a place like MPC we need people to be 100% focused on one area, so as we can get the best out of it. So when hiring a comper, I have no need to see how well you model, so tailor make the showreel to the job you are going for. Don't send a generalist showreel for a comp specific job. Also - don't show work which you think is bad on your showreel just to show that you are able to do something. Putting something on your showreel is stating that you think it's good or the best you can do, so make sure it is.<br></p><p class="question">Do you watch showreels on mute?<br></p><p>Always - we don't do sound. The visuals have to stand on their own.<br></p><p class="question">When hiring how much is down to the showreel and how much is down to the interview in whether an artist gets the job?<br></p><p>Its the whole combination. If you have a great showreel but then can't back it up in an interview, then I am left asking how much of the showreel was your work. Similarly if you do a great interview but your showreel doesn't show me anything of what you have said, then it looks like you talk a good game but don't necessarily back that up with actions (it might show that you are a little lazy) - so the awful truth is that if you want a job you have to have both, a good showreel and do a good interview too. It isn't easy.</p><h3>David Mayhew</h3><p><i>MPC Groom Global HOD</i></p><p class="question">Is a showreel with two pieces in it too short?<br></p><p>Not at all. I would rather see a nice polished single project done really well than two average pieces.<br></p><p class="question">What's too long for a showreel?<br></p><p>Generally 2 minutes maximum for Mr. Again just focus on the best bits related to the role you are applying for. That way it looks like you are really keen on that particular aspect of vfx.<br></p><p class="question">Do you want to see render passes or is it all about the final outcome?<br></p><p>More important forbade lighting/gesturing compositing role. For a groom role, I like to see turntables as well as final shots. It's important to clearly state which aspects of the shot you have worked on if it was a large group project.<br></p><p class="question">Whats the most common mistake you feel that artists make with showreels?<br></p><p>Adding to much substandard work. Putting on lots of final shots and not stating which parts of the shot they were responsible for.<br></p><p class="question">Do you watch showreels on mute?</p><p>Occasionally, yes.</p><p class="question">When hiring how much is down to the showreel and how much is down to the interview in whether an artist gets the job?</p><p>The showreel is important. Only if I see potential on the reel will I request an interview</p><h3>Benjamin Bratt</h3><p><i>Roto-Prep Lead at MPC</i></p><ul><li><i><b>Author of:&nbsp;</b></i><i><a target="_blank" rel="external" href="http://www.amazon.co.uk/Rotoscoping-Techniques-Tools-Aspiring-Artist/dp/0240817044"><b>Rotoscoping Techniques and Tools for the Aspiring Artist</b></a></i></li><li><i><b>Twitter: </b></i><a target="_blank" rel="external" href="https://twitter.com/bbratt"><i><b>@bbratt</b></i></a></li></ul><p class="question">Is a showreel with two pieces in it too short?</p><p>The number of shots isn't really the focus of a demo reel. If you've only got a couple shots that you're confident enough to put on your reel, make sure those shots are kick ass enough to get you noticed. You don't want to clutter up your reel with filler, just so you've got a couple extra seconds tacked on. Mediocre shots will detract from your stronger shots. Also, if you've only got a couple of shots, it will give you a chance to create an in-depth break down (assuming you've got all the layers/before/after components) to showcase how much work was done to the shot.</p><p class="question">What's too long for a showreel?</p><p>3-4 minutes would be pushing it. Streamline your reel so we see the good stuff right away</p><p class="question">Do you want to see render passes or is it all about the final outcome?</p><p>Breakdowns are a huge plus. Half the things we do are invisible, and even if your included a written breakdown saying "removed thing X", it isn't as impressive as seeing that thing disappear from the plate.</p><p class="question">What's the most common mistake you feel that artists make with showreels?</p><p>I've noticed that artists can sometimes become too attached to particular shots. They've taken it from start to finish, reworked all the major and minor details, and are intimately aware of every half pixel problem. After putting so much of your heart into something, it's hard to separate yourself from an objective viewpoint. I'd say the most common mistake is not getting enough objective, outside feedback. Put your reel in front of knowledgeable people that don't know you and have no idea about what went into the shot. And when these relative strangers give you their feedback, listen to them; take in what they say and try see their point. &nbsp;A fresh set of eyes might hurt, initially, but the end result will be greater.</p><p class="question">Do you watch showreels on mute?</p><p>Yup.</p><p class="question">When hiring how much is down to the showreel and how much is down to the interview in whether an artist gets the job?</p><p>50-50 with a +/- variable of 18. &nbsp;If an artist has a spectacular showreel, but isn't the best when it comes to the social/communication aspects of our job, the viability of that artist in the workplace has dropped a bit. On the other side, if a showreel is average, a positive attitude and willingness to engage during the interview process will absolutely increase the chances of a call back. Also, know the difference between appropriately knowledgeable and obscenely over confident. If you don't know something, express a willingness to learn it.</p><h3>Richard Baillie</h3><p><i>Roto-Prep Global HOD</i></p><p class="question">What's too long for a showreel?</p><p>You want a showreel of about 2-5 minutes (and 5 minutes is probably pushing it) keep it relevant and varied.</p><p class="question">Do you want to see render passes or is it all about the final outcome?</p><p>For roto/prep we don't really have render passes. It's always nice to see the plate before prep and after, and then the comp. If you can put in alpha mattes that's always nice. If you can only put the comp on make sure you know exactly what you did in the shot and make sure you can talk about what you did, and how you did it, if asked in the interview.</p><p class="question">What's the most common mistake you feel that artists make with showreels?</p><p>Rushing through the passes leading up to the comp. If you've included them, allow the viewer to see them. Also as I see a lot of showreels straight out of uni, I see a lot of stock footage used in the same way. Try and make it stand out somehow from your classmates.</p><p class="question">Do you watch showreels on mute?</p><p>Yes.</p><p class="question">When hiring how much is down to the showreel and how much is down to the interview in whether an artist gets the job?</p><p>The showreel gives a good indication of the final products that someone can make. But only the interview gives an indication of their thought processes and them as a person.</p><p>A showreel won't show how long something took to make. It gives a good basis to conduct the interview on, it gives a reference point if I want to talk about the shot. I would consider an interview because a showreel is average or outstanding. A great interview will save a mediocre showreel, but an outstanding showreel will not fix a dreadful interview. The interview will give me some idea of what that person will be like on a day to day basis and with other people.</p><h3>Mark Walman</h3><p><i>Lecturer at the </i><a target="_blank" rel="external" href="http://uhanimation.co.uk/"><i>University of Hertfordshire</i></a></p><p class="question">Is a showreel with two pieces in it too short ?</p><p>If a showreel had just one piece of work in it, but the work was amazing, that would be enough. It is always quality over quantity.</p><p class="question">Do you want to see render passes or is it all about the final outcome?</p><p>Seeing render passes is very useful. &nbsp;As deadlines get smaller and smaller for commercial projects the ability to alter things after render is a must. &nbsp;As well as the usual passes (reflection/spec/occl) it is good to see relighting passes/ lots of layers for dust. If your film has dust in it they are sometimes used.</p><p class="question">Do you watch showreels on mute?</p><p>Yes, unless there is a lip sync in there.</p><p class="question">What's the most common mistake you feel artists make with showreels?</p><p>Adding old/bad pieces of work to show "how much they have progressed". Also make it very clear what parts of the shot you worked on. Adding subtitles can be useful.</p><p class="question">When new students apply how much is down to the showreel and how much is down to the interview in whether and artist gets the job?</p><p>A good showreel is your foot in the door. When I have done interviews, it is to find out a bit more about the person, what their passions are, are they going to play well within the team, etc.</p><h4>Related Links:</h4><ul><li><a target="_blank" rel="external" href="http://www.moving-picture.com/">MPC</a>&nbsp;</li><li><a rel="me" href="http://joshparks.co.uk/">joshparks.co.uk/</a><br></li><li><a target="_blank" rel="external" href="http://www.amazon.co.uk/Rotoscoping-Techniques-Tools-Aspiring-Artist/dp/0240817044">Rotoscoping Techniques and Tools for the Aspiring Artist</a>&nbsp;-&nbsp;<i>Benjamin Bratt&nbsp;</i></li><li><a target="_blank" rel="external" href="http://uhanimation.co.uk/">University of Hertfordshire</a></li></ul><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21449/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21449/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21449/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21449/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T10:05:12.114Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T10:05:12.114Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:10:"Josh Parks";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:11;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21305";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:112:"http://computers.tutsplus.com/tutorials/how-to-combine-all-your-email-accounts-into-one-gmail-account--cms-21305";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:61:"How to Combine All Your Email Accounts Into One Gmail Account";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:11480:"<p>I’ve collected a pretty long list of email addresses over the years. There are the two or three I created as a teenager, with usernames like hotgirl13@aol.com and spockluvr285@yahoo.com, and the other accounts I created as I outgrew my old usernames or found a new email service to try. While I’m happy to let most of those go, I still get important messages that I don’t want to miss in some of my less-used accounts. I’m just not up to checking four or five email addresses throughout the day, though. It’s not the work of keeping up with so many logins, it’s that I’ll forget to check them at all for days on end.</p>

<p>The solution, then, is to create a single, unified inbox that collects all of my emails in one place. All of my emails flow into one inbox, and I can respond using any email address. Creating a unified inbox that collects all of your emails isn’t as complicated as it sounds, and I’ll show you how to make it happen. </p>

<h2>Use Gmail to Forward Email</h2>
<p>Log into the Gmail account from which you’d like to forward email. In practice, this would be a secondary email account that you use less. All of the email from this account will be funnelled into another email account, likely your primary account checked much more frequently. In this tutorial, I’m forwarding email from one Gmail account to another, but Gmail can forward to any email service.</p>

<p>
In the secondary Gmail account, click the gear icon to the right and select <b>Settings</b>.</p><figure class="post_image"><img alt="Locate Gmails settings" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/128/posts/21305/image/gmailinbox.png"><figcaption>Locate Gmail's settings.</figcaption></figure><p>Click the <b>Forwarding and POP/IMAP</b> tab and locate the <b>Forwarding</b> settings.</p><figure class="post_image"><img alt="Find the Forwarding tab" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/128/posts/21305/image/gmailinbox 1.png"><figcaption>Find the Forwarding tab.</figcaption></figure><p>Click <b>Add a Forwarding Address</b>, and enter your primary email address. Click <b>Proceed</b> to continue.</p><figure class="post_image"><img alt="Enter the email address that will receive your forwarded email" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/128/posts/21305/image/gmailinbox 2.png"><figcaption>Enter the email address that will receive your forwarded email.</figcaption></figure>

<p>
Gmail will send a verification email to the primary email address entered.</p><figure class="post_image"><img alt="Click Proceed to continue" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/128/posts/21305/image/gmailinbox 3.png"><figcaption>Click Proceed to continue.</figcaption></figure><p>
<b>Tip:</b> If your primary email address is also a Gmail account, log in by clicking the user image in the top right of the Gmail window and choosing <b>Add Account</b>. Connecting the two accounts in this way will allow you to quickly switch back and forth between accounts during the confirmation process without logging in or out.</p><figure class="post_image"><img alt="Connect two Gmail accounts to make switching inboxes easier" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/128/posts/21305/image/gmailinbox 5.png"><figcaption>Connect two Gmail accounts to make switching inboxes easier.</figcaption></figure>

<p>
In the confirmation email, you’ll find a <b>confirmation code</b> and <b>confirmation link</b>. Enter the confirmation code in the <b>Forwarding and POP/IMAP</b> tab in the secondary Gmail account, or click the confirmation link in the email. The secondary Gmail account is now forwarding to the primary email address.</p><figure class="post_image"><img alt="Enter the code or click the link to complete the forwarding process" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/128/posts/21305/image/gmailinbox 6.png"><figcaption>Enter the code or click the link to complete the forwarding process.</figcaption></figure>

<h2>Send Email as Another Account</h2>
<p>That’s great, but what would make this really run smoothly is if email sent from a Gmail address could appear as if it’s coming from another email account. I’ll show you how to send email from other email providers in Gmail.</p>

<p>
In Gmail, click the gear icon to the right and select <b>Settings</b>. Choose the <b>Accounts and Imports</b> tab.</p>

<p>
Within <b>Send Mail As</b>, click <b>Add Another Email Address You Own</b>.</p><figure class="post_image"><img alt="Gmail allows you to send email as another account" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/128/posts/21305/image/gmailinbox 9.png"><figcaption>Gmail allows you to send email as another account.</figcaption></figure>

<p>
Enter the secondary email address. You may also edit the displayed name and specify a different reply-to address.</p><figure class="post_image"><img alt="Enter the email address youd like to send mail as" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/128/posts/21305/image/gmailinbox 10.png"><figcaption>Enter the email address you'd like to send mail as.</figcaption></figure>

<p>
When prompted by Gmail, send the verification message to the secondary email address. In the verification email, you’ll find a <b>confirmation code</b> and <b>confirmation link</b>. </p>

<figure class="post_image"><img alt="Send the verification email" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/128/posts/21305/image/gmailinbox 11.png"><figcaption>Send the verification email.</figcaption></figure><p>
Enter the confirmation code in the <b>Verification</b> window in Gmail, or click the confirmation link in the email.&nbsp;</p>

<figure class="post_image"><img alt="Enter the code or click the link" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/128/posts/21305/image/gmailinbox 13.png"><figcaption>Enter the code or click the link.</figcaption></figure><p>The Gmail account may now send email as the secondary email account. Repeat the process for all of the email addresses you’d like to use in Gmail.</p><p>
When complete, there will be a new <b>From</b> dropdown in the <b>Compose New Message </b>window. Repeat this process for as many email addresses as you own.</p><figure class="post_image"><img alt="Select the address from which you would like to send email" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/128/posts/21305/image/gmailinbox 20.png"><figcaption>Select the address from which you would like to send email.</figcaption></figure>


<h2>Set a Default Send Mail As Address</h2>
<p>While you can select from which address you’d like to send email in the <b>Compose New Message</b>&nbsp;window, it may happen that you more often want to send email from your Outlook or Yahoo email addresses than from your Gmail email address.</p>

<p>
In that case, it makes sense to set another email address as the default <b>Send Mail As</b> address in Gmail.</p>

<p>
Again, click the gear icon to the right of the Gmail window and select <b>Settings</b>. Choose the <b>Accounts and Imports</b> tab. Displayed here are all of the email addresses with which you can send email within Gmail.</p><figure class="post_image"><img alt="All of your connected email addresses will be listed" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/128/posts/21305/image/gmailinbox26.png"><figcaption>All of your connected email addresses will be listed.</figcaption></figure>

<p>
Click <b>Make Default</b> next to the email address you will use most often to send email.</p>

<p>
Next time you compose a new email, the default <b>Send Mail As</b> address will be automatically selected in the <b>From</b> field.</p><figure class="post_image"><img alt="Emails sent with Gmail will appear as though they came from another account" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/128/posts/21305/image/gmailinbox 21.png"><figcaption>Emails sent with Gmail will appear as though they came from another account.</figcaption></figure>


<h2>Organize Email Sent to Different Addresses</h2>
<p>In an inbox of thirty messages, it may not be obvious what’s important and what isn’t, which emails were sent to each address. Gmail filters and labels can help keep all of those different email addresses straight in your inbox.</p>

<p>
Click the gear icon to the right of the Gmail window and select <b>Settings</b>. This time, select the <b>Filters</b> tab.</p>

<p>
Select <b>Create a New Filter</b> at the bottom of the window.</p><figure class="post_image"><img alt="Create a new filter in Settings" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/128/posts/21305/image/gmailinbox 22.png"><figcaption>Create a new filter in Settings.</figcaption></figure>

<p>
There are many options for your filter, but for this tutorial, you only need to complete one of the fields. In the <b>To</b> field, enter a secondary email address that is being forwarded to your primary Gmail account. Click <b>Create Filter With This Search</b>.</p>

<p>
Gmail can do a lot with a filtered message, and it’s best if you decide how you want to receive your forwarded messages yourself. Would you like them all marked as read and archived, or should they be starred as important?</p><figure class="post_image"><img alt="Apply a label to messages matching the search" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/128/posts/21305/image/gmailinbox 23.png"><figcaption>Apply a label to messages matching the search.</figcaption></figure>

<p>
I’m going to allow Gmail to handle the forwarded messages as usual, but I want to add a label so I know to which account the message was sent. Click the <b>Apply the Label</b> checkbox and choose a label from the list.</p>

<p>
If you haven’t created a label to handle forwarded messages from the secondary email address yet, select <b>New Label</b>.</p><figure class="post_image"><img alt="Create a new label" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/128/posts/21305/image/gmailinbox 24.png"><figcaption>Create a new label.</figcaption></figure>

<p>
Enter a name for your label and click <b>Create</b>.</p>

<p>
If any previously received messages meet the filter’s criteria, you may also apply the filter to those messages, too.</p>

<p>
Click <b>Create Filter</b> when you’re done. All messages addressed to the secondary email address will receive the new label.</p>

<h2>Conclusion</h2>
<p>While it may seem like you have to abandon old email accounts or schedule time to check various accounts still in use, with a little effort, you can get all of your email in one Gmail inbox. If you have any trouble combining your email accounts in Gmail, be sure to leave a comment below and we'll help you figure out how to get it working.</p><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21305/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21305/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21305/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21305/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T08:00:00.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-06-20T08:00:00.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:12:"Paula DuPont";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}}}}}}}}s:4:"type";i:512;s:7:"headers";a:23:{s:6:"server";s:16:"cloudflare-nginx";s:4:"date";s:29:"Sat, 21 Jun 2014 15:37:11 GMT";s:12:"content-type";s:35:"application/atom+xml; charset=utf-8";s:14:"content-length";s:6:"211467";s:10:"connection";s:10:"keep-alive";s:10:"set-cookie";s:134:"__cfduid=d62d2990c1905050464ae8def5b2fc8091403365030792; expires=Mon, 23-Dec-2019 23:50:00 GMT; path=/; domain=.tutsplus.com; HttpOnly";s:13:"accept-ranges";s:5:"bytes";s:3:"age";s:1:"0";s:13:"cache-control";s:8:"no-cache";s:4:"etag";s:34:""a1c680052cc53ff6d0dff3ddd0cbaf81"";s:6:"status";s:6:"200 OK";s:4:"vary";s:22:"Accept,Accept-Encoding";s:3:"via";s:11:"1.1 varnish";s:22:"x-content-type-options";s:7:"nosniff";s:15:"x-frame-options";s:43:"ALLOW-FROM https://analytics.webtrends.com/";s:12:"x-powered-by";s:24:"Phusion Passenger 4.0.45";s:12:"x-request-id";s:36:"74304272-5d2a-45a4-87d4-be9514467203";s:9:"x-runtime";s:8:"0.041998";s:15:"x-ua-compatible";s:8:"chrome=1";s:9:"x-varnish";s:10:"1177744160";s:15:"x-varnish-cache";s:4:"MISS";s:16:"x-xss-protection";s:13:"1; mode=block";s:6:"cf-ray";s:20:"13e1493272fb01b0-FRA";}s:5:"build";s:14:"20121030085402";}