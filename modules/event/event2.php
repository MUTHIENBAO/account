<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");

// Read MayChao Config
$event2_arr = _json_fileload('config/config_event2.txt');
// Read MayChao Config End

if(isset($event2_on) && $event2_on == 1) {
    if(time() < strtotime($event2_begin)) {
        echo "Chưa đến thời gian tham gia Event.";
    } else if(time() > strtotime($event2_end) + 24*60*60 - 1) {
        echo "Đã hết thời gian tham gia Event.";
    } else {
        $getcontent_url = $server_url . "/event2.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'name'    =>  $_SESSION['mu_nvchon'],
            'action'    =>  'check_item',
            
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
        		$item_source_info = $info[2];
                $item_source_arr = json_decode($item_source_info, true);
                if(!is_array($item_source_arr)) {
                    $error_module = $info[2];
                }
                $zen = $info[3];
                
                $dadoi_count = $info[4];
                $dadoi_arr = json_decode($dadoi_count, true);
        	}
        	else $error_module = $reponse;
        }
        
        if ($_SESSION['nv_online'] == 1) { 
            $online = '<font color="red"><strong>Chưa Thoát</strong></font>';
            $accept = 0;
            $btn_disable = "disabled='disabled'";
        } else {
            $online = "<font color='green'>Đã Thoát</font>";
            $accept = 1;
            $btn_disable = "";
        }
        
        $page_template = "templates/event/event2.tpl";
    }
} else {
    echo "<div class='form-error'>Event chưa bật.</div>";
}

?>