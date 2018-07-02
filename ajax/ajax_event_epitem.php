<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 

$action = $_GET['action'];

switch ($action){ 
	case 'reg':
        $serial = $_GET['iserial'];
        
        if(!preg_match("/^[a-fA-F0-9]*$/i", $serial)) {
            echo "Serial không hợp lệ";
        }
        else if(strlen($serial) > 8) {
            echo "Serial chỉ tối đa 8 ký tự";
        }
        else {
            $getcontent_url = $server_url . "/sv_event.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $_SESSION['mu_nvchon'],
                'action'    =>  'regnew_item',
                'serial'    =>  $serial,
                
                'pagesv'          =>  'sv_event_epitem',
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
	break;

	case 'update':
        $serial = $_GET['iserial'];
        
        if(!preg_match("/^[a-fA-F0-9]*$/i", $serial)) {
            echo "Serial không hợp lệ";
        }
        else if(strlen($serial) > 8) {
            echo "Serial chỉ tối đa 8 ký tự";
        }
        else {
            $getcontent_url = $server_url . "/sv_event.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $_SESSION['mu_nvchon'],
                'action'    =>  'update',
                'serial'    =>  $serial,
                
                'pagesv'          =>  'sv_event_epitem',
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
	break;
}



?>