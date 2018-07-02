<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 

$getcontent_url = $server_url . "/sv_acc.php";
$getcontent_data = array(
    'login'    =>  $_SESSION['mu_username'],
    'name'    =>  $_SESSION['mu_nvchon'],
    
    'pagesv'	=>	'sv_acc_vip',
    'string_login'    =>  $_SESSION['checklogin'],
    'passtransfer'    =>  $passtransfer
);

$reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

if ( empty($reponse) ) $notice = "Server bảo trì.";
elseif($reponse == "login_other") {
	$notice = "Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.";
	session_destroy();
}
else {
	$reponse_explode = explode('|', $reponse);
    if($reponse_explode[1] == 'OK') {
        $_SESSION['acc_gcoin'] = $reponse_explode[3];
        $_SESSION['nbb_vip'] = 1;
        $_SESSION['nbb_vip_lv'] = $reponse_explode[8];
        $_SESSION['nbb_vip_time'] = $reponse_explode[4];
        $_SESSION['nbb_vip_time_used'] = $reponse_explode[7];
        $_SESSION['SCFSealItem'] = 6700;
        $_SESSION['SCFSealTime'] = $reponse_explode[6];
    }
    
    echo $reponse;
}


?>