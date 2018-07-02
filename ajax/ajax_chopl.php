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
	case 'banpl':
        $plpoint_ban = abs(intval($_GET['plpoint_ban']));
        $plpoint_vpoint = abs(intval($_GET['plpoint_vpoint']));
        
        if($plpoint_ban <= 0) {
            echo "<strong>Điểm Phúc Lợi</strong> cần bán phải lớn hơn 0.";
        } elseif($plpoint_vpoint <= 0) {
            echo "<strong>Giá bán</strong> Điểm Phúc Lợi phải lớn hơn 0.";
        } else {
            $getcontent_url = $server_url . "/sv_chopl.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $_SESSION['mu_nvchon'],
                'action'    =>  'banpl',
                'plpoint_ban'    =>  $plpoint_ban,
                'plpoint_vpoint'    =>  $plpoint_vpoint,
                
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
                    $plnew = read_TagName($reponse, 'plnew', 1);
                    $msg = read_TagName($reponse, 'msg', 1);
                    echo "|OK|$plnew|$msg|";
        		} else echo $reponse;
        	}
        }
	break;

	case 'muapl':
        $store_id = abs(intval($_GET['store_id']));
        
        $getcontent_url = $server_url . "/sv_chopl.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'name'    =>  $_SESSION['mu_nvchon'],
            'action'    =>  'muapl',
            'store_id'    =>  $store_id,
            
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
                $vpoint = read_TagName($reponse, 'vpoint', 1);
                $msg = read_TagName($reponse, 'msg', 1);
                
                $_SESSION['acc_vpoint'] = $vpoint;
                echo "|OK|$msg|";
    		} else echo $reponse;
    	}
        
    break;
    
    case 'huyban':
        $store_id = abs(intval($_GET['store_id']));
        
        $getcontent_url = $server_url . "/sv_chopl.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'name'    =>  $_SESSION['mu_nvchon'],
            'action'    =>  'huyban',
            'store_id'    =>  $store_id,
            
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
                $plpoint = read_TagName($reponse, 'plpoint', 1);
                $msg = read_TagName($reponse, 'msg', 1);
                
                echo "|OK|$msg|$plpoint|";
    		} else echo $reponse;
    	}
        
    break;
    
}



?>