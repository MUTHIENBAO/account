<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include('config/config_resetpoint.php');
	
if (isset($_POST['action']))
{
	$action = $_POST['action'];
	if ($action == 'resetpoint')
	{
		$character = $_POST['character'];
		$pass2 = $_POST['pass2'];
		if (empty($character))
		{
			$notice = "Chưa chọn nhân vật cần Reset Point";
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
                'pass2'    =>  $pass2,
                
                'pagesv'	=>	'sv_char_reset_point',
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
				$info = read_TagName($reponse, 'info', 1);
				if ($info == 'OK') {
					$notice = "$character đã Reset Point thành công";
					
					$_SESSION['nv_point'] = read_TagName($reponse, 'point', 1);
                    $_SESSION['nv_pointdutru'] = read_TagName($reponse, 'pointdutru', 1);
                    $_SESSION['acc_vpoint'] = read_TagName($reponse, 'vpoint', 1);
                    $_SESSION['nv_zen'] = read_TagName($reponse, 'zen_char', 1);
                    $_SESSION['acc_zen'] = read_TagName($reponse, 'zen_bank', 1);
				}
				else $notice = $reponse;
			}
		}
	}
}

$font_thieu_begin = "<font color='red'><b>";
$font_thieu_end = "</b></font>";
$font_du_begin = "<font color='green'><b>";
$font_du_end = "</b></font>";

$accept = 1;

$money_less_notice = "";

$vpoint_total = $_SESSION['acc_vpoint'] + $_SESSION['acc_vpoint_km'];
if($vpoint_total >= $resetpoint_vpoint) {
    $money_flag = true;
    $money_notice = "$font_du_begin ". number_format($resetpoint_vpoint, 0, ',', '.') ."/". number_format($vpoint_total, 0, ',', '.') ." Vcent $font_du_end";
    $money_less_notice = "$font_du_begin Đủ Vcent $font_du_end";
} else {
    $money_flag = false;
    $money_less = $resetpoint_vpoint - $vpoint_total;
    $money_notice = "$font_thieu_begin ". number_format($resetpoint_vpoint, 0, ',', '.') ."/". number_format($vpoint_total, 0, ',', '.') ." Vcent $font_thieu_end";
    $money_less_notice = "$font_thieu_begin Thiếu $money_less Vcent $font_thieu_end";
}
    
// ZEN
$zen_total = $_SESSION['acc_zen'] + $_SESSION['nv_zen'];
if($zen_total >= $resetpoint_zen) {
    $zen_flag = true;
    $zen_notice = "$font_du_begin ". number_format($resetpoint_zen, 0, ',', '.') ."/". number_format($zen_total, 0, ',', '.') ." $font_du_end";
    $zen_less_notice = "$font_du_begin Đủ ZEN $font_du_end";
} else {
    $zen_flag = false;
    $zen_less = $resetpoint_zen - $zen_total;
    $zen_notice = "$font_thieu_begin ". number_format($resetpoint_zen, 0, ',', '.') ."/". number_format($zen_total, 0, ',', '.') ." $font_thieu_end";
    $zen_less_notice = "$font_thieu_begin Thiếu ". number_format($zen_less, 0, ',', '.') ." ZEN $font_thieu_end";
}

if ( $_SESSION['nv_doinv'] == 0 || $money_flag == false || $zen_flag == false ) { $accept = 0; }	

$page_template = "templates/char_manager/resetpoint.tpl";
?>