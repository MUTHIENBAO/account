<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
	
include('config/config_daugia.php');
include('config/config_thehe.php');

if($Use_ChoTroi == 1) {
    $page = isset($_GET['page']) ? $_GET['page'] : null;
	switch ($page)
	{
		case 'daugia_biding': 
			include('modules/com/daugia_biding.php');
			break;
			
		case 'daugia_end': 
			include('modules/com/daugia_end.php');
			break;
			
		case 'daugia_bid': 
			include('modules/com/daugia_bid.php');
			break;
		
		case 'daugia_own': 
			include('modules/com/daugia_own.php');
			break;
			
		default: include("templates/com/daugia_view.tpl"); break;
	}
} else echo "<center><strong>Chức năng không được sử dụng.</strong></center>";
    	

?>