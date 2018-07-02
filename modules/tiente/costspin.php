<?php
if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include_once('config/config_spin.php');
if (isset($_POST['action'])){
	$action = $_POST['action'];
	if ($action == 'costspin'){
		$moneytype = $_POST['moneytype'];
		$costspin_number = abs(intval($_POST['costspin']));
		$pass2 = $_POST['pass2'];
		
		if($sendsv === false) $notice = "Tốc độ xử lý của bạn quá nhanh, vui lòng chờ vài giây rồi tiếp tục thực hiện.";
		elseif (empty($costspin_number)) $notice = "Chưa điền số lần quay muốn mua.";
		elseif ($costspin_number < 1) $notice = "Số lần quay muốn mua tối thiểu phải là 1.";
		elseif (eregi("[^0-9$]", $gcoin)) $notice = "Dữ liệu lỗi - Số lần quay muốn mua chỉ được sử dụng số (1-9).";
		elseif (empty($pass2)) $notice = "Chưa nhập mật khẩu cấp 2.";
		elseif (eregi("[^a-zA-Z0-9_$]", $pass2)) $notice = "Dữ liệu lỗi - Mật khẩu cấp 2 chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.";
		elseif ($moneytype != 'Gcoin' && $moneytype != 'Vpoint') $notice = "Dữ liệu lỗi - Loại tiền sử dụng chỉ có thể là Gcoin hoặc Vpoint.";
		elseif ($moneytype == 'Gcoin' && $costspin_number*$costspin_gcoin > $_SESSION['acc_gcoin']) $notice	= "Không đủ Gcoin.";
		elseif ($moneytype == 'Vpoint' && $costspin_number*$costspin_vpoint > $_SESSION['acc_vpoint']) $notice	= "Không đủ Vpoint.";
		else {
			$getcontent_url = $server_url . "/sv_tiente.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'pass2'    =>  $pass2,
                'moneytype'    =>  $moneytype,
				'costspin_number'    =>  $costspin_number,
                'pagesv'	=>	'sv_tiente_costspin',
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
					$notice = $info[1];
					Switch($moneytype){
						Case 'Gcoin': $_SESSION['acc_gcoin'] -= $costspin_number*$costspin_gcoin; break;
						Case 'Vpoint': $_SESSION['acc_vpoint'] -= $costspin_number*$costspin_vpoint; break;
					}
				}
				else $notice = $reponse;
			}
		}
	}
}


$page_template = "templates/tiente/costspin.tpl";
?>