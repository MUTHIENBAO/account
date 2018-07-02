<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include('config/config_event.php');
include('config/config_event_goldbox.php');

if (isset($_POST['action']))
{
	$action = $_POST['action'];
	if ($action == 'event1')
	{
		$character = $_POST['character'];
		$event1_type = $_POST['event1_type'];
		if (empty($character))
		{
			$notice = "Chưa chọn nhân vật gửi Jewel";
		}
		elseif (preg_match("/[^a-zA-Z0-9_$]/", $character))
			{
				$error = "<font size='4' color='red'>Dữ liệu lỗi - Nhân vật chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font>";
			}
		else {
			
			$getcontent_url = $server_url . "/event1.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $character,
                'event1_type'    =>  $event1_type,
                'string_login'    =>  $_SESSION['checklogin'],
                'passtransfer'    =>  $passtransfer
            ); 
            
            $notice = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

			if ( empty($notice) ) $notice = "<font size='3' color='red'>Server bảo trì.</font>";
			elseif($notice == "login_other") {
				$notice = "<font size='3' color='red'>Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.</font>";
				session_destroy();
			}
			
		}
	}
}

if (isset($_SESSION['mu_nvchon'])) {
    $accept = 1;
    if ($_SESSION['nv_online'] == 1) {
        $accept = 0;
        $online = "<font color='red'><b>Chưa Thoát</b></font>";
    } else $online = "<font color='green'>Đã Thoát</font>";
	if ($_SESSION['nv_doinv'] == 1) $doinv = "<font color='green'>Đã đổi</font>"; else {
	   $accept = 0;
       $doinv = "<font color='red'><b>Chưa đổi</b></font>";
	}
}

$page_template = "templates/event/event_goldbox.tpl";
?>