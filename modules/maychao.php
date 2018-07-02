<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
 
if ( !isset($_SESSION['mu_username']) ) {
	echo "<div align=center><font color=red><b>". $lang_notice_login ."</b></font></div>";
	include('modules/home.php');
} elseif(!isset($Use_MayChao) || $Use_MayChao != 1) {
    echo "Tính năng chưa bật.";
} else {
    if (strlen($_SESSION['mu_nvchon']) > 0) {
    	if(isset($_GET['act'])) $act = $_GET['act'];
        else $act = null;
		switch ($act)
		{
			case 'longcondor': include('modules/maychao/longcondor.php'); break;
            case 'trader_item': include('modules/maychao/trader_item.php'); break;
            case 'cuonghoa': include('modules/maychao/cuonghoa.php'); break;
            case 'hoanhaohoa': include('modules/maychao/hoanhaohoa.php'); break;
			case 'epdocong': include('modules/maychao/epdocong.php'); break;
			case 'epwing3': include('modules/maychao/epwing3.php'); break;
			case 'epwing4': include('modules/maychao/epwing4.php'); break;
			case 'epwing5': include('modules/maychao/epwing5.php'); break;
			default : $page_template = 'templates/maychao.tpl';
		}
    } else {
        echo "Chưa chọn nhân vật tiến hành Xoay Máy Chao.";
    }
}
?>