<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include('config/config_event.php');
$file_host = "data/event_bongda.txt";
	$page = $_GET['page'];
	switch ($page)
	{
		case 'event_bongda_dudoan': 
			include('modules/event/event_bongda_dudoan.php');
			break;
		case 'event_bongda_ketqua': 
			include('modules/event/event_bongda_ketqua.php');
			break;
		default: include("modules/event/event_bongda_view.php"); break;
	}
?>