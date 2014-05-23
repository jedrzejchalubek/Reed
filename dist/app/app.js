var Reed = angular.module('Reed', [
	'ngResource',
	'ngCookies',
	'ngRoute',
	'ngSanitize',
	'ngAnimate',
	'ezfb',
	'angular-md5',
	'ui.bootstrap'
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
			.when('/login', {
				templateUrl: 'app/template/login.html',
				controller: 'Login',
				requireLogin: false
			})
			.when('/discovery', {
				templateUrl: 'app/template/discovery.html',
				controller: 'Discovery',
				requireLogin: true,
			})
			.when('/discovery?:id', {
				templateUrl: 'app/template/discovery.html',
				controller: 'Discovery',
				requireLogin: true
			})
			.when('/articles', {
				templateUrl: 'app/template/articles.html',
				controller: 'Articles',
				requireLogin: true
			})
			.when('/add', {
				templateUrl: 'app/template/add.html',
				controller: 'Add',
				requireLogin: false
			});

		// If the url is unrecognized go to login
		$routeProvider.otherwise({
			redirectTo: '/discovery'
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
				$location.path('/login').replace();
			}
		});

	}]);
;/*! angular-easyfb
version: 1.0.0
build date: 2014-03-29
author: Robin Fan
https://github.com/pc035860/angular-easyfb.git */
!function(a){function b(b,c){var d="ezfb-social-plugin-wrap",e="display: inline-block; width: 0; height: 0; overflow: hidden;",f=function(a){var b='<span class="'+d+'" style="'+e+'">';return a.wrap(b).parent()},g=function(a){return a.parent().hasClass(d)},h=function(a){var b=a.parent();return b.after(a).remove(),a};a.directive(c,["ezfb",function(a){return{restrict:"EC",require:"?^ezfbXfbml",link:function(c,d,e,i){function j(a){return function(){var b;k&&a===l&&(b=e.onrender,b&&c.$eval(b),k=!1,h(d))}}if(!i){var k=!1,l=0;c.$watch(function(){var a=[];return angular.forEach(b,function(b){a.push(e[b])}),a},function(){l++,k?a.XFBML.parse(d.parent()[0],j(l)):(k=!0,a.XFBML.parse(f(d)[0],j(l)))},!0),d.bind("$destroy",function(){g(d)&&h(d)})}}}}])}a.provider("ezfb",function(){function a(a,b){return angular.isObject(b)?void angular.extend(a,b):angular.copy(a)}function b(a,b,c){return function(){return a.apply(b,c)}}var c=-1,d={api:[1,2,3],ui:1,getAuthResponse:c,getLoginStatus:0,login:0,logout:0,"Event.subscribe":1,"Event.unsubscribe":1,"XFBML.parse":1,"Canvas.Prefetcher.addStaticResource":c,"Canvas.Prefetcher.setCollectionMode":c,"Canvas.hideFlashElement":c,"Canvas.scrollTo":c,"Canvas.setAutoGrow":c,"Canvas.setDoneLoading":0,"Canvas.setSize":c,"Canvas.setUrlHandler":0,"Canvas.showFlashElement":c,"Canvas.startTimer":c,"Canvas.stopTimer":0},e="en_US",f={status:!0,cookie:!0,xfbml:!0},g=["$window","$document","ezfbAsyncInit","ezfbLocale",function(a,b,c,d){!function(a){var b,c="facebook-jssdk",e=a.getElementsByTagName("script")[0];a.getElementById(c)||(b=a.createElement("script"),b.id=c,b.async=!0,b.src="//connect.facebook.net/"+d+"/all.js",e.parentNode.insertBefore(b,e))}(b[0]),a.fbAsyncInit=c}],h=g,i=["$window","ezfbInitParams",function(a,b){a.FB.init(b)}],j=i;return{setInitParams:function(b){a(f,b)},getInitParams:function(){return a(f)},setLocale:function(a){e=a},getLocale:function(){return e},setLoadSDKFunction:function(a){if(!angular.isArray(a)&&!angular.isFunction(a))throw new Error("Init function type error.");h=a},getLoadSDKFunction:function(){return h},setInitFunction:function(a){if(!angular.isArray(a)&&!angular.isFunction(a))throw new Error("Init function type error.");j=a},getInitFunction:function(){return j},$get:["$window","$q","$document","$parse","$rootScope","$injector",function(g,k,l,m,n,o){var p,q,r,s,t;return r={},s=k.defer(),(f.appId||j!==i)&&s.resolve(),p=k.defer(),l[0].getElementById("fb-root")||l.find("body").append('<div id="fb-root"></div>'),t=function(){s.promise.then(function(){o.invoke(j,null,{ezfbInitParams:f}),q.$$ready=!0,p.resolve()})},o.invoke(h,null,{ezfbAsyncInit:t,ezfbLocale:e}),q={$$ready:!1,init:function(b){a(f,b),s.resolve()}},angular.forEach(d,function(a,d){var e=m(d),f=e.assign;f(q,function(){var f=b(function(b){var f,h;if(f=k.defer(),h=function(a){var c,e;for(c=angular.isFunction(b[a])?b[a]:angular.noop,e=function(){var a=Array.prototype.slice.call(arguments);n.$$phase?(c.apply(null,a),f.resolve.apply(f,a)):n.$apply(function(){c.apply(null,a),f.resolve.apply(f,a)})};b.length<=a;)b.push(null);var g;if("Event.subscribe"===d)g=b[0],angular.isUndefined(r[g])&&(r[g]=[]),r[g].push({original:c,wrapped:e});else if("Event.unsubscribe"===d&&(g=b[0],angular.isArray(r[g]))){var h,i,j=r[g].length;for(h=0;j>h;h++)if(i=r[g][h],i.original===c){e=i.wrapped,r[g].splice(h,1);break}}b[a]=e},a!==c)if(angular.isNumber(a))h(a);else if(angular.isArray(a)){var i,j;for(i=0;i<a.length;i++)if(j=a[i],b.length==j||b.length==j+1&&angular.isFunction(b[j])){h(j);break}}var l=e(g.FB);if(!l)throw new Error("Facebook API `FB."+d+"` doesn't exist.");return l.apply(g.FB,b),f.promise},null,[Array.prototype.slice.call(arguments)]);if("getAuthResponse"===d){if(angular.isUndefined(g.FB))throw new Error("`FB` is not ready.");return g.FB.getAuthResponse()}return a!==c?p.promise.then(f):void p.promise.then(f)})}),q}]}}).directive("ezfbXfbml",["ezfb","$parse","$compile","$timeout",function(a,b,c,d){return{restrict:"EAC",controller:function(){},compile:function(e){var f=e.html();return function(e,g,h){var i=!0,j=h.onrender,k=function(){i&&(j&&e.$eval(j),i=!1)};a.XFBML.parse(g[0],k);var l=b(h.ezfbXfbml).assign;e.$watch(h.ezfbXfbml,function(b){b&&(i=!0,g.html(f),c(g.contents())(e),d(function(){a.XFBML.parse(g[0],k)}),(l||angular.noop)(e,!1))},!0)}}}}]);var c={fbLike:["action","colorscheme","href","kidDirectedSite","layout","ref","share","showFaces","width"],fbShareButton:["href","layout","width"],fbSend:["colorscheme","href","kidDirectedSite","ref"],fbPost:["href","width"],fbFollow:["colorscheme","href","kidDirectedSite","layout","showFaces","width"],fbComments:["colorscheme","href","mobile","numPosts","orderBy","width"],fbActivity:["action","appId","colorscheme","filter","header","height","linktarget","maxAge","recommendations","ref","site","width"],fbRecommendations:["action","appId","colorscheme","header","height","linktarget","maxAge","ref","site","width"],fbRecommendationsBar:["action","href","maxAge","numRecommendations","readTime","ref","side","site","trigger"],fbLikeBox:["colorscheme","forceWall","header","height","href","showBorder","showFaces","stream","width"],fbFacepile:["action","appId","colorscheme","href","maxRows","size","width"]};angular.forEach(c,b)}(angular.module("ezfb",[]));;/*
  angular-md5 - v0.1.7 
  2014-01-20
*/
(function(window, angular, undefined) {
  angular.module("angular-md5", [ "gdi2290.md5" ]);
  angular.module("ngMd5", [ "gdi2290.md5" ]);
  angular.module("gdi2290.md5", [ "gdi2290.gravatar-filter", "gdi2290.md5-service", "gdi2290.md5-filter" ]);
  "use strict";
  angular.module("gdi2290.gravatar-filter", []).filter("gravatar", [ "md5", function(md5) {
    var cache = {};
    return function(text, defaultText) {
      if (!cache[text]) {
        defaultText = defaultText ? md5.createHash(defaultText.toString().toLowerCase()) : "";
        cache[text] = text ? md5.createHash(text.toString().toLowerCase()) : defaultText;
      }
      return cache[text];
    };
  } ]);
  "use strict";
  angular.module("gdi2290.md5-filter", []).filter("md5", [ "md5", function(md5) {
    return function(text) {
      return text ? md5.createHash(text.toString().toLowerCase()) : text;
    };
  } ]);
  "use strict";
  angular.module("gdi2290.md5-service", []).factory("md5", [ function() {
    var md5 = {
      createHash: function(str) {
        var xl;
        var rotateLeft = function(lValue, iShiftBits) {
          return lValue << iShiftBits | lValue >>> 32 - iShiftBits;
        };
        var addUnsigned = function(lX, lY) {
          var lX4, lY4, lX8, lY8, lResult;
          lX8 = lX & 2147483648;
          lY8 = lY & 2147483648;
          lX4 = lX & 1073741824;
          lY4 = lY & 1073741824;
          lResult = (lX & 1073741823) + (lY & 1073741823);
          if (lX4 & lY4) {
            return lResult ^ 2147483648 ^ lX8 ^ lY8;
          }
          if (lX4 | lY4) {
            if (lResult & 1073741824) {
              return lResult ^ 3221225472 ^ lX8 ^ lY8;
            } else {
              return lResult ^ 1073741824 ^ lX8 ^ lY8;
            }
          } else {
            return lResult ^ lX8 ^ lY8;
          }
        };
        var _F = function(x, y, z) {
          return x & y | ~x & z;
        };
        var _G = function(x, y, z) {
          return x & z | y & ~z;
        };
        var _H = function(x, y, z) {
          return x ^ y ^ z;
        };
        var _I = function(x, y, z) {
          return y ^ (x | ~z);
        };
        var _FF = function(a, b, c, d, x, s, ac) {
          a = addUnsigned(a, addUnsigned(addUnsigned(_F(b, c, d), x), ac));
          return addUnsigned(rotateLeft(a, s), b);
        };
        var _GG = function(a, b, c, d, x, s, ac) {
          a = addUnsigned(a, addUnsigned(addUnsigned(_G(b, c, d), x), ac));
          return addUnsigned(rotateLeft(a, s), b);
        };
        var _HH = function(a, b, c, d, x, s, ac) {
          a = addUnsigned(a, addUnsigned(addUnsigned(_H(b, c, d), x), ac));
          return addUnsigned(rotateLeft(a, s), b);
        };
        var _II = function(a, b, c, d, x, s, ac) {
          a = addUnsigned(a, addUnsigned(addUnsigned(_I(b, c, d), x), ac));
          return addUnsigned(rotateLeft(a, s), b);
        };
        var convertToWordArray = function(str) {
          var lWordCount;
          var lMessageLength = str.length;
          var lNumberOfWords_temp1 = lMessageLength + 8;
          var lNumberOfWords_temp2 = (lNumberOfWords_temp1 - lNumberOfWords_temp1 % 64) / 64;
          var lNumberOfWords = (lNumberOfWords_temp2 + 1) * 16;
          var lWordArray = new Array(lNumberOfWords - 1);
          var lBytePosition = 0;
          var lByteCount = 0;
          while (lByteCount < lMessageLength) {
            lWordCount = (lByteCount - lByteCount % 4) / 4;
            lBytePosition = lByteCount % 4 * 8;
            lWordArray[lWordCount] = lWordArray[lWordCount] | str.charCodeAt(lByteCount) << lBytePosition;
            lByteCount++;
          }
          lWordCount = (lByteCount - lByteCount % 4) / 4;
          lBytePosition = lByteCount % 4 * 8;
          lWordArray[lWordCount] = lWordArray[lWordCount] | 128 << lBytePosition;
          lWordArray[lNumberOfWords - 2] = lMessageLength << 3;
          lWordArray[lNumberOfWords - 1] = lMessageLength >>> 29;
          return lWordArray;
        };
        var wordToHex = function(lValue) {
          var wordToHexValue = "", wordToHexValue_temp = "", lByte, lCount;
          for (lCount = 0; lCount <= 3; lCount++) {
            lByte = lValue >>> lCount * 8 & 255;
            wordToHexValue_temp = "0" + lByte.toString(16);
            wordToHexValue = wordToHexValue + wordToHexValue_temp.substr(wordToHexValue_temp.length - 2, 2);
          }
          return wordToHexValue;
        };
        var x = [], k, AA, BB, CC, DD, a, b, c, d, S11 = 7, S12 = 12, S13 = 17, S14 = 22, S21 = 5, S22 = 9, S23 = 14, S24 = 20, S31 = 4, S32 = 11, S33 = 16, S34 = 23, S41 = 6, S42 = 10, S43 = 15, S44 = 21;
        x = convertToWordArray(str);
        a = 1732584193;
        b = 4023233417;
        c = 2562383102;
        d = 271733878;
        xl = x.length;
        for (k = 0; k < xl; k += 16) {
          AA = a;
          BB = b;
          CC = c;
          DD = d;
          a = _FF(a, b, c, d, x[k + 0], S11, 3614090360);
          d = _FF(d, a, b, c, x[k + 1], S12, 3905402710);
          c = _FF(c, d, a, b, x[k + 2], S13, 606105819);
          b = _FF(b, c, d, a, x[k + 3], S14, 3250441966);
          a = _FF(a, b, c, d, x[k + 4], S11, 4118548399);
          d = _FF(d, a, b, c, x[k + 5], S12, 1200080426);
          c = _FF(c, d, a, b, x[k + 6], S13, 2821735955);
          b = _FF(b, c, d, a, x[k + 7], S14, 4249261313);
          a = _FF(a, b, c, d, x[k + 8], S11, 1770035416);
          d = _FF(d, a, b, c, x[k + 9], S12, 2336552879);
          c = _FF(c, d, a, b, x[k + 10], S13, 4294925233);
          b = _FF(b, c, d, a, x[k + 11], S14, 2304563134);
          a = _FF(a, b, c, d, x[k + 12], S11, 1804603682);
          d = _FF(d, a, b, c, x[k + 13], S12, 4254626195);
          c = _FF(c, d, a, b, x[k + 14], S13, 2792965006);
          b = _FF(b, c, d, a, x[k + 15], S14, 1236535329);
          a = _GG(a, b, c, d, x[k + 1], S21, 4129170786);
          d = _GG(d, a, b, c, x[k + 6], S22, 3225465664);
          c = _GG(c, d, a, b, x[k + 11], S23, 643717713);
          b = _GG(b, c, d, a, x[k + 0], S24, 3921069994);
          a = _GG(a, b, c, d, x[k + 5], S21, 3593408605);
          d = _GG(d, a, b, c, x[k + 10], S22, 38016083);
          c = _GG(c, d, a, b, x[k + 15], S23, 3634488961);
          b = _GG(b, c, d, a, x[k + 4], S24, 3889429448);
          a = _GG(a, b, c, d, x[k + 9], S21, 568446438);
          d = _GG(d, a, b, c, x[k + 14], S22, 3275163606);
          c = _GG(c, d, a, b, x[k + 3], S23, 4107603335);
          b = _GG(b, c, d, a, x[k + 8], S24, 1163531501);
          a = _GG(a, b, c, d, x[k + 13], S21, 2850285829);
          d = _GG(d, a, b, c, x[k + 2], S22, 4243563512);
          c = _GG(c, d, a, b, x[k + 7], S23, 1735328473);
          b = _GG(b, c, d, a, x[k + 12], S24, 2368359562);
          a = _HH(a, b, c, d, x[k + 5], S31, 4294588738);
          d = _HH(d, a, b, c, x[k + 8], S32, 2272392833);
          c = _HH(c, d, a, b, x[k + 11], S33, 1839030562);
          b = _HH(b, c, d, a, x[k + 14], S34, 4259657740);
          a = _HH(a, b, c, d, x[k + 1], S31, 2763975236);
          d = _HH(d, a, b, c, x[k + 4], S32, 1272893353);
          c = _HH(c, d, a, b, x[k + 7], S33, 4139469664);
          b = _HH(b, c, d, a, x[k + 10], S34, 3200236656);
          a = _HH(a, b, c, d, x[k + 13], S31, 681279174);
          d = _HH(d, a, b, c, x[k + 0], S32, 3936430074);
          c = _HH(c, d, a, b, x[k + 3], S33, 3572445317);
          b = _HH(b, c, d, a, x[k + 6], S34, 76029189);
          a = _HH(a, b, c, d, x[k + 9], S31, 3654602809);
          d = _HH(d, a, b, c, x[k + 12], S32, 3873151461);
          c = _HH(c, d, a, b, x[k + 15], S33, 530742520);
          b = _HH(b, c, d, a, x[k + 2], S34, 3299628645);
          a = _II(a, b, c, d, x[k + 0], S41, 4096336452);
          d = _II(d, a, b, c, x[k + 7], S42, 1126891415);
          c = _II(c, d, a, b, x[k + 14], S43, 2878612391);
          b = _II(b, c, d, a, x[k + 5], S44, 4237533241);
          a = _II(a, b, c, d, x[k + 12], S41, 1700485571);
          d = _II(d, a, b, c, x[k + 3], S42, 2399980690);
          c = _II(c, d, a, b, x[k + 10], S43, 4293915773);
          b = _II(b, c, d, a, x[k + 1], S44, 2240044497);
          a = _II(a, b, c, d, x[k + 8], S41, 1873313359);
          d = _II(d, a, b, c, x[k + 15], S42, 4264355552);
          c = _II(c, d, a, b, x[k + 6], S43, 2734768916);
          b = _II(b, c, d, a, x[k + 13], S44, 1309151649);
          a = _II(a, b, c, d, x[k + 4], S41, 4149444226);
          d = _II(d, a, b, c, x[k + 11], S42, 3174756917);
          c = _II(c, d, a, b, x[k + 2], S43, 718787259);
          b = _II(b, c, d, a, x[k + 9], S44, 3951481745);
          a = addUnsigned(a, AA);
          b = addUnsigned(b, BB);
          c = addUnsigned(c, CC);
          d = addUnsigned(d, DD);
        }
        var temp = wordToHex(a) + wordToHex(b) + wordToHex(c) + wordToHex(d);
        return temp.toLowerCase();
      }
    };
    return md5;
  } ]);
})(this, this.angular, void 0);;/*!
 * imagesLoaded PACKAGED v3.1.6
 * JavaScript is all like "You images are done yet or what?"
 * MIT License
 */

