<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include('config/config_uythacoffline.php');
include('config/config_vip_system.php');
if (isset($_POST['action']))
{
	$action = $_POST['action'];
	if ($action == 'uythacoffline')
	{
		$character = $_POST['character'];
		$pass2 = $_POST['pass2'];
		$act = $_POST['act'];
        $getuythac = $_POST['getuythac'];
		
		if (empty($character))
		{
			$notice = "Chưa chọn nhân vật cần Ủy Thác";
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
			
			$getcontent_url = $server_url . "/sv_char.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $character,
                'act'    =>  $act,
                'getuythac'    =>  $getuythac,
                'pass2'    =>  $pass2,
                
                'pagesv'	=>	'sv_char_uythac_offline',
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
					
					if($act == 'uythac_begin')
					{
						$_SESSION['nv_uythac_offline'] = 1;
					}
					if($act == 'uythac_end')
					{
					   if($getuythac) {
					       $_SESSION['nv_uythac_offline'] = 0;
    						$_SESSION['nv_uythac_offline_time'] = 0;
    						$_SESSION['acc_gcoin'] = $info[1];
    						$_SESSION['acc_gcoin_km'] = $info[2];
    					
    						$point_uythac_add = $info[3];
    						$phut_uythac = $info[4];
    						
    						$_SESSION['nv_point_uythac'] = $_SESSION['nv_point_uythac'] + $point_uythac_add;
    						
    						$notice = $info[5];
					   } else {
					       $_SESSION['nv_uythac_offline'] = 0;
					   }
					}
					
				}
				else $notice = $reponse;
			}
		}
	}
}

$uythac_msg = "";
$phutuythac = $_SESSION['nv_uythac_offline_time'];

$uythac_price = $phutuythac*$uythacoff_price;

$uythac_msg .=  "Cần <strong>". number_format($uythac_price, 0, ',', '.') ."</strong> Gcent để nhận hết số Điểm Ủy Thác trong <strong>". number_format($phutuythac, 0, ',', '.') ."</strong> Phút Ủy Thác";

$accept = 1;
if ($_SESSION['nv_online'] == 1 || $_SESSION['nv_doinv'] == 0 ) { $accept = 0; }

$page_template = "templates/char_manager/uythacoffline.tpl";
?>