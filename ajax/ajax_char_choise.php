<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/

if(!isset($_SESSION['char_choise_time']) || $_SESSION['char_choise_time'] < time() - 3) {
    $_SESSION['char_choise_time'] = time();
    $ip_client = get_ip();
    
    if(isset($_GET['char_choise'])) $char_choise = $_GET['char_choise'];
    else $char_choise = $_SESSION['mu_nvchon'];
    
    $getcontent_url = $server_url . "/view.php";
    $getcontent_data = array(
        'action'    =>  'chonNV',
        'login'    =>  $_SESSION['mu_username'],
        'name'    =>  $char_choise,
        'ip'    =>  $ip_client,
        'string_login'  =>  $_SESSION['checklogin'],
        'passtransfer'    =>  $passtransfer
    );
    
    $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
    
    if ( empty($reponse) ) $notice = "Server bảo trì.";
    elseif($reponse == "login_other") {
    	$notice = "Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.";
    	session_destroy();
    }
    else {
    	if (read_TagName($reponse, 'info', 1) != 'OK') { $notice = $reponse; }
    	else {
    		$_SESSION['mu_nvchon'] = $char_choise;
            $char_info_data = read_TagName($reponse, 'char_info_data', 1);
            $char_info_arr = json_decode($char_info_data, true);
    		
    		$_SESSION['nv_online'] = $char_info_arr['online'];
    		$_SESSION['nv_doinv'] = $char_info_arr['doinv'];
    		$_SESSION['nv_class'] = $char_info_arr['class'];
    		$_SESSION['nv_level'] = $char_info_arr['level'];
    		$_SESSION['nv_point'] = $char_info_arr['point'];
    		$_SESSION['nv_pointdutru'] = $char_info_arr['point_dutru'];
    		$_SESSION['nv_zen'] = $char_info_arr['zen'];
    		$_SESSION['nv_reset'] = $char_info_arr['reset'];
    		$_SESSION['nv_resetday'] = $char_info_arr['resetday'];
            $_SESSION['nv_reset_yesterday'] = $char_info_arr['reset_yesterday'];
            $_SESSION['nv_reset_bu_now'] = $char_info_arr['reset_bu_now'];
            $_SESSION['nv_gc_rs_bu'] = $char_info_arr['gc_rs_bu'];
            $_SESSION['nv_gc_rs_up'] = $char_info_arr['gc_rs_up'];
    		$_SESSION['nv_resetmonth'] = $char_info_arr['resetmonth'];
    		$_SESSION['nv_relife'] = $char_info_arr['relife'];
    		$_SESSION['nv_khoado'] = $char_info_arr['khoado'];
    		$_SESSION['nv_thuepoint'] = $char_info_arr['thuepoint'];
    		$_SESSION['nv_pointevent'] = $char_info_arr['pointevent'];
    		$_SESSION['nv_uythaconline'] = $char_info_arr['uythacon'];
    		$_SESSION['nv_point_uythac'] = $char_info_arr['pointuythac'];
            $_SESSION['nv_point_uythac_event'] = $char_info_arr['pointuythac_event'];
    		$_SESSION['nv_uythac_offline'] = $char_info_arr['uythacoff'];
    		$_SESSION['nv_uythac_offline_time'] = $char_info_arr['uythacoff_time'];
            $_SESSION['nv_uythac_offline_daily'] = $char_info_arr['uythacoff_daily'];
            $_SESSION['nv_top50'] = $char_info_arr['top50'];
            $_SESSION['nv_top1_rs'] = $char_info_arr['top1_rs'];
            $_SESSION['nv_top1_rl'] = $char_info_arr['top1_rl'];
            $_SESSION['nv_ghrs'] = $char_info_arr['gioihanrs'];
			$_SESSION['nv_ghrs_vuot'] = $char_info_arr['gioihanrs_vuot'];
            $_SESSION['nv_rs_total_max'] = $char_info_arr['rs_total_max'];
            $_SESSION['point_event'] = $char_info_arr['point_event'];
            $_SESSION['event1_type1'] = $char_info_arr['event1_type1'];
            $_SESSION['event1_type2'] = $char_info_arr['event1_type2'];
            $_SESSION['event1_type3'] = $char_info_arr['event1_type3'];
            $_SESSION['event1_type1_daily'] = $char_info_arr['event1_type1_daily'];
            $_SESSION['event1_type2_daily'] = $char_info_arr['event1_type2_daily'];
            $_SESSION['event1_type3_daily'] = $char_info_arr['event1_type3_daily'];
            $_SESSION['quest_daily'] = $char_info_arr['qwait'];
            $_SESSION['nv_str'] = $char_info_arr['str'];
            $_SESSION['nv_dex'] = $char_info_arr['dex'];
            $_SESSION['nv_vit'] = $char_info_arr['vit'];
            $_SESSION['nv_ene'] = $char_info_arr['ene'];
            $_SESSION['nv_com'] = $char_info_arr['com'];
            $_SESSION['nv_rs_total'] = $char_info_arr['rs_total'];
            $_SESSION['nv_title'] = $char_info_arr['title'];
            $_SESSION['nv_RankTitle1'] = $char_info_arr['RankTitle1'];
            $_SESSION['nv_RankTitle2'] = $char_info_arr['RankTitle2'];
            $_SESSION['nv_RankTitle3'] = $char_info_arr['RankTitle3'];
			$_SESSION['nv_LenhBaiEpDoCong'] = $char_info_arr['LenhBaiEpDoCong'];
			$_SESSION['nv_LenhBaiWing3'] = $char_info_arr['LenhBaiWing3'];
			$_SESSION['nv_LenhBaiWing4'] = $char_info_arr['LenhBaiWing4'];
			$_SESSION['nv_LenhBaiWing5'] = $char_info_arr['LenhBaiWing5'];
            $_SESSION['nv_MasterLevel'] = $char_info_arr['MasterLevel'];
            $_SESSION['nv_MasterPoints'] = $char_info_arr['MasterPoints'];
            $_SESSION['nv_nbb_pmaster'] = $char_info_arr['nbb_pmaster'];
            $_SESSION['award_unreceive_count'] = $char_info_arr['award_unreceive_count'];
            $_SESSION['PkCount'] = $char_info_arr['PkCount'];
            
            $_SESSION['SCFSealItem'] = $char_info_arr['SCFSealItem'];
            $_SESSION['SCFSealTime'] = $char_info_arr['SCFSealTime'];
            $_SESSION['SCFScrollItem'] = $char_info_arr['SCFScrollItem'];
            $_SESSION['SCFScrollTime'] = $char_info_arr['SCFScrollTime'];
            
            $_SESSION['nbb_vip'] = $char_info_arr['nbb_vip'];
            $_SESSION['nbb_vip_time'] = $char_info_arr['nbb_vip_time'];
            $_SESSION['nbb_vip_time_used'] = $char_info_arr['nbb_vip_time_used'];
            
            // Event TOP Auto
            for($i=0; $i<2; $i++) {
                switch ($i){ 
                	case 0:
                        $event_type = 'rs';
                	break;
                
                	case 1:
                        $event_type = 'card';
                	break;
                }
                for($j=0; $j<3; $j++) {
                    switch ($j){ 
                    	case 0:
                            $event_date = 'day';
                    	break;
                    
                    	case 1:
                            $event_date = 'week';
                    	break;
                        
                        case 2:
                            $event_date = 'month';
                    	break;
                    }
                    $string_key = "event_top_auto_". $event_type ."_". $event_date;
                    $_SESSION[$string_key] = $char_info_arr[$string_key];
                }
            }
    		
    		setcookie("nweb_loaddata", time(), time()+3600);
    		
    		$notice = "|OK|";
            $notice .= "<div class='selected-character' id='reload_char'><div class='image-character character-". $_SESSION['nv_class'] ."'></div>";
            $notice .= "<div class='info-character'>";
            $notice .= "<p class='character-name'>".$_SESSION['mu_nvchon']."</p>";
            $notice .= "<div class='level'>";
            $notice .= "Level: ". $_SESSION['nv_level'] ."<br />";
            $notice .= "Reset: ". $_SESSION['nv_reset'] ."<br />";
            $notice .= "Relife: ". $_SESSION['nv_relife'] ."";
            $notice .= "</div>";
            $notice .= "</div></div>|". $_SESSION['quest_daily'] ."|". $_SESSION['award_unreceive_count'] ."|";
            $remove_choisenv = 1;
    	}
    }
} else {
    echo "Thao tác quá nhanh. Vui lòng chọn lại.";
    
    /*
    $notice = "|OK|";
    $notice .= "<div class='selected-character' id='reload_char'><div class='image-character character-". $_SESSION['nv_class'] ."'></div>";
    $notice .= "<div class='info-character'>";
    $notice .= "<p class='character-name'>".$_SESSION['mu_nvchon']."</p>";
    $notice .= "<div class='level'>";
    $notice .= "Level: ". $_SESSION['nv_level'] ."<br />";
    $notice .= "Reset: ". $_SESSION['nv_reset'] ."<br />";
    $notice .= "Relife: ". $_SESSION['nv_relife'] ."";
    $notice .= "</div>";
    $notice .= "</div></div>|". $_SESSION['quest_daily'] ."|". $_SESSION['award_unreceive_count'] ."|";
    $remove_choisenv = 1;
    */
}
 


echo $notice;


?>