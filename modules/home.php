<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
 	include('config/config.php');
	include('config/config_napthe.php');
	include('config/config_event.php');
    include('config/config_giftcode_rs.php');
    include('config/config_giftcode_week.php');
    include('config/config_giftcode_month.php');
    include('config/config_giftcode_tanthu.php');
    include('config/config_daugianguoc.php');
    include('config/config_daugia.php');
	include('config/config_thehe.php');

	if(isset($Use_DauGiaNguoc) && $Use_DauGiaNguoc == 1) {
		$line = 0;
		$fopen_host = fopen("data/daugianguoc_bidding.txt", "r");
		while (!feof($fopen_host)) {
			$line++;
			$info = fgets($fopen_host);
			if ( $line == 1 )
			{
				$time_top = gmdate("h:i A d/m/Y", intval($info));
			}
			else {
	              $listitem = $info;
			}
		}
		fclose($fopen_host);
	    $listitem_arr = unserialize_safe($listitem);
	    if(!is_array($listitem_arr)) $listitem_arr = array();
	}
    
    if(isset($Use_DauGia) && $Use_DauGia == 1) {
        $line = 0;
    	$fopen_host = fopen('data/daugia_bidding.txt', "r");
    	while (!feof($fopen_host)) {
    		$line++;
    		$info = fgets($fopen_host);
    		if ( $line == 1 )
    		{
    			$time_top = gmdate("h:i A d/m/Y", intval($info));
    		}
    		else {
                  $data = $info;
    		}
    	}
    	fclose($fopen_host);
        $data_arr = unserialize_safe($data);
        if(!is_array($data_arr)) {
            $listitem_dg_arr = array();
            $item_group_count = array();
        } else {
            $listitem_dg_arr = $data_arr['listitem'];
            $item_group_count = $data_arr['item_group_count'];
        }
        
        $group_item = array();
        foreach($item_group_count as $group_type => $group_count) {
            switch ($group_type){ 
            	case 0:    $group_name = $lang_itemgroup_sword;
            	break;
            
            	case 1:    $group_name = $lang_itemgroup_axe;
            	break;
                
            	case 2:    $group_name = $lang_itemgroup_mace;
            	break;
                
            	case 3:    $group_name = $lang_itemgroup_crepter;
            	break;
                
            	case 4:    $group_name = $lang_itemgroup_spear;
            	break;
                
            	case 5:    $group_name = $lang_itemgroup_bow;
            	break;
                
            	case 6:    $group_name = $lang_itemgroup_crossbow;
            	break;
                
            	case 7:    $group_name = $lang_itemgroup_staff;
            	break;
                
            	case 8:    $group_name = $lang_itemgroup_shield;
            	break;
                
            	case 9:    $group_name = $lang_itemgroup_helm;
            	break;
                
            	case 10:    $group_name = $lang_itemgroup_armor;
            	break;
                
            	case 11:    $group_name = $lang_itemgroup_pant;
            	break;
                
            	case 12:    $group_name = $lang_itemgroup_glove;
            	break;
                
            	case 13:    $group_name = $lang_itemgroup_boot;
            	break;
                
            	case 14:    $group_name = $lang_itemgroup_wing;
            	break;
                
            	case 15:    $group_name = $lang_itemgroup_pet;
            	break;
                
            	case 16:    $group_name = $lang_itemgroup_ring;
            	break;
                
            	case 17:    $group_name = $lang_itemgroup_pendant;
            	break;
                
            	case 18:    $group_name = $lang_itemgroup_orb;
            	break;
                
            	case 19:    $group_name = $lang_itemgroup_scrool;
            	break;
                
            	case 20:    $group_name = $lang_itemgroup_jewel;
            	break;
                
            	case 21:    $group_name = $lang_itemgroup_potion;
            	break;
                
            	case 22:    $group_name = $lang_itemgroup_amulet;
            	break;
                
            	case 23:    $group_name = $lang_itemgroup_event;
            	break;
                
            	case 24:    $group_name = $lang_itemgroup_eventmix;
            	break;
                
            	case 25:    $group_name = $lang_itemgroup_quest;
            	break;
                
            	case 26:    $group_name = $lang_itemgroup_gift;
            	break;
                
            	case 27:    $group_name = $lang_itemgroup_petmix;
            	break;
                
            	case 28:    $group_name = $lang_itemgroup_itemmix;
            	break;
                
            	case 29:    $group_name = $lang_itemgroup_castlesiege;
            	break;
                
            	default :    $group_name = $lang_itemgroup_other;
            }
            $group_item[] = array(
                'group_type'    =>  $group_type,
                'group_name'    =>  $group_name,
                'group_count'   =>  $group_count
            );
        }
    }
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
        
    $page_template = "templates/home".$type.".tpl";
?>