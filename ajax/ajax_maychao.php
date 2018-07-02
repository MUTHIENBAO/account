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
	case 'xoay_longcondor':
        $getcontent_url = $server_url . "/sv_maychao.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'name'    =>  $_SESSION['mu_nvchon'],
            'action'    =>  'longcondor_quay',
            
            'pagesv'	=>	'sv_longcondor',
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
                $success = read_TagName($reponse, 'success', 1);
                switch ($success){ 
                	case 0:
                        $msg = "Item bị thay đổi. Vui lòng load lại chức năng để cập nhập Item mới.";
                	break;
                
                	case 1:
                        $msg = "Ép thành công. Đã nhận được 1 Lông Vũ Condor.";
                	break;
                
                	case 2:
                        $msg = "Ép Lông vũ Condor thất bại. Toàn bộ Item bị mất.";
                	break;
                }
                echo "|OK|$success|$msg|";
        	} else echo $reponse;
        }
    break;
    
    case 'trader_quay':
        $file_config = 'config/config_maychao.txt';
        // Read MayChao Config
        $maychao_arr = _json_fileload('config/config_maychao.txt');
        // Read MayChao Config End
        $trader_arr = $maychao_arr['trader'];
        
        $item = $_GET['item'];
        $tyle = $_GET['tyle'];
        
        $getcontent_url = $server_url . "/sv_maychao.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'name'    =>  $_SESSION['mu_nvchon'],
            'action'    =>  'trader_quay',
            'item'    =>  $item,
            'tyle'    =>  $tyle,
            
            'pagesv'	=>	'sv_trader_item',
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
                $success = read_TagName($reponse, 'success', 1);
                switch ($success){ 
                	case 0:
                        $msg = "Item bị thay đổi. Vui lòng load lại chức năng để cập nhập Item mới.";
                	break;
                
                	case 1:
                        $msg = "Ép thành công.";
                	break;
                
                	case 2:
                        $msg = "Ép thất bại. Toàn bộ Item bị mất.";
                	break;
                }
                echo "|OK|$success|$msg|";
        	} else echo $reponse;
        }
    break;
}





?>