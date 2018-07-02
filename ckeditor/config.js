CKEDITOR.editorConfig = function( config )
{
    config.toolbar = 'Toolbar';
    config.toolbar_Toolbar=
	[
	   /* ['Source','-','Save','NewPage','Preview','-','Templates'],
	    ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],
	    ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
	   
	    ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
	    '/',
	    */
	    ['Source','-','Bold','Italic','Underline','Strike','-','Subscript','Superscript','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
	    ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote','TextColor','BGColor'],
	    ['Link','Unlink','Image','Flash'],
	    ['FontSize','Styles'],
	    ['Table','HorizontalRule','SpecialChar'],
	   
	    /*
	    '/',
	    */
	   
	    /*
	    ['Maximize', 'ShowBlocks','-','About']
	    */
	];

};