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

$getcontent_url = $server_url . "/sv_maychao.php";
$getcontent_data = array(
    'login'    =>  $_SESSION['mu_username'],
    'name'    =>  $_SESSION['mu_nvchon'],
    'action'    =>  'hh_up',
    'vitri'  =>  $vitri,
    'serial'  =>  $serial,
    
    'pagesv'	=>	'sv_hoanhaohoa',
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
        $hh_info = read_TagName($reponse, 'hh_info', 1);

        echo "|OK|$hh_info|";
	} else echo $reponse;
}



?>