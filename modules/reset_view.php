<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
    
include('config/config_reset.php');
include('config/config_hotrotanthu.php');

if($hotrotanthu != 1) {
    $top2_rsredure	= 0;
    $top3_rsredure	= 0;
    $top4_rsredure	= 0;
    $top10_rsredure	= 0;
    $top20_rsredure	= 0;
    $top30_rsredure	= 0;
    $top40_rsredure	= 0;
    $top50_rsredure	= 0;
    $top50_over_rsredure	= 0;
}
    
    $page_template = 'templates/reset_view.tpl';
?>