<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include('config/config_doigioitinh.php');
include_once('config/config_relife.php');
include('config/config_vip_system.php');

if ($Use_DoiGioiTinh != 1) {
	echo "<center>Chức năng không có hoặc không được sử dụng</center>";
}
else {
if (isset($_POST['action']))
{
	$action = $_POST['action'];
	if ($action == 'doigioitinh')
	{
		$character = $_POST['character'];
		$gioitinh = $_POST['gioitinh'];
		$pass2 = $_POST['pass2'];
		
		
		if( $sendsv === false ) { $notice = "Tốc độ xử lý của bạn quá nhanh, vui lòng chờ vài giây rồi tiếp tục thực hiện."; }
		elseif (empty($character))
		{
			$notice = "Chưa chọn nhân vật cần Đổi giới tính";
		}
		elseif (preg_match("/[^a-zA-Z0-9_$]/", $character))
			{
				$notice = "Dữ liệu lỗi - Nhân vật chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.";
			}
		elseif (preg_match("/[^0-9$]/", $gioitinh))
			{
				$notice = "Dữ liệu lỗi - Giới tính chỉ được sử dụng số (1-9).";
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
                'gioitinh'    =>  $gioitinh,
                
                'pagesv'	=>	'sv_char_doigioitinh',
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
				$char = explode('<nbb>',$info[0]);
				if ($char[0] == 'OK') {
					$notice = $info[1];
					
					$_SESSION['acc_gcoin'] = $char[1];
					$_SESSION['acc_gcoin_km'] = $char[2];
					
					$_SESSION['nv_class'] = $gioitinh;
					$_SESSION['nv_reset'] = $char[3];
                    $_SESSION['nv_relife'] = $char[4];
				}
				else $notice = $reponse;
			}
		}
	}
}

$chenhlech_gcoin = $_SESSION['acc_gcoin'] + $_SESSION['acc_gcoin_km'] - $doigt_gcoin;

// Reset Total
$reset_total = 0;
for($relife_i = 0; $relife_i <= $_SESSION['nv_relife']; $relife_i++) {
    $reset_total += $rl_reset_relife[$relife_i];
}
$reset_total += $_SESSION['nv_reset'];
// Reset Total End

$chenhlech_reset = $doigt_resetmin - $reset_total;

$reset_after = $_SESSION['nv_reset'];
$relife_after = $_SESSION['nv_relife'];
$reset_total_redure = 0;
//VIP2
if($Use_VIP == 2 && $_SESSION['acc_vip'] > 0 && $_SESSION['acc_vip_day'] >= $enable_vip['dgt']) {
    if($_SESSION['acc_vip'] == 1) {
		$extra_doigt_trureset = $gold_vip['reset_dgt'];
		$doigt_trureset = $doigt_trureset - $gold_vip['reset_dgt'];
	}
	elseif($_SESSION['acc_vip'] == 2) {
		$extra_doigt_trureset = $silver_vip['reset_dgt'] ;
		$doigt_trureset = $doigt_trureset - $silver_vip['reset_dgt'];		
	}   
}
//End VIP2

if($doigt_trureset>0) {
    $reset_total_after = ceil($reset_total * ( 1 - ($doigt_trureset/100) ));
    $reset_total_redure = $reset_total - $reset_total_after;
    
    $relife_i = 1;
    while($reset_total_after > $rl_reset_relife[$relife_i]) {
        $reset_total_after = $reset_total_after - $rl_reset_relife[$relife_i];
        $relife_i++;
    }
    
    $reset_after = $reset_total_after;
    $relife_after = $relife_i - 1;;
}

$font_thieu_begin = "<font color='red'><b>";
$font_thieu_end = "</b></font>";
$font_du_begin = "<font color='green'><b>";
$font_du_end = "</b></font>";

if ($chenhlech_gcoin < 0) { $notice_gcoin = "$font_thieu_begin Thiếu ". ABS($chenhlech_gcoin) ." Gcent $font_thieu_end"; } else { $notice_gcoin = "$font_du_begin Đủ Gcent Đổi Giới Tính $font_du_end"; }
if ($chenhlech_reset > 0) { $notice_reset = "$font_thieu_begin Thiếu ". ABS($chenhlech_reset) ." Reset $font_thieu_end"; } else { $notice_reset = "$font_du_begin Đủ  $doigt_resetmin Reset để Đổi Giới Tính $font_du_end"; }

$accept = 1;
if ( $_SESSION['nv_online'] == 1 || $_SESSION['nv_doinv'] == 0 || $chenhlech_reset > 0 || $chenhlech_vpoint < 0 ) { $accept = 0; }	

$page_template = "templates/char_manager/doigioitinh.tpl";
}
?>