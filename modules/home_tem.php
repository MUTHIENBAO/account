<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 

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
        
    $page_template = "templates/home_tem.tpl";
?>