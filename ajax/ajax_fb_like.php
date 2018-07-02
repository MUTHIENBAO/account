<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
include('config/config_facebook.php');

$action = $_GET['action'];

switch ($action){ 

    case 'like':
        $getcontent_url = $server_url . "/sv_fb.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'action'    =>  $action,
            
            'string_login'    =>  $_SESSION['checklogin'],
            'passtransfer'    =>  $passtransfer
        ); 
        
        $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

		if ( empty($reponse) ) $notice = "<font size='3' color='red'>Server bảo trì.</font>";
		elseif($reponse == "login_other") {
			$notice = "<font size='3' color='red'>Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.</font>";
			session_destroy();
		}
		else {
			if ( read_TagName($reponse, 'info', 1) == 'OK' ) {
                $_SESSION['fb_fanpage_like'] = 1;
                $notice = "|OK|Cám ơn bạn đã Like FanPage.<br />Bạn được <strong>giảm ". $fb_like_fanpage_decre_price ."% phí</strong> <strong>GCent</strong> hoặc <strong>VCent</strong> khi <strong>Reset VIP</strong>.|";
			}
			else $notice = $reponse;
		}
        
        echo $notice;
    break;
    
    case 'dislike':
        $getcontent_url = $server_url . "/sv_fb.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'action'    =>  $action,
            
            'string_login'    =>  $_SESSION['checklogin'],
            'passtransfer'    =>  $passtransfer
        ); 
        
        $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

		if ( empty($reponse) ) $notice = "<font size='3' color='red'>Server bảo trì.</font>";
		elseif($reponse == "login_other") {
			$notice = "<font size='3' color='red'>Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.</font>";
			session_destroy();
		}
		else {
			if ( read_TagName($reponse, 'info', 1) == 'OK' ) {
                $_SESSION['fb_fanpage_like'] = 0;
                $notice = "|OK|Thật buồn vì bạn đã không Like FanPage.<br />Bạn không được giảm ". $fb_like_fanpage_decre_price ."% phí GCent hoặc VCent khi Reset VIP.|";
			}
			else $notice = $reponse;
		}
        
        echo $notice;
    break;
    
}

?>