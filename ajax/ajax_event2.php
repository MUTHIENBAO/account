<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
include('config/config_event.php');

if(time() < strtotime($event2_begin)) {
    echo "Chưa đến thời gian tham gia Event.";
} else if(time() > strtotime($event2_end) + 24*60*60 - 1) {
    echo "Đã hết thời gian tham gia Event.";
} else {
    $action = $_GET['action'];
    
    switch ($action){ 
    	case 'event2_doi':
            $event_type = $_GET['event_type'];
            $phuongthuc = abs(intval($_GET['phuongthuc']));
            
            if($event_type == 'type1' || $event_type == 'type2' || $event_type == 'type3') {
                $getcontent_url = $server_url . "/event2.php";
                $getcontent_data = array(
                    'login'    =>  $_SESSION['mu_username'],
                    'name'    =>  $_SESSION['mu_nvchon'],
                    'action'    =>  'event2_doi',
                    'event_type'    =>  $event_type,
                    'phuongthuc' =>  $phuongthuc,
                    
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
                        $tyle = read_TagName($reponse, 'tyle', 1);
                        if($tyle == 0) {
                            echo '|Err|0|Không đủ Nguyên liệu đổi Event|';
                        } else {
                            $item_source_data = read_TagName($reponse, 'item_source_data', 1);
                            
                            $zen_update = '';
                            $gcoin_update = '';
                            $gcoin_km_update = '';
                            $gcoin_total = '';
                            
                            switch ($event_type){ 
                            	case 'type1':
                                    $event_name = "Loại 1";
                                    $zen_update = read_TagName($reponse, 'zen_update', 1);
                                        $zen_update = number_format($zen_update, 0, ',', '.');
                            	break;
                            
                            	case 'type2':
                                    $event_name = "Loại 2";
                            	break;
                            
                            	case 'type3':
                                    $event_name = "Loại 3";
                            	break;
                            }
                            
                            $msg = read_TagName($reponse, 'notice', 1);
                            
                            $gcoin = read_TagName($reponse, 'gcoin', 1);
                            $gcoin_km = read_TagName($reponse, 'gcoin_km', 1);
                            if( $_SESSION['acc_gcoin'] != $gcoin || $_SESSION['acc_gcoin_km'] != $gcoin_km ) {
                                $_SESSION['acc_gcoin'] = $gcoin;
                                $_SESSION['acc_gcoin_km'] = $gcoin_km;
                                
                                $gcoin_update = number_format($gcoin, 0, ',', '.');
                                $gcoin_km_update = number_format($gcoin_km, 0, ',', '.');
                                $gcoin_total = number_format($gcoin + $gcoin_km, 0, ',', '.');
                            }
                            
                            $_SESSION['acc_vpoint_km'] = read_TagName($reponse, 'vpoint_km', 1);
                            $_SESSION['WCoin'] = read_TagName($reponse, 'WCoin', 1);
                            $_SESSION['acc_ppoint'] = read_TagName($reponse, 'nbb_pl', 1);
                            $_SESSION['acc_ppoint_extra'] = read_TagName($reponse, 'nbb_pl_extra', 1);
                            
                            $dadoi_count = read_TagName($reponse, 'dadoi_count', 1);
                            
                            echo "|OK|$msg|$item_source_data|$zen_update|$gcoin_update|$gcoin_km_update|$gcoin_total|". number_format($_SESSION['acc_vpoint_km'], 0, ',', '.') ."|". number_format($_SESSION['WCoin'], 0, ',', '.') ."|". number_format($_SESSION['acc_ppoint'], 0, ',', '.') ."|". number_format($_SESSION['acc_ppoint_extra'], 0, ',', '.') ."|$dadoi_count|";
                        }
            		} else echo $reponse;
            	}
            } else {
                echo "Sai loại đổi thưởng $event_type - $phuongthuc";
            }
            
        break;
    }

}

?>