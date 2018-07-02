<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
    
    $getcontent_url = $server_url . "/sv_event.php";
    $getcontent_data = array(
        'login'    =>  $_SESSION['mu_username'],
        'action'    =>  'rank',
        
        'pagesv'          =>  'sv_event_epitem',
        'string_login'    =>  isset($_SESSION['checklogin']) ? $_SESSION['checklogin'] : 0,
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
		if (isset($info[1]) && $info[1] == 'OK') {
			$list_rank_slg = $info[2];
            $list_rank_ear = $info[3];
            $list_rank_slg_arr = json_decode($list_rank_slg, true);
            $list_rank_ear_arr = json_decode($list_rank_ear, true);
            
            if(!is_array($list_rank_slg_arr) || !is_array($list_rank_ear_arr) ) {
                $error_module = $info[2];
            }
		}
		else $error_module = $reponse;
	}
    
$page_template = "templates/event/event_epitem_rank.tpl";
?>