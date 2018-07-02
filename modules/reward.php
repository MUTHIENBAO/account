<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
if ($Use_ThueItem != 1) {
	echo "<center>Chức năng không có hoặc không được sử dụng</center>";
}
else {
	if ( !isset($_SESSION['mu_username']) ) {
		echo "<div align=center><font color=red><b>Hãy Login trước khi thực hiện chức năng này</b></font></div>";
		include('modules/home.php');
	} else {
		$act = isset($_GET['act']) ? $_GET['act'] : null;
		switch ($act)
		{
			case 'thue_taphoa': 
				if ($Use_ThueTapHoa != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/reward/reward_item.php'); }
				break;
			case 'thue_kiem': 
				if ($Use_ThueKiem != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/reward/reward_item.php'); }
				break;
			case 'thue_gay': 
				if ($Use_ThueGay != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/reward/reward_item.php'); }
				break;
			case 'thue_cung': 
				if ($Use_ThueCung != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/reward/reward_item.php'); }
				break;
			case 'thue_vukhikhac': 
				if ($Use_ThueVuKhiKhac != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/reward/reward_item.php'); }
				break;
			case 'thue_khien': 
				if ($Use_ThueKhien != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/reward/reward_item.php'); }
				break;
			case 'thue_mu': 
				if ($Use_ThueMu != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/reward/reward_item.php'); }
				break;
			case 'thue_ao': 
				if ($Use_ThueAo != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/reward/reward_item.php'); }
				break;
			case 'thue_quan': 
				if ($Use_ThueQuan != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/reward/reward_item.php'); }
				break;
			case 'thue_tay': 
				if ($Use_ThueTay != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/reward/reward_item.php'); }
				break;
			case 'thue_chan': 
				if ($Use_ThueChan != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/reward/reward_item.php'); }
				break;
			case 'thue_trangsuc': 
				if ($Use_ThueTrangSuc != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/reward/reward_item.php'); }
				break;
			case 'thue_canh': 
				if ($Use_ThueCanh != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/reward/reward_item.php'); }
				break;
			
			default : $page_template = 'templates/reward.tpl';
		}
	}
}

?>