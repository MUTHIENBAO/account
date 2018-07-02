<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");

include('config/config_warehouse_secure.php');
if($money_type == 1) {
    $money_name = "Gcent";
} else {
    $money_name = "Vcent";
}
$leng_cuphap = strlen($cuphap);
if($leng_cuphap == 0) echo "<center><font color='red'>Chưa thiết lập cấu hình SMS. Vui lòng liên hệ BQT để được hỗ trợ.</font></center>";
else {
    
    $getcontent_url = $server_url . "/sv_acc.php";
    $getcontent_data = array(
        'login'    =>  $_SESSION['mu_username'],
        'action'    =>  'item_list',
                
        'pagesv'	=>	'sv_acc_warehouse_secure',
        'string_login'    =>  $_SESSION['checklogin'],
        'passtransfer'    =>  $passtransfer
    );
    
    $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

	if ( empty($reponse) ) $error_module = "Server bảo trì.";
	elseif($reponse == "login_other") {
		$error_module = "<font size='3' color='red'>Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.</font>";
		session_destroy();
	}
	else {
		$info = explode('<nbb>',$reponse);
		if ($info[1] == 'OK') {
			$warehouse_info = $info[2];
            $warehouse_info_arr = json_decode($warehouse_info, true);
            
            $warehouse_secure_list = $info[3];
            $warehouse_secure_list_arr = json_decode($warehouse_secure_list, true);
            
            if(!is_array($warehouse_info_arr) && !is_array($warehouse_secure_list_arr)) {
                $error_module = $info[2];
            }
		}
		else $error_module = $reponse;
	}
    
    if ($_SESSION['nv_online'] == 1) { 
        $online = "<font color='red'><strong>Chưa Thoát</strong></font>";
    } else {
        $online = "<font color='green'>Đã Thoát</font>";
    }
    
    $page_template = "templates/acc_manager/warehouse_secure.tpl";
}
?>