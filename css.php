<?php





include_once('config/config.php');





header('Content-Type: text/css; charset=utf-8');


$css = array(


	'fancybox/jquery.fancybox-1.3.4.css',


	'templates/css'.$type.'/bootstrap.css',


	'templates/css'.$type.'/reset.css',


	'templates/css'.$type.'/tooltipster.css',


	'templates/css'.$type.'/style.dev.css',


	'templates/css'.$type.'/core-layout.css',


	'templates/css'.$type.'/theme.css',


	'templates/css'.$type.'/common.dev.css'


);


echo '





/*******************************


        MU THIEN BAO
        BAC PHAM 2018


*******************************/





';


foreach($css as $file){


	if(file_exists($file)){


		$content = file_get_contents($file);


		$_find = array("\n","\t","../");


		$_replace = array("","","templates/");


		echo str_replace($_find,$_replace,$content);


		


	}


	


}