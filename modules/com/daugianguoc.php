<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
	
include('config/config_daugianguoc.php');
include('config/config_thehe.php');

if($Use_DauGiaNguoc == 1) {
    $page = isset($_GET['page']) ? $_GET['page'] : null;
	switch ($page)
	{
		case 'daugianguoc_listitem_biding': 
			include('modules/com/daugianguoc_listitem_biding.php');
			break;
			
		case 'daugianguoc_listitem_end': 
			include('modules/com/daugianguoc_listitem_end.php');
			break;
			
		case 'daugianguoc_listitem_win': 
			include('modules/com/daugianguoc_listitem_win.php');
			break;
			
		default: include("templates/com/daugianguoc_listitem_view.tpl"); break;
	}
} else echo "<center><strong>Chức năng không được sử dụng.</strong></center>";
    	

?>