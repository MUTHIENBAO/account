<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include('config/config_uythaconline.php');
if (isset($_POST['action']))
{
	$action = $_POST['action'];
	if ($action == 'UyThacOnline')
	{
		$character = $_POST['character'];
		if (empty($character))
		{
			$notice = "Chưa chọn nhân vật cần Ủy Thác";
		}
		elseif (preg_match("[^a-zA-Z0-9_$]", $character))
			{
				$notice = "<font size='2' color='red'>Dữ liệu lỗi - Nhân vật chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font>";
			}
		else {
			
			$getcontent_url = $server_url . "/sv_char.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $character,
                
                'pagesv'	=>	'sv_char_uythac_online',
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
				$info = explode('<nbb>',$reponse);
				if ($info[0] == 'OK') {
					$notice = $info[1];
						$_SESSION['nv_uythaconline'] = 1;
				}
				else $notice = $reponse;
			}
		}
	}
}

$accept = 1;
if ($_SESSION['nv_uythaconline'] == 1) { $accept = 0; }
$page_template = "templates/char_manager/uythaconline.tpl";
?>