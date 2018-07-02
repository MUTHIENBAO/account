<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
if ($Use_XepHang != 1) {
	echo "<center>Chức năng không có hoặc không được sử dụng</center>";
}
else {
if ( !isset($_SESSION['mu_username']) ) {
	echo "<div align=center><font color=red><b>Hãy Login trước khi thực hiện chức năng này</b></font></div>";
	include('modules/home.php');
} else {
    $top_slg_view = 5;
    $file_gift_data = 'config/event_top_rscard_auto.txt';
    // Read Config
    $data_cfg_arr = _json_fileload($file_gift_data);
    // Read Config End
    
    // Read TOP
    $file_host = "data/event_top_auto_data.txt";
            
	$fp_host = fopen($file_host, "a+");
	$rank_info = fgets($fp_host);
	fclose($fp_host);
    
    $rank_arr = json_decode($rank_info, true);
    // Read TOP End
    
	// Chon The he
    if ($thehe_choise)
    {
        if(!isset($_SESSION['thehe'])) $_SESSION['thehe'] = count($thehe_choise)-1;
        if(isset($_GET['thehe'])) $_SESSION['thehe'] = abs(intval($_GET['thehe']));
        $theheid = $_SESSION['thehe'];
    }
	
    if(isset($_GET['type'])) $type = $_GET['type'];
        else $type = 'rs';
    if(isset($_GET['date'])) $date = $_GET['date'];
        else $date = 'day';
    
	$time_now = time();
    
    switch ($type){ 
    	case 'rs':
            $type_name = "Reset";
    	break;
    
    	case 'card':
            $type_name = "Nạp thẻ";
    	break;
    }
    
	/*
		Các bước tiến hành:
		B1: Đọc file trên host lấy thời gian lưu file
		B2: So sánh thời gian hiện tại với thời gian lưu file
		B3: Nếu thời gian hiện tại lớn hơn thời gian lưu file 3600 (1h) thì đọc file trên Server
		B4: Lưu nội dung file trên Server vào file trên Host
		B5: Đọc file lưu trên Host và hiển thị
	*/
	
    $time_top = $rank_arr[$type][$date]['time'];
        $time_top = intval($time_top);
    
	if ($time_now >= ($time_top+300) || $time_top > $time_now || date("d", $time_now) != date("d", $time_top) )
	{
		
        $getcontent_url = $server_url . "/sv_event.php";
        $getcontent_data = array(
            'type'    =>  $type,
            'date'    =>  $date,
            'action'    =>  'get_top',
            
            'pagesv'	=>	'sv_event_top_auto',
            'passtransfer'    =>  $passtransfer
        );
        
        $show = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
        
		if ( !empty($show) )
		{
            $show_explode = explode('<nbb>', $show);
            if($show_explode[1] == 'OK') {
                $rank_get_arr = json_decode($show_explode[2], true);
                unset($rank_arr[$type][$date]);
                $rank_arr[$type][$date]['time'] = $time_now;
                $rank_arr[$type][$date]['top'] = $rank_get_arr;
                
                $rank_json = json_encode($rank_arr);
                
                //Ghi vào file
        			$fp = fopen($file_host, "w+");  
        			fputs ($fp, $rank_json);
        			fclose($fp);
        		//End Ghi vào File
                
                $time_top = $time_now;
            } else {
                $err = "Lỗi : $show";
            }
		}
	}
    
    $time_top = date("h:i A d/m/Y",$time_top);
    $allow_nhangiai = false;
    
    switch($date)
    {
    	case "week":     
            $title_top_date = "Tuần";
            $date_type = "week";
            $week_begin = (date('N', $time_now) == 1) ? strtotime(date('Y-m-d', $time_now)) : strtotime('last Monday', $time_now);
            if(strtotime($TopAuto_RS_Week_Begin) < $week_begin) {
                $allow_nhangiai = true;
                $date_now_index = date('W', $week_begin) % 2;
                $date_before_index = date('W', $week_begin - 24*60*60) % 2;
            }
        break;
        
    	case "month":    
            $title_top_date = "Tháng"; 
            $date_type = "month";
            $month_begin = (date('d', $time_now) == 1) ? strtotime(date('Y-m-d', $time_now)) : strtotime(date('Y-m-01'));
            if(strtotime($TopAuto_RS_Month_Begin) < $month_begin) {
                $allow_nhangiai = true;
                $date_now_index = date('m', $month_begin) % 2;
                $date_before_index = date('m', $month_begin - 24*60*60) % 2;
            }
        break;
        
        default:
            $title_top_date = "Ngày";
            $date_type = "day";
            $yesterday = $time_now - 24*60*60;
            if(strtotime($TopAuto_RS_Day_Begin) < $yesterday) {
                $allow_nhangiai = true;
                $date_now_index = date('w', $time_now);
                $date_before_index = date('w', $yesterday);
            }
    }
    for($date_i = 0; $date_i < 2; $date_i++) {
        if($date_i == 0) $date_index = $date_now_index;
        else $date_index = $date_before_index;
        
        if($date_i == 0 || ($date_i > 0 && $allow_nhangiai === true)) {
            $gift_arr[$date_i] = $data_cfg_arr[$type][$date_type][$date_index];
            for($top_i=1; $top_i<=3; $top_i++) {
                $gift_arr[$date_i][$top_i]['msg'] = "";
                if(strlen($gift_arr[$date_i][$top_i]['msg_item_all']) > 0) $gift_arr[$date_i][$top_i]['msg'] .= "<span class='tag tag-red'>". $gift_arr[$date_i][$top_i]['msg_item_all'] ."</span><br /><hr />";
                if(strlen($gift_arr[$date_i][$top_i]['msg_item_time_all']) > 0) $gift_arr[$date_i][$top_i]['msg'] .= "<span class='tag tag-red'>". $gift_arr[$date_i][$top_i]['msg_item_time_all'] ."</span> <strong>". $gift_arr[$date_i][$top_i]['day_item_time_all'] ." ngày</strong><hr />";
                
                if($gift_arr[$date_i][$top_i]['buff_day'] > 0) $gift_arr[$date_i][$top_i]['msg'] .= "<span class='tag tag-red'>Bùa Thiên Sứ</span> : ". $gift_arr[$date_i][$top_i]['buff_day'] ." ngày<br /><br />";
                
                if($gift_arr[$date_i][$top_i]['gcent_km'] > 0) $gift_arr[$date_i][$top_i]['msg'] .= "<div class='item-box' title='GCent+'><img src='templates/images/icons/g+.png' /><span>x". number_format($gift_arr[$date_i][$top_i]['gcent_km'], 0, ',', '.') ."</span></div>";
                if($gift_arr[$date_i][$top_i]['vcent_km'] > 0) $gift_arr[$date_i][$top_i]['msg'] .= "<div class='item-box' title='Vcent+'><img src='templates/images/icons/v+.png' /><span>x". number_format($gift_arr[$date_i][$top_i]['vcent_km'], 0, ',', '.') ."</span></div>";
                if($gift_arr[$date_i][$top_i]['zen'] > 0) $gift_arr[$date_i][$top_i]['msg'] .= "<div class='item-box' title='ZEN ngân hàng'><img src='templates/images/icons/items/zen.png' /><span>x". number_format($gift_arr[$date_i][$top_i]['zen'], 0, ',', '.') ."</span></div>";
                if($gift_arr[$date_i][$top_i]['chao'] > 0) $gift_arr[$date_i][$top_i]['msg'] .= "<div class='item-box' title='Ngọc Hỗn Nguyên ngân hàng'><img src='templates/images/icons/items/chaos.png' /><span>x". number_format($gift_arr[$date_i][$top_i]['chao'], 0, ',', '.') ."</span></div>";
                if($gift_arr[$date_i][$top_i]['cre'] > 0) $gift_arr[$date_i][$top_i]['msg'] .= "<div class='item-box' title='Ngọc Sáng Tạo ngân hàng'><img src='templates/images/icons/items/creation.png' /><span>x". number_format($gift_arr[$date_i][$top_i]['cre'], 0, ',', '.') ."</span></div>";
                if($gift_arr[$date_i][$top_i]['blue'] > 0) $gift_arr[$date_i][$top_i]['msg'] .= "<div class='item-box' title='Lông Vũ ngân hàng'><img src='templates/images/icons/items/blue.png' /><span>x". number_format($gift_arr[$date_i][$top_i]['blue'], 0, ',', '.') ."</span></div>";
                if($gift_arr[$date_i][$top_i]['pp_extra'] > 0) $gift_arr[$date_i][$top_i]['msg'] .= "<div class='item-box' title='PP+'><img src='templates/images/icons/p+.png' /><span>x". number_format($gift_arr[$date_i][$top_i]['pp_extra'], 0, ',', '.') ."</span></div>";
            }
        }
    }
        
    
    if(is_array($rank_arr[$type][$date]['top'])) {
        foreach($rank_arr[$type][$date]['top'] as $key => $value) {
            foreach($value[$theheid] as $key2 => $value2) {
                switch($rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'])
                {
                    case 0:  $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='DW 1'; break;
                    case 1:  $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='DW 2'; break;
                    case 2: $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='DW 3'; break;
                    case 3:  $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='DW 3'; break;
                    
                    case 16:  $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='DK 1'; break;
                    case 17:  $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='DK 2'; break;
                    case 18:    $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='DK 3'; break;
                    case 19:  $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='DK 3'; break;
                    
                    case 32:  $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='Elf 1'; break;
                    case 33:  $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='Elf 2'; break;
                    case 34:    $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='Elf 3';  break;
                    case 35:  $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='Elf 3';  break;
                    
                    case 48:  $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='MG 2'; break;
                    case 49:    $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='MG 3'; break;
                    case 50:  $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='MG 3'; break;
                    
                    case 64:  $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='DL 2'; break;
                    case 65:    $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='DL 3'; break;
                    case 66:  $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='DL 3'; break;
                    
                    case 80:  $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='SUM 1'; break;
                    case 81:  $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='SUM 2'; break;
                    case 82:    $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='SUM 3'; break;
                    case 83:  $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='SUM 3'; break;
                    
                    case 96:  $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='RF 2'; break;
                    case 97:    $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='RF 3'; break;
                    case 98:  $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['class'] ='RF 3'; break;
                }
                
                if(isset($rank_arr[$type][$date]['top'][$key][$theheid][$key2]['lastrs_time'])) $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['lastrs_time'] = date('d/m H:i:s', $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['lastrs_time']);
                else $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['lastrs_time'] = '';
                
                $thehe_id = $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['thehe'];
                $rank_arr[$type][$date]['top'][$key][$theheid][$key2]['thehe'] = $thehe_choise[$thehe_id];
            }
            
            if($allow_nhangiai === false && count($rank) >= 1) break;
            $rank[] = $rank_arr[$type][$date]['top'][$key][$theheid];
            $title_top[] = "TOP $type_name $title_top_date <strong>$key</strong>";
        }
    }
            
    	
    
	$page_template = 'templates/event/event_top_auto.tpl';
}
}
?>