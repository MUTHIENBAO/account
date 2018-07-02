<?php


header('Content-Type: text/javascript; charset=utf-8');


$css = array(


	'js-d/jquery-1.7.2.min.js',



    'templates/js-d/jquery.cookie.js',


    'templates/js-d/jquery-ui-1.8.16.custom.min.js',


    'templates/js-d/jquery.ba-hashchange.min.js',


    'templates/js-d/jquery.tablesorter.min.js',


    'templates/js-d/jquery.colorbox-min.js',


    'templates/js-d/jquery.tooltipster.min.js',


    'js-d/tooltip.jquery.js',


    'fancybox/jquery.mousewheel-3.0.4.pack.js',


    'fancybox/jquery.fancybox-1.3.4.pack.js',


    'js-d/check.js',


    'js-d/jquery.countdown.min.js',


    'js-d/js_140903.js',


	'templates/js-d/common.js',


);








echo '





/*******************************


        DESIGN BY MUTHIENBAO


        WWW.muthienbao.NET


        Copyright MU Thien Bao


        BAC PHAM 2018


*******************************/





';


foreach($css as $file){


	if(file_exists($file)){


		$content = file_get_contents($file);


		$_find = array("\n","\t","  ");


		$_replace = array("","","");


		echo str_replace($_find,$_replace,$content);


		//echo $content;


		


	}


	


}