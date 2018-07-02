<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include('config/config_char2accother.php');

if (isset($_POST['action']))
{
	$action = $_POST['action'];

	if ($action == 'char2accother')
	{
		$character = $_POST['character'];
        $acctranfer = $_POST['acctranfer'];
        $chartranfer = $_POST['chartranfer'];
		
		$pass2 = $_POST['pass2'];
		$quest = $_POST['quest'];
		$ans = $_POST['ans'];
		
		if( $sendsv === false ) { $notice = "Tốc độ xử lý của bạn quá nhanh, vui lòng chờ vài giây rồi tiếp tục thực hiện."; }
		elseif(empty($chartranfer)) {
			$notice = "Chưa nhập Tên mới";
		}
		elseif(strlen($chartranfer) < 4) {
			$notice = "Tên nhân vật mới phải nhiều hơn 4 ký tự";
		}
		elseif (preg_match("/[^a-zA-Z0-9_$]/", $pass2))
			{
				$notice = "<font color='red'>Dữ liệu lỗi - Mật khẩu Web cấp 2 chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font><br>";
			}
		elseif (preg_match("/[^a-zA-Z0-9$]/", $chartranfer))
			{
				$notice = "<font color='red'>Dữ liệu lỗi - Tên nhân vật mới chỉ được sử dụng kí tự a-z, A-Z, số (1-9).</font><br>";
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
			
			$getcontent_url = $server_url . "/sv_char.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'nameold'    =>  $character,
                'acctranfer'    =>  $acctranfer,
                'chartranfer'    =>  $chartranfer,
                'pass2'    =>  $pass2,
                'quest'    =>  $quest,
                'ans'    =>  $ans,
                
                'pagesv'	=>	'sv_char_char2accother',
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
				if($info == 'OK') {
					$_SESSION['acc_gcoin'] = read_TagName($reponse, 'gcoin', 1);
                    $_SESSION['acc_gcoin_km'] = read_TagName($reponse, 'gcoinkm', 1);
                    $notice = read_TagName($reponse, 'notice', 1);
				}
				else $notice = $reponse;
			}
		}
	}
}

$accept = 1;
if ( $_SESSION['nv_online'] == 1 || $_SESSION['nv_doinv'] == 0 ) { $accept = 0; }	

$page_template = "templates/char_manager/char2accother.tpl";
?>