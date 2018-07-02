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
	
	// Chon The he
    if ($thehe_choise)
    {
        if(!isset($_SESSION['thehe'])) $_SESSION['thehe'] = count($thehe_choise)-1;
        if(isset($_GET['thehe'])) $_SESSION['thehe'] = abs(intval($_GET['thehe']));
        $theheid = $_SESSION['thehe'];
    }
	
	/*
		Các bước tiến hành:
		B1: Đọc file trên host lấy thời gian lưu file
		B2: So sánh thời gian hiện tại với thời gian lưu file
		B3: Nếu thời gian hiện tại lớn hơn thời gian lưu file 3600 (1h) thì đọc file trên Server
		B4: Lưu nội dung file trên Server vào file trên Host
		B5: Đọc file lưu trên Host và hiển thị
	*/
	$file_host = "data/top_reset3.txt";
    
    if(isset($_GET['type'])) $type = $_GET['type'];
        else $type = 'all';
    if(isset($_GET['action'])) $action = $_GET['action'];
        else $action = 'daily';
    
	$time = time();

	$fp_host = fopen($file_host, "a+");
	$rank_info = fgets($fp_host);
	fclose($fp_host);
    
    $rank_arr = unserialize_safe($rank_info);
    $time_top = $rank_arr[$action][$type]['time'];
        $time_top = intval($time_top);
    
	if ($time >= ($time_top+300) || $time_top > $time || date("d", $time) != date("d", $time_top) )
	{
		$getcontent_url = $server_url . "/view_topreset3.php";
        $getcontent_data = array(
            'type'  =>  $type,
            'action'    =>  $action,
            'passtransfer'    =>  $passtransfer
        ); 
        
        $show = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

		if ( !empty($show) )
		{
            $show_explode = explode('<nbb>', $show);
            if($show_explode[1] == 'OK') {
                $rank_get_arr = unserialize_safe($show_explode[2]);
                $rank_get_arr[$action][$type]['time'] = $time;
                $rank_arr[$action][$type] = $rank_get_arr[$action][$type];
                $rank_arr[$action]['date'] = $rank_get_arr[$action]['date'];
                
                $rank_serialize = serialize($rank_arr);
                
                //Ghi vào file
        			$fp = fopen($file_host, "w+");  
        			fputs ($fp, $rank_serialize);
        			fclose($fp);
        		//End Ghi vào File
                
                $time_top = $time;
            } else {
                $err = "Lỗi : $show";
            }
		}
	}
    
    $time_top = date("h:i A d/m/Y",$time_top);
    
    switch($type)
    {
        case "dw":     $title_top_class = "Dark Wizark"; break;
    	case "dk":     $title_top_class = "Dark Knight"; break;
    	case "elf":    $title_top_class = "ELF"; break;
    	case "mg":     $title_top_class = "Magic Gladiator"; break;
    	case "dl":     $title_top_class = "DarkLord"; break;
    	case "sum":    $title_top_class = "Summoner"; break;
    	case "rf":     $title_top_class = "Rage Fighter"; break;
    	default:       $title_top_class = "Tất cả";
                        $type = "all";
    }
    
    switch($action)
    {
    	case "week":     
            $title_top_date = "Tuần"; 
        break;
        
    	case "month":    
            $title_top_date = "Tháng"; 
        break;
        
        default:    $title_top_date = "Ngày";
    }
    
    if(is_array($rank_arr[$action]['date'])) {
        foreach($rank_arr[$action]['date'] as $value) {
            foreach($rank_arr[$action][$type][$value][$theheid] as $key2 => $value2) {
                switch($rank_arr[$action][$type][$value][$theheid][$key2]['class'])
                {
                    case 0:  $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='Dark Wizark'; break;
                    case 1:  $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='Soul Master'; break;
                    case 2: $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='Grand Master'; break;
                    case 3:  $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='Grand Master'; break;
                    
                    case 16:  $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='Dark Knight'; break;
                    case 17:  $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='Blade Knight'; break;
                    case 18:    $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='Blade Master'; break;
                    case 19:  $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='Blade Master'; break;
                    
                    case 32:  $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='Elf'; break;
                    case 33:  $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='Muse Elf'; break;
                    case 34:    $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='Hight Elf';  break;
                    case 35:  $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='Hight Elf';  break;
                    
                    case 48:  $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='Magic Gladiator'; break;
                    case 49:    $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='Duel Master'; break;
                    case 50:  $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='Duel Master'; break;
                    
                    case 64:  $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='DarkLord'; break;
                    case 65:    $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='Lord Emperor'; break;
                    case 66:  $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='Lord Emperor'; break;
                    
                    case 80:  $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='Sumonner'; break;
                    case 81:  $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='Bloody Summoner'; break;
                    case 82:    $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='Dimension Master'; break;
                    case 83:  $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='Dimension Master'; break;
                    
                    case 96:  $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='Rage Fighter'; break;
                    case 97:    $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='First Master'; break;
                    case 98:  $rank_arr[$action][$type][$value][$theheid][$key2]['class'] ='First Master'; break;
                }
                
                if(isset($rank_arr[$action][$type][$value][$theheid][$key2]['lastrs_time'])) $rank_arr[$action][$type][$value][$theheid][$key2]['lastrs_time'] = date('d/m H:i:s', $rank_arr[$action][$type][$value][$theheid][$key2]['lastrs_time']);
                else $rank_arr[$action][$type][$value][$theheid][$key2]['lastrs_time'] = '';
                
                $thehe_id = $rank_arr[$action][$type][$value][$theheid][$key2]['thehe'];
                $rank_arr[$action][$type][$value][$theheid][$key2]['thehe'] = $thehe_choise[$thehe_id];
            }
            $rank[] = $rank_arr[$action][$type][$value][$theheid];
            $title_top[] = "TOP Reset <strong>$title_top_class</strong> $title_top_date <strong>$value</strong>";
        }
    }
    	
    
	$page_template = 'templates/rank/rankrs3.tpl';
}
}
?>