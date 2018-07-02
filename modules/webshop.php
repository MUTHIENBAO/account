<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
if ($Use_WebShop != 1) {
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
			case 'shop_taphoa': 
				if ($Use_ShopTapHoa != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/webshop/shop_item.php'); }
				break;
			case 'shop_event': 
				if ($Use_ShopVeEvent != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/webshop/shop_item.php'); }
				break;
			case 'shop_acient': 
				if ($Use_ShopAcient != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/webshop/shop_item.php'); }
				break;
			case 'shop_kiem': 
				if ($Use_ShopKiem != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/webshop/shop_item.php'); }
				break;
			case 'shop_gay': 
				if ($Use_ShopGay != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/webshop/shop_item.php'); }
				break;
			case 'shop_cung': 
				if ($Use_ShopCung != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/webshop/shop_item.php'); }
				break;
			case 'shop_vukhikhac': 
				if ($Use_ShopVuKhiKhac != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/webshop/shop_item.php'); }
				break;
			case 'shop_khien': 
				if ($Use_ShopKhien != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/webshop/shop_item.php'); }
				break;
			case 'shop_mu': 
				if ($Use_ShopMu != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/webshop/shop_item.php'); }
				break;
			case 'shop_ao': 
				if ($Use_ShopAo != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/webshop/shop_item.php'); }
				break;
			case 'shop_quan': 
				if ($Use_ShopQuan != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/webshop/shop_item.php'); }
				break;
			case 'shop_tay': 
				if ($Use_ShopTay != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/webshop/shop_item.php'); }
				break;
			case 'shop_chan': 
				if ($Use_ShopChan != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/webshop/shop_item.php'); }
				break;
			case 'shop_trangsuc': 
				if ($Use_ShopTrangSuc != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/webshop/shop_item.php'); }
				break;
			case 'shop_canh': 
				if ($Use_ShopCanh != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/webshop/shop_item.php'); }
				break;
			case 'shop_bank': 
				if ($Use_ShopBank != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/webshop/shop_bank.php'); }
				break;
			case 'shop_zen': 
				if ($Use_ShopTienZen != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else {include('modules/webshop/shop_zen.php'); }
				break;
			case 'bank2zen': 
                if (isset($Use_Draw_Zen) && $Use_Draw_Zen == 1) {
					include('modules/webshop/bank2zen.php');
				}
				else { echo "<center>Chức năng không có hoặc không được sử dụng</center>"; }
				break;
			
			default : $page_template = 'templates/webshop.tpl';
		}
	}
}

?>