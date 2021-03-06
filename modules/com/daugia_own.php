<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");

if(isset($_GET['type'])) {
    $type = $_GET['type'];
} else {
    $type = 0;
}


switch ($type){ 
	case 1:    $action = "bid_own_finish";
	break;

	case 2:    $action = "bid_own_unfinish";
	break;

	default :    $action = "bid_own_bidding";
}

$getcontent_url = $server_url . "/sv_com.php";
$getcontent_data = array(
    'login'    =>  $_SESSION['mu_username'],
    'name'    =>  $_SESSION['mu_nvchon'],
    'action'    =>  $action,
            
    'pagesv'	=>	'sv_com_daugia',
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
	if ($info[1] == 'OK') {
		$listitem = $info[2];
        $listitem_arr = unserialize_safe($listitem);
        if(!is_array($listitem_arr)) {
            $error_module = $info[2];
            $listitem_arr = array();
        }
	}
	else $error_module = $reponse;
}

$page_template = "templates/com/daugia_own.tpl";
    
?>