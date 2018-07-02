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
$maychao_arr = _json_fileload('config/config_maychao.txt');
// Read MayChao Config End
$trader_arr = $maychao_arr['trader'];

$item = $_GET['item'];

if(isset($trader_arr[$item]['trader_stat']) && $trader_arr[$item]['trader_stat'] == 1) {
    $trader_choise = true;
    
    $getcontent_url = $server_url . "/sv_maychao.php";
    $getcontent_data = array(
        'login'    =>  $_SESSION['mu_username'],
        'name'    =>  $_SESSION['mu_nvchon'],
        'action'    =>  'check_item',
        'item'      =>  $item,
                
        'pagesv'	=>	'sv_trader_item',
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
    		$trader_info = $info[2];
            $trader_info_arr = json_decode($trader_info, true);
            if(!is_array($trader_info_arr)) {
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
    
    
} else {
    $trader_choise = false;
}

$page_template = "templates/maychao/trader_item.tpl";

?>