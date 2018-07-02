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
	if ($action == 'khoaitem')
	{
		$makhoado = $_POST['makhoado'];
		$remakhoado = $_POST['remakhoado'];
		
		
		if (empty($makhoado))
		{
			$notice = "Chưa nhập mã khóa";
		}
		elseif (preg_match("/[^a-zA-Z0-9_$]/", $makhoado))
			{
				$notice = "<font size='4' color='red'>Dữ liệu lỗi -Mã khóa đồ chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font>";
			}
		elseif (empty($remakhoado))
		{
			$notice = "Chưa nhập lại mã khóa";
		}
		elseif (preg_match("/[^a-zA-Z0-9_$]/", $remakhoado))
			{
				$notice = "<font size='4' color='red'>Dữ liệu lỗi - Nhập lại Mã Khóa Đồ chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font>";
			}
		elseif ( $makhoado != $remakhoado )
			{
				$notice = "<font size='4' color='red'>Dữ liệu lỗi - Mã khóa đồ và Nhập lại mã khóa đồ không giống nhau.</font>";
			}
		else {
			
			$getcontent_url = $server_url . "/sv_char.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $_SESSION['mu_nvchon'],
                'action'    =>  'khoado',
                'makhoado'    =>  $makhoado,
                
                'pagesv'	=>	'sv_char_khoaitem',
                'string_login'    =>  $_SESSION['checklogin'],
                'passtransfer'    =>  $passtransfer
            ); 
            
            $notice = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

			if ( empty($notice) ) $notice = "<font size='3' color='red'>Server bảo trì.</font>";
			elseif($notice == "login_other") {
				$notice = "<font size='3' color='red'>Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.</font>";
				session_destroy();
			} else {
			     if(read_TagName($notice, 'info', 1) == 'OK')
                 {
                    $_SESSION['nv_khoado'] = 1;
                    $notice = read_TagName($notice, 'msg', 1);
                 }
			}
		}
	}
	
	if ($action == 'mokhoaitem')
	{
		$makhoado = $_POST['makhoado'];

		if (empty($makhoado))
		{
			$notice = "Chưa nhập mã khóa";
		}
		elseif (preg_match("/[^a-zA-Z0-9_$]/", $makhoado))
			{
				$notice = "<font size='4' color='red'>Dữ liệu lỗi -Mã khóa đồ chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font>";
			}
		else {
			
			$getcontent_url = $server_url . "/sv_char.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $_SESSION['mu_nvchon'],
                'action'    =>  'mokhoado',
                'makhoado'    =>  $makhoado,
                
                'pagesv'	=>	'sv_char_khoaitem',
                'string_login'    =>  $_SESSION['checklogin'],
                'passtransfer'    =>  $passtransfer
            ); 
            
            $notice = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

			if ( empty($notice) ) $notice = "<font size='3' color='red'>Server bảo trì.</font>";
            elseif($notice == "login_other") {
				$notice = "<font size='3' color='red'>Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.</font>";
				session_destroy();
			} else {
			     if(read_TagName($notice, 'info', 1) == 'OK')
                 {
                    $_SESSION[nv_khoado] = 0;
                    $notice = read_TagName($notice, 'msg', 1);
                 }
			}
		}

		echo "<fieldset>
			<legend>Kết quả</legend>
			<center><font color='red'>$notice</font></center>
			</fieldset>";
	}
	
	if ($action == 'editmakhoa')
	{
		$pass2 = $_POST['pass2'];
		$makhoado = $_POST['makhoado'];
		$remakhoado = $_POST['remakhoado'];
		
		
		if (empty($pass2))
		{
			$notice = "Chưa nhập mật khẩu Cấp 2";
		}
		elseif (preg_match("/[^a-zA-Z0-9_$]/", $pass2))
			{
				$notice = "<font size='4' color='red'>Dữ liệu lỗi - Mật khẩu Cấp 2 chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font>";
			}
		elseif (empty($makhoado))
		{
			$notice = "Chưa nhập mã khóa";
		}
		elseif (preg_match("/[^a-zA-Z0-9_$]/", $makhoado))
			{
				$notice = "<font size='4' color='red'>Dữ liệu lỗi -Mã khóa đồ chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font>";
			}
		elseif (empty($remakhoado))
		{
			$notice = "Chưa nhập lại mã khóa";
		}
		elseif (preg_match("/[^a-zA-Z0-9_$]/", $remakhoado))
			{
				$notice = "<font size='4' color='red'>Dữ liệu lỗi - Nhập lại Mã Khóa Đồ chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font>";
			}
		elseif ( $makhoado != $remakhoado )
			{
				$notice = "<font size='4' color='red'>Dữ liệu lỗi - Mã khóa đồ và Nhập lại mã khóa đồ không giống nhau.</font>";
			}
		else {
			
			$getcontent_url = $server_url . "/sv_char.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $_SESSION['mu_nvchon'],
                'action'    =>  'editmakhoa',
                'pass2'    =>  $pass2,
                'makhoado'    =>  $makhoado,
                
                'pagesv'	=>	'sv_char_khoaitem',
                'string_login'    =>  $_SESSION['checklogin'],
                'passtransfer'    =>  $passtransfer
            ); 
            
            $notice = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

			if ( empty($notice) ) $notice = "<font size='3' color='red'>Server bảo trì.</font>";
            elseif($notice == "login_other") {
				$notice = "<font size='3' color='red'>Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.</font>";
				session_destroy();
			} else {
    		     if(read_TagName($notice, 'info', 1) == 'OK')
                 {
                    $notice = read_TagName($notice, 'msg', 1);
                 }
			}
		}
		echo "<fieldset>
			<legend>Kết quả</legend>
			<center><font color='red'>$notice</font></center>
			</fieldset>";
	}
}

$accept = 1;
if ($_SESSION['nv_online'] == 1 || $_SESSION['nv_doinv'] == 0 ) { $accept = 0; }

$page_template = "templates/char_manager/khoaitem.tpl";
?>