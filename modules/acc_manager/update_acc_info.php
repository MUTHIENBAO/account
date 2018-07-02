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

if (isset($_POST["update_acc_info"]))
	{
		$vImage->loadCodes();
		
		if($vImage->checkCode()) {
                $pass1 = $_POST['pass1'];
                $passgame = $_POST['passgame'];
                $pass2 = $_POST['pass2'];
                $email = $_POST['email'];
                $quest = $_POST['quest'];
                $ans = $_POST['ans'];
                $tel = $_POST['tel'];
                $sdt_length = strlen($tel);
				$sdt_check = substr($tel, 0, 2);
                $ip_client = get_ip();
    
			if (($pass1 == NULL) || ($passgame == NULL) || ($pass2 == NULL) || ($email == NULL) || ($quest == NULL) || ($ans == NULL) || ($tel == NULL)) { $error = "<font color='red'>Hãy điền đầy đủ tất cả các dữ liệu.</font><br>"; }
			elseif (!preg_match("/^[a-zA-Z0-9_]*$/i", $pass1))
				{
    				$error = "<font color='red'>Dữ liệu lỗi - Mật khẩu Web cấp 1 chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font><br>";
				}
			elseif (!preg_match("/^[a-zA-Z0-9_]*$/i", $passgame))
				{
    				$error = "<font color='red'>Dữ liệu lỗi - Mật khẩu Game chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font><br>";
				}
            elseif (!preg_match("/^[a-zA-Z0-9_]*$/i", $pass2))
				{
    				$error = "<font color='red'>Dữ liệu lỗi - Mật khẩu Web cấp 2 chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font><br>";
				}
			elseif (!preg_match("/^[1-9]*$/i", $quest))
				{
    				$error = "<font color='red'>Dữ liệu lỗi - Chưa chọn câu hỏi bí mật.</font>";
				}
			elseif (!preg_match("/^[a-zA-Z0-9_]*$/i", $ans))
				{
    				$error = "<font color='red'>Dữ liệu lỗi - Câu trả lời bí mật chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font><br>";
				}
            elseif (!preg_match("/^[0-9]*$/i", $tel))
				{
					$error = "<font color='red'>Dữ liệu lỗi - Số điện thoại chỉ là số (0-9).</font><br>";
				}
			elseif (!preg_match("/^[a-z0-9]+([_\\.-][a-z0-9]+)*@([a-z0-9]+([\.-][a-z0-9]+)*)+\\.[a-z]{2,6}$/i", $email)) {
				    $error = "<font color='red'>Dữ liệu lỗi : $email . Không đúng dạng địa chỉ Email. Xin vui lòng kiểm tra lại.</font><br>"; 
				}
			elseif ( $passgame == $pass1 ) {
				$error = "<font color='red'>Mật khẩu Game giống mật khẩu cấp 1</font><br>"; 
				}
			elseif ( $passgame == $pass2 ) {
				$error = "<font color='red'>Mật khẩu Game giống mật khẩu cấp 2</font><br>"; 
				}
			elseif ( $pass1 == $pass2 ) {
				$error = "<font color='red'>Mật khẩu cấp 1 giống mật khẩu cấp 2</font><br>"; 
				}
			elseif ( strlen($pass2) <4 || strlen($pass2) >32 ) {
				$error = "<font color='red'>Mật khẩu cấp 2 chỉ từ 4-32 kí tự</font><br>"; 
				}
			elseif ( strlen($ans) <4 || strlen($ans) >50 ) {
				$error = "<font color='red'>Câu trả lời bí mật chỉ từ 4-50 kí tự</font><br>"; 
				}
			elseif ( ($sdt_check == '09' && $sdt_length == 10) || ($sdt_check == '01' && $sdt_length == 11) ) {
                
                $getcontent_url = $server_url . "/sv_acc.php";
		        $getcontent_data = array(
		            'login'    =>  $_SESSION['mu_username'],
		            'pass1'    =>  md5($pass1),
                    'passgame'    =>  $passgame,
                    'pass2'    =>  $pass2,
		            'email'    =>  $email,
		            'quest'    =>  $quest,
		            'ans'    =>  $ans,
		            'tel'    =>  $tel,
                    
                    'pagesv'	=>	'sv_acc_update_acc_info',
                    'string_login'    =>  $_SESSION['checklogin'],
		            'passtransfer'    =>  $passtransfer
		        ); 
		        
		        $show_reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

				if ( empty($show_reponse) ) $notice = "<font color='red'>Server bảo trì.</font>";
				else {
					if ($show_reponse == 'OK') {
						
                        $_SESSION['acc_phone'] = substr($tel,-3);
                        $email_explode = explode('@', $email);
                        $email_view = substr($email_explode[0], 0, 3) ."******". substr($email_explode[0], -3) ."@". $email_explode[1];
                        $_SESSION['acc_email'] = $email_view;
                        
                        switch ($quest)
						{
							case 1: $quest_choise = "Tên cha của bạn là gì?";
								break;
							case 2: $quest_choise = "Tên ngôi trường đầu tiên của bạn là gì?";
								break;
							case 3: $quest_choise = "Người anh hùng trong thời thơ ấu của bạn là ai?";
								break;
							case 4: $quest_choise = "Khái niệm đẹp của bạn là gì?";
								break;
							case 5: $quest_choise = "Đội thể thao bạn thích nhất là đội nào?";
								break;
							case 6: $quest_choise = "Vật mang lại may mắn thời học sinh của bạn là gì?";
								break;
							case 7: $quest_choise = "Nơi bạn gặp vợ(chồng) của bạn nơi nào?";
								break;
							case 8: $quest_choise = "Tên con thú cưng của bạn là gì?";
								break;
						}

						$notice = "<center><b>Cập nhập thông tin tài khoản thành công</b> :<br>
                                Mật khẩu Game : <b>$passgame</b><br>
                                Mật khẩu Web 2 : <b>$pass2</b><br>
								Email đăng kí : <b>$email</b><br>
								Câu hỏi bí mật : <b>$quest_choise</b><br>
								Câu trả lời bí mật : <b>$ans</b><br>
								Số điện thoại : <b>$tel</b></center><hr>
							";
					}
					else { 
						$error = "<font color='red'>$show_reponse</font>"; 
					}
				}
            }
            else { $error = "<font color='red'>Số Điện thoại bắt buộc phải là Số ĐT di động.</font>"; }
		} else $error = "<center><font color='red'>Dữ liệu lỗi - Mã kiểm tra không chính xác.</font></center>";
		
		if (isset($error)) {
          	$page_template = 'templates/acc_manager/update_acc_info.tpl';
        }
	}
else {
	$page_template = 'templates/acc_manager/update_acc_info.tpl';
}
?>