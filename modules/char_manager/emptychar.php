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
	if ($action == 'emptychar')
	{
		$character = $_POST['character'];
        $pass2 = $_POST['pass2'];
		
		if( $sendsv === false ) { $notice = "Tốc độ xử lý của bạn quá nhanh, vui lòng chờ vài giây rồi tiếp tục thực hiện."; }
		elseif (empty($character))
		{
			$notice = "Chưa chọn nhân vật Xóa Đồ";
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
				$notice = "Dữ liệu lỗi - Mật khẩu cấp 2 chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.";
			}
		else {
			
			$getcontent_url = $server_url . "/sv_char.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $character,
                'pass2'    =>  $pass2,
                
                'pagesv'	=>	'sv_char_empty_char',
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
				if ($info[1] == 'OK') {
					$notice = $info[2];
				}
				else $notice = $reponse;
			}
		}
	}
}

if ($_SESSION['nv_online'] == 1 && $_SESSION['nv_doinv'] == 0 ) { 
    $notice_accept = "<font color='red'>Chưa đổi nhân vật</font>";
    $accept = 0; 
} else {
    $notice_accept = "<font color='green'>Thỏa mãn</font>";
    $accept = 1; 
}
	
$page_template = "templates/char_manager/emptychar.tpl";
?>