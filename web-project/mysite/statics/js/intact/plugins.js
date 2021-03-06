// Avoid `console` errors in browsers that lack a console.
(function() {
    var method;
    var noop = function () {};
    var methods = [
        'assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
        'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
        'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
        'timeStamp', 'trace', 'warn'
    ];
    var length = methods.length;
    var console = (window.console = window.console || {});

    while (length--) {
        method = methods[length];

        // Only stub undefined methods.
        if (!console[method]) {
            console[method] = noop;
        }
    }
}());

// Place any jQuery/helper plugins in here.
/*!
 * 右上角删除 v0.2.1
 * 
 * log:
 * 0.2 增加style自定义
 * 0.2.1 将url改为data-url
 */
( function($) {
		var LinkRemove = function(opts) {
			this.opts = opts;
		}
		, defaults = {
			tpl : "<a href='#' class='_linkremove j_btn_del remove hide' style='position:absolute;top:0;right:0;-webkit-transition: display .5s ease .5s;text-decoration: none;' onclick='$(this).parent().fadeOut()'>×</a>"
			, style : {
				'color' : 'white',
				'background-color' : '#CE3939',
				'padding' : '5px 10px',
				'font' : 'normal bold 18px arial'
			}
		}

		LinkRemove.prototype = {
			render : function(url) {
				var back = $(this.opts.tpl);
				url && back.attr('href', url);
				back.css( this.opts.style );
				return back;
			}
		}

		$.fn.closeremove = function(opts) {
			return this.each(function() {
				var self = $(this)
				, options = $.extend(true, {}, defaults, opts);
				self.css('position', 'relative');
				$link = new LinkRemove(options).render(self.attr('data-url'));
				self.append($link);
				self.hover(function() {
					$(this).children('._linkremove').css('display', 'block');
				}, function() {
					$(this).children('._linkremove').css('display', 'none');
				});
			});
		}
	}(jQuery));
/*!
 * 分页
 * 
 * page: current
 * size: per
 * count: total
 */
function pagin(page, size, count, pre) {
			
			Array.prototype.contains = function ( needle ) {
			   for (i in this) {
				   if (this[i] == needle) return true;
			   }
			   return false;
			}
			
			var maxnum = 5
				, pagin = $('#J_PAGIN')
				, pagePre = 'page.page'
				, sizePre = 'page.size'
				, prev = pagin.children('.prev')
				, next = pagin.children('.next')
				, href = location.href
				, prefix = '?';

			if (!pre) {
				if (href.indexOf('?') > -1 && href.indexOf(pagePre) == -1) {
					prefix = href + '&';
				} else if (href.indexOf(pagePre) > -1) {
					prefix = href.substring(0, href.indexOf(pagePre));
				} else {
					prefix = '?';
				}
			} else {
				prefix = pre;
			}

			var total = Math.ceil(count / size);

			if (page == 1) {
				prev.addClass('disabled');
			}
			if (page == total) {
				next.addClass('disabled');
			}

			pagin.children('span').children().remove();
			for ( i = 1; i <= total; i++) {
				var a = $('<a />').attr({
					'href' : prefix + pagePre + '=' + i + '&' + sizePre + '=' + size + ''
				}).html(i);
				pagin.children('span').append(a);
				if (i == page) {
					a.addClass('active');
					a.attr('href', '#');
				}
			}

			prev.attr({
				'href' : prefix + pagePre + '=' + (page - 1) + '&' + sizePre + '=' + size + ''
			});
			next.attr({
				'href' : prefix + pagePre + '=' + (page + 1) + '&' + sizePre + '=' + size + ''
			});

			function simplify(page) {
				var items = pagin.children('span').children('a')
					, active = pagin.children('span').children('.active')
					, aIndex
					, disNum = []
					, max = 10;
				if( items.length > max ){
					// get active index
					aIndex = active.index() + 1;
					
					items.each(function(i, link){
						if( disNum.length >= max ) return false;
						
						i = i+1;
						
						if( i===aIndex || i===aIndex-1 || i===aIndex+1 || i===1 || i===2 || i===items.length-1 || i===items.length ){
							disNum.push(i);
							return;
						}
					})
					
					for( var i=aIndex-2; i>2 ; i-- ){
						if( disNum.length >= max ) break;
						disNum.contains(i) || disNum.push(i);
					}
					
					for( var i=aIndex+2; i<items.length-1 ; i++ ){
						if( disNum.length >= max ) break;
						disNum.contains(i) || disNum.push(i);
					}
					
					disNum.sort(function(a, b){
						return a > b;
					});
					
					items.each(function(i, link){
						i = i+1;
						disNum.contains(i) || $(this).remove();
					});
					
					items = pagin.children('span').children('a');
					
					for( var i = 1; i < disNum.length ; i++ ){
						if( disNum[i] - disNum[i-1] > 1){
							$(items[i-1]).after('<strong> ... </strong>');
						}
					}
				}
			}
			simplify(page);
			pagin.find('a').addClass('j_pagin_link');
		}