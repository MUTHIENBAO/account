<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include('config/config_napthe.php');

if ($Use_NapThe != 1) {
	echo "<center>Chức năng không có hoặc không được sử dụng</center>";
}
else {
	if ( !isset($_SESSION['mu_username']) ) {
		echo "<div align=center><font color=red><b>Hãy Login trước khi thực hiện chức năng này</b></font></div>";
		include('modules/home.php');
	} else {	
		$act = isset($_GET['act']) ? $_GET['act'] : null;
		switch ($act)
		{
			/*case 'gate': include('modules/napthe/gate.php'); break;
            case 'vtc': include('modules/napthe/vtc.php'); break;
            case 'viettel': include('modules/napthe/viettel.php'); break;
            case 'vina': include('modules/napthe/vina.php'); break;
            case 'mobi': include('modules/napthe/mobi.php'); break;*/
			case 'listcard': include('modules/napthe/listcard.php'); break;
			
			default : include('modules/napthe/gate.php');
		}
	}
}


?>