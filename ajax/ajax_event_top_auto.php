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
    
    case 'nhanthuong':
        $event_type = $_GET['event_type'];
        $event_date = $_GET['event_date'];
        
        $getcontent_url = $server_url . "/sv_event.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'name'    =>  $_SESSION['mu_nvchon'],
            'type'    =>  $event_type,
            'date'    =>  $event_date,
            
            'action'    =>  'nhanthuong',
            'pagesv'	=>	'sv_event_top_auto',
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
                $bank_data = read_TagName($reponse, 'bank_data', 1);
                if(strlen($bank_data) > 2) {
                    $bank_arr = json_decode($bank_data, true);
                    $_SESSION['acc_gcoin_km'] = $bank_arr['gcoin_km'];
                    $_SESSION['acc_vpoint_km'] = $bank_arr['vpoint_km'];
                    $_SESSION['acc_zen'] = $bank_arr['bank'];
                    $_SESSION['acc_ppoint_extra'] = $bank_arr['nbb_pl_extra'];
                    
                    $_SESSION['acc_chao'] = $bank_arr['jewel_chao'];
                    $_SESSION['acc_cre'] = $bank_arr['jewel_cre'];
                    $_SESSION['acc_blue'] = $bank_arr['jewel_blue'];
                }
                
                $buff_data = read_TagName($reponse, 'buff_data', 1);
                if(strlen($buff_data) > 2) {
                    $buff_arr = json_decode($buff_data, true);
                    $_SESSION['SCFSealItem'] = $bank_arr['SCFSealItem'];
                    $_SESSION['SCFSealTime'] = $bank_arr['SCFSealTime'];
                }
                
                // Update Session Event
                $string_key = "event_top_auto_". $event_type ."_". $event_date;
                $time_receive = read_TagName($reponse, 'time_receive', 1);
                $_SESSION[$string_key] = $time_receive;
                //==> Update Session Event End
                
                $bank_view_arr = array(
                    'gcoin_km'  =>  number_format($_SESSION['acc_gcoin_km'], 0, ',', '.'),
                    'vpoint_km'  =>  number_format($_SESSION['acc_vpoint_km'], 0, ',', '.'),
                    'bank'  =>  number_format($_SESSION['acc_zen'], 0, ',', '.'),
                    'nbb_pl_extra'  =>  number_format($_SESSION['acc_ppoint_extra'], 0, ',', '.'),
                    'jewel_chao'  =>  number_format($_SESSION['acc_chao'], 0, ',', '.'),
                    'jewel_cre'  =>  number_format($_SESSION['acc_cre'], 0, ',', '.'),
                    'jewel_blue'  =>  number_format($_SESSION['acc_blue'], 0, ',', '.')
                );
                $bank_view_data = json_encode($bank_view_arr);

                $msg = read_TagName($reponse, 'msg', 1);
                echo "|OK|$msg|$bank_view_data|";
    		} else echo $reponse;
    	}
	break;
}



?>