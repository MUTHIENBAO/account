<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
include('config/config_tuluyen.php');

$action = $_GET['action'];

switch ($action){ 
	case 'money_change':
        $tl_exp = $_GET['tl_exp'];
        $money = $tl_exp * $tl_vip_money_price;
        
        echo $money;
    break;
    
    case 'update':
        $tltype = $_GET['tltype'];
        $tl_exp = $_GET['tl_exp'];
        
        if(in_array($tltype, array('str', 'agi', 'vit', 'ene', 'random'))) {
            $getcontent_url = $server_url . "/sv_char.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $_SESSION['mu_nvchon'],
                'action'    =>  'update',
                'tltype'    =>  $tltype,
                'tl_exp'    =>  $tl_exp,
                
                'pagesv'	=>	'sv_char_tuluyen',
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
                    $tuluyen_info = read_TagName($reponse, 'tuluyen_info', 1);
                    
                    $tuluyen_arr = json_decode($tuluyen_info, true);
                    if(strlen($tuluyen_arr['pp']) > 0) $_SESSION['acc_ppoint'] = $tuluyen_arr['pp'];
                    if(strlen($tuluyen_arr['pp_extra']) > 0) $_SESSION['acc_ppoint_extra'] = $tuluyen_arr['pp_extra'];
                    
                    if(strlen($tuluyen_arr['vpoint_km']) > 0) $_SESSION['acc_vpoint_km'] = $tuluyen_arr['vpoint_km'];
                    if(strlen($tuluyen_arr['gcoin_km']) > 0) $_SESSION['acc_gcoin_km'] = $tuluyen_arr['gcoin_km'];
                    if(strlen($tuluyen_arr['vpoint']) > 0) $_SESSION['acc_vpoint'] = $tuluyen_arr['vpoint'];
                    if(strlen($tuluyen_arr['gcoin']) > 0) $_SESSION['acc_gcoin'] = $tuluyen_arr['gcoin'];
                    
                    echo "|OK|$tuluyen_info|";
        		} else echo $reponse;
        	}
        } else {
            echo "Dữ liệu tu luyện không đúng.";
        }
	break;

	case 'thangcap':
        $tltype = $_GET['tltype'];
        
        if(in_array($tltype, array('str', 'agi', 'vit', 'ene'))) {
            $getcontent_url = $server_url . "/sv_char.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $_SESSION['mu_nvchon'],
                'action'    =>  'thangcap',
                'tltype'    =>  $tltype,
                
                'pagesv'	=>	'sv_char_tuluyen',
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
                    $tuluyen_info = read_TagName($reponse, 'tuluyen_info', 1);
                    $tuluyen_info_arr = json_decode($tuluyen_info, true);
                    
                    if($tuluyen_info_arr['tangcap'] == 0) { // Thang cap that bai
                        $tuluyen_info_arr['msg'] = "Thăng cấp thất bại.<br />Chúc phúc tăng lên <strong>". $tuluyen_info_arr['tlcp'] ." %</strong>.<br />Chúc phúc đạt 100% sẽ thăng cấp thành công.<br />Sử dụng 1 Chao, còn lại ". $tuluyen_info_arr['chao'] ." Chao.";
                    } else {    // Thang cap thanh cong
                        switch ($tltype){ 
                        	case 'str':
                                $type_name = "Sức mạnh";
                        	break;
                        
                        	case 'agi':
                                $type_name = "Nhanh nhẹn";
                        	break;
                        
                        	case 'vit':
                                $type_name = "Thể lực";
                        	break;
                        
                        	case 'ene':
                                $type_name = "Năng lượng";
                        	break;
                        
                        	default :
                                echo "Dữ liệu tu luyện sai."; exit();
                        }
                        
                        $tl_percent_new = floor(($tuluyen_info_arr['tl_exp'] * 100) / $tuluyen_info_arr['tl_exp_next']);
                        if($tl_percent_new > 100) $tl_percent_new = 100;
                        $tuluyen_info_arr['tl_percent_new'] = $tl_percent_new;
                        
                        $tuluyen_info_arr['msg'] = "Thăng cấp thành công <strong>$type_name</strong> lên cấp <strong>". $tuluyen_info_arr['tl_cap'] ."</strong>.<br />Khi thực hiện Reset sẽ nhận được thêm <strong>". $tuluyen_info_arr['tl_point'] ." Điểm $type_name</strong>.";
                        
                    }
                    
                    $tuluyen_info = json_encode($tuluyen_info_arr);
                    echo "|OK|$tuluyen_info|";
        		} else echo $reponse;
        	}
        } else {
            echo "Dữ liệu tu luyện không đúng.";
        }
    break;
}



?>