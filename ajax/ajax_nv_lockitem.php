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
	case 'lock':
        $serial = $_GET['iserial'];
        $vitri = $_GET['vitri'];
        $opd = $_GET['opd'];
        
        if(!preg_match("/^[0-9]*$/i", $opd)) {
            echo "Mật khẩu OPD không hợp lệ";
        }
        else if(!preg_match("/^[a-fA-F0-9]*$/i", $serial)) {
            echo "Serial không hợp lệ";
        }
        else if(strlen($serial) > 8) {
            echo "Serial chỉ tối đa 8 ký tự";
        }
        else {
            $getcontent_url = $server_url . "/sv_char.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $_SESSION['mu_nvchon'],
                'action'    =>  'lock',
                'serial'    =>  $serial,
                'opd'   =>  $opd,
                'vitri' =>  $vitri,
                
                'pagesv'	=>	'sv_char_lock_item',
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
                    $_SESSION['acc_gcoin'] = read_TagName($reponse, 'gcoin', 1);
                    $_SESSION['acc_gcoin_km'] = read_TagName($reponse, 'gcoinkm', 1);
                    echo "|OK|". $_SESSION['acc_gcoin'] ."|". $_SESSION['acc_gcoin_km'] ."|";
        		} else echo $reponse;
        	}
        }
	break;

	case 'unlock':
        $vitri = $_GET['vitri'];
        $opd = $_GET['opd'];
        
        if(!preg_match("/^[a-fA-F0-9]*$/i", $serial)) {
            echo "Serial không hợp lệ";
        }
        else if(strlen($serial) > 8) {
            echo "Serial chỉ tối đa 8 ký tự";
        }
        else {
            $getcontent_url = $server_url . "/sv_char.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $_SESSION['mu_nvchon'],
                'action'    =>  'unlock',
                'opd'   =>  $opd,
                'vitri' =>  $vitri,
                
                'pagesv'	=>	'sv_char_lock_item',
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
                    echo "OK";
        		} else echo $reponse;
        	}
        }
	break;
}



?>