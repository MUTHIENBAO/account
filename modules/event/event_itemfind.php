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
$itemfind_arr = _json_fileload('config/event_itemfind.txt');
// Read MayChao Config End

$item = $_GET['item'];

if(isset($itemfind_arr[$item]['itemfind_stat']) && $itemfind_arr[$item]['itemfind_stat'] == 1) {
    $getcontent_url = $server_url . "/sv_event.php";
    $getcontent_data = array(
        'login'    =>  $_SESSION['mu_username'],
        'name'    =>  $_SESSION['mu_nvchon'],
        'action'    =>  'check_item',
        'item'      =>  $item,
                
        'pagesv'	=>	'sv_event_itemfind',
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
    		$itemfind_info = $info[2];
            $itemfind_info_arr = json_decode($itemfind_info, true);
            if(!is_array($itemfind_info_arr)) {
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
    
    $page_template = "templates/event/event_itemfind.tpl";
} else {
    echo "<div class='form-error'>Cách ép này không tồn tại.</div>";
}

?>