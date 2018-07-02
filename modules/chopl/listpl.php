<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
    
    // Chon The he
    if ($thehe_choise)
    {
        if(!isset($_SESSION['thehe'])) $_SESSION['thehe'] = count($thehe_choise)-1;
        if(isset($_GET['thehe'])) $_SESSION['thehe'] = abs(intval($_GET['thehe']));
        $theheid = $_SESSION['thehe'];
    }
    
    $getcontent_url = $server_url . "/sv_chopl.php";
    $getcontent_data = array(
        'login'    =>  $_SESSION['mu_username'],
        'action'    =>  'listpl',
        
        'string_login'    =>  $_SESSION['checklogin'],
        'passtransfer'    =>  $passtransfer
    );
    
    $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

	if ( empty($reponse) ) $error_module = "Server bảo trì.";
	elseif($reponse == "login_other") {
		$error_module = "<font size='3' color='red'>Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.</font>";
		session_destroy();
	}
	else {
		$info = read_TagName($reponse, 'info', 1);
		if ($info == 'OK') {
			$listpl_data = read_TagName($reponse, 'listpl_data', 1);
            $listpl_arr = json_decode($listpl_data, true);
		}
		else $error_module = $reponse;
	}
    
$page_template = "templates/chopl/listpl.tpl";
?>