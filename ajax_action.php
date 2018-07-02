<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
session_start();
define('DWebMU',true);
include_once('config/config.php');
include_once('includes/function.php');

//$sendsv = true;
// Nhung hanh dong khong quet toc do
//$checkspeed_arr = array('addpoint');
//if(!in_array($_GET['ajax'], $checkspeed_arr)) {
//    $sendsv = _checksendsv();
//}


//if( $sendsv === false) { echo "Tốc độ xử lý của bạn quá nhanh, vui lòng chờ vài giây rồi tiếp tục thực hiện."; }
//else {
	// Define Ajax Request
	define('IS_AJAX', isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest');
	if(!IS_AJAX) { echo 'Khong duoc phep truy cap.'; }
	else {
	    if( isset($_GET['ajax']) )
	    {
	    	if ( preg_match("/^[a-zA-Z0-9_]+$/", $_GET['ajax']) )
	    	{
	            if (is_file("ajax/ajax_". $_GET['ajax'] .".php")) 
	    		{
	                include("ajax/ajax_". $_GET['ajax'] .".php");
	    		}
	            else echo "Not File Ajax";
	    	}
	        else echo $_GET['ajax'] . " : Parameter Ajax Don't Allow";
	    }
	}
//}

?>