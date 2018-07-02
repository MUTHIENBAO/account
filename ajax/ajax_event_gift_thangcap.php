<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
include('config/config_event.php');


$action = $_GET['action'];

switch ($action){ 
	case 'nhanthuong':
        $gift_rs = $_GET['gift_rs'];
        
        $getcontent_url = $server_url . "/event_gift_thangcap.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'name'    =>  $_SESSION['mu_nvchon'],
            'action'    =>  'nhanthuong',
            'gift_rs'    =>  $gift_rs,
            
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

                $msg = read_TagName($reponse, 'notice', 1);
                $dataupdate = read_TagName($reponse, 'dataupdate', 1);
                $dataupdate_arr = json_decode($dataupdate, true);
                
                if($dataupdate_arr['gcent_km'] > 0) {
                    $_SESSION['acc_gcoin_km'] = $_SESSION['acc_gcoin_km'] + $dataupdate_arr['gcent_km'];
                }
                if($dataupdate_arr['vcent_km'] > 0) {
                    $_SESSION['acc_vpoint_km'] = $_SESSION['acc_vpoint_km'] + $dataupdate_arr['vcent_km'];
                }
                if($dataupdate_arr['zen'] > 0) {
                    $_SESSION['acc_zen'] = $_SESSION['acc_zen'] + $dataupdate_arr['zen'];
                }
                if($dataupdate_arr['chao'] > 0) {
                    $_SESSION['acc_chao'] = $_SESSION['acc_chao'] + $dataupdate_arr['chao'];
                }
                if($dataupdate_arr['cre'] > 0) {
                    $_SESSION['acc_cre'] = $_SESSION['acc_cre'] + $dataupdate_arr['cre'];
                }
                if($dataupdate_arr['blue'] > 0) {
                    $_SESSION['acc_blue'] = $_SESSION['acc_blue'] + $dataupdate_arr['blue'];
                }
                if($dataupdate_arr['pp_extra'] > 0) {
                    $_SESSION['acc_ppoint_extra'] = $_SESSION['acc_ppoint_extra'] + $dataupdate_arr['pp_extra'];
                }
                if($dataupdate_arr['warehouse_secure'] > 0) {
                    $_SESSION['acc_warehouse_secure_slot'] = $_SESSION['acc_warehouse_secure_slot'] + $dataupdate_arr['warehouse_secure'];
                }
                
                $ajax_update_arr['acc_gcoin_km'] = number_format($_SESSION['acc_gcoin_km'], 0, ',', '.');
                $ajax_update_arr['acc_vpoint_km'] = number_format($_SESSION['acc_vpoint_km'], 0, ',', '.');
                $ajax_update_arr['acc_zen'] = number_format($_SESSION['acc_zen'], 0, ',', '.');
                $ajax_update_arr['acc_chao'] = number_format($_SESSION['acc_chao'], 0, ',', '.');
                $ajax_update_arr['acc_cre'] = number_format($_SESSION['acc_cre'], 0, ',', '.');
                $ajax_update_arr['acc_blue'] = number_format($_SESSION['acc_blue'], 0, ',', '.');
                $ajax_update_arr['acc_ppoint_extra'] = number_format($_SESSION['acc_ppoint_extra'], 0, ',', '.');
                $ajax_update_arr['acc_warehouse_secure_slot'] = number_format($_SESSION['acc_warehouse_secure_slot'], 0, ',', '.');
                
                $ajax_update = json_encode($ajax_update_arr);
                
                echo "|OK|$msg|$ajax_update|";
    		} else echo $reponse;
    	}
        
    break;
}

?>