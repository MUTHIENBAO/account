<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
	
if (isset($_POST['action']))
{
	$action = $_POST['action'];
	if ($action == 'ipbonuspoint2vpoint')
	{
        $ipbonuspoint = $_POST['ipbonuspoint'];
		$pass2 = $_POST['pass2'];
		
		if( $sendsv === false ) { $notice = "Tốc độ xử lý của bạn quá nhanh, vui lòng chờ vài giây rồi tiếp tục thực hiện."; }
		elseif(empty($ipbonuspoint)) {
			$notice = "Chưa chọn số lượng IP Bonus Point muốn đổi";
		}
		elseif (!preg_match("/^[0-9]*$/i", $ipbonuspoint))
			{
				$notice = "Dữ liệu lỗi - IP Bonus Point chỉ được sử dụng số (0-9).";
			}
		elseif (empty($pass2))
		{
			$notice = "Chưa nhập mật khẩu cấp 2";
		}
		elseif (!preg_match("/^[a-zA-Z0-9_]*$/i", $pass2))
			{
				$notice = "Dữ liệu lỗi - Mật khẩu cấp 2 chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _";
			}
		elseif ($_SESSION['IPBonusPoint'] < $ipbonuspoint) {
			$notice	= "IP Bonus Point cần đổi lớn hơn IP Bonus Point hiện có";
		}
		else {
			
			$getcontent_url = $server_url . "/sv_tiente.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'pass2'    =>  $pass2,
                'ipbonuspoint'    =>  $ipbonuspoint,
                
                'pagesv'	=>	'sv_tiente_ipbonuspoint2vpoint',
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
					$notice = $info[1];
					$_SESSION['IPBonusPoint'] = $_SESSION['IPBonusPoint'] - $ipbonuspoint;
                    $_SESSION['acc_vpoint'] = $_SESSION['acc_vpoint'] + $ipbonuspoint;
				}
				else $notice = $reponse;
			}
		}
	}
}


$page_template = "templates/tiente/ipbonuspoint2vpoint.tpl";
?>