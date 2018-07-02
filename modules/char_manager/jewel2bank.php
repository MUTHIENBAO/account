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
	if ($action == 'jewel2bank')
	{
		$character = $_POST['character'];
		
		if( $sendsv === false ) { $notice = "Tốc độ xử lý của bạn quá nhanh, vui lòng chờ vài giây rồi tiếp tục thực hiện."; }
		elseif (empty($character))
		{
			$notice = "Chưa chọn nhân vật gửi Jewel";
		}
		elseif (preg_match("/[^a-zA-Z0-9_$]/", $character))
			{
				$error = "<font size='4' color='red'>Dữ liệu lỗi - Nhân vật chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font>";
			}
		else {
			
			$getcontent_url = $server_url . "/sv_char.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $character,
                
                'pagesv'	=>	'sv_char_jewel2bank',
                'string_login'    =>  $_SESSION['checklogin'],
                'passtransfer'    =>  $passtransfer
            ); 
            
            $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

			if ( empty($reponse) ) $notice = "<font size='3' color='red'>Server bảo trì.</font>";
			elseif($reponse == "login_other") {
				$notice = "<font size='3' color='red'>Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.</font>";
				session_destroy();
			}
			else {
				$info = explode('<netbanbe>',$reponse);
				$jewel = explode('<nbb>',$info[0]);
				if ($jewel[0] == 'OK') {
					$notice = $info[1];
					
					$_SESSION['acc_chao'] = $_SESSION['acc_chao'] + $jewel[1];
					$_SESSION['acc_cre'] = $_SESSION['acc_cre'] + $jewel[2];
					$_SESSION['acc_blue'] = $_SESSION['acc_blue'] + $jewel[3];
				}
				else $notice = $reponse;
			}
		}
	}
}

$accept = 1;

if ($_SESSION['nv_online'] == 1) {
    $online = "<font color='red'><b>Chưa Thoát</b></font>";
    $accept = 0;
} else $online = "<font color='green'>Đã Thoát</font>";
	if ($_SESSION['nv_doinv'] == 1) $doinv = "<font color='green'>Đã đổi</font>"; else {
	   $doinv = "<font color='red'><b>Chưa đổi</b></font>";
       $accept = 0;
	}
	
$page_template = "templates/char_manager/jewel2bank.tpl";
?>