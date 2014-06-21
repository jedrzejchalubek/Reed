var Reed = angular.module('Reed', [
	'ngResource',
	'ngCookies',
	'ngRoute',
	'ngSanitize',
	'ngAnimate',
	'ezfb',
	'toggle-switch',
	'angularMoment',
	'ngDragDrop',
	'infinite-scroll'
])

	.config([
		'$locationProvider',
		'$routeProvider',
		'$httpProvider',
		'ezfbProvider',
		function ($locationProvider, $routeProvider, $httpProvider, ezfbProvider) {

		$httpProvider.interceptors.push('httpResponseInterceptorHandler');

		ezfbProvider.setInitParams({
			appId: '676983059011847',
			status: true
		});

		$routeProvider
			.when('/', {
				templateUrl: 'app/template/login.html',
				controller: 'Login',
				requireLogin: false
			})
			.when('/discover', {
				templateUrl: 'app/template/discover.html',
				controller: 'Discover',
				requireLogin: true,
			})
			.when('/all', {
				templateUrl: 'app/template/articles.html',
				controller: 'All',
				requireLogin: true
			})
			.when('/later', {
				templateUrl: 'app/template/articles.html',
				controller: 'Later',
				requireLogin: true
			})
			.when('/favourites', {
				templateUrl: 'app/template/articles.html',
				controller: 'Favourites',
				requireLogin: true
			})
			.when('/feeds/:id', {
				templateUrl: 'app/template/articles.html',
				controller: 'Feeds',
				requireLogin: true
			})
			.when('/add', {
				templateUrl: 'app/template/add.html',
				controller: 'Add',
				requireLogin: true
			})
			.when('/settings', {
				templateUrl: 'app/template/settings.html',
				controller: 'Settings',
				requireLogin: true
			})
			.when('/profile', {
				templateUrl: 'app/template/profile.html',
				controller: 'Profile',
				requireLogin: true
			});

		// If the url is unrecognized go to login
		$routeProvider.otherwise({
			redirectTo: '/discover'
		});

	}])

	.run([
		'$rootScope',
		'$route',
		'$location',
		'AuthService',
		function ($rootScope, $route, $location, AuthService) {

		// Everytime the route in our app changes check auth status
		$rootScope.$on("$routeChangeStart", function(event, next, current) {
			// if you're logged out send to login page.
			if (next.requireLogin && !AuthService.getUserAuthenticated()) {
				event.preventDefault();
				$location.path('/').replace();
			}
		});

	}]);
;/*! angular-easyfb
version: 1.0.0
build date: 2014-03-29
author: Robin Fan
https://github.com/pc035860/angular-easyfb.git */
!function(a){function b(b,c){var d="ezfb-social-plugin-wrap",e="display: inline-block; width: 0; height: 0; overflow: hidden;",f=function(a){var b='<span class="'+d+'" style="'+e+'">';return a.wrap(b).parent()},g=function(a){return a.parent().hasClass(d)},h=function(a){var b=a.parent();return b.after(a).remove(),a};a.directive(c,["ezfb",function(a){return{restrict:"EC",require:"?^ezfbXfbml",link:function(c,d,e,i){function j(a){return function(){var b;k&&a===l&&(b=e.onrender,b&&c.$eval(b),k=!1,h(d))}}if(!i){var k=!1,l=0;c.$watch(function(){var a=[];return angular.forEach(b,function(b){a.push(e[b])}),a},function(){l++,k?a.XFBML.parse(d.parent()[0],j(l)):(k=!0,a.XFBML.parse(f(d)[0],j(l)))},!0),d.bind("$destroy",function(){g(d)&&h(d)})}}}}])}a.provider("ezfb",function(){function a(a,b){return angular.isObject(b)?void angular.extend(a,b):angular.copy(a)}function b(a,b,c){return function(){return a.apply(b,c)}}var c=-1,d={api:[1,2,3],ui:1,getAuthResponse:c,getLoginStatus:0,login:0,logout:0,"Event.subscribe":1,"Event.unsubscribe":1,"XFBML.parse":1,"Canvas.Prefetcher.addStaticResource":c,"Canvas.Prefetcher.setCollectionMode":c,"Canvas.hideFlashElement":c,"Canvas.scrollTo":c,"Canvas.setAutoGrow":c,"Canvas.setDoneLoading":0,"Canvas.setSize":c,"Canvas.setUrlHandler":0,"Canvas.showFlashElement":c,"Canvas.startTimer":c,"Canvas.stopTimer":0},e="en_US",f={status:!0,cookie:!0,xfbml:!0},g=["$window","$document","ezfbAsyncInit","ezfbLocale",function(a,b,c,d){!function(a){var b,c="facebook-jssdk",e=a.getElementsByTagName("script")[0];a.getElementById(c)||(b=a.createElement("script"),b.id=c,b.async=!0,b.src="//connect.facebook.net/"+d+"/all.js",e.parentNode.insertBefore(b,e))}(b[0]),a.fbAsyncInit=c}],h=g,i=["$window","ezfbInitParams",function(a,b){a.FB.init(b)}],j=i;return{setInitParams:function(b){a(f,b)},getInitParams:function(){return a(f)},setLocale:function(a){e=a},getLocale:function(){return e},setLoadSDKFunction:function(a){if(!angular.isArray(a)&&!angular.isFunction(a))throw new Error("Init function type error.");h=a},getLoadSDKFunction:function(){return h},setInitFunction:function(a){if(!angular.isArray(a)&&!angular.isFunction(a))throw new Error("Init function type error.");j=a},getInitFunction:function(){return j},$get:["$window","$q","$document","$parse","$rootScope","$injector",function(g,k,l,m,n,o){var p,q,r,s,t;return r={},s=k.defer(),(f.appId||j!==i)&&s.resolve(),p=k.defer(),l[0].getElementById("fb-root")||l.find("body").append('<div id="fb-root"></div>'),t=function(){s.promise.then(function(){o.invoke(j,null,{ezfbInitParams:f}),q.$$ready=!0,p.resolve()})},o.invoke(h,null,{ezfbAsyncInit:t,ezfbLocale:e}),q={$$ready:!1,init:function(b){a(f,b),s.resolve()}},angular.forEach(d,function(a,d){var e=m(d),f=e.assign;f(q,function(){var f=b(function(b){var f,h;if(f=k.defer(),h=function(a){var c,e;for(c=angular.isFunction(b[a])?b[a]:angular.noop,e=function(){var a=Array.prototype.slice.call(arguments);n.$$phase?(c.apply(null,a),f.resolve.apply(f,a)):n.$apply(function(){c.apply(null,a),f.resolve.apply(f,a)})};b.length<=a;)b.push(null);var g;if("Event.subscribe"===d)g=b[0],angular.isUndefined(r[g])&&(r[g]=[]),r[g].push({original:c,wrapped:e});else if("Event.unsubscribe"===d&&(g=b[0],angular.isArray(r[g]))){var h,i,j=r[g].length;for(h=0;j>h;h++)if(i=r[g][h],i.original===c){e=i.wrapped,r[g].splice(h,1);break}}b[a]=e},a!==c)if(angular.isNumber(a))h(a);else if(angular.isArray(a)){var i,j;for(i=0;i<a.length;i++)if(j=a[i],b.length==j||b.length==j+1&&angular.isFunction(b[j])){h(j);break}}var l=e(g.FB);if(!l)throw new Error("Facebook API `FB."+d+"` doesn't exist.");return l.apply(g.FB,b),f.promise},null,[Array.prototype.slice.call(arguments)]);if("getAuthResponse"===d){if(angular.isUndefined(g.FB))throw new Error("`FB` is not ready.");return g.FB.getAuthResponse()}return a!==c?p.promise.then(f):void p.promise.then(f)})}),q}]}}).directive("ezfbXfbml",["ezfb","$parse","$compile","$timeout",function(a,b,c,d){return{restrict:"EAC",controller:function(){},compile:function(e){var f=e.html();return function(e,g,h){var i=!0,j=h.onrender,k=function(){i&&(j&&e.$eval(j),i=!1)};a.XFBML.parse(g[0],k);var l=b(h.ezfbXfbml).assign;e.$watch(h.ezfbXfbml,function(b){b&&(i=!0,g.html(f),c(g.contents())(e),d(function(){a.XFBML.parse(g[0],k)}),(l||angular.noop)(e,!1))},!0)}}}}]);var c={fbLike:["action","colorscheme","href","kidDirectedSite","layout","ref","share","showFaces","width"],fbShareButton:["href","layout","width"],fbSend:["colorscheme","href","kidDirectedSite","ref"],fbPost:["href","width"],fbFollow:["colorscheme","href","kidDirectedSite","layout","showFaces","width"],fbComments:["colorscheme","href","mobile","numPosts","orderBy","width"],fbActivity:["action","appId","colorscheme","filter","header","height","linktarget","maxAge","recommendations","ref","site","width"],fbRecommendations:["action","appId","colorscheme","header","height","linktarget","maxAge","ref","site","width"],fbRecommendationsBar:["action","href","maxAge","numRecommendations","readTime","ref","side","site","trigger"],fbLikeBox:["colorscheme","forceWall","header","height","href","showBorder","showFaces","stream","width"],fbFacepile:["action","appId","colorscheme","href","maxRows","size","width"]};angular.forEach(c,b)}(angular.module("ezfb",[]));;/*!
 * Bootstrap v3.1.1 (http://getbootstrap.com)
 * Copyright 2011-2014 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 */

