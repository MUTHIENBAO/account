<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
    
    $getcontent_url = $server_url . "/sv_chopl.php";
    $getcontent_data = array(
        'login'    =>  $_SESSION['mu_username'],
        'action'    =>  'mypl',
        
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
		$info = read_TagName($reponse, 'info', 1);
		if ($info == 'OK') {
			$mypl = read_TagName($reponse, 'mypl', 1);
            $mystore = read_TagName($reponse, 'mystore', 1);
            $mystore_arr = json_decode($mystore, true);
            foreach($mystore_arr as $k => $v) {
                $mystore_arr[$k]['huyban'] = "";
                if($mystore_arr[$k]['dangban'] == 1) {
                    $mystore_arr[$k]['huyban'] = "<br /><input type='button' class='btn_huyban' id='btn_huyban_". $mystore_arr[$k]['id'] ."' store_id='". $mystore_arr[$k]['id'] ."' value='Hủy Bán' /><br /><span id='huypl_view_". $mystore_arr[$k]['id'] ."'></span>";
                }
            }
		}
		else $error_module = $reponse;
	}
    
$page_template = "templates/chopl/banpl.tpl";
?>