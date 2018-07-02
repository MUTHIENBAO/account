<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include('config/config_event_santa_ticket.php');

if (isset($_POST['action']))
{
	$action = $_POST['action'];
	if ($action == 'santa_ticket')
	{
		$character = $_POST['character'];
		$pass2 = $_POST['pass2'];
		if (empty($character))
		{
			$notice = "Chưa chọn nhân vật có Item V.Point muốn đổi";
		}
		elseif (preg_match("/[^a-zA-Z0-9_$]/", $character))
			{
				$error = "<font size='4' color='red'>Dữ liệu lỗi - Nhân vật chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font>";
			}
		elseif (empty($pass2))
		{
			$notice = "Chưa nhập mật khẩu cấp 2";
		}
		elseif (preg_match("/[^a-zA-Z0-9_$]/", $pass2))
			{
				$error = "<font size='4' color='red'>Dữ liệu lỗi - Mật khẩu cấp 2 chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font>";
			}
		else {
			
			$getcontent_url = $server_url . "/event_santa.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $character,
                'pass2'    =>  $pass2,
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
					$notice = $info[2];
					$_SESSION['acc_vpoint'] = $info[1];
				}
				else $notice = $reponse;
			}
		}
	}
}

if (isset($_SESSION['mu_nvchon'])) {
    if ($_SESSION['nv_online'] == 1) $online = "<font color='red'><b>Chưa Thoát</b></font>"; else $online = "<font color='green'><b>Đã thoát</b></font>";
	if ($_SESSION['nv_doinv'] == 1) $doinv = "<font color='green'>Đã đổi</font>"; else $doinv = "<font color='red'><b>Chưa đổi</b></font>";
}
if ($_SESSION['nv_online'] == 1 || $_SESSION['nv_doinv'] == 0 ) { $accept = '0'; }

$page_template = "templates/event/santa_ticket.tpl";
?>