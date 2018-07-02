<?php
include('config/config_spin.php');
if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
if (isset($_SESSION['mu_nvchon'])) {
	if ($_SESSION['nv_online'] == 1) $online = "<font color='red'><b>Chưa Thoát</b></font><br>(Sau khi Thoát Game hãy chọn lại Nhân vật)";
	else $online = "<font color='green'>Đã Thoát</font>";

	if ($_SESSION['nv_doinv'] == 1) $doinv = "<font color='green'>Đã đổi</font>";
	else $doinv = "<font color='red'><b>Chưa đổi</b></font><br>(Sau khi đổi nhân vật khác trong Game, hãy chọn lại nhân vật trên Web)";
	
	if ($_SESSION['nv_online'] == 1 || $_SESSION['nv_doinv'] == 0 ) $accept = '0';
	else $accept = '1';
	
	$spinlist = spin_load('config/spin_list.txt');
	if ($Use_costspin == 1) {
	$page_template = "templates/event/luckyspin.tpl";
	} else { echo "<center>Chức năng không được sử dụng<center>"; }
} else include('templates/char_manager.tpl');
?>	
