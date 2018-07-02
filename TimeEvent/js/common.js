jQuery(document).ready(function(){
	
	jQuery("#top").addScrollControl({
		initTop : 400,
		offsetTop :400,
		animation : false,
		offsetToScroll :400,
		offsetLeft : 930,
		RelativeID : "MainContent"
	});
	$('#link-function').unbind('click').bind('click',function(e){
		e.stopPropagation();
		if($('#list-function').hasClass('active')){
			$('#list-function').removeClass('active');
		}
		else{
			$('#list-function').css({
					'left':$(this).offset().left - ( $('#list-function').outerWidth() - $(this).outerWidth()),
					'top':$(this).offset().top + 30
			})
			$('#list-function').addClass('active')
		}
		
	});
		
	$(document).unbind('click').bind('click',function(){
			
			$('#list-function').removeClass('active');
	});
});

