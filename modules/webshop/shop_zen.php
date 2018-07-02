<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
if ($Use_ShopTienZen != 1) {
	echo "<center>Chức năng không có hoặc không được sử dụng</center>";
}
else {
	include('config/shop_zen.php');
	if (isset($_POST['action']))
	{
		$action = $_POST['action'];
		if ($action == 'shop_zen')
		{
			$slg = $_POST['slg'];
			$pass2 = $_POST['pass2'];
			
			if( $sendsv === false ) { $notice = "Tốc độ xử lý của bạn quá nhanh, vui lòng chờ vài giây rồi tiếp tục thực hiện."; }
			elseif (empty($slg))
			{
				$notice = "Chưa chọn số Zen muốn mua";
			}
			elseif (preg_match("/[^0-9$]/", $slg))
			{
		    	$notice = "<font size='2' color='red'>Dữ liệu lỗi : $slg . Số lượng Zen Chỉ được sử dụng số (1-9).</font>"; 
			}
			elseif (empty($pass2))
			{
				$notice = "Chưa nhập mật khẩu cấp 2";
			}
			elseif (preg_match("/[^a-zA-Z0-9_$]/", $pass2))
				{
					$notice = "<font size='4' color='red'>Dữ liệu lỗi - Mật khẩu cấp 2 chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font>";
				}
			else {
			
			$getcontent_url = $server_url . "/shop_zen.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'pass2'    =>  $pass2,
                'slg'    =>  $slg,
                'string_login'    =>  $_SESSION['checklogin'],
                'passtransfer'    =>  $passtransfer
            ); 
            
            $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

				if ( empty($reponse) ) $notice = "Server bảo trì.";
				elseif($reponse == "login_other") {
					$notice = "<font size='3' color='red'>Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.</font>";
					session_destroy();
				}
				else {
					$info = explode('<nbb>',$reponse);
					if ($info[0] == 'OK') {
						$zen_duoc = $info[1];
						$vpoint = $info[2];
                        $vpoint_km = $info[3];
						$notice = $info[4];
                        
						$_SESSION['acc_vpoint'] = $vpoint;
                        $_SESSION['acc_vpoint_km'] = $vpoint_km;
						$_SESSION['acc_zen'] = $_SESSION['acc_zen'] + $zen_duoc;
					}
					else $notice = $reponse;
				}
			}
		}
	}
$page_template = "templates/webshop/shop_zen.tpl";
}
?>