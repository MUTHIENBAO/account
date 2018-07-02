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
    case 'warehouse_move':
        $warehouse_type = $_GET['warehouse_type'];     $warehouse_type = abs(intval($warehouse_type));
        $itemcode = $_GET['itemcode'];
        $time_gui = $_GET['time_gui'];                  $time_gui = abs(intval($time_gui));
        $opd = $_GET['opd'];
        
        if($warehouse_type == 0 && $_SESSION['acc_warehouse_secure_item'] >= $_SESSION['acc_warehouse_secure_slot']) {
            echo "Rương đồ An toàn đã đầy. Không thể cất thêm.";
        } else {
            $getcontent_url = $server_url . "/sv_acc.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'action'    =>  'warehouse_move',
                'warehouse_type'    =>  $warehouse_type,
                'itemcode'    =>  $itemcode,
                'time_gui'    =>  $time_gui,
                'opd'    =>  $opd,
                
                'pagesv'    =>  'sv_acc_warehouse_secure',
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
        		$reponse_split = explode('|', $reponse);
                if($reponse_split[1] == 'OK') {
                    if($warehouse_type == 0) {
                        $_SESSION['acc_warehouse_secure_item']++;
                    } else {
                        $_SESSION['acc_warehouse_secure_item']--;
                    }
                    
                    $warehouse_secure_slot_empty = $_SESSION['acc_warehouse_secure_slot'] - $_SESSION['acc_warehouse_secure_item'];
                    
                    $reponse .= $_SESSION['acc_warehouse_secure_item'] .'|'. $warehouse_secure_slot_empty .'|';
                }
                
                echo $reponse;
        	}
        }
            
    break;
    
    case 'warehouse_buy':
        $opd = $_GET['opd'];
        
        $getcontent_url = $server_url . "/sv_acc.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'action'    =>  'warehouse_buy',
            'opd'    =>  $opd,
            
            'pagesv'    =>  'sv_acc_warehouse_secure',
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
    		$reponse_split = explode('|', $reponse);
            if($reponse_split[1] == 'OK') {
                $_SESSION['acc_warehouse_secure_slot']++;
                $_SESSION['acc_gcoin'] = $reponse_split[2];
				$_SESSION['acc_gcoin_km'] = $reponse_split[3];
				$_SESSION['acc_vpoint'] = $reponse_split[4];
                $_SESSION['acc_vpoint_km'] = $reponse_split[5];
                
                $reponse = '|OK|'. $_SESSION['acc_warehouse_secure_slot'] .'|'. number_format($_SESSION['acc_gcoin'], 0, ',', '.') .'|'. number_format($_SESSION['acc_gcoin_km'], 0, ',', '.') .'|'. number_format($_SESSION['acc_vpoint'], 0, ',', '.') .'|'. number_format($_SESSION['acc_vpoint_km'], 0, ',', '.') .'|';
            }
            
            echo $reponse;
    	}
    break;
    
}

        

?>