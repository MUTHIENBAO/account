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
	case 'reset':
        $getcontent_url = $server_url . "/sv_char.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'name'    =>  $_SESSION['mu_nvchon'],
            'resetnow'    =>  $_SESSION['nv_reset'],
            
            'pagesv'	=>	'sv_char_reset',
            'string_login'    =>  $_SESSION['checklogin'],
            'passtransfer'    =>  $passtransfer
        ); 
        
        $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

		if ( empty($reponse) ) $notice = "<font size='3' color='red'>Server bảo trì.</font>";
		elseif($reponse == "login_other") {
			$notice = "<font size='3' color='red'>Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.</font>";
			session_destroy();
		}
		else {
			if ( read_TagName($reponse, 'info', 1) == 'OK' ) {
				
                $_SESSION['nv_reset'] = $_SESSION['nv_reset']+1;
				$_SESSION['nv_level'] = 6;
				$_SESSION['nv_zen'] = read_TagName($reponse, 'zen_char', 1);
                $_SESSION['acc_zen'] = read_TagName($reponse, 'zen_bank', 1);
                $_SESSION['acc_chao'] = read_TagName($reponse, 'chao', 1);
                $_SESSION['acc_cre'] = read_TagName($reponse, 'cre', 1);
                $_SESSION['acc_blue'] = read_TagName($reponse, 'blue', 1);
				$_SESSION['nv_point'] = read_TagName($reponse, 'resetpoint', 1);
				$_SESSION['nv_pointdutru'] = read_TagName($reponse, 'pointdutru', 1);
				$_SESSION['nv_resetday'] = $_SESSION['nv_resetday']+1;
				$_SESSION['nv_resetmonth'] = $_SESSION['nv_resetmonth']+1;
                $_SESSION['nv_str'] = read_TagName($reponse, 'str', 1);
                $_SESSION['nv_dex'] = read_TagName($reponse, 'dex', 1);
                $_SESSION['nv_vit'] = read_TagName($reponse, 'vit', 1);
                $_SESSION['nv_ene'] = read_TagName($reponse, 'ene', 1);
                if(in_array($_SESSION['nv_class'], array(64,65,66,67))) {
                    $_SESSION['nv_com'] = read_TagName($reponse, 'com', 1);
                }
                
                $notice = "<nbb>OK<nbb>" . read_TagName($reponse, 'messenge', 1) . "<nbb>". number_format($_SESSION['acc_zen'], 0, ',', '.') ."<nbb>". $_SESSION['acc_chao'] ."<nbb>". $_SESSION['acc_cre'] ."<nbb>". $_SESSION['acc_blue'] ."<nbb>";
                    
			}
			else $notice = $reponse;
		}
        
        echo $notice;
	break;
    
    case 'reset_over':
        $getcontent_url = $server_url . "/sv_char.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'name'    =>  $_SESSION['mu_nvchon'],
            'resetnow'    =>  $_SESSION['nv_reset'],
            
            'pagesv'	=>	'sv_char_reset_over',
            'string_login'    =>  $_SESSION['checklogin'],
            'passtransfer'    =>  $passtransfer
        ); 
        
        $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

		if ( empty($reponse) ) $notice = "<font size='3' color='red'>Server bảo trì.</font>";
		elseif($reponse == "login_other") {
			$notice = "<font size='3' color='red'>Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.</font>";
			session_destroy();
		}
		else {
			if ( read_TagName($reponse, 'info', 1) == 'OK' ) {
				
				$_SESSION['nv_level'] = 6;
				$_SESSION['nv_zen'] = read_TagName($reponse, 'zen_char', 1);
                $_SESSION['acc_zen'] = read_TagName($reponse, 'zen_bank', 1);
                $_SESSION['acc_chao'] = read_TagName($reponse, 'chao', 1);
                $_SESSION['acc_cre'] = read_TagName($reponse, 'cre', 1);
                $_SESSION['acc_blue'] = read_TagName($reponse, 'blue', 1);
				$_SESSION['nv_point'] = read_TagName($reponse, 'resetpoint', 1);
				$_SESSION['nv_pointdutru'] = read_TagName($reponse, 'pointdutru', 1);
				$_SESSION['nv_resetday'] = $_SESSION['nv_resetday']+1;
				$_SESSION['nv_resetmonth'] = $_SESSION['nv_resetmonth']+1;
                $_SESSION['nv_str'] = read_TagName($reponse, 'str', 1);
                $_SESSION['nv_dex'] = read_TagName($reponse, 'dex', 1);
                $_SESSION['nv_vit'] = read_TagName($reponse, 'vit', 1);
                $_SESSION['nv_ene'] = read_TagName($reponse, 'ene', 1);
                if(in_array($_SESSION['nv_class'], array(64,65,66,67))) {
                    $_SESSION['nv_com'] = read_TagName($reponse, 'com', 1);
                }
                
                $notice = "<nbb>OK<nbb>" . read_TagName($reponse, 'messenge', 1) . "<nbb>". number_format($_SESSION['acc_zen'], 0, ',', '.') ."<nbb>". $_SESSION['acc_chao'] ."<nbb>". $_SESSION['acc_cre'] ."<nbb>". $_SESSION['acc_blue'] ."<nbb>";
			}
			else $notice = $reponse;
		}
        
        echo $notice;
	break;

	case 'reset_vip':
        $tiente = $_GET['tiente'];
        
        if ($tiente == 'gcoin' || $tiente == 'vpoint') {
            $getcontent_url = $server_url . "/sv_char.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $_SESSION['mu_nvchon'],
                'tiente'    =>  $tiente,
                'resetnow'    =>  $_SESSION['nv_reset'],
                
                'pagesv'	=>	'sv_char_reset_vip',
                'string_login'    =>  $_SESSION['checklogin'],
                'passtransfer'    =>  $passtransfer
            ); 
            
            $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
    
    		if ( empty($reponse) ) $notice = "<font size='3' color='red'>Server bảo trì.</font>";
    		elseif($reponse == "login_other") {
    			$notice = "<font size='3' color='red'>Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.</font>";
    			session_destroy();
    		}
    		else {
    			if ( read_TagName($reponse, 'info', 1) == 'OK' ) {
    				$messenge = read_TagName($reponse, 'messenge', 1);
					
					$_SESSION['acc_gcoin'] = read_TagName($reponse, 'gcoin', 1);
    				$_SESSION['acc_gcoin_km'] = read_TagName($reponse, 'gcoin_km', 1);
    				$_SESSION['acc_vpoint'] = read_TagName($reponse, 'vpoint', 1);
                    $_SESSION['acc_vpoint_km'] = read_TagName($reponse, 'vpoint_km', 1);
                    $_SESSION['nv_zen'] = read_TagName($reponse, 'zen_char', 1);
                    $_SESSION['acc_zen'] = read_TagName($reponse, 'zen_bank', 1);
					
					$notice = "<nbb>OK<nbb>". $messenge ."<nbb>". $_SESSION['acc_gcoin'] ."<nbb>". $_SESSION['acc_gcoin_km'] ."<nbb>". $_SESSION['acc_vpoint'] ."<nbb>". $_SESSION['acc_vpoint_km'] ."<nbb>". $_SESSION['acc_zen'] ."<nbb>";
    				
                    
    				
    				$_SESSION['nv_reset'] = $_SESSION['nv_reset']+1;
    				$_SESSION['nv_level'] = 6;
    				$_SESSION['nv_point'] = read_TagName($reponse, 'resetpoint', 1);
    				$_SESSION['nv_pointdutru'] = read_TagName($reponse, 'pointdutru', 1);
    				$_SESSION['nv_resetday'] = $_SESSION['nv_resetday']+1;
    				$_SESSION['nv_resetmonth'] = $_SESSION['nv_resetmonth']+1;
                    $_SESSION['nv_str'] = read_TagName($reponse, 'str', 1);
                    $_SESSION['nv_dex'] = read_TagName($reponse, 'dex', 1);
                    $_SESSION['nv_vit'] = read_TagName($reponse, 'vit', 1);
                    $_SESSION['nv_ene'] = read_TagName($reponse, 'ene', 1);
                    if(in_array($_SESSION['nv_class'], array(64,65,66,67))) {
                        $_SESSION['nv_com'] = read_TagName($reponse, 'com', 1);
                    }
    			}
    			else $notice = $reponse;
    		}
        } else $notice = "Sai loại đơn vị tiền tệ";
        
        echo $notice;
    break;
    
    case 'reset_over_vip':
        $tiente = $_GET['tiente'];
        
        if ($tiente == 'gcoin' || $tiente == 'vpoint') {
            $getcontent_url = $server_url . "/sv_char.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $_SESSION['mu_nvchon'],
                'tiente'    =>  $tiente,
                'resetnow'    =>  $_SESSION['nv_reset'],
                
                'pagesv'	=>	'sv_char_reset_vip_over',
                'string_login'    =>  $_SESSION['checklogin'],
                'passtransfer'    =>  $passtransfer
            ); 
            
            $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
    
    		if ( empty($reponse) ) $notice = "<font size='3' color='red'>Server bảo trì.</font>";
    		elseif($reponse == "login_other") {
    			$notice = "<font size='3' color='red'>Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.</font>";
    			session_destroy();
    		}
    		else {
    			if ( read_TagName($reponse, 'info', 1) == 'OK' ) {
					$messenge = read_TagName($reponse, 'messenge', 1);
					
					$_SESSION['acc_gcoin'] = read_TagName($reponse, 'gcoin', 1);
    				$_SESSION['acc_gcoin_km'] = read_TagName($reponse, 'gcoin_km', 1);
    				$_SESSION['acc_vpoint'] = read_TagName($reponse, 'vpoint', 1);
                    $_SESSION['acc_vpoint_km'] = read_TagName($reponse, 'vpoint_km', 1);
                    $_SESSION['nv_zen'] = read_TagName($reponse, 'zen_char', 1);
                    $_SESSION['acc_zen'] = read_TagName($reponse, 'zen_bank', 1);
					
					$notice = "<nbb>OK<nbb>". $messenge ."<nbb>". $_SESSION['acc_gcoin'] ."<nbb>". $_SESSION['acc_gcoin_km'] ."<nbb>". $_SESSION['acc_vpoint'] ."<nbb>". $_SESSION['acc_vpoint_km'] ."<nbb>". $_SESSION['acc_zen'] ."<nbb>";
					
					$_SESSION['nv_level'] = 6;
					$_SESSION['nv_point'] = read_TagName($reponse, 'resetpoint', 1);
					$_SESSION['nv_pointdutru'] = read_TagName($reponse, 'pointdutru', 1);
					$_SESSION['nv_resetday'] = $_SESSION['nv_resetday']+1;
					$_SESSION['nv_resetmonth'] = $_SESSION['nv_resetmonth']+1;
                    $_SESSION['nv_str'] = read_TagName($reponse, 'str', 1);
                    $_SESSION['nv_dex'] = read_TagName($reponse, 'dex', 1);
                    $_SESSION['nv_vit'] = read_TagName($reponse, 'vit', 1);
                    $_SESSION['nv_ene'] = read_TagName($reponse, 'ene', 1);
                    if(in_array($_SESSION['nv_class'], array(64,65,66,67))) {
                        $_SESSION['nv_com'] = read_TagName($reponse, 'com', 1);
                    }
    			}
    			else $notice = $reponse;
    		}
        } else $notice = "Sai loại đơn vị tiền tệ";
        
        echo $notice;
    break;
    
    case 'reset_bu':
        $tiente = $_GET['tiente'];
        
        if ($tiente == 'gcoin' || $tiente == 'vpoint') {
            $getcontent_url = $server_url . "/sv_char.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $_SESSION['mu_nvchon'],
                'tiente'    =>  $tiente,
                'resetnow'    =>  $_SESSION['nv_reset'],
                
                'pagesv'	=>	'sv_char_reset_bu',
                'string_login'    =>  $_SESSION['checklogin'],
                'passtransfer'    =>  $passtransfer
            ); 
            
            $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
    
    		if ( empty($reponse) ) $notice = "<font size='3' color='red'>Server bảo trì.</font>";
    		elseif($reponse == "login_other") {
    			$notice = "<font size='3' color='red'>Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.</font>";
    			session_destroy();
    		}
    		else {
    			if ( read_TagName($reponse, 'info', 1) == 'OK' ) {
    				
                    $_SESSION['acc_gcoin'] = read_TagName($reponse, 'gcoin', 1);
    				$_SESSION['acc_gcoin_km'] = read_TagName($reponse, 'gcoin_km', 1);
    				$_SESSION['acc_vpoint'] = read_TagName($reponse, 'vpoint', 1);
                    $_SESSION['acc_vpoint_km'] = read_TagName($reponse, 'vpoint_km', 1);
                    $_SESSION['nv_zen'] = read_TagName($reponse, 'zen_char', 1);
                    $_SESSION['acc_zen'] = read_TagName($reponse, 'zen_bank', 1);
                    
                    $notice = "<nbb>OK<nbb>" . read_TagName($reponse, 'messenge', 1) . "<nbb>". $_SESSION['acc_gcoin'] ."<nbb>". $_SESSION['acc_gcoin_km'] ."<nbb>". $_SESSION['acc_vpoint'] ."<nbb>". $_SESSION['acc_vpoint_km'] ."<nbb>". $_SESSION['acc_zen'] ."<nbb>";
    				
    				$_SESSION['nv_reset'] = $_SESSION['nv_reset']+1;
                    $_SESSION['nv_reset_bu_now'] = $_SESSION['nv_reset_bu_now'] + 1;
				    $_SESSION['nv_resetmonth'] = $_SESSION['nv_resetmonth']+1;
    				$_SESSION['nv_level'] = 6;
    				$_SESSION['nv_point'] = read_TagName($reponse, 'resetpoint', 1);
    				$_SESSION['nv_pointdutru'] = read_TagName($reponse, 'pointdutru', 1);
                    
    			}
    			else $notice = $reponse;
    		}
        } else $notice = "Sai loại đơn vị tiền tệ";
        
        echo $notice;
    break;
    
    case 'reset_up':
        $tiente = $_GET['tiente'];
        
        if ($tiente == 'gcoin' || $tiente == 'vpoint') {
            $getcontent_url = $server_url . "/sv_char.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $_SESSION['mu_nvchon'],
                'tiente'    =>  $tiente,
                'resetnow'    =>  $_SESSION['nv_reset'],
                
                'pagesv'	=>	'sv_char_reset_up',
                'string_login'    =>  $_SESSION['checklogin'],
                'passtransfer'    =>  $passtransfer
            ); 
            
            $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
    
    		if ( empty($reponse) ) $notice = "<font size='3' color='red'>Server bảo trì.</font>";
    		elseif($reponse == "login_other") {
    			$notice = "<font size='3' color='red'>Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.</font>";
    			session_destroy();
    		}
    		else {
    			if ( read_TagName($reponse, 'info', 1) == 'OK' ) {
    				
                    $_SESSION['acc_gcoin'] = read_TagName($reponse, 'gcoin', 1);
    				$_SESSION['acc_gcoin_km'] = read_TagName($reponse, 'gcoin_km', 1);
    				$_SESSION['acc_vpoint'] = read_TagName($reponse, 'vpoint', 1);
                    $_SESSION['acc_vpoint_km'] = read_TagName($reponse, 'vpoint_km', 1);
                    $_SESSION['nv_zen'] = read_TagName($reponse, 'zen_char', 1);
                    $_SESSION['acc_zen'] = read_TagName($reponse, 'zen_bank', 1);
                    
                    $notice = "<nbb>OK<nbb>" . read_TagName($reponse, 'messenge', 1) . "<nbb>". $_SESSION['acc_gcoin'] ."<nbb>". $_SESSION['acc_gcoin_km'] ."<nbb>". $_SESSION['acc_vpoint'] ."<nbb>". $_SESSION['acc_vpoint_km'] ."<nbb>". $_SESSION['acc_zen'] ."<nbb>";
    				
    				$_SESSION['nv_reset'] = $_SESSION['nv_reset']+1;
                    $_SESSION['nv_resetday'] = $_SESSION['nv_resetday']+1;
					$_SESSION['nv_resetmonth'] = $_SESSION['nv_resetmonth']+1;
    			}
    			else $notice = $reponse;
    		}
        } else $notice = "Sai loại đơn vị tiền tệ";
        
        echo $notice;
    break;
    
    default:
        echo "Dữ liệu sai";
}



?>