(function(){function e(){}function t(e,t){for(var n=e.length;n--;)if(e[n].listener===t)return n;return-1}function n(e){return function(){return this[e].apply(this,arguments)}}var i=e.prototype,r=this,o=r.EventEmitter;i.getListeners=function(e){var t,n,i=this._getEvents();if("object"==typeof e){t={};for(n in i)i.hasOwnProperty(n)&&e.test(n)&&(t[n]=i[n])}else t=i[e]||(i[e]=[]);return t},i.flattenListeners=function(e){var t,n=[];for(t=0;e.length>t;t+=1)n.push(e[t].listener);return n},i.getListenersAsObject=function(e){var t,n=this.getListeners(e);return n instanceof Array&&(t={},t[e]=n),t||n},i.addListener=function(e,n){var i,r=this.getListenersAsObject(e),o="object"==typeof n;for(i in r)r.hasOwnProperty(i)&&-1===t(r[i],n)&&r[i].push(o?n:{listener:n,once:!1});return this},i.on=n("addListener"),i.addOnceListener=function(e,t){return this.addListener(e,{listener:t,once:!0})},i.once=n("addOnceListener"),i.defineEvent=function(e){return this.getListeners(e),this},i.defineEvents=function(e){for(var t=0;e.length>t;t+=1)this.defineEvent(e[t]);return this},i.removeListener=function(e,n){var i,r,o=this.getListenersAsObject(e);for(r in o)o.hasOwnProperty(r)&&(i=t(o[r],n),-1!==i&&o[r].splice(i,1));return this},i.off=n("removeListener"),i.addListeners=function(e,t){return this.manipulateListeners(!1,e,t)},i.removeListeners=function(e,t){return this.manipulateListeners(!0,e,t)},i.manipulateListeners=function(e,t,n){var i,r,o=e?this.removeListener:this.addListener,s=e?this.removeListeners:this.addListeners;if("object"!=typeof t||t instanceof RegExp)for(i=n.length;i--;)o.call(this,t,n[i]);else for(i in t)t.hasOwnProperty(i)&&(r=t[i])&&("function"==typeof r?o.call(this,i,r):s.call(this,i,r));return this},i.removeEvent=function(e){var t,n=typeof e,i=this._getEvents();if("string"===n)delete i[e];else if("object"===n)for(t in i)i.hasOwnProperty(t)&&e.test(t)&&delete i[t];else delete this._events;return this},i.removeAllListeners=n("removeEvent"),i.emitEvent=function(e,t){var n,i,r,o,s=this.getListenersAsObject(e);for(r in s)if(s.hasOwnProperty(r))for(i=s[r].length;i--;)n=s[r][i],n.once===!0&&this.removeListener(e,n.listener),o=n.listener.apply(this,t||[]),o===this._getOnceReturnValue()&&this.removeListener(e,n.listener);return this},i.trigger=n("emitEvent"),i.emit=function(e){var t=Array.prototype.slice.call(arguments,1);return this.emitEvent(e,t)},i.setOnceReturnValue=function(e){return this._onceReturnValue=e,this},i._getOnceReturnValue=function(){return this.hasOwnProperty("_onceReturnValue")?this._onceReturnValue:!0},i._getEvents=function(){return this._events||(this._events={})},e.noConflict=function(){return r.EventEmitter=o,e},"function"==typeof define&&define.amd?define("eventEmitter/EventEmitter",[],function(){return e}):"object"==typeof module&&module.exports?module.exports=e:this.EventEmitter=e}).call(this),function(e){function t(t){var n=e.event;return n.target=n.target||n.srcElement||t,n}var n=document.documentElement,i=function(){};n.addEventListener?i=function(e,t,n){e.addEventListener(t,n,!1)}:n.attachEvent&&(i=function(e,n,i){e[n+i]=i.handleEvent?function(){var n=t(e);i.handleEvent.call(i,n)}:function(){var n=t(e);i.call(e,n)},e.attachEvent("on"+n,e[n+i])});var r=function(){};n.removeEventListener?r=function(e,t,n){e.removeEventListener(t,n,!1)}:n.detachEvent&&(r=function(e,t,n){e.detachEvent("on"+t,e[t+n]);try{delete e[t+n]}catch(i){e[t+n]=void 0}});var o={bind:i,unbind:r};"function"==typeof define&&define.amd?define("eventie/eventie",o):e.eventie=o}(this),function(e,t){"function"==typeof define&&define.amd?define(["eventEmitter/EventEmitter","eventie/eventie"],function(n,i){return t(e,n,i)}):"object"==typeof exports?module.exports=t(e,require("eventEmitter"),require("eventie")):e.imagesLoaded=t(e,e.EventEmitter,e.eventie)}(this,function(e,t,n){function i(e,t){for(var n in t)e[n]=t[n];return e}function r(e){return"[object Array]"===d.call(e)}function o(e){var t=[];if(r(e))t=e;else if("number"==typeof e.length)for(var n=0,i=e.length;i>n;n++)t.push(e[n]);else t.push(e);return t}function s(e,t,n){if(!(this instanceof s))return new s(e,t);"string"==typeof e&&(e=document.querySelectorAll(e)),this.elements=o(e),this.options=i({},this.options),"function"==typeof t?n=t:i(this.options,t),n&&this.on("always",n),this.getImages(),a&&(this.jqDeferred=new a.Deferred);var r=this;setTimeout(function(){r.check()})}function c(e){this.img=e}function f(e){this.src=e,v[e]=this}var a=e.jQuery,u=e.console,h=u!==void 0,d=Object.prototype.toString;s.prototype=new t,s.prototype.options={},s.prototype.getImages=function(){this.images=[];for(var e=0,t=this.elements.length;t>e;e++){var n=this.elements[e];"IMG"===n.nodeName&&this.addImage(n);var i=n.nodeType;if(i&&(1===i||9===i||11===i))for(var r=n.querySelectorAll("img"),o=0,s=r.length;s>o;o++){var c=r[o];this.addImage(c)}}},s.prototype.addImage=function(e){var t=new c(e);this.images.push(t)},s.prototype.check=function(){function e(e,r){return t.options.debug&&h&&u.log("confirm",e,r),t.progress(e),n++,n===i&&t.complete(),!0}var t=this,n=0,i=this.images.length;if(this.hasAnyBroken=!1,!i)return this.complete(),void 0;for(var r=0;i>r;r++){var o=this.images[r];o.on("confirm",e),o.check()}},s.prototype.progress=function(e){this.hasAnyBroken=this.hasAnyBroken||!e.isLoaded;var t=this;setTimeout(function(){t.emit("progress",t,e),t.jqDeferred&&t.jqDeferred.notify&&t.jqDeferred.notify(t,e)})},s.prototype.complete=function(){var e=this.hasAnyBroken?"fail":"done";this.isComplete=!0;var t=this;setTimeout(function(){if(t.emit(e,t),t.emit("always",t),t.jqDeferred){var n=t.hasAnyBroken?"reject":"resolve";t.jqDeferred[n](t)}})},a&&(a.fn.imagesLoaded=function(e,t){var n=new s(this,e,t);return n.jqDeferred.promise(a(this))}),c.prototype=new t,c.prototype.check=function(){var e=v[this.img.src]||new f(this.img.src);if(e.isConfirmed)return this.confirm(e.isLoaded,"cached was confirmed"),void 0;if(this.img.complete&&void 0!==this.img.naturalWidth)return this.confirm(0!==this.img.naturalWidth,"naturalWidth"),void 0;var t=this;e.on("confirm",function(e,n){return t.confirm(e.isLoaded,n),!0}),e.check()},c.prototype.confirm=function(e,t){this.isLoaded=e,this.emit("confirm",this,t)};var v={};return f.prototype=new t,f.prototype.check=function(){if(!this.isChecked){var e=new Image;n.bind(e,"load",this),n.bind(e,"error",this),e.src=this.src,this.isChecked=!0}},f.prototype.handleEvent=function(e){var t="on"+e.type;this[t]&&this[t](e)},f.prototype.onload=function(e){this.confirm(!0,"onload"),this.unbindProxyEvents(e)},f.prototype.onerror=function(e){this.confirm(!1,"onerror"),this.unbindProxyEvents(e)},f.prototype.confirm=function(e,t){this.isConfirmed=!0,this.isLoaded=e,this.emit("confirm",this,t)},f.prototype.unbindProxyEvents=function(e){n.unbind(e.target,"load",this),n.unbind(e.target,"error",this)},s});;/*global $*/
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
			overlayDOM.innerHTML += '<i class="fa fa-' + params.icon + '">';
		}
	};

	return {
		hide: hide,
		destroy: destroy,
		update: update
	};

};
;/*!
 * Masonry PACKAGED v3.1.5
 * Cascading grid layout library
 * http://masonry.desandro.com
 * MIT License
 * by David DeSandro
 */

