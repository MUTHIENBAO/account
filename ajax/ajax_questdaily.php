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
	case 'plchange':
        $pl_point_to = $_GET['pl_point_to'];
        $pl_point_change = abs(intval($_GET['pl_point_change']));
        
        $getcontent_url = $server_url . "/sv_char.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'name'    =>  $_SESSION['mu_nvchon'],
            'action'    =>  'plchange',
            'pl_point_to'    =>  $pl_point_to,
            'pl_point_change' =>  $pl_point_change,
            
            'pagesv'	=>	'sv_char_questdaily',
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
                $plpoint = read_TagName($reponse, 'pl', 1);
                $msg = read_TagName($reponse, 'msg', 1);
                echo "|OK|$plpoint|$msg|";
    		} else echo $reponse;
    	}
    break;
    
    case 'nhanthuong':
        $qindex = abs(intval($_GET['qindex']));
        
        if($qindex > 0 && $qindex <=49) {
            $getcontent_url = $server_url . "/sv_char.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $_SESSION['mu_nvchon'],
                'action'    =>  'nhanthuong',
                'qindex'    =>  $qindex,
                
                'pagesv'	=>	'sv_char_questdaily',
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
                    $qwait = read_TagName($reponse, 'qwait', 1);
                    $qfinish = read_TagName($reponse, 'qfinish', 1);
                    
                    $_SESSION['quest_daily'] = $qwait;
                    
                    $_SESSION['acc_gcoin'] = read_TagName($reponse, 'gcoin', 1);
                    $_SESSION['acc_gcoin_km'] = read_TagName($reponse, 'gcoin_km', 1);
                    $_SESSION['acc_vpoint'] = read_TagName($reponse, 'vpoint', 1);
                    $_SESSION['acc_vpoint_km'] = read_TagName($reponse, 'vpoint_km', 1);
                    $_SESSION['WCoin'] = read_TagName($reponse, 'WCoin', 1);
                    $_SESSION['acc_ppoint'] = read_TagName($reponse, 'nbb_pl', 1);
                    $_SESSION['acc_ppoint_extra'] = read_TagName($reponse, 'nbb_pl_extra', 1);
                    
                    $_SESSION['acc_chao'] += abs(intval(read_TagName($reponse, 'chao_add', 1)));
                    $_SESSION['acc_cre'] += abs(intval(read_TagName($reponse, 'cre_add', 1)));
                    $_SESSION['acc_blue'] += abs(intval(read_TagName($reponse, 'blue_add', 1)));
                    
                    $msg = read_TagName($reponse, 'msg', 1);
                    echo "|OK|$qwait|$qfinish|$msg|". number_format($_SESSION['acc_gcoin'], 0, ',', '.') ."|". number_format($_SESSION['acc_gcoin_km'], 0, ',', '.') ."|". number_format($_SESSION['acc_vpoint'], 0, ',', '.') ."|". number_format($_SESSION['acc_vpoint_km'], 0, ',', '.') ."|". number_format($_SESSION['WCoin'], 0, ',', '.') ."|". number_format($_SESSION['acc_ppoint'], 0, ',', '.') ."|". number_format($_SESSION['acc_ppoint_extra'], 0, ',', '.') ."|". number_format($_SESSION['acc_chao'], 0, ',', '.') ."|". number_format($_SESSION['acc_cre'], 0, ',', '.') ."|". number_format($_SESSION['acc_blue'], 0, ',', '.') ."|";
        		} else echo $reponse;
        	}
        } else {
            echo "Dữ liệu Nhiệm vụ không đúng.";
        }
	break;
}



?>