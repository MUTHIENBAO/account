<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");

include('config/config_lockitem.php');

    $getcontent_url = $server_url . "/sv_char.php";
    $getcontent_data = array(
        'login'    =>  $_SESSION['mu_username'],
        'name'    =>  $_SESSION['mu_nvchon'],
        'action'    =>  'list',
                
        'pagesv'	=>	'sv_char_lock_item',
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
		$info = explode('<nbb>',$reponse);
		if (isset($info[1]) && $info[1] == 'OK') {
			$listitem = $info[2];
            $listitem_arr = unserialize_safe($listitem);
            if(!is_array($listitem_arr)) {
                $error_module = $info[2];
            }
		}
		else $error_module = $reponse;
	}

$accept = 1;
if ($_SESSION['nv_online'] == 1 || $_SESSION['nv_doinv'] == 0 || ($_SESSION['acc_gcoin'] + $_SESSION['acc_gcoin_km'])<$lockitem_gcoin ) { $accept = 0; }

$page_template = "templates/char_manager/lock_item.tpl";
?>