!function(a){function b(){}function c(a){function c(b){b.prototype.option||(b.prototype.option=function(b){a.isPlainObject(b)&&(this.options=a.extend(!0,this.options,b))})}function e(b,c){a.fn[b]=function(e){if("string"==typeof e){for(var g=d.call(arguments,1),h=0,i=this.length;i>h;h++){var j=this[h],k=a.data(j,b);if(k)if(a.isFunction(k[e])&&"_"!==e.charAt(0)){var l=k[e].apply(k,g);if(void 0!==l)return l}else f("no such method '"+e+"' for "+b+" instance");else f("cannot call methods on "+b+" prior to initialization; attempted to call '"+e+"'")}return this}return this.each(function(){var d=a.data(this,b);d?(d.option(e),d._init()):(d=new c(this,e),a.data(this,b,d))})}}if(a){var f="undefined"==typeof console?b:function(a){console.error(a)};return a.bridget=function(a,b){c(b),e(a,b)},a.bridget}}var d=Array.prototype.slice;"function"==typeof define&&define.amd?define("jquery-bridget/jquery.bridget",["jquery"],c):c(a.jQuery)}(window),function(a){function b(b){var c=a.event;return c.target=c.target||c.srcElement||b,c}var c=document.documentElement,d=function(){};c.addEventListener?d=function(a,b,c){a.addEventListener(b,c,!1)}:c.attachEvent&&(d=function(a,c,d){a[c+d]=d.handleEvent?function(){var c=b(a);d.handleEvent.call(d,c)}:function(){var c=b(a);d.call(a,c)},a.attachEvent("on"+c,a[c+d])});var e=function(){};c.removeEventListener?e=function(a,b,c){a.removeEventListener(b,c,!1)}:c.detachEvent&&(e=function(a,b,c){a.detachEvent("on"+b,a[b+c]);try{delete a[b+c]}catch(d){a[b+c]=void 0}});var f={bind:d,unbind:e};"function"==typeof define&&define.amd?define("eventie/eventie",f):"object"==typeof exports?module.exports=f:a.eventie=f}(this),function(a){function b(a){"function"==typeof a&&(b.isReady?a():f.push(a))}function c(a){var c="readystatechange"===a.type&&"complete"!==e.readyState;if(!b.isReady&&!c){b.isReady=!0;for(var d=0,g=f.length;g>d;d++){var h=f[d];h()}}}function d(d){return d.bind(e,"DOMContentLoaded",c),d.bind(e,"readystatechange",c),d.bind(a,"load",c),b}var e=a.document,f=[];b.isReady=!1,"function"==typeof define&&define.amd?(b.isReady="function"==typeof requirejs,define("doc-ready/doc-ready",["eventie/eventie"],d)):a.docReady=d(a.eventie)}(this),function(){function a(){}function b(a,b){for(var c=a.length;c--;)if(a[c].listener===b)return c;return-1}function c(a){return function(){return this[a].apply(this,arguments)}}var d=a.prototype,e=this,f=e.EventEmitter;d.getListeners=function(a){var b,c,d=this._getEvents();if(a instanceof RegExp){b={};for(c in d)d.hasOwnProperty(c)&&a.test(c)&&(b[c]=d[c])}else b=d[a]||(d[a]=[]);return b},d.flattenListeners=function(a){var b,c=[];for(b=0;b<a.length;b+=1)c.push(a[b].listener);return c},d.getListenersAsObject=function(a){var b,c=this.getListeners(a);return c instanceof Array&&(b={},b[a]=c),b||c},d.addListener=function(a,c){var d,e=this.getListenersAsObject(a),f="object"==typeof c;for(d in e)e.hasOwnProperty(d)&&-1===b(e[d],c)&&e[d].push(f?c:{listener:c,once:!1});return this},d.on=c("addListener"),d.addOnceListener=function(a,b){return this.addListener(a,{listener:b,once:!0})},d.once=c("addOnceListener"),d.defineEvent=function(a){return this.getListeners(a),this},d.defineEvents=function(a){for(var b=0;b<a.length;b+=1)this.defineEvent(a[b]);return this},d.removeListener=function(a,c){var d,e,f=this.getListenersAsObject(a);for(e in f)f.hasOwnProperty(e)&&(d=b(f[e],c),-1!==d&&f[e].splice(d,1));return this},d.off=c("removeListener"),d.addListeners=function(a,b){return this.manipulateListeners(!1,a,b)},d.removeListeners=function(a,b){return this.manipulateListeners(!0,a,b)},d.manipulateListeners=function(a,b,c){var d,e,f=a?this.removeListener:this.addListener,g=a?this.removeListeners:this.addListeners;if("object"!=typeof b||b instanceof RegExp)for(d=c.length;d--;)f.call(this,b,c[d]);else for(d in b)b.hasOwnProperty(d)&&(e=b[d])&&("function"==typeof e?f.call(this,d,e):g.call(this,d,e));return this},d.removeEvent=function(a){var b,c=typeof a,d=this._getEvents();if("string"===c)delete d[a];else if(a instanceof RegExp)for(b in d)d.hasOwnProperty(b)&&a.test(b)&&delete d[b];else delete this._events;return this},d.removeAllListeners=c("removeEvent"),d.emitEvent=function(a,b){var c,d,e,f,g=this.getListenersAsObject(a);for(e in g)if(g.hasOwnProperty(e))for(d=g[e].length;d--;)c=g[e][d],c.once===!0&&this.removeListener(a,c.listener),f=c.listener.apply(this,b||[]),f===this._getOnceReturnValue()&&this.removeListener(a,c.listener);return this},d.trigger=c("emitEvent"),d.emit=function(a){var b=Array.prototype.slice.call(arguments,1);return this.emitEvent(a,b)},d.setOnceReturnValue=function(a){return this._onceReturnValue=a,this},d._getOnceReturnValue=function(){return this.hasOwnProperty("_onceReturnValue")?this._onceReturnValue:!0},d._getEvents=function(){return this._events||(this._events={})},a.noConflict=function(){return e.EventEmitter=f,a},"function"==typeof define&&define.amd?define("eventEmitter/EventEmitter",[],function(){return a}):"object"==typeof module&&module.exports?module.exports=a:this.EventEmitter=a}.call(this),function(a){function b(a){if(a){if("string"==typeof d[a])return a;a=a.charAt(0).toUpperCase()+a.slice(1);for(var b,e=0,f=c.length;f>e;e++)if(b=c[e]+a,"string"==typeof d[b])return b}}var c="Webkit Moz ms Ms O".split(" "),d=document.documentElement.style;"function"==typeof define&&define.amd?define("get-style-property/get-style-property",[],function(){return b}):"object"==typeof exports?module.exports=b:a.getStyleProperty=b}(window),function(a){function b(a){var b=parseFloat(a),c=-1===a.indexOf("%")&&!isNaN(b);return c&&b}function c(){for(var a={width:0,height:0,innerWidth:0,innerHeight:0,outerWidth:0,outerHeight:0},b=0,c=g.length;c>b;b++){var d=g[b];a[d]=0}return a}function d(a){function d(a){if("string"==typeof a&&(a=document.querySelector(a)),a&&"object"==typeof a&&a.nodeType){var d=f(a);if("none"===d.display)return c();var e={};e.width=a.offsetWidth,e.height=a.offsetHeight;for(var k=e.isBorderBox=!(!j||!d[j]||"border-box"!==d[j]),l=0,m=g.length;m>l;l++){var n=g[l],o=d[n];o=h(a,o);var p=parseFloat(o);e[n]=isNaN(p)?0:p}var q=e.paddingLeft+e.paddingRight,r=e.paddingTop+e.paddingBottom,s=e.marginLeft+e.marginRight,t=e.marginTop+e.marginBottom,u=e.borderLeftWidth+e.borderRightWidth,v=e.borderTopWidth+e.borderBottomWidth,w=k&&i,x=b(d.width);x!==!1&&(e.width=x+(w?0:q+u));var y=b(d.height);return y!==!1&&(e.height=y+(w?0:r+v)),e.innerWidth=e.width-(q+u),e.innerHeight=e.height-(r+v),e.outerWidth=e.width+s,e.outerHeight=e.height+t,e}}function h(a,b){if(e||-1===b.indexOf("%"))return b;var c=a.style,d=c.left,f=a.runtimeStyle,g=f&&f.left;return g&&(f.left=a.currentStyle.left),c.left=b,b=c.pixelLeft,c.left=d,g&&(f.left=g),b}var i,j=a("boxSizing");return function(){if(j){var a=document.createElement("div");a.style.width="200px",a.style.padding="1px 2px 3px 4px",a.style.borderStyle="solid",a.style.borderWidth="1px 2px 3px 4px",a.style[j]="border-box";var c=document.body||document.documentElement;c.appendChild(a);var d=f(a);i=200===b(d.width),c.removeChild(a)}}(),d}var e=a.getComputedStyle,f=e?function(a){return e(a,null)}:function(a){return a.currentStyle},g=["paddingLeft","paddingRight","paddingTop","paddingBottom","marginLeft","marginRight","marginTop","marginBottom","borderLeftWidth","borderRightWidth","borderTopWidth","borderBottomWidth"];"function"==typeof define&&define.amd?define("get-size/get-size",["get-style-property/get-style-property"],d):"object"==typeof exports?module.exports=d(require("get-style-property")):a.getSize=d(a.getStyleProperty)}(window),function(a,b){function c(a,b){return a[h](b)}function d(a){if(!a.parentNode){var b=document.createDocumentFragment();b.appendChild(a)}}function e(a,b){d(a);for(var c=a.parentNode.querySelectorAll(b),e=0,f=c.length;f>e;e++)if(c[e]===a)return!0;return!1}function f(a,b){return d(a),c(a,b)}var g,h=function(){if(b.matchesSelector)return"matchesSelector";for(var a=["webkit","moz","ms","o"],c=0,d=a.length;d>c;c++){var e=a[c],f=e+"MatchesSelector";if(b[f])return f}}();if(h){var i=document.createElement("div"),j=c(i,"div");g=j?c:f}else g=e;"function"==typeof define&&define.amd?define("matches-selector/matches-selector",[],function(){return g}):window.matchesSelector=g}(this,Element.prototype),function(a){function b(a,b){for(var c in b)a[c]=b[c];return a}function c(a){for(var b in a)return!1;return b=null,!0}function d(a){return a.replace(/([A-Z])/g,function(a){return"-"+a.toLowerCase()})}function e(a,e,f){function h(a,b){a&&(this.element=a,this.layout=b,this.position={x:0,y:0},this._create())}var i=f("transition"),j=f("transform"),k=i&&j,l=!!f("perspective"),m={WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"otransitionend",transition:"transitionend"}[i],n=["transform","transition","transitionDuration","transitionProperty"],o=function(){for(var a={},b=0,c=n.length;c>b;b++){var d=n[b],e=f(d);e&&e!==d&&(a[d]=e)}return a}();b(h.prototype,a.prototype),h.prototype._create=function(){this._transn={ingProperties:{},clean:{},onEnd:{}},this.css({position:"absolute"})},h.prototype.handleEvent=function(a){var b="on"+a.type;this[b]&&this[b](a)},h.prototype.getSize=function(){this.size=e(this.element)},h.prototype.css=function(a){var b=this.element.style;for(var c in a){var d=o[c]||c;b[d]=a[c]}},h.prototype.getPosition=function(){var a=g(this.element),b=this.layout.options,c=b.isOriginLeft,d=b.isOriginTop,e=parseInt(a[c?"left":"right"],10),f=parseInt(a[d?"top":"bottom"],10);e=isNaN(e)?0:e,f=isNaN(f)?0:f;var h=this.layout.size;e-=c?h.paddingLeft:h.paddingRight,f-=d?h.paddingTop:h.paddingBottom,this.position.x=e,this.position.y=f},h.prototype.layoutPosition=function(){var a=this.layout.size,b=this.layout.options,c={};b.isOriginLeft?(c.left=this.position.x+a.paddingLeft+"px",c.right=""):(c.right=this.position.x+a.paddingRight+"px",c.left=""),b.isOriginTop?(c.top=this.position.y+a.paddingTop+"px",c.bottom=""):(c.bottom=this.position.y+a.paddingBottom+"px",c.top=""),this.css(c),this.emitEvent("layout",[this])};var p=l?function(a,b){return"translate3d("+a+"px, "+b+"px, 0)"}:function(a,b){return"translate("+a+"px, "+b+"px)"};h.prototype._transitionTo=function(a,b){this.getPosition();var c=this.position.x,d=this.position.y,e=parseInt(a,10),f=parseInt(b,10),g=e===this.position.x&&f===this.position.y;if(this.setPosition(a,b),g&&!this.isTransitioning)return void this.layoutPosition();var h=a-c,i=b-d,j={},k=this.layout.options;h=k.isOriginLeft?h:-h,i=k.isOriginTop?i:-i,j.transform=p(h,i),this.transition({to:j,onTransitionEnd:{transform:this.layoutPosition},isCleaning:!0})},h.prototype.goTo=function(a,b){this.setPosition(a,b),this.layoutPosition()},h.prototype.moveTo=k?h.prototype._transitionTo:h.prototype.goTo,h.prototype.setPosition=function(a,b){this.position.x=parseInt(a,10),this.position.y=parseInt(b,10)},h.prototype._nonTransition=function(a){this.css(a.to),a.isCleaning&&this._removeStyles(a.to);for(var b in a.onTransitionEnd)a.onTransitionEnd[b].call(this)},h.prototype._transition=function(a){if(!parseFloat(this.layout.options.transitionDuration))return void this._nonTransition(a);var b=this._transn;for(var c in a.onTransitionEnd)b.onEnd[c]=a.onTransitionEnd[c];for(c in a.to)b.ingProperties[c]=!0,a.isCleaning&&(b.clean[c]=!0);if(a.from){this.css(a.from);var d=this.element.offsetHeight;d=null}this.enableTransition(a.to),this.css(a.to),this.isTransitioning=!0};var q=j&&d(j)+",opacity";h.prototype.enableTransition=function(){this.isTransitioning||(this.css({transitionProperty:q,transitionDuration:this.layout.options.transitionDuration}),this.element.addEventListener(m,this,!1))},h.prototype.transition=h.prototype[i?"_transition":"_nonTransition"],h.prototype.onwebkitTransitionEnd=function(a){this.ontransitionend(a)},h.prototype.onotransitionend=function(a){this.ontransitionend(a)};var r={"-webkit-transform":"transform","-moz-transform":"transform","-o-transform":"transform"};h.prototype.ontransitionend=function(a){if(a.target===this.element){var b=this._transn,d=r[a.propertyName]||a.propertyName;if(delete b.ingProperties[d],c(b.ingProperties)&&this.disableTransition(),d in b.clean&&(this.element.style[a.propertyName]="",delete b.clean[d]),d in b.onEnd){var e=b.onEnd[d];e.call(this),delete b.onEnd[d]}this.emitEvent("transitionEnd",[this])}},h.prototype.disableTransition=function(){this.removeTransitionStyles(),this.element.removeEventListener(m,this,!1),this.isTransitioning=!1},h.prototype._removeStyles=function(a){var b={};for(var c in a)b[c]="";this.css(b)};var s={transitionProperty:"",transitionDuration:""};return h.prototype.removeTransitionStyles=function(){this.css(s)},h.prototype.removeElem=function(){this.element.parentNode.removeChild(this.element),this.emitEvent("remove",[this])},h.prototype.remove=function(){if(!i||!parseFloat(this.layout.options.transitionDuration))return void this.removeElem();var a=this;this.on("transitionEnd",function(){return a.removeElem(),!0}),this.hide()},h.prototype.reveal=function(){delete this.isHidden,this.css({display:""});var a=this.layout.options;this.transition({from:a.hiddenStyle,to:a.visibleStyle,isCleaning:!0})},h.prototype.hide=function(){this.isHidden=!0,this.css({display:""});var a=this.layout.options;this.transition({from:a.visibleStyle,to:a.hiddenStyle,isCleaning:!0,onTransitionEnd:{opacity:function(){this.isHidden&&this.css({display:"none"})}}})},h.prototype.destroy=function(){this.css({position:"",left:"",right:"",top:"",bottom:"",transition:"",transform:""})},h}var f=a.getComputedStyle,g=f?function(a){return f(a,null)}:function(a){return a.currentStyle};"function"==typeof define&&define.amd?define("outlayer/item",["eventEmitter/EventEmitter","get-size/get-size","get-style-property/get-style-property"],e):(a.Outlayer={},a.Outlayer.Item=e(a.EventEmitter,a.getSize,a.getStyleProperty))}(window),function(a){function b(a,b){for(var c in b)a[c]=b[c];return a}function c(a){return"[object Array]"===l.call(a)}function d(a){var b=[];if(c(a))b=a;else if(a&&"number"==typeof a.length)for(var d=0,e=a.length;e>d;d++)b.push(a[d]);else b.push(a);return b}function e(a,b){var c=n(b,a);-1!==c&&b.splice(c,1)}function f(a){return a.replace(/(.)([A-Z])/g,function(a,b,c){return b+"-"+c}).toLowerCase()}function g(c,g,l,n,o,p){function q(a,c){if("string"==typeof a&&(a=h.querySelector(a)),!a||!m(a))return void(i&&i.error("Bad "+this.constructor.namespace+" element: "+a));this.element=a,this.options=b({},this.constructor.defaults),this.option(c);var d=++r;this.element.outlayerGUID=d,s[d]=this,this._create(),this.options.isInitLayout&&this.layout()}var r=0,s={};return q.namespace="outlayer",q.Item=p,q.defaults={containerStyle:{position:"relative"},isInitLayout:!0,isOriginLeft:!0,isOriginTop:!0,isResizeBound:!0,isResizingContainer:!0,transitionDuration:"0.4s",hiddenStyle:{opacity:0,transform:"scale(0.001)"},visibleStyle:{opacity:1,transform:"scale(1)"}},b(q.prototype,l.prototype),q.prototype.option=function(a){b(this.options,a)},q.prototype._create=function(){this.reloadItems(),this.stamps=[],this.stamp(this.options.stamp),b(this.element.style,this.options.containerStyle),this.options.isResizeBound&&this.bindResize()},q.prototype.reloadItems=function(){this.items=this._itemize(this.element.children)},q.prototype._itemize=function(a){for(var b=this._filterFindItemElements(a),c=this.constructor.Item,d=[],e=0,f=b.length;f>e;e++){var g=b[e],h=new c(g,this);d.push(h)}return d},q.prototype._filterFindItemElements=function(a){a=d(a);for(var b=this.options.itemSelector,c=[],e=0,f=a.length;f>e;e++){var g=a[e];if(m(g))if(b){o(g,b)&&c.push(g);for(var h=g.querySelectorAll(b),i=0,j=h.length;j>i;i++)c.push(h[i])}else c.push(g)}return c},q.prototype.getItemElements=function(){for(var a=[],b=0,c=this.items.length;c>b;b++)a.push(this.items[b].element);return a},q.prototype.layout=function(){this._resetLayout(),this._manageStamps();var a=void 0!==this.options.isLayoutInstant?this.options.isLayoutInstant:!this._isLayoutInited;this.layoutItems(this.items,a),this._isLayoutInited=!0},q.prototype._init=q.prototype.layout,q.prototype._resetLayout=function(){this.getSize()},q.prototype.getSize=function(){this.size=n(this.element)},q.prototype._getMeasurement=function(a,b){var c,d=this.options[a];d?("string"==typeof d?c=this.element.querySelector(d):m(d)&&(c=d),this[a]=c?n(c)[b]:d):this[a]=0},q.prototype.layoutItems=function(a,b){a=this._getItemsForLayout(a),this._layoutItems(a,b),this._postLayout()},q.prototype._getItemsForLayout=function(a){for(var b=[],c=0,d=a.length;d>c;c++){var e=a[c];e.isIgnored||b.push(e)}return b},q.prototype._layoutItems=function(a,b){function c(){d.emitEvent("layoutComplete",[d,a])}var d=this;if(!a||!a.length)return void c();this._itemsOn(a,"layout",c);for(var e=[],f=0,g=a.length;g>f;f++){var h=a[f],i=this._getItemLayoutPosition(h);i.item=h,i.isInstant=b||h.isLayoutInstant,e.push(i)}this._processLayoutQueue(e)},q.prototype._getItemLayoutPosition=function(){return{x:0,y:0}},q.prototype._processLayoutQueue=function(a){for(var b=0,c=a.length;c>b;b++){var d=a[b];this._positionItem(d.item,d.x,d.y,d.isInstant)}},q.prototype._positionItem=function(a,b,c,d){d?a.goTo(b,c):a.moveTo(b,c)},q.prototype._postLayout=function(){this.resizeContainer()},q.prototype.resizeContainer=function(){if(this.options.isResizingContainer){var a=this._getContainerSize();a&&(this._setContainerMeasure(a.width,!0),this._setContainerMeasure(a.height,!1))}},q.prototype._getContainerSize=k,q.prototype._setContainerMeasure=function(a,b){if(void 0!==a){var c=this.size;c.isBorderBox&&(a+=b?c.paddingLeft+c.paddingRight+c.borderLeftWidth+c.borderRightWidth:c.paddingBottom+c.paddingTop+c.borderTopWidth+c.borderBottomWidth),a=Math.max(a,0),this.element.style[b?"width":"height"]=a+"px"}},q.prototype._itemsOn=function(a,b,c){function d(){return e++,e===f&&c.call(g),!0}for(var e=0,f=a.length,g=this,h=0,i=a.length;i>h;h++){var j=a[h];j.on(b,d)}},q.prototype.ignore=function(a){var b=this.getItem(a);b&&(b.isIgnored=!0)},q.prototype.unignore=function(a){var b=this.getItem(a);b&&delete b.isIgnored},q.prototype.stamp=function(a){if(a=this._find(a)){this.stamps=this.stamps.concat(a);for(var b=0,c=a.length;c>b;b++){var d=a[b];this.ignore(d)}}},q.prototype.unstamp=function(a){if(a=this._find(a))for(var b=0,c=a.length;c>b;b++){var d=a[b];e(d,this.stamps),this.unignore(d)}},q.prototype._find=function(a){return a?("string"==typeof a&&(a=this.element.querySelectorAll(a)),a=d(a)):void 0},q.prototype._manageStamps=function(){if(this.stamps&&this.stamps.length){this._getBoundingRect();for(var a=0,b=this.stamps.length;b>a;a++){var c=this.stamps[a];this._manageStamp(c)}}},q.prototype._getBoundingRect=function(){var a=this.element.getBoundingClientRect(),b=this.size;this._boundingRect={left:a.left+b.paddingLeft+b.borderLeftWidth,top:a.top+b.paddingTop+b.borderTopWidth,right:a.right-(b.paddingRight+b.borderRightWidth),bottom:a.bottom-(b.paddingBottom+b.borderBottomWidth)}},q.prototype._manageStamp=k,q.prototype._getElementOffset=function(a){var b=a.getBoundingClientRect(),c=this._boundingRect,d=n(a),e={left:b.left-c.left-d.marginLeft,top:b.top-c.top-d.marginTop,right:c.right-b.right-d.marginRight,bottom:c.bottom-b.bottom-d.marginBottom};return e},q.prototype.handleEvent=function(a){var b="on"+a.type;this[b]&&this[b](a)},q.prototype.bindResize=function(){this.isResizeBound||(c.bind(a,"resize",this),this.isResizeBound=!0)},q.prototype.unbindResize=function(){this.isResizeBound&&c.unbind(a,"resize",this),this.isResizeBound=!1},q.prototype.onresize=function(){function a(){b.resize(),delete b.resizeTimeout}this.resizeTimeout&&clearTimeout(this.resizeTimeout);var b=this;this.resizeTimeout=setTimeout(a,100)},q.prototype.resize=function(){this.isResizeBound&&this.needsResizeLayout()&&this.layout()},q.prototype.needsResizeLayout=function(){var a=n(this.element),b=this.size&&a;return b&&a.innerWidth!==this.size.innerWidth},q.prototype.addItems=function(a){var b=this._itemize(a);return b.length&&(this.items=this.items.concat(b)),b},q.prototype.appended=function(a){var b=this.addItems(a);b.length&&(this.layoutItems(b,!0),this.reveal(b))},q.prototype.prepended=function(a){var b=this._itemize(a);if(b.length){var c=this.items.slice(0);this.items=b.concat(c),this._resetLayout(),this._manageStamps(),this.layoutItems(b,!0),this.reveal(b),this.layoutItems(c)}},q.prototype.reveal=function(a){var b=a&&a.length;if(b)for(var c=0;b>c;c++){var d=a[c];d.reveal()}},q.prototype.hide=function(a){var b=a&&a.length;if(b)for(var c=0;b>c;c++){var d=a[c];d.hide()}},q.prototype.getItem=function(a){for(var b=0,c=this.items.length;c>b;b++){var d=this.items[b];if(d.element===a)return d}},q.prototype.getItems=function(a){if(a&&a.length){for(var b=[],c=0,d=a.length;d>c;c++){var e=a[c],f=this.getItem(e);f&&b.push(f)}return b}},q.prototype.remove=function(a){a=d(a);var b=this.getItems(a);if(b&&b.length){this._itemsOn(b,"remove",function(){this.emitEvent("removeComplete",[this,b])});for(var c=0,f=b.length;f>c;c++){var g=b[c];g.remove(),e(g,this.items)}}},q.prototype.destroy=function(){var a=this.element.style;a.height="",a.position="",a.width="";for(var b=0,c=this.items.length;c>b;b++){var d=this.items[b];d.destroy()}this.unbindResize(),delete this.element.outlayerGUID,j&&j.removeData(this.element,this.constructor.namespace)},q.data=function(a){var b=a&&a.outlayerGUID;return b&&s[b]},q.create=function(a,c){function d(){q.apply(this,arguments)}return Object.create?d.prototype=Object.create(q.prototype):b(d.prototype,q.prototype),d.prototype.constructor=d,d.defaults=b({},q.defaults),b(d.defaults,c),d.prototype.settings={},d.namespace=a,d.data=q.data,d.Item=function(){p.apply(this,arguments)},d.Item.prototype=new p,g(function(){for(var b=f(a),c=h.querySelectorAll(".js-"+b),e="data-"+b+"-options",g=0,k=c.length;k>g;g++){var l,m=c[g],n=m.getAttribute(e);try{l=n&&JSON.parse(n)}catch(o){i&&i.error("Error parsing "+e+" on "+m.nodeName.toLowerCase()+(m.id?"#"+m.id:"")+": "+o);continue}var p=new d(m,l);j&&j.data(m,a,p)}}),j&&j.bridget&&j.bridget(a,d),d},q.Item=p,q}var h=a.document,i=a.console,j=a.jQuery,k=function(){},l=Object.prototype.toString,m="object"==typeof HTMLElement?function(a){return a instanceof HTMLElement}:function(a){return a&&"object"==typeof a&&1===a.nodeType&&"string"==typeof a.nodeName},n=Array.prototype.indexOf?function(a,b){return a.indexOf(b)}:function(a,b){for(var c=0,d=a.length;d>c;c++)if(a[c]===b)return c;return-1};"function"==typeof define&&define.amd?define("outlayer/outlayer",["eventie/eventie","doc-ready/doc-ready","eventEmitter/EventEmitter","get-size/get-size","matches-selector/matches-selector","./item"],g):a.Outlayer=g(a.eventie,a.docReady,a.EventEmitter,a.getSize,a.matchesSelector,a.Outlayer.Item)}(window),function(a){function b(a,b){var d=a.create("masonry");return d.prototype._resetLayout=function(){this.getSize(),this._getMeasurement("columnWidth","outerWidth"),this._getMeasurement("gutter","outerWidth"),this.measureColumns();var a=this.cols;for(this.colYs=[];a--;)this.colYs.push(0);this.maxY=0},d.prototype.measureColumns=function(){if(this.getContainerWidth(),!this.columnWidth){var a=this.items[0],c=a&&a.element;this.columnWidth=c&&b(c).outerWidth||this.containerWidth}this.columnWidth+=this.gutter,this.cols=Math.floor((this.containerWidth+this.gutter)/this.columnWidth),this.cols=Math.max(this.cols,1)},d.prototype.getContainerWidth=function(){var a=this.options.isFitWidth?this.element.parentNode:this.element,c=b(a);this.containerWidth=c&&c.innerWidth},d.prototype._getItemLayoutPosition=function(a){a.getSize();var b=a.size.outerWidth%this.columnWidth,d=b&&1>b?"round":"ceil",e=Math[d](a.size.outerWidth/this.columnWidth);e=Math.min(e,this.cols);for(var f=this._getColGroup(e),g=Math.min.apply(Math,f),h=c(f,g),i={x:this.columnWidth*h,y:g},j=g+a.size.outerHeight,k=this.cols+1-f.length,l=0;k>l;l++)this.colYs[h+l]=j;return i},d.prototype._getColGroup=function(a){if(2>a)return this.colYs;for(var b=[],c=this.cols+1-a,d=0;c>d;d++){var e=this.colYs.slice(d,d+a);b[d]=Math.max.apply(Math,e)}return b},d.prototype._manageStamp=function(a){var c=b(a),d=this._getElementOffset(a),e=this.options.isOriginLeft?d.left:d.right,f=e+c.outerWidth,g=Math.floor(e/this.columnWidth);g=Math.max(0,g);var h=Math.floor(f/this.columnWidth);h-=f%this.columnWidth?0:1,h=Math.min(this.cols-1,h);for(var i=(this.options.isOriginTop?d.top:d.bottom)+c.outerHeight,j=g;h>=j;j++)this.colYs[j]=Math.max(i,this.colYs[j])},d.prototype._getContainerSize=function(){this.maxY=Math.max.apply(Math,this.colYs);var a={height:this.maxY};return this.options.isFitWidth&&(a.width=this._getContainerFitWidth()),a},d.prototype._getContainerFitWidth=function(){for(var a=0,b=this.cols;--b&&0===this.colYs[b];)a++;return(this.cols-a)*this.columnWidth-this.gutter},d.prototype.needsResizeLayout=function(){var a=this.containerWidth;return this.getContainerWidth(),a!==this.containerWidth},d}var c=Array.prototype.indexOf?function(a,b){return a.indexOf(b)}:function(a,b){for(var c=0,d=a.length;d>c;c++){var e=a[c];if(e===b)return c}return-1};"function"==typeof define&&define.amd?define(["outlayer/outlayer","get-size/get-size"],b):a.Masonry=b(a.Outlayer,a.getSize)}(window);;/*
 * angular-ui-bootstrap
 * http://angular-ui.github.io/bootstrap/

 * Version: 0.10.0 - 2014-01-13
 * License: MIT
 */
