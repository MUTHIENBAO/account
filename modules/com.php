<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
if ( !isset($_SESSION['mu_username']) ) {
	echo "<div align=center><font color=red><b>Hãy Login trước khi thực hiện chức năng này</b></font></div>";
	include('modules/home.php');
} else {
	$act = isset($_GET['act']) ? $_GET['act'] : null;
	switch ($act)
	{
		case 'daugianguoc': include('modules/com/daugianguoc.php'); break;
        case 'daugia': include('modules/com/daugia.php'); break;
        case 'chotroi': include('modules/com/chotroi.php'); break;
        case 'lode': include('modules/com/lode.php'); break;
        case 'bongda': include('modules/com/bongda.php'); break;
        
        default : $page_template = 'templates/com.tpl';
	}
}
?>