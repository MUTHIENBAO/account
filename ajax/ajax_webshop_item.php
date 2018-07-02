<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
$file_shopitem = 'config/webshopitem.txt';

$action = $_GET['action'];

switch ($action){ 
	case 'webshop_send':
        $vitri = $_GET['vitri'];
        $webshop_type = $_GET['webshop_type'];
        $money_type = $_GET['money_type'];
        $slg = $_GET['slg'];
        if(!isset($money_type) || $money_type <1 || $money_type > 4) $money_type = 1;
        
        $error = "";
        if (!preg_match("/^[A-F0-9]*$/i", $vitri))
    	{
            $error .= "Dữ liệu lỗi <strong>Mã Item</strong> : $vitri . Chi duoc su dung ki tu a-f, A-F, so (1-9).<br />"; 
    	}
        if( strlen($vitri) <> 32 ) {
            $error .= "Dữ liệu lỗi <strong>Mã Item</strong> : $vitri phải có 32 ký tự.<br />";
        }
        
        if(strlen($error) == 0) {
            $getcontent_url = $server_url . "/shop_item.php";
            $getcontent_data = array(
                'login'     =>  $_SESSION['mu_username'],
                'name'      =>  $_SESSION['mu_nvchon'],
                'action'    =>  'reward_item',
                'webshop_type'      =>  $webshop_type,
                'money_type'      =>  $money_type,
                'code'      =>  $vitri,
                'slg'       =>  $slg,
                
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
                    $_SESSION['acc_gcoin'] = read_TagName($reponse, 'gcoin', 1);
                    $_SESSION['acc_gcoin_km'] = read_TagName($reponse, 'gcoinkm', 1);
                    $_SESSION['acc_vpoint'] = read_TagName($reponse, 'vpoint', 1);
                    $_SESSION['acc_vpoint_km'] = read_TagName($reponse, 'vpoint_km', 1);
                    
                    //Đọc File WebShop
                	$fopen_host = fopen($file_shopitem, "r");
                    $item_get = fgets($fopen_host);
                	fclose($fopen_host);
                    
                    $item_listall_arr = json_decode($item_get, true);
                    $item_name = $item_listall_arr[$webshop_type][$vitri]['item_name'];
                    
                    $msg = "Mua <strong>$slg</strong> Item <strong>$item_name</strong> thành công.<br /> Item đã được đưa vào hòm đồ chung.";
                    echo "|OK|$msg|". $_SESSION['acc_gcoin'] ."|". $_SESSION['acc_gcoin_km'] ."|". $_SESSION['acc_vpoint'] ."|". $_SESSION['acc_vpoint_km'] ."|";
        		} else echo $reponse;
        	}
        }
        
        if(strlen($error) > 0) {
            echo $error;
        }
    break;
    
}



?>