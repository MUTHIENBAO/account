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

	if ($action == 'changeemail')
	{
		$email = $_POST['email'];
		
		$pass2 = $_POST['pass2'];
		$quest = $_POST['quest'];
		$ans = $_POST['ans'];
		
		if( $sendsv === false ) { $notice = "Tốc độ xử lý của bạn quá nhanh, vui lòng chờ vài giây rồi tiếp tục thực hiện."; }
		elseif(empty($email)) {
			$notice = "Chưa nhập Email";
		}
		elseif (preg_match("/[^a-zA-Z0-9_$]/", $ans))
			{
				$notice = "<font size='4' color='red'>Dữ liệu lỗi - Câu trả lời bí mật chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font>";
			}
		elseif (preg_match("/[^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$]/", $email))
			{
				$notice = "<font size='4' color='red'>Dữ liệu lỗi - Không đúng dạng Email.</font>";
			}
		elseif (preg_match("/[^a-zA-Z0-9_$]/", $pass2))
			{
				$notice = "<font color='red'>Dữ liệu lỗi - Mật khẩu Web cấp 2 chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font><br>";
			}
		elseif (preg_match("/[^1-9$]/", $quest))
			{
				$notice = "<font color='red'>Dữ liệu lỗi - Chưa chọn câu hỏi bí mật.</font>";
			}
		elseif (preg_match("/[^a-zA-Z0-9_$]/", $ans))
			{
				$notice = "<font color='red'>Dữ liệu lỗi - Câu trả lời bí mật chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font><br>";
			}
		else {
			$getcontent_url = $server_url . "/sv_acc.php";
	        $getcontent_data = array(
	            'login'    =>  $_SESSION['mu_username'],
	            'email'    =>  $email,
	            'pass2'    =>  $pass2,
	            'quest'    =>  $quest,
	            'ans'    =>  $ans,
	            
	            'pagesv'	=>	'sv_acc_change_email_info',
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
				$notice = $reponse;
			}
		}
	}
}

$page_template = "templates/acc_manager/changeemail_info.tpl";
?>