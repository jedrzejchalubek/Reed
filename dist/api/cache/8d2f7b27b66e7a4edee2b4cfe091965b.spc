a:4:{s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"feed";a:1:{i:0;a:6:{s:4:"data";s:52:"
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
";s:7:"attribs";a:1:{s:36:"http://www.w3.org/XML/1998/namespace";a:1:{s:4:"lang";s:5:"en-US";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:5:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:38:"tag:tutorials.tutsplus.com,2005:/posts";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:2:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:29:"http://tutorials.tutsplus.com";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}i:1;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:4:"self";s:4:"type";s:20:"application/atom+xml";s:4:"href";s:40:"http://tutorials.tutsplus.com/posts.atom";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:9:"Tuts+ All";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:20:"2014-05-28T17:25:11Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"entry";a:12:{i:0;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21052";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:96:"http://gamedevelopment.tutsplus.com/articles/what-is-data-oriented-game-engine-design--cms-21052";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:41:"What is Data-Oriented Game Engine Design?";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:19082:"<p>You may have heard of data-oriented game engine design, a relatively new concept that proposes a different mindset to the more traditional object-oriented design. In this article, I'll explain what DOD is all about, and why some game engine developers feel it could be the ticket for spectacular performance gains.<br></p><h2>A Bit of History</h2><p>In the early years of game development, games and their engines were written in old-school languages, such as C. They were a niche product, and squeezing every last clock cycle out of slow hardware was, at the time, the utmost priority. In most cases, there was only a modest number of people hacking at the code of a single title, and they knew the entire codebase by heart. The tools they were using had been serving them well, and C was providing the performance benefits that enabled them to push the most out of the CPU—and as these games were still by large bound by the CPU, drawing to its own frame buffers, this was a very important point.<br></p><p>With the advent of GPUs that do the number-crunching work on the triangles, texels, pixels, and so on, we've come to depend less on the CPU. At the same time, the gaming industry has seen steady growth: more and more people want to play more and more games, and this in turn has led to more and more teams coming together to develop them.&nbsp;</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/22/posts/21052/image/Moore.png"><figcaption><a href="http://en.wikipedia.org/wiki/Moore's_law" target="_self">Moore's law</a> shows that hardware growth is exponential, not linear in respect to time: this means that every couple of years, the number of transistors we can fit on a single board doesn't change by a constant amount—it doubles!</figcaption></figure><p>Bigger teams needed better cooperation. Before long, the game engines, with their complex level, AI, culling, and rendering logic required the coders to be more disciplined, and their weapon of choice was <i>object-oriented design</i>.</p><p>As <a href="http://paulgraham.com/noop.html" target="_self">Paul Graham once said</a>:&nbsp;</p><blockquote>At big companies,
software tends to be written by large (and frequently changing) teams of mediocre programmers.  Object-oriented programming imposes a discipline on these programmers that prevents any one of them from doing too much damage.</blockquote><p><span class="wysiwyg-font-size-small">Whether we like it or not, this has to be true to some degree—bigger companies started to deploy bigger and better games, and as the standardization of tools emerged, the hackers working on games became parts that could be swapped out way more easily. The virtue of a particular hacker became less and less important.</span></p><h3>Problems With Object-Oriented Design</h3><p><span class="wysiwyg-font-size-small">While object-oriented design is a nice concept that helps developers on big projects, such as games, create several layers of abstraction and have everyone work on their target layer, without having to care about the implementation details of the ones underneath, it's bound to give us <i>some</i> headaches.</span></p><p><span class="wysiwyg-font-size-small">We see an explosion of parallel programming—coders harvesting all the processor cores available to deliver blazing computation speeds—but at the same time, game scenery becomes more and more complex, and if we want to keep up with that trend and still deliver the frames-per-second our players expect, we need to do it, too. By using all speed we have at hand, we can open doors for entirely new possibilities: using the CPU time to reduce the number of data sent to the GPU altogether, for example.</span></p><p><span class="wysiwyg-font-size-small">In object-oriented programming, you keep state within an object, which requires you to introduce concepts like <a href="http://stackoverflow.com/questions/8017507/definition-of-synchronization-primitive" target="_self">synchronization primitives</a> if you want to work on it from multiple threads. You have one new level of indirection for every virtual function call you make. And the memory access patterns generated by code written in an object-oriented manner <i>can </i>be </span><span class="wysiwyg-font-size-small">awful—in fact, Mike Acton (Insomniac Games, ex-Rockstar Games) has a <a href="http://macton.smugmug.com/gallery/8936708_T6zQX#!i=593428032&amp;k=DGbc4gm" target="_self">great set of slides casually explaining one example</a>.&nbsp;</span></p><p><span class="wysiwyg-font-size-small">Similarly, Robert Harper, a professor at Carnegie Mellon University, <a href="http://existentialtype.wordpress.com/2011/03/15/teaching-fp-to-freshmen/" target="_self">put it this way</a>:&nbsp;</span></p><blockquote>Object-oriented programming is [...] both anti-modular and anti-parallel by its 
very nature, and hence unsuitable for a modern CS curriculum.</blockquote><p>Talking about OOP like this is tricky, because OOP encompasses a huge spectrum of properties, and not everyone agrees what OOP means. In this sense, I'm mostly talking about OOP as implemented by C++, because that's currently the language that vastly dominates the game engine world.</p><p>So, we know that games need to become parallel because <i>there is always more work that the CPU can (but doesn't have to) do</i>, and spending cycles waiting for the GPU to finish processing is just wasteful. We also know that common OO design approaches require us to introduce expensive lock contention, and at the same time, can violate cache locality or cause unnecessary branching (which can be costly!) in the most unexpected circumstances.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/22/posts/21052/image/utilization.png"><figcaption>If we don't take advantage of multiple cores, we keep using the same amount of CPU resources even if the hardware gets arbitrarily better (has more cores). At the same time, we can push GPU to its limits because it is, by design, parallel, and able to take on any amount of work simultaneously. This can interfere with our mission to provide players the best experience on their hardware, as we are clearly not using it to full potential.</figcaption></figure><p>This raises the question: should we rethink our paradigms altogether?<br></p><h2>Enter: Data-Oriented Design</h2><p>Some proponents of this methodology have <i>called</i> it data-oriented design, but the truth is that the general concept has been known for much longer. Its basic premise is simple: <i>construct your code around the data structures, and describe what you want to achieve in terms of manipulations of these structures</i>.&nbsp;</p><p>We've heard this kind of talk before: Linus Torvalds, the creator of Linux and Git, said in a <a href="http://lwn.net/Articles/193245/" target="_self">Git mailing list post</a> that he is a huge proponent of "designing the code around the data, not the other way around", and credits this as one of the reasons for Git's success. He goes on even to claim that the difference between a good programmer and a bad one is whether she worries about data structures, or the code itself.</p><p>The task may seem counterintuitive at first, because it requires you to turn your mental model upside-down. But think of it this way: a game, while running, captures all the user's input, and all performance-heavy pieces of it (the ones where it would make sense to ditch the standard <i>everything is an object </i>philosophy) do not rely on outside factors, such as network or IPC. For all you know, a game consumes user events (mouse moved, joystick button pressed, and so on) and the current game state, and churns these up into a new set of data—for example, batches that are sent to the GPU, PCM samples that are sent to the audio card, and a new game state.</p><p>This "data churning" can be broken down into a lot more sub-processes. An animation system takes the next keyframe data and the current state and produces a new state. A particle system takes its current state (particle positions, velocities, and so on) and a time advancement and produces a new state. A culling algorithm takes a set of candidate renderables and produces a smaller set of renderables. Almost everything in a game engine can be thought of as manipulating a chunk of data to produce another chunk of data.</p><p>Processors love locality of reference and utilization of cache. So, in data-oriented design, we tend to, wherever possible, organize everything in big, homogenous arrays, and, also wherever possible, run good, cache-coherent brute-force algorithms in place of a potentially fancier one (which has a better Big O cost, but fails to embrace the architecture limitations of hardware it works on).&nbsp;</p><p>When performed per-frame (or multiple times per frame), this potentially gives huge performance rewards. For example, the folks at Scalyr report <a href="http://blog.scalyr.com/2014/05/06/searching-20-gbsec-systems-engineering-before-algorithms/?updated=true" target="_self">searching log files at 20GB/sec</a> using a carefully-crafted but a naive sounding brute-force linear scan.&nbsp;</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/22/posts/21052/image/objects.png"><figcaption>When we process objects, we have to think of them as "black boxes" and call their methods, which in turn access the data and get us what we want (or make changes that we want). This is great for working for maintainability, but not knowing how our data is laid out can be detrimental to performance.</figcaption></figure><h2>Examples</h2><p>Data-oriented design has us thinking all about data, so let's do something also a bit different from what we usually do.&nbsp;Consider this piece of code:</p><pre class="brush: cpp">void MyEngine::queueRenderables()
{
  for (auto it = mRenderables.begin(); it != mRenderables.end(); ++it) {
    if ((*it)-&gt;isVisible()) {
       queueRenderable(*it);
  }
}</pre><p>Although simplified a lot, this common pattern is what is often seen in object-oriented game engines. But wait—if a lot of renderables aren't actually visible, we run into a lot of branch mispredictions which cause the processor to trash some instructions that it had executed in hope a particular branch was taken.&nbsp;</p><p>For small scenes, this obviously isn't an issue.  But how many times do you do this particular thing, not just when queuing renderables, but when iterating through scene lights, shadow map splits, zones, or the like? How about AI or animation updates? Multiply all that you do throughout the scene, see how many clock cycles you expel, compute how much time your processor has available to deliver all the GPU batches for a steady 120FPS rhythm, and you see that these things <i>can </i>scale to a considerable amount.&nbsp;</p><p>It would be funny if, for instance, a hacker working on a web app even considered such miniscule micro-optimizations, but we know that games are real-time systems where resource constraints are incredibly tight, so this consideration is not misplaced for us.<br></p><p>To avoid this from happening, let's think about it in another way: what if we kept the list of visible renderables in the engine? Sure, we would sacrifice the neat syntax of <code class="inline">myRenerable-&gt;hide()</code> and violate quite a few OOP principles, but we could then do this:</p><pre class="brush: cpp">void MyEngine::queueRenderables()
{
  for (auto it = mVisibleRenderables.begin(); it != mVisibleRenderables.end(); ++it) {
    queueRenderable(*it);
  }
}</pre><p>Hooray! No branch mispredictions, and assuming <code class="inline">mVisibleRenderables</code> is a nice <code class="inline">std::vector</code> (which is a contiguous array), we could have as well rewritten this as a fast <code class="inline">memcpy</code> call (with a few extra updates to our data structures, probably).</p><p>Now, you may call me out on the sheer cheesiness of these code samples and you will be quite right: this is simplified <i>a lot. </i>But to be honest, I haven't even scratched the surface yet. Thinking about data structures and their relationships opens us to a whole lot of possibilities we haven't thought about before. Let's look at some of them next.</p><h3>Parallelization and Vectorization</h3><p>If we have simple, well-defined functions that operate on large data chunks as base building blocks for our processing, it's easy to spawn four, or eight, or 16 worker threads and give each of them a piece of data to keep all the CPU cores busy. No mutexes, atomics or lock contention, and once you need the data, you need only to join on all the threads and wait for them to finish. If you need to sort data in parallel (a very frequent task when preparing stuff to be sent to the GPU), you have to think about this from a different perspective—<a href="http://macton.smugmug.com/gallery/9114809_C9awM#!i=607513208&amp;k=xqWYf" target="_self">these slides might help</a>.<br></p><p>As an added bonus, inside one thread you can use SIMD vector instructions (such as SSE/SSE2/SSE3) to achieve an additional speed boost. Sometimes, you can accomplish this only by laying your data in a different way, such as placing vector arrays in a structure-of-arrays (SoA) manner (like <code class="inline">XXX...YYY...ZZZ...</code>) rather than the conventional array-of-structures (AoS; that would be <code class="inline">XYZXYZXYZ...</code>). I'm barely scratching the surface here; you can find more information in the <b>Further Reading</b> section below.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/22/posts/21052/image/parallel.png"><figcaption>When our algorithms deal with the data directly, it becomes trivial to parallelize them, and we can also avoid some speed drawbacks.</figcaption></figure><h3>Unit Testing You Didn't Know Was Possible</h3><p>Having simple functions with no external effects makes them easy to unit-test. This can be especially good in a form of regression testing for algorithms you'd like to swap in and out easily.&nbsp;</p><p>For example, you can build a test suite for a culling algorithm's behavior, set up an orchestrated environment, and measure exactly how it performs. When you devise a new culling algorithm, you run the same test again with no changes. You measure performance and correctness, so you can have assessment at your fingertips.&nbsp;</p><p>As you get more into the data-oriented design approaches, you'll find it easier and easier to test aspects of your game engine.</p><h3>Combining Classes and Objects With Monolithic Data</h3><p>Data-oriented design is by no means opposed to object-oriented programming, just some of its ideas. As a result, you can quite neatly use <i>ideas</i> from data-oriented design and still get most of the abstractions and mental models you're used to.&nbsp;</p><p>Take a look, for example, at the <a href="http://www.ogre3d.org/forums/viewforum.php?f=25" target="_self">work on OGRE version 2.0</a>: Matias Goldberg, the mastermind behind that endeavor, chose to store data in big, homogenous arrays, and have functions that iterate over whole arrays as opposed to working on only one datum, in order to speed up Ogre. According to <a href="http://yosoygames.com.ar/wp/2013/07/ogre-2-0-is-up-to-3x-faster/" target="_self">a benchmark</a> (which he admits is very unfair, but the performance advantage measured cannot be <i>only</i> because of that) it works now three times faster. Not only that—he retained a lot of the old, familiar class abstractions, so the API was far from a complete rewrite.</p><h2>Is It Practical?</h2><p>There is a lot of evidence that game engines in this manner can and will be developed.</p><p><a href="http://molecularmusings.wordpress.com" target="_self">The development blog of Molecule Engine</a> has a series named <i>Adventures in Data-Oriented Design</i>,<i>&nbsp;</i>and contains a lot of useful advice regarding where DOD was put to use with great results.</p><p><a href="http://dice.se/publications/culling-the-battlefield-data-oriented-design-in-practice/" target="_self">DICE seems to be interested in data-oriented design</a>, as they have employed it in Frostbite Engine's culling system (and got significant, speed-ups, too!). Some other slides from them also include <a href="http://www.slideshare.net/DICEStudio/a-step-towards-data-orientation" target="_self">employing data-oriented design in the AI subsystem</a>—worth looking at, too.<br></p><p>Besides that, developers like the aforementioned&nbsp;<a href="http://macton.flavors.me/" target="_self">Mike Acton</a>&nbsp;seem to be embracing the concept. There are a few benchmarks which prove that it does gain a lot in performance, but I haven't seen a lot of activity on the data-oriented design front in quite some time. It could, of course, be just a fad, but its main premises seem very logical. There sure is a lot of inertia in this business (and any other software development business, for that matter) so this may be hindering large-scale adoption of such a philosophy. Or maybe it's not such a great idea as it seems to be. What do you think? Comments are very welcome!<br></p><h2>Further Reading</h2><ol><li><a href="http://macton.smugmug.com/gallery/9114809_C9awM#!i=607513208&amp;k=xqWYf"></a><a href="http://gamesfromwithin.com/data-oriented-design" target="_self">Data-Oriented Design (Or Why You Might Be Shooting Yourself in The Foot With OOP)</a> <br></li><li><a href="http://dice.se/publications/introduction-to-data-oriented-design/" target="_self">Introduction to Data Oriented Design [DICE]</a>&nbsp;</li><li><a href="http://stackoverflow.com/questions/1641580/what-is-data-oriented-design" target="_self">A rather nice discussion on Stack Overflow</a>&nbsp;</li><li><a href="http://www.dataorienteddesign.com/dodmain/dodmain.html" target="_self">An online book by Richard Fabian explaining a lot of the concepts</a>&nbsp;</li><li><a href="http://rcl-rs-vvg.blogspot.com/2011/04/measuring-benefits-of-data-oriented.html" target="_self">A benchmark showing other side of the story, a seemingly counter-intuitive result</a>&nbsp;</li><li><a href="http://www.bounceapp.com/116414" target="_self">Mike Acton's review of OgreNode.cpp, revealing some common OOP game engine development pitfalls</a>&nbsp;</li></ol><br><br><br><br><br><br><br><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21052/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21052/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21052/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21052/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T17:25:11.714Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T17:25:11.714Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:16:"David Davidović";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:1;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-20700";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:84:"http://code.tutsplus.com/tutorials/google-play-game-services-leaderboards--cms-20700";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:39:"Google Play Game Services: Leaderboards";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:30800:"<p>Google Play Game Services provide the opportunity to add social features to your games through users' Google+ accounts. In this tutorial, we will demonstrate how you can add leaderboards to an Android app, submitting user scores, and presenting the current leaderboard standings within the game.</p><p>Using leaderboards involves preparing your IDE, configuring the leaderboard in the Google Play Developer Console, and adding functionality to your app.</p><p>If you completed the <a href="https://code.tutsplus.com/tutorials/google-play-game-services-achievements--cms-20591" target="_self">recent tutorial on adding achievements</a> to Android apps, you will be able to skip some of the steps in this one. The attached source code includes the same app we used for the achievements tutorial, with both achievements and leaderboards functionality added.</p><h2><span class="sectionnum">1.</span> Prepare Your IDE</h2><h3>Step 1</h3><p>To use Google Play Services, you need certain utilities installed in your development environment. In addition, since we are using Game Services, we will install the <b>BaseGameUtils</b> library, which reduces&nbsp;the amount of coding we need to implement features such as Google+ sign-in.</p><p>To get started, create a new app or use an existing one. If you followed the achievements tutorial, you can use the app you built for that tutorial. If you are creating your own game, decide what you want to use leaderboards for and&nbsp;when you plan on submitting a user&nbsp;score. Each leaderboard score will be a number. You can configure the leaderboard to regard lower or higher number values as better in terms of position in the leaderboard, but naturally this will depend on the purpose of your game.</p><p>The code in the download folder includes a simple game in which the user guesses a number. We will use the number of guesses required to get the correct answer as the leaderboard score. In this case, fewer guesses are better, so the leaderboard will present the lowest scores first. For simplicity, we will limit the number of guesses a user can take. This is a trivial example to demonstrate the leaderboard concept and functionality. Your own games will likely involve more complexity.</p><h3>Step 2</h3><p>Let's get Eclipse ready for developing with Google Play Game Services. Open the <b>Android&nbsp;SDK Manager</b> and scroll to the <b>Extras</b> folder. Expand the folder and select <b>Google Play Services</b> plus the <b>Google Repository</b>. Install the <b>Google APIs Platform</b> from one of the recent Android versions as well if you want to test on the emulator. Install the chosen packages.</p><h3>Step 3</h3><p>Eclipse will also need to reference some additional resources in the workspace. On your computer, navigate to the location of the <b>Google Play Services Library</b>, which should be in the Android SDK folder, at <b>extras/google/google_play_services/libproject/google-play-services_lib/</b>. Copy and paste the library somewhere else on your computer.</p><p>We now&nbsp;need a reference to this copy in Eclipse. Choose&nbsp;<b>Import &gt;</b>&nbsp;<b>Android &gt;</b>&nbsp;<b>Import Existing Android Code into Workspace</b> from the&nbsp;<b>File&nbsp;</b>menu. Select the location of the copy you made. The imported library should now show up as a new project in Eclipse. Right-click it and choose <b>Properties</b>. In the <b>Android</b> section, choose a Google APIs build target and check the <b>Is Library</b>&nbsp;checkbox.</p><h3>Step 4</h3><p>Importing the <b>BaseGameUtils</b> resource is slightly different. The library is hosted on GitHub. You can find it in the&nbsp;<a href="https://developers.google.com/games/services/downloads/" target="_self">Downloads</a>&nbsp;section, under Sample Games. Download the library&nbsp;and save it to your computer.</p><p>As you did for the Google Play Services library, choose&nbsp;<b>Import &gt; Android &gt;&nbsp;Import Existing Android Code into </b><b>Workspace</b> from the&nbsp;<b>File</b> menu&nbsp;to bring the BaseGameUtils library into Eclipse. Right-click&nbsp;to navigate to the new project properties and make sure the project is marked as a library by checking&nbsp;<b>Is Library</b>.</p><h3>Step 5</h3><p>We can now&nbsp;make the app refer to these two resources within the workspace. Right-click your app in the Package Explorer and choose <b>Properties</b>. Navigate to the <b>Android</b> section and select <b>Add</b>&nbsp;in the <b>Library</b> section. Choose both the <b>Google Play Services</b> library and <b>BaseGameUtils</b>, and add them to your app.</p><h2><span class="sectionnum">2.</span>&nbsp;Prepare Your Game in the Developer Console</h2><h3>Step 1<br></h3><p>Before you can create a leaderboard, the app needs to be&nbsp;listed in the <b>Google Play&nbsp;Developer Console</b>. Log in and click the <b>Game Services</b> button to the left. If you already did this for your app in the <a href="https://code.tutsplus.com/tutorials/google-play-game-services-achievements--cms-20591" target="_self">achievements tutorial</a>, you do not need to do it again. You can jump to section 3 on creating a leaderboard.</p><p>Click <b>Set up Google Play game services</b>.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/140/posts/20591/image/google-play-game-achievements-setup.png"></figure><p>Click to add a new game,&nbsp;select&nbsp;<b>I don't use any Google APIs in my game yet</b>, and choose&nbsp;a name and category for your game. Click&nbsp;<b>Continue</b><b>&nbsp;</b>to go to the next step.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/140/posts/20591/image/google-play-game-achievements-details.png"></figure><p>Add your game's title. You can add other details later.</p><h3>Step 2</h3><p>Let's now&nbsp;link the app so that we can refer to this Developer Console&nbsp;listing in the app itself. Click the <b>Linked Apps</b> entry in the list on the left and choose <b>Android</b>.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/140/posts/20591/image/google-play-game-achievements-linked.png"></figure><p>Enter your app info including the package name, making sure it's the same as the one you are using in your project.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/140/posts/20591/image/google-play-game-achievements-link-details.png"></figure><p>Save and click <b>Authorize your app now</b>. For the moment, you can just add the app name, but you can enter more details later. Choose <b>Installed Application</b> in the Client ID area, with <b>Android</b> as the type and&nbsp;enter your package name. You now&nbsp;need to use the keytool utility&nbsp;to generate a signing certificate. You can use the following command in a terminal or command prompt in combination with the&nbsp;debug certificate:</p><pre class="brush: bash">keytool -exportcert -alias androiddebugkey -keystore ~/.android/debug.keystore -list -v</pre><p>The terminal or command prompt&nbsp;will write out the fingerprint for the certificate. Copy what you see after <b>SHA1</b> and paste it into the Developer Console in the&nbsp;<b>Signing Certificate Fingerprint </b>text area.</p><p>Select <b>Create Client</b> and copy the ID for the application, which is&nbsp;listed next to the app name in the Developer Console. You will be adding the ID to your app along with the ID for the leaderboard we are about to create.</p><h2><span class="sectionnum">3.</span> Create a Leaderboard</h2><h3>Step 1</h3><p>Still in the Developer Console, let's now create a new leaderboard. Select the <b>Leaderboards</b> section in your app listing and click <b>Add leaderboard</b>.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/140/posts/20700/image/google-play-game-leaderboards-new.png"></figure><p>Make sure you understand the concept of Leaderboards on Android—and in Google Play Game Services generally. You can read an overview on the&nbsp;<a href="https://developers.google.com/games/services/common/concepts/leaderboards" target="_self">Google Play Game Services</a>&nbsp;website. You can actually do a lot of different things with leaderboards, so consider what we do in this tutorial just a starting point.</p><p>Enter the details for your new leaderboard. For our sample code, we use the name <b>Least Guesses</b>&nbsp;and select <b>Smaller is Better&nbsp;</b>in the&nbsp;<b>Ordering&nbsp;</b>section.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/140/posts/20700/image/google-play-game-leaderboards-new-details.png"></figure><p>Add an icon if you like. If you don't&nbsp;a standard image will be used. Save your new leaderboard and copy its ID.</p><h3>Step 2</h3><p>In the <b>Testing</b> section for your app in the Developer Console, you can add accounts that will be granted access to test the game. By default,&nbsp;you will see your own Google account email listed there, so you should be able to use it for testing your app.</p><h2><span class="sectionnum">4.</span>&nbsp;Prepare Your Game&nbsp;for Accessing Games Services</h2><h3>Step 1</h3><p>It's time to&nbsp;get the app ready for leaderboard access in Eclipse. If you completed the <a href="https://code.tutsplus.com/tutorials/google-play-game-services-achievements--cms-20591" target="_self">achievements tutorial</a> you can skip some of this section. Let's first add the IDs for the app and the leaderboard. Open or create a <b>res/values/ids.xml</b>&nbsp;resource file. Use the following syntax to enter the IDs you copied for the app and the new leaderboard when you created them in the Developer Console:</p><pre class="brush: xml">&lt;string name="app_id"&gt;1234567890&lt;/string&gt;
&lt;string name="number_guesses_leaderboard"&gt;abcdefg1234567&lt;/string&gt;</pre><p>Save the file and open the project's&nbsp;<b>Manifest</b>. Add the following inside the&nbsp;<code class="inline">application</code> element:</p><pre class="brush: xml">&lt;meta-data
 android:name="com.google.android.gms.games.APP_ID"
 android:value="@string/app_id" /&gt;
&lt;meta-data
 android:name="com.google.android.gms.version"
 android:value="@integer/google_play_services_version" /&gt;</pre><p>The app is now&nbsp;set up to link to the listings we added in the Developer Console.</p><h3>Step 2</h3><p>When you utilize Google Services in your Android apps, you need your users to sign into their Google accounts. You can take a number of approaches to implement this, but&nbsp;we are going to automate parts of this process&nbsp;by using the <code class="inline">BaseGameActivity</code> class together with standard buttons for signing in and out. Additionally, when the activity starts, the app will attempt to log the user in straight away.</p><p>Open your app's main layout file and add buttons for sign in/out:</p><pre class="brush: xml">&lt;!-- sign-in button --&gt;

&lt;com.google.android.gms.common.SignInButton
 android:id="@+id/sign_in_button"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content" /&gt;

&lt;!-- sign-out button --&gt;

&lt;Button
 android:id="@+id/sign_out_button"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:text="Sign Out"
 android:visibility="gone" /&gt;</pre><h3>Step 3</h3><p>Add these imports to your main <code class="inline">Activity</code> class:</p><pre class="brush: java">import com.google.android.gms.games.Games;
import com.google.example.games.basegameutils.BaseGameActivity;</pre><p>Make the <code class="inline">Activity</code>&nbsp;class extend the&nbsp;<code class="inline">BaseGameActivity</code>&nbsp;class and listen for clicks:</p><pre class="brush: java">public class MainActivity extends BaseGameActivity implements View.OnClickListener</pre><p>Prepare to respond to clicks on the sign in/out buttons in <code class="inline">onCreate</code>:</p><pre class="brush: java">findViewById(R.id.sign_in_button).setOnClickListener(this);
findViewById(R.id.sign_out_button).setOnClickListener(this); </pre><p>Now add the following standard methods to an <code class="inline">onClick</code> method in the class:</p><pre class="brush: java">@Override
public void onClick(View view) {
    if (view.getId() == R.id.sign_in_button) {
		beginUserInitiatedSignIn();
	}
	else if (view.getId() == R.id.sign_out_button) {
		signOut();
		findViewById(R.id.sign_in_button).setVisibility(View.VISIBLE);
		findViewById(R.id.sign_out_button).setVisibility(View.GONE);
	}
}</pre><p>The methods we call here are provided by the <code class="inline">BaseGameActivity</code>&nbsp;class our <code class="inline">Activity</code> class is&nbsp;inheriting from, so we don't need to handle the details manually. Finally, we add a couple of standard callbacks:</p><pre class="brush: java">public void onSignInSucceeded() {
    findViewById(R.id.sign_in_button).setVisibility(View.GONE);
	findViewById(R.id.sign_out_button).setVisibility(View.VISIBLE);
}

@Override
public void onSignInFailed() {
	findViewById(R.id.sign_in_button).setVisibility(View.VISIBLE);
	findViewById(R.id.sign_out_button).setVisibility(View.GONE);
}</pre><p>When we call on the leaderboard functionality, we will first check that the app has a connection to Google Services. You could alternatively add code to these methods to manage your app's awareness of whether or not Play Services can be called on.</p><h2><span class="sectionnum">5.</span> Implement Your&nbsp;Leaderboard</h2><h3>Step 1</h3><p>Now we can let the app use the leaderboard. The code in the sample app uses the following layout. I&nbsp;won't go into detail explaining the layout&nbsp;as your own apps will have a different layout.</p><pre class="brush: xml">&lt;RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
	android:layout_width="match_parent"
	android:layout_height="match_parent"
	android:paddingBottom="@dimen/activity_vertical_margin"
	android:paddingLeft="@dimen/activity_horizontal_margin"
	android:paddingRight="@dimen/activity_horizontal_margin"
	android:paddingTop="@dimen/activity_vertical_margin"
	tools:context="com.example.fungame.MainActivity" &gt;

	&lt;LinearLayout
		android:id="@+id/sign_in_buttons"
		android:layout_width="fill_parent"
		android:layout_height="wrap_content"
		android:layout_alignParentTop="true"
		android:orientation="horizontal" &gt;

		&lt;!-- sign-in button --&gt;

		&lt;com.google.android.gms.common.SignInButton
			android:id="@+id/sign_in_button"
			android:layout_width="wrap_content"
			android:layout_height="wrap_content" /&gt;

		&lt;!-- sign-out button --&gt;

		&lt;Button
			android:id="@+id/sign_out_button"
			android:layout_width="wrap_content"
			android:layout_height="wrap_content"
			android:text="Sign Out"
			android:visibility="gone" /&gt;
	&lt;/LinearLayout&gt;

	&lt;RelativeLayout
		android:id="@+id/gameArea"
		android:layout_width="fill_parent"
		android:layout_height="wrap_content"
		android:layout_below="@id/sign_in_buttons" &gt;

		&lt;TextView
			android:id="@+id/guess_text"
			android:layout_width="fill_parent"
			android:layout_height="wrap_content"
			android:layout_centerHorizontal="true"
			android:text="Guess the number!"
			android:textSize="30sp"
			android:textStyle="bold" /&gt;

		&lt;LinearLayout
			android:layout_width="fill_parent"
			android:layout_height="wrap_content"
			android:layout_below="@id/guess_text"
			android:orientation="vertical" &gt;

			&lt;LinearLayout
				android:layout_width="fill_parent"
				android:layout_height="wrap_content"
				android:orientation="horizontal" &gt;

				&lt;Button
					android:id="@+id/btn7"
					android:layout_width="0dp"
					android:layout_height="match_parent"
					android:layout_margin="1dp"
					android:layout_weight="1"
					android:background="#ff000033"
					android:gravity="center"
					android:onClick="btnPressed"
					android:padding="5dp"
					android:tag="7"
					android:text="7"
					android:textColor="#ffffffff"
					android:textSize="30sp"
					android:textStyle="bold" /&gt;

				&lt;Button
					android:id="@+id/btn8"
					android:layout_width="0dp"
					android:layout_height="match_parent"
					android:layout_margin="1dp"
					android:layout_weight="1"
					android:background="#ff000033"
					android:gravity="center"
					android:onClick="btnPressed"
					android:padding="5dp"
					android:tag="8"
					android:text="8"
					android:textColor="#ffffffff"
					android:textSize="30sp"
					android:textStyle="bold" /&gt;

				&lt;Button
					android:id="@+id/btn9"
					android:layout_width="0dp"
					android:layout_height="match_parent"
					android:layout_margin="1dp"
					android:layout_weight="1"
					android:background="#ff000033"
					android:gravity="center"
					android:onClick="btnPressed"
					android:padding="5dp"
					android:tag="9"
					android:text="9"
					android:textColor="#ffffffff"
					android:textSize="30sp"
					android:textStyle="bold" /&gt;
			&lt;/LinearLayout&gt;

			&lt;LinearLayout
				android:layout_width="fill_parent"
				android:layout_height="wrap_content"
				android:layout_weight="1"
				android:orientation="horizontal" &gt;

				&lt;Button
					android:id="@+id/btn4"
					android:layout_width="0dp"
					android:layout_height="match_parent"
					android:layout_margin="1dp"
					android:layout_weight="1"
					android:background="#ff000033"
					android:gravity="center"
					android:onClick="btnPressed"
					android:padding="5dp"
					android:tag="4"
					android:text="4"
					android:textColor="#ffffffff"
					android:textSize="30sp"
					android:textStyle="bold" /&gt;

				&lt;Button
					android:id="@+id/btn5"
					android:layout_width="0dp"
					android:layout_height="match_parent"
					android:layout_margin="1dp"
					android:layout_weight="1"
					android:background="#ff000033"
					android:gravity="center"
					android:onClick="btnPressed"
					android:padding="5dp"
					android:tag="5"
					android:text="5"
					android:textColor="#ffffffff"
					android:textSize="30sp"
					android:textStyle="bold" /&gt;

				&lt;Button
					android:id="@+id/btn6"
					android:layout_width="0dp"
					android:layout_height="match_parent"
					android:layout_margin="1dp"
					android:layout_weight="1"
					android:background="#ff000033"
					android:gravity="center"
					android:onClick="btnPressed"
					android:padding="5dp"
					android:tag="6"
					android:text="6"
					android:textColor="#ffffffff"
					android:textSize="30sp"
					android:textStyle="bold" /&gt;
			&lt;/LinearLayout&gt;

			&lt;LinearLayout
				android:layout_width="fill_parent"
				android:layout_height="wrap_content"
				android:layout_weight="1"
				android:orientation="horizontal" &gt;

				&lt;Button
					android:id="@+id/btn1"
					android:layout_width="0dp"
					android:layout_height="match_parent"
					android:layout_margin="1dp"
					android:layout_weight="1"
					android:background="#ff000033"
					android:gravity="center"
					android:onClick="btnPressed"
					android:padding="5dp"
					android:tag="1"
					android:text="1"
					android:textColor="#ffffffff"
					android:textSize="30sp"
					android:textStyle="bold" /&gt;

				&lt;Button
					android:id="@+id/btn2"
					android:layout_width="0dp"
					android:layout_height="match_parent"
					android:layout_margin="1dp"
					android:layout_weight="1"
					android:background="#ff000033"
					android:gravity="center"
					android:onClick="btnPressed"
					android:padding="5dp"
					android:tag="2"
					android:text="2"
					android:textColor="#ffffffff"
					android:textSize="30sp"
					android:textStyle="bold" /&gt;

				&lt;Button
					android:id="@+id/btn3"
					android:layout_width="0dp"
					android:layout_height="match_parent"
					android:layout_margin="1dp"
					android:layout_weight="1"
					android:background="#ff000033"
					android:gravity="center"
					android:onClick="btnPressed"
					android:padding="5dp"
					android:tag="3"
					android:text="3"
					android:textColor="#ffffffff"
					android:textSize="30sp"
					android:textStyle="bold" /&gt;
			&lt;/LinearLayout&gt;

			&lt;LinearLayout
				android:layout_width="fill_parent"
				android:layout_height="wrap_content"
				android:layout_weight="1"
				android:orientation="horizontal" &gt;

				&lt;Button
					android:id="@+id/btn0"
					android:layout_width="0dp"
					android:layout_height="match_parent"
					android:layout_margin="1dp"
					android:layout_weight="1"
					android:background="#ff000033"
					android:gravity="center"
					android:onClick="btnPressed"
					android:padding="5dp"
					android:tag="0"
					android:text="0"
					android:textColor="#ffffffff"
					android:textSize="30sp"
					android:textStyle="bold" /&gt;

				&lt;Button
					android:id="@+id/btnAgain"
					android:layout_width="0dp"
					android:layout_height="match_parent"
					android:layout_margin="1dp"
					android:layout_weight="1"
					android:background="#ffffff00"
					android:enabled="false"
					android:gravity="center"
					android:onClick="btnPressed"
					android:padding="5dp"
					android:tag="-1"
					android:text="Again"
					android:textColor="#ffffff00"
					android:textSize="30sp"
					android:textStyle="bold" /&gt;
			&lt;/LinearLayout&gt;
		&lt;/LinearLayout&gt;
	&lt;/RelativeLayout&gt;

	&lt;LinearLayout
		android:id="@+id/play_buttons"
		android:layout_width="fill_parent"
		android:layout_height="wrap_content"
		android:layout_below="@id/gameArea"
		android:gravity="center"
		android:orientation="horizontal" &gt;

		&lt;!-- show achievements --&gt;

		&lt;Button
			android:id="@+id/show_achievements"
			android:layout_width="wrap_content"
			android:layout_height="wrap_content"
			android:text="Achievements" /&gt;

		&lt;!-- show leaderboards --&gt;

		&lt;Button
			android:id="@+id/show_leaderboard"
			android:layout_width="wrap_content"
			android:layout_height="wrap_content"
			android:text="Leaderboard" /&gt;
	&lt;/LinearLayout&gt;

&lt;/RelativeLayout&gt;</pre><p>We add buttons to access both achievements and leaderboards for the app. If you haven't completed&nbsp;the <a href="https://code.tutsplus.com/tutorials/google-play-game-services-achievements--cms-20591" target="_self">achievements tutorial</a>, then you can&nbsp;remove the achievements button.</p><p>Back in your application's <code class="inline">Activity</code>&nbsp;class,&nbsp;we will be using these instance variables:</p><pre class="brush: java">private Button button0, button1, button2, button3, button4, button5,
    button6, button7, button8, button9, buttonAgain;
private int number;
private Random rand;
private TextView info;
private int numGuesses=0;</pre><p>If you completed the achievements tutorial you may notice an additional variable, <code class="inline">numGuesses</code>, to keep track of&nbsp;the number of user guesses each time they play the game.</p><p>You will need the following additional code in the&nbsp;<code class="inline">onCreate</code> method of the <code class="inline">Activity</code> class.&nbsp;If you're not using the achievements button, then&nbsp;remove the line that references it.</p><pre class="brush: java">findViewById(R.id.show_achievements).setOnClickListener(this);
findViewById(R.id.show_leaderboard).setOnClickListener(this);

button0=(Button)findViewById(R.id.btn0);
button1=(Button)findViewById(R.id.btn1);
button2=(Button)findViewById(R.id.btn2);
button3=(Button)findViewById(R.id.btn3);
button4=(Button)findViewById(R.id.btn4);
button5=(Button)findViewById(R.id.btn5);
button6=(Button)findViewById(R.id.btn6);
button7=(Button)findViewById(R.id.btn7);
button8=(Button)findViewById(R.id.btn8);
button9=(Button)findViewById(R.id.btn9);
buttonAgain=(Button)findViewById(R.id.btnAgain);

info=(TextView)findViewById(R.id.guess_text);

rand=new Random();
number=rand.nextInt(10);</pre><p>We also use the following methods for disabling and enabling the buttons during gameplay:</p><pre class="brush: java">private void disableNumbers(){
    button0.setEnabled(false); button0.setTextColor(Color.parseColor("#ff000033"));
	button1.setEnabled(false); button1.setTextColor(Color.parseColor("#ff000033"));
	button2.setEnabled(false); button2.setTextColor(Color.parseColor("#ff000033"));
	button3.setEnabled(false); button3.setTextColor(Color.parseColor("#ff000033"));
	button4.setEnabled(false); button4.setTextColor(Color.parseColor("#ff000033"));
	button5.setEnabled(false); button5.setTextColor(Color.parseColor("#ff000033"));
	button6.setEnabled(false); button6.setTextColor(Color.parseColor("#ff000033"));
	button7.setEnabled(false); button7.setTextColor(Color.parseColor("#ff000033"));
	button8.setEnabled(false); button8.setTextColor(Color.parseColor("#ff000033"));
	button9.setEnabled(false); button9.setTextColor(Color.parseColor("#ff000033"));
	buttonAgain.setEnabled(true); buttonAgain.setTextColor(Color.parseColor("#ff000033"));
}
private void enableNumbers(){
	button0.setEnabled(true); button0.setTextColor(Color.WHITE);
	button1.setEnabled(true); button1.setTextColor(Color.WHITE);
	button2.setEnabled(true); button2.setTextColor(Color.WHITE);
	button3.setEnabled(true); button3.setTextColor(Color.WHITE);
	button4.setEnabled(true); button4.setTextColor(Color.WHITE);
	button5.setEnabled(true); button5.setTextColor(Color.WHITE);
	button6.setEnabled(true); button6.setTextColor(Color.WHITE);
	button7.setEnabled(true); button7.setTextColor(Color.WHITE);
	button8.setEnabled(true); button8.setTextColor(Color.WHITE);
	button9.setEnabled(true); button9.setTextColor(Color.WHITE);
	buttonAgain.setEnabled(false); buttonAgain.setTextColor(Color.parseColor("#ffffff00"));
}</pre><p>We also need the following method we specified as <code class="inline">onClick</code> attribute for the number buttons in the layout. The player taps&nbsp;one of these to make a guess:</p><pre class="brush: java">public void btnPressed(View v){
    int btn = Integer.parseInt(v.getTag().toString());
	if(btn&lt;0){
		//again btn
		numGuesses=0;
		number=rand.nextInt(10);
		enableNumbers();
		info.setText("Set the number!");
	}
	else{
		//number button
		numGuesses++;
		if(btn==number){
			info.setText("Yes! It was "+number);
			if(getApiClient().isConnected()){
				Games.Achievements.unlock(getApiClient(), 
						getString(R.string.correct_guess_achievement));
				Games.Leaderboards.submitScore(getApiClient(), 
						getString(R.string.number_guesses_leaderboard), 
						numGuesses);
			}
			disableNumbers();
		}
		else if(numGuesses==5){
			info.setText("No! It was "+number);
			disableNumbers();
		}
		else
			info.setText("Try again!");
	}
}</pre><p>Take a moment to look over the code. Even&nbsp;if you completed the app in the achievements tutorial, there are some changes to the logic in addition to the extra leaderboard code. If the player taps&nbsp;the <b>Again</b> button, we reset the <code class="inline">numGuesses</code>&nbsp;variable to <code class="inline">0</code>. If the user taps a number button, we increment <code class="inline">numGuesses</code>. If you aren't using achievements, you can remove any code that references achievements.</p><p>We submit the score to the leaderboard when the user guessed correctly. The user can make up to five guesses.</p><p>The key line here is <code class="inline">submitScore</code>. We pass the number of guesses the player took to get the correct number. If the number of guesses is lower than any existing entry for the user in the leaderboard, their entry will be replaced with this new value. Notice that we use the string resource value we defined for the leaderboard.&nbsp;</p><h3>Step 2</h3><p>Before we finish, let's allow the user to view the game leaderboard by tapping the <b>Leaderboard</b> button we added. We used the following code in <code class="inline">onClick</code> for the achievements:</p><pre class="brush: java">else if (view.getId() == R.id.show_achievements){
    startActivityForResult(Games.Achievements.getAchievementsIntent(
		getApiClient()), 1);
}</pre><p>Presenting the leaderboard is similar:</p><pre class="brush: java">else if(view.getId() == R.id.show_leaderboard){
    startActivityForResult(Games.Leaderboards.getLeaderboardIntent(
		getApiClient(), getString(R.string.number_guesses_leaderboard)), 
		2);
}</pre><p>This will let the user see the current standings within the leaderboard. The integer parameter is arbitrary.</p><p>When you run the app, it will attempt to log the user in, checking for permissions, and confirming login if successful:</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/140/posts/20700/image/google-play-game-leaderboards-welcome.png"></figure><p>The user is free to choose to sign out and back in whenever they like, but if they leave the app, it will attempt to automatically log them back in when they open it again. When the user guesses correctly, their score will be submitted to the leaderboard. Pressing the <b>Leaderboard</b> button will present the current standings:</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/140/posts/20700/image/google-play-game-leaderboards-overview.png"></figure><p>From here, the user can access social features of Google Services via their Google account. You can set your apps up to use public and social leaderboards. Social leaderboards present listings of people in the user's circles, which can be managed for the game itself. For a public leaderboard, the user must have opted to share their scores publicly.</p><h2>Conclusion</h2><p>In this tutorial, we have implemented basic leaderboard functionality with Google Play Game Services. Note that&nbsp;you can do much more with leaderboards in your apps. For example, you can request leaderboard data for particular time-scales such as daily, weekly, and all-time. If a leaderboard contains a lot of scores, it is possible for&nbsp;your app to only fetch&nbsp;the top scores or the scores closest to the current player. Try experimenting with some of these enhancements in your own apps.</p><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/20700/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20700/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20700/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20700/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T17:20:00.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T17:20:00.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:9:"Sue Smith";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:2;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21264";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:79:"http://code.tutsplus.com/tutorials/sharing-polymer-components-part-1--cms-21264";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"Sharing Polymer Components: Part 1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:11255:"<p>In my <a href="http://code.tutsplus.com/tutorials/using-polymer-to-create-web-components--cms-20475">last tutorial about the Polymer library</a>, I explained how to take advantage of this great new tool to create reusable web components. The key point of the tutorial and of using components, is to help our development by:</p>

<ul>
<li>Encapsulating much of the complex code and structure</li>
<li>Allowing developers to use a simple-to-use tag style naming convention</li>
<li>Providing a suite of predefined UI elements to leverage and extend</li>
</ul>

<p>I'm still smitten with it and wanted to explore this a little more by checking out a new template the Polymer team released to make deployment and reuse substantially easier.</p>

<h2>The Canonical Path</h2>

<p>One of the quirks of the Polymer development process which I didn't touch on, was the disconnect between developing a component and actually making it available for reuse by others. Let's take a look at a snippet from my previous tutorial:</p>

<pre class="brush: html">&lt;link rel="import" href="../bower_components/polymer/polymer.html"&gt;</pre>

<p>This purpose of this code is to include Polymer core, the main API that allows you to define the custom elements. For local development and testing, this actually works perfectly but unfortunately the path specified will actually prevent you from sharing this component.  The reason for this is because if another user tries to install your element with <a href="http://bower.io/">Bower</a> (which is the preferred installation method), it's going to end up as a sibling of Polymer in their <code>bower_components</code> folder.&nbsp;</p><p>The problem with that, is that the component is going to be looking for <code>../bower_components/polymer/polymer.html</code> which will be an invalid path.  Components must always assume that their dependencies are siblings, so it should actually be looking for <code>../polymer/polymer.html</code>. This the "canonical path." </p>

<p>In chatting with the awesome <a href="https://twitter.com/rob_dodson">Rob Dodson</a> of the Polymer team, he said that the only way around this was to develop using the method I originally outlined and once I was ready to share my component, convert all of my paths that look for <code>bower_components</code> over to <code>../</code> when I'm ready to publish my element. </p>

<p>This is obviously not ideal and I probably could've created some type of Grunt task to parse through my component files to make these updates. Thankfully, the Polymer team has been noodling on this and has come up with a creative solution that they call the <code>untitled-element</code>.</p>

<h2>The <code>untitled-element</code> Template</h2>

<p>When I mention <code><a href="https://github.com/PolymerLabs/untitled-element">untitled-element</a></code>, I'm referring to a new boilerplate that's available to make creating reusable and deployable components substantially easier, by giving you a base foundation to work with. It helps to eliminate the issues I mentioned above by:</p>

<ul>
<li>Providing guidance on proper directory structure</li>
<li>Incorporating an additional component that serves to document your API</li>
<li>Allowing you to easily demo your component during development <em>and</em> when sharing</li>
</ul>

<p>The big win for this, is being able to develop your component without having to go through the trouble of making substantial path changes that are not only cumbersome, but could break your element if you miss something.</p>

<p>Currently, the project is a part of <a href="https://github.com/PolymerLabs/">PolymerLabs</a> as it gets put through its paces, but it's certainly looking pretty solid:</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/45/posts/21264/image/github.png"></figure>

<p>Now the first thing you're going to want to do is create a development directory that will house your new component, as well as all of the Bower components you'll install. I called mine <code>polymerdev</code>. From there, you'll need to go to the <code><a href="https://github.com/PolymerLabs/untitled-element">untitled-element</a></code> Github repo and download it into your new development folder. This is an important step because you <em>need</em> to extract the contents into that folder, to avoid the sibling directory issues that I mentioned previously. </p>

<p>Extracting the <code>.zip</code> file will create a new folder called <code>untitled-element-master</code> which contains the boilerplate files you'll need to create your new component. You'll need to rename a couple of things based on the name of your component. This includes:</p>

<ul>
<li>The <code>untitled-element-master</code> folder</li>
<li><code>untitled-element.html</code></li>
<li><code>untitled-element.css</code></li>
</ul>

<p>I'm going to recreate the Reddit element that I created in my last tutorial, so this is what the changes would look like:</p>

<ul>
<li><code>untitled-element-master</code> -&gt; <code>reddit-element</code></li>
<li><code>untitled-element.html</code> -&gt; <code>reddit-element.html</code></li>
<li><code>untitled-element.css</code> -&gt; <code>reddit-element.css</code></li>
</ul>

<p>Here's what the directory looked like before:</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/45/posts/21264/image/directory.png"></figure>

<p>And here's what it looks like after the updates:</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/45/posts/21264/image/directory-new.png"></figure>

<p>The key thing to understand, is that you'll be working inside of the <code>reddit-element</code> folder when creating your component and in later steps, when we use Bower to install the Polymer components, that directory will be a direct sibling to the newly installed directories. I know I'm really harping on this point but it's an important thing to understand, since it affects your ability to share your component.</p>

<p>To finish this off, you're going to want to update the references to your component name, inside of the following files:</p>

<ul>
<li><code>bower.json</code></li>
<li><code>demo.html</code></li>
<li><code>reddit-element.html</code></li>
</ul>

<p>Each of these files contains references to <code>untitled-element</code> within the code and need to be updated. Remember that any references to <code>untitled-element</code> should be changed to <code>reddit-element</code>. If you want to be absolutely sure, do a global search-and-replace using your editor.</p>

<h2>Getting Setup for Bower</h2>

<p>Since Bower is the preferred method for installing Polymer and sharing components, let's go through a few steps to ensure that we setup the Reddit component's Bower configuration properly.</p>

<p>By default, the boilerplate includes a <code>bower.json</code> file. This file is used to list several things, including the name of the component and any dependencies that need to be installed to use it. Here's what it looks like:</p>

<pre class="brush: javascript">{
  "name": "reddit-element",
  "private": true,
  "dependencies": {
    "polymer": "Polymer/polymer#master"
  }
}
</pre>

<p>First, I'll remove the <code>private</code> property since it'll prevent the component from being listed in the Bower registry. Since it's supposed to be shareable, I want it to be listed. Also, the Reddit component needs to make an Ajax call, so I'm including a dependency on the Polymer <code><a href="https://github.com/Polymer/core-elements">core-elements</a></code> set of components which includes the Ajax functionality that I need. Lastly, I'll add a version number to track this going forward. Here's the end result:</p>

<pre class="brush: javascript">{
  "name": "reddit-element",
  "version": "0.0.1",
  "dependencies": {
    "polymer": "Polymer/polymer#~0.2.3",
    "core-elements": "Polymer/core-elements#~0.2.3",
  }
}</pre>

<p>The last bit of Bower configuration that needs to be done, is to create a file called <code><a href="http://bower.io/#custom-install-directory">.bowerrc</a></code> in the <code>reddit-element</code> folder which defines a custom install location for the dependencies of our component. This is defined as simple JSON data like this:</p>

<pre class="brush: javascript">{
   "directory": "../"
}</pre>

<p>What this essentially does is tells Bower to install any dependencies one level up, so that they're siblings of the <code>reddit-element</code> folder. The reason this is important is because when someone installs our component with Bower, it'll be placed into the <code>bower_components</code> folder as siblings to everything else in there (including Polymer). Structuring things this way, ensures that we're developing in the same way that we'll eventually be sharing. It also allows us to use the canonical path I mentioned above, ensuring a consistent way of referencing other components in our code. </p>

<p>Let's review the differences. If I didn't create the <code>.bowerrc</code> file and ran the <code>bower install</code> command, my directory structure would look like this:</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/45/posts/21264/image/bower-norc.png"></figure>

<p>This installs the <code>bower_components</code> folder directly into the component's directory, which is not what I want. I want the <code>reddit-element</code> folder to be a sibling to all of the dependencies that it needs:</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/45/posts/21264/image/bower-rc.png"></figure>

<p>This method ensures that when a user installs this component using Bower, the component and the dependencies will be installed properly into the <code>bower_components</code> folder.</p>

<p>With the <code>.bowerrc</code> file added to your component's folder and the <code>bower.json</code> setup with the proper dependencies, the next step is to run <code>bower install</code>, to have Bower pull down the appropriate components and add them to the project.</p>

<h2>Coming Up Next</h2>

<p>In this tutorial, I wanted to make sure I laid a solid foundation for how to use the new Polymer boilerplate and some of the rationale behind the design choices that the team has made. </p>

<p>In the next part of this series, I'm going to go over the new documentation component that's included in the boilerplate and how it will make sharing and demoing your component substantially easier. I'll also show you how to setup your component to be shared via the Bower registry.</p><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21264/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21264/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21264/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21264/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T16:59:41.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T16:59:41.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:9:"Rey Bango";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:3;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-20589";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:81:"http://code.tutsplus.com/tutorials/trim-the-bloat-optimize-your-assets--cms-20589";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:36:"Trim the Bloat: Optimize Your Assets";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:9092:"<p>In <a href="http://code.tutsplus.com/tutorials/trim-the-bloat-an-introduction-to-keeping-wordpress-healthy--wp-34934#disqus_thread" rel="external" target="_blank">the first post</a> in this series, we took a look at a few things that we can do in order to keep our WordPress installation healthy. But that's not all we can do.</p><p>In this post, we're going to cover what to do with your assets like stylesheets, JavaScript files, images and more.&nbsp;</p><p>Less is more. That's pretty much the message I'm trying to put forward with this entire series. To that end, I've talked about what to with over-done HTML&nbsp;in the,&nbsp;referenced a couple of resources that will help you get started with writing clean theme code, as well as finding the right plugins.</p><p>Now it's time to focus on our assets: Stylesheets, JavaScripts and images.</p><h2>Styles Go Where They Belong</h2><p>We're all accustomed to writing CSS, right? Even the beginners among us have touched a line of CSS here or there. Ever used a <code class="inline">display:none</code> somewhere? There you go, you applied a style rule.&nbsp;</p><p>In its crudest form, I'm sure we've all used them.&nbsp;The more experienced people will know that it's a good idea to keep your styles where they belong: In your stylesheets. This is primarily a matter of maintainability. If you have inline styles all over your templates you'll get lost trying to find the right place to adjust something, and when you adjust that one thing, you still have to find that five other places that have the same inline style applied to them.</p><p>Putting styles in stylesheet files has another benefit: You can write less to do the same, using generic style rules instead of focused ones, but you could even take it a step further and use a pre-processor.</p><p><a href="http://learnboost.github.io/stylus/" target="_self">Stylus</a>,&nbsp;<a href="http://lesscss.org/" target="_self">LESS</a> and <a href="http://sass-lang.com/" target="_self">Sass</a>&nbsp;are all CSS pre-processors. You can use them to write less code and end up with a cleaner end result. Read that as: Less work, less code, easier to maintain!&nbsp;</p><p>While Stylus is the exception here, both LESS and Sass have WordPress plugins available. If you can avoid using them, do so. There are ways to generate a stylesheet from a <code class="inline">.less</code> and <code class="inline">.sass</code> file just once, without using those plugins.</p><p>Without getting too specific, these pre-processors will allow you to write a lot less code to end up with the same end result. In many cases they will even combine styles together, making your stylesheets cleaner and easier to maintain. A <a href="http://code.tutsplus.com/tutorials/using-css-preprocessors-with-wordpress-less-structures--wp-31533" target="_self">quick tutorial on LESS</a> and <a href="http://code.tutsplus.com/articles/cross-platform-sass-and-compass-in-wordpress--wp-30611" target="_self">one on Sass</a>&nbsp;have existing tutorials right here on Tuts+.&nbsp;</p><p>As to which is better, this is very much based on personal preference. All three of the processors are growing and finding their way. You can find a comparison on the three available processors <a href="http://code.tutsplus.com/tutorials/sass-vs-less-vs-stylus-preprocessor-shootout--net-24320" target="_self">here</a> that will elaborate more extensively on what each of their strengths are.</p><h2>Scripts! All of Them!</h2><p>JavaScript has become an accepted part of web development. A few years ago, we still accepted that it was normal for our visitors to have JavaScript disabled, but that's now the exception, not the rule.</p><p>Personally, I still prefer to build my sites without it and then add the scripts as an enhancement. This has the benefit of letting me keep the scripts down to their bare minimum because the site already works right out-of-the-box without it.</p><p>The only real option to write less JavaScript is to do exactly that. Write less; however, a good tip here is to utilize the jQuery library that comes packaged with WordPress as it is designed specifically to let you write less to achieve the same result but still remain fast and easy to use.</p><h2>Images (They Will Forever Be Too Big)</h2><p>Remember the first post in this series? I mentioned that in the past three years, websites had an absurd increase of 235% in size. Crazy, isn't it? Here's another fact: a large part of that increase comes in the form of images. I doubt anyone is surprised by this as using large images has become somewhat of a design trend, but even so, we should strive to do better.&nbsp;</p><p>But how?</p><p>Make sure that if you're using WordPress to set the right image sizes for your images. No sense in loading a 500x500 image if you're only using a 100x100 version in your design. The next option is to use a service like <a href="http://smush.it" target="_self">smush.it</a>&nbsp;or&nbsp;<a href="http://kraken.io" target="_self">kraken.io</a>. Both have WordPress plugins available and both do roughly the same: They rip out the stuff in the images that you don't need or want, optimize them and return the smallest possible file they can make from your image without losing any quality. Smush.it is a free service, where Kraken has a free solution as well as a paid solution that will optimize your images on the fly.</p><h2>Optimization Is King</h2><p>By now, you can see that I'm all for less. Less code, less images, less everything. End of the road though: Fast as my minimalist systems may be, I still want that extra mile of awesome. I'll make sure my code is as maintainable as it can be, my stylesheets as small as possible, and my scripts short. All that, however, is primarily preparation. After all, I'll still have the end results minified. Using the pre-processor for my stylesheets I'm already able to turn out a minified edition. For scripts there are similar solutions available.</p><p>Here, it's important to make sure your scripts and stylesheets are output using the&nbsp;<code class="inline">wp_enqueue_script</code> and&nbsp;<code class="inline">wp_enqueue_style</code> functions. Don't just throw them in the <code class="inline">head</code> of your template, but use <code class="inline">function.php</code> to enqueue them and let the <code class="inline">wp_head</code> function do the actual output.&nbsp;</p><p>Why is this important? Because if you properly enqueue your scripts and stylesheets the different caching and minifying plugins that are available can properly combine them into one single stylesheet and script.</p><p>Caching? Yes, caching. Next to merging stylesheets and scripts these plugins provide a system to cache the output from the database or even the entire page that gets output. Both will dramatically decrease the amount of time a site will need to load. It's beyond the scope of this series to elaborate extensively on the available caching plugins and their features, <a href="http://hub.tutsplus.com/authors/adam-burucs" target="_self">Adam Burucs</a> wrote <a href="http://code.tutsplus.com/tutorials/wordpress-caching-plugins--wp-26445" target="_self">an article comparing the two biggest caching plugins</a> that's a good place to start if you are looking for some information on the two.</p><h2>External Resources</h2><p>External resources are a bit of an interesting part of it all. On one hand, using an external provider will offload the traffic from your own server. Usually, it will be faster because of browser limitations on the amount of requests that can be sent to one server. But there's a downside. You can't control what comes down from your external host and you need to both trust that the data will remain the same as well as that the host remains available. In some cases it might be a better idea to keep your resources on your own site.<br></p><h2>Wrapping It Up</h2><p>To summarize: keep it lean, make sure your stylesheets and scripts are as small as you can get them, then minify them even further. Upload images at the size you need them and pull them through an optimizer like <a href="http://smush.it" rel="external" target="_blank">smush.it</a> or <a href="http://kraken.io" rel="external" target="_blank">kraken.io</a>. Use a caching plugin as a final endpoint for your output after you've minimized all the elements before introducing any caching.</p><p>There's one more installment left in this series in which we will cover additional references on the topics we've discussed and hopefully provide some additional useful insights.</p><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/20589/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20589/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20589/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20589/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T15:00:00.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T15:00:00.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:9:"Rian Orie";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:4;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21224";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:92:"http://computers.tutsplus.com/tutorials/the-leap-motion-controller-and-mac-part-2--cms-21224";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:42:"The Leap Motion Controller and Mac: Part 2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:9313:"<p>In an earlier&nbsp;tutorial I introduced you to the&nbsp;<a href="http://computers.tutsplus.com/tutorials/the-leap-motion-controller-and-mac-part-1--cms-20927">Leap Motion controller</a>, showed how to set it up and start using apps that support it. I use one of my favourite apps, <i>BetterTouchTool</i>, to <a href="http://computers.tutsplus.com/tutorials/speeding-up-your-workflow-with-custom-trackpad-gestures--mac-60046">create custom trackpad gestures</a>. With this you can also create custom gestures for the Leap Motion Controller.<br></p>

<p>In this tutorial I'll show you how to do this and use BetterTouchTool to integrate Leap Motion Controller gestures into workflows.</p>

<h2>BetterTouchTool</h2>

<p><a href="http://www.boastr.net/">BetterTouchTool</a>&nbsp;is a free, utility app&nbsp;that lets you use custom gestures–on <i>Magic Mouse</i>, <i>Magic Trackpad</i> and now, the <i>Leap Motion Controller</i>–to trigger keyboard shortcuts and system actions. You can assign the same gestures different functions in different applications.</p>

<p>In the tutorial about&nbsp;<a href="http://computers.tutsplus.com/tutorials/speeding-up-your-workflow-with-custom-trackpad-gestures--mac-60046">custom trackpad gestures</a> I explained how to set up BetterTouchTool, import gestures that other people have created and create new gestures. You may find it useful to&nbsp;refer back that tutorial whilst reading this one.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/80/posts/21224/image/leap_btt.jpg"><figcaption>My BetterTouchTool gestures.</figcaption></figure>

<h2>The Gestures</h2>

<p>BetterTouchTool mainly supports gestures in the X-Y plane above the Leap Motion Controller. You can use single finger, two finger, three finger and five finger gestures.&nbsp;</p><p>For example, you can assign different actions to moving your hand with all five fingers extended to the left over the Leap Motion Controller, to the right over it, up away from it or down towards it. </p>

<p>As well as the sixteen simple X-Y gestures, BetterTouchTool offers a number of extra gestures: you can also move one, two, three or five fingers forwards towards your screen and then straight backwards as if you are tapping it, rotate one, two or three fingers clockwise and counter clockwise or clap your hands together.</p>

<p>The best way to have your gestures detected is:</p>

<ul>
<li>Hold your hand in a clenched fist over the device.</li>
<li>Extend the number of fingers required for the gesture you want to perform.</li>
<li>Pause for half a second.</li>
<li>Move your hand in the direction of the gesture.</li>
<li>Re-clench your hand into a fist.</li>
<li>Bring it back to the centre.</li>
<li>Repeat for the next gesture you want to do.</li>
</ul>

<p>If you don’t clench your hand before moving it back to the centre, BetterTouchTool may detect the inverse of the gesture you just performed as you move your hand.</p>

<p>The Leap Motion Controller seems to have the hardest time discerning between one and two finger gestures. If you don’t hold your two fingers sufficiently wide apart when you gesture, it will register them as a single finger; because of this, I prefer to avoid using two finger gestures, or to assign them to the same shortcut as the single finger gestures.</p>

<p>For three finger gestures extending your index finger, middle finger and thumb works best.</p>

<p>The Leap Motion Controller is slightly better at detecting gestures on the X-axis than the Y-axis. If you have a choice, I recommend you assign your most used actions to X-axis gestures.</p>

<h2>Learning the Gestures</h2>

<p>BetterTouchTool has a useful option to show a HUD, or <i>head-up display</i>, notification of what gesture it detects.</p><p>I have created a preset for you to download that has all the gestures set up to show the notification with no assigned shortcuts. Use this preset to practice the gestures and experiment to see how different movements are detected and interpreted.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/80/posts/21224/image/leap_btt_hud.jpg"><figcaption>BetterTouchTool's HUD notifications.</figcaption></figure>

<h2>Incorporating Gestures&nbsp;Into a Workflow</h2>

<p>Compared to keyboard shortcuts or trackpad gestures, it can be a bit harder to work out where Leap Motion gestures fit into your workflow.&nbsp;</p><p>I believe that almost everyone can benefit from learning keyboard shortcuts and creating custom trackpad gestures. The amount of people who’ll benefit hugely from custom Leap Motion gestures is smaller–but I think most power users will certainly have a few uses. </p>

<p>Actions that you want to do quickly, and that your hands might not be on the trackpad or keyboard when you want to do them, work best. For example, the save gesture I use for <a href="http://bywordapp.com" target="_self">Byword</a> lets me save my work as I walk away from the Mac.</p>

<h2>My Gestures</h2>

<p>In addition to being a writer, I am a photographer and designer. I spend a lot of time browsing the web, writing and using Adobe’s Creative Cloud applications–particularly Adobe Photoshop Lightroom. My custom Leap Motion gestures reflect this. </p>

<p>My gestures are available as a preset which you can download and tweak as you desire. You should take my ideas as suggestions rather than something set in stone.</p>

<h3>Web Browsing</h3>

<p>In the previous tutorial with BetterTouchTool, I used three finger trackpad gestures to move between tabs, open new tabs, close tabs and reopen recently closed tabs.&nbsp;</p><p>For my Leap Motion gestures, I used the same gestures to keep everything consistent. Moving three fingers up opens a new tab (and reopens the last closed tab if the shift key is held), moving them down closes one. Moving three fingers to the left or right moves over a tab. </p>

<p>I use <a href="http://computers.tutsplus.com/tutorials/an-in-depth-look-at-1password-4--mac-53259">password manager 1Password</a> to create really secure passwords for all my online accounts. 1Password uses the keyboard shortcut <b>Command-_</b> to automatically fill in your login details. I mapped this shortcut to the clap gesture.</p>

<h3>Byword</h3>

<p>I use Byword to&nbsp;<a href="http://computers.tutsplus.com/tutorials/introducing-markdown-on-os-x--cms-20764">write tutorials in Markdown</a>. There are two features of Byword I have mapped to Leap Motion gestures:&nbsp;</p><ul><li>a three finger gesture right triggers the keyboard shortcut <strong>Command-S</strong> which saves the document, and&nbsp;</li><li>a three finger gesture left triggers <strong>Command-Option-P</strong> which activates Byword’s Markdown previewer.</li></ul>

<h3>Lightroom</h3>

<p>In Lightroom I use the three fingers right and left gestures to quickly pick or reject imported photos. It is extremely satisfying to sit back, put the new photos on fullscreen and, with a casual gesture, determine their fate!</p>

<h3>Quicktime and VLC</h3>

<p>One of the things I’ve found the Leap Motion Controller most useful for is controlling media playback on my Mac. You can relax and control the movie you are watching just by waving your hands.&nbsp;</p><p>I use a three finger gesture right to play or pause the movie with the <strong>Spacebar</strong> key. A single finger rotating clockwise increases the volume and a single finger rotating counter clockwise lowers it.</p>

<h3>Global</h3>

<p>I use a grid of virtual desktops created with <a href="http://totalspaces.binaryage.com" target="_self">TotalSpaces2</a>. I showed <a href="http://computers.tutsplus.com/tutorials/improve-productivity-with-virtual-desktops-from-totalspaces2--mac-59731">how to create this set up in a previous tutorial</a>. I set up the keyboard shortcut <strong>Control-Option-Shift</strong> and the <strong>Arrow Keys</strong> to navigate around the grid.&nbsp;</p><p>I mapped these shortcuts to a five finger gesture in the opposite direction of the <b>Space</b> I want to move to. In an almost <i>Minority Report</i> like manner, I can reach out with five fingers and, as if I’m touching the screen, gesture to move to a different <b>Space</b>.</p>

<h2>Conclusion</h2>

<p>In this tutorial I’ve shown you how to integrate a Leap Motion Controller and BetterTouchTool into your workflows.&nbsp;</p><p>With the two sets of BetterTouchTool presets I have included, the practice preset and my custom gestures preset, I have given you a base to work from when developing your own custom Leap Motion gestures.</p>

<p>If you have any suggestions for great Leap Motion gestures please let me know in the comments. I’m always keen to hear other people’s ideas.</p><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21224/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21224/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21224/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21224/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T14:00:00.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T14:00:00.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:14:"Harry Guinness";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:5;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-20292";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:114:"http://design.tutsplus.com/tutorials/how-to-create-a-stylish-black-and-gold-3d-text-effect-in-photoshop--cms-20292";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:66:"How to Create a Stylish Black and Gold 3D Text Effect in Photoshop";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:21715:"<figure class="final-product final-product--image"><img src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/final_image/Stay Cool Text Effect - Final.jpg" alt="Final product image" /><figcaption>What You'll Be Creating</figcaption></figure><p>Adobe Photoshop's vector and 3D capabilities are a powerful combination, and can be used to create some fun and amazing 3D effects. In this tutorial, I will show you how to create a stylish black and gold 3D text effect using vector shapes, 3D meshes and materials. Let's get started!</p><h2>Tutorial Assets</h2><p>The following assets were used during the production of this tutorial.</p><ul>
	<li><a href="http://www.fontsner.com/font/SansSerifExbFLF-70877.html">Sans Serif Exb FLF</a>&nbsp;font.</li>
	<li><a href="http://webtreatsetc.deviantart.com/art/Malleable-Metal-Patterns-144759801">Malleable Metal Patterns</a>&nbsp;by WebTreatsETC.</li>
</ul>


<h2><span class="sectionnum">1.</span> Create the Background and Text Shape</h2>

<h3>Step 1</h3>

<p>Create a new <strong>1500 </strong>by<strong> 1250 px</strong> document, and fill the <strong>Background</strong> with the color <code>#DBDBDB</code>.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_01_1.jpg"></figure>

<h3>Step 2</h3>

<p>Create the text in all caps using the color <code>#6d6d6d</code>, the font <strong>Sans Serif Exb FLF</strong>, and the font <strong>Size</strong>&nbsp;set to <b>370 pt</b>. Set the <strong>Leading</strong> value to <b>200</b>, the <strong>Kerning</strong> to <b>Optical</b>, and the <strong>Tracking</strong> to <b>50</b>. </p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_01_2.jpg"></figure>

<h3>Step 3</h3>

<p>Go to <strong>Type &gt; Convert to Shape</strong>, to convert the text layer into a shape layer.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_01_3.jpg"></figure>




<h2><span class="sectionnum">2.</span> Adjust the Letters</h2>

<h3>Step 1</h3>

<p>Pick the <strong>Path Selection Tool</strong>, then click each letter to select it, and drag it to move it around, or use the arrow<strong> </strong>keys to do so.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_02_1.jpg"></figure>

<h3>Step 2</h3>

<p>Follow the same steps to place all the letters as you like in the document.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_02_2.jpg"></figure>



<h2><span class="sectionnum">3.</span> Create the Outer Stroke</h2>

<h3>Step 1</h3>

<p>Duplicate the text shape layer, and rename the copy to <strong>Stroke</strong>.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_03_1.jpg"></figure>

<h3>Step 2</h3>

<p>With the <strong>Path Selection Tool</strong> still selected, in the <strong>Options</strong> bar, change the <strong>Fill</strong> to <b>None</b>, and the <strong>Stroke Width</strong> to <b>5 pt</b>. Then, click the <strong>Set shape stroke type</strong> icon, change the <strong>Align</strong> to <b>Outside</b>, and click the <strong>More Options</strong> button.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_03_2.jpg"></figure>

<h3>Step 3</h3>

<p>Change the rest of the options as shown below:</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_03_3.jpg"></figure>



<h2><span class="sectionnum">4.</span> Create the Glass Shelves</h2>

<h3>Step 1</h3>

<p>Pick the <strong>Rounded Rectangle Tool</strong>, make sure that the <strong>Shape</strong> option is active in the <strong>Options</strong> bar, then set the <strong>Radius</strong> to <b>1</b>, and click the <strong>Geometry Options</strong> icon. Choose the <strong>Fixed Size</strong> option, and type in <b>90</b> for the <strong>Width</strong> and <b>10</b> for the <strong>Height</strong>.</p>

<p>Create a new layer on top of the <strong>Stroke</strong> layer, call it <strong>Glass</strong>, then click and drag to place a rounded rectangle right below the first letter's stroke.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_04_1.jpg"></figure>

<h3>Step 2</h3>

<p>Use a darker color for the rounded rectangle shape, and select the <strong>Combine Shapes</strong> icon in the <strong>Options</strong> bar.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_04_2.jpg"></figure>

<h3>Step 3</h3>

<p>Start adding rounded rectangles for the rest of the letters.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_04_3.jpg"></figure>

<h3>Step 4</h3>

<p>Once you're done, duplicate the original text shape's layer, and rename the copy to <b>Stay Cool&nbsp;Back</b>.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_04_4.jpg"></figure>





<h2><span class="sectionnum">5.</span> Create the 3D Shapes</h2>

<h3>Step 1</h3>

<p>For each shape layer you have, select it, then go to <strong>3D &gt; New 3D Extrusion from Selected Path</strong>. This will convert the shape layers into 3D ones.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_05_1.jpg"></figure>

<h3>Step 2</h3>

<p>Duplicate the <strong>Background</strong> layer twice, drag the copy layers to the top of the <strong>Layers</strong> panel, and rename them to <strong>Wall</strong> and <strong>Ground</strong>.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_05_2.jpg"></figure>

<h3>Step 3</h3>

<p>For each of the two layers, select it then go to <strong>3D &gt; New Mesh from Layer &gt; Postcard</strong>.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_05_3.jpg"></figure>




<h2><span class="sectionnum">6.</span> Manipulate the 3D Scene</h2>

<h3>Step 1</h3>

<p>To access the 3D mesh settings and properties, you'll need to open two panels: The <strong>3D</strong> panel, and the <strong>Properties</strong> panel (both found under the <strong>Window</strong> menu). The <strong>3D</strong> panel has all the components of the 3D scene, and when you click the name of any of those, you’ll be able to access its settings in the <strong>Properties</strong> panel. So make sure to always select the name of the element you want to modify in the 3D panel before you change its settings in the <b>Properties</b> panel.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_06_1.jpg"></figure>

<h3>Step 2</h3>

<p>For the <strong>Ground</strong> layer, select its mesh name in the <strong>3D</strong> panel, then, in the <strong>Properties</strong> panel, click the <strong>Coordinates</strong> icon at the top, and change the <strong>X-Rotation</strong> value to <b>90</b>. This will rotate the plane <b>90°</b> so that it is perpendicular to the <b>Wall</b> plane.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_06_2.jpg"></figure>

<h3>Step 3</h3>

<p>Select all the 3D layers you have, then go to <strong>3D &gt; Merge 3D Layers</strong>. This will place all the 3D meshes in one scene.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_06_3.jpg"></figure>

<h3>Step 4</h3>

<p>Select the <strong>Move Tool</strong> and check its <strong>Options</strong> bar. You'll find a set of <strong>3D Modes</strong> for the tool to the right of the bar. When you choose one of those, you can then click and drag to perform any changes (on the selected element in the 3D panel). So with the <strong>Current View</strong> tab in the <strong>3D</strong> panel selected, you can click and drag to change the <strong>Camera View</strong> you have.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_06_4.jpg"></figure>



<h2><span class="sectionnum">7.</span> Modify the Meshes</h2>

<h3>Step 1</h3>

<p>Select both the original text and the back mesh names in the <strong>3D</strong> panel, then change their <strong>Extrusion Depth</strong> value to <b>20</b>.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_07_1.jpg"></figure>

<h3>Step 2</h3>

<p>Select the original text mesh name, click the <strong>Cap</strong> icon in the <strong>Properties</strong> panel, choose the Front side from the <strong>Sides</strong> drop down menu, then change the <strong>Bevel Width</strong> to <b>10</b>, the <strong>Contour</strong> to <b>Rolling Slope - Descending</b>, and the <strong>Inflate Angle</strong> to <b>-45</b>.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_07_2.jpg"></figure>

<h3>Step 3</h3>

<p>For the Back mesh, choose the Back side from the <strong>Sides</strong> drop down menu, change the <strong>Bevel Width</strong> to <b>10</b>, the <strong>Contour</strong> to <b>Rolling Slope - Descending</b>, and the <strong>Inflate Angle</strong> to <b>45</b>.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_07_3.jpg"></figure>

<h3>Step 4</h3>

<p>Change the Stroke mesh <strong>Extrusion Depth</strong> to <b>150</b>.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_07_4.jpg"></figure>

<h3>Step 5</h3>

<p>Then change its <strong>Bevel Width</strong> to <b>10</b>, and the <strong>Contour</strong> to <b>Half Round</b>.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_07_5.jpg"></figure>

<h3>Step 6</h3>

<p>For the Glass mesh, leave the <strong>Extrusion Depth</strong> at <b>481</b>.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_07_6.jpg"></figure>

<h3>Step 7</h3>

<p>And just change the <strong>Bevel Width</strong> to <b>10</b>.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_07_7.jpg"></figure>

<h3>Step 8</h3>

<p>Finally, for both plane layers, un-check the <strong>Cast Shadows</strong> box.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_07_8.jpg"></figure>




<h2><span class="sectionnum">8.</span> Create the Materials</h2>

<h3>Step 1</h3>

<p>Select the <strong>Front Inflation Material</strong> tab for the original text mesh, and the <strong>Back Inflation Material</strong> tab for the Back text mesh. Then, click the <strong>Diffuse</strong> texture icon, and choose <strong>Remove Texture</strong>. <em>You'll need to do that for all the other materials as well</em> when you modify them.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_08_1.jpg"></figure>

<h3>Step 2</h3>

<p>Change the rest of the <strong>Settings</strong> as shown below:</p>

<ul>
<li><strong>Diffuse:</strong> <code>#575757</code></li>
<li><strong>Specular:</strong> <code>#606060</code></li>
<li><strong>Illumination:</strong> <code>#000000</code></li>
<li><strong>Ambient:</strong> <code>#000000</code></li>
</ul>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_08_2.jpg"></figure>

<h3>Step 3</h3>

<p>Select the <strong>Font Bevel</strong>, <strong>Extrusion</strong>, and <strong>Back Bevel</strong> material tabs for both the original and Back text meshes as well, and change their <strong>Settings</strong> as shown below:</p>

<ul>
<li><strong>Diffuse:</strong> <code>#d4d4d4</code></li>
<li><strong>Specular:</strong> <code>#67666b</code></li>
<li><strong>Illumination:</strong> <code>#080808</code></li>
<li><strong>Ambient:</strong> <code>#000000</code></li>
</ul>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_08_3.jpg"></figure>

<h3>Step 4</h3>

<p>Select the <strong>Back Inflation Material</strong> tab for the original text mesh, and the <strong>Front Inflation Material</strong> tab for the Back text mesh, and change the <strong>Settings</strong> as shown below:</p>

<ul>
<li><strong>Diffuse:</strong> <code>#b4b4b4</code></li>
<li><strong>Specular:</strong> <code>#65666a</code></li>
<li><strong>Illumination:</strong> <code>#080808</code></li>
<li><strong>Ambient:</strong> <code>#000000</code></li>
</ul>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_08_4.jpg"></figure>

<h3>Step 5</h3>

<p>Select all the <strong>Stroke</strong> material tabs to change their <strong>Settings</strong>:</p>

<ul>
<li><strong>Diffuse:</strong> <code>#a3671f</code></li>
<li><strong>Specular:</strong> <code>#cab171</code></li>
<li><strong>Illumination:</strong> <code>#080808</code></li>
<li><strong>Ambient:</strong> <code>#000000</code></li>
</ul>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_08_5.jpg"></figure>

<h3>Step 6</h3>

<p>Select all the <strong>Glass</strong> material tabs to change their <strong>Settings</strong>:</p>

<ul>
<li><strong>Diffuse:</strong> <code>#ffffff</code></li>
<li><strong>Specular:</strong> <code>#c2c2c2</code></li>
<li><strong>Illumination:</strong> <code>#080808</code></li>
<li><strong>Ambient:</strong> <code>#000000</code></li>
</ul>


<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_08_6.jpg"></figure>

<h3>Step 7</h3>

<p>The <strong>Wall</strong> material <strong>Settings</strong>:</p>

<ul>
<li><strong>Diffuse:</strong> <code>#DBDBDB</code></li>
<li><strong>Specular:</strong> <code>#a3a3a3</code></li>
<li><strong>Illumination:</strong> <code>#080808</code></li>
<li><strong>Ambient:</strong> <code>#000000</code></li>
</ul>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_08_7.jpg"></figure>

<h3>Step 8</h3>

<p>The <strong>Ground</strong> material <strong>Settings</strong>:</p>

<ul>
<li><strong>Diffuse:</strong> <code>#d4d4d4</code></li>
<li><strong>Specular:</strong> <code>#67666b</code></li>
<li><strong>Illumination:</strong> <code>#080808</code></li>
<li><strong>Ambient:</strong> <code>#000000</code></li>
</ul>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_08_8.jpg"></figure>

<h3>Step 9</h3>

<p>Pick the <strong>Move Tool</strong>, and use the <strong>3D Axis</strong> to move the meshes and place them as you like in the Scene. The arrows at the ends of the 3D Axis move the mesh, the part below them is used for rotation, and the cubes are used for scaling. The cube in the center is used to scale the object uniformly. All you need to do is click and drag the part you need to perform the changes on.</p>

<p>You can also change the <b>Camera View</b> if needed to see how the meshes look from different angles.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_08_9.jpg"></figure>

<h2><span class="sectionnum">9.</span> Modify the Lights</h2>

<h3>Step 1</h3>

<p>Select the <strong>Infinite Light 1</strong> tab, then change its color to <code>#bfb7ac</code>, its <strong>Intensity</strong> to <b>30%</b>, and its <strong>Shadow Softness</strong> to <b>20%</b>.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_09_1.jpg"></figure>

<h3>Step 2</h3>

<p>You can then use the <strong>Move Tool</strong> to move the light around in the scene as you like, or use the <strong>Coordinates</strong> values shown below.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_09_2.jpg"></figure>

<h3>Step 3</h3>

<p>Click the <strong>Add new light to Scene</strong> icon down the <strong>3D</strong> panel, and choose <strong>New Point Light</strong>.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_09_3.jpg"></figure>

<h3>Step 4</h3>

<p>Change the Point Light's <strong>Intensity</strong> to <b>20%</b>, and un-check its <strong>Shadow</strong> box.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_09_4.jpg"></figure>

<h3>Step 5</h3>

<p>Place the <strong>Point Light</strong> behind the text, slightly to the top. You can use the <strong>Coordinates</strong> values used in this tutorial as well.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_09_5.jpg"></figure>

<h3>Step 6</h3>

<p>Click the <strong>Environment</strong> tab in the <strong>3D</strong> panel, then click the <strong>IBL</strong> texture icon in the <strong>Properties</strong> panel, and choose <strong>Replace Texture</strong>.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_09_6.jpg"></figure>

<h3>Step 7</h3>

<p>Open the <strong>_aaalplplllpplpw2p1lpmlaqmmmklsi.jpg</strong> image from the <strong>Malleable Metal Patterns</strong> pack, then change the <strong>Intensity</strong> value to <b>50%</b>.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_09_7.jpg"></figure>




<h2><span class="sectionnum">10.</span> Adjust the Meshes and Render</h2>

<h3>Step 1</h3>

<p>Click the Back mesh name, then move it to the back so that it shows from behind the golden bars.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_10_1.jpg"></figure>

<h3>Step 2</h3>

<p>You can then select a mesh or a couple of meshes and move them around in the scene, as well as change the camera view until you like the result you get.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_10_2.jpg"></figure>

<h3>Step 3</h3>

<p>Make sure that the Ground mesh is not below the scene's original <strong>Ground Plane</strong>, then go to <strong>3D &gt; Render</strong>. The rendering might take some time, but you can stop it anytime be pressing the <strong>Esc</strong> key.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_10_3.jpg"></figure>





<h2><span class="sectionnum">11.</span> Adjust the Colors</h2>

<h3>Step 1</h3>

<p>Once the rendering is done, make sure to save the file.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_11_1.jpg"></figure>

<h3>Step 2</h3>

<p>Go to <strong>Select &gt; All</strong>, then <strong>Edit &gt; Copy</strong>, and <strong>Edit &gt; Paste</strong>.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_11_2.jpg"></figure>

<h3>Step 3</h3>

<p>Change the pasted Layer's <strong>Blend Mode</strong> to <b>Soft Light</b>, and its <strong>Opacity</strong> to <b>35%</b>. This will make the final result look more vivid and vibrant.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/image/Step_11_3.jpg"></figure>



<h2>Congratulations! You're done.</h2>
<p>In this tutorial, I showed you how to create a text layer, convert it into a shape layer, and then how to re-position the letters on your canvas. After that, I showed you how to duplicate those letters to create an outer stoke. A few rectangles were added to create the shelves for the letters.</p><p>Once that was done, I then showed you how to convert those shapes into 3D objects, apply materials to them, and finally how to light and render the scene. I hope that you found this tutorial helpful and can use the techniques that you learned in a project of your own.&nbsp;Please feel free to share your results in the comments below.</p>

<figure><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/166/posts/20292/final_image/Stay%20Cool%20Text%20Effect%20-%20Final.jpg"></figure><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/20292/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20292/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20292/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20292/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T12:45:00.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T12:45:00.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:4:"Rose";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:6;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-20952";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:105:"http://design.tutsplus.com/tutorials/create-a-gentle-flat-oriental-pattern-in-adobe-illustator--cms-20952";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:57:"Create a Gentle Flat Oriental Pattern in Adobe Illustator";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:17479:"<figure class="final-product final-product--image"><img src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/final_image/oriental_pattern_tuts.jpg" alt="Final product image" /><figcaption>What You'll Be Creating</figcaption></figure><p>In this
tutorial we will make a simple yet beautiful oriental pattern in Adobe
Illustrator. Various objects of Asian culture will be created with basic shapes
and then combined into a neat composition, forming a seamless pattern, that
will fit perfectly as a background for your blog, an ornamental wrapping paper
for your gift or a festive piece of fabric for clothing. Interested? Let’s get
started then!</p><h2><span class="sectionnum">1.</span> Create Traditional Paper Lanterns</h2><h3>Step 1</h3><p>We’ll start
by forming the first element of our texture – a red paper lantern. Firstly,
make a rectangle using the <strong>Rectangle
Tool (M)</strong> and fill it with pure red color. Secondly, go to <strong>Effect &gt; Stylize &gt; Round</strong> corners
and set the<strong> Radius</strong> to approximately<strong> 30 px,</strong> to give our shape a lantern
look.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/1-oriental-pattern-lantern.jpg"></figure><h3>Step 2</h3><p>Add a small
rectangle on top of the basic lantern shape and press the <strong>Enter</strong>. Set the <strong>Vertical</strong>
value in the pop-up <strong>Move</strong> window to <strong>-3 px</strong> in order to separate the
rectangle from the lantern and to maintain our simple style.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/2-oriental-pattern-lantern.jpg"></figure><h3>Step 3</h3><p>Add a thin
white stripe using the <strong>Rectangle Tool
(M)</strong> again, hold the <strong>Alt</strong> key and <strong>drag</strong> the stripe down a bit, so that we
get the copy of our first stripe. Hit the <strong>Control-D</strong>
combination a few times to repeat your last action, creating more copies. Use
the <strong>Shape Builder Tool (Shift-M)</strong> to
cut off those parts you don’t need.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/3-oriental-pattern-lantern.jpg"></figure><p><br></p><h3>Step 4</h3><p>Let’s add a
white shape using the <strong>Ellipse Tool (L)</strong>
and put it into the center&nbsp; with the help
of the <strong>Align </strong>panel.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/4-oriental-pattern-lantern.jpg"></figure><h3>Step 5</h3><p>Further, we
need to add a tiny handle on top of our lantern. Make an oval shape with the <strong>Ellipse tool (L).</strong> Set the stroke to <strong>2px</strong> and switch it to red color. We
need only the upper arc of the ellipse, so we’ll use the <strong>Scissors Tool (S)</strong> to <strong>click</strong>
on side anchor points of the ellipse and break it apart. Then just delete
the unneeded part (blue on the screenshot). Check the <strong>Stroke</strong> options window to set the <strong>Cap</strong> and <strong>Corner </strong>to middle
positions<strong>&nbsp;(Round).</strong></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/5-oriental-pattern-lantern.jpg"></figure><h3>Step 6</h3><p>Add a few
simple details to make our lantern more eye-catching. Add several stripes and
edit them using the <strong>Shape Builder Tool
(Shift-M).</strong> Put a red spot in the center of our lantern, so that it reminds
a Japanese banner.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/6-oriental-pattern-lantern.jpg"></figure><h3>Step 7</h3><p>Let’s form
a second lantern, but of the other shape. Make an ellipse and place a handle
from the red lantern. Add a thin white line using the <strong>Line Segment Tool (\)</strong> and go to <strong>Effect &gt; Warp &gt; Arc.</strong>&nbsp; Set the <b>Bend</b> slider to -<b>68%.</b> The
line will become arched, following the form of our lantern and making it more
dimensional. Make the line dashed using the <strong>Stroke</strong> panel and add the finishing touch by drawing a fringe in the bottom of our lantern.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/21-oriental-pattern-yellowlantern.jpg"></figure><h3>Step 8</h3><p>Vary the
length of the fringe elements and add a festive lace to the bottom of our
lantern.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/22-oriental-pattern-yellowlantern.jpg"></figure><h2><span class="sectionnum">2.</span>&nbsp;Render
a Bamboo Fence</h2><h3>Step 1</h3><p>An essential part of Asian
pattern is a bamboo. Let’s make one! Draw a shape using the <strong>Rectangle Tool (M)</strong> and transform it by
selecting the side anchor points with <strong>Direct
Selection Tool (A)</strong> and moving them closer to the center. Make several
copies of the bamboo and put the segments one above another. Duplicate the
column and form a fence by varying the height of separate segments.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/7-oriental-pattern-bamboo.jpg"></figure><h3>Step 2</h3><p>Move on and
make a simple brush for the leaves. Draw an oval with the <strong>Ellipse Tool (L)</strong> and convert the upper and lower anchor points to
corner, making them sharp. Drag and drop the leaf to the <strong>Brushes </strong>panel and create the <strong>Art
Brush,</strong> leaving the settings as default.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/8-oriental-pattern-bamboo.jpg"></figure><h3>Step 3</h3><p>Grab the <strong>Paintbrush Tool (B)</strong> and draw a few
leaves around our fence.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/9-oriental-pattern-bamboo.jpg"></figure><h2><span class="sectionnum">3.</span> Form a
Gentle Sakura Blossom</h2><h3>Step 1</h3><p>Beautiful
eastern culture always reminds me of soft cherry petals. In order to make one, start
by forming a shape with the <strong>Ellipse Tool
(L)</strong>. Cut off a segment from the ellipse by adding a triangle above the
shape and modifying it with the <strong>Shape
Builder Tool (Shift-M). </strong>Now we have something like a hoof-print. Convert
the lower anchor point to corner by clicking it with the <strong>Convert Anchor Point Tool (Shift-C). </strong>Finally, select both side
anchor points and move them up a bit, to make the upper part of the petal
wider.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/10-oriental-pattern-sakura.jpg"></figure><h3>Step 2</h3><p>Now we can
shape our petals into a nice cherry blossom. Add a small circle under the
petal. Take the <strong>Rotate Tool (R)</strong>,
hold the <strong>Alt</strong> key and click into the
center of the circle. This will be our pivot point, over which we’ll be
rotating the copies of the petal. Release the mouse button, set the <strong>Rotate Angle</strong> to <strong>70 degrees</strong> in the pop-up options window and hit the <strong>Copy</strong> button. Press <strong>Control-D</strong> several times to repeat the last action, thus forming a
flower.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/11-oriental-pattern-sakura.jpg"></figure><h3>Step 3</h3><p>Add simple
details to make the flower more fancy. Draw several lines with <strong>Line Segment Tool (\)</strong> and decorate them
with circles.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/12-oriental-pattern-sakura.jpg"></figure><h3>Step 4</h3><p>Group the
created decorative elements and use the same trick with the <strong>Rotate Tool (R)</strong> to add them to every
petal. </p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/13-oriental-pattern-sakura.jpg"></figure><h2><span class="sectionnum">4.</span>&nbsp;Render an Ornate Red Fan</h2><h3>Step 1</h3><p>Start by
drawing a rectangle and transform it by moving its lower anchor points closer
to the center. Go to <strong>Effect &gt; Stylize
&gt; Round Corners</strong> and set the <strong>Radius</strong>
to <strong>3 px</strong> to make the shape more
smooth. Add a thin stick with the <strong>Rectangle
Tool (M), Sent </strong>it <strong>to Back (Shift-Control-[)
</strong>and <strong>Align to Key Object</strong>, thus
putting the stick in the center of the red shape.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/14-oriental-pattern-fan.jpg"></figure><h3>Step 2</h3><p>Now we need
to form a fan. Use the <strong>Rotate Tool (R) </strong>by
holding the<strong> Alt</strong> key and clicking at
the bottom of the stick. Set the <strong>Rotate
Angle</strong> to <strong>15 degrees</strong> and hit the <strong>Copy</strong> button. Press <strong>Control-D,</strong> forming the left part of our fan. Use the <strong>Reflect Tool (O)</strong> to reflect the created
group of objects over the vertical axis.&nbsp;</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/15-oriental-pattern-fan.jpg"></figure><h3>Step 3</h3><p>Let’s make
our fan more whimsy and ornate. Draw a squashed ellipse and convert its side
anchor points to corners. Go to <strong>Effect
&gt; Warp &gt; Flag</strong> and set the <strong>Bend</strong>
value to maximum. <strong>Object &gt; Expand
Appearance</strong> of our shape and decorate the fan with newly created wavy lines.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/16-oriental-pattern-fan.jpg"></figure><h3>Step 5</h3><p>Create a <strong>10-sides Polygon</strong> and go to <strong>Effect &gt; Distort &amp; Transform &gt;
Pucker &amp; Bloat</strong> to make a simple flower by moving the slider to the <strong>Bloat</strong> side.&nbsp;Don't forget to apply <b>Object &gt; Expand Appearance</b> to your flower.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/17-oriental-pattern-fan.jpg"></figure><h3>Step 6</h3><p>Decorate
our fan with flowers, varying the size of each element. Select all the red
shapes, <strong>Copy</strong> and <strong>Paste in Front</strong>. <strong>Unite</strong> the shapes in <strong>Pathfinder</strong>
and use the <strong>Shape Builder Tool (Shift-M)</strong>
to delete the unneeded parts, which left outside of the fan.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/18-oriental-pattern-fan.jpg"></figure><p>Make the
ornament fill a bit darker, add a small circle handle in the bottom and –
voila! – our fan is completed.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/19-oriental-pattern-fan.jpg"></figure><h2><span class="sectionnum">5.</span> Add Some
Zen Garden Stones</h2><h3>Step 1 </h3><p>Let’s add
harmony to our composition by drawing a few smooth stones. Shape the first stone
out of the ellipse by moving its anchor handles with <strong>Direct Selection Tool (A)</strong> and making the right part of the object
narrower. Add another ellipse above the first one and reshape it to fit the composition. Add a small stone on top and use the leaf brush that we've made for the bamboo fence to add some cute leaves on both sides of the stones.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/20-oriental-pattern-stones.jpg"></figure><h2><span class="sectionnum">6.</span> Render
a Japanese Gate</h2><h3>Step 1</h3><p>The only
tool we need to create the stylized Japanese Gate is the <strong>Rectangle Tool (M).</strong> Create two rectangles, one above the other,
making the lower rectangle slightly smaller. Add the pillars by
placing another rectangle at one side of the gate and rotating it a bit. <strong>Reflect</strong> the pillar over the vertical
axis and place its copy on the other side of the gate. Add some minor details,
making the gate more fancy.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/23-oriental-pattern-gates.jpg"></figure><h3>Step 2<br></h3><p>Change the
fill color of the elements to bright red and orange that we’ve used in our
palette. Select the upper part of the gate and go to <strong>Effect &gt; Warp &gt; Arc,</strong> setting the <strong>Bend</strong> value to approximately -<strong>7%.</strong>
Add some dark stripes in the bottom of the pillars. Use the <strong>Eraser Tool (Shift-E)</strong>&nbsp;with <b>1 pt</b> size to separate the
parts of the gate from each other by holding the <strong>Shift</strong> key to move the tool straight horizontally.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/24-oriental-pattern-gates.jpg"></figure><h2><span class="sectionnum">7.</span> Compose
a Neat Oriental Pattern</h2><p>All the
elements of our composition are ready! You can change the colors to your liking. Here I've made them a little more pale.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/25-oriental-pattern-gates.jpg"></figure><h3>Step 1</h3><p>Now the fun
part! Select all the elements and go to <strong>Object
&gt; Pattern &gt; Make,</strong>&nbsp;entering into the <strong>Pattern</strong> mode. You can play with the settings in the <b>Pattern Options</b>
window, however the only thing I change here it the <strong>Width and Height (600x600 px).</strong> We make the tile square, so that our pattern remains seamless
and we can use it not only for filling the shapes that we’re creating in AI, but we’re be able to export out pattern and use it for any purpose – print, set as
a background, etc. </p><p>Spread the
elements around the canvas and you’ll see how your pattern will look like with
the help of semi-transparent copies of our objects.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/26-oriental-pattern-pattern.jpg"></figure><h3>Step 2</h3><p>Copy the
blossoms and recolor them according to the overall color palette. Add more
copies of the blossoms behind all other objects, making them
more transparent by lowering the <strong>Opacity</strong>
in the <strong>Transparency </strong>panel.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/27-oriental-pattern-pattern.jpg"></figure><h3>Step 3</h3><p>Continue
adding more elements in order to get rid of blank spaces. Add the
semi-transparent copies of the bamboo fence and spread the circles and simple
flowers all over the canvas.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/28-oriental-pattern-pattern.jpg"></figure><h3>Step 4</h3><p>Exit the <strong>Pattern Mode</strong> by pressing&nbsp;<strong>Done</strong>&nbsp;in the control panel
above or just clicking twice on the empty space outside the Artboard. Now you
can find your pattern in the <strong>Swatches</strong>
panel and edit it anytime by clicking the <strong>Swatch
Options</strong> button.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/29-oriental-pattern-pattern.jpg"></figure><h2>Congratulations!
Our Gentle Oriental Pattern is finished!</h2><p>Now you
have a nice seamless pattern that can be used anywhere you like. Hope you’ve
enjoyed the tutorial and discovered some useful things! Good luck in making new
patterns!</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/107/posts/20952/image/oriental_pattern_tuts.jpg"></figure><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/20952/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20952/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20952/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20952/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T12:12:00.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T12:12:00.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:14:"Yulia Sokolova";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:7;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-20549";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:73:"http://design.tutsplus.com/articles/color-fundamentals-shading--cms-20549";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:27:"Color Fundamentals: Shading";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:33486:"<p>We tend to see color as an attribute of every material thing, and light as a factor that can change it. Tomato is red, grass is green, and light can only add a tint or shade to it, right...? Wrong.&nbsp;</p><p>Color doesn't exist universally - it's the effect of our vision mechanism, fueled by light. No light, no color, and you can notice this easily when it's dark. It's not that darkness "covers" the colors - it's light what creates them! If it sounds revolutionary to you, keep on reading - there's no more important thing to understand for an artist. Also, make sure to read <a href="http://design.tutsplus.com/articles/improve-your-artwork-by-learning-to-see-light-and-shadow--cms-20282" target="_self">the first article of the series</a> before trying this one - it's a great introduction to shading.<br></p><h2>What is Color?</h2><p>Let's take a little physics revision. Don't worry, I'll make it as simple as possible! Some objects are able to emit radiation, what that means is they throw a bunch of particles (or waves) in various directions. Light is a kind of radiation, and every light source emits <b>photons</b>.&nbsp;</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-1.png"></figure><p>Photons are waves combined of various <b>wavelengths</b> (here x, y, x).<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-2.png"></figure><p>We're going to call the way the photons fly between the light source and a particular direction a <b>ray</b>.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-3.png"></figure><p>Those were a couple of facts. But what happens when a human factor comes in? There's a lot of radiation everywhere around us, but our eyes are specialized to react to only a particular range of wavelengths. For example, we don't see heat until its wavelength comes into that range (red-hot metal suddenly becomes a light source). This part of electromagnetic radiation we can <i>see</i> is called <b>visible light</b>, and is commonly known as just light.<br></p><p>We've discussed it shortly in the first article of this series, but let's add a bit of detail now. There are two kinds of photoreceptor cells in our eyes: <b>cones</b> and <b>rods</b>. When a ray hits them, they react and transfer some information to the brain.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-4.png"></figure><p>Rods are very light-sensitive and are responsible for night vision, seeing movement and forms. Cones, on the other hand, are much more interesting for us. They are able to separate the wave into particular wavelengths, that the brain interprets (roughly) as <b>red</b> (long), <b>green</b> (medium) and <b>blue</b> (short). Depending on what wavelengths the ray consists of, we perceive a color mixed of these three.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-5.png"></figure><p>But where do various wavelengths come from, if they are all brought by the same light source? Most of rays hit some object on their way, and then they're being reflected somewhere else (for example, to your eye). Usually the object they hit doesn't reflect them perfectly like a mirror. Some of the wavelengths are being <b>absorbed</b> by the object and they never reach your eye. As a result, we receive only a part of the original ray from that object. These remains of the ray are then interpreted by your brain as the <b>color of the object</b>. Different colors come from different absorbing and reflecting properties of materials.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-6.png"></figure><p>You probably wonder what it all has to do with color in painting. After all, we only paint with colors, we don't create them physically! I'm sure everything will become clear in a second.</p><h2>Hue, Saturation, Brightness</h2><p>Is there something more confusing than this? Our intuition tells us what hue, saturation and brightness is, but when it comes to painting, it's hard to guess how to use it. Hue is, well, color, right? Saturation is a level of vividness... and brightness tells us if something is dark or bright. But it only makes sense as long as you talk about a finished painting, and it's much harder to guess where to put it all when you do it yourself. However, all we need is to understand where all these values actually come from!<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-7.png"></figure><h3>The Definition of Hue</h3><p>Hue is a "type" of color. Red, purple, olive, crimson are all hues. They're based on the mechanism we've just talked over - the reflected wavelengths, mixed in various proportions, create a final color interpreted by brain. Therefore, putting it simply, <b>hue is based on "the color of the object"</b>. An interesting fact: silver, gold or brown aren't hues. Silver is shiny gray, gold is shiny yellow, and brown is dark or unsaturated orange.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-8.png"></figure><p>No matter how many names we invent for the hues, all of them base on red, green and blue. The further on the color wheel you are from any of them, the more "original" color you'll get. For example, 50% red + 50% green gives yellow, but change this proportion just a little bit and you'll see a greenish or reddish tint.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-9.png"></figure><p>There's no greater or lesser hue, being put on a wheel they're all equal. Hence we describe them by degrees instead of a percent value.</p><h3>The Definition of Saturation<br></h3><p>Hue doesn't mean color (at least not formally). All the circles below have the same hue, the same exact position on the color wheel (the same brightness too!). So why do we perceive them as different colors?<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-10.png"></figure><p>The common definition of saturation is how much white there is in the color. But wait, wasn't that about brightness? You want brighter color, you make it whiter... But that would make darker areas more saturated. It's so confusing, isn't it? That's why we need more explanation. <br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-11.png"></figure><p>Saturation is the <b>dominance of color</b>. The three samples below have the same brightness and hue. The only thing that changes is the proportion between the components. We're not "adding white" - we're reducing the distance between the components, so none of them stands out.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-12.png"></figure><p>As you can guess, when there's no difference between the components, we've got no saturation, which gives us white (we don't include brightness yet).<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-13.png"></figure><h3>The Definition of Brightness</h3><p>For our needs we can treat brightness as synonymous with value from the previous article. It defines <b>the maximum of a value our eyes can perceive</b>. There's no more blue than 100% blue, just like there's nothing brighter than 100% white.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-14.png"></figure><p>The bars can't be filled over the maximum:<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-15.png"></figure><p>And, obviously, black comes from the lack of information.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-16.png"></figure><p>An interesting fact: when it's dark, our cone cells get a little information, what makes us a bit color-blind. At this time rod cells, sensible to any light, will take over. However, since they're the most sensible to green-blue light, they'll make any green-blue object look brighter. It's called the&nbsp;<a href="http://upload.wikimedia.org/wikipedia/commons/7/7d/Red_geranium_photoic_mesopic_scotopic.jpg" target="_self">Purkinje effect</a>.</p><h4>Luminance</h4><p>Despite having a certain, absolute brightness, every color has another property, <b>luminance</b>.
 While brightness tells us how much of color there is in the color, some
 of hues appear brighter to us - even when they're all 100% bright. 
Luminance is about <b>how bright color is relative to white</b>.&nbsp;</p><p>When
 we turn 100% bright primary colors to grayscale, their brightness 
suddenly drops. They still make white, but blue turns out to be very, 
very dark, and green the brightest of them all. It comes from individual
 sensitiveness of every cone, and that's why we perceive yellow (bright 
red + very bright green) as the brightest of colors, or why cyan (dark 
blue + very bright green) is sometimes called light blue. Luminance is important when you start your picture in grayscale - for example, yellow needs a brighter base than other colors of the same absolute brightness.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20679/image/color-shading-advanced-29.png"></figure><h3>HSB Model</h3><p>It's still a bit confusing, though. In reality we don't build the colors carefully, it would take too long! Fortunately, hue, saturation and brightness can be combined into a very useful tool. Take a look at the scheme below - you can notice there's a clear relation between colors. Why not use it?<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-17.png"></figure><p>If you're a digital painter, these should look familiar to you. It's a way of combining hue, saturation and brightness into one, consistent model called HSB. How does it work?<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-18.png"></figure><p>Once you've known what hue, saturation and brightness are, it's easy to locate them on the model. Hue wheel (or a bar, it doesn't matter) is independent and superior to SB square/triangle. Every hue possesses a range of saturation and brightness, and these two values are bound to each other. Together they define "richness" or "colorfulness" of a particular hue.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-19.png"></figure><p>SB model can be divided into areas of different properties. If you learn to optically choose a proper color, you won't need to know anything about certain values of saturation or brightness - it's very helpful for spontaneous, fast painting. <br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-19b.png"></figure><p>While the square is much more intuitive, I personally prefer the triangle. It lets me control "richness" at a whole, not severally saturation and brightness (I've got separate sliders for that!). If you're like me and feel Photoshop could use a nice 
color wheel being opened all the time, <a href="http://nerdchallenge.com/lenwhite/LenWhite.com/LenWhite.com/Entries/2012/9/16_PW_CS6.html" target="_self">check out this amazing, free plugin by Len White</a>.</p><h2>CMY and RGB<br></h2><p>But what about traditional painters? They don't have a handy color wheel with neat sliders. How can you change a hue, saturation or brightness of a pigment?&nbsp;</p><p>First, let's think what's the difference between digital and traditional painting. They both use colors, right? The problem is digital painting uses colorful light sources, creating most perfect colors possible and shooting them right into our eyes, while in traditional painting we're limited to light reflected from a pigment. It's like using a middleman between what's painted and what you actually see! We can debate what medium is more artistic, but there's no doubt that digital painting does better with our vision mechanism.<br></p><p>So, to paint traditionally we need pigments. They don't emit color themselves, and instead they absorb some of the light hitting them, reflecting the wavelengths compatible with their names. For example, red paint absorb green and blue, reflecting only red.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-20.png"></figure><p>The problem is we're not able to create perfect pigments reflecting the light exactly as it would be emitted, e.g. a pigment stimulating the "blue" cone only. CMY system is a kind of compromise: <b>cyan</b> doesn't reflect red, <b>magenta</b> doesn't reflect green, and <b>yellow</b> doesn't reflect blue. So, if we want to stimulate "blue" cone, we need to mix cyan and magenta - this pigment will reflect as little red and green as possible. "K", black, is added to CMY since the components are not perfect and they don't create pure black when mixed in equal proportions.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-21.png"></figure><p>RGB is <b>additive</b> - the more values you add, the brighter color you get. CMY is <b>subtractive</b> - the <i>less</i> values you add, the brighter the color.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-22.png"></figure><h2>Four Rules of Color Mixing</h2><h3>Rule 1 - Hue Mixing<br></h3><p>By mixing two hues you get a hue from somewhere between them, according to proportion. It works for both additive and subtractive mixing.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-23.png"></figure><h3>Rule 2 - Complementary Hue Mixing</h3><p>You probably heard of complementary colors. They are hues laying in opposite to each other on the wheel. The contrast between them (when they've got the same brightness) is as striking as between black and white. However, when they're mixed, they neutralize each other.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-24.png"></figure><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-25.png"></figure><p>Mixing complementary hues gives neutrality (gray or grayish). Additive mixing of 100% bright complementary hues will return white, subtractive - black.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-26.png"></figure><p>In subtractive method, adding a bit of complementary hue is the easiest way to precisely reduce saturation. <br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-28.png"></figure><h3>Rule 3 - Saturation Mixing</h3><p>In both methods, proportions between components equalize when mixing, and in result saturation is reduced.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-27.png"></figure><h3>Rule 4 - Brightness Mixing</h3><p>Additive mixing returns brighter color, and subtractive - darker than the lighter one of the components.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-29.png"></figure><h2>Color Temperature</h2><p>The tradition to divide the color wheel into warm and cold halves is very strong. We know that warm colors are active and friendly, while cold colors are passive and formal. Whole books could be written about psychology of color, but the problem is this is <i>not</i> an objective division. What's the warmest color? Red, yellow? Is purple warm or cold? And where <i>exactly</i> should this border line be?<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-33.png"></figure><p>Look at the picture below. These are all reds, theoretically warm all the way. So why some of them appear colder than others? It's about contrast. A color can't be warm or cold, only <i>warmer</i> or <i>colder</i>. The color wheel is so easy to divide visually, because all these colors are put together and easy to compare. Cut red out of it and it's no more warm or cold. It's just red.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-34.png"></figure><p>So, how to create a warmer or colder color? Every hue on the wheel has a neighbor. These neighbors are always colder or warmer than our sample (check their neighbors too, if you're not sure). To create a colder version of the sample, slide into direction of cold neighbors (and vice versa).<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-35.png"></figure><h2>The Basic Rules of Shading</h2><p>About time, huh? Give me a moment and you'll see this lengthy introduction was necessary to understand the whole process. If you memorize the rules only, you limit yourself to particular situations, but once you've understood where they come from, the sky is the limit!</p><h3>The Local Color<br></h3><p>The common base color, said not to be lighted by any light source, is called the local color. We already know an unlighted object can't have any color, so the better definition is a <b>color not affected strongly by the light nor shadow</b>. So a cherry's local color is red, even if it's illuminated with strong orange light on one side and reflected blue on the other. The local color should be the one you're starting your picture with.<br></p><p>What should be the saturation and brightness of the local color? The brightness is defined by imaginary scattered light that you start your scene with. To define the general brightness of the scene (the intensity of the scattered light) put your object on a white sheet. They're both illuminated by the same light, and <b>the object can't be brighter than the white sheet</b> under the same conditions.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-36.png"></figure><p>The explanation is simple - the white sheet reflects 100% light. If the 
object was brighter than it, it would mean the object reflects more than
 100% light (so it's fluorescing or emitting light itself). It's all about contrast, so the darker is your base lighting, the more striking light source you'll be able to add later.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-37.png"></figure><p>What about saturation? While brightness is about intensity of light, saturation comes from proportion between its components. This proportion stays the same when the intensity of light is changing (with a little exception we'll talk about in a second). It's like adding more water with every teaspoon of sugar - the drink is not going to become any sweeter! <br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-38.png"></figure><h3>The Direct Light Source<br></h3><p>Here's a quick reminder about light areas from the first article:<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-value-38.png"></figure><p>Let's start with a simple scene not illuminated by any well defined light. The ground is green, the ball is red, and the sky... doesn't matter at the moment. If the background is very far away, it doesn't affect our object. We chose the brightness and saturation, and for now, without no directional light, it looks flat, 2D. That's why we call it <b>flat colors</b>, and it's the easiest part of painting.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-39.png"></figure><p>When the light source is presented, it floods all the scene. Its intensity - <b>brightness</b> - is the highest where the light has a direct contact with objects (full light, half light) and the lowest where it cannot reach (core shadow, cast shadow). The brighter the light, the darker the shadow. Our local color becomes the terminator.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-39a.png"></figure><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-40.png"></figure><p>To keep the ball from floating, we need to add <b>crevice shadow</b> - the area where no light can reach. This is the darkest area of the picture.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-40a.png"></figure><p>The problem is the scene still looks... fake. It's colorful, merry, as if it came from a children book. But something's wrong... If you've read the first article carefully, you may notice we used only <b>diffuse reflection</b>. Every single ray hitting the ball was partially absorbed, reflecting only red. Therefore, in the area of maximum brightness we've got 100% red and there's no way of changing it! This is very natural state for <b>matte</b> materials, and decreasing saturation to get a "brighter" red is a mistake.<br></p><p>If it's natural, why does it look fake? It's because fully matte materials are very rare in nature. Almost everything reflects at least a bit of <b>specular reflection</b>, and it doesn't need to be a high gloss - usually it's very soft and subtle. Change your position when looking at some object close to you - if its "colors" move along to your movement (even subtly!), they're the effect of specular reflection. The ones independent to your position come from diffuse reflection.<br></p><p>Specular reflection, as we've learned before, is a reflection of the light source. The stronger it is, the clearer the image of the light source appears on the object. The biggest role here plays the proportion between specular and diffuse properties of the material. High glossy objects usually have a thin layer of transparent, strongly specular material on them, so both kinds of reflection don't mix (third ball).<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-40b.png"></figure><p>To put it straight, when decreasing the saturation of a bright area ("adding white" to it), you're not <i>brightening</i> it - you're <b>adding gloss</b>.</p><p>However, the balls above still look fake! (so many ways to paint fake colors, huh?). This time they look like taken from a 3D modeling exercise. This is because we used neutral white light that doesn't occur in nature either. Sunlight, before it can reach our eyes, needs to break through the layers of atmosphere. The previous article explained what happens here, so let's just add color to this mechanism.</p><p>Short and medium wavelengths are being scattered the most easily. The longer their way through atmosphere, the more of them stray and never reach your eyes (at least, not from initial direction). Therefore, a "white" ray becomes mostly red and green, and even in the highest point it has a bit of blue deficit - <b>sunlight is warm</b>.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-41.png"></figure><p>So why would reflection of a warm light source be neutrally white? To avoid that fake 3D model effect, <b>decrease the saturation and increase the temperature at the same time when adding warm gloss</b> (no matter strong or subtle). As we noticed before, there are cold and warm reds, so it doesn't mean that a red surface becomes orange or yellow instantly!<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-42.png"></figure><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-42a.png"></figure><p>It's important not to use gloss as a universal way to make the picture more attractive. When you feel you're getting closer to white, it means your object is shiny or wet. Think about it when painting skin!<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-42b.png"></figure><h3>The Indirect Light Sources<br></h3><p>But what happens to all this blueness that gets scattered? It makes the sky blue, of course, but if we can see this bright blueness, it means it reaches our eyes - and not only our eyes. All the objects around get "touched" by this indirect light, and then it can be reflected to us too. It's not as bright as the direct sunlight, but it still makes the surface a bit brighter. Also, if it's not fully matte, the surface loses a bit of saturation and becomes colder (since our indirect light source is cold). Keep in mind that the direct light is always stronger than indirect one, so these two will never mix - <b>indirect reflection can't cross the terminator line</b>.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-43.png"></figure><p>The most intense reflections are created by glossy surfaces, but matte ones, like our "ground", affect the objects too.<br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-44.png"></figure><p>As we noticed in the previous article, contrast decreases with distance. But what about hue, saturation and brightness of the receding object? Well, it's a little bit more problematic. When the object recedes into background, the information from it is mixed with the light reflected from the sky, right? It means that:</p><ul><li> Hue gradually changes temperature in the direction of the sky's hue;</li><li>Brightness gradually grows until it reaches the value of the sky;</li><li>Saturation is mixed with the noise, therefore it decreases. However, if the light source is actually in the background (the foreground is dark), the saturation may increase gradually with coming close to it.<br></li></ul><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-44a.png"></figure><p>The clearer the atmosphere, the less this effect occurs. Respectively, when there's a lot of dust, smoke or humidity around, even close object change their properties drastically. The common trick of artists (and movie creators too!) is to render aerial perspective even in smaller scale, for example drawing one leg of a monster bluer, brighter and less saturated. For our brains it means it's further, and therefore a depth is achieved. However, keep in mind it also thickens the atmosphere - it will not work in clear air.<br></p><h3>Color and Value</h3><p>Proper coloring creates correct values, so to say, involuntarily. Beginners often start their pictures with values only to define them properly, but the truth is with the rules we've just learned you shouldn't have any problems with color painting. How can it be?</p><ul><li>The initial brightness of the local colors sets an uniform brightness for all the scene;</li><li>Diffuse lights and shadows are as saturated as the local color - unsaturated shadows would look brighter as value!</li><li>The more gloss, the more value brightness;</li><li>Indirect lights are never brighter than direct one, so they can't be confused with main light source;</li><li>The local color becomes a terminator, with shadows on one side and lights on the other, what creates a proper contrast.<br></li></ul><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-45.png"></figure><p>How to check if more lights or shadows should be added? It's a matter of contrast and you need to choose yourself which is the best for your picture's atmosphere. Generally, it's good to put your main object on three backgrounds: white, black and 50% gray. If it looks OK on every one of them, you're fine. Converting your picture to grayscale for a test is a good idea too.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-46.png"></figure><h3>Points to Remember</h3><ul><li>Highly saturated, bright colors are rare in nature - reserve them for flowers, birds and magic things;</li><li>Put lights on lights, never lights on shadows! If you want to put a light on a dark area, brighten it gradually;<br></li><li>If the shading looks too colorful, take a break, get some distance. There's a chance your eyes are just too focused on them after hours of work and the colors are actually OK. Rotating the picture or looking at it indirectly, in the mirror can help too;<br></li><li>Save pure white for highlights and 100% black for crevice shadows - overusing them drastically decreases their power. <br></li></ul><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/108/posts/20549/image/color-fundamentals-shading-47.png"></figure><h2>No More Guessing!</h2><p>Once you've realized that color is just a signal, a kind of information, it's so much easier to imitate the real world with your paintings. You don't need to memorize hundreds of rules - once you've understood the fundamentals, you can calculate reality with a great accuracy! Of course, don't treat them as a universal recipe for success - art is art, and sometimes you get the best effects when actually breaking the rules.</p><p> Stay tuned for the last article of the series, where I'll present you more tricks, such us multiple and colorful light sources, transparency, subsurface scattering, light emission and refraction, and show you what's the fuss about textures.</p><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/20549/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20549/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20549/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/20549/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T12:11:00.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T12:11:00.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:17:"Monika Zagrobelna";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:8;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21261";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:96:"http://webdesign.tutsplus.com/articles/how-they-did-it-virgin-americas-new-storefront--cms-21261";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:50:"How They Did It: Virgin America’s New Storefront";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:10345:"<p>Virgin America has launched a new booking service, and it's a lot of fun!</p><p>The concept of&nbsp;a flight booking experience being <i>fun</i> sounds nearly impossible. For years, booking a flight online has been a relatively cold undertaking&nbsp;and pointed purely at business objectives.</p><p>Virgin has created <a href="https://beta.virginamerica.com/" target="_self">a different experience</a>. Today, we're going to talk about how they've changed the average booking experience and made it more approachable and delightful.</p><h2>Hello World, the Meta Site</h2><p>One of the first things you might notice is that Virgin introduces their new site with <a href="http://static.virginamerica.com/Web3/newlookvx/vx-redesign-9/7/index.html" target="_self">a Hello World site</a>, furnished with some brilliant SVG animation.&nbsp;This is intended to be a basic overview of the new booking experience, explaining its most prominent features and goals.&nbsp;</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/30/posts/21261/image/ezgif-save.gif"><figcaption>Virgin's&nbsp;<a href="http://static.virginamerica.com/Web3/newlookvx/vx-redesign-9/7/index.html" target="_self">new site&nbsp;</a>is fly</figcaption></figure><p>This meta-site was created using&nbsp;<a href="https://github.com/peachananr/onepage-scroll">jQuery One Page Scroll by Pete R.</a>, a plugin inspired by Apple's iPhone 5S product feature site. Featuring&nbsp;<a href="https://www.google.com/doubleclick/studio/swiffy/">Swiffy</a>-created animations, a Vine video, as well as a few CSS/JS powered animations, the introduction even points out the new whimsical design elements as a feature of the relaunch.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/30/posts/21261/image/virgin-vine.jpg"></figure><p>This is a particularly interesting marketing move, as it truly sets the stage for the new booking experience. Beyond simply explaining the functions of the new site, the meta-site gives credibility to the new reveal and builds the positive tension of trying the new experience.</p><p>There's a lot to unpack in this site, so for the sake of completeness, we will be skipping some of the technical details that belong in more specific tutorials. Instead, we will talk about some of the primary aspects of the design strategy, and summarize some of the overarching technical implementation strategy.</p><h2>Booking UX: Full Screen Form Design</h2><p>The booking experience can most accurately be described as a very highly designed form experience. The form steps you through the following process:</p><ol><li>Choose your destination and departure points, as well as trip type (multi-city, etc)</li><li>Choose the occupant details (count and type of occupant)</li><li>Select dates of flights</li><li>Select each flight time and ticket 4a. Select any upgrades you'd like to apply</li><li>Choose your seat</li><li>Finalize details and pay</li></ol><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/30/posts/21261/image/virgin-choose-destination.jpg"><figcaption>Choose your destination</figcaption></figure><p>Instead of doing this via a traditional form, Virgin has chosen to make this a modal experience that focuses on singular decisions. But instead of just using traditional input methods, Virgin relies primarily on clicking instead of typing. This allows the user to focus on <i>visual decisions</i> rather than <i>logical decisions</i>.</p><p>The primary control is a clickable box outline with text in the center, which is repeated throughout the booking process. Secondary controls include simple&nbsp;<code>+</code>,&nbsp;<code>-</code>, and&nbsp;<code>X</code>&nbsp;buttons, or clickable up/down arrows.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/30/posts/21261/image/virgin-button.png"><figcaption>Primary and secondary controls</figcaption></figure><p>The full screen form utilizes <a href="https://code.tutsplus.com/tutorials/building-a-web-app-from-scratch-in-angularjs--net-32944" target="_self">Angular</a> to handle the application data binding, and does not appear to utilize any particular UI framework. The CSS file is 16,800+ lines unminified.</p><h3>“Unlocking”&nbsp;Sections</h3><p>One of the decisions made by Virgin is to unlock different sections of the form once they are filled out, and leave them accessible throughout the rest of the booking process. Once you have completed one part of the form, the next part shows and the page automatically scrolls to that section's position.</p><h3>Delightful Language</h3><p>Virgin is known for their light-hearted branding strategies and daring copywriting, and the new booking experience is no exception. For instance, when you choose Portland as your destination, the app reminds you to "pack your plaid," and asks if you are headed to "Hahvahd" (Harvard) if you choose Boston as your destination. This kind of rich language goes in direct opposition to the traditional booking experience.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/30/posts/21261/image/virgin-chicago.png"><figcaption>Guess where I'm going..</figcaption></figure><h3><code>pushState</code>&nbsp;for Snappiness</h3><p>The app maintains true URL state, and does so using&nbsp;<code>pushState</code>. For instance, choosing the "check in" from the menu updates the URL and view without reloading the page.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/30/posts/21261/image/virgin-url.png"><figcaption>The URL says it all</figcaption></figure><h3>Goodbye, IE8</h3><p>Virgin has also made the move to stop supporting IE8, using conditional comments to include a modal and classes on the HTML element.</p><div><pre class="brush: html">&lt;!--[if lte IE 8]&gt;
            &lt;div class="modal__window--ie8"&gt;
                &lt;div class="modal__bkgd"&gt;&amp;nbsp;&lt;/div&gt;
                &lt;div class="modal__dialog"&gt;
                    &lt;div class="modal__header"&gt;
                        &lt;h1 class="modal__title"&gt;Your browser is not currently supported&lt;/h1&gt;
                    &lt;/div&gt;
                    &lt;div class="modal__content is-generic"&gt;
                        &lt;p&gt;But there’s an easy fix! The Virgin America site works on a wide range of browsers. Click one of the icons below and follow the instructions. You’ll be flying in no time.&lt;/p&gt;

                        &lt;p&gt;Find the latest versions of our supported browsers below:&lt;/p&gt;

                        &lt;ul class="supported-browsers"&gt;
                            &lt;li class="supported-browsers__chrome"&gt;
                                &lt;a href="https://www.google.com/intl/en-US/chrome/browser/‎"&gt;
                                    &lt;span class="btn btn-normal btn-primary btn-block"&gt;Download Google Chrome&lt;/span&gt;
                                &lt;/a&gt;
                            &lt;/li&gt;
                            &lt;li class="supported-browsers__firefox"&gt;
                                &lt;a href="http://www.mozilla.org/en-US/firefox/new/‎"&gt;
                                    &lt;span class="btn btn-normal btn-primary btn-block"&gt;Download Firefox&lt;/span&gt;
                                &lt;/a&gt;
                            &lt;/li&gt;
                            &lt;li class="supported-browsers__ie is-omega"&gt;
                                &lt;a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie"&gt;
                                    &lt;span class="btn btn-normal btn-primary btn-block"&gt;Download Internet Explorer&lt;/span&gt;
                                &lt;/a&gt;
                            &lt;/li&gt;
                        &lt;/ul&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        &lt;![endif]--&gt;</pre></div><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/30/posts/21261/image/virgin-browser.png"></figure><h3>Cart View</h3><p>The cart looks very similar to a boarding pass, but shows a massive <b>Continue</b> button, as well as the price of the currently selected options. You can also change the options from this view.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/30/posts/21261/image/virgin-checkout.png"></figure><h3>The Final Detail Form</h3><p>The final form provides fantastic validation messages that fit right in line with the rich copy found elsewhere in the site.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/30/posts/21261/image/virgin-form-validation.png"></figure><p>Virgin has also included a completely unexpected feature, the option to add an avatar to your person.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/30/posts/21261/image/virgin-avatars.png"></figure><p>The rest of the checkout process is relatively simple, albeit very simply designed, aligning to a grid.</p><h2>What Makes This New Booking Process so Effective?</h2><p>Aside from the fact that the site itself is very fast and provides responsive CSS, Virgin has crafted a new format that redefines a notoriously terrible user experience. By reframing the voice to be more approachable and friendly, and focusing on aesthetically pleasing and delightful interaction, what was once a dreaded task has now become a&nbsp;<em>fun</em>&nbsp;task.</p><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21261/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21261/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21261/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21261/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T08:38:33.833Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T08:38:33.833Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:16:"Jonathan Cutrell";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:9;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21225";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:89:"http://cgi.tutsplus.com/tutorials/span-a-texture-across-folding-splines-in-c4d--cms-21225";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:44:"Span a Texture Across Folding Splines in C4D";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:1700:"<figure class="final-product final-product--video"><iframe src="//www.youtube.com/embed/1gX9MJNyk_Y?rel=0" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe><figcaption>What You'll Be Creating</figcaption></figure><p>Applying textures to multiple mograph objects can be a bit tricky in Cinema 4D. In this tutorial, you will learn how to attach a bitmap image that spans across multiple cloned bent objects to create one seamless look. With the help of a free third party plugin, you can apply this technique to other situations to give yourself more flexibility when it comes to texturing.</p><p>Download <a href="http://tcastudios.com/?page_id=6" rel="external" target="_blank">plaMATE</a>&nbsp;<i>(free)</i></p><h2>Tutorial</h2><figure data-video-embed="true" data-original-url="https://www.youtube.com/watch?v=ncDo7lXW848" class="embedded-video">
  <iframe src="//www.youtube.com/embed/ncDo7lXW848?rel=0" frameborder="0" webkitallowfullscreen="webkitallowfullscreen" mozallowfullscreen="mozallowfullscreen" allowfullscreen="allowfullscreen"></iframe>
</figure><h3><a href="https://cdn.tutsplus.com/cg/video/C4D-Spline-Fold-Tutorial-Video.rar" target="_self">Download this Tutorial</a></h3><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21225/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21225/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21225/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21225/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T08:31:48.415Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T08:31:48.415Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:12:"Kevin Snyder";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:10;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21135";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:78:"http://music.tutsplus.com/tutorials/how-to-use-voxengos-span-part-2--cms-21135";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"How to Use Voxengo's SPAN: Part 2
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:6611:"<p>Last time we took a deep look into the FFT window of Voxengo's SPAN. With adjustable timings, resolution, and the ability to layer multiple sources on top of each other, SPAN's FFT capabilities are awesome. If that were not enough for a free plugin, SPAN also includes amplitude and phase metering as well!</p><h2>Amplitude Metering</h2><p>Many engineers forget that there is more than one way to measure loudness. Different situations call for different standards of measurement. Thankfully, Voxengo's SPAN includes a plethora of options for the loudness-conscious engineer.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/120/posts/21135/image/voxengo_ii_1.jpg"></figure><h3>The Basics</h3><p>Upon loading SPAN, you should have your <b>FFT</b> (fast Fourier transform) window in the center along with the amplitude meter on the right. The meters will default to a peak style setting with the special white line indicating acting as a peak hold so you have time to read the peaks.</p><p>At the bottom of the window you will also see the <b>Statistics</b> window. While nothing fancy, it gives you a solid number read out of your peak RMS and overall peak levels. Knowing how loud you got is always good information to have!</p><p>Also note the portion in statistics dedicated to <b>Max Crest Factor</b>. For those unaware, this handy little readout is the difference between your RMS and your Max RMS. This measurement is very good for seeing just how dynamic your track really is.</p><p>If you do not see the amplitude metering, double check you do not have <b>Hide Meters and Stats</b> clicked! This makes SPAN a strict FFT-only program, but you knew that from the <a href="http://music.tutsplus.com/tutorials/how-to-use-voxengos-span-part-1--cms-20778" rel="external" target="_blank">previous tutorial</a> right?<br></p><h3>Getting a Little Deeper</h3><p>The cool amplitude metering aspects in SPAN are buried away in menus. (Curse you, clean interfaces!) Let's start with <b>Settings</b> directly above the amplitude meter.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/120/posts/21135/image/voxengo_ii_2.jpg"></figure><h4>Settings</h4><p>The unfortunate aspect of this menu is that it includes a lot of controls for how SPAN looks. However if you ignore the clutter, the bottom right corner has options for our amplitude meter.</p><ul><li><b>Integration Ti</b><b>me</b><i><b> -</b></i> This control changes how long of a window the amplitude meter will use for calculating average loudness. The higher the number, the closer you get to an accurate RMS measurement. However, transient loudness will of course be smeared.</li><li><b>Release Time<i> - </i></b>The release time controls how long it will take the meter to fall at least 40dB. By shortening this control you can gain better transient resolution even with a high integration time. However depending on how your controls are set it could become very hard to read.</li><li><b>Peak Hold Time<i> -</i></b> Finally this feature adjusts how long the white lines in the amplitude meter should stay in position. While they can always go up, sometimes getting a good peak reading is tricky. This should help get the timing just right!</li></ul><h4>Measurement Standards</h4><p>Back under the <b>Statistics</b> portion of SPAN we have the nifty ability to change our measurement standards for loudness. By default SPAN will use dBFS (dB Full Scale), since it is a format most engineers see everyday. However there are some other useful features as well.</p><ul><li><b>dBFS<i> -&nbsp;</i></b><i></i>This standard form of measurement most DAWs use to this day. RMS measurements in dbFS can be a little hairy depending on the implementation. However peak readings are always spot on.</li><li><b>K System<i> -&nbsp;</i></b><i></i>Developed by Bob Katz, this modern metering system involves not only the meters, but your monitor gain as well. By switching between the various K-12, K-14, and K-20 options you dial your metering and gain in for different audio material. K-20 is meant for wide dynamic range content, K-14 for medium range, and K-12 for small. The versions with a "C" attached are for calibrating your monitors to the K System.</li></ul><h2>Phase/Correlation Metering</h2><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/120/posts/21135/image/voxengo_ii_3.jpg"></figure><p>The last useful measurement SPAN gives us is the <b>Correlation Meter</b>. In case you have never used this sort of meter before, this is how they work:</p><ul><li>The plugin analyzes both the left and right channels of the audio stream to get an average amplitude. SPAN uses a three second window.</li><li>The correlation meter then compares the channels to see how in phase they are (digital audios range is from -1 to +1).</li><li>It tells you how in phase the content is via a meter from -1 to +1.</li></ul><p>Now, before you go jumping to conclusions about the meter read out, be careful! Digital audio going from -1 to +1 does not have anything to do with the correlation meters -1 to +1.</p><p>If the correlation meter should register from 0 to 1 it is considered in-phase, and the closer to 1 it gets, the more in phase it is. However if the meter should fall between -1 and 0 then it will become more and more out of phase.</p><p>You will also notice a R/L read out in the same section. This tells you the difference in dB between the left and right channels. If the number is positive then the right channel is louder and vise versa for negative values. Easy and handy!</p><h2>Conclusion</h2><p>Voxengo's SPAN is by far one of the most popular freeware plugins for good reason, it just works! From overlaying FFT information to amplitude measurements and phase metering, SPAN is a fully featured audio analysis tool.&nbsp;</p><p>Would it be nice to have ITU standards, a vectorscope, or some other analysis with it? Sure! But it is free so don't bite the hand that feeds you! Thanks for reading.</p><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21135/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21135/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21135/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21135/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T08:00:00.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T08:00:00.000Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:12:"Mike Elliott";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}i:11;a:6:{s:4:"data";s:38:"
    
    
    
    
    
    
    
  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:7:{s:2:"id";a:1:{i:0;a:5:{s:4:"data";s:55:"tag:tutorials.tutsplus.com,2005:PostPresenter/cms-21060";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:9:"alternate";s:4:"type";s:9:"text/html";s:4:"href";s:94:"http://music.tutsplus.com/tutorials/creating-a-realistic-bass-part-3-strings-things--cms-21060";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:50:"Creating a Realistic Bass Part 3: Strings & Things";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"content";a:1:{i:0;a:5:{s:4:"data";s:8349:"<p>Originally I had thought the <a href="http://music.tutsplus.com/tutorials/creating-a-realistic-bass-with-logics-sculpture--audio-15451">Realistic
Bass</a> tuts were complete, but have since come up with a few more ideas
that push the envelope a bit further.  The good news is that these
new concepts don't rely on Logic or Sculpture, so although I will be
using both, the concepts in this tut are open and accessible to the
non-Logic users as well.</p><h2>The Concept<br></h2><p>Although we left off with a decent-sounding modeled electric bass, a few key components were not
addressed—the main one being that of the bass strings themselves. 
The four strings which make up a standard bass are all of a different
gauge, and therefore sound different even when playing the same note.&nbsp;</p><p>&nbsp;The low E string played at the fifth fret (a low A) will sound
remarkably different from that same A being played on the open A
string.  This is true up and down the board; that the same note will
sound different depending on what string it is played on due to the
physical characteristics of the particular string.<br></p><p>This timbre difference between&nbsp;identical&nbsp;note values is an important characteristic of any type of stringed
instrument, and one that, despite the subtle modulations already in
use on our bass patch, is not happening.  In order to emulate this we
are going to have to do a little bit of setup.<br></p><h2>Initial Steps<br></h2><p>The first thing to do is to instantiate
a separate instance of the bass plugin for each string we are going
to emulate, and to populate the tracks with a de-mixed MIDI
performance.  The image below shows Logic's main page after
completing this step and labeling.&nbsp;&nbsp;Each track is named according to
the string we want to emulate and each region is labeled according to
the note value it contains.&nbsp; </p><p>I have taken some license irrespective
of real-world playing intuition in assigning the notes to the strings
in order to utilize all four strings. (I.e. the G and G# would probably both
be played on the E string.) This will allow for a wider range of
variation later on.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/125/posts/21060/image/1.png"><figcaption>The initial setup, showing the 'bass strings' on the left and the assigned notes on the right.</figcaption></figure><audio src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/125/posts/21060/audio/1.mp3" controls="controls"></audio><p><br></p><p>This is where we are at, with no change
in sound from the previous tutorial.<br></p><h2>Changing Timbres<br></h2><p>To start creating some variation, we
are going to want to start to play around with some plugin
parameters.  Two things to think about when doing so are the real
world sound&nbsp;characteristics&nbsp;of strings of&nbsp;differing&nbsp;thickness and
the overall&nbsp;cohesion of the final output across all four
strings.<br></p><p>The lower and wider gauge strings of an
electric bass tend to have a  more wooly, rounded and sustained tone
than that of the upper ranged strings.  So, if I am using the tone we
had previously created (a fairly tight tone) as a starting point, I
am going to want to play around with some parameters to open things
up a bit to replicate a wider string.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/125/posts/21060/image/2-2.png"><figcaption>In Sculpture, the objects (cyan), string (magenta) and envelope (yellow) sections contain the parameters we want to adjust.</figcaption></figure><p>After deciding exactly what parameters
to alter, it is important to go through and alter those same
parameters somewhat differently in each instance of your chosen
plugin to create a open to closed timbre gradient across the strings
of the virtual bass (tight and clean to loose and wooly, etc.)
.<br></p><p>When doing this, I started off rather
technical. I used the open E string tone as my 'open limit', and
the original tone as my 'closed limit' G string, then fit the other
two string tones in between.&nbsp;</p><p>I then freed up on the restrictions
to get something that sounded good with the recorded MIDI.&nbsp;&nbsp;I then went
ahead and loosened up on the original timbre to get a more cohesive
sound across all strings.  I finally went into the mixer and balanced
out the levels.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/125/posts/21060/image/3.png"><figcaption>The mixer with individual channels and level balance for each 'string'.</figcaption></figure><audio src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/125/posts/21060/audio/2.mp3" controls="controls"></audio><p><i>The loop. As you can hear, adjusting
the parameters has uncovered some note-off string clicks on a few
notes that were mostly dormant.</i><br></p><h2>Amps<br></h2><p>From here, I summed the signal to an
AUX track, and bussed each string to a guitar amp on a separate AUX track in order to amp the bass in parallel.  I pretty much always amp
sounds in parallel, as it allows for a greater control over the final
tonality.&nbsp;</p><p>&nbsp;In this case, I am trying to emphasize some of the higher
end harmonics, so I simply find an amp setting that accentuates those
frequencies and then mix them back into the dry signal.  In this way,
I can piece together a sound with a great deal of precision.<br></p><p><br></p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/125/posts/21060/image/amp-1.png"><figcaption>Amp #1- a guitar amp to bring out the upper harmonics.</figcaption></figure><audio src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/125/posts/21060/audio/3.mp3" controls="controls"><br></audio><p><i>The MIDI bass running in parallel through the first amp.</i><br></p><p>I then went ahead and did the same thing again with a bass amp model to beef up the lows. This type of parallel amping of a bass guitar further emulates real world sound as many recording engineers will mix a direct input bass recording with that of an amped recording.&nbsp;</p><p>In this instance, the dry signal can be considered our direct input and and the distorted signal will (obviously) be considered our amped recording.</p><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/125/posts/21060/image/amp-2.png"><figcaption>Amp # 2 for the bottom end.</figcaption></figure><figure class="post_image"><img alt="" src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/125/posts/21060/image/final-mixer.png"><figcaption>The mixer showing the 'DI' vs. amped routing.</figcaption></figure><audio src="https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/125/posts/21060/audio/4.mp3" controls="controls"></audio><p><i>The summed bass running in parallel through the second amp; the final product.</i><br></p><h2>Final Thoughts<br></h2><p>Although this tutorial is geared
towards emulating real-world electric bass conditions, don't think
the concept is limited to just that.  This basic concept would work
well for any sound type in need of some subtle and cohesive variation
and can be used in a not-so-subtle or cohesive way as well.&nbsp;</p><p>We could
break up a boring synth lead by varying the patch on certain notes or
push things in a much wilder direction by processing each note with a
different delay and distortion model, etc.  Or, in the instance of
the bass above, I can buy some further variation by switching which
notes get played on each string with each pass of the loop or send a varying amount if signal to each amp.  The
possibilities are literally limitless.<br></p><div class="mediafed_ad"><img border="0" height="1" src="http://audio.tutsplus.com.feedsportal.com/c/35227/f/669438/s/21060/sc/4/mf.gif" width="1" /><a href="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21060/a2.htm"><img border="0" src="http://da.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21060/a2.img" /></a><img border="0" height="1" src="http://pi.feedsportal.com/r/186529796139/u/407/f/669438/c/35227/s/21060/a2t.img" width="1" /></div>";s:7:"attribs";a:1:{s:0:"";a:1:{s:4:"type";s:4:"html";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:9:"published";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T00:11:09.828Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:7:"updated";a:1:{i:0;a:5:{s:4:"data";s:24:"2014-05-28T00:11:09.828Z";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}s:6:"author";a:1:{i:0;a:6:{s:4:"data";s:12:"
      
    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";s:5:"child";a:1:{s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"name";a:1:{i:0;a:5:{s:4:"data";s:11:"Will Walker";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:5:"en-US";}}}}}}}}}}}}}}}}s:4:"type";i:512;s:7:"headers";a:23:{s:6:"server";s:16:"cloudflare-nginx";s:4:"date";s:29:"Wed, 28 May 2014 21:57:00 GMT";s:12:"content-type";s:35:"application/atom+xml; charset=utf-8";s:14:"content-length";s:6:"209253";s:10:"connection";s:10:"keep-alive";s:10:"set-cookie";s:134:"__cfduid=d2ad1551acb8c1b3194823a4249b212781401314220140; expires=Mon, 23-Dec-2019 23:50:00 GMT; path=/; domain=.tutsplus.com; HttpOnly";s:13:"accept-ranges";s:5:"bytes";s:3:"age";s:3:"299";s:13:"cache-control";s:8:"no-cache";s:4:"etag";s:34:""997e9fdcfa0aa835997e42dcec811e42"";s:6:"status";s:6:"200 OK";s:4:"vary";s:22:"Accept,Accept-Encoding";s:3:"via";s:11:"1.1 varnish";s:22:"x-content-type-options";s:7:"nosniff";s:15:"x-frame-options";s:43:"ALLOW-FROM https://analytics.webtrends.com/";s:12:"x-powered-by";s:23:"Phusion Passenger 4.0.5";s:12:"x-request-id";s:36:"eb347424-0cb9-41f9-b83c-751d17e9d3b3";s:9:"x-runtime";s:8:"0.063425";s:15:"x-ua-compatible";s:8:"chrome=1";s:9:"x-varnish";s:21:"1375687779 1375680755";s:15:"x-varnish-cache";s:3:"HIT";s:16:"x-xss-protection";s:13:"1; mode=block";s:6:"cf-ray";s:20:"131db493ef2301b0-FRA";}s:5:"build";s:14:"20121030085402";}