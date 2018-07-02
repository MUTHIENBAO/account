<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");

if(isset($quest3_use) && $quest3_use == 1 && in_array($_SESSION['nv_class'], array(0,1,16,17,32,33,48,64,80,81,96))) {
    include('config/config_quest3.php');
    $accept = 1;
    if ($_SESSION['nv_doinv'] == 0) { $accept = 0; }
    $page_template = "templates/char_manager/quest3.tpl";
} else echo "Chưa năng chưa bật hoặc nhân vật đã làm nhiệm vụ Cấp 3";
?>