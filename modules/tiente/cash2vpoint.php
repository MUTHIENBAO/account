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
	if ($action == 'cash2vpoint')
	{
		$cash = $_POST['cash'];           $cash = abs(intval($cash));
		$pass2 = $_POST['pass2'];
		
		if( $sendsv === false ) { $notice = "Tốc độ xử lý của bạn quá nhanh, vui lòng chờ vài giây rồi tiếp tục thực hiện."; }
		elseif(empty($cash)) {
			$notice = "Chưa chọn số lượng Cash muốn đổi";
		}
		elseif (preg_match("/[^0-9$]/", $cash))
			{
				$notice = "Dữ liệu lỗi - Cash chỉ được sử dụng số (1-9).";
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
			
			$getcontent_url = $server_url . "/sv_tiente.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'pass2'    =>  $pass2,
                'cash'    =>  $cash,
                
                'pagesv'	=>	'sv_tiente_cash2vpoint',
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
					$_SESSION['acc_vpoint'] = $_SESSION['acc_vpoint'] + $cash*90;
				}
				else $notice = $reponse;
			}
		}
	}
}


$page_template = "templates/tiente/cash2vpoint.tpl";
?>