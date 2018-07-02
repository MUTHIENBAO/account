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
	if(isset($_GET['page'])) $page = $_GET['page'];
    else $page = 'event_epitem_view';
	switch ($page)
	{
		case 'event_epitem_regnew': 
			include('modules/event/event_epitem_regnew.php');
			break;
		case 'event_epitem_reged': 
			include('modules/event/event_epitem_reged.php');
			break;
        case 'event_epitem_rank': 
			include('modules/event/event_epitem_rank.php');
			break;
		default: include("modules/event/event_epitem_view.php"); break;
	}
?>