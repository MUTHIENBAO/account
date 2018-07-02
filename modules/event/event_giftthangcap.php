<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");

if(isset($event_giftthangcap_on) && $event_giftthangcap_on == 1) {
    // Read Event Config
    $giftthangcap_arr = _json_fileload('config/event_giftthangcap.txt');
    // Read Event Config End
    
    include('config/config_relife.php');
    
    $getcontent_url = $server_url . "/event_gift_thangcap.php";
    $getcontent_data = array(
        'login'    =>  $_SESSION['mu_username'],
        'name'    =>  $_SESSION['mu_nvchon'],
        
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
            $thuchien_rs = read_TagName($reponse, 'thuchien_rs', 1);
            $gift_danhan = read_TagName($reponse, 'gift_danhan', 1);
            $gift_danhan_arr = json_decode($gift_danhan, true);
		} else echo $reponse;
	}
    
    $reset_all = 0;
    for($i=0; $i<= $_SESSION['nv_relife']; $i++) {
        $reset_all += $rl_reset_relife[$i];
    }
    $reset_all += $_SESSION['nv_reset'];
    
    $page_template = "templates/event/event_giftthangcap.tpl";
} else {
    echo "<div class='form-error'>Event chưa bật.</div>";
}

?>