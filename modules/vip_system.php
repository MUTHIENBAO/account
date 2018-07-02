<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include('config/config_vip_system.php'); 
if ($Use_VIP != 2) {
	echo "<center>Chức năng không có hoặc không được sử dụng</center>";
}
else {	 
	if ( !isset($_SESSION['mu_username']) ) {
		echo "<div align=center><font color=red><b>Hãy Login trước khi thực hiện chức năng này</b></font></div>";
		include('modules/home.php');
	} else 
	{
		$getcontent_url = $server_url . "/sv_vip_system.php";
		$getcontent_data = array(
			'login'    =>  $_SESSION['mu_username'],
			'action'    =>  'check_receive',
					
			'string_login'    =>  $_SESSION['checklogin'],
			'passtransfer'    =>  $passtransfer
		);
		
		$reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

		if ( empty($reponse) ) $error_module = "Server bảo trì.";
		elseif($reponse == "login_other") {
			$error_module = "<font size='3' color='red'>Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.</font>";
			session_destroy();
		}
		else {
			$info = explode('<nbb>',$reponse);
			if ($info[1] == 'OK') {
				$accept = $info[2];
			}
			else $error_module = $reponse;
		}
		$vip_time_left = $_SESSION['acc_vip_time'] - time();
		$vip_days_left = floor($vip_time_left/(24*60*60));
		$vip_hours_left = floor(($vip_time_left - $vip_days_left*24*60*60)/(60*60));
		$vip_mins_left = floor(($vip_time_left - $vip_days_left*24*60*60 - $vip_hours_left*60*60)/60);
		
		$page_template = 'templates/vip_system.tpl';
	}
}
?>