angular.module("ui.bootstrap",["ui.bootstrap.tpls","ui.bootstrap.transition","ui.bootstrap.collapse","ui.bootstrap.accordion","ui.bootstrap.alert","ui.bootstrap.bindHtml","ui.bootstrap.buttons","ui.bootstrap.carousel","ui.bootstrap.position","ui.bootstrap.datepicker","ui.bootstrap.dropdownToggle","ui.bootstrap.modal","ui.bootstrap.pagination","ui.bootstrap.tooltip","ui.bootstrap.popover","ui.bootstrap.progressbar","ui.bootstrap.rating","ui.bootstrap.tabs","ui.bootstrap.timepicker","ui.bootstrap.typeahead"]),angular.module("ui.bootstrap.tpls",["template/accordion/accordion-group.html","template/accordion/accordion.html","template/alert/alert.html","template/carousel/carousel.html","template/carousel/slide.html","template/datepicker/datepicker.html","template/datepicker/popup.html","template/modal/backdrop.html","template/modal/window.html","template/pagination/pager.html","template/pagination/pagination.html","template/tooltip/tooltip-html-unsafe-popup.html","template/tooltip/tooltip-popup.html","template/popover/popover.html","template/progressbar/bar.html","template/progressbar/progress.html","template/progressbar/progressbar.html","template/rating/rating.html","template/tabs/tab.html","template/tabs/tabset.html","template/timepicker/timepicker.html","template/typeahead/typeahead-match.html","template/typeahead/typeahead-popup.html"]),angular.module("ui.bootstrap.transition",[]).factory("$transition",["$q","$timeout","$rootScope",function(a,b,c){function d(a){for(var b in a)if(void 0!==f.style[b])return a[b]}var e=function(d,f,g){g=g||{};var h=a.defer(),i=e[g.animation?"animationEndEventName":"transitionEndEventName"],j=function(){c.$apply(function(){d.unbind(i,j),h.resolve(d)})};return i&&d.bind(i,j),b(function(){angular.isString(f)?d.addClass(f):angular.isFunction(f)?f(d):angular.isObject(f)&&d.css(f),i||h.resolve(d)}),h.promise.cancel=function(){i&&d.unbind(i,j),h.reject("Transition cancelled")},h.promise},f=document.createElement("trans"),g={WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"oTransitionEnd",transition:"transitionend"},h={WebkitTransition:"webkitAnimationEnd",MozTransition:"animationend",OTransition:"oAnimationEnd",transition:"animationend"};return e.transitionEndEventName=d(g),e.animationEndEventName=d(h),e}]),angular.module("ui.bootstrap.collapse",["ui.bootstrap.transition"]).directive("collapse",["$transition",function(a){return{link:function(b,c,d){function e(b){function d(){j===e&&(j=void 0)}var e=a(c,b);return j&&j.cancel(),j=e,e.then(d,d),e}function f(){k?(k=!1,g()):(c.removeClass("collapse").addClass("collapsing"),e({height:c[0].scrollHeight+"px"}).then(g))}function g(){c.removeClass("collapsing"),c.addClass("collapse in"),c.css({height:"auto"})}function h(){if(k)k=!1,i(),c.css({height:0});else{c.css({height:c[0].scrollHeight+"px"});{c[0].offsetWidth}c.removeClass("collapse in").addClass("collapsing"),e({height:0}).then(i)}}function i(){c.removeClass("collapsing"),c.addClass("collapse")}var j,k=!0;b.$watch(d.collapse,function(a){a?h():f()})}}}]),angular.module("ui.bootstrap.accordion",["ui.bootstrap.collapse"]).constant("accordionConfig",{closeOthers:!0}).controller("AccordionController",["$scope","$attrs","accordionConfig",function(a,b,c){this.groups=[],this.closeOthers=function(d){var e=angular.isDefined(b.closeOthers)?a.$eval(b.closeOthers):c.closeOthers;e&&angular.forEach(this.groups,function(a){a!==d&&(a.isOpen=!1)})},this.addGroup=function(a){var b=this;this.groups.push(a),a.$on("$destroy",function(){b.removeGroup(a)})},this.removeGroup=function(a){var b=this.groups.indexOf(a);-1!==b&&this.groups.splice(this.groups.indexOf(a),1)}}]).directive("accordion",function(){return{restrict:"EA",controller:"AccordionController",transclude:!0,replace:!1,templateUrl:"template/accordion/accordion.html"}}).directive("accordionGroup",["$parse",function(a){return{require:"^accordion",restrict:"EA",transclude:!0,replace:!0,templateUrl:"template/accordion/accordion-group.html",scope:{heading:"@"},controller:function(){this.setHeading=function(a){this.heading=a}},link:function(b,c,d,e){var f,g;e.addGroup(b),b.isOpen=!1,d.isOpen&&(f=a(d.isOpen),g=f.assign,b.$parent.$watch(f,function(a){b.isOpen=!!a})),b.$watch("isOpen",function(a){a&&e.closeOthers(b),g&&g(b.$parent,a)})}}}]).directive("accordionHeading",function(){return{restrict:"EA",transclude:!0,template:"",replace:!0,require:"^accordionGroup",compile:function(a,b,c){return function(a,b,d,e){e.setHeading(c(a,function(){}))}}}}).directive("accordionTransclude",function(){return{require:"^accordionGroup",link:function(a,b,c,d){a.$watch(function(){return d[c.accordionTransclude]},function(a){a&&(b.html(""),b.append(a))})}}}),angular.module("ui.bootstrap.alert",[]).controller("AlertController",["$scope","$attrs",function(a,b){a.closeable="close"in b}]).directive("alert",function(){return{restrict:"EA",controller:"AlertController",templateUrl:"template/alert/alert.html",transclude:!0,replace:!0,scope:{type:"=",close:"&"}}}),angular.module("ui.bootstrap.bindHtml",[]).directive("bindHtmlUnsafe",function(){return function(a,b,c){b.addClass("ng-binding").data("$binding",c.bindHtmlUnsafe),a.$watch(c.bindHtmlUnsafe,function(a){b.html(a||"")})}}),angular.module("ui.bootstrap.buttons",[]).constant("buttonConfig",{activeClass:"active",toggleEvent:"click"}).controller("ButtonsController",["buttonConfig",function(a){this.activeClass=a.activeClass||"active",this.toggleEvent=a.toggleEvent||"click"}]).directive("btnRadio",function(){return{require:["btnRadio","ngModel"],controller:"ButtonsController",link:function(a,b,c,d){var e=d[0],f=d[1];f.$render=function(){b.toggleClass(e.activeClass,angular.equals(f.$modelValue,a.$eval(c.btnRadio)))},b.bind(e.toggleEvent,function(){b.hasClass(e.activeClass)||a.$apply(function(){f.$setViewValue(a.$eval(c.btnRadio)),f.$render()})})}}}).directive("btnCheckbox",function(){return{require:["btnCheckbox","ngModel"],controller:"ButtonsController",link:function(a,b,c,d){function e(){return g(c.btnCheckboxTrue,!0)}function f(){return g(c.btnCheckboxFalse,!1)}function g(b,c){var d=a.$eval(b);return angular.isDefined(d)?d:c}var h=d[0],i=d[1];i.$render=function(){b.toggleClass(h.activeClass,angular.equals(i.$modelValue,e()))},b.bind(h.toggleEvent,function(){a.$apply(function(){i.$setViewValue(b.hasClass(h.activeClass)?f():e()),i.$render()})})}}}),angular.module("ui.bootstrap.carousel",["ui.bootstrap.transition"]).controller("CarouselController",["$scope","$timeout","$transition","$q",function(a,b,c){function d(){e();var c=+a.interval;!isNaN(c)&&c>=0&&(g=b(f,c))}function e(){g&&(b.cancel(g),g=null)}function f(){h?(a.next(),d()):a.pause()}var g,h,i=this,j=i.slides=[],k=-1;i.currentSlide=null;var l=!1;i.select=function(e,f){function g(){if(!l){if(i.currentSlide&&angular.isString(f)&&!a.noTransition&&e.$element){e.$element.addClass(f);{e.$element[0].offsetWidth}angular.forEach(j,function(a){angular.extend(a,{direction:"",entering:!1,leaving:!1,active:!1})}),angular.extend(e,{direction:f,active:!0,entering:!0}),angular.extend(i.currentSlide||{},{direction:f,leaving:!0}),a.$currentTransition=c(e.$element,{}),function(b,c){a.$currentTransition.then(function(){h(b,c)},function(){h(b,c)})}(e,i.currentSlide)}else h(e,i.currentSlide);i.currentSlide=e,k=m,d()}}function h(b,c){angular.extend(b,{direction:"",active:!0,leaving:!1,entering:!1}),angular.extend(c||{},{direction:"",active:!1,leaving:!1,entering:!1}),a.$currentTransition=null}var m=j.indexOf(e);void 0===f&&(f=m>k?"next":"prev"),e&&e!==i.currentSlide&&(a.$currentTransition?(a.$currentTransition.cancel(),b(g)):g())},a.$on("$destroy",function(){l=!0}),i.indexOfSlide=function(a){return j.indexOf(a)},a.next=function(){var b=(k+1)%j.length;return a.$currentTransition?void 0:i.select(j[b],"next")},a.prev=function(){var b=0>k-1?j.length-1:k-1;return a.$currentTransition?void 0:i.select(j[b],"prev")},a.select=function(a){i.select(a)},a.isActive=function(a){return i.currentSlide===a},a.slides=function(){return j},a.$watch("interval",d),a.$on("$destroy",e),a.play=function(){h||(h=!0,d())},a.pause=function(){a.noPause||(h=!1,e())},i.addSlide=function(b,c){b.$element=c,j.push(b),1===j.length||b.active?(i.select(j[j.length-1]),1==j.length&&a.play()):b.active=!1},i.removeSlide=function(a){var b=j.indexOf(a);j.splice(b,1),j.length>0&&a.active?b>=j.length?i.select(j[b-1]):i.select(j[b]):k>b&&k--}}]).directive("carousel",[function(){return{restrict:"EA",transclude:!0,replace:!0,controller:"CarouselController",require:"carousel",templateUrl:"template/carousel/carousel.html",scope:{interval:"=",noTransition:"=",noPause:"="}}}]).directive("slide",["$parse",function(a){return{require:"^carousel",restrict:"EA",transclude:!0,replace:!0,templateUrl:"template/carousel/slide.html",scope:{},link:function(b,c,d,e){if(d.active){var f=a(d.active),g=f.assign,h=b.active=f(b.$parent);b.$watch(function(){var a=f(b.$parent);return a!==b.active&&(a!==h?h=b.active=a:g(b.$parent,a=h=b.active)),a})}e.addSlide(b,c),b.$on("$destroy",function(){e.removeSlide(b)}),b.$watch("active",function(a){a&&e.select(b)})}}}]),angular.module("ui.bootstrap.position",[]).factory("$position",["$document","$window",function(a,b){function c(a,c){return a.currentStyle?a.currentStyle[c]:b.getComputedStyle?b.getComputedStyle(a)[c]:a.style[c]}function d(a){return"static"===(c(a,"position")||"static")}var e=function(b){for(var c=a[0],e=b.offsetParent||c;e&&e!==c&&d(e);)e=e.offsetParent;return e||c};return{position:function(b){var c=this.offset(b),d={top:0,left:0},f=e(b[0]);f!=a[0]&&(d=this.offset(angular.element(f)),d.top+=f.clientTop-f.scrollTop,d.left+=f.clientLeft-f.scrollLeft);var g=b[0].getBoundingClientRect();return{width:g.width||b.prop("offsetWidth"),height:g.height||b.prop("offsetHeight"),top:c.top-d.top,left:c.left-d.left}},offset:function(c){var d=c[0].getBoundingClientRect();return{width:d.width||c.prop("offsetWidth"),height:d.height||c.prop("offsetHeight"),top:d.top+(b.pageYOffset||a[0].body.scrollTop||a[0].documentElement.scrollTop),left:d.left+(b.pageXOffset||a[0].body.scrollLeft||a[0].documentElement.scrollLeft)}}}}]),angular.module("ui.bootstrap.datepicker",["ui.bootstrap.position"]).constant("datepickerConfig",{dayFormat:"dd",monthFormat:"MMMM",yearFormat:"yyyy",dayHeaderFormat:"EEE",dayTitleFormat:"MMMM yyyy",monthTitleFormat:"yyyy",showWeeks:!0,startingDay:0,yearRange:20,minDate:null,maxDate:null}).controller("DatepickerController",["$scope","$attrs","dateFilter","datepickerConfig",function(a,b,c,d){function e(b,c){return angular.isDefined(b)?a.$parent.$eval(b):c}function f(a,b){return new Date(a,b,0).getDate()}function g(a,b){for(var c=new Array(b),d=a,e=0;b>e;)c[e++]=new Date(d),d.setDate(d.getDate()+1);return c}function h(a,b,d,e){return{date:a,label:c(a,b),selected:!!d,secondary:!!e}}var i={day:e(b.dayFormat,d.dayFormat),month:e(b.monthFormat,d.monthFormat),year:e(b.yearFormat,d.yearFormat),dayHeader:e(b.dayHeaderFormat,d.dayHeaderFormat),dayTitle:e(b.dayTitleFormat,d.dayTitleFormat),monthTitle:e(b.monthTitleFormat,d.monthTitleFormat)},j=e(b.startingDay,d.startingDay),k=e(b.yearRange,d.yearRange);this.minDate=d.minDate?new Date(d.minDate):null,this.maxDate=d.maxDate?new Date(d.maxDate):null,this.modes=[{name:"day",getVisibleDates:function(a,b){var d=a.getFullYear(),e=a.getMonth(),k=new Date(d,e,1),l=j-k.getDay(),m=l>0?7-l:-l,n=new Date(k),o=0;m>0&&(n.setDate(-m+1),o+=m),o+=f(d,e+1),o+=(7-o%7)%7;for(var p=g(n,o),q=new Array(7),r=0;o>r;r++){var s=new Date(p[r]);p[r]=h(s,i.day,b&&b.getDate()===s.getDate()&&b.getMonth()===s.getMonth()&&b.getFullYear()===s.getFullYear(),s.getMonth()!==e)}for(var t=0;7>t;t++)q[t]=c(p[t].date,i.dayHeader);return{objects:p,title:c(a,i.dayTitle),labels:q}},compare:function(a,b){return new Date(a.getFullYear(),a.getMonth(),a.getDate())-new Date(b.getFullYear(),b.getMonth(),b.getDate())},split:7,step:{months:1}},{name:"month",getVisibleDates:function(a,b){for(var d=new Array(12),e=a.getFullYear(),f=0;12>f;f++){var g=new Date(e,f,1);d[f]=h(g,i.month,b&&b.getMonth()===f&&b.getFullYear()===e)}return{objects:d,title:c(a,i.monthTitle)}},compare:function(a,b){return new Date(a.getFullYear(),a.getMonth())-new Date(b.getFullYear(),b.getMonth())},split:3,step:{years:1}},{name:"year",getVisibleDates:function(a,b){for(var c=new Array(k),d=a.getFullYear(),e=parseInt((d-1)/k,10)*k+1,f=0;k>f;f++){var g=new Date(e+f,0,1);c[f]=h(g,i.year,b&&b.getFullYear()===g.getFullYear())}return{objects:c,title:[c[0].label,c[k-1].label].join(" - ")}},compare:function(a,b){return a.getFullYear()-b.getFullYear()},split:5,step:{years:k}}],this.isDisabled=function(b,c){var d=this.modes[c||0];return this.minDate&&d.compare(b,this.minDate)<0||this.maxDate&&d.compare(b,this.maxDate)>0||a.dateDisabled&&a.dateDisabled({date:b,mode:d.name})}}]).directive("datepicker",["dateFilter","$parse","datepickerConfig","$log",function(a,b,c,d){return{restrict:"EA",replace:!0,templateUrl:"template/datepicker/datepicker.html",scope:{dateDisabled:"&"},require:["datepicker","?^ngModel"],controller:"DatepickerController",link:function(a,e,f,g){function h(){a.showWeekNumbers=0===o&&q}function i(a,b){for(var c=[];a.length>0;)c.push(a.splice(0,b));return c}function j(b){var c=null,e=!0;n.$modelValue&&(c=new Date(n.$modelValue),isNaN(c)?(e=!1,d.error('Datepicker directive: "ng-model" value must be a Date object, a number of milliseconds since 01.01.1970 or a string representing an RFC2822 or ISO 8601 date.')):b&&(p=c)),n.$setValidity("date",e);var f=m.modes[o],g=f.getVisibleDates(p,c);angular.forEach(g.objects,function(a){a.disabled=m.isDisabled(a.date,o)}),n.$setValidity("date-disabled",!c||!m.isDisabled(c)),a.rows=i(g.objects,f.split),a.labels=g.labels||[],a.title=g.title}function k(a){o=a,h(),j()}function l(a){var b=new Date(a);b.setDate(b.getDate()+4-(b.getDay()||7));var c=b.getTime();return b.setMonth(0),b.setDate(1),Math.floor(Math.round((c-b)/864e5)/7)+1}var m=g[0],n=g[1];if(n){var o=0,p=new Date,q=c.showWeeks;f.showWeeks?a.$parent.$watch(b(f.showWeeks),function(a){q=!!a,h()}):h(),f.min&&a.$parent.$watch(b(f.min),function(a){m.minDate=a?new Date(a):null,j()}),f.max&&a.$parent.$watch(b(f.max),function(a){m.maxDate=a?new Date(a):null,j()}),n.$render=function(){j(!0)},a.select=function(a){if(0===o){var b=n.$modelValue?new Date(n.$modelValue):new Date(0,0,0,0,0,0,0);b.setFullYear(a.getFullYear(),a.getMonth(),a.getDate()),n.$setViewValue(b),j(!0)}else p=a,k(o-1)},a.move=function(a){var b=m.modes[o].step;p.setMonth(p.getMonth()+a*(b.months||0)),p.setFullYear(p.getFullYear()+a*(b.years||0)),j()},a.toggleMode=function(){k((o+1)%m.modes.length)},a.getWeekNumber=function(b){return 0===o&&a.showWeekNumbers&&7===b.length?l(b[0].date):null}}}}}]).constant("datepickerPopupConfig",{dateFormat:"yyyy-MM-dd",currentText:"Today",toggleWeeksText:"Weeks",clearText:"Clear",closeText:"Done",closeOnDateSelection:!0,appendToBody:!1,showButtonBar:!0}).directive("datepickerPopup",["$compile","$parse","$document","$position","dateFilter","datepickerPopupConfig","datepickerConfig",function(a,b,c,d,e,f,g){return{restrict:"EA",require:"ngModel",link:function(h,i,j,k){function l(a){u?u(h,!!a):q.isOpen=!!a}function m(a){if(a){if(angular.isDate(a))return k.$setValidity("date",!0),a;if(angular.isString(a)){var b=new Date(a);return isNaN(b)?(k.$setValidity("date",!1),void 0):(k.$setValidity("date",!0),b)}return k.$setValidity("date",!1),void 0}return k.$setValidity("date",!0),null}function n(a,c,d){a&&(h.$watch(b(a),function(a){q[c]=a}),y.attr(d||c,c))}function o(){q.position=s?d.offset(i):d.position(i),q.position.top=q.position.top+i.prop("offsetHeight")}var p,q=h.$new(),r=angular.isDefined(j.closeOnDateSelection)?h.$eval(j.closeOnDateSelection):f.closeOnDateSelection,s=angular.isDefined(j.datepickerAppendToBody)?h.$eval(j.datepickerAppendToBody):f.appendToBody;j.$observe("datepickerPopup",function(a){p=a||f.dateFormat,k.$render()}),q.showButtonBar=angular.isDefined(j.showButtonBar)?h.$eval(j.showButtonBar):f.showButtonBar,h.$on("$destroy",function(){C.remove(),q.$destroy()}),j.$observe("currentText",function(a){q.currentText=angular.isDefined(a)?a:f.currentText}),j.$observe("toggleWeeksText",function(a){q.toggleWeeksText=angular.isDefined(a)?a:f.toggleWeeksText}),j.$observe("clearText",function(a){q.clearText=angular.isDefined(a)?a:f.clearText}),j.$observe("closeText",function(a){q.closeText=angular.isDefined(a)?a:f.closeText});var t,u;j.isOpen&&(t=b(j.isOpen),u=t.assign,h.$watch(t,function(a){q.isOpen=!!a})),q.isOpen=t?t(h):!1;var v=function(a){q.isOpen&&a.target!==i[0]&&q.$apply(function(){l(!1)})},w=function(){q.$apply(function(){l(!0)})},x=angular.element("<div datepicker-popup-wrap><div datepicker></div></div>");x.attr({"ng-model":"date","ng-change":"dateSelection()"});var y=angular.element(x.children()[0]),z={};j.datepickerOptions&&(z=h.$eval(j.datepickerOptions),y.attr(angular.extend({},z))),k.$parsers.unshift(m),q.dateSelection=function(a){angular.isDefined(a)&&(q.date=a),k.$setViewValue(q.date),k.$render(),r&&l(!1)},i.bind("input change keyup",function(){q.$apply(function(){q.date=k.$modelValue})}),k.$render=function(){var a=k.$viewValue?e(k.$viewValue,p):"";i.val(a),q.date=k.$modelValue},n(j.min,"min"),n(j.max,"max"),j.showWeeks?n(j.showWeeks,"showWeeks","show-weeks"):(q.showWeeks="show-weeks"in z?z["show-weeks"]:g.showWeeks,y.attr("show-weeks","showWeeks")),j.dateDisabled&&y.attr("date-disabled",j.dateDisabled);var A=!1,B=!1;q.$watch("isOpen",function(a){a?(o(),c.bind("click",v),B&&i.unbind("focus",w),i[0].focus(),A=!0):(A&&c.unbind("click",v),i.bind("focus",w),B=!0),u&&u(h,a)}),q.today=function(){q.dateSelection(new Date)},q.clear=function(){q.dateSelection(null)};var C=a(x)(q);s?c.find("body").append(C):i.after(C)}}}]).directive("datepickerPopupWrap",function(){return{restrict:"EA",replace:!0,transclude:!0,templateUrl:"template/datepicker/popup.html",link:function(a,b){b.bind("click",function(a){a.preventDefault(),a.stopPropagation()})}}}),angular.module("ui.bootstrap.dropdownToggle",[]).directive("dropdownToggle",["$document","$location",function(a){var b=null,c=angular.noop;return{restrict:"CA",link:function(d,e){d.$watch("$location.path",function(){c()}),e.parent().bind("click",function(){c()}),e.bind("click",function(d){var f=e===b;d.preventDefault(),d.stopPropagation(),b&&c(),f||e.hasClass("disabled")||e.prop("disabled")||(e.parent().addClass("open"),b=e,c=function(d){d&&(d.preventDefault(),d.stopPropagation()),a.unbind("click",c),e.parent().removeClass("open"),c=angular.noop,b=null},a.bind("click",c))})}}}]),angular.module("ui.bootstrap.modal",["ui.bootstrap.transition"]).factory("$$stackedMap",function(){return{createNew:function(){var a=[];return{add:function(b,c){a.push({key:b,value:c})},get:function(b){for(var c=0;c<a.length;c++)if(b==a[c].key)return a[c]},keys:function(){for(var b=[],c=0;c<a.length;c++)b.push(a[c].key);return b},top:function(){return a[a.length-1]},remove:function(b){for(var c=-1,d=0;d<a.length;d++)if(b==a[d].key){c=d;break}return a.splice(c,1)[0]},removeTop:function(){return a.splice(a.length-1,1)[0]},length:function(){return a.length}}}}}).directive("modalBackdrop",["$timeout",function(a){return{restrict:"EA",replace:!0,templateUrl:"template/modal/backdrop.html",link:function(b){b.animate=!1,a(function(){b.animate=!0})}}}]).directive("modalWindow",["$modalStack","$timeout",function(a,b){return{restrict:"EA",scope:{index:"@",animate:"="},replace:!0,transclude:!0,templateUrl:"template/modal/window.html",link:function(c,d,e){c.windowClass=e.windowClass||"",b(function(){c.animate=!0,d[0].focus()}),c.close=function(b){var c=a.getTop();c&&c.value.backdrop&&"static"!=c.value.backdrop&&b.target===b.currentTarget&&(b.preventDefault(),b.stopPropagation(),a.dismiss(c.key,"backdrop click"))}}}}]).factory("$modalStack",["$transition","$timeout","$document","$compile","$rootScope","$$stackedMap",function(a,b,c,d,e,f){function g(){for(var a=-1,b=n.keys(),c=0;c<b.length;c++)n.get(b[c]).value.backdrop&&(a=c);return a}function h(a){var b=c.find("body").eq(0),d=n.get(a).value;n.remove(a),j(d.modalDomEl,d.modalScope,300,i),b.toggleClass(m,n.length()>0)}function i(){if(k&&-1==g()){var a=l;j(k,l,150,function(){a.$destroy(),a=null}),k=void 0,l=void 0}}function j(c,d,e,f){function g(){g.done||(g.done=!0,c.remove(),f&&f())}d.animate=!1;var h=a.transitionEndEventName;if(h){var i=b(g,e);c.bind(h,function(){b.cancel(i),g(),d.$apply()})}else b(g,0)}var k,l,m="modal-open",n=f.createNew(),o={};return e.$watch(g,function(a){l&&(l.index=a)}),c.bind("keydown",function(a){var b;27===a.which&&(b=n.top(),b&&b.value.keyboard&&e.$apply(function(){o.dismiss(b.key)}))}),o.open=function(a,b){n.add(a,{deferred:b.deferred,modalScope:b.scope,backdrop:b.backdrop,keyboard:b.keyboard});var f=c.find("body").eq(0),h=g();h>=0&&!k&&(l=e.$new(!0),l.index=h,k=d("<div modal-backdrop></div>")(l),f.append(k));var i=angular.element("<div modal-window></div>");i.attr("window-class",b.windowClass),i.attr("index",n.length()-1),i.attr("animate","animate"),i.html(b.content);var j=d(i)(b.scope);n.top().value.modalDomEl=j,f.append(j),f.addClass(m)},o.close=function(a,b){var c=n.get(a).value;c&&(c.deferred.resolve(b),h(a))},o.dismiss=function(a,b){var c=n.get(a).value;c&&(c.deferred.reject(b),h(a))},o.dismissAll=function(a){for(var b=this.getTop();b;)this.dismiss(b.key,a),b=this.getTop()},o.getTop=function(){return n.top()},o}]).provider("$modal",function(){var a={options:{backdrop:!0,keyboard:!0},$get:["$injector","$rootScope","$q","$http","$templateCache","$controller","$modalStack",function(b,c,d,e,f,g,h){function i(a){return a.template?d.when(a.template):e.get(a.templateUrl,{cache:f}).then(function(a){return a.data})}function j(a){var c=[];return angular.forEach(a,function(a){(angular.isFunction(a)||angular.isArray(a))&&c.push(d.when(b.invoke(a)))}),c}var k={};return k.open=function(b){var e=d.defer(),f=d.defer(),k={result:e.promise,opened:f.promise,close:function(a){h.close(k,a)},dismiss:function(a){h.dismiss(k,a)}};if(b=angular.extend({},a.options,b),b.resolve=b.resolve||{},!b.template&&!b.templateUrl)throw new Error("One of template or templateUrl options is required.");var l=d.all([i(b)].concat(j(b.resolve)));return l.then(function(a){var d=(b.scope||c).$new();d.$close=k.close,d.$dismiss=k.dismiss;var f,i={},j=1;b.controller&&(i.$scope=d,i.$modalInstance=k,angular.forEach(b.resolve,function(b,c){i[c]=a[j++]}),f=g(b.controller,i)),h.open(k,{scope:d,deferred:e,content:a[0],backdrop:b.backdrop,keyboard:b.keyboard,windowClass:b.windowClass})},function(a){e.reject(a)}),l.then(function(){f.resolve(!0)},function(){f.reject(!1)}),k},k}]};return a}),angular.module("ui.bootstrap.pagination",[]).controller("PaginationController",["$scope","$attrs","$parse","$interpolate",function(a,b,c,d){var e=this,f=b.numPages?c(b.numPages).assign:angular.noop;this.init=function(d){b.itemsPerPage?a.$parent.$watch(c(b.itemsPerPage),function(b){e.itemsPerPage=parseInt(b,10),a.totalPages=e.calculateTotalPages()}):this.itemsPerPage=d},this.noPrevious=function(){return 1===this.page},this.noNext=function(){return this.page===a.totalPages},this.isActive=function(a){return this.page===a},this.calculateTotalPages=function(){var b=this.itemsPerPage<1?1:Math.ceil(a.totalItems/this.itemsPerPage);return Math.max(b||0,1)},this.getAttributeValue=function(b,c,e){return angular.isDefined(b)?e?d(b)(a.$parent):a.$parent.$eval(b):c},this.render=function(){this.page=parseInt(a.page,10)||1,this.page>0&&this.page<=a.totalPages&&(a.pages=this.getPages(this.page,a.totalPages))},a.selectPage=function(b){!e.isActive(b)&&b>0&&b<=a.totalPages&&(a.page=b,a.onSelectPage({page:b}))},a.$watch("page",function(){e.render()}),a.$watch("totalItems",function(){a.totalPages=e.calculateTotalPages()}),a.$watch("totalPages",function(b){f(a.$parent,b),e.page>b?a.selectPage(b):e.render()})}]).constant("paginationConfig",{itemsPerPage:10,boundaryLinks:!1,directionLinks:!0,firstText:"First",previousText:"Previous",nextText:"Next",lastText:"Last",rotate:!0}).directive("pagination",["$parse","paginationConfig",function(a,b){return{restrict:"EA",scope:{page:"=",totalItems:"=",onSelectPage:" &"},controller:"PaginationController",templateUrl:"template/pagination/pagination.html",replace:!0,link:function(c,d,e,f){function g(a,b,c,d){return{number:a,text:b,active:c,disabled:d}}var h,i=f.getAttributeValue(e.boundaryLinks,b.boundaryLinks),j=f.getAttributeValue(e.directionLinks,b.directionLinks),k=f.getAttributeValue(e.firstText,b.firstText,!0),l=f.getAttributeValue(e.previousText,b.previousText,!0),m=f.getAttributeValue(e.nextText,b.nextText,!0),n=f.getAttributeValue(e.lastText,b.lastText,!0),o=f.getAttributeValue(e.rotate,b.rotate);f.init(b.itemsPerPage),e.maxSize&&c.$parent.$watch(a(e.maxSize),function(a){h=parseInt(a,10),f.render()}),f.getPages=function(a,b){var c=[],d=1,e=b,p=angular.isDefined(h)&&b>h;p&&(o?(d=Math.max(a-Math.floor(h/2),1),e=d+h-1,e>b&&(e=b,d=e-h+1)):(d=(Math.ceil(a/h)-1)*h+1,e=Math.min(d+h-1,b)));for(var q=d;e>=q;q++){var r=g(q,q,f.isActive(q),!1);c.push(r)}if(p&&!o){if(d>1){var s=g(d-1,"...",!1,!1);c.unshift(s)}if(b>e){var t=g(e+1,"...",!1,!1);c.push(t)}}if(j){var u=g(a-1,l,!1,f.noPrevious());c.unshift(u);var v=g(a+1,m,!1,f.noNext());c.push(v)}if(i){var w=g(1,k,!1,f.noPrevious());c.unshift(w);var x=g(b,n,!1,f.noNext());c.push(x)}return c}}}}]).constant("pagerConfig",{itemsPerPage:10,previousText:"« Previous",nextText:"Next »",align:!0}).directive("pager",["pagerConfig",function(a){return{restrict:"EA",scope:{page:"=",totalItems:"=",onSelectPage:" &"},controller:"PaginationController",templateUrl:"template/pagination/pager.html",replace:!0,link:function(b,c,d,e){function f(a,b,c,d,e){return{number:a,text:b,disabled:c,previous:i&&d,next:i&&e}}var g=e.getAttributeValue(d.previousText,a.previousText,!0),h=e.getAttributeValue(d.nextText,a.nextText,!0),i=e.getAttributeValue(d.align,a.align);e.init(a.itemsPerPage),e.getPages=function(a){return[f(a-1,g,e.noPrevious(),!0,!1),f(a+1,h,e.noNext(),!1,!0)]}}}}]),angular.module("ui.bootstrap.tooltip",["ui.bootstrap.position","ui.bootstrap.bindHtml"]).provider("$tooltip",function(){function a(a){var b=/[A-Z]/g,c="-";return a.replace(b,function(a,b){return(b?c:"")+a.toLowerCase()})}var b={placement:"top",animation:!0,popupDelay:0},c={mouseenter:"mouseleave",click:"click",focus:"blur"},d={};this.options=function(a){angular.extend(d,a)},this.setTriggers=function(a){angular.extend(c,a)},this.$get=["$window","$compile","$timeout","$parse","$document","$position","$interpolate",function(e,f,g,h,i,j,k){return function(e,l,m){function n(a){var b=a||o.trigger||m,d=c[b]||b;return{show:b,hide:d}}var o=angular.extend({},b,d),p=a(e),q=k.startSymbol(),r=k.endSymbol(),s="<div "+p+'-popup title="'+q+"tt_title"+r+'" content="'+q+"tt_content"+r+'" placement="'+q+"tt_placement"+r+'" animation="tt_animation" is-open="tt_isOpen"></div>';return{restrict:"EA",scope:!0,compile:function(){var a=f(s);return function(b,c,d){function f(){b.tt_isOpen?m():k()}function k(){(!z||b.$eval(d[l+"Enable"]))&&(b.tt_popupDelay?(v=g(p,b.tt_popupDelay,!1),v.then(function(a){a()})):p()())}function m(){b.$apply(function(){q()})}function p(){return b.tt_content?(r(),u&&g.cancel(u),t.css({top:0,left:0,display:"block"}),w?i.find("body").append(t):c.after(t),A(),b.tt_isOpen=!0,b.$digest(),A):angular.noop}function q(){b.tt_isOpen=!1,g.cancel(v),b.tt_animation?u=g(s,500):s()}function r(){t&&s(),t=a(b,function(){}),b.$digest()}function s(){t&&(t.remove(),t=null)}var t,u,v,w=angular.isDefined(o.appendToBody)?o.appendToBody:!1,x=n(void 0),y=!1,z=angular.isDefined(d[l+"Enable"]),A=function(){var a,d,e,f;switch(a=w?j.offset(c):j.position(c),d=t.prop("offsetWidth"),e=t.prop("offsetHeight"),b.tt_placement){case"right":f={top:a.top+a.height/2-e/2,left:a.left+a.width};break;case"bottom":f={top:a.top+a.height,left:a.left+a.width/2-d/2};break;case"left":f={top:a.top+a.height/2-e/2,left:a.left-d};break;default:f={top:a.top-e,left:a.left+a.width/2-d/2}}f.top+="px",f.left+="px",t.css(f)};b.tt_isOpen=!1,d.$observe(e,function(a){b.tt_content=a,!a&&b.tt_isOpen&&q()}),d.$observe(l+"Title",function(a){b.tt_title=a}),d.$observe(l+"Placement",function(a){b.tt_placement=angular.isDefined(a)?a:o.placement}),d.$observe(l+"PopupDelay",function(a){var c=parseInt(a,10);b.tt_popupDelay=isNaN(c)?o.popupDelay:c});var B=function(){y&&(c.unbind(x.show,k),c.unbind(x.hide,m))};d.$observe(l+"Trigger",function(a){B(),x=n(a),x.show===x.hide?c.bind(x.show,f):(c.bind(x.show,k),c.bind(x.hide,m)),y=!0});var C=b.$eval(d[l+"Animation"]);b.tt_animation=angular.isDefined(C)?!!C:o.animation,d.$observe(l+"AppendToBody",function(a){w=angular.isDefined(a)?h(a)(b):w}),w&&b.$on("$locationChangeSuccess",function(){b.tt_isOpen&&q()}),b.$on("$destroy",function(){g.cancel(u),g.cancel(v),B(),s()})}}}}}]}).directive("tooltipPopup",function(){return{restrict:"EA",replace:!0,scope:{content:"@",placement:"@",animation:"&",isOpen:"&"},templateUrl:"template/tooltip/tooltip-popup.html"}}).directive("tooltip",["$tooltip",function(a){return a("tooltip","tooltip","mouseenter")}]).directive("tooltipHtmlUnsafePopup",function(){return{restrict:"EA",replace:!0,scope:{content:"@",placement:"@",animation:"&",isOpen:"&"},templateUrl:"template/tooltip/tooltip-html-unsafe-popup.html"}}).directive("tooltipHtmlUnsafe",["$tooltip",function(a){return a("tooltipHtmlUnsafe","tooltip","mouseenter")}]),angular.module("ui.bootstrap.popover",["ui.bootstrap.tooltip"]).directive("popoverPopup",function(){return{restrict:"EA",replace:!0,scope:{title:"@",content:"@",placement:"@",animation:"&",isOpen:"&"},templateUrl:"template/popover/popover.html"}}).directive("popover",["$tooltip",function(a){return a("popover","popover","click")}]),angular.module("ui.bootstrap.progressbar",["ui.bootstrap.transition"]).constant("progressConfig",{animate:!0,max:100}).controller("ProgressController",["$scope","$attrs","progressConfig","$transition",function(a,b,c,d){var e=this,f=[],g=angular.isDefined(b.max)?a.$parent.$eval(b.max):c.max,h=angular.isDefined(b.animate)?a.$parent.$eval(b.animate):c.animate;this.addBar=function(a,b){var c=0,d=a.$parent.$index;angular.isDefined(d)&&f[d]&&(c=f[d].value),f.push(a),this.update(b,a.value,c),a.$watch("value",function(a,c){a!==c&&e.update(b,a,c)}),a.$on("$destroy",function(){e.removeBar(a)})},this.update=function(a,b,c){var e=this.getPercentage(b);h?(a.css("width",this.getPercentage(c)+"%"),d(a,{width:e+"%"})):a.css({transition:"none",width:e+"%"})},this.removeBar=function(a){f.splice(f.indexOf(a),1)},this.getPercentage=function(a){return Math.round(100*a/g)}}]).directive("progress",function(){return{restrict:"EA",replace:!0,transclude:!0,controller:"ProgressController",require:"progress",scope:{},template:'<div class="progress" ng-transclude></div>'}}).directive("bar",function(){return{restrict:"EA",replace:!0,transclude:!0,require:"^progress",scope:{value:"=",type:"@"},templateUrl:"template/progressbar/bar.html",link:function(a,b,c,d){d.addBar(a,b)}}}).directive("progressbar",function(){return{restrict:"EA",replace:!0,transclude:!0,controller:"ProgressController",scope:{value:"=",type:"@"},templateUrl:"template/progressbar/progressbar.html",link:function(a,b,c,d){d.addBar(a,angular.element(b.children()[0]))}}}),angular.module("ui.bootstrap.rating",[]).constant("ratingConfig",{max:5,stateOn:null,stateOff:null}).controller("RatingController",["$scope","$attrs","$parse","ratingConfig",function(a,b,c,d){this.maxRange=angular.isDefined(b.max)?a.$parent.$eval(b.max):d.max,this.stateOn=angular.isDefined(b.stateOn)?a.$parent.$eval(b.stateOn):d.stateOn,this.stateOff=angular.isDefined(b.stateOff)?a.$parent.$eval(b.stateOff):d.stateOff,this.createRateObjects=function(a){for(var b={stateOn:this.stateOn,stateOff:this.stateOff},c=0,d=a.length;d>c;c++)a[c]=angular.extend({index:c},b,a[c]);return a},a.range=angular.isDefined(b.ratingStates)?this.createRateObjects(angular.copy(a.$parent.$eval(b.ratingStates))):this.createRateObjects(new Array(this.maxRange)),a.rate=function(b){a.value===b||a.readonly||(a.value=b)
},a.enter=function(b){a.readonly||(a.val=b),a.onHover({value:b})},a.reset=function(){a.val=angular.copy(a.value),a.onLeave()},a.$watch("value",function(b){a.val=b}),a.readonly=!1,b.readonly&&a.$parent.$watch(c(b.readonly),function(b){a.readonly=!!b})}]).directive("rating",function(){return{restrict:"EA",scope:{value:"=",onHover:"&",onLeave:"&"},controller:"RatingController",templateUrl:"template/rating/rating.html",replace:!0}}),angular.module("ui.bootstrap.tabs",[]).controller("TabsetController",["$scope",function(a){var b=this,c=b.tabs=a.tabs=[];b.select=function(a){angular.forEach(c,function(a){a.active=!1}),a.active=!0},b.addTab=function(a){c.push(a),(1===c.length||a.active)&&b.select(a)},b.removeTab=function(a){var d=c.indexOf(a);if(a.active&&c.length>1){var e=d==c.length-1?d-1:d+1;b.select(c[e])}c.splice(d,1)}}]).directive("tabset",function(){return{restrict:"EA",transclude:!0,replace:!0,scope:{},controller:"TabsetController",templateUrl:"template/tabs/tabset.html",link:function(a,b,c){a.vertical=angular.isDefined(c.vertical)?a.$parent.$eval(c.vertical):!1,a.justified=angular.isDefined(c.justified)?a.$parent.$eval(c.justified):!1,a.type=angular.isDefined(c.type)?a.$parent.$eval(c.type):"tabs"}}}).directive("tab",["$parse",function(a){return{require:"^tabset",restrict:"EA",replace:!0,templateUrl:"template/tabs/tab.html",transclude:!0,scope:{heading:"@",onSelect:"&select",onDeselect:"&deselect"},controller:function(){},compile:function(b,c,d){return function(b,c,e,f){var g,h;e.active?(g=a(e.active),h=g.assign,b.$parent.$watch(g,function(a,c){a!==c&&(b.active=!!a)}),b.active=g(b.$parent)):h=g=angular.noop,b.$watch("active",function(a){h(b.$parent,a),a?(f.select(b),b.onSelect()):b.onDeselect()}),b.disabled=!1,e.disabled&&b.$parent.$watch(a(e.disabled),function(a){b.disabled=!!a}),b.select=function(){b.disabled||(b.active=!0)},f.addTab(b),b.$on("$destroy",function(){f.removeTab(b)}),b.$transcludeFn=d}}}}]).directive("tabHeadingTransclude",[function(){return{restrict:"A",require:"^tab",link:function(a,b){a.$watch("headingElement",function(a){a&&(b.html(""),b.append(a))})}}}]).directive("tabContentTransclude",function(){function a(a){return a.tagName&&(a.hasAttribute("tab-heading")||a.hasAttribute("data-tab-heading")||"tab-heading"===a.tagName.toLowerCase()||"data-tab-heading"===a.tagName.toLowerCase())}return{restrict:"A",require:"^tabset",link:function(b,c,d){var e=b.$eval(d.tabContentTransclude);e.$transcludeFn(e.$parent,function(b){angular.forEach(b,function(b){a(b)?e.headingElement=b:c.append(b)})})}}}),angular.module("ui.bootstrap.timepicker",[]).constant("timepickerConfig",{hourStep:1,minuteStep:1,showMeridian:!0,meridians:null,readonlyInput:!1,mousewheel:!0}).directive("timepicker",["$parse","$log","timepickerConfig","$locale",function(a,b,c,d){return{restrict:"EA",require:"?^ngModel",replace:!0,scope:{},templateUrl:"template/timepicker/timepicker.html",link:function(e,f,g,h){function i(){var a=parseInt(e.hours,10),b=e.showMeridian?a>0&&13>a:a>=0&&24>a;return b?(e.showMeridian&&(12===a&&(a=0),e.meridian===q[1]&&(a+=12)),a):void 0}function j(){var a=parseInt(e.minutes,10);return a>=0&&60>a?a:void 0}function k(a){return angular.isDefined(a)&&a.toString().length<2?"0"+a:a}function l(a){m(),h.$setViewValue(new Date(p)),n(a)}function m(){h.$setValidity("time",!0),e.invalidHours=!1,e.invalidMinutes=!1}function n(a){var b=p.getHours(),c=p.getMinutes();e.showMeridian&&(b=0===b||12===b?12:b%12),e.hours="h"===a?b:k(b),e.minutes="m"===a?c:k(c),e.meridian=p.getHours()<12?q[0]:q[1]}function o(a){var b=new Date(p.getTime()+6e4*a);p.setHours(b.getHours(),b.getMinutes()),l()}if(h){var p=new Date,q=angular.isDefined(g.meridians)?e.$parent.$eval(g.meridians):c.meridians||d.DATETIME_FORMATS.AMPMS,r=c.hourStep;g.hourStep&&e.$parent.$watch(a(g.hourStep),function(a){r=parseInt(a,10)});var s=c.minuteStep;g.minuteStep&&e.$parent.$watch(a(g.minuteStep),function(a){s=parseInt(a,10)}),e.showMeridian=c.showMeridian,g.showMeridian&&e.$parent.$watch(a(g.showMeridian),function(a){if(e.showMeridian=!!a,h.$error.time){var b=i(),c=j();angular.isDefined(b)&&angular.isDefined(c)&&(p.setHours(b),l())}else n()});var t=f.find("input"),u=t.eq(0),v=t.eq(1),w=angular.isDefined(g.mousewheel)?e.$eval(g.mousewheel):c.mousewheel;if(w){var x=function(a){a.originalEvent&&(a=a.originalEvent);var b=a.wheelDelta?a.wheelDelta:-a.deltaY;return a.detail||b>0};u.bind("mousewheel wheel",function(a){e.$apply(x(a)?e.incrementHours():e.decrementHours()),a.preventDefault()}),v.bind("mousewheel wheel",function(a){e.$apply(x(a)?e.incrementMinutes():e.decrementMinutes()),a.preventDefault()})}if(e.readonlyInput=angular.isDefined(g.readonlyInput)?e.$eval(g.readonlyInput):c.readonlyInput,e.readonlyInput)e.updateHours=angular.noop,e.updateMinutes=angular.noop;else{var y=function(a,b){h.$setViewValue(null),h.$setValidity("time",!1),angular.isDefined(a)&&(e.invalidHours=a),angular.isDefined(b)&&(e.invalidMinutes=b)};e.updateHours=function(){var a=i();angular.isDefined(a)?(p.setHours(a),l("h")):y(!0)},u.bind("blur",function(){!e.validHours&&e.hours<10&&e.$apply(function(){e.hours=k(e.hours)})}),e.updateMinutes=function(){var a=j();angular.isDefined(a)?(p.setMinutes(a),l("m")):y(void 0,!0)},v.bind("blur",function(){!e.invalidMinutes&&e.minutes<10&&e.$apply(function(){e.minutes=k(e.minutes)})})}h.$render=function(){var a=h.$modelValue?new Date(h.$modelValue):null;isNaN(a)?(h.$setValidity("time",!1),b.error('Timepicker directive: "ng-model" value must be a Date object, a number of milliseconds since 01.01.1970 or a string representing an RFC2822 or ISO 8601 date.')):(a&&(p=a),m(),n())},e.incrementHours=function(){o(60*r)},e.decrementHours=function(){o(60*-r)},e.incrementMinutes=function(){o(s)},e.decrementMinutes=function(){o(-s)},e.toggleMeridian=function(){o(720*(p.getHours()<12?1:-1))}}}}}]),angular.module("ui.bootstrap.typeahead",["ui.bootstrap.position","ui.bootstrap.bindHtml"]).factory("typeaheadParser",["$parse",function(a){var b=/^\s*(.*?)(?:\s+as\s+(.*?))?\s+for\s+(?:([\$\w][\$\w\d]*))\s+in\s+(.*)$/;return{parse:function(c){var d=c.match(b);if(!d)throw new Error("Expected typeahead specification in form of '_modelValue_ (as _label_)? for _item_ in _collection_' but got '"+c+"'.");return{itemName:d[3],source:a(d[4]),viewMapper:a(d[2]||d[1]),modelMapper:a(d[1])}}}}]).directive("typeahead",["$compile","$parse","$q","$timeout","$document","$position","typeaheadParser",function(a,b,c,d,e,f,g){var h=[9,13,27,38,40];return{require:"ngModel",link:function(i,j,k,l){var m,n=i.$eval(k.typeaheadMinLength)||1,o=i.$eval(k.typeaheadWaitMs)||0,p=i.$eval(k.typeaheadEditable)!==!1,q=b(k.typeaheadLoading).assign||angular.noop,r=b(k.typeaheadOnSelect),s=k.typeaheadInputFormatter?b(k.typeaheadInputFormatter):void 0,t=k.typeaheadAppendToBody?b(k.typeaheadAppendToBody):!1,u=b(k.ngModel).assign,v=g.parse(k.typeahead),w=angular.element("<div typeahead-popup></div>");w.attr({matches:"matches",active:"activeIdx",select:"select(activeIdx)",query:"query",position:"position"}),angular.isDefined(k.typeaheadTemplateUrl)&&w.attr("template-url",k.typeaheadTemplateUrl);var x=i.$new();i.$on("$destroy",function(){x.$destroy()});var y=function(){x.matches=[],x.activeIdx=-1},z=function(a){var b={$viewValue:a};q(i,!0),c.when(v.source(i,b)).then(function(c){if(a===l.$viewValue&&m){if(c.length>0){x.activeIdx=0,x.matches.length=0;for(var d=0;d<c.length;d++)b[v.itemName]=c[d],x.matches.push({label:v.viewMapper(x,b),model:c[d]});x.query=a,x.position=t?f.offset(j):f.position(j),x.position.top=x.position.top+j.prop("offsetHeight")}else y();q(i,!1)}},function(){y(),q(i,!1)})};y(),x.query=void 0;var A;l.$parsers.unshift(function(a){return m=!0,a&&a.length>=n?o>0?(A&&d.cancel(A),A=d(function(){z(a)},o)):z(a):(q(i,!1),y()),p?a:a?(l.$setValidity("editable",!1),void 0):(l.$setValidity("editable",!0),a)}),l.$formatters.push(function(a){var b,c,d={};return s?(d.$model=a,s(i,d)):(d[v.itemName]=a,b=v.viewMapper(i,d),d[v.itemName]=void 0,c=v.viewMapper(i,d),b!==c?b:a)}),x.select=function(a){var b,c,d={};d[v.itemName]=c=x.matches[a].model,b=v.modelMapper(i,d),u(i,b),l.$setValidity("editable",!0),r(i,{$item:c,$model:b,$label:v.viewMapper(i,d)}),y(),j[0].focus()},j.bind("keydown",function(a){0!==x.matches.length&&-1!==h.indexOf(a.which)&&(a.preventDefault(),40===a.which?(x.activeIdx=(x.activeIdx+1)%x.matches.length,x.$digest()):38===a.which?(x.activeIdx=(x.activeIdx?x.activeIdx:x.matches.length)-1,x.$digest()):13===a.which||9===a.which?x.$apply(function(){x.select(x.activeIdx)}):27===a.which&&(a.stopPropagation(),y(),x.$digest()))}),j.bind("blur",function(){m=!1});var B=function(a){j[0]!==a.target&&(y(),x.$digest())};e.bind("click",B),i.$on("$destroy",function(){e.unbind("click",B)});var C=a(w)(x);t?e.find("body").append(C):j.after(C)}}}]).directive("typeaheadPopup",function(){return{restrict:"EA",scope:{matches:"=",query:"=",active:"=",position:"=",select:"&"},replace:!0,templateUrl:"template/typeahead/typeahead-popup.html",link:function(a,b,c){a.templateUrl=c.templateUrl,a.isOpen=function(){return a.matches.length>0},a.isActive=function(b){return a.active==b},a.selectActive=function(b){a.active=b},a.selectMatch=function(b){a.select({activeIdx:b})}}}}).directive("typeaheadMatch",["$http","$templateCache","$compile","$parse",function(a,b,c,d){return{restrict:"EA",scope:{index:"=",match:"=",query:"="},link:function(e,f,g){var h=d(g.templateUrl)(e.$parent)||"template/typeahead/typeahead-match.html";a.get(h,{cache:b}).success(function(a){f.replaceWith(c(a.trim())(e))})}}}]).filter("typeaheadHighlight",function(){function a(a){return a.replace(/([.?*+^$[\]\\(){}|-])/g,"\\$1")}return function(b,c){return c?b.replace(new RegExp(a(c),"gi"),"<strong>$&</strong>"):b}}),angular.module("template/accordion/accordion-group.html",[]).run(["$templateCache",function(a){a.put("template/accordion/accordion-group.html",'<div class="panel panel-default">\n  <div class="panel-heading">\n    <h4 class="panel-title">\n      <a class="accordion-toggle" ng-click="isOpen = !isOpen" accordion-transclude="heading">{{heading}}</a>\n    </h4>\n  </div>\n  <div class="panel-collapse" collapse="!isOpen">\n	  <div class="panel-body" ng-transclude></div>\n  </div>\n</div>')}]),angular.module("template/accordion/accordion.html",[]).run(["$templateCache",function(a){a.put("template/accordion/accordion.html",'<div class="panel-group" ng-transclude></div>')}]),angular.module("template/alert/alert.html",[]).run(["$templateCache",function(a){a.put("template/alert/alert.html","<div class='alert' ng-class='\"alert-\" + (type || \"warning\")'>\n    <button ng-show='closeable' type='button' class='close' ng-click='close()'>&times;</button>\n    <div ng-transclude></div>\n</div>\n")}]),angular.module("template/carousel/carousel.html",[]).run(["$templateCache",function(a){a.put("template/carousel/carousel.html",'<div ng-mouseenter="pause()" ng-mouseleave="play()" class="carousel">\n    <ol class="carousel-indicators" ng-show="slides().length > 1">\n        <li ng-repeat="slide in slides()" ng-class="{active: isActive(slide)}" ng-click="select(slide)"></li>\n    </ol>\n    <div class="carousel-inner" ng-transclude></div>\n    <a class="left carousel-control" ng-click="prev()" ng-show="slides().length > 1"><span class="icon-prev"></span></a>\n    <a class="right carousel-control" ng-click="next()" ng-show="slides().length > 1"><span class="icon-next"></span></a>\n</div>\n')}]),angular.module("template/carousel/slide.html",[]).run(["$templateCache",function(a){a.put("template/carousel/slide.html","<div ng-class=\"{\n    'active': leaving || (active && !entering),\n    'prev': (next || active) && direction=='prev',\n    'next': (next || active) && direction=='next',\n    'right': direction=='prev',\n    'left': direction=='next'\n  }\" class=\"item text-center\" ng-transclude></div>\n")}]),angular.module("template/datepicker/datepicker.html",[]).run(["$templateCache",function(a){a.put("template/datepicker/datepicker.html",'<table>\n  <thead>\n    <tr>\n      <th><button type="button" class="btn btn-default btn-sm pull-left" ng-click="move(-1)"><i class="glyphicon glyphicon-chevron-left"></i></button></th>\n      <th colspan="{{rows[0].length - 2 + showWeekNumbers}}"><button type="button" class="btn btn-default btn-sm btn-block" ng-click="toggleMode()"><strong>{{title}}</strong></button></th>\n      <th><button type="button" class="btn btn-default btn-sm pull-right" ng-click="move(1)"><i class="glyphicon glyphicon-chevron-right"></i></button></th>\n    </tr>\n    <tr ng-show="labels.length > 0" class="h6">\n      <th ng-show="showWeekNumbers" class="text-center">#</th>\n      <th ng-repeat="label in labels" class="text-center">{{label}}</th>\n    </tr>\n  </thead>\n  <tbody>\n    <tr ng-repeat="row in rows">\n      <td ng-show="showWeekNumbers" class="text-center"><em>{{ getWeekNumber(row) }}</em></td>\n      <td ng-repeat="dt in row" class="text-center">\n        <button type="button" style="width:100%;" class="btn btn-default btn-sm" ng-class="{\'btn-info\': dt.selected}" ng-click="select(dt.date)" ng-disabled="dt.disabled"><span ng-class="{\'text-muted\': dt.secondary}">{{dt.label}}</span></button>\n      </td>\n    </tr>\n  </tbody>\n</table>\n')}]),angular.module("template/datepicker/popup.html",[]).run(["$templateCache",function(a){a.put("template/datepicker/popup.html","<ul class=\"dropdown-menu\" ng-style=\"{display: (isOpen && 'block') || 'none', top: position.top+'px', left: position.left+'px'}\">\n	<li ng-transclude></li>\n"+'	<li ng-show="showButtonBar" style="padding:10px 9px 2px">\n		<span class="btn-group">\n			<button type="button" class="btn btn-sm btn-info" ng-click="today()">{{currentText}}</button>\n			<button type="button" class="btn btn-sm btn-default" ng-click="showWeeks = ! showWeeks" ng-class="{active: showWeeks}">{{toggleWeeksText}}</button>\n			<button type="button" class="btn btn-sm btn-danger" ng-click="clear()">{{clearText}}</button>\n		</span>\n		<button type="button" class="btn btn-sm btn-success pull-right" ng-click="isOpen = false">{{closeText}}</button>\n	</li>\n</ul>\n')}]),angular.module("template/modal/backdrop.html",[]).run(["$templateCache",function(a){a.put("template/modal/backdrop.html",'<div class="modal-backdrop fade" ng-class="{in: animate}" ng-style="{\'z-index\': 1040 + index*10}"></div>')}]),angular.module("template/modal/window.html",[]).run(["$templateCache",function(a){a.put("template/modal/window.html",'<div tabindex="-1" class="modal fade {{ windowClass }}" ng-class="{in: animate}" ng-style="{\'z-index\': 1050 + index*10, display: \'block\'}" ng-click="close($event)">\n    <div class="modal-dialog"><div class="modal-content" ng-transclude></div></div>\n</div>')}]),angular.module("template/pagination/pager.html",[]).run(["$templateCache",function(a){a.put("template/pagination/pager.html",'<ul class="pager">\n  <li ng-repeat="page in pages" ng-class="{disabled: page.disabled, previous: page.previous, next: page.next}"><a ng-click="selectPage(page.number)">{{page.text}}</a></li>\n</ul>')}]),angular.module("template/pagination/pagination.html",[]).run(["$templateCache",function(a){a.put("template/pagination/pagination.html",'<ul class="pagination">\n  <li ng-repeat="page in pages" ng-class="{active: page.active, disabled: page.disabled}"><a ng-click="selectPage(page.number)">{{page.text}}</a></li>\n</ul>')}]),angular.module("template/tooltip/tooltip-html-unsafe-popup.html",[]).run(["$templateCache",function(a){a.put("template/tooltip/tooltip-html-unsafe-popup.html",'<div class="tooltip {{placement}}" ng-class="{ in: isOpen(), fade: animation() }">\n  <div class="tooltip-arrow"></div>\n  <div class="tooltip-inner" bind-html-unsafe="content"></div>\n</div>\n')}]),angular.module("template/tooltip/tooltip-popup.html",[]).run(["$templateCache",function(a){a.put("template/tooltip/tooltip-popup.html",'<div class="tooltip {{placement}}" ng-class="{ in: isOpen(), fade: animation() }">\n  <div class="tooltip-arrow"></div>\n  <div class="tooltip-inner" ng-bind="content"></div>\n</div>\n')}]),angular.module("template/popover/popover.html",[]).run(["$templateCache",function(a){a.put("template/popover/popover.html",'<div class="popover {{placement}}" ng-class="{ in: isOpen(), fade: animation() }">\n  <div class="arrow"></div>\n\n  <div class="popover-inner">\n      <h3 class="popover-title" ng-bind="title" ng-show="title"></h3>\n      <div class="popover-content" ng-bind="content"></div>\n  </div>\n</div>\n')}]),angular.module("template/progressbar/bar.html",[]).run(["$templateCache",function(a){a.put("template/progressbar/bar.html",'<div class="progress-bar" ng-class="type && \'progress-bar-\' + type" ng-transclude></div>')}]),angular.module("template/progressbar/progress.html",[]).run(["$templateCache",function(a){a.put("template/progressbar/progress.html",'<div class="progress" ng-transclude></div>')}]),angular.module("template/progressbar/progressbar.html",[]).run(["$templateCache",function(a){a.put("template/progressbar/progressbar.html",'<div class="progress"><div class="progress-bar" ng-class="type && \'progress-bar-\' + type" ng-transclude></div></div>')}]),angular.module("template/rating/rating.html",[]).run(["$templateCache",function(a){a.put("template/rating/rating.html",'<span ng-mouseleave="reset()">\n    <i ng-repeat="r in range" ng-mouseenter="enter($index + 1)" ng-click="rate($index + 1)" class="glyphicon" ng-class="$index < val && (r.stateOn || \'glyphicon-star\') || (r.stateOff || \'glyphicon-star-empty\')"></i>\n</span>')}]),angular.module("template/tabs/tab.html",[]).run(["$templateCache",function(a){a.put("template/tabs/tab.html",'<li ng-class="{active: active, disabled: disabled}">\n  <a ng-click="select()" tab-heading-transclude>{{heading}}</a>\n</li>\n')}]),angular.module("template/tabs/tabset-titles.html",[]).run(["$templateCache",function(a){a.put("template/tabs/tabset-titles.html","<ul class=\"nav {{type && 'nav-' + type}}\" ng-class=\"{'nav-stacked': vertical}\">\n</ul>\n")}]),angular.module("template/tabs/tabset.html",[]).run(["$templateCache",function(a){a.put("template/tabs/tabset.html",'\n<div class="tabbable">\n  <ul class="nav {{type && \'nav-\' + type}}" ng-class="{\'nav-stacked\': vertical, \'nav-justified\': justified}" ng-transclude></ul>\n  <div class="tab-content">\n    <div class="tab-pane" \n         ng-repeat="tab in tabs" \n         ng-class="{active: tab.active}"\n         tab-content-transclude="tab">\n    </div>\n  </div>\n</div>\n')}]),angular.module("template/timepicker/timepicker.html",[]).run(["$templateCache",function(a){a.put("template/timepicker/timepicker.html",'<table>\n	<tbody>\n		<tr class="text-center">\n			<td><a ng-click="incrementHours()" class="btn btn-link"><span class="glyphicon glyphicon-chevron-up"></span></a></td>\n			<td>&nbsp;</td>\n			<td><a ng-click="incrementMinutes()" class="btn btn-link"><span class="glyphicon glyphicon-chevron-up"></span></a></td>\n			<td ng-show="showMeridian"></td>\n		</tr>\n		<tr>\n			<td style="width:50px;" class="form-group" ng-class="{\'has-error\': invalidHours}">\n				<input type="text" ng-model="hours" ng-change="updateHours()" class="form-control text-center" ng-mousewheel="incrementHours()" ng-readonly="readonlyInput" maxlength="2">\n			</td>\n			<td>:</td>\n			<td style="width:50px;" class="form-group" ng-class="{\'has-error\': invalidMinutes}">\n				<input type="text" ng-model="minutes" ng-change="updateMinutes()" class="form-control text-center" ng-readonly="readonlyInput" maxlength="2">\n			</td>\n			<td ng-show="showMeridian"><button type="button" class="btn btn-default text-center" ng-click="toggleMeridian()">{{meridian}}</button></td>\n		</tr>\n		<tr class="text-center">\n			<td><a ng-click="decrementHours()" class="btn btn-link"><span class="glyphicon glyphicon-chevron-down"></span></a></td>\n			<td>&nbsp;</td>\n			<td><a ng-click="decrementMinutes()" class="btn btn-link"><span class="glyphicon glyphicon-chevron-down"></span></a></td>\n			<td ng-show="showMeridian"></td>\n		</tr>\n	</tbody>\n</table>\n')}]),angular.module("template/typeahead/typeahead-match.html",[]).run(["$templateCache",function(a){a.put("template/typeahead/typeahead-match.html",'<a tabindex="-1" bind-html-unsafe="match.label | typeaheadHighlight:query"></a>')}]),angular.module("template/typeahead/typeahead-popup.html",[]).run(["$templateCache",function(a){a.put("template/typeahead/typeahead-popup.html","<ul class=\"dropdown-menu\" ng-style=\"{display: isOpen()&&'block' || 'none', top: position.top+'px', left: position.left+'px'}\">\n"+'    <li ng-repeat="match in matches" ng-class="{active: isActive($index) }" ng-mouseenter="selectActive($index)" ng-click="selectMatch($index)">\n        <div typeahead-match index="$index" match="match" query="query" template-url="templateUrl"></div>\n    </li>\n</ul>')}]);;Reed.controller('Add', function ($scope, $timeout, Api, State, Overlay) {

	$scope.state = State.status;
	$scope.form = {};

	$scope.submit = function(isValid) {

		var overlay = Overlay.init('Loading');

		if (isValid) {

			Api.UserFeeds.post({}, $scope.form, function(data) {
				Overlay.update(data.status, data.message);
			}, function(data) {
				Overlay.update(data.status, 'Bad url');
			});

		} else {
			Overlay.update('fail', 'Error');
		}

	};

	$scope.add = function(feed, feeds, index) {

		feed.proccessing = {
			under: true
		};

		Api.UserFeeds.post({
			'rssUrl': feed.url
		}, function() {

			feed.proccessing = {
				done: true
			};

			$timeout(function () {
				feeds.splice(index, 1);
			}, 1000);

		});

	};

});
;Reed.controller('Articles', function ($scope, Api, State) {

	$scope.view = function (el) {
		$scope.show = {
			section: 'single',
			id: el.id,
			scrollPosition: $('#articles').scrollTop()
		};
	};

	$scope.tabs = {

		side: [
			{
				title: 'All',
				content: [
					{
						user: {
							name: 'Zbyszek',
							avatar: 'https://s3.amazonaws.com/uifaces/faces/twitter/alagoon/128.jpg'
						},
						type: 'stared',
						title: 'Taming The Unicorn: Easing JavaScript Memory Profiling In Chrome DevTools'
					},
					{
						user: {
							name: 'Artur',
							avatar: 'https://s3.amazonaws.com/uifaces/faces/twitter/alagoon/128.jpg'
						},
						type: 'shared',
						title: 'Taming The Unicorn'
					}
				]
			},
			{
				title: 'Stared',
				content: ''
			},
			{
				title: 'Shared',
				content: ''
			}
		],

	};

});
;Reed.controller('Discovery', function ($scope, Api, State) {

	$scope.view = function (el) {
		$scope.show = {
			section: 'single',
			id: el.id,
			scrollPosition: $('#articles').scrollTop()
		};
	};

	$scope.tabs = {

		side: [
			{
				title: 'All',
				content: [
					{
						user: {
							name: 'Zbyszek',
							avatar: 'https://s3.amazonaws.com/uifaces/faces/twitter/alagoon/128.jpg'
						},
						type: 'stared',
						title: 'Taming The Unicorn: Easing JavaScript Memory Profiling In Chrome DevTools'
					},
					{
						user: {
							name: 'Artur',
							avatar: 'https://s3.amazonaws.com/uifaces/faces/twitter/alagoon/128.jpg'
						},
						type: 'shared',
						title: 'Taming The Unicorn'
					}
				]
			},
			{
				title: 'Stared',
				content: ''
			},
			{
				title: 'Shared',
				content: ''
			}
		],

	};

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

				});

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
;Reed.controller('Menu', function ($scope, $cookieStore, Api, State) {

	$scope.State = State;

    $scope.$watch('State.status', function (newStatus, oldStatus, scope) {
    	scope.status = newStatus;
    });

});
;Reed.controller('Navbar', function ($scope, Api, State, Overlay) {

	$scope.saveForLater = function (el) {

		var overlay = Overlay.init('Loading');

		Api.UserArticle.update({
			articleid: el.id
		}, {
			later: 1
		}, function (data) {
			Overlay.update(data.status, data.message);
		});

	};

	$scope.markAsFav = function (el) {

		var overlay = Overlay.init('Loading');

		Api.UserArticle.update({
			articleid: el.id
		}, {
			favourite: 1
		}, function (data) {
			Overlay.update(data.status, data.message);
		});

	};

	$scope.share = function (el) {
		console.log(el);
	};

});
;Reed.controller('Ui', function ($scope, Api, State) {

	// $scope.user = Api.User.get();
	$scope.discoveryArticles = Api.discoveryArticles.get();
	$scope.discoveryFeeds = Api.discoveryFeeds.get();

	$scope.articles = Api.UserArticles.get();
	// $scope.feeds = Api.UserFeeds.get();


	// $scope.articles = Api.discoveryArticles.get(function(res) {

	// 	State.status.unread.articles = res.length
	// 	$scope.state = State.status;

	// });

});
;Reed.directive('backToList', function() {

	return {
		restrict: 'AE',
		replace: 'true',
		templateUrl: 'app/template/partials/back.html',
		link: function(scope, element, attrs) {
			element.bind('click', function() {
				scope.$apply(function() {
					scope.show.section = 'list';
				});
				$('#articles').scrollTop( scope.show.scrollPosition );
			});
		}
	};

});
;Reed.directive('masonry', function() {

	return {

		restrict: 'AC',

		controller: function($scope) {

			return $scope.$watch(function(e) {
				$scope.masonry.reloadItems();
				return $scope.masonry.layout();
			});

		},

		link: function(scope, elem, attrs) {

			var container = elem[0];
			var options = {
				columnWidth: '.articles__thumb',
				itemSelector: '.articles__thumb',
				transitionDuration: 0
			};

			return scope.masonry = new Masonry(container, options);

		}

	};

});
;Reed.factory('Api', function ($http, $resource, State) {

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

			User: $resource('api/users/:id', { id: State.user.id }, {
				get: {
					method: 'GET',
					isArray: false
				}
			}),

			UserFeeds: $resource('api/users/:id/feeds', { id: State.user.id }, {
				get: {
					method: 'GET',
					isArray: true
				},
				post: {
					method: 'POST',
					isArray: false
				}
			}),

			UserArticles: $resource('api/users/:id/articles', { id: State.user.id }, {
				get: {
					method: 'GET',
					isArray: true
				},
			}),

			UserArticle: $resource('api/users/:id/articles/:articleid', { id: State.user.id }, {
				update: {
					method: 'PUT',
					isArray: false
				}
			}),

		};

}).service('feedsProvider', function () {});
;Reed.service('AuthService', function ($cookieStore){

	this.getUserAuthenticated = function() {

		var token = $cookieStore.get('reed_authtoken');
		return ($cookieStore.get('reed_authtoken')) ? true : false;

	};

	return this;

});
;Reed.service('httpResponseInterceptorHandler', ['$q', '$location', '$cookieStore', function ($q, $location, $cookieStore) {
		return {

			/**
			 * On response error.
			 * When rejection status is unauthorized
			 * delete incorrect token and redirect user to login page
			 */
			responseError: function(rejection) {

				if (rejection.status === 401) {
					$cookieStore.remove('token');
					$location.path('/login');

					return $q.reject(rejection);
				}

				return $q.reject(rejection);

			}

		};
}]);
;Reed.factory('Overlay', function () {

	this.icons = {
		'success': 'check',
		'fail': 'times',
		'error': 'times',
		'400': 'times',
	};

	this.update = function (status, text) {

		this.overlay.update({
			text: text,
			icon: this.icons[status.toString().toLowerCase()]
		});

	};

	this.init = function (text) {

		this.overlay = iosOverlay({
			text: text,
			duration: 2000,
		});

	};

	return this;

});
;Reed.factory('State', function ($cookieStore) {

	var status = {
		unread: {},
	};

	var user = {
		id: $cookieStore.get('reed_userid'),
	};

	return {
		status: status,
		user: user
	};

});
