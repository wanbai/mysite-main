// stop default link behavior
$(document).on('click', '[href="#"],.disabled', function(e) {
	e.preventDefault();
});

function resetOptPanel( margin ){
	var ctnLeft = $($('.container')[0]).offset().left
		, panWidth
		, panel = $('.opt-panel')
		, ctn = $($('.container')[0]);
	ctnLeft = ctn.offset().left;
	panWidth = panel.width();
	panel.css('right', ctnLeft - panWidth - margin);
}

function toTop(){
	$(window).scrollTop(0);
}

function checkfixTop(){
	var head = $('.navbar')
		, headH = head.height();
	if( head.hasClass('navbar-fixed-top') ){
		$('body').css('padding-top',headH);
	}else{
		$('body').css('padding-top',0);
	}
}

function fixTop(){
	var head = $('.navbar')
		, headH = head.height();
	
	if( $(window).scrollTop() > headH ){
		head.hasClass('navbar-fixed-top') || head.addClass('navbar-fixed-top');
	}else {
		head.removeClass('navbar-fixed-top');
	}
}

function bindJQValiEngin() {
	var set = {
		onFieldFailure : function(ui) {
			ui && ui.removeClass('success').addClass('error');
		},
		onFieldSuccess : function(ui) {
			ui && ui.removeClass('error').addClass('success');
		},
		showPrompts : false,
	};
	// 全局 ValidationEngine 设置覆盖
	$.validationEngine.defaults = $.extend({}, $.validationEngine.defaults, set);
	$('.j_vali_form').validationEngine();
}

function beautifyBanner(){
	if( !Utils.isMobile() ) {
		var screeW = screen.width;
		$('.banner').css('background-size',screeW);
		// console.log( document.getElementsByTagName('html')[0].className );
	}
}

function prettyCode(ctn){
	ctn && $(ctn).find('.codearea').addClass('prettyprint');
	window.prettyPrint && prettyPrint();
}

$(document).ready(function(){
	beautifyBanner();
	resetOptPanel(20);
	checkfixTop();
	bindJQValiEngin();
	$(window).resize(function(){
		resetOptPanel(20);
	});
	
	$(window).scroll(function(){
		//fixTop();
	});
});
