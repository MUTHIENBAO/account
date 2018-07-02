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
	if ($action == 'move')
	{
		$character = $_POST['character'];
		$location = $_POST['location'];
		if (empty($character))
		{
			$notice = "Chưa chọn nhân vật cần Di chuyển";
		}
		elseif (preg_match("/[^a-zA-Z0-9_$]/", $character))
			{
				$notice = "<font size='4' color='red'>Dữ liệu lỗi - Nhân vật chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font>";
			}
		else {
			
			$getcontent_url = $server_url . "/sv_char.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $character,
                'location'    =>  $location,
                
                'pagesv'	=>	'sv_char_move',
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

$page_template = "templates/char_manager/move.tpl";
?>