<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");

include('config/config_vip.php');

if (strlen($_SESSION['mu_nvchon']) > 0) {
    if($_SESSION['nbb_vip'] == 1) {
        $vip_lv = 0;
        $nbb_vip_time_used_day = floor($_SESSION['nbb_vip_time_used']/(24*60*60));
        $nbb_vip_time_used_hour = floor(($_SESSION['nbb_vip_time_used'] - $nbb_vip_time_used_day*24*60*60)/(60*60));
        if(is_array($vip_level_day)) {
            foreach($vip_level_day as $k => $v) {
                if($nbb_vip_time_used_day >= $v) {
                    $vip_lv = $k+1;
                    $vip_day_lv = $v;
                }
                else break;
            }
        }
        
        $vip_day_view = '';
        if($vip_day_lv > 0) $vip_day_view = "<span>". $vip_day_lv ."d</span>";
    }
    
    $page_template = "templates/acc_manager/super.tpl";
} else {
   $page_template = 'templates/char_manager.tpl';
}
?>