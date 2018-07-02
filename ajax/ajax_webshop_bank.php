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
        $money_type = $_GET['money_type'];
        $slg = abs(intval($_GET['slg']));
        if(!isset($money_type) || $money_type <1 || $money_type > 4) $money_type = 1;
        
        $error = "";
        
        if($slg == 0) {
            $error .= "Số lượng Item muốn mua phải lớn hơn 0.";
        }
        
        if(strlen($error) == 0) {
            $getcontent_url = $server_url . "/shop_bank.php";
            $getcontent_data = array(
                'login'     =>  $_SESSION['mu_username'],
                'name'      =>  $_SESSION['mu_nvchon'],

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
                    
                    switch ($vitri){ 
                    	case 0:    // Chao
                            $item_name = "Ngọc Hỗn Nguyên ngân hàng";
                    	break;
                    
                    	case 1:    // Cre
                            $item_name = "Ngọc Sáng Tạo ngân hàng"; 
                    	break;
                    
                    	case 2:    // Feather
                            $item_name = "Lông Vũ ngân hàng"; 
                    	break;
                    
                    	case 3:    // Heart
                            $item_name = "Trái Tim ngân hàng";
                    	break;
                    }
                    
                    $msg = "Mua <strong>$slg</strong> <strong>$item_name</strong> thành công.<br /> Item đã được đưa vào ngân hàng.";
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