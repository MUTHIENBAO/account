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
	$file_host = "data/top_50.txt";

	$time = time();
    $theheid = $_SESSION['thehe'];

	$fp_host = fopen($file_host, "a+");
	$rank_info = fgets($fp_host);
	fclose($fp_host);
    
    $rank_arr = unserialize_safe($rank_info);
    $time_top = $rank_arr[$theheid]['time'];
        $time_top = intval($time_top);
    
	if ( ($time_top > $time) || ( ($time >= ($time_top+300)) && (date("d", $time) != date("d", $rank_arr[$theheid]['timeget'])) ) )
	{
		$getcontent_url = $server_url . "/view_top50.php";
        $getcontent_data = array(
            'thehe'    =>  $theheid,
            'passtransfer'    =>  $passtransfer
        ); 
        
        $show = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

		if ( !empty($show) )
		{
            $show_explode = explode('<nbb>', $show);
            if(isset($show_explode[1]) && $show_explode[1] == 'OK') {
                $rank_get_arr = unserialize_safe($show_explode[2]);
                $rank_get_arr[$theheid]['time'] = $time;
                $rank_arr[$theheid] = $rank_get_arr[$theheid];
                
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
    
    $time_top = date("d/m/Y",$rank_arr[$theheid]['timeget']);

	foreach($rank_arr[$theheid] as $key => $value) {
        if(is_array($rank_arr[$theheid][$key])) {
            switch($value['class'])
            {
                case 0:  $rank_arr[$theheid][$key]['class'] = 'DW 1'; break;
                case 1:  $rank_arr[$theheid][$key]['class'] ='DW 2'; break;
                case 2:
                case 3:  $rank_arr[$theheid][$key]['class'] ='DW 3'; break;
                
                case 16:  $rank_arr[$theheid][$key]['class'] ='DK 1'; break;
                case 17:  $rank_arr[$theheid][$key]['class'] ='DK 2'; break;
                case 18:
                case 19:  $rank_arr[$theheid][$key]['class'] ='DK 3'; break;
                
                case 32:  $rank_arr[$theheid][$key]['class'] ='Elf 1'; break;
                case 33:  $rank_arr[$theheid][$key]['class'] ='Elf 2'; break;
                case 34:
                case 35:  $rank_arr[$theheid][$key]['class'] ='Elf 3';  break;
                
                case 48:  $rank_arr[$theheid][$key]['class'] ='MG 1'; break;
                case 49:
                case 50:  $rank_arr[$theheid][$key]['class'] ='MG 3'; break;
                
                case 64:  $rank_arr[$theheid][$key]['class'] ='DL 1'; break;
                case 65:
                case 66:  $rank_arr[$theheid][$key]['class'] ='DL 3'; break;
                
                case 80:  $rank_arr[$theheid][$key]['class'] ='SUM 1'; break;
                case 81:  $rank_arr[$theheid][$key]['class'] ='SUM 2'; break;
                case 82:
                case 83:  $rank_arr[$theheid][$key]['class'] ='SUM 3'; break;
                
                case 96:  $rank_arr[$theheid][$key]['class'] ='RF 1'; break;
                case 97:
                case 98:  $rank_arr[$theheid][$key]['class'] ='RF 3'; break;
            }
            
            if(!isset($rank_arr[$theheid][$key]['clevel'])) $rank_arr[$theheid][$key]['clevel'] = '';
            
            if(isset($rank_arr[$theheid][$key]['lastrs_time'])) $rank_arr[$theheid][$key]['lastrs_time'] = date('d/m H:i:s', $rank_arr[$theheid][$key]['lastrs_time']);
            else $rank_arr[$theheid][$key]['lastrs_time'] = '';
        }
    }
    
    $rank = $rank_arr[$theheid];
    $title_top = "TOP lúc 0h00 $time_top";
    $thehe_name = $thehe_choise[$theheid];
    
	$page_template = 'templates/rank/rank50.tpl';
}
}
?>