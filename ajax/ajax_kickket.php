<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
$opd = $_GET['opd'];

if(strlen($opd) <= 0) {
    echo "Chưa nhập Mật khẩu OPD";
}
else if(!preg_match("/^[0-9]*$/i", $opd)) {
    echo "Mật khẩu OPD không hợp lệ";
}
else {
    $getcontent_url = $server_url . "/sv_kickket.php";
    $getcontent_data = array(
        'login'    =>  $_SESSION['mu_username'],
        'opd'   =>  $opd,
        
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
		echo $reponse;
	}
}

?>