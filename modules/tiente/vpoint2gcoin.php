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
	if ($action == 'vpoint2gcoin')
	{
		$vpoint = $_POST['vpoint'];
		$pass2 = $_POST['pass2'];
		
		if( $sendsv === false ) { $notice = "Tốc độ xử lý của bạn quá nhanh, vui lòng chờ vài giây rồi tiếp tục thực hiện."; }
		elseif(empty($vpoint)) {
			$notice = "Chưa chọn số lượng Vcent muốn đổi";
		}
		elseif (preg_match("/[^0-9$]/", $vpoint))
			{
				$notice = "Dữ liệu lỗi : Vcent chỉ được sử dụng số (1-9).";
			}
        elseif ( $vpoint*1000 > $_SESSION['acc_vpoint'] )
			{
				$notice = "Dữ liệu lỗi : Vcent muốn đổi ". number_format($vpoint*1000, 0, ',', '.') ." lớn hơn số Vcent hiên có ". number_format($_SESSION['acc_vpoint'], 0, ',', '.') .".";
			}
		elseif (empty($pass2))
		{
			$notice = "Chưa nhập mật khẩu cấp 2";
		}
		elseif (preg_match("/[^a-zA-Z0-9_$]/", $pass2))
			{
				$notice = "Dữ liệu lỗi : Mật khẩu cấp 2 chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.";
			}
		else {
			
			$getcontent_url = $server_url . "/sv_tiente.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'pass2'    =>  $pass2,
                'vpoint'    =>  $vpoint,
                
                'pagesv'	=>	'sv_tiente_vpoint2gcoin',
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
				if (read_TagName($reponse, 'info', 1) == 'OK') {
					$notice = read_TagName($reponse, 'messenge', 1);
					$_SESSION['acc_gcoin'] = read_TagName($reponse, 'gcoin', 1);
					$_SESSION['acc_vpoint'] = read_TagName($reponse, 'vpoint', 1);
				}
				else $notice = $reponse;
			}
		}
	}
}


$page_template = "templates/tiente/vpoint2gcoin.tpl";
?>