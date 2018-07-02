<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 

$vitri = $_GET['vitri'];
$serial = $_GET['serial'];
$item_lvl = $_GET['item_lvl'];

$getcontent_url = $server_url . "/sv_maychao.php";
$getcontent_data = array(
    'login'    =>  $_SESSION['mu_username'],
    'name'    =>  $_SESSION['mu_nvchon'],
    'action'    =>  'ch_up',
    'vitri'  =>  $vitri,
    'serial'  =>  $serial,
    'item_lvl'  =>  $item_lvl,
    
    'pagesv'	=>	'sv_cuonghoa',
    'string_login'    =>  $_SESSION['checklogin'],
    'passtransfer'    =>  $passtransfer
);

$reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

if ( empty($reponse) ) $error_module = "Server bảo trì.";
elseif($reponse == "login_other") {
	$error_module = "Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.";
	session_destroy();
}
else {
	if ( read_TagName($reponse, 'info', 1) == 'OK' ) {
        $ch_info = read_TagName($reponse, 'ch_info', 1);
        $ch_arr = json_decode($ch_info, true);
        
        $_SESSION['acc_ppoint'] = $ch_arr['pp'];
        $_SESSION['acc_ppoint_extra'] = $ch_arr['pp_extra'];
        
        echo "|OK|$ch_info|";
	} else echo $reponse;
}



?>