+function(a){"use strict";var b='[data-dismiss="alert"]',c=function(c){a(c).on("click",b,this.close)};c.prototype.close=function(b){function f(){e.trigger("closed.bs.alert").remove()}var c=a(this),d=c.attr("data-target");d||(d=c.attr("href"),d=d&&d.replace(/.*(?=#[^\s]*$)/,""));var e=a(d);b&&b.preventDefault(),e.length||(e=c.hasClass("alert")?c:c.parent()),e.trigger(b=a.Event("close.bs.alert"));if(b.isDefaultPrevented())return;e.removeClass("in"),a.support.transition&&e.hasClass("fade")?e.one(a.support.transition.end,f).emulateTransitionEnd(150):f()};var d=a.fn.alert;a.fn.alert=function(b){return this.each(function(){var d=a(this),e=d.data("bs.alert");e||d.data("bs.alert",e=new c(this)),typeof b=="string"&&e[b].call(d)})},a.fn.alert.Constructor=c,a.fn.alert.noConflict=function(){return a.fn.alert=d,this},a(document).on("click.bs.alert.data-api",b,c.prototype.close)}(jQuery),+function(a){"use strict";var b=function(c,d){this.$element=a(c),this.options=a.extend({},b.DEFAULTS,d),this.isLoading=!1};b.DEFAULTS={loadingText:"loading..."},b.prototype.setState=function(b){var c="disabled",d=this.$element,e=d.is("input")?"val":"html",f=d.data();b+="Text",f.resetText||d.data("resetText",d[e]()),d[e](f[b]||this.options[b]),setTimeout(a.proxy(function(){b=="loadingText"?(this.isLoading=!0,d.addClass(c).attr(c,c)):this.isLoading&&(this.isLoading=!1,d.removeClass(c).removeAttr(c))},this),0)},b.prototype.toggle=function(){var a=!0,b=this.$element.closest('[data-toggle="buttons"]');if(b.length){var c=this.$element.find("input");c.prop("type")=="radio"&&(c.prop("checked")&&this.$element.hasClass("active")?a=!1:b.find(".active").removeClass("active")),a&&c.prop("checked",!this.$element.hasClass("active")).trigger("change")}a&&this.$element.toggleClass("active")};var c=a.fn.button;a.fn.button=function(c){return this.each(function(){var d=a(this),e=d.data("bs.button"),f=typeof c=="object"&&c;e||d.data("bs.button",e=new b(this,f)),c=="toggle"?e.toggle():c&&e.setState(c)})},a.fn.button.Constructor=b,a.fn.button.noConflict=function(){return a.fn.button=c,this},a(document).on("click.bs.button.data-api","[data-toggle^=button]",function(b){var c=a(b.target);c.hasClass("btn")||(c=c.closest(".btn")),c.button("toggle"),b.preventDefault()})}(jQuery),+function(a){"use strict";var b=function(b,c){this.$element=a(b),this.$indicators=this.$element.find(".carousel-indicators"),this.options=c,this.paused=this.sliding=this.interval=this.$active=this.$items=null,this.options.pause=="hover"&&this.$element.on("mouseenter",a.proxy(this.pause,this)).on("mouseleave",a.proxy(this.cycle,this))};b.DEFAULTS={interval:5e3,pause:"hover",wrap:!0},b.prototype.cycle=function(b){return b||(this.paused=!1),this.interval&&clearInterval(this.interval),this.options.interval&&!this.paused&&(this.interval=setInterval(a.proxy(this.next,this),this.options.interval)),this},b.prototype.getActiveIndex=function(){return this.$active=this.$element.find(".item.active"),this.$items=this.$active.parent().children(),this.$items.index(this.$active)},b.prototype.to=function(b){var c=this,d=this.getActiveIndex();if(b>this.$items.length-1||b<0)return;return this.sliding?this.$element.one("slid.bs.carousel",function(){c.to(b)}):d==b?this.pause().cycle():this.slide(b>d?"next":"prev",a(this.$items[b]))},b.prototype.pause=function(b){return b||(this.paused=!0),this.$element.find(".next, .prev").length&&a.support.transition&&(this.$element.trigger(a.support.transition.end),this.cycle(!0)),this.interval=clearInterval(this.interval),this},b.prototype.next=function(){if(this.sliding)return;return this.slide("next")},b.prototype.prev=function(){if(this.sliding)return;return this.slide("prev")},b.prototype.slide=function(b,c){var d=this.$element.find(".item.active"),e=c||d[b](),f=this.interval,g=b=="next"?"left":"right",h=b=="next"?"first":"last",i=this;if(!e.length){if(!this.options.wrap)return;e=this.$element.find(".item")[h]()}if(e.hasClass("active"))return this.sliding=!1;var j=a.Event("slide.bs.carousel",{relatedTarget:e[0],direction:g});this.$element.trigger(j);if(j.isDefaultPrevented())return;return this.sliding=!0,f&&this.pause(),this.$indicators.length&&(this.$indicators.find(".active").removeClass("active"),this.$element.one("slid.bs.carousel",function(){var b=a(i.$indicators.children()[i.getActiveIndex()]);b&&b.addClass("active")})),a.support.transition&&this.$element.hasClass("slide")?(e.addClass(b),e[0].offsetWidth,d.addClass(g),e.addClass(g),d.one(a.support.transition.end,function(){e.removeClass([b,g].join(" ")).addClass("active"),d.removeClass(["active",g].join(" ")),i.sliding=!1,setTimeout(function(){i.$element.trigger("slid.bs.carousel")},0)}).emulateTransitionEnd(d.css("transition-duration").slice(0,-1)*1e3)):(d.removeClass("active"),e.addClass("active"),this.sliding=!1,this.$element.trigger("slid.bs.carousel")),f&&this.cycle(),this};var c=a.fn.carousel;a.fn.carousel=function(c){return this.each(function(){var d=a(this),e=d.data("bs.carousel"),f=a.extend({},b.DEFAULTS,d.data(),typeof c=="object"&&c),g=typeof c=="string"?c:f.slide;e||d.data("bs.carousel",e=new b(this,f)),typeof c=="number"?e.to(c):g?e[g]():f.interval&&e.pause().cycle()})},a.fn.carousel.Constructor=b,a.fn.carousel.noConflict=function(){return a.fn.carousel=c,this},a(document).on("click.bs.carousel.data-api","[data-slide], [data-slide-to]",function(b){var c=a(this),d,e=a(c.attr("data-target")||(d=c.attr("href"))&&d.replace(/.*(?=#[^\s]+$)/,"")),f=a.extend({},e.data(),c.data()),g=c.attr("data-slide-to");g&&(f.interval=!1),e.carousel(f),(g=c.attr("data-slide-to"))&&e.data("bs.carousel").to(g),b.preventDefault()}),a(window).on("load",function(){a('[data-ride="carousel"]').each(function(){var b=a(this);b.carousel(b.data())})})}(jQuery),+function(a){function e(d){a(b).remove(),a(c).each(function(){var b=f(a(this)),c={relatedTarget:this};if(!b.hasClass("open"))return;b.trigger(d=a.Event("hide.bs.dropdown",c));if(d.isDefaultPrevented())return;b.removeClass("open").trigger("hidden.bs.dropdown",c)})}function f(b){var c=b.attr("data-target");c||(c=b.attr("href"),c=c&&/#[A-Za-z]/.test(c)&&c.replace(/.*(?=#[^\s]*$)/,""));var d=c&&a(c);return d&&d.length?d:b.parent()}"use strict";var b=".dropdown-backdrop",c="[data-toggle=dropdown]",d=function(b){a(b).on("click.bs.dropdown",this.toggle)};d.prototype.toggle=function(b){var c=a(this);if(c.is(".disabled, :disabled"))return;var d=f(c),g=d.hasClass("open");e();if(!g){"ontouchstart"in document.documentElement&&!d.closest(".navbar-nav").length&&a('<div class="dropdown-backdrop"/>').insertAfter(a(this)).on("click",e);var h={relatedTarget:this};d.trigger(b=a.Event("show.bs.dropdown",h));if(b.isDefaultPrevented())return;d.toggleClass("open").trigger("shown.bs.dropdown",h),c.focus()}return!1},d.prototype.keydown=function(b){if(!/(38|40|27)/.test(b.keyCode))return;var d=a(this);b.preventDefault(),b.stopPropagation();if(d.is(".disabled, :disabled"))return;var e=f(d),g=e.hasClass("open");if(!g||g&&b.keyCode==27)return b.which==27&&e.find(c).focus(),d.click();var h=" li:not(.divider):visible a",i=e.find("[role=menu]"+h+", [role=listbox]"+h);if(!i.length)return;var j=i.index(i.filter(":focus"));b.keyCode==38&&j>0&&j--,b.keyCode==40&&j<i.length-1&&j++,~j||(j=0),i.eq(j).focus()};var g=a.fn.dropdown;a.fn.dropdown=function(b){return this.each(function(){var c=a(this),e=c.data("bs.dropdown");e||c.data("bs.dropdown",e=new d(this)),typeof b=="string"&&e[b].call(c)})},a.fn.dropdown.Constructor=d,a.fn.dropdown.noConflict=function(){return a.fn.dropdown=g,this},a(document).on("click.bs.dropdown.data-api",e).on("click.bs.dropdown.data-api",".dropdown form",function(a){a.stopPropagation()}).on("click.bs.dropdown.data-api",c,d.prototype.toggle).on("keydown.bs.dropdown.data-api",c+", [role=menu], [role=listbox]",d.prototype.keydown)}(jQuery),+function(a){"use strict";var b=function(b,c){this.options=c,this.$element=a(b),this.$backdrop=this.isShown=null,this.options.remote&&this.$element.find(".modal-content").load(this.options.remote,a.proxy(function(){this.$element.trigger("loaded.bs.modal")},this))};b.DEFAULTS={backdrop:!0,keyboard:!0,show:!0},b.prototype.toggle=function(a){return this[this.isShown?"hide":"show"](a)},b.prototype.show=function(b){var c=this,d=a.Event("show.bs.modal",{relatedTarget:b});this.$element.trigger(d);if(this.isShown||d.isDefaultPrevented())return;this.isShown=!0,this.escape(),this.$element.on("click.dismiss.bs.modal",'[data-dismiss="modal"]',a.proxy(this.hide,this)),this.backdrop(function(){var d=a.support.transition&&c.$element.hasClass("fade");c.$element.parent().length||c.$element.appendTo(document.body),c.$element.show().scrollTop(0),d&&c.$element[0].offsetWidth,c.$element.addClass("in").attr("aria-hidden",!1),c.enforceFocus();var e=a.Event("shown.bs.modal",{relatedTarget:b});d?c.$element.find(".modal-dialog").one(a.support.transition.end,function(){c.$element.focus().trigger(e)}).emulateTransitionEnd(300):c.$element.focus().trigger(e)})},b.prototype.hide=function(b){b&&b.preventDefault(),b=a.Event("hide.bs.modal"),this.$element.trigger(b);if(!this.isShown||b.isDefaultPrevented())return;this.isShown=!1,this.escape(),a(document).off("focusin.bs.modal"),this.$element.removeClass("in").attr("aria-hidden",!0).off("click.dismiss.bs.modal"),a.support.transition&&this.$element.hasClass("fade")?this.$element.one(a.support.transition.end,a.proxy(this.hideModal,this)).emulateTransitionEnd(300):this.hideModal()},b.prototype.enforceFocus=function(){a(document).off("focusin.bs.modal").on("focusin.bs.modal",a.proxy(function(a){this.$element[0]!==a.target&&!this.$element.has(a.target).length&&this.$element.focus()},this))},b.prototype.escape=function(){this.isShown&&this.options.keyboard?this.$element.on("keyup.dismiss.bs.modal",a.proxy(function(a){a.which==27&&this.hide()},this)):this.isShown||this.$element.off("keyup.dismiss.bs.modal")},b.prototype.hideModal=function(){var a=this;this.$element.hide(),this.backdrop(function(){a.removeBackdrop(),a.$element.trigger("hidden.bs.modal")})},b.prototype.removeBackdrop=function(){this.$backdrop&&this.$backdrop.remove(),this.$backdrop=null},b.prototype.backdrop=function(b){var c=this.$element.hasClass("fade")?"fade":"";if(this.isShown&&this.options.backdrop){var d=a.support.transition&&c;this.$backdrop=a('<div class="modal-backdrop '+c+'" />').appendTo(document.body),this.$element.on("click.dismiss.bs.modal",a.proxy(function(a){if(a.target!==a.currentTarget)return;this.options.backdrop=="static"?this.$element[0].focus.call(this.$element[0]):this.hide.call(this)},this)),d&&this.$backdrop[0].offsetWidth,this.$backdrop.addClass("in");if(!b)return;d?this.$backdrop.one(a.support.transition.end,b).emulateTransitionEnd(150):b()}else!this.isShown&&this.$backdrop?(this.$backdrop.removeClass("in"),a.support.transition&&this.$element.hasClass("fade")?this.$backdrop.one(a.support.transition.end,b).emulateTransitionEnd(150):b()):b&&b()};var c=a.fn.modal;a.fn.modal=function(c,d){return this.each(function(){var e=a(this),f=e.data("bs.modal"),g=a.extend({},b.DEFAULTS,e.data(),typeof c=="object"&&c);f||e.data("bs.modal",f=new b(this,g)),typeof c=="string"?f[c](d):g.show&&f.show(d)})},a.fn.modal.Constructor=b,a.fn.modal.noConflict=function(){return a.fn.modal=c,this},a(document).on("click.bs.modal.data-api",'[data-toggle="modal"]',function(b){var c=a(this),d=c.attr("href"),e=a(c.attr("data-target")||d&&d.replace(/.*(?=#[^\s]+$)/,"")),f=e.data("bs.modal")?"toggle":a.extend({remote:!/#/.test(d)&&d},e.data(),c.data());c.is("a")&&b.preventDefault(),e.modal(f,this).one("hide",function(){c.is(":visible")&&c.focus()})}),a(document).on("show.bs.modal",".modal",function(){a(document.body).addClass("modal-open")}).on("hidden.bs.modal",".modal",function(){a(document.body).removeClass("modal-open")})}(jQuery),+function(a){"use strict";var b=function(a,b){this.type=this.options=this.enabled=this.timeout=this.hoverState=this.$element=null,this.init("tooltip",a,b)};b.DEFAULTS={animation:!0,placement:"top",selector:!1,template:'<div class="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',trigger:"hover focus",title:"",delay:0,html:!1,container:!1},b.prototype.init=function(b,c,d){this.enabled=!0,this.type=b,this.$element=a(c),this.options=this.getOptions(d);var e=this.options.trigger.split(" ");for(var f=e.length;f--;){var g=e[f];if(g=="click")this.$element.on("click."+this.type,this.options.selector,a.proxy(this.toggle,this));else if(g!="manual"){var h=g=="hover"?"mouseenter":"focusin",i=g=="hover"?"mouseleave":"focusout";this.$element.on(h+"."+this.type,this.options.selector,a.proxy(this.enter,this)),this.$element.on(i+"."+this.type,this.options.selector,a.proxy(this.leave,this))}}this.options.selector?this._options=a.extend({},this.options,{trigger:"manual",selector:""}):this.fixTitle()},b.prototype.getDefaults=function(){return b.DEFAULTS},b.prototype.getOptions=function(b){return b=a.extend({},this.getDefaults(),this.$element.data(),b),b.delay&&typeof b.delay=="number"&&(b.delay={show:b.delay,hide:b.delay}),b},b.prototype.getDelegateOptions=function(){var b={},c=this.getDefaults();return this._options&&a.each(this._options,function(a,d){c[a]!=d&&(b[a]=d)}),b},b.prototype.enter=function(b){var c=b instanceof this.constructor?b:a(b.currentTarget)[this.type](this.getDelegateOptions()).data("bs."+this.type);clearTimeout(c.timeout),c.hoverState="in";if(!c.options.delay||!c.options.delay.show)return c.show();c.timeout=setTimeout(function(){c.hoverState=="in"&&c.show()},c.options.delay.show)},b.prototype.leave=function(b){var c=b instanceof this.constructor?b:a(b.currentTarget)[this.type](this.getDelegateOptions()).data("bs."+this.type);clearTimeout(c.timeout),c.hoverState="out";if(!c.options.delay||!c.options.delay.hide)return c.hide();c.timeout=setTimeout(function(){c.hoverState=="out"&&c.hide()},c.options.delay.hide)},b.prototype.show=function(){var b=a.Event("show.bs."+this.type);if(this.hasContent()&&this.enabled){this.$element.trigger(b);if(b.isDefaultPrevented())return;var c=this,d=this.tip();this.setContent(),this.options.animation&&d.addClass("fade");var e=typeof this.options.placement=="function"?this.options.placement.call(this,d[0],this.$element[0]):this.options.placement,f=/\s?auto?\s?/i,g=f.test(e);g&&(e=e.replace(f,"")||"top"),d.detach().css({top:0,left:0,display:"block"}).addClass(e),this.options.container?d.appendTo(this.options.container):d.insertAfter(this.$element);var h=this.getPosition(),i=d[0].offsetWidth,j=d[0].offsetHeight;if(g){var k=this.$element.parent(),l=e,m=document.documentElement.scrollTop||document.body.scrollTop,n=this.options.container=="body"?window.innerWidth:k.outerWidth(),o=this.options.container=="body"?window.innerHeight:k.outerHeight(),p=this.options.container=="body"?0:k.offset().left;e=e=="bottom"&&h.top+h.height+j-m>o?"top":e=="top"&&h.top-m-j<0?"bottom":e=="right"&&h.right+i>n?"left":e=="left"&&h.left-i<p?"right":e,d.removeClass(l).addClass(e)}var q=this.getCalculatedOffset(e,h,i,j);this.applyPlacement(q,e),this.hoverState=null;var r=function(){c.$element.trigger("shown.bs."+c.type)};a.support.transition&&this.$tip.hasClass("fade")?d.one(a.support.transition.end,r).emulateTransitionEnd(150):r()}},b.prototype.applyPlacement=function(b,c){var d,e=this.tip(),f=e[0].offsetWidth,g=e[0].offsetHeight,h=parseInt(e.css("margin-top"),10),i=parseInt(e.css("margin-left"),10);isNaN(h)&&(h=0),isNaN(i)&&(i=0),b.top=b.top+h,b.left=b.left+i,a.offset.setOffset(e[0],a.extend({using:function(a){e.css({top:Math.round(a.top),left:Math.round(a.left)})}},b),0),e.addClass("in");var j=e[0].offsetWidth,k=e[0].offsetHeight;c=="top"&&k!=g&&(d=!0,b.top=b.top+g-k);if(/bottom|top/.test(c)){var l=0;b.left<0&&(l=b.left*-2,b.left=0,e.offset(b),j=e[0].offsetWidth,k=e[0].offsetHeight),this.replaceArrow(l-f+j,j,"left")}else this.replaceArrow(k-g,k,"top");d&&e.offset(b)},b.prototype.replaceArrow=function(a,b,c){this.arrow().css(c,a?50*(1-a/b)+"%":"")},b.prototype.setContent=function(){var a=this.tip(),b=this.getTitle();a.find(".tooltip-inner")[this.options.html?"html":"text"](b),a.removeClass("fade in top bottom left right")},b.prototype.hide=function(){function e(){b.hoverState!="in"&&c.detach(),b.$element.trigger("hidden.bs."+b.type)}var b=this,c=this.tip(),d=a.Event("hide.bs."+this.type);this.$element.trigger(d);if(d.isDefaultPrevented())return;return c.removeClass("in"),a.support.transition&&this.$tip.hasClass("fade")?c.one(a.support.transition.end,e).emulateTransitionEnd(150):e(),this.hoverState=null,this},b.prototype.fixTitle=function(){var a=this.$element;(a.attr("title")||typeof a.attr("data-original-title")!="string")&&a.attr("data-original-title",a.attr("title")||"").attr("title","")},b.prototype.hasContent=function(){return this.getTitle()},b.prototype.getPosition=function(){var b=this.$element[0];return a.extend({},typeof b.getBoundingClientRect=="function"?b.getBoundingClientRect():{width:b.offsetWidth,height:b.offsetHeight},this.$element.offset())},b.prototype.getCalculatedOffset=function(a,b,c,d){return a=="bottom"?{top:b.top+b.height,left:b.left+b.width/2-c/2}:a=="top"?{top:b.top-d,left:b.left+b.width/2-c/2}:a=="left"?{top:b.top+b.height/2-d/2,left:b.left-c}:{top:b.top+b.height/2-d/2,left:b.left+b.width}},b.prototype.getTitle=function(){var a,b=this.$element,c=this.options;return a=b.attr("data-original-title")||(typeof c.title=="function"?c.title.call(b[0]):c.title),a},b.prototype.tip=function(){return this.$tip=this.$tip||a(this.options.template)},b.prototype.arrow=function(){return this.$arrow=this.$arrow||this.tip().find(".tooltip-arrow")},b.prototype.validate=function(){this.$element[0].parentNode||(this.hide(),this.$element=null,this.options=null)},b.prototype.enable=function(){this.enabled=!0},b.prototype.disable=function(){this.enabled=!1},b.prototype.toggleEnabled=function(){this.enabled=!this.enabled},b.prototype.toggle=function(b){var c=b?a(b.currentTarget)[this.type](this.getDelegateOptions()).data("bs."+this.type):this;c.tip().hasClass("in")?c.leave(c):c.enter(c)},b.prototype.destroy=function(){clearTimeout(this.timeout),this.hide().$element.off("."+this.type).removeData("bs."+this.type)};var c=a.fn.tooltip;a.fn.tooltip=function(c){return this.each(function(){var d=a(this),e=d.data("bs.tooltip"),f=typeof c=="object"&&c;if(!e&&c=="destroy")return;e||d.data("bs.tooltip",e=new b(this,f)),typeof c=="string"&&e[c]()})},a.fn.tooltip.Constructor=b,a.fn.tooltip.noConflict=function(){return a.fn.tooltip=c,this}}(jQuery),+function(a){"use strict";var b=function(a,b){this.init("popover",a,b)};if(!a.fn.tooltip)throw new Error("Popover requires tooltip.js");b.DEFAULTS=a.extend({},a.fn.tooltip.Constructor.DEFAULTS,{placement:"right",trigger:"click",content:"",template:'<div class="popover"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'}),b.prototype=a.extend({},a.fn.tooltip.Constructor.prototype),b.prototype.constructor=b,b.prototype.getDefaults=function(){return b.DEFAULTS},b.prototype.setContent=function(){var a=this.tip(),b=this.getTitle(),c=this.getContent();a.find(".popover-title")[this.options.html?"html":"text"](b),a.find(".popover-content")[this.options.html?typeof c=="string"?"html":"append":"text"](c),a.removeClass("fade top bottom left right in"),a.find(".popover-title").html()||a.find(".popover-title").hide()},b.prototype.hasContent=function(){return this.getTitle()||this.getContent()},b.prototype.getContent=function(){var a=this.$element,b=this.options;return a.attr("data-content")||(typeof b.content=="function"?b.content.call(a[0]):b.content)},b.prototype.arrow=function(){return this.$arrow=this.$arrow||this.tip().find(".arrow")},b.prototype.tip=function(){return this.$tip||(this.$tip=a(this.options.template)),this.$tip};var c=a.fn.popover;a.fn.popover=function(c){return this.each(function(){var d=a(this),e=d.data("bs.popover"),f=typeof c=="object"&&c;if(!e&&c=="destroy")return;e||d.data("bs.popover",e=new b(this,f)),typeof c=="string"&&e[c]()})},a.fn.popover.Constructor=b,a.fn.popover.noConflict=function(){return a.fn.popover=c,this}}(jQuery),+function(a){"use strict";var b=function(b){this.element=a(b)};b.prototype.show=function(){var b=this.element,c=b.closest("ul:not(.dropdown-menu)"),d=b.data("target");d||(d=b.attr("href"),d=d&&d.replace(/.*(?=#[^\s]*$)/,""));if(b.parent("li").hasClass("active"))return;var e=c.find(".active:last a")[0],f=a.Event("show.bs.tab",{relatedTarget:e});b.trigger(f);if(f.isDefaultPrevented())return;var g=a(d);this.activate(b.parent("li"),c),this.activate(g,g.parent(),function(){b.trigger({type:"shown.bs.tab",relatedTarget:e})})},b.prototype.activate=function(b,c,d){function g(){e.removeClass("active").find("> .dropdown-menu > .active").removeClass("active"),b.addClass("active"),f?(b[0].offsetWidth,b.addClass("in")):b.removeClass("fade"),b.parent(".dropdown-menu")&&b.closest("li.dropdown").addClass("active"),d&&d()}var e=c.find("> .active"),f=d&&a.support.transition&&e.hasClass("fade");f?e.one(a.support.transition.end,g).emulateTransitionEnd(150):g(),e.removeClass("in")};var c=a.fn.tab;a.fn.tab=function(c){return this.each(function(){var d=a(this),e=d.data("bs.tab");e||d.data("bs.tab",e=new b(this)),typeof c=="string"&&e[c]()})},a.fn.tab.Constructor=b,a.fn.tab.noConflict=function(){return a.fn.tab=c,this},a(document).on("click.bs.tab.data-api",'[data-toggle="tab"], [data-toggle="pill"]',function(b){b.preventDefault(),a(this).tab("show")})}(jQuery),+function(a){"use strict";var b=function(c,d){this.options=a.extend({},b.DEFAULTS,d),this.$window=a(window).on("scroll.bs.affix.data-api",a.proxy(this.checkPosition,this)).on("click.bs.affix.data-api",a.proxy(this.checkPositionWithEventLoop,this)),this.$element=a(c),this.affixed=this.unpin=this.pinnedOffset=null,this.checkPosition()};b.RESET="affix affix-top affix-bottom",b.DEFAULTS={offset:0},b.prototype.getPinnedOffset=function(){if(this.pinnedOffset)return this.pinnedOffset;this.$element.removeClass(b.RESET).addClass("affix");var a=this.$window.scrollTop(),c=this.$element.offset();return this.pinnedOffset=c.top-a},b.prototype.checkPositionWithEventLoop=function(){setTimeout(a.proxy(this.checkPosition,this),1)},b.prototype.checkPosition=function(){if(!this.$element.is(":visible"))return;var c=a(document).height(),d=this.$window.scrollTop(),e=this.$element.offset(),f=this.options.offset,g=f.top,h=f.bottom;this.affixed=="top"&&(e.top+=d),typeof f!="object"&&(h=g=f),typeof g=="function"&&(g=f.top(this.$element)),typeof h=="function"&&(h=f.bottom(this.$element));var i=this.unpin!=null&&d+this.unpin<=e.top?!1:h!=null&&e.top+this.$element.height()>=c-h?"bottom":g!=null&&d<=g?"top":!1;if(this.affixed===i)return;this.unpin&&this.$element.css("top","");var j="affix"+(i?"-"+i:""),k=a.Event(j+".bs.affix");this.$element.trigger(k);if(k.isDefaultPrevented())return;this.affixed=i,this.unpin=i=="bottom"?this.getPinnedOffset():null,this.$element.removeClass(b.RESET).addClass(j).trigger(a.Event(j.replace("affix","affixed"))),i=="bottom"&&this.$element.offset({top:c-h-this.$element.height()})};var c=a.fn.affix;a.fn.affix=function(c){return this.each(function(){var d=a(this),e=d.data("bs.affix"),f=typeof c=="object"&&c;e||d.data("bs.affix",e=new b(this,f)),typeof c=="string"&&e[c]()})},a.fn.affix.Constructor=b,a.fn.affix.noConflict=function(){return a.fn.affix=c,this},a(window).on("load",function(){a('[data-spy="affix"]').each(function(){var b=a(this),c=b.data();c.offset=c.offset||{},c.offsetBottom&&(c.offset.bottom=c.offsetBottom),c.offsetTop&&(c.offset.top=c.offsetTop),b.affix(c)})})}(jQuery),+function(a){"use strict";var b=function(c,d){this.$element=a(c),this.options=a.extend({},b.DEFAULTS,d),this.transitioning=null,this.options.parent&&(this.$parent=a(this.options.parent)),this.options.toggle&&this.toggle()};b.DEFAULTS={toggle:!0},b.prototype.dimension=function(){var a=this.$element.hasClass("width");return a?"width":"height"},b.prototype.show=function(){if(this.transitioning||this.$element.hasClass("in"))return;var b=a.Event("show.bs.collapse");this.$element.trigger(b);if(b.isDefaultPrevented())return;var c=this.$parent&&this.$parent.find("> .panel > .in");if(c&&c.length){var d=c.data("bs.collapse");if(d&&d.transitioning)return;c.collapse("hide"),d||c.data("bs.collapse",null)}var e=this.dimension();this.$element.removeClass("collapse").addClass("collapsing")[e](0),this.transitioning=1;var f=function(){this.$element.removeClass("collapsing").addClass("collapse in")[e]("auto"),this.transitioning=0,this.$element.trigger("shown.bs.collapse")};if(!a.support.transition)return f.call(this);var g=a.camelCase(["scroll",e].join("-"));this.$element.one(a.support.transition.end,a.proxy(f,this)).emulateTransitionEnd(350)[e](this.$element[0][g])},b.prototype.hide=function(){if(this.transitioning||!this.$element.hasClass("in"))return;var b=a.Event("hide.bs.collapse");this.$element.trigger(b);if(b.isDefaultPrevented())return;var c=this.dimension();this.$element[c](this.$element[c]())[0].offsetHeight,this.$element.addClass("collapsing").removeClass("collapse").removeClass("in"),this.transitioning=1;var d=function(){this.transitioning=0,this.$element.trigger("hidden.bs.collapse").removeClass("collapsing").addClass("collapse")};if(!a.support.transition)return d.call(this);this.$element[c](0).one(a.support.transition.end,a.proxy(d,this)).emulateTransitionEnd(350)},b.prototype.toggle=function(){this[this.$element.hasClass("in")?"hide":"show"]()};var c=a.fn.collapse;a.fn.collapse=function(c){return this.each(function(){var d=a(this),e=d.data("bs.collapse"),f=a.extend({},b.DEFAULTS,d.data(),typeof c=="object"&&c);!e&&f.toggle&&c=="show"&&(c=!c),e||d.data("bs.collapse",e=new b(this,f)),typeof c=="string"&&e[c]()})},a.fn.collapse.Constructor=b,a.fn.collapse.noConflict=function(){return a.fn.collapse=c,this},a(document).on("click.bs.collapse.data-api","[data-toggle=collapse]",function(b){var c=a(this),d,e=c.attr("data-target")||b.preventDefault()||(d=c.attr("href"))&&d.replace(/.*(?=#[^\s]+$)/,""),f=a(e),g=f.data("bs.collapse"),h=g?"toggle":c.data(),i=c.attr("data-parent"),j=i&&a(i);if(!g||!g.transitioning)j&&j.find('[data-toggle=collapse][data-parent="'+i+'"]').not(c).addClass("collapsed"),c[f.hasClass("in")?"addClass":"removeClass"]("collapsed");f.collapse(h)})}(jQuery),+function(a){function b(c,d){var e,f=a.proxy(this.process,this);this.$element=a(c).is("body")?a(window):a(c),this.$body=a("body"),this.$scrollElement=this.$element.on("scroll.bs.scroll-spy.data-api",f),this.options=a.extend({},b.DEFAULTS,d),this.selector=(this.options.target||(e=a(c).attr("href"))&&e.replace(/.*(?=#[^\s]+$)/,"")||"")+" .nav li > a",this.offsets=a([]),this.targets=a([]),this.activeTarget=null,this.refresh(),this.process()}"use strict",b.DEFAULTS={offset:10},b.prototype.refresh=function(){var b=this.$element[0]==window?"offset":"position";this.offsets=a([]),this.targets=a([]);var c=this,d=this.$body.find(this.selector).map(function(){var d=a(this),e=d.data("target")||d.attr("href"),f=/^#./.test(e)&&a(e);return f&&f.length&&f.is(":visible")&&[[f[b]().top+(!a.isWindow(c.$scrollElement.get(0))&&c.$scrollElement.scrollTop()),e]]||null}).sort(function(a,b){return a[0]-b[0]}).each(function(){c.offsets.push(this[0]),c.targets.push(this[1])})},b.prototype.process=function(){var a=this.$scrollElement.scrollTop()+this.options.offset,b=this.$scrollElement[0].scrollHeight||this.$body[0].scrollHeight,c=b-this.$scrollElement.height(),d=this.offsets,e=this.targets,f=this.activeTarget,g;if(a>=c)return f!=(g=e.last()[0])&&this.activate(g);if(f&&a<=d[0])return f!=(g=e[0])&&this.activate(g);for(g=d.length;g--;)f!=e[g]&&a>=d[g]&&(!d[g+1]||a<=d[g+1])&&this.activate(e[g])},b.prototype.activate=function(b){this.activeTarget=b,a(this.selector).parentsUntil(this.options.target,".active").removeClass("active");var c=this.selector+'[data-target="'+b+'"],'+this.selector+'[href="'+b+'"]',d=a(c).parents("li").addClass("active");d.parent(".dropdown-menu").length&&(d=d.closest("li.dropdown").addClass("active")),d.trigger("activate.bs.scrollspy")};var c=a.fn.scrollspy;a.fn.scrollspy=function(c){return this.each(function(){var d=a(this),e=d.data("bs.scrollspy"),f=typeof c=="object"&&c;e||d.data("bs.scrollspy",e=new b(this,f)),typeof c=="string"&&e[c]()})},a.fn.scrollspy.Constructor=b,a.fn.scrollspy.noConflict=function(){return a.fn.scrollspy=c,this},a(window).on("load",function(){a('[data-spy="scroll"]').each(function(){var b=a(this);b.scrollspy(b.data())})})}(jQuery),+function(a){function b(){var a=document.createElement("bootstrap"),b={WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"oTransitionEnd otransitionend",transition:"transitionend"};for(var c in b)if(a.style[c]!==undefined)return{end:b[c]};return!1}"use strict",a.fn.emulateTransitionEnd=function(b){var c=!1,d=this;a(this).one(a.support.transition.end,function(){c=!0});var e=function(){c||a(d).trigger(a.support.transition.end)};return setTimeout(e,b),this},a(function(){a.support.transition=b()})}(jQuery);/*global $*/
/*jshint unused:false,forin:false*/

var iosOverlay = function(params) {

	"use strict";

	var overlayDOM;
	var noop = function() {};
	var defaults = {
		onbeforeshow: noop,
		onshow: noop,
		onbeforehide: noop,
		onhide: noop,
		text: "",
		icon: null,
		spinner: null,
		duration: null,
		id: null,
		parentEl: null
	};

	// helper - merge two objects together, without using $.extend
	var merge = function (obj1, obj2) {
		var obj3 = {};
		for (var attrOne in obj1) { obj3[attrOne] = obj1[attrOne]; }
		for (var attrTwo in obj2) { obj3[attrTwo] = obj2[attrTwo]; }
		return obj3;
	};

	// helper - does it support CSS3 transitions/animation
	var doesTransitions = (function() {
		var b = document.body || document.documentElement;
		var s = b.style;
		var p = 'transition';
		if (typeof s[p] === 'string') { return true; }

		// Tests for vendor specific prop
		var v = ['Moz', 'Webkit', 'Khtml', 'O', 'ms'];
		p = p.charAt(0).toUpperCase() + p.substr(1);
		for(var i=0; i<v.length; i++) {
			if (typeof s[v[i] + p] === 'string') { return true; }
		}
		return false;
	}());

	// setup overlay settings
	var settings = merge(defaults,params);

	//
	var handleAnim = function(anim) {
		if (anim.animationName === "ios-overlay-show") {
			settings.onshow();
		}
		if (anim.animationName === "ios-overlay-hide") {
			destroy();
			settings.onhide();
		}
	};

	// IIFE
	var create = (function() {

		// initial DOM creation and event binding
		overlayDOM = document.createElement("div");
		overlayDOM.className = "ui-ios-overlay";
		overlayDOM.innerHTML += '<span class="title">' + settings.text + '</span';
		if (params.icon) {
			overlayDOM.innerHTML += '<i class="fa fa-' + params.icon + '">';
		} else if (params.spinner) {
			overlayDOM.appendChild(params.spinner.el);
		}
		if (doesTransitions) {
			overlayDOM.addEventListener("webkitAnimationEnd", handleAnim, false);
			overlayDOM.addEventListener("msAnimationEnd", handleAnim, false);
			overlayDOM.addEventListener("oAnimationEnd", handleAnim, false);
			overlayDOM.addEventListener("animationend", handleAnim, false);
		}
		if (params.parentEl) {
			document.getElementById(params.parentEl).appendChild(overlayDOM);
		} else {
			document.body.appendChild(overlayDOM);
		}

		settings.onbeforeshow();
		// begin fade in
		if (doesTransitions) {
			overlayDOM.className += " ios-overlay-show";
		} else if (typeof $ === "function") {
			$(overlayDOM).fadeIn({
				duration: 200
			}, function() {
				settings.onshow();
			});
		}

		if (settings.duration) {
			window.setTimeout(function() {
				hide();
			},settings.duration);
		}

	}());

	var hide = function() {
		// pre-callback
		settings.onbeforehide();
		// fade out
		if (doesTransitions) {
			// CSS animation bound to classes
			overlayDOM.className = overlayDOM.className.replace("show","hide");
		} else if (typeof $ === "function") {
			// polyfill requires jQuery
			$(overlayDOM).fadeOut({
				duration: 200
			}, function() {
				destroy();
				settings.onhide();
			});
		}
	};

	var destroy = function() {
		if (params.parentEl) {
			document.getElementById(params.parentEl).removeChild(overlayDOM);
		} else {
			document.body.removeChild(overlayDOM);
		}
	};

	var update = function(params) {

		if (params.text) {
			overlayDOM.getElementsByTagName("span")[0].innerHTML = params.text;
		}
		if (params.icon) {
			if (settings.spinner) {
				settings.spinner.el.parentNode.removeChild(settings.spinner.el);
			}
		}
	};

	return {
		hide: hide,
		destroy: destroy,
		update: update
	};

};
;//! moment.js
//! version : 2.6.0
//! authors : Tim Wood, Iskren Chernev, Moment.js contributors
//! license : MIT
//! momentjs.com
(function(a){function b(){return{empty:!1,unusedTokens:[],unusedInput:[],overflow:-2,charsLeftOver:0,nullInput:!1,invalidMonth:null,invalidFormat:!1,userInvalidated:!1,iso:!1}}function c(a,b){function c(){ib.suppressDeprecationWarnings===!1&&"undefined"!=typeof console&&console.warn&&console.warn("Deprecation warning: "+a)}var d=!0;return i(function(){return d&&(c(),d=!1),b.apply(this,arguments)},b)}function d(a,b){return function(c){return l(a.call(this,c),b)}}function e(a,b){return function(c){return this.lang().ordinal(a.call(this,c),b)}}function f(){}function g(a){y(a),i(this,a)}function h(a){var b=r(a),c=b.year||0,d=b.quarter||0,e=b.month||0,f=b.week||0,g=b.day||0,h=b.hour||0,i=b.minute||0,j=b.second||0,k=b.millisecond||0;this._milliseconds=+k+1e3*j+6e4*i+36e5*h,this._days=+g+7*f,this._months=+e+3*d+12*c,this._data={},this._bubble()}function i(a,b){for(var c in b)b.hasOwnProperty(c)&&(a[c]=b[c]);return b.hasOwnProperty("toString")&&(a.toString=b.toString),b.hasOwnProperty("valueOf")&&(a.valueOf=b.valueOf),a}function j(a){var b,c={};for(b in a)a.hasOwnProperty(b)&&wb.hasOwnProperty(b)&&(c[b]=a[b]);return c}function k(a){return 0>a?Math.ceil(a):Math.floor(a)}function l(a,b,c){for(var d=""+Math.abs(a),e=a>=0;d.length<b;)d="0"+d;return(e?c?"+":"":"-")+d}function m(a,b,c,d){var e=b._milliseconds,f=b._days,g=b._months;d=null==d?!0:d,e&&a._d.setTime(+a._d+e*c),f&&db(a,"Date",cb(a,"Date")+f*c),g&&bb(a,cb(a,"Month")+g*c),d&&ib.updateOffset(a,f||g)}function n(a){return"[object Array]"===Object.prototype.toString.call(a)}function o(a){return"[object Date]"===Object.prototype.toString.call(a)||a instanceof Date}function p(a,b,c){var d,e=Math.min(a.length,b.length),f=Math.abs(a.length-b.length),g=0;for(d=0;e>d;d++)(c&&a[d]!==b[d]||!c&&t(a[d])!==t(b[d]))&&g++;return g+f}function q(a){if(a){var b=a.toLowerCase().replace(/(.)s$/,"$1");a=Zb[a]||$b[b]||b}return a}function r(a){var b,c,d={};for(c in a)a.hasOwnProperty(c)&&(b=q(c),b&&(d[b]=a[c]));return d}function s(b){var c,d;if(0===b.indexOf("week"))c=7,d="day";else{if(0!==b.indexOf("month"))return;c=12,d="month"}ib[b]=function(e,f){var g,h,i=ib.fn._lang[b],j=[];if("number"==typeof e&&(f=e,e=a),h=function(a){var b=ib().utc().set(d,a);return i.call(ib.fn._lang,b,e||"")},null!=f)return h(f);for(g=0;c>g;g++)j.push(h(g));return j}}function t(a){var b=+a,c=0;return 0!==b&&isFinite(b)&&(c=b>=0?Math.floor(b):Math.ceil(b)),c}function u(a,b){return new Date(Date.UTC(a,b+1,0)).getUTCDate()}function v(a,b,c){return $(ib([a,11,31+b-c]),b,c).week}function w(a){return x(a)?366:365}function x(a){return a%4===0&&a%100!==0||a%400===0}function y(a){var b;a._a&&-2===a._pf.overflow&&(b=a._a[pb]<0||a._a[pb]>11?pb:a._a[qb]<1||a._a[qb]>u(a._a[ob],a._a[pb])?qb:a._a[rb]<0||a._a[rb]>23?rb:a._a[sb]<0||a._a[sb]>59?sb:a._a[tb]<0||a._a[tb]>59?tb:a._a[ub]<0||a._a[ub]>999?ub:-1,a._pf._overflowDayOfYear&&(ob>b||b>qb)&&(b=qb),a._pf.overflow=b)}function z(a){return null==a._isValid&&(a._isValid=!isNaN(a._d.getTime())&&a._pf.overflow<0&&!a._pf.empty&&!a._pf.invalidMonth&&!a._pf.nullInput&&!a._pf.invalidFormat&&!a._pf.userInvalidated,a._strict&&(a._isValid=a._isValid&&0===a._pf.charsLeftOver&&0===a._pf.unusedTokens.length)),a._isValid}function A(a){return a?a.toLowerCase().replace("_","-"):a}function B(a,b){return b._isUTC?ib(a).zone(b._offset||0):ib(a).local()}function C(a,b){return b.abbr=a,vb[a]||(vb[a]=new f),vb[a].set(b),vb[a]}function D(a){delete vb[a]}function E(a){var b,c,d,e,f=0,g=function(a){if(!vb[a]&&xb)try{require("./lang/"+a)}catch(b){}return vb[a]};if(!a)return ib.fn._lang;if(!n(a)){if(c=g(a))return c;a=[a]}for(;f<a.length;){for(e=A(a[f]).split("-"),b=e.length,d=A(a[f+1]),d=d?d.split("-"):null;b>0;){if(c=g(e.slice(0,b).join("-")))return c;if(d&&d.length>=b&&p(e,d,!0)>=b-1)break;b--}f++}return ib.fn._lang}function F(a){return a.match(/\[[\s\S]/)?a.replace(/^\[|\]$/g,""):a.replace(/\\/g,"")}function G(a){var b,c,d=a.match(Bb);for(b=0,c=d.length;c>b;b++)d[b]=cc[d[b]]?cc[d[b]]:F(d[b]);return function(e){var f="";for(b=0;c>b;b++)f+=d[b]instanceof Function?d[b].call(e,a):d[b];return f}}function H(a,b){return a.isValid()?(b=I(b,a.lang()),_b[b]||(_b[b]=G(b)),_b[b](a)):a.lang().invalidDate()}function I(a,b){function c(a){return b.longDateFormat(a)||a}var d=5;for(Cb.lastIndex=0;d>=0&&Cb.test(a);)a=a.replace(Cb,c),Cb.lastIndex=0,d-=1;return a}function J(a,b){var c,d=b._strict;switch(a){case"Q":return Nb;case"DDDD":return Pb;case"YYYY":case"GGGG":case"gggg":return d?Qb:Fb;case"Y":case"G":case"g":return Sb;case"YYYYYY":case"YYYYY":case"GGGGG":case"ggggg":return d?Rb:Gb;case"S":if(d)return Nb;case"SS":if(d)return Ob;case"SSS":if(d)return Pb;case"DDD":return Eb;case"MMM":case"MMMM":case"dd":case"ddd":case"dddd":return Ib;case"a":case"A":return E(b._l)._meridiemParse;case"X":return Lb;case"Z":case"ZZ":return Jb;case"T":return Kb;case"SSSS":return Hb;case"MM":case"DD":case"YY":case"GG":case"gg":case"HH":case"hh":case"mm":case"ss":case"ww":case"WW":return d?Ob:Db;case"M":case"D":case"d":case"H":case"h":case"m":case"s":case"w":case"W":case"e":case"E":return Db;case"Do":return Mb;default:return c=new RegExp(R(Q(a.replace("\\","")),"i"))}}function K(a){a=a||"";var b=a.match(Jb)||[],c=b[b.length-1]||[],d=(c+"").match(Xb)||["-",0,0],e=+(60*d[1])+t(d[2]);return"+"===d[0]?-e:e}function L(a,b,c){var d,e=c._a;switch(a){case"Q":null!=b&&(e[pb]=3*(t(b)-1));break;case"M":case"MM":null!=b&&(e[pb]=t(b)-1);break;case"MMM":case"MMMM":d=E(c._l).monthsParse(b),null!=d?e[pb]=d:c._pf.invalidMonth=b;break;case"D":case"DD":null!=b&&(e[qb]=t(b));break;case"Do":null!=b&&(e[qb]=t(parseInt(b,10)));break;case"DDD":case"DDDD":null!=b&&(c._dayOfYear=t(b));break;case"YY":e[ob]=ib.parseTwoDigitYear(b);break;case"YYYY":case"YYYYY":case"YYYYYY":e[ob]=t(b);break;case"a":case"A":c._isPm=E(c._l).isPM(b);break;case"H":case"HH":case"h":case"hh":e[rb]=t(b);break;case"m":case"mm":e[sb]=t(b);break;case"s":case"ss":e[tb]=t(b);break;case"S":case"SS":case"SSS":case"SSSS":e[ub]=t(1e3*("0."+b));break;case"X":c._d=new Date(1e3*parseFloat(b));break;case"Z":case"ZZ":c._useUTC=!0,c._tzm=K(b);break;case"w":case"ww":case"W":case"WW":case"d":case"dd":case"ddd":case"dddd":case"e":case"E":a=a.substr(0,1);case"gg":case"gggg":case"GG":case"GGGG":case"GGGGG":a=a.substr(0,2),b&&(c._w=c._w||{},c._w[a]=b)}}function M(a){var b,c,d,e,f,g,h,i,j,k,l=[];if(!a._d){for(d=O(a),a._w&&null==a._a[qb]&&null==a._a[pb]&&(f=function(b){var c=parseInt(b,10);return b?b.length<3?c>68?1900+c:2e3+c:c:null==a._a[ob]?ib().weekYear():a._a[ob]},g=a._w,null!=g.GG||null!=g.W||null!=g.E?h=_(f(g.GG),g.W||1,g.E,4,1):(i=E(a._l),j=null!=g.d?X(g.d,i):null!=g.e?parseInt(g.e,10)+i._week.dow:0,k=parseInt(g.w,10)||1,null!=g.d&&j<i._week.dow&&k++,h=_(f(g.gg),k,j,i._week.doy,i._week.dow)),a._a[ob]=h.year,a._dayOfYear=h.dayOfYear),a._dayOfYear&&(e=null==a._a[ob]?d[ob]:a._a[ob],a._dayOfYear>w(e)&&(a._pf._overflowDayOfYear=!0),c=W(e,0,a._dayOfYear),a._a[pb]=c.getUTCMonth(),a._a[qb]=c.getUTCDate()),b=0;3>b&&null==a._a[b];++b)a._a[b]=l[b]=d[b];for(;7>b;b++)a._a[b]=l[b]=null==a._a[b]?2===b?1:0:a._a[b];l[rb]+=t((a._tzm||0)/60),l[sb]+=t((a._tzm||0)%60),a._d=(a._useUTC?W:V).apply(null,l)}}function N(a){var b;a._d||(b=r(a._i),a._a=[b.year,b.month,b.day,b.hour,b.minute,b.second,b.millisecond],M(a))}function O(a){var b=new Date;return a._useUTC?[b.getUTCFullYear(),b.getUTCMonth(),b.getUTCDate()]:[b.getFullYear(),b.getMonth(),b.getDate()]}function P(a){a._a=[],a._pf.empty=!0;var b,c,d,e,f,g=E(a._l),h=""+a._i,i=h.length,j=0;for(d=I(a._f,g).match(Bb)||[],b=0;b<d.length;b++)e=d[b],c=(h.match(J(e,a))||[])[0],c&&(f=h.substr(0,h.indexOf(c)),f.length>0&&a._pf.unusedInput.push(f),h=h.slice(h.indexOf(c)+c.length),j+=c.length),cc[e]?(c?a._pf.empty=!1:a._pf.unusedTokens.push(e),L(e,c,a)):a._strict&&!c&&a._pf.unusedTokens.push(e);a._pf.charsLeftOver=i-j,h.length>0&&a._pf.unusedInput.push(h),a._isPm&&a._a[rb]<12&&(a._a[rb]+=12),a._isPm===!1&&12===a._a[rb]&&(a._a[rb]=0),M(a),y(a)}function Q(a){return a.replace(/\\(\[)|\\(\])|\[([^\]\[]*)\]|\\(.)/g,function(a,b,c,d,e){return b||c||d||e})}function R(a){return a.replace(/[-\/\\^$*+?.()|[\]{}]/g,"\\$&")}function S(a){var c,d,e,f,g;if(0===a._f.length)return a._pf.invalidFormat=!0,void(a._d=new Date(0/0));for(f=0;f<a._f.length;f++)g=0,c=i({},a),c._pf=b(),c._f=a._f[f],P(c),z(c)&&(g+=c._pf.charsLeftOver,g+=10*c._pf.unusedTokens.length,c._pf.score=g,(null==e||e>g)&&(e=g,d=c));i(a,d||c)}function T(a){var b,c,d=a._i,e=Tb.exec(d);if(e){for(a._pf.iso=!0,b=0,c=Vb.length;c>b;b++)if(Vb[b][1].exec(d)){a._f=Vb[b][0]+(e[6]||" ");break}for(b=0,c=Wb.length;c>b;b++)if(Wb[b][1].exec(d)){a._f+=Wb[b][0];break}d.match(Jb)&&(a._f+="Z"),P(a)}else ib.createFromInputFallback(a)}function U(b){var c=b._i,d=yb.exec(c);c===a?b._d=new Date:d?b._d=new Date(+d[1]):"string"==typeof c?T(b):n(c)?(b._a=c.slice(0),M(b)):o(c)?b._d=new Date(+c):"object"==typeof c?N(b):"number"==typeof c?b._d=new Date(c):ib.createFromInputFallback(b)}function V(a,b,c,d,e,f,g){var h=new Date(a,b,c,d,e,f,g);return 1970>a&&h.setFullYear(a),h}function W(a){var b=new Date(Date.UTC.apply(null,arguments));return 1970>a&&b.setUTCFullYear(a),b}function X(a,b){if("string"==typeof a)if(isNaN(a)){if(a=b.weekdaysParse(a),"number"!=typeof a)return null}else a=parseInt(a,10);return a}function Y(a,b,c,d,e){return e.relativeTime(b||1,!!c,a,d)}function Z(a,b,c){var d=nb(Math.abs(a)/1e3),e=nb(d/60),f=nb(e/60),g=nb(f/24),h=nb(g/365),i=45>d&&["s",d]||1===e&&["m"]||45>e&&["mm",e]||1===f&&["h"]||22>f&&["hh",f]||1===g&&["d"]||25>=g&&["dd",g]||45>=g&&["M"]||345>g&&["MM",nb(g/30)]||1===h&&["y"]||["yy",h];return i[2]=b,i[3]=a>0,i[4]=c,Y.apply({},i)}function $(a,b,c){var d,e=c-b,f=c-a.day();return f>e&&(f-=7),e-7>f&&(f+=7),d=ib(a).add("d",f),{week:Math.ceil(d.dayOfYear()/7),year:d.year()}}function _(a,b,c,d,e){var f,g,h=W(a,0,1).getUTCDay();return c=null!=c?c:e,f=e-h+(h>d?7:0)-(e>h?7:0),g=7*(b-1)+(c-e)+f+1,{year:g>0?a:a-1,dayOfYear:g>0?g:w(a-1)+g}}function ab(b){var c=b._i,d=b._f;return null===c||d===a&&""===c?ib.invalid({nullInput:!0}):("string"==typeof c&&(b._i=c=E().preparse(c)),ib.isMoment(c)?(b=j(c),b._d=new Date(+c._d)):d?n(d)?S(b):P(b):U(b),new g(b))}function bb(a,b){var c;return"string"==typeof b&&(b=a.lang().monthsParse(b),"number"!=typeof b)?a:(c=Math.min(a.date(),u(a.year(),b)),a._d["set"+(a._isUTC?"UTC":"")+"Month"](b,c),a)}function cb(a,b){return a._d["get"+(a._isUTC?"UTC":"")+b]()}function db(a,b,c){return"Month"===b?bb(a,c):a._d["set"+(a._isUTC?"UTC":"")+b](c)}function eb(a,b){return function(c){return null!=c?(db(this,a,c),ib.updateOffset(this,b),this):cb(this,a)}}function fb(a){ib.duration.fn[a]=function(){return this._data[a]}}function gb(a,b){ib.duration.fn["as"+a]=function(){return+this/b}}function hb(a){"undefined"==typeof ender&&(jb=mb.moment,mb.moment=a?c("Accessing Moment through the global scope is deprecated, and will be removed in an upcoming release.",ib):ib)}for(var ib,jb,kb,lb="2.6.0",mb="undefined"!=typeof global?global:this,nb=Math.round,ob=0,pb=1,qb=2,rb=3,sb=4,tb=5,ub=6,vb={},wb={_isAMomentObject:null,_i:null,_f:null,_l:null,_strict:null,_isUTC:null,_offset:null,_pf:null,_lang:null},xb="undefined"!=typeof module&&module.exports,yb=/^\/?Date\((\-?\d+)/i,zb=/(\-)?(?:(\d*)\.)?(\d+)\:(\d+)(?:\:(\d+)\.?(\d{3})?)?/,Ab=/^(-)?P(?:(?:([0-9,.]*)Y)?(?:([0-9,.]*)M)?(?:([0-9,.]*)D)?(?:T(?:([0-9,.]*)H)?(?:([0-9,.]*)M)?(?:([0-9,.]*)S)?)?|([0-9,.]*)W)$/,Bb=/(\[[^\[]*\])|(\\)?(Mo|MM?M?M?|Do|DDDo|DD?D?D?|ddd?d?|do?|w[o|w]?|W[o|W]?|Q|YYYYYY|YYYYY|YYYY|YY|gg(ggg?)?|GG(GGG?)?|e|E|a|A|hh?|HH?|mm?|ss?|S{1,4}|X|zz?|ZZ?|.)/g,Cb=/(\[[^\[]*\])|(\\)?(LT|LL?L?L?|l{1,4})/g,Db=/\d\d?/,Eb=/\d{1,3}/,Fb=/\d{1,4}/,Gb=/[+\-]?\d{1,6}/,Hb=/\d+/,Ib=/[0-9]*['a-z\u00A0-\u05FF\u0700-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+|[\u0600-\u06FF\/]+(\s*?[\u0600-\u06FF]+){1,2}/i,Jb=/Z|[\+\-]\d\d:?\d\d/gi,Kb=/T/i,Lb=/[\+\-]?\d+(\.\d{1,3})?/,Mb=/\d{1,2}/,Nb=/\d/,Ob=/\d\d/,Pb=/\d{3}/,Qb=/\d{4}/,Rb=/[+-]?\d{6}/,Sb=/[+-]?\d+/,Tb=/^\s*(?:[+-]\d{6}|\d{4})-(?:(\d\d-\d\d)|(W\d\d$)|(W\d\d-\d)|(\d\d\d))((T| )(\d\d(:\d\d(:\d\d(\.\d+)?)?)?)?([\+\-]\d\d(?::?\d\d)?|\s*Z)?)?$/,Ub="YYYY-MM-DDTHH:mm:ssZ",Vb=[["YYYYYY-MM-DD",/[+-]\d{6}-\d{2}-\d{2}/],["YYYY-MM-DD",/\d{4}-\d{2}-\d{2}/],["GGGG-[W]WW-E",/\d{4}-W\d{2}-\d/],["GGGG-[W]WW",/\d{4}-W\d{2}/],["YYYY-DDD",/\d{4}-\d{3}/]],Wb=[["HH:mm:ss.SSSS",/(T| )\d\d:\d\d:\d\d\.\d+/],["HH:mm:ss",/(T| )\d\d:\d\d:\d\d/],["HH:mm",/(T| )\d\d:\d\d/],["HH",/(T| )\d\d/]],Xb=/([\+\-]|\d\d)/gi,Yb=("Date|Hours|Minutes|Seconds|Milliseconds".split("|"),{Milliseconds:1,Seconds:1e3,Minutes:6e4,Hours:36e5,Days:864e5,Months:2592e6,Years:31536e6}),Zb={ms:"millisecond",s:"second",m:"minute",h:"hour",d:"day",D:"date",w:"week",W:"isoWeek",M:"month",Q:"quarter",y:"year",DDD:"dayOfYear",e:"weekday",E:"isoWeekday",gg:"weekYear",GG:"isoWeekYear"},$b={dayofyear:"dayOfYear",isoweekday:"isoWeekday",isoweek:"isoWeek",weekyear:"weekYear",isoweekyear:"isoWeekYear"},_b={},ac="DDD w W M D d".split(" "),bc="M D H h m s w W".split(" "),cc={M:function(){return this.month()+1},MMM:function(a){return this.lang().monthsShort(this,a)},MMMM:function(a){return this.lang().months(this,a)},D:function(){return this.date()},DDD:function(){return this.dayOfYear()},d:function(){return this.day()},dd:function(a){return this.lang().weekdaysMin(this,a)},ddd:function(a){return this.lang().weekdaysShort(this,a)},dddd:function(a){return this.lang().weekdays(this,a)},w:function(){return this.week()},W:function(){return this.isoWeek()},YY:function(){return l(this.year()%100,2)},YYYY:function(){return l(this.year(),4)},YYYYY:function(){return l(this.year(),5)},YYYYYY:function(){var a=this.year(),b=a>=0?"+":"-";return b+l(Math.abs(a),6)},gg:function(){return l(this.weekYear()%100,2)},gggg:function(){return l(this.weekYear(),4)},ggggg:function(){return l(this.weekYear(),5)},GG:function(){return l(this.isoWeekYear()%100,2)},GGGG:function(){return l(this.isoWeekYear(),4)},GGGGG:function(){return l(this.isoWeekYear(),5)},e:function(){return this.weekday()},E:function(){return this.isoWeekday()},a:function(){return this.lang().meridiem(this.hours(),this.minutes(),!0)},A:function(){return this.lang().meridiem(this.hours(),this.minutes(),!1)},H:function(){return this.hours()},h:function(){return this.hours()%12||12},m:function(){return this.minutes()},s:function(){return this.seconds()},S:function(){return t(this.milliseconds()/100)},SS:function(){return l(t(this.milliseconds()/10),2)},SSS:function(){return l(this.milliseconds(),3)},SSSS:function(){return l(this.milliseconds(),3)},Z:function(){var a=-this.zone(),b="+";return 0>a&&(a=-a,b="-"),b+l(t(a/60),2)+":"+l(t(a)%60,2)},ZZ:function(){var a=-this.zone(),b="+";return 0>a&&(a=-a,b="-"),b+l(t(a/60),2)+l(t(a)%60,2)},z:function(){return this.zoneAbbr()},zz:function(){return this.zoneName()},X:function(){return this.unix()},Q:function(){return this.quarter()}},dc=["months","monthsShort","weekdays","weekdaysShort","weekdaysMin"];ac.length;)kb=ac.pop(),cc[kb+"o"]=e(cc[kb],kb);for(;bc.length;)kb=bc.pop(),cc[kb+kb]=d(cc[kb],2);for(cc.DDDD=d(cc.DDD,3),i(f.prototype,{set:function(a){var b,c;for(c in a)b=a[c],"function"==typeof b?this[c]=b:this["_"+c]=b},_months:"January_February_March_April_May_June_July_August_September_October_November_December".split("_"),months:function(a){return this._months[a.month()]},_monthsShort:"Jan_Feb_Mar_Apr_May_Jun_Jul_Aug_Sep_Oct_Nov_Dec".split("_"),monthsShort:function(a){return this._monthsShort[a.month()]},monthsParse:function(a){var b,c,d;for(this._monthsParse||(this._monthsParse=[]),b=0;12>b;b++)if(this._monthsParse[b]||(c=ib.utc([2e3,b]),d="^"+this.months(c,"")+"|^"+this.monthsShort(c,""),this._monthsParse[b]=new RegExp(d.replace(".",""),"i")),this._monthsParse[b].test(a))return b},_weekdays:"Sunday_Monday_Tuesday_Wednesday_Thursday_Friday_Saturday".split("_"),weekdays:function(a){return this._weekdays[a.day()]},_weekdaysShort:"Sun_Mon_Tue_Wed_Thu_Fri_Sat".split("_"),weekdaysShort:function(a){return this._weekdaysShort[a.day()]},_weekdaysMin:"Su_Mo_Tu_We_Th_Fr_Sa".split("_"),weekdaysMin:function(a){return this._weekdaysMin[a.day()]},weekdaysParse:function(a){var b,c,d;for(this._weekdaysParse||(this._weekdaysParse=[]),b=0;7>b;b++)if(this._weekdaysParse[b]||(c=ib([2e3,1]).day(b),d="^"+this.weekdays(c,"")+"|^"+this.weekdaysShort(c,"")+"|^"+this.weekdaysMin(c,""),this._weekdaysParse[b]=new RegExp(d.replace(".",""),"i")),this._weekdaysParse[b].test(a))return b},_longDateFormat:{LT:"h:mm A",L:"MM/DD/YYYY",LL:"MMMM D YYYY",LLL:"MMMM D YYYY LT",LLLL:"dddd, MMMM D YYYY LT"},longDateFormat:function(a){var b=this._longDateFormat[a];return!b&&this._longDateFormat[a.toUpperCase()]&&(b=this._longDateFormat[a.toUpperCase()].replace(/MMMM|MM|DD|dddd/g,function(a){return a.slice(1)}),this._longDateFormat[a]=b),b},isPM:function(a){return"p"===(a+"").toLowerCase().charAt(0)},_meridiemParse:/[ap]\.?m?\.?/i,meridiem:function(a,b,c){return a>11?c?"pm":"PM":c?"am":"AM"},_calendar:{sameDay:"[Today at] LT",nextDay:"[Tomorrow at] LT",nextWeek:"dddd [at] LT",lastDay:"[Yesterday at] LT",lastWeek:"[Last] dddd [at] LT",sameElse:"L"},calendar:function(a,b){var c=this._calendar[a];return"function"==typeof c?c.apply(b):c},_relativeTime:{future:"in %s",past:"%s ago",s:"a few seconds",m:"a minute",mm:"%d minutes",h:"an hour",hh:"%d hours",d:"a day",dd:"%d days",M:"a month",MM:"%d months",y:"a year",yy:"%d years"},relativeTime:function(a,b,c,d){var e=this._relativeTime[c];return"function"==typeof e?e(a,b,c,d):e.replace(/%d/i,a)},pastFuture:function(a,b){var c=this._relativeTime[a>0?"future":"past"];return"function"==typeof c?c(b):c.replace(/%s/i,b)},ordinal:function(a){return this._ordinal.replace("%d",a)},_ordinal:"%d",preparse:function(a){return a},postformat:function(a){return a},week:function(a){return $(a,this._week.dow,this._week.doy).week},_week:{dow:0,doy:6},_invalidDate:"Invalid date",invalidDate:function(){return this._invalidDate}}),ib=function(c,d,e,f){var g;return"boolean"==typeof e&&(f=e,e=a),g={},g._isAMomentObject=!0,g._i=c,g._f=d,g._l=e,g._strict=f,g._isUTC=!1,g._pf=b(),ab(g)},ib.suppressDeprecationWarnings=!1,ib.createFromInputFallback=c("moment construction falls back to js Date. This is discouraged and will be removed in upcoming major release. Please refer to https://github.com/moment/moment/issues/1407 for more info.",function(a){a._d=new Date(a._i)}),ib.utc=function(c,d,e,f){var g;return"boolean"==typeof e&&(f=e,e=a),g={},g._isAMomentObject=!0,g._useUTC=!0,g._isUTC=!0,g._l=e,g._i=c,g._f=d,g._strict=f,g._pf=b(),ab(g).utc()},ib.unix=function(a){return ib(1e3*a)},ib.duration=function(a,b){var c,d,e,f=a,g=null;return ib.isDuration(a)?f={ms:a._milliseconds,d:a._days,M:a._months}:"number"==typeof a?(f={},b?f[b]=a:f.milliseconds=a):(g=zb.exec(a))?(c="-"===g[1]?-1:1,f={y:0,d:t(g[qb])*c,h:t(g[rb])*c,m:t(g[sb])*c,s:t(g[tb])*c,ms:t(g[ub])*c}):(g=Ab.exec(a))&&(c="-"===g[1]?-1:1,e=function(a){var b=a&&parseFloat(a.replace(",","."));return(isNaN(b)?0:b)*c},f={y:e(g[2]),M:e(g[3]),d:e(g[4]),h:e(g[5]),m:e(g[6]),s:e(g[7]),w:e(g[8])}),d=new h(f),ib.isDuration(a)&&a.hasOwnProperty("_lang")&&(d._lang=a._lang),d},ib.version=lb,ib.defaultFormat=Ub,ib.momentProperties=wb,ib.updateOffset=function(){},ib.lang=function(a,b){var c;return a?(b?C(A(a),b):null===b?(D(a),a="en"):vb[a]||E(a),c=ib.duration.fn._lang=ib.fn._lang=E(a),c._abbr):ib.fn._lang._abbr},ib.langData=function(a){return a&&a._lang&&a._lang._abbr&&(a=a._lang._abbr),E(a)},ib.isMoment=function(a){return a instanceof g||null!=a&&a.hasOwnProperty("_isAMomentObject")},ib.isDuration=function(a){return a instanceof h},kb=dc.length-1;kb>=0;--kb)s(dc[kb]);ib.normalizeUnits=function(a){return q(a)},ib.invalid=function(a){var b=ib.utc(0/0);return null!=a?i(b._pf,a):b._pf.userInvalidated=!0,b},ib.parseZone=function(){return ib.apply(null,arguments).parseZone()},ib.parseTwoDigitYear=function(a){return t(a)+(t(a)>68?1900:2e3)},i(ib.fn=g.prototype,{clone:function(){return ib(this)},valueOf:function(){return+this._d+6e4*(this._offset||0)},unix:function(){return Math.floor(+this/1e3)},toString:function(){return this.clone().lang("en").format("ddd MMM DD YYYY HH:mm:ss [GMT]ZZ")},toDate:function(){return this._offset?new Date(+this):this._d},toISOString:function(){var a=ib(this).utc();return 0<a.year()&&a.year()<=9999?H(a,"YYYY-MM-DD[T]HH:mm:ss.SSS[Z]"):H(a,"YYYYYY-MM-DD[T]HH:mm:ss.SSS[Z]")},toArray:function(){var a=this;return[a.year(),a.month(),a.date(),a.hours(),a.minutes(),a.seconds(),a.milliseconds()]},isValid:function(){return z(this)},isDSTShifted:function(){return this._a?this.isValid()&&p(this._a,(this._isUTC?ib.utc(this._a):ib(this._a)).toArray())>0:!1},parsingFlags:function(){return i({},this._pf)},invalidAt:function(){return this._pf.overflow},utc:function(){return this.zone(0)},local:function(){return this.zone(0),this._isUTC=!1,this},format:function(a){var b=H(this,a||ib.defaultFormat);return this.lang().postformat(b)},add:function(a,b){var c;return c="string"==typeof a?ib.duration(+b,a):ib.duration(a,b),m(this,c,1),this},subtract:function(a,b){var c;return c="string"==typeof a?ib.duration(+b,a):ib.duration(a,b),m(this,c,-1),this},diff:function(a,b,c){var d,e,f=B(a,this),g=6e4*(this.zone()-f.zone());return b=q(b),"year"===b||"month"===b?(d=432e5*(this.daysInMonth()+f.daysInMonth()),e=12*(this.year()-f.year())+(this.month()-f.month()),e+=(this-ib(this).startOf("month")-(f-ib(f).startOf("month")))/d,e-=6e4*(this.zone()-ib(this).startOf("month").zone()-(f.zone()-ib(f).startOf("month").zone()))/d,"year"===b&&(e/=12)):(d=this-f,e="second"===b?d/1e3:"minute"===b?d/6e4:"hour"===b?d/36e5:"day"===b?(d-g)/864e5:"week"===b?(d-g)/6048e5:d),c?e:k(e)},from:function(a,b){return ib.duration(this.diff(a)).lang(this.lang()._abbr).humanize(!b)},fromNow:function(a){return this.from(ib(),a)},calendar:function(){var a=B(ib(),this).startOf("day"),b=this.diff(a,"days",!0),c=-6>b?"sameElse":-1>b?"lastWeek":0>b?"lastDay":1>b?"sameDay":2>b?"nextDay":7>b?"nextWeek":"sameElse";return this.format(this.lang().calendar(c,this))},isLeapYear:function(){return x(this.year())},isDST:function(){return this.zone()<this.clone().month(0).zone()||this.zone()<this.clone().month(5).zone()},day:function(a){var b=this._isUTC?this._d.getUTCDay():this._d.getDay();return null!=a?(a=X(a,this.lang()),this.add({d:a-b})):b},month:eb("Month",!0),startOf:function(a){switch(a=q(a)){case"year":this.month(0);case"quarter":case"month":this.date(1);case"week":case"isoWeek":case"day":this.hours(0);case"hour":this.minutes(0);case"minute":this.seconds(0);case"second":this.milliseconds(0)}return"week"===a?this.weekday(0):"isoWeek"===a&&this.isoWeekday(1),"quarter"===a&&this.month(3*Math.floor(this.month()/3)),this},endOf:function(a){return a=q(a),this.startOf(a).add("isoWeek"===a?"week":a,1).subtract("ms",1)},isAfter:function(a,b){return b="undefined"!=typeof b?b:"millisecond",+this.clone().startOf(b)>+ib(a).startOf(b)},isBefore:function(a,b){return b="undefined"!=typeof b?b:"millisecond",+this.clone().startOf(b)<+ib(a).startOf(b)},isSame:function(a,b){return b=b||"ms",+this.clone().startOf(b)===+B(a,this).startOf(b)},min:function(a){return a=ib.apply(null,arguments),this>a?this:a},max:function(a){return a=ib.apply(null,arguments),a>this?this:a},zone:function(a,b){var c=this._offset||0;return null==a?this._isUTC?c:this._d.getTimezoneOffset():("string"==typeof a&&(a=K(a)),Math.abs(a)<16&&(a=60*a),this._offset=a,this._isUTC=!0,c!==a&&(!b||this._changeInProgress?m(this,ib.duration(c-a,"m"),1,!1):this._changeInProgress||(this._changeInProgress=!0,ib.updateOffset(this,!0),this._changeInProgress=null)),this)},zoneAbbr:function(){return this._isUTC?"UTC":""},zoneName:function(){return this._isUTC?"Coordinated Universal Time":""},parseZone:function(){return this._tzm?this.zone(this._tzm):"string"==typeof this._i&&this.zone(this._i),this},hasAlignedHourOffset:function(a){return a=a?ib(a).zone():0,(this.zone()-a)%60===0},daysInMonth:function(){return u(this.year(),this.month())},dayOfYear:function(a){var b=nb((ib(this).startOf("day")-ib(this).startOf("year"))/864e5)+1;return null==a?b:this.add("d",a-b)},quarter:function(a){return null==a?Math.ceil((this.month()+1)/3):this.month(3*(a-1)+this.month()%3)},weekYear:function(a){var b=$(this,this.lang()._week.dow,this.lang()._week.doy).year;return null==a?b:this.add("y",a-b)},isoWeekYear:function(a){var b=$(this,1,4).year;return null==a?b:this.add("y",a-b)},week:function(a){var b=this.lang().week(this);return null==a?b:this.add("d",7*(a-b))},isoWeek:function(a){var b=$(this,1,4).week;return null==a?b:this.add("d",7*(a-b))},weekday:function(a){var b=(this.day()+7-this.lang()._week.dow)%7;return null==a?b:this.add("d",a-b)},isoWeekday:function(a){return null==a?this.day()||7:this.day(this.day()%7?a:a-7)},isoWeeksInYear:function(){return v(this.year(),1,4)},weeksInYear:function(){var a=this._lang._week;return v(this.year(),a.dow,a.doy)},get:function(a){return a=q(a),this[a]()},set:function(a,b){return a=q(a),"function"==typeof this[a]&&this[a](b),this},lang:function(b){return b===a?this._lang:(this._lang=E(b),this)}}),ib.fn.millisecond=ib.fn.milliseconds=eb("Milliseconds",!1),ib.fn.second=ib.fn.seconds=eb("Seconds",!1),ib.fn.minute=ib.fn.minutes=eb("Minutes",!1),ib.fn.hour=ib.fn.hours=eb("Hours",!0),ib.fn.date=eb("Date",!0),ib.fn.dates=c("dates accessor is deprecated. Use date instead.",eb("Date",!0)),ib.fn.year=eb("FullYear",!0),ib.fn.years=c("years accessor is deprecated. Use year instead.",eb("FullYear",!0)),ib.fn.days=ib.fn.day,ib.fn.months=ib.fn.month,ib.fn.weeks=ib.fn.week,ib.fn.isoWeeks=ib.fn.isoWeek,ib.fn.quarters=ib.fn.quarter,ib.fn.toJSON=ib.fn.toISOString,i(ib.duration.fn=h.prototype,{_bubble:function(){var a,b,c,d,e=this._milliseconds,f=this._days,g=this._months,h=this._data;h.milliseconds=e%1e3,a=k(e/1e3),h.seconds=a%60,b=k(a/60),h.minutes=b%60,c=k(b/60),h.hours=c%24,f+=k(c/24),h.days=f%30,g+=k(f/30),h.months=g%12,d=k(g/12),h.years=d},weeks:function(){return k(this.days()/7)},valueOf:function(){return this._milliseconds+864e5*this._days+this._months%12*2592e6+31536e6*t(this._months/12)},humanize:function(a){var b=+this,c=Z(b,!a,this.lang());return a&&(c=this.lang().pastFuture(b,c)),this.lang().postformat(c)},add:function(a,b){var c=ib.duration(a,b);return this._milliseconds+=c._milliseconds,this._days+=c._days,this._months+=c._months,this._bubble(),this},subtract:function(a,b){var c=ib.duration(a,b);return this._milliseconds-=c._milliseconds,this._days-=c._days,this._months-=c._months,this._bubble(),this},get:function(a){return a=q(a),this[a.toLowerCase()+"s"]()},as:function(a){return a=q(a),this["as"+a.charAt(0).toUpperCase()+a.slice(1)+"s"]()},lang:ib.fn.lang,toIsoString:function(){var a=Math.abs(this.years()),b=Math.abs(this.months()),c=Math.abs(this.days()),d=Math.abs(this.hours()),e=Math.abs(this.minutes()),f=Math.abs(this.seconds()+this.milliseconds()/1e3);return this.asSeconds()?(this.asSeconds()<0?"-":"")+"P"+(a?a+"Y":"")+(b?b+"M":"")+(c?c+"D":"")+(d||e||f?"T":"")+(d?d+"H":"")+(e?e+"M":"")+(f?f+"S":""):"P0D"}});for(kb in Yb)Yb.hasOwnProperty(kb)&&(gb(kb,Yb[kb]),fb(kb.toLowerCase()));gb("Weeks",6048e5),ib.duration.fn.asMonths=function(){return(+this-31536e6*this.years())/2592e6+12*this.years()},ib.lang("en",{ordinal:function(a){var b=a%10,c=1===t(a%100/10)?"th":1===b?"st":2===b?"nd":3===b?"rd":"th";return a+c}}),xb?module.exports=ib:"function"==typeof define&&define.amd?(define("moment",function(a,b,c){return c.config&&c.config()&&c.config().noGlobal===!0&&(mb.moment=jb),ib}),hb(!0)):hb()}).call(this);;Reed.controller('Add', function ($scope, $rootScope, $timeout, Api, State, Overlay, Collection) {

	$scope.submit = function(isValid) {

		var overlay = Overlay.init('busy', 'Loading');

		if (isValid) {

			Api.UserFeeds.post({}, $scope.form, function(response) {

				Collection.folders.forEach(function(folder) {

					if(folder.title === response.folder) {

						Collection.add(Collection.feeds, response.source);
						Collection.add(folder.items, response.source);

						response.items.forEach(function (el) {
							Collection.add(Collection.articles, el);
						});

					}

				});

				Overlay.init(response.status, response.message);

			}, function(response) {
				Overlay.update(response.status, 'Bad url');
			});

		} else {
			Overlay.update(response.status, 'Error');
		}

	};

	$scope.add = function(feed, feeds, index) {

		feed.proccessing = {
			under: true
		};

		Api.UserFeeds.post({
			'rssUrl': feed.url
		}, function(response) {

			feed.proccessing = {
				done: true
			};

			Collection.folders.forEach(function(folder) {

				if(folder.title === response.folder) {

					Collection.add(Collection.feeds, response.source);
					Collection.add(folder.items, response.source);

					response.items.forEach(function (el) {
						Collection.add(Collection.articles, el);
					});

				}

			});


			$timeout(function () {

				$rootScope.state = State.set({
					articles: Collection.filter('articles', {
						unread: '1'
					}).length,
				});
				Collection.discovery.feeds.splice(index, 1);

			}, 1000);

		});

	};

	Collection.ready([Collection.articles.$promise], function () {
		$scope.form = {};
		$scope.view = {
			section: 'list',
			content: Collection.discovery.feeds
		};
	});

});
;Reed.controller('All', function ($scope, $filter, $cookieStore, Api, State, Collection) {

	// $scope.loadMore = function () {

	// 	var acc = Api.UserArticles.get({
	// 		offset: $scope.view.content.length - 1
	// 	});
	// 	console.log(acc);

	// };

	$scope.showArticle = function (el) {

		el.unread = '0';

		angular.extend($scope.view, {
			panel: false,
			section: 'single',
			single: el,
			scrollPosition: $('#thumbs').scrollTop()
		});

		Api.UserArticle.update({
			articleid: el.id
		}, {
			unread: el.unread,
			favourite: el.favourite,
			later: el.later
		});

	};

	$scope.nextArticle = function (el) {

		el.unread = '0';

		angular.extend($scope.view, {
			panel: false,
			section: 'single',
			single: el
		});

		Api.UserArticle.update({
			articleid: el.id
		}, {
			unread: el.unread,
			favourite: el.favourite,
			later: el.later
		});

	};


	Collection.ready([
		Collection.articles.$promise,
		Collection.feeds.$promise
	], function () {

		$scope.collection = Collection;

		$scope.view = {
			is: 'All',
			title: 'All',
			section: 'list',
			content: Collection.orderBy(Collection.articles, '-created')
		};

	});

});
;Reed.controller('Discover', function ($scope, $filter, Api, State, Collection) {

	$scope.showArticle = function (el) {

		angular.extend($scope.view, {
			section: 'single',
			single: el,
			scrollPosition: $('#thumbs').scrollTop()
		});

	};

	$scope.nextArticle = function (el) {

		angular.extend($scope.view, {
			section: 'single',
			single: el
		});

	};

	Collection.ready([
		Collection.discovery.articles.$promise,
		Collection.discovery.feeds.$promise,
	], function () {

		$scope.collection = Collection;

		$scope.view = {
			is: 'Discover',
			title: 'Discover',
			section: 'list',
			content: Collection.discovery.articles
		};

	});

});
;Reed.controller('Favourites', function ($scope, $filter, Api, State, Collection) {

	$scope.showArticle = function (el) {

		angular.extend($scope.view, {
			section: 'single',
			single: el,
			scrollPosition: $('#thumbs').scrollTop()
		});

	};

	$scope.nextArticle = function (el) {

		angular.extend($scope.view, {
			section: 'single',
			single: el
		});

	};

	Collection.ready([
		Collection.favourites.$promise,
		Collection.feeds.$promise
	], function() {

		$scope.collection = Collection;

		$scope.view = {
			is: 'Favourites',
			title: 'Favourites',
			section: 'list',
			content: Collection.filter(Collection.articles, {
				favourite: '1'
			})
		};

	});

});
;Reed.controller('Feeds', function ($scope, $routeParams, Api, State, Collection) {


	$scope.showArticle = function (el) {

		if(el.unread == 1) State.update('articles', 0);
		el.unread = '0';

		angular.extend($scope.view, {
			panel: false,
			section: 'single',
			single: el,
			scrollPosition: $('#thumbs').scrollTop()
		});

		Api.UserArticle.update({
			articleid: el.id
		}, {
			unread: el.unread,
			favourite: el.favourite,
			later: el.later
		});

	};

	$scope.nextArticle = function (el) {

		if(el.unread == 1) State.update('articles', 0);
		el.unread = '0';

		angular.extend($scope.view, {
			panel: false,
			section: 'single',
			single: el
		});

		Api.UserArticle.update({
			articleid: el.id
		}, {
			unread: el.unread,
			favourite: el.favourite,
			later: el.later
		});

	};

	Collection.ready([
		Collection.articles.$promise,
		Collection.feeds.$promise
	], function () {

		$scope.collection = Collection;

		$scope.view = {
			is: 'Feeds',
			title: Collection.filter(Collection.feeds, {
				id: $routeParams.id
			})[0].title,
			section: 'list',
			content: Collection.filter(Collection.articles, {
				feed: $routeParams.id
			})
		};

	});

});
;Reed.controller('Later', function ($scope, $filter, Api, State, Collection) {

	$scope.showArticle = function (el) {

		angular.extend($scope.view, {
			section: 'single',
			single: el,
			scrollPosition: $('#thumbs').scrollTop()
		});

	};

	$scope.nextArticle = function (el) {

		angular.extend($scope.view, {
			section: 'single',
			single: el
		});

	};

	Collection.ready([
		Collection.favourites.$promise,
		Collection.feeds.$promise
	], function () {

		$scope.collection = Collection;

		$scope.view = {
			is: 'Later',
			title: 'Read later',
			section: 'list',
			content: Collection.filter(Collection.articles, {
				later: '1'
			})
		};

	});

});
;Reed.controller('Login', function ($scope, $resource, $location, $cookieStore, ezfb, AuthService) {

			$scope.login = function () {

				ezfb.login(function (res) {

					var AuthToken = $resource('api/auth', {}, {
						get: {
							method: 'GET',
							headers: {
								'Authorization': res.authResponse.accessToken
							}
						}
					});

					var user = AuthToken.get({}, function () {
						$cookieStore.put('reed_userid', user.userid);
						$cookieStore.put('reed_authtoken', user.authtoken);
						$location.path('/discovery').replace();
					});

				}, { scope: 'email' });

			};

			$scope.logout = function () {

				ezfb.logout(function () {
					console.log('Logout');
				});

			};

			/**
			 * While user is already authenticated
			 * redirect to app.
			 */
			if (AuthService.getUserAuthenticated()) {
				$location.path('/discovery').replace();
			}

			/**
			 * While user isn't authenticated,
			 * but is already connected to facebook
			 * procced normal authentication workflow.
			 */
			// ezfb.getLoginStatus(function (res) {
			// 	if (res.status === 'connected') {
			// 		$scope.login();
			// 	}
			// });

		}

);
;Reed.controller('Menu', function ($scope, $filter, $rootScope, $cookieStore, Api, State, Collection) {

	$scope.toggleSidebar = function () {
		$scope.view.panel = !$scope.view.panel;
	};

	$scope.count = function (collection, el) {

		switch(collection) {

			case 'unread':
				return Collection.filter(Collection.articles, {
					unread: '1'
				}).length;
				break;

			case 'favourites':
				return Collection.filter(Collection.articles, {
					favourite: '1'
				}).length;
				break;

			case 'later':
				return Collection.filter(Collection.articles, {
					later: '1'
				}).length;
				break;

			case 'feeds':
				return Collection.filter(Collection.articles, {
					unread: '1',
					feed: el.id
				}).length;
				break;

		}

	};

	Collection.ready([
		Collection.user.$promise,
		Collection.articles.$promise,
		Collection.feeds.$promise
	], function() {

		State.data.flashback = $scope.view.content;

		$scope.collection = Collection;

	});



});
;Reed.controller('Navbar', function ($scope, $filter, Api, State, Collection, Overlay) {

	$scope.saveForLater = function (el) {

		var overlay = Overlay.init('busy', 'Loading');

		el.later = '1' - el.later;

		// if(Collection.later.indexOf(el) === -1) Collection.later.push(el);
		Collection.add(Collection.articles, el);

		Api.UserArticle.update({
			articleid: el.id
		}, {
			unread: '0',
			favourite: el.favourite.toString(),
			later: el.later.toString()
		}, function (data) {
			Overlay.destroy();
			if(el.later) {
				Overlay.init(data.status, 'Saved for later');
			} else {
				Overlay.init(data.status, 'Removed form later');
			}
		}, function (data) {
			Overlay.init(data.status, data.message);
		});

	};

	$scope.markAsFav = function (el) {

		var overlay = Overlay.init('busy', 'Loading');

		el.favourite = '1' - el.favourite;

		// if(Collection.favourites.indexOf(el) === -1) Collection.favourites.push(el);
		Collection.add(Collection.articles, el);

		Api.UserArticle.update({
			articleid: el.id
		}, {
			unread: '0',
			favourite: el.favourite.toString(),
			later: el.later.toString()
		}, function (data) {
			Overlay.destroy();
			if(el.favourite) {
				Overlay.init(data.status, 'Marked as fav');
			} else {
				Overlay.init(data.status, 'Unmarked as fav');
			}
		}, function (data) {
			Overlay.destroy();
			Overlay.init(data.status, data.message);
		});

	};

	$scope.unread = function (el) {

		el.unread = '1' - el.unread.toString();

		// if(Collection.articles.indexOf(el) === -1) Collection.articles.push(el);
		Collection.add(Collection.articles, el);

		Api.UserArticle.update({
			articleid: el.id
		}, {
			unread: el.unread.toString(),
			favourite: el.favourite.toString(),
			later: el.later.toString()
		});

	};

	$scope.share = function (el) {
		console.log(el);
	};

});
;Reed.controller('Navigation', function ($scope, State, Collection) {

	// Collection.ready([
	// 	Collection.user.$promise,
	// 	Collection.articles.$promise,
	// 	Collection.favourites.$promise,
	// 	Collection.later.$promise,
	// 	Collection.feeds.$promise
	// ], function() {
	// 	$scope.collection = Collection;
	// 	$scope.folders = Collection.feeds;
	// });


});


;Reed.controller('Profile', function ($scope, $cookieStore, $location, $timeout, Api, State, Collection, Overlay) {

	$scope.logout = function () {
		$cookieStore.remove('reed_authtoken');
		$cookieStore.remove('reed_userid');
		$location.path('/').replace();
	};

	$scope.removeProfile = function () {
		Api.User.delete({}, function () {
			Overlay.init('success', 'Account removed');
			$timeout(function () {
				$scope.logout();
				$location.path('/').replace();
			}, 500);
		});
	};

	Collection.ready([
		Collection.articles.$promise,
		Collection.feeds.$promise
	], function () {

		$scope.collection = Collection;

		$scope.view = {
			is: 'Profile',
			title: 'Profile',
			section: 'list',
			content: Collection.user
		};

	});

});
;Reed.controller('Settings', function ($scope, $filter, Api, State, Collection, Overlay) {

	$scope.addFolder = function (name) {

		if(name) {

			var folder = false;

			_.each(Collection.folders, function (el) {
				if(el.title === name) folder = true;
			});

			if(!folder) {
				Collection.add(Collection.folders, {
					'title': name,
					'items': []
				});
			} else {
				Overlay.init('error', 'Folder exsist');
			}

		} else {
			Overlay.init('error', 'Folder name empty')
		}

	};


	$scope.changeFolder = function (folder, el) {

		if(folder.title != el.folder) {

			el.folder = folder.title;

			Api.UserFeed.update({
				feedid: el.id
			}, el);

		}

	};


	$scope.deleteFeed = function (index, feed, items) {

		Api.UserFeed.delete({

			feedid: feed.id

		}, function (response) {

			_.each(response.items, function (el) {
				Collection.articles = Collection.remove(Collection.articles, el);
			});

			items.splice(index, 1);

			Overlay.init(response.status, response.message);

		});

	};


	Collection.ready([
		Collection.articles.$promise,
		Collection.feeds.$promise
	], function () {

		$scope.collection = Collection;

		$scope.view = {
			is: 'Settings',
			title: 'Organise feeds',
			section: 'list',
			// content: Collection.user
		};

	});

});
;Reed.controller('Sort', function ($scope, $filter, $cookieStore, Api, State, Collection, Overlay) {


	$scope.filterByUnread = function () {

		if (State.user.filter == true) {

			var data = $filter('filter')($scope.view.content, { unread: "1" });

			angular.extend($scope.view, {
				section: 'list',
				content: data,
			});

		} else if(State.user.filter == false) {

			angular.extend($scope.view, {
				section: 'list',
				content: State.data.flashback,
			});

		}
	};


	$scope.markAllAsRead = function () {
		_.each($scope.view.content, function (el) {
			angular.extend(el, {
				unread: '0'
			});
		});

		Api.UserArticles.update({
			'items': $scope.view.content
		}, function (response) {
			Overlay.init(response.status, 'All articles marked as read');
		});
	};


	Collection.ready([Collection.articles.$promise], function () {

		$scope.state = State;

		$scope.$watch('state.user.filter', function () {
			$cookieStore.put('reed_userfilter', State.user.filter);
			$scope.filterByUnread();
		});

	});

});
;/**
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 */

/**
 * Implementing Drag and Drop functionality in AngularJS is easier than ever.
 * Demo: http://codef0rmer.github.com/angular-dragdrop/
 *
 * @version 1.0.7
 *
 * (c) 2013 Amit Gharat a.k.a codef0rmer <amit.2006.it@gmail.com> - amitgharat.wordpress.com
 */

(function (window, angular, undefined) {
'use strict';

var jqyoui = angular.module('ngDragDrop', []).service('ngDragDropService', ['$timeout', '$parse', function($timeout, $parse) {
    this.callEventCallback = function (scope, callbackName, event, ui) {
      if (!callbackName) return;

      var objExtract = extract(callbackName),
          callback = objExtract.callback,
          constructor = objExtract.constructor,
          args = [event, ui].concat(objExtract.args);
      
      // call either $scoped method i.e. $scope.dropCallback or constructor's method i.e. this.dropCallback
      scope.$apply((scope[callback] || scope[constructor][callback]).apply(scope, args));
      
      function extract(callbackName) {
        var atStartBracket = callbackName.indexOf('(') !== -1 ? callbackName.indexOf('(') : callbackName.length,
            atEndBracket = callbackName.lastIndexOf(')') !== -1 ? callbackName.lastIndexOf(')') : callbackName.length,
            args = callbackName.substring(atStartBracket + 1, atEndBracket), // matching function arguments inside brackets
            constructor = callbackName.match(/^[^.]+.\s*/)[0].slice(0, -1); // matching a string upto a dot to check ctrl as syntax
            constructor = scope[constructor] && typeof scope[constructor].constructor === 'function' ? constructor : null;

        return {
          callback: callbackName.substring(constructor && constructor.length + 1 || 0, atStartBracket),
          args: (args && args.split(',') || []).map(function(item) { return $parse(item)(scope); }),
          constructor: constructor
        }
      }
    };

    this.invokeDrop = function ($draggable, $droppable, event, ui) {
      var dragModel = '',
        dropModel = '',
        dragSettings = {},
        dropSettings = {},
        jqyoui_pos = null,
        dragItem = {},
        dropItem = {},
        dragModelValue,
        dropModelValue,
        $droppableDraggable = null,
        droppableScope = $droppable.scope(),
        draggableScope = $draggable.scope();

      dragModel = $draggable.ngattr('ng-model');
      dropModel = $droppable.ngattr('ng-model');
      dragModelValue = draggableScope.$eval(dragModel);
      dropModelValue = droppableScope.$eval(dropModel);

      $droppableDraggable = $droppable.find('[jqyoui-draggable]:last,[data-jqyoui-draggable]:last');
      dropSettings = droppableScope.$eval($droppable.attr('jqyoui-droppable') || $droppable.attr('data-jqyoui-droppable')) || [];
      dragSettings = draggableScope.$eval($draggable.attr('jqyoui-draggable') || $draggable.attr('data-jqyoui-draggable')) || [];

      // Helps pick up the right item
      dragSettings.index = this.fixIndex(draggableScope, dragSettings, dragModelValue);
      dropSettings.index = this.fixIndex(droppableScope, dropSettings, dropModelValue);

      jqyoui_pos = angular.isArray(dragModelValue) ? dragSettings.index : null;
      dragItem = angular.copy(angular.isArray(dragModelValue) ? dragModelValue[jqyoui_pos] : dragModelValue);

      if (angular.isArray(dropModelValue) && dropSettings && dropSettings.index !== undefined) {
        dropItem = dropModelValue[dropSettings.index];
      } else if (!angular.isArray(dropModelValue)) {
        dropItem = dropModelValue;
      } else {
        dropItem = {};
      }
      dropItem = angular.copy(dropItem);

      if (dragSettings.animate === true) {
        this.move($draggable, $droppableDraggable.length > 0 ? $droppableDraggable : $droppable, null, 'fast', dropSettings, null);
        this.move($droppableDraggable.length > 0 && !dropSettings.multiple ? $droppableDraggable : [], $draggable.parent('[jqyoui-droppable],[data-jqyoui-droppable]'), jqyoui.startXY, 'fast', dropSettings, angular.bind(this, function() {
          $timeout(angular.bind(this, function() {
            // Do not move this into move() to avoid flickering issue
            $draggable.css({'position': 'relative', 'left': '', 'top': ''});
            // Angular v1.2 uses ng-hide to hide an element not display property
            // so we've to manually remove display:none set in this.move()
            $droppableDraggable.css({'position': 'relative', 'left': '', 'top': '', 'display': ''});

            this.mutateDraggable(draggableScope, dropSettings, dragSettings, dragModel, dropModel, dropItem, $draggable);
            this.mutateDroppable(droppableScope, dropSettings, dragSettings, dropModel, dragItem, jqyoui_pos);
            this.callEventCallback(droppableScope, dropSettings.onDrop, event, ui);
          }));
        }));
      } else {
        $timeout(angular.bind(this, function() {
          this.mutateDraggable(draggableScope, dropSettings, dragSettings, dragModel, dropModel, dropItem, $draggable);
          this.mutateDroppable(droppableScope, dropSettings, dragSettings, dropModel, dragItem, jqyoui_pos);
          this.callEventCallback(droppableScope, dropSettings.onDrop, event, ui);
        }));
      }
    };

    this.move = function($fromEl, $toEl, toPos, duration, dropSettings, callback) {
      if ($fromEl.length === 0) {
        if (callback) {
          window.setTimeout(function() {
            callback();
          }, 300);
        }
        return false;
      }

      var zIndex = 9999,
        fromPos = $fromEl[dropSettings.containment || 'offset'](),
        wasVisible = $toEl && $toEl.is(':visible'),
        hadNgHideCls = $toEl.hasClass('ng-hide');

      if (toPos === null && $toEl.length > 0) {
        if (($toEl.attr('jqyoui-draggable') || $toEl.attr('data-jqyoui-draggable')) !== undefined && $toEl.ngattr('ng-model') !== undefined && $toEl.is(':visible') && dropSettings && dropSettings.multiple) {
          toPos = $toEl[dropSettings.containment || 'offset']();
          if (dropSettings.stack === false) {
            toPos.left+= $toEl.outerWidth(true);
          } else {
            toPos.top+= $toEl.outerHeight(true);
          }
        } else {
          // Angular v1.2 uses ng-hide to hide an element 
          // so we've to remove it in order to grab its position
          if (hadNgHideCls) $toEl.removeClass('ng-hide');
          toPos = $toEl.css({'visibility': 'hidden', 'display': 'block'})[dropSettings.containment || 'offset']();
          $toEl.css({'visibility': '','display': wasVisible ? 'block' : 'none'});
        }
      }

      $fromEl.css({'position': 'absolute', 'z-index': zIndex})
        .css(fromPos)
        .animate(toPos, duration, function() {
          // Angular v1.2 uses ng-hide to hide an element
          // and as we remove it above, we've to put it back to
          // hide the element (while swapping) if it was hidden already
          // because we remove the display:none in this.invokeDrop()
          if (hadNgHideCls) $toEl.addClass('ng-hide');
          if (callback) callback();
        });
    };

    this.mutateDroppable = function(scope, dropSettings, dragSettings, dropModel, dragItem, jqyoui_pos) {
      var dropModelValue = scope.$eval(dropModel);

      scope.dndDragItem = dragItem;

      if (angular.isArray(dropModelValue)) {
        if (dropSettings && dropSettings.index >= 0) {
          dropModelValue[dropSettings.index] = dragItem;
        } else {
          dropModelValue.push(dragItem);
        }
        if (dragSettings && dragSettings.placeholder === true) {
          dropModelValue[dropModelValue.length - 1]['jqyoui_pos'] = jqyoui_pos;
        }
      } else {
        $parse(dropModel + ' = dndDragItem')(scope);
        if (dragSettings && dragSettings.placeholder === true) {
          dropModelValue['jqyoui_pos'] = jqyoui_pos;
        }
      }
    };

    this.mutateDraggable = function(scope, dropSettings, dragSettings, dragModel, dropModel, dropItem, $draggable) {
      var isEmpty = angular.equals(dropItem, {}),
        dragModelValue = scope.$eval(dragModel);

      scope.dndDropItem = dropItem;

      if (dragSettings && dragSettings.placeholder) {
        if (dragSettings.placeholder != 'keep'){
          if (angular.isArray(dragModelValue) && dragSettings.index !== undefined) {
            dragModelValue[dragSettings.index] = dropItem;
          } else {
            $parse(dragModel + ' = dndDropItem')(scope);
          }
        }
      } else {
        if (angular.isArray(dragModelValue)) {
          if (isEmpty) {
            if (dragSettings && ( dragSettings.placeholder !== true && dragSettings.placeholder !== 'keep' )) {
              dragModelValue.splice(dragSettings.index, 1);
            }
          } else {
            dragModelValue[dragSettings.index] = dropItem;
          }
        } else {
          // Fix: LIST(object) to LIST(array) - model does not get updated using just scope[dragModel] = {...}
          // P.S.: Could not figure out why it happened
          $parse(dragModel + ' = dndDropItem')(scope);
          if (scope.$parent) {
            $parse(dragModel + ' = dndDropItem')(scope.$parent);
          }
        }
      }

      $draggable.css({'z-index': '', 'left': '', 'top': ''});
    };

    this.fixIndex = function(scope, settings, modelValue) {
      if (settings.applyFilter && angular.isArray(modelValue) && modelValue.length > 0) {
        var dragModelValueFiltered = scope[settings.applyFilter](),
            lookup = dragModelValueFiltered[settings.index],
            actualIndex = undefined;

        modelValue.forEach(function(item, i) {
           if (angular.equals(item, lookup)) {
             actualIndex = i;
           }
        });

        return actualIndex;
      }

      return settings.index;
    };
  }]).directive('jqyouiDraggable', ['ngDragDropService', function(ngDragDropService) {
    return {
      require: '?jqyouiDroppable',
      restrict: 'A',
      link: function(scope, element, attrs) {
        var dragSettings, jqyouiOptions, zIndex;
        var updateDraggable = function(newValue, oldValue) {
          if (newValue) {
            dragSettings = scope.$eval(element.attr('jqyoui-draggable') || element.attr('data-jqyoui-draggable')) || {};
            jqyouiOptions = scope.$eval(attrs.jqyouiOptions) || {};
            element
              .draggable({disabled: false})
              .draggable(jqyouiOptions)
              .draggable({
                start: function(event, ui) {
                  zIndex = angular.element(jqyouiOptions.helper ? ui.helper : this).css('z-index');
                  angular.element(jqyouiOptions.helper ? ui.helper : this).css('z-index', 9999);
                  jqyoui.startXY = angular.element(this)[dragSettings.containment || 'offset']();
                  ngDragDropService.callEventCallback(scope, dragSettings.onStart, event, ui);
                },
                stop: function(event, ui) {
                  angular.element(jqyouiOptions.helper ? ui.helper : this).css('z-index', zIndex);
                  ngDragDropService.callEventCallback(scope, dragSettings.onStop, event, ui);
                },
                drag: function(event, ui) {
                  ngDragDropService.callEventCallback(scope, dragSettings.onDrag, event, ui);
                }
              });
          } else {
            element.draggable({disabled: true});
          }
        };
        scope.$watch(function() { return scope.$eval(attrs.drag); }, updateDraggable);
        updateDraggable();

        element.on('$destroy', function() {
          element.draggable('destroy');
        });
      }
    };
  }]).directive('jqyouiDroppable', ['ngDragDropService', function(ngDragDropService) {
    return {
      restrict: 'A',
      priority: 1,
      link: function(scope, element, attrs) {
        var dropSettings;
        var updateDroppable = function(newValue, oldValue) {
          if (newValue) {
            dropSettings = scope.$eval(angular.element(element).attr('jqyoui-droppable') || angular.element(element).attr('data-jqyoui-droppable')) || {};
            element
              .droppable({disabled: false})
              .droppable(scope.$eval(attrs.jqyouiOptions) || {})
              .droppable({
                over: function(event, ui) {
                  ngDragDropService.callEventCallback(scope, dropSettings.onOver, event, ui);
                },
                out: function(event, ui) {
                  ngDragDropService.callEventCallback(scope, dropSettings.onOut, event, ui);
                },
                drop: function(event, ui) {
                  if (angular.element(ui.draggable).ngattr('ng-model') && attrs.ngModel) {
                    ngDragDropService.invokeDrop(angular.element(ui.draggable), angular.element(this), event, ui);
                  } else {
                    ngDragDropService.callEventCallback(scope, dropSettings.onDrop, event, ui);
                  }
                }
              });
          } else {
            element.droppable({disabled: true});
          }
        };

        scope.$watch(function() { return scope.$eval(attrs.drop); }, updateDroppable);
        updateDroppable();

        element.on('$destroy', function() {
          element.droppable('destroy');
        });
      }
    };
  }]);

  $.fn.ngattr = function(name, value) {
    var element = angular.element(this).get(0);

    return element.getAttribute(name) || element.getAttribute('data-' + name);
  };
})(window, window.angular);
;/* angular-moment.js / v0.7.1 / (c) 2013, 2014 Uri Shaked / MIT Licence */

/* global define */

(function () {
	'use strict';

	function angularMoment(angular, moment) {

		/**
		 * @ngdoc overview
		 * @name angularMoment
		 *
		 * @description
		 * angularMoment module provides moment.js functionality for angular.js apps.
		 */
		return angular.module('angularMoment', [])

		/**
		 * @ngdoc object
		 * @name angularMoment.config:angularMomentConfig
		 *
		 * @description
		 * Common configuration of the angularMoment module
		 */
			.constant('angularMomentConfig', {
				/**
				 * @ngdoc property
				 * @name angularMoment.config.angularMomentConfig#preprocess
				 * @propertyOf angularMoment.config:angularMomentConfig
				 * @returns {string} The default preprocessor to apply
				 *
				 * @description
				 * Defines a default preprocessor to apply (e.g. 'unix', 'etc', ...). The default value is null,
				 * i.e. no preprocessor will be applied.
				 */
				preprocess: null, // e.g. 'unix', 'utc', ...

				/**
				 * @ngdoc property
				 * @name angularMoment.config.angularMomentConfig#timezone
				 * @propertyOf angularMoment.config:angularMomentConfig
				 * @returns {string} The default timezone
				 *
				 * @description
				 * The default timezone (e.g. 'Europe/London'). Empty string by default (does not apply
				 * any timezone shift).
				 */
				timezone: '',

				/**
				 * @ngdoc property
				 * @name angularMoment.config.angularMomentConfig#format
				 * @propertyOf angularMoment.config:angularMomentConfig
				 * @returns {string} The pre-conversion format of the date
				 *
				 * @description
				 * Specify the format of the input date. Essentially it's a
				 * default and saves you from specifying a format in every
				 * element. Overridden by element attr. Null by default.
				 */
				format: null
			})

		/**
		 * @ngdoc object
		 * @name angularMoment.object:moment
		 *
		 * @description
		 * moment global (as provided by the moment.js library)
		 */
			.constant('moment', moment)

		/**
		 * @ngdoc object
		 * @name angularMoment.config:amTimeAgoConfig
		 * @module angularMoment
		 *
		 * @description
		 * configuration specific to the amTimeAgo directive
		 */
			.constant('amTimeAgoConfig', {
				/**
				 * @ngdoc property
				 * @name angularMoment.config.amTimeAgoConfig#withoutSuffix
				 * @propertyOf angularMoment.config:amTimeAgoConfig
				 * @returns {boolean} Whether to include a suffix in am-time-ago directive
				 *
				 * @description
				 * Defaults to false.
				 */
				withoutSuffix: false,

				/**
				 * @ngdoc property
				 * @name angularMoment.config.amTimeAgoConfig#serverTime
				 * @propertyOf angularMoment.config:amTimeAgoConfig
				 * @returns {numeric} Date in milliseconds.
				 *
				 * @description
				 * When you need to use the time of your server.
				 * Defaults to null. Local time will be used.
				 */
				serverTime: null
			})

		/**
		 * @ngdoc directive
		 * @name angularMoment.directive:amTimeAgo
		 * @module angularMoment
		 *
		 * @restrict A
		 */
			.directive('amTimeAgo', ['$window', 'moment', 'amMoment', 'amTimeAgoConfig', 'angularMomentConfig', function ($window, moment, amMoment, amTimeAgoConfig, angularMomentConfig) {

				return function (scope, element, attr) {
					var activeTimeout = null;
					var currentValue;
					var currentFormat = angularMomentConfig.format;
					var withoutSuffix = amTimeAgoConfig.withoutSuffix;
					var localDate = new Date().getTime();
					var preprocess = angularMomentConfig.preprocess;
					var modelName = attr.amTimeAgo.replace(/^::/, '');
					var isBindOnce = (attr.amTimeAgo.indexOf('::') === 0);
					var isTimeElement = ('TIME' === element[0].nodeName.toUpperCase());
					var unwatchChanges;

					function getNow() {
						var now;
						if (amTimeAgoConfig.serverTime) {
							var localNow = new Date().getTime();
							var nowMillis = localNow - localDate + amTimeAgoConfig.serverTime;
							now = moment(nowMillis);
						}
						else {
							now = moment();
						}
						return now;
					}

					function cancelTimer() {
						if (activeTimeout) {
							$window.clearTimeout(activeTimeout);
							activeTimeout = null;
						}
					}

					function updateTime(momentInstance) {
						element.text(momentInstance.from(getNow(), withoutSuffix));
						if (!isBindOnce) {

							var howOld = getNow().diff(momentInstance, 'minute');
							var secondsUntilUpdate = 3600;
							if (howOld < 1) {
								secondsUntilUpdate = 1;
							} else if (howOld < 60) {
								secondsUntilUpdate = 30;
							} else if (howOld < 180) {
								secondsUntilUpdate = 300;
							}

							activeTimeout = $window.setTimeout(function () {
								updateTime(momentInstance);
							}, secondsUntilUpdate * 1000);
						}
					}

					function updateDateTimeAttr(value) {
						if (isTimeElement) {
							element.attr('datetime', value);
						}
					}

					function updateMoment() {
						cancelTimer();
						if (currentValue) {
							var momentValue = amMoment.preprocessDate(currentValue, preprocess, currentFormat);
							updateTime(momentValue);
							updateDateTimeAttr(momentValue.toISOString());
						}
					}

					unwatchChanges = scope.$watch(modelName, function (value) {
						if ((typeof value === 'undefined') || (value === null) || (value === '')) {
							cancelTimer();
							if (currentValue) {
								element.text('');
								updateDateTimeAttr('');
								currentValue = null;
							}
							return;
						}

						currentValue = value;
						updateMoment();

						if (value !== undefined && isBindOnce) {
							unwatchChanges();
						}
					});

					if (angular.isDefined(attr.amWithoutSuffix)) {
						scope.$watch(attr.amWithoutSuffix, function (value) {
							if (typeof value === 'boolean') {
								withoutSuffix = value;
								updateMoment();
							} else {
								withoutSuffix = amTimeAgoConfig.withoutSuffix;
							}
						});
					}

					attr.$observe('amFormat', function (format) {
						if (typeof format !== 'undefined') {
							currentFormat = format;
							updateMoment();
						}
					});

					attr.$observe('amPreprocess', function (newValue) {
						preprocess = newValue;
						updateMoment();
					});

					scope.$on('$destroy', function () {
						cancelTimer();
					});

					scope.$on('amMoment:languageChange', function () {
						updateMoment();
					});
				};
			}])

		/**
		 * @ngdoc service
		 * @name angularMoment.service.amMoment
		 * @module angularMoment
		 */
			.service('amMoment', ['moment', '$rootScope', '$log', 'angularMomentConfig', function (moment, $rootScope, $log, angularMomentConfig) {
				/**
				 * @ngdoc property
				 * @name angularMoment:amMoment#preprocessors
				 * @module angularMoment
				 *
				 * @description
				 * Defines the preprocessors for the preprocessDate method. By default, the following preprocessors
				 * are defined: utc, unix.
				 */
				this.preprocessors = {
					utc: moment.utc,
					unix: moment.unix
				};

				/**
				 * @ngdoc function
				 * @name angularMoment.service.amMoment#changeLanguage
				 * @methodOf angularMoment.service.amMoment
				 *
				 * @description
				 * Changes the language for moment.js and updates all the am-time-ago directive instances
				 * with the new language.
				 *
				 * @param {string} lang 2-letter language code (e.g. en, es, ru, etc.)
				 */
				this.changeLanguage = function (lang) {
					var result = moment.lang(lang);
					if (angular.isDefined(lang)) {
						$rootScope.$broadcast('amMoment:languageChange');
					}
					return result;
				};

				/**
				 * @ngdoc function
				 * @name angularMoment.service.amMoment#preprocessDate
				 * @methodOf angularMoment.service.amMoment
				 *
				 * @description
				 * Preprocess a given value and convert it into a Moment instance appropriate for use in the
				 * am-time-ago directive and the filters.
				 *
				 * @param {*} value The value to be preprocessed
				 * @param {string} preprocess The name of the preprocessor the apply (e.g. utc, unix)
				 * @param {string=} format Specifies how to parse the value (see {@link http://momentjs.com/docs/#/parsing/string-format/})
				 * @return {Moment} A value that can be parsed by the moment library
				 */
				this.preprocessDate = function (value, preprocess, format) {
					if (angular.isUndefined(preprocess)) {
						preprocess = angularMomentConfig.preprocess;
					}
					if (this.preprocessors[preprocess]) {
						return this.preprocessors[preprocess](value, format);
					}
					if (preprocess) {
						$log.warn('angular-moment: Ignoring unsupported value for preprocess: ' + preprocess);
					}
					if (!isNaN(parseFloat(value)) && isFinite(value)) {
						// Milliseconds since the epoch
						return moment(parseInt(value, 10));
					}
					// else just returns the value as-is.
					return moment(value, format);
				};

				/**
				 * @ngdoc function
				 * @name angularMoment.service.amMoment#applyTimezone
				 * @methodOf angularMoment.service.amMoment
				 *
				 * @description
				 * Apply a timezone onto a given moment object - if moment-timezone.js is included
				 * Otherwise, it'll not apply any timezone shift.
				 *
				 * @param {Moment} aMoment a moment() instance to apply the timezone shift to
				 * @returns {Moment} The given moment with the timezone shift applied
				 */
				this.applyTimezone = function (aMoment) {
					var timezone = angularMomentConfig.timezone;
					if (aMoment && timezone) {
						if (aMoment.tz) {
							aMoment = aMoment.tz(timezone);
						} else {
							$log.warn('angular-moment: timezone specified but moment.tz() is undefined. Did you forget to include moment-timezone.js?');
						}
					}
					return aMoment;
				};
			}])

		/**
		 * @ngdoc filter
		 * @name angularMoment.filter:amCalendar
		 * @module angularMoment
		 */
			.filter('amCalendar', ['moment', 'amMoment', function (moment, amMoment) {
				return function (value, preprocess) {
					if (typeof value === 'undefined' || value === null) {
						return '';
					}

					value = amMoment.preprocessDate(value, preprocess);
					var date = moment(value);
					if (!date.isValid()) {
						return '';
					}

					return amMoment.applyTimezone(date).calendar();
				};
			}])

		/**
		 * @ngdoc filter
		 * @name angularMoment.filter:amDateFormat
		 * @module angularMoment
		 * @function
		 */
			.filter('amDateFormat', ['moment', 'amMoment', function (moment, amMoment) {
				return function (value, format, preprocess) {
					if (typeof value === 'undefined' || value === null) {
						return '';
					}

					value = amMoment.preprocessDate(value, preprocess);
					var date = moment(value);
					if (!date.isValid()) {
						return '';
					}

					return amMoment.applyTimezone(date).format(format);
				};
			}])

		/**
		 * @ngdoc filter
		 * @name angularMoment.filter:amDurationFormat
		 * @module angularMoment
		 * @function
		 */
			.filter('amDurationFormat', ['moment', function (moment) {
				return function (value, format, suffix) {
					if (typeof value === 'undefined' || value === null) {
						return '';
					}

					return moment.duration(value, format).humanize(suffix);
				};
			}]);
	}

	if (typeof define === 'function' && define.amd) {
		define('angular-moment', ['angular', 'moment'], angularMoment);
	} else {
		angularMoment(angular, window.moment);
	}
})();

;angular.module('toggle-switch', ['ng']).directive('toggleSwitch', function () {
  return {
    restrict: 'EA',
    replace: true,
    scope: {
      model: '=',
      disabled: '@',
      onLabel: '@',
      offLabel: '@',
      knobLabel: '@'
    },
    template: '<div class="switch" ng-click="toggle()" ng-class="{ \'disabled\': disabled }"><div class="switch-animate" ng-class="{\'switch-off\': !model, \'switch-on\': model}"><span class="switch-left" ng-bind="onLabel"></span><span class="knob" ng-bind="knobLabel"></span><span class="switch-right" ng-bind="offLabel"></span></div></div>',
    controller: function($scope) {
      $scope.toggle = function toggle() {
        if(!$scope.disabled) {
          $scope.model = !$scope.model;
        }
      };
    },
    compile: function(element, attrs) {
      if (!attrs.onLabel) { attrs.onLabel = 'On'; }
      if (!attrs.offLabel) { attrs.offLabel = 'Off'; }
      if (!attrs.knobLabel) { attrs.knobLabel = '\u00a0'; }
      if (!attrs.disabled) { attrs.disabled = false; }
    },
  };
});
;Reed.directive('backToList', function() {

	return {
		restrict: 'AE',
		replace: true,
		templateUrl: 'app/template/partials/back.html',
		link: function(scope, element, attrs) {
			element.bind('click', function() {

				scope.$apply(function() {
					scope.view.section = 'list';
					scope.view.panel = false;
				});
				$('#thumbs').scrollTop( scope.view.scrollPosition );

			});
		}
	};

});
;/* ng-infinite-scroll - v1.0.0 - 2013-02-23 */
var mod;

mod = angular.module('infinite-scroll', []);

mod.directive('infiniteScroll', [
  '$rootScope', '$window', '$timeout', function($rootScope, $window, $timeout) {
    return {
      link: function(scope, elem, attrs) {
        var checkWhenEnabled, handler, scrollDistance, scrollEnabled;
        $window = angular.element($window);
        scrollDistance = 0;
        if (attrs.infiniteScrollDistance != null) {
          scope.$watch(attrs.infiniteScrollDistance, function(value) {
            return scrollDistance = parseInt(value, 10);
          });
        }
        scrollEnabled = true;
        checkWhenEnabled = false;
        if (attrs.infiniteScrollDisabled != null) {
          scope.$watch(attrs.infiniteScrollDisabled, function(value) {
            scrollEnabled = !value;
            if (scrollEnabled && checkWhenEnabled) {
              checkWhenEnabled = false;
              return handler();
            }
          });
        }
        handler = function() {
          var elementBottom, remaining, shouldScroll, windowBottom;
          windowBottom = $window.height() + $window.scrollTop();
          elementBottom = elem.offset().top + elem.height();
          remaining = elementBottom - windowBottom;
          shouldScroll = remaining <= $window.height() * scrollDistance;
          if (shouldScroll && scrollEnabled) {
            if ($rootScope.$$phase) {
              return scope.$eval(attrs.infiniteScroll);
            } else {
              return scope.$apply(attrs.infiniteScroll);
            }
          } else if (shouldScroll) {
            return checkWhenEnabled = true;
          }
        };
        $window.on('scroll', handler);
        scope.$on('$destroy', function() {
          return $window.off('scroll', handler);
        });
        return $timeout((function() {
          if (attrs.infiniteScrollImmediateCheck) {
            if (scope.$eval(attrs.infiniteScrollImmediateCheck)) {
              return handler();
            }
          } else {
            return handler();
          }
        }), 0);
      }
    };
  }
]);
;/* ng-infinite-scroll - v1.1.2 - 2014-05-21 */
var mod;

mod = angular.module('infinite-scroll', []);

mod.value('THROTTLE_MILLISECONDS', null);

mod.directive('infiniteScroll', [
  '$rootScope', '$window', '$timeout', 'THROTTLE_MILLISECONDS', function($rootScope, $window, $timeout, THROTTLE_MILLISECONDS) {
    return {
      scope: {
        infiniteScroll: '&',
        infiniteScrollContainer: '=',
        infiniteScrollDistance: '=',
        infiniteScrollDisabled: '=',
        infiniteScrollUseDocumentBottom: '='
      },
      link: function(scope, elem, attrs) {
        var changeContainer, checkWhenEnabled, container, handleInfiniteScrollContainer, handleInfiniteScrollDisabled, handleInfiniteScrollDistance, handleInfiniteScrollUseDocumentBottom, handler, immediateCheck, scrollDistance, scrollEnabled, throttle, useDocumentBottom;
        $window = angular.element($window);
        scrollDistance = null;
        scrollEnabled = null;
        checkWhenEnabled = null;
        container = null;
        immediateCheck = true;
        useDocumentBottom = false;
        handler = function() {
          var containerBottom, containerTopOffset, elementBottom, remaining, shouldScroll;
          if (container === $window) {
            containerBottom = container.height() + container.scrollTop();
            elementBottom = elem.offset().top + elem.height();
          } else {
            containerBottom = container.height();
            containerTopOffset = 0;
            if (container.offset() !== void 0) {
              containerTopOffset = container.offset().top;
            }
            elementBottom = elem.offset().top - containerTopOffset + elem.height();
          }
          if (useDocumentBottom) {
            elementBottom = $(document).height();
          }
          remaining = elementBottom - containerBottom;
          shouldScroll = remaining <= container.height() * scrollDistance + 1;
          if (shouldScroll) {
            checkWhenEnabled = true;
            if (scrollEnabled) {
              if (scope.$$phase || $rootScope.$$phase) {
                return scope.infiniteScroll();
              } else {
                return scope.$apply(scope.infiniteScroll);
              }
            }
          } else {
            return checkWhenEnabled = false;
          }
        };
        throttle = function(func, wait) {
          var later, previous, timeout;
          timeout = null;
          previous = 0;
          later = function() {
            var context;
            previous = new Date().getTime();
            $timeout.cancel(timeout);
            timeout = null;
            func.call();
            return context = null;
          };
          return function() {
            var now, remaining;
            now = new Date().getTime();
            remaining = wait - (now - previous);
            if (remaining <= 0) {
              clearTimeout(timeout);
              $timeout.cancel(timeout);
              timeout = null;
              previous = now;
              return func.call();
            } else {
              if (!timeout) {
                return timeout = $timeout(later, remaining);
              }
            }
          };
        };
        if (THROTTLE_MILLISECONDS != null) {
          handler = throttle(handler, THROTTLE_MILLISECONDS);
        }
        scope.$on('$destroy', function() {
          return container.off('scroll', handler);
        });
        handleInfiniteScrollDistance = function(v) {
          return scrollDistance = parseInt(v, 10) || 0;
        };
        scope.$watch('infiniteScrollDistance', handleInfiniteScrollDistance);
        handleInfiniteScrollDistance(scope.infiniteScrollDistance);
        handleInfiniteScrollDisabled = function(v) {
          scrollEnabled = !v;
          if (scrollEnabled && checkWhenEnabled) {
            checkWhenEnabled = false;
            return handler();
          }
        };
        scope.$watch('infiniteScrollDisabled', handleInfiniteScrollDisabled);
        handleInfiniteScrollDisabled(scope.infiniteScrollDisabled);
        handleInfiniteScrollUseDocumentBottom = function(v) {
          return useDocumentBottom = v;
        };
        scope.$watch('infiniteScrollUseDocumentBottom', handleInfiniteScrollUseDocumentBottom);
        handleInfiniteScrollUseDocumentBottom(scope.infiniteScrollUseDocumentBottom);
        changeContainer = function(newContainer) {
          if (container != null) {
            container.off('scroll', handler);
          }
          container = typeof newContainer.last === 'function' && newContainer !== $window ? newContainer.last() : newContainer;
          if (newContainer != null) {
            return container.on('scroll', handler);
          }
        };
        changeContainer($window);
        handleInfiniteScrollContainer = function(newContainer) {
          if ((!(newContainer != null)) || newContainer.length === 0) {
            return;
          }
          newContainer = angular.element(newContainer);
          if (newContainer != null) {
            return changeContainer(newContainer);
          } else {
            throw new Exception("invalid infinite-scroll-container attribute.");
          }
        };
        scope.$watch('infiniteScrollContainer', handleInfiniteScrollContainer);
        handleInfiniteScrollContainer(scope.infiniteScrollContainer || []);
        if (attrs.infiniteScrollParent != null) {
          changeContainer(angular.element(elem.parent()));
        }
        if (attrs.infiniteScrollImmediateCheck != null) {
          immediateCheck = scope.$eval(attrs.infiniteScrollImmediateCheck);
        }
        return $timeout((function() {
          if (immediateCheck) {
            return handler();
          }
        }), 0);
      }
    };
  }
]);
;Reed.directive('readingTime', function(State) {

	return {
		restrict: 'AE',
		scope: {
			text: '='
		},
		template: '{{readingtime}}',
		link: function(scope, element, attrs) {

			function countWords(s){
				s = s.replace(/(^\s*)|(\s*$)/gi,"");
				s = s.replace(/[ ]{2,}/gi," ");
				s = s.replace(/\n /,"\n");
				return s.split(' ').length;
			}

			var words = countWords(scope.text.content.replace(/(<([^>]+)>)/ig,""));

			var minutesCount = Math.floor(words / 200);
			var secondsCount = Math.floor(words % 200 / (200 / 60));

			var duration = '0:' + minutesCount + ":" + secondsCount;

			scope.readingtime = moment.duration(duration, "minutes").humanize();

		}
	};

});
;Reed.factory('Api', function ($http, $resource, State) {

		var userid = State.user.id;

		return {

			discoveryFeeds: $resource('api/discovery/feeds', {}, {
				get: {
					method: 'GET',
					isArray: true
				}
			}),

			discoveryArticles: $resource('api/discovery/articles', {}, {
				get: {
					method: 'GET',
					isArray: true
				}
			}),

			User: $resource('api/users/:id', { id: userid }, {
				get: {
					method: 'GET',
					isArray: false
				},
				update: {
					method: 'PUT',
					isArray: false
				},
				delete: {
					method: 'DELETE',
					isArray: false
				}
			}),

			UserFeeds: $resource('api/users/:id/feeds', { id: userid }, {
				get: {
					method: 'GET',
					isArray: true
				},
				post: {
					method: 'POST',
					isArray: false
				}
			}),

			UserFeed: $resource('api/users/:id/feeds/:feedid', { id: userid }, {
				update: {
					method: 'PUT',
					isArray: false
				},
				delete: {
					method: 'DELETE',
					isArray: false
				}
			}),

			UserArticles: $resource('api/users/:id/articles', { id: userid }, {
				get: {
					method: 'GET',
					isArray: true
				},
				update: {
					method: 'PUT',
					isArray: false
				}
			}),

			UserArticle: $resource('api/users/:id/articles/:articleid', { id: userid }, {
				update: {
					method: 'PUT',
					isArray: false
				}
			}),

			UserFolders: $resource('api/users/:id/folders', { id: userid }, {
				get: {
					method: 'GET',
					isArray: true
				}
			}),

			UserFavourites: $resource('api/users/:id/articles?favourites=true', { id: userid }, {
				get: {
					method: 'GET',
					isArray: true
				}
			}),

			UserLater: $resource('api/users/:id/articles?later=true', { id: userid }, {
				get: {
					method: 'GET',
					isArray: true
				}
			}),

		};

});
;Reed.service('AuthService', function ($cookieStore){

	/**
	 * Get user authentication status
	 * @return {Bool}
	 */
	this.getUserAuthenticated = function() {

		var token = $cookieStore.get('reed_authtoken');
		return ($cookieStore.get('reed_authtoken')) ? true : false;

	};


	/**
	 * Return object
	 */
	return this;

});
;Reed.factory('Collection', function ($q, $filter, Api, Overlay) {

	/**
	 * User collection
	 * @type {Object}
	 */
	this.user = Api.User.get();


	/**
	 * Discovery collection
	 * @type {Object}
	 */
	this.discovery = {
		articles: Api.discoveryArticles.get(),
		feeds: Api.discoveryFeeds.get()
	};


	/**
	 * User folders collection
	 * @type {Object}
	 */
	this.folders = Api.UserFolders.get();


	/**
	 * User articles collection
	 * @type {Object}
	 */
	this.articles = Api.UserArticles.get();


	/**
	 * User favourite articles
	 * @type {Object}
	 */
	this.favourites = Api.UserFavourites.get();


	/**
	 * User read later articles
	 * @type {Object}
	 */
	this.later = Api.UserLater.get();


	/**
	 * User feeds collection
	 * @type {Object}
	 */
	this.feeds = Api.UserFeeds.get();


	/**
	 * Filter collection
	 * @param  {String} collection Collection name
	 * @param  {Object} params     Filter params
	 * @return {Object}            Filtered collection
	 */
	this.add = function (collection, el) {

		if(collection.indexOf(el) === -1) {
			collection.push(el);
			return collection = this.orderBy(collection, '-created');
		}

	};


	this.remove = function (collection, item) {

		return _.reject(collection, function(el){
			return el.id === item.id;
		});

	};


	/**
	 * Order collection
	 * @param  {String} collection Collection name
	 * @param  {Object} params     Order params
	 * @return {Object}            Ordered collection
	 */
	this.orderBy = function (collection, params) {
		return $filter('orderBy')(collection, params);
	};


	this.groupBy = function (collection, param) {
		return _.chain(collection)
				.groupBy(param)
				.map(function(value, key) {
					return {
						title: key,
						items: value
					}
				}).value();
	}


	/**
	 * Filter collection
	 * @param  {String} collection Collection name
	 * @param  {Object} params     Filter params
	 * @return {Object}            Filtered collection
	 */
	this.filter = function (collection, params) {

		var filter = $filter('filter')(collection, params);
		return this.orderBy(filter, '-created');

	};


	/**
	 * Collections ready state
	 * @param  {Array}   collection List of collections promises
	 * @param  {Function} callback   Passed promises callback
	 * @return {Object}
	 */
	this.ready = function (collections, callback) {
		return $q.all(collections).then(function(data) {
			callback(data);
		});
	};


	/**
	 * Return object
	 */
	return this;

});
;Reed.filter('cut', function () {
	return function (value, wordwise, max, tail) {
		if (!value) return '';

		max = parseInt(max, 10);
		if (!max) return value;
		if (value.length <= max) return value;

		value = value.substr(0, max);
		if (wordwise) {
			var lastspace = value.lastIndexOf(' ');
			if (lastspace != -1) {
				value = value.substr(0, lastspace);
			}
		}

		return value + (tail || ' …');
	};
});
;Reed.service('httpResponseInterceptorHandler', function ($q, $location, $cookieStore) {
		return {

			/**
			 * On response error.
			 * When rejection status is unauthorized
			 * delete incorrect token and redirect user to login page
			 */
			responseError: function(rejection) {

				if (rejection.status === 401) {
					$cookieStore.remove('reed_authtoken');
					$cookieStore.remove('reed_userid');
					$location.path('/').replace();

					return $q.reject(rejection);
				}

				return $q.reject(rejection);

			}

		};
});
;Reed.factory('Overlay', function () {

	/**
	 * Overlay state:icon list
	 * @type {Object}
	 */
	this.icons = {
		'success': 'check',
		'fail': 'times',
		'error': 'times',
		'400': 'times',
		'busy': 'spinner fa-spin'
	};


	/**
	 * Update displayed overlay
	 * @param  {String} status Response status
	 * @param  {String} text   Response message
	 * @return {Object}
	 */
	this.destroy = function (status, text) {

		this.overlay.destroy();

	};


	/**
	 * Update displayed overlay
	 * @param  {String} status Response status
	 * @param  {String} text   Response message
	 * @return {Object}
	 */
	this.update = function (status, text) {

		this.overlay.update({
			text: text,
			icon: this.icons[status.toString().toLowerCase()]
		});

	};

	/**
	 * Display overlay
	 * @param  {String} text Response message
	 * @return {Object}
	 */
	this.init = function (status, text) {

		this.overlay = iosOverlay({
			text: text,
			icon: this.icons[status.toString().toLowerCase()],
			duration: 2000,
		});

	};

	/**
	 * Return object
	 */
	return this;

});
;Reed.factory('State', function ($cookieStore) {

	/**
	 * Aplication collections counts
	 * @type {Object}
	 */
	this.count = {};


	/**
	 * Application data
	 * @type {Object}
	 */
	this.data = {};


	/**
	 * User state data
	 * @type {Object}
	 */
	this.user = {
		id: $cookieStore.get('reed_userid'),
		filter: $cookieStore.get('reed_userfilter')
	};


	/**
	 * Set new application state
	 * @param {Object} values
	 */
	this.set = function (values) {
		angular.extend(this.count, values);
		return this;
	};


	/**
	 * Update application state
	 * @param  {String} field Field to update
	 * @param  {Int} value
	 * @return {Int}
	 */
	this.update = function (field, value) {

		if(this.count[field] >= 0) {
			if(value == 0)
				return this.count[field]--;
			else
				return this.count[field] += value;
		}

		return this;

	};


	/**
	 * Return object
	 */
	return this;

});
