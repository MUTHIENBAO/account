<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include_once("vimage.php");
$vImage = new vImage();

if(isset($_GET['invite'])) $invite = $_GET['invite'];
else $invite = "";
if (!preg_match("/^[a-zA-Z0-9_]*$/i", $invite)) $invite = "";
if(strlen($invite) > 0) $_SESSION['mu_invite'] = $invite;

if (isset($_POST["register"]))
	{
		$vImage->loadCodes();
		
		if($vImage->checkCode()) {
			    $username = $_POST['username'];		$username = strtolower($username);
                $thehe = $_POST['thehe'];          $thehe = abs(intval($thehe));
                $passgame = $_POST['passgame'];
                $pass1 = $_POST['pass1'];
                $ip_client = get_ip();
    
			if (($username == NULL) || ($passgame == NULL) || ($pass1 == NULL)) { $error = "<font color='red'>Hãy điền đầy đủ tất cả các dữ liệu.</font><br>"; }
			elseif (!preg_match("/^[a-zA-Z0-9_]*$/i", $username))
				{
    				$error = "<font color='red'>Dữ liệu lỗi - Tài khoản chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font><br>";
				}
			elseif ( $username == 'demo' )
				{
    				$error = "<font color='red'>Dữ liệu lỗi - Không được đăng kí tài khoản Demo.</font><br>";
				}
			elseif ( substr_count($username, 'dis') > 0 )
				{
    				$error = "<font color='red'>Dữ liệu lỗi - Tên tài khoản không được phép đăng ký.</font><br>";
				}
			elseif (!preg_match("/^[a-zA-Z0-9_]*$/i", $passgame))
				{
    				$error = "<font color='red'>Dữ liệu lỗi - Mật khẩu Game chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font><br>";
				}
            elseif ( $thehe == 0 )
				{
    				$error = "<font color='red'>Dữ liệu lỗi - Thế hệ không hợp lệ.</font><br>";
				}
			elseif (!preg_match("/^[a-zA-Z0-9_]*$/i", $pass1))
				{
    				$error = "<font color='red'>Dữ liệu lỗi - Mật khẩu Web cấp 1 chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font><br>";
				}
			elseif ( $passgame == $pass1 ) {
				$error = "<font color='red'>Mật khẩu Game giống mật khẩu cấp 1</font><br>"; 
				}
			elseif ( strlen($username) <4 || strlen($username) >10 ) {
				$error = "<font color='red'>Tên tài khoản chỉ từ 4-10 kí tự</font><br>"; 
				}
			elseif ( strlen($pass1) <4 || strlen($pass1) >32 ) {
				$error = "<font color='red'>Mật khẩu cấp 1 chỉ từ 4-32 kí tự</font><br>"; 
				}
			else {
                
                
                $sno_numb = abs(intval($sno_numb));
                $sno_numb_len = strlen($sno_numb);
                if($sno_numb_len < 7) {
                    for($i=0; $i<(7-$sno_numb_len); ++$i) {
                        $sno_numb = '0'. $sno_numb;
                    }
                }
                
                $getcontent_url = $server_url . "/do_register.php";
		        $getcontent_data = array(
		            'action'    =>  'register',
		            'username'    =>  $username,
		            'thehe'    =>  $thehe,
		            'passgame'    =>  $passgame,
		            'pass1'    =>  $pass1,
		            'invite'    =>  $_SESSION['mu_invite'],
                    'ip'    =>  $ip_client,
		            'passtransfer'    =>  $passtransfer
		        ); 
		        
		        $show_reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

				if ( empty($show_reponse) ) $notice = "<font color='red'>Server bảo trì.</font>";
				else {
					if ($show_reponse == 'OK') {
                        $thehe_count = 0;
                        $thehe_lastid = 0;
                        for($i=count($thehe_choise)-1;$i>=1;$i--) {
                            if(strlen($thehe_choise[$i]) > 0) {
                                if($thehe_lastid == 0) $thehe_lastid = $i;
                                $thehe_count++;
                            }
                        }
                        $thehe_notice = "";
                        if($thehe_count > 1) {
                            $thehe_title = $thehe_choise[$thehe];
                            $thehe_notice = "Thế hệ : <b>$thehe_title</b><br>";
                        }

						$notice = "<center><b>Đăng kí thành công</b> :<br>
								Tài khoản : <b>$username</b><br>
                                $thehe_notice
								Mật khẩu Game : <b>$passgame</b><br>
								Mật khẩu Web cấp 1 : <b>$pass1</b>
							";
					}
					else { 
						$error = "<font color='red'>$show_reponse</font>"; 
					}
				}
            }
		} else $error = "<center><font color='red'>Dữ liệu lỗi - Mã kiểm tra không chính xác.</font></center>";
		
		if (isset($error)) {
          	$page_template = 'templates/register.tpl';
        }
	}
else {
	$page_template = 'templates/register.tpl';
}
?>