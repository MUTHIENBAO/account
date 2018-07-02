
(function($) {
	jQuery.fn.tooltip = function(options){
		 var defaults = {  
		    offsetX: 15, 
		    offsetY: 10,  
		    fadeIn : '200', 
		    fadeOut : '200',
		    dataAttr : 'data',	
		    bordercolor: '#6CE26C', 
		    bgcolor: '#F8F8F8', 
		    fontcolor : '#006699', 
		    fontsize : '15px', 
		    folderurl : 'NULL', 
		    filetype: 'txt', 
		    height: 'auto', 
		    width : 'auto', 
		    cursor : 'help' 
		   };  
	var options = $.extend(defaults, options);
	
	var $tooltip = $('<div id="divToolTip"></div>');
	return this.each(function(){					
			$('body').append($tooltip);
			$tooltip.hide();
	
		var element = this;
		var id = $(element).attr('id');
		var filename = options.folderurl + id + '.' + options.filetype;
		var dialog_id = '#divToolTip';
	
		$(this).hover(function(e){
				
				if(options.folderurl != "NULL"){
					$(dialog_id).load(filename);

				}else
				{
					if($('#'+options.dataAttr + '_' + id).length > 0){
						$(dialog_id).html($('#'+ options.dataAttr + '_' + id).html());
						
					}else{
						$(dialog_id).html(id);
						
					}
				}

				$(element).css({'cursor' : options.cursor});
				if($(document).width() / 2 < e.pageX){
					$(dialog_id).css({
						'position' : 'absolute',
						'border' : '1px solid ' + options.bordercolor,
						'background-color' : options.bgcolor,
						'padding' : '5px 5px 5px 5px',
						'-moz-border-radius' : '5px 5px 5px 5px',
						'-webkit-border-radius' : '5px 5px 5px 5px',
						'top' : e.pageY + options.offsetY,
						'left' :  e.pageX - $(dialog_id).width() + options.offsetX,
						'color' : options.fontcolor,
						'font-size' : options.fontsize,
						'height' : options.height,
						'width' : options.width
					});

				}else{	
					$(dialog_id).css({
						'position' : 'absolute',
						'border' : '1px solid ' + options.bordercolor,
						'background-color' : options.bgcolor,
						'padding' : '5px 5px 5px 5px',
						'-moz-border-radius' : '5px 5px 5px 5px',
						'-webkit-border-radius' : '5px 5px 5px 5px',
						'top' : e.pageY + options.offsetY,
						'left' : e.pageX + options.offsetX,
						'color' : options.fontcolor,
						'font-size' : options.fontsize,
						'cursor' : options.cursor,
						'height' : options.height,
						'width' : options.width
					});

				}

				$(dialog_id).stop(true, true).fadeIn(options.fadeIn);	
					},function(){

				$(dialog_id).stop(true, true).fadeOut(options.fadeOut);	
					}).mousemove(function(e){	

				if($(document).width() / 2 < e.pageX){		
				$(dialog_id).css({
					'top' : e.pageY + options.offsetY,
					'left' : e.pageX - $(dialog_id).width(),
					'height' : options.height,
					'width' : options.width
					});
				
				}else{
					$(dialog_id).css({
					'top' : e.pageY + options.offsetY,
					'left' : e.pageX + options.offsetX,
					'height' : options.height,
					'width' : options.width
					});
				}
			});
		});
	};
 })(jQuery);

