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
	case 'update':
        $getcontent_url = $server_url . "/sv_char.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'name'    =>  $_SESSION['mu_nvchon'],
            'action'    =>  'update',
            
            'pagesv'	=>	'sv_char_songtu',
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
                $songtu_info = read_TagName($reponse, 'songtu_info', 1);
                echo "|OK|$songtu_info|";
    		} else echo $reponse;
    	}
	break;

	case 'thangcap':
        
            $getcontent_url = $server_url . "/sv_char.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $_SESSION['mu_nvchon'],
                'action'    =>  'thangcap',
                
                'pagesv'	=>	'sv_char_songtu',
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
                    $songtu_info = read_TagName($reponse, 'songtu_info', 1);
                    $songtu_info_arr = json_decode($songtu_info, true);
                    
                    if($songtu_info_arr['tangcap'] == 0) { // Thang cap that bai
                        $songtu_info_arr['msg'] = "Thăng cấp thất bại.<br />Nhận được <strong>". $songtu_info_arr['cp_rand'] ." điểm Chúc Phúc</strong>.<br />Sử dụng 1 Trái Tim, còn lại ". $songtu_info_arr['heart'] ." Trái Tim.";
                    } else {    // Thang cap thanh cong
                        $songtu_info_arr['msg'] = "Thăng cấp thành công <strong>Song Tu</strong> lên cấp <strong>". $songtu_info_arr['songtu_lv'] ."</strong>.<br />Khi thực hiện Reset sẽ nhận được thêm <strong>". $songtu_info_arr['songtu_point_percent'] ." % Point</strong>.";
                        
                    }
                    
                    $songtu_info = json_encode($songtu_info_arr);
                    echo "|OK|$songtu_info|";
        		} else echo $reponse;
        	}
    break;
    
    case 'gift_stpoint':
        $gift_stpoint = abs(intval($_GET['gift_stpoint']));
        if($gift_stpoint <= 0) {
            echo "Điểm Song Tu muốn tặng phải lớn hơn 0";
        } else {
            $getcontent_url = $server_url . "/sv_char.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $_SESSION['mu_nvchon'],
                'action'    =>  'gift_stpoint',
                'gift_stpoint'  =>  $gift_stpoint,
                
                'pagesv'	=>	'sv_char_songtu',
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
                    $gift_info = read_TagName($reponse, 'gift_info', 1);

                    echo "|OK|$gift_info|";
        		} else echo $reponse;
        	}
        }
    break;
}



?>