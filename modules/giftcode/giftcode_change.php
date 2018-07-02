<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include('config/config_giftcode_tanthu.php');
include('config/config_sms.php');
include_once("config/config_sms_pri.php");

if (isset($_POST['action']))
{
	$action = $_POST['action'];
	if ($action == 'giftcode_change')
	{
		$character = $_POST['character'];
        $giftcode = $_POST['giftcode'];
		$pass2 = $_POST['pass2'];
        
		if (empty($character))
		{
			$notice = "Chưa chọn nhân vật muốn đổi GiftCode";
		}
		elseif (!preg_match("/^[a-zA-Z0-9_]*$/i", $character))
			{
				$error = "<font size='4' color='red'>Dữ liệu lỗi - Nhân vật chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font>";
			}
		elseif (empty($giftcode))
		{
			$notice = "Chưa nhập Mã GiftCode";
		}
		elseif (!preg_match("/^[a-zA-Z0-9]*$/i", $giftcode))
			{
				$error = "<font size='4' color='red'>Dữ liệu lỗi - Mã GiftCode chỉ được sử dụng kí tự a-z, A-Z, số (1-9).</font>";
			}
        elseif (empty($pass2))
		{
			$notice = "Chưa nhập mật khẩu cấp 2";
		}
		elseif (!preg_match("/^[a-zA-Z0-9_]*$/i", $pass2))
			{
				$error = "<font size='4' color='red'>Dữ liệu lỗi - Mật khẩu cấp 2 chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font>";
			}
		else {
			
			$getcontent_url = $server_url . "/sv_giftcode_change.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $character,
                'giftcode'    =>  $giftcode,
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
				if ($info[1] == 'OK') {
					$data = json_decode($info[2], true);
                    $notice = $data['notice'];
                    
					$_SESSION['acc_gcoin_km'] += abs(intval($data['gcoin_km']));
                    $_SESSION['acc_vpoint_km'] += abs(intval($data['vpoint_km']));
                    $_SESSION['acc_ppoint_extra'] += abs(intval($data['nbb_pl_extra']));
                    $_SESSION['acc_zen'] += abs(intval($data['bank_zen']));
                    $_SESSION['acc_chao'] += abs(intval($data['bank_chao']));
                    $_SESSION['acc_cre'] += abs(intval($data['bank_cre']));
                    $_SESSION['acc_blue'] += abs(intval($data['bank_blue']));
                    
                    if(strlen($data['SCFSealTime']) > 0 && abs(intval($data['SCFSealTime'])) > 0) {
                        $_SESSION['SCFSealTime'] = $data['SCFSealTime'];
                    }
				}
				else $notice = $reponse;
			}
		}
	}
}

if (isset($_SESSION['mu_nvchon'])) {
    $accept = 1;
    if (isset($_SESSION['nv_online']) && $_SESSION['nv_online'] == 1) {
        $accept = '0';
        $online = "<font color='red'><b>Chưa Thoát</b></font>";
    } else $online = "<font color='green'>Đã Thoát</font>";
}

$page_template = "templates/giftcode/giftcode_change.tpl";
?>