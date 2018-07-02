<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include('config/config_epdocong.php');

if (isset($_POST['action']))
{
	$action = $_POST['action'];
	if ($action == 'epdocong')
	{
		$character = $_POST['character'];
		$lenhbai_choise = $_POST['lenhbai_choise'];
		
		if( $sendsv === false ) { $notice = "Tốc độ xử lý của bạn quá nhanh, vui lòng chờ vài giây rồi tiếp tục thực hiện."; }

		else {
			
			$getcontent_url = $server_url . "/sv_maychao.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $character,
                'lenhbai_choise'    =>  $lenhbai_choise,
                
                'pagesv'	=>	'sv_epdocong',
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
				//$char = explode('<nbb>',$info[0]);
				if ($info[0] == 'OK') {
					$notice = $info[2];
					
					$_SESSION['acc_gcoin'] = $_SESSION['acc_gcoin'] - $info[1];
					$_SESSION['nv_LenhBaiEpDoCong'] = $_SESSION['nv_LenhBaiEpDoCong'] - $lenhbai_choise;
				}
				else $notice = $reponse;
			}
		}
	}
}

$chenhlech_gcoin = $_SESSION['acc_gcoin'] - $GcoinEpdo;
$lenhbaiepdo = $_SESSION['nv_LenhBaiEpDoCong'];
$font_thieu_begin = "<font color='red'><b>";
$font_thieu_end = "</b></font>";
$font_du_begin = "<font color='green'><b>";
$font_du_end = "</b></font>";

if ($chenhlech_gcoin < 0) { $notice_gcoin = "$font_thieu_begin Thiếu ". ABS($chenhlech_gcoin) ." Gcent $font_thieu_end"; } else { $notice_gcoin = "$font_du_begin Đủ Gcent Ép đồ $font_du_end"; }
if($_SESSION['nv_doinv'] == 0) { $doinv = "$font_thieu_begin Chưa đổi $font_thieu_end"; } else { $doinv = "$font_du_begin Đã đổi $font_du_end"; }
if($_SESSION['nv_online'] == 1) { $online = "$font_thieu_begin Chưa thoát $font_thieu_end"; } else { $online = "$font_du_begin Đã thoát $font_du_end"; }
$accept = 1;
if ( $_SESSION['nv_online'] == 1 || $_SESSION['nv_doinv'] == 0 || $chenhlech_gcoin < 0 ) { $accept = 0; }	

$page_template = "templates/maychao/epdocong.tpl";
?>