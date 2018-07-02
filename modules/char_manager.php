<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
if ( !isset($_SESSION['mu_username']) ) {
	echo "<div align=center><font color=red><b>Hãy Login trước khi thực hiện chức năng này</b></font></div>";
	include('modules/home.php');
} else {
    include_once('config/config_event.php');
    include_once('config/config_gioihanrs.php');
    $thehe_choise = $_SESSION['acc_thehe'];
    
	if (strlen($_SESSION['mu_nvchon']) > 0) {
        switch($_SESSION['nv_class'])
    	{
    		case $class_dw_1: 
    			$Character['name']="Dark Wizard";
    			$Character['image']="templates/images/dw.gif"; 
    			break;
    		case $class_dw_2:
    			$Character['name']="Soul Master";
    			$Character['image']="templates/images/dw.gif";
    			break;
    		case $class_dw_3:
    			$Character['name']="Grand Master"; 
    			$Character['image']="templates/images/dw.gif";
    			break;
    		case $class_dk_1: 
    			$Character['name']="Dark Knight";
    			$Character['image']="templates/images/dk.gif";
    			break;
    		case $class_dk_2:
    			$Character['name']="Blade Knight";
    			$Character['image']="templates/images/dk.gif";
    			break;
    		case $class_dk_3:
    			$Character['name']="Blade Master";
    			$Character['image']="templates/images/dk.gif";
    			break;
    		case $class_elf_1:
    			$Character['name']="Elf";
    			$Character['image']="templates/images/elf.gif";
    			break;
    		case $class_elf_2:
    			$Character['name']="Muse Elf";
    			$Character['image']="templates/images/elf.gif";
    			break;
    		case $class_elf_3:
    			$Character['name']="Hight Elf";
    			$Character['image']="templates/images/elf.gif";
    			break;
    		case $class_mg_1:
    			$Character['name']="Magic Gladiator"; 
    			$Character['image']="templates/images/mg.gif";
    			break;
    		case $class_mg_2:
    			$Character['name']="Duel Master";
    			$Character['image']="templates/images/mg.gif";
    			break;
    		case $class_dl_1:
    			$Character['name']="DarkLord";
    			$Character['image']="templates/images/dl.gif";
    			break;
    		case $class_dl_2:
    			$Character['name']="Lord Emperor";
    			$Character['image']="templates/images/dl.gif";
    			break;
    		case $class_sum_1:
    			$Character['name']="Summoner";
    			$Character['image']="templates/images/sm.gif";
    			break;
    		case $class_sum_2:
    			$Character['name']="Bloody Summoner";
    			$Character['image']="templates/images/sm.gif";
    			break;
    		case $class_sum_3:
    			$Character['name']="Dimension Master";
    			$Character['image']="templates/images/sm.gif";
    			break;
    		case $class_rf_1:
    			$Character['name']="Rage Fighter";
    			$Character['image']="templates/images/rf.gif";
    			break;
    		case $class_rf_2:
    			$Character['name']="Lord Fighter";
    			$Character['image']="templates/images/rf.gif";
    			break;
    		default:
    			$Character['name']=$code_class;
    			$Character['image']="templates/images/$code_class.gif";
    	}
        
        
        if ($_SESSION['nv_online'] == 1) $online = "<font color='red'><b>Chưa Thoát</b></font>"; else $online = "<font color='green'>Đã Thoát</font>";
		if ($_SESSION['nv_doinv'] == 1) $doinv = "<font color='green'>Đã đổi</font>"; else $doinv = "<font color='red'><b>Chưa đổi</b></font>";
		if(isset($_GET['act'])) $act = $_GET['act'];
        else $act = null;
		switch ($act)
		{
            case 'lock_item': include('modules/char_manager/lock_item.php'); break;
			case 'jewel2bank': include('modules/char_manager/jewel2bank.php'); break;
			case 'reset': include('modules/char_manager/reset.php'); break;
			case 'resetvip': 
				if ($Use_ResetVIP != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/char_manager/resetvip.php'); }
				break;
			case 'rs_bu': 
				if (isset($Use_ResetVIP) && $Use_ResetVIP == 1 && ( ($use_gioihanrs[$thehe_choise] == 1 && isset($Use_RS_Bu[$thehe_choise]) && $Use_RS_Bu[$thehe_choise] == 1) || ($use_gioihanrs[$thehe_choise] == 2 && isset($Use_RS_Bu2[$thehe_choise]) && $Use_RS_Bu2[$thehe_choise] == 1) )) {
					include('modules/char_manager/rs_bu.php');
				}
				else { echo "<center>Chức năng không có hoặc không được sử dụng</center>"; }
				break;
			case 'rs_up': 
				if (isset($Use_ResetVIP) && $Use_ResetVIP == 1 && ( ($use_gioihanrs[$thehe_choise] == 1 && isset($Use_UP_RS_Daily[$thehe_choise]) && $Use_UP_RS_Daily[$thehe_choise] == 1) || ($use_gioihanrs[$thehe_choise] == 2 && isset($Use_UP_RS_Daily2[$thehe_choise]) && $Use_UP_RS_Daily2[$thehe_choise] == 1) )) {
					include('modules/char_manager/rs_up.php');
				}
				else { echo "<center>Chức năng không có hoặc không được sử dụng</center>"; }
				break;
				
			case 'relife': include('modules/char_manager/relife.php'); break;
			
			case 'resetover': 
				if ( $Use_ResetOver == 1 ) {
					include('modules/char_manager/resetover.php'); 
				} else {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				break;
				
			case 'resetvipover': 
				if ($Use_ResetVIP == 1 && $Use_ResetOver == 1) {
					include('modules/char_manager/resetvipover.php');
				}
				else { echo "<center>Chức năng không có hoặc không được sử dụng</center>"; }
				break;
				
			case 'uythacoffline': 
				if ($Use_UyThacOffline != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/char_manager/uythacoffline.php'); }
				break;
			case 'uythaconline': 
				if ($Use_UyThacOnline != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/char_manager/uythaconline.php'); }
				break;
			case 'uythac_reset': 
				if ($Use_UyThacOnline == 1 || $Use_UyThacOffline == 1) {
					include('modules/char_manager/uythac_reset.php');
				}
				else { echo "<center>Chức năng không có hoặc không được sử dụng</center>"; }
				break;
			case 'uythac_resetvip': 
				if ( ($Use_UyThacOnline == 1 || $Use_UyThacOffline == 1) && $Use_ResetVIP == 1) {
					include('modules/char_manager/uythac_resetvip.php');
				}
				else { echo "<center>Chức năng không có hoặc không được sử dụng</center>"; }
				break;
			case 'pk': include('modules/char_manager/pk.php'); break;
			case 'doigioitinh': 
				if ($Use_DoiGioiTinh != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/char_manager/doigioitinh.php'); }
				break;
			case 'move': include('modules/char_manager/move.php'); break;
			case 'addpoint': include('modules/char_manager/addpoint.php'); break;
			case 'combo': include('modules/char_manager/combo.php'); break;
			case 'resetpoint': include('modules/char_manager/resetpoint.php'); break;
			case 'taytuy': include('modules/char_manager/taytuy.php'); break;
			case 'rutpoint': include('modules/char_manager/rutpoint.php'); break;
			case 'thuepoint': 
				if ($Use_ThuePoint != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/char_manager/thuepoint.php'); }
				break;
			case 'khoaitem': include('modules/char_manager/khoaitem.php'); break;
			case 'rsmaster': include('modules/char_manager/rsmaster.php'); break;
            case 'changename': 
            	if ($Use_ChangeName != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/char_manager/changename.php'); }
            	break;
            case 'char2accother': 
            	if ($Use_Char2AccOther != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/char_manager/char2accother.php'); }
            	break;
            case 'emptychar': include('modules/char_manager/emptychar.php'); break;
			case 'crea_char': include('modules/char_manager/crea_char.php'); break;
			case 'reset_quest': include('modules/char_manager/reset_quest.php'); break;
            case 'tuluyen': 
                if (isset($Use_TuLuyen) && $Use_TuLuyen == 1) {
					include('modules/char_manager/tuluyen.php'); 
				} else echo "<center>Chức năng không có hoặc không được sử dụng</center>";
                break;
            case 'songtu': 
                if (isset($Use_SongTu) && $Use_SongTu == 1) {
					include('modules/char_manager/songtu.php'); 
				}
				else echo "<center>Chức năng không có hoặc không được sử dụng</center>";
                break;
			case 'title': 
                if (isset($Use_title) && $Use_title == 1) {
					include('modules/char_manager/title.php'); 
				}
				else echo "<center>Chức năng không có hoặc không được sử dụng</center>";
                break;
            case 'questdaily': 
                if (isset($Use_QuestDaily) && $Use_QuestDaily == 1) {
					include('modules/char_manager/questdaily.php'); 
				}
				else echo "<center>Chức năng không có hoặc không được sử dụng</center>";
                break;
            case 'buats':
                if (isset($buats_use) && $buats_use == 1) {
					include('modules/char_manager/buats.php'); 
				}
				else echo "<center>Chức năng không có hoặc không được sử dụng</center>";
                break;
            
             case 'quest3':
                if (isset($quest3_use) && $quest3_use == 1) {
					include('modules/char_manager/quest3.php'); 
				}
				else echo "<center>Chức năng không có hoặc không được sử dụng</center>";
                break;
            
			default: 
                
                // Event Game Begin
                $file_eventgame = 'config/eventgame.txt';
                $datenow = date('Y-m-d', time());
                $date_tomorrow = date('Y-m-d', time()+24*60*60);
                $time_now = time();
                
                $eventgame_show_arr = array();
                //Doc File
                $eventgame_arr = array();
                if(is_file($file_eventgame)) {
            		$fopen_host = fopen($file_eventgame, "r");
                    $eventgame_read = fgets($fopen_host);
                    if(strlen($eventgame_read) > 5) {
                        $eventgame_arr = json_decode($eventgame_read, true);
                    }
            	} else $fopen_host = fopen($file_eventgame, "w");
            	fclose($fopen_host);
                //Doc File END
                if(!is_array($eventgame_arr)) $eventgame_arr = array();
                // Event Game End
                
                // Data Other Begin
                $file_host = "data/data_other.txt";
                $fp_host = fopen($file_host, "r");
            	$data_info = fgets($fp_host);
            	fclose($fp_host);
                
                $data_arr = json_decode($data_info, true);
                if(!isset($data_arr['kudnun']['timecheck']) || $data_arr['kudnun']['timecheck'] < $time_now - 5*60) {
                    $getcontent_url = $server_url . "/view_kundun_log.php";
                    $getcontent_data = array(
                        'passtransfer'    =>  $passtransfer
                    ); 
                    
                    $show = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
            
            		if ( !empty($show) )
            		{
                        $show_explode = explode('<nbb>', $show);
                        if($show_explode[1] == 'OK') {
                            $kundun_arr = json_decode($show_explode[2], true);
                            unset($data_arr['kudnun']['data']);
                            $data_arr['kudnun']['data'] = $kundun_arr;
                            $data_arr['kudnun']['timecheck'] = $time_now;
                            
                            $data = json_encode($data_arr);
                            
                            //Ghi vào file
                    			$fp = fopen($file_host, "w");  
                    			fputs ($fp, $data);
                    			fclose($fp);
                    		//End Ghi vào File
                        } else {
                            $err = "Lỗi : $show";
                        }
            		}
                }
                // Data Other End
                
                foreach($eventgame_arr as $eventgame_k => $eventgame_v) {
                    if($eventgame_k != 'kundun') {
                        $eventgame_time_arr = explode('|', $eventgame_v['time']);
                        $in_day = 0;
                        foreach($eventgame_time_arr as $time_k => $time_v) {
                            $timer_date = $datenow ." {$time_v}:00";
                            $event_timer_date = $timer_date;
                            if(time() < strtotime($event_timer_date)) {
                                $in_day = 1;
                                break;
                            }
                        }
                        if($in_day == 0) {
                            $event_timer_date = $date_tomorrow ." ". $eventgame_time_arr[0] .":00";
                        }
                        $event_timer = strtotime($event_timer_date);
                        
                        $count_event_time = count($eventgame_show_arr[$event_timer]);
                        
                        $eventgame_show_arr[$event_timer][$count_event_time]['name'] = $eventgame_v['name'];
                        $eventgame_show_arr[$event_timer][$count_event_time]['server'] = $eventgame_v['server'];
                        $eventgame_show_arr[$event_timer][$count_event_time]['timer'] = $event_timer_date;
                        $eventgame_show_arr[$event_timer][$count_event_time]['timer_show'] = date('H:i', strtotime($event_timer_date));
                    }
                }
                
                
                ksort($eventgame_show_arr);
                
                $page_template = 'templates/char_manager.tpl';
		}
	}
	else {
       $page_template = 'templates/char_manager.tpl';
	}
}
?>