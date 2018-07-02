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
	$file_host = "data/rank_other.txt";
    
	$time = time();

	$fp_host = fopen($file_host, "r");
	$rank_info = fgets($fp_host);
	fclose($fp_host);
    
    $rank_arr = json_decode($rank_info, true);
    $time_top = $rank_arr[$act]['time'];
        $time_top = intval($time_top);
    
	if ($time >= ($time_top+3600) || $time_top > $time || date("d", $time) != date("d", $time_top) )
	{
		$getcontent_url = $server_url . "/view_top_other.php";
        $getcontent_data = array(
            'action'    =>  $act,
            'passtransfer'    =>  $passtransfer
        ); 
        
        $show = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

		if ( !empty($show) )
		{
            $show_explode = explode('<nbb>', $show);
            if($show_explode[1] == 'OK') {
                $rank_get_arr = json_decode($show_explode[2], true);
                $rank_arr[$act] = $rank_get_arr[$act];
                $rank_arr[$act]['time'] = $time;
                
                $rank_json = json_encode($rank_arr);
                
                //Ghi vào file
        			$fp = fopen($file_host, "w+");  
        			fputs ($fp, $rank_json);
        			fclose($fp);
        		//End Ghi vào File
                
                $time_top = $time;
            } else {
                $err = "Lỗi : $show";
            }
		}
	}
    
    $time_top = date("h:i A d/m/Y",$time_top);
    
    foreach($rank_arr[$act][$theheid] as $key => $value) {
        switch($rank_arr[$act][$theheid][$key]['class'])
        {
            case 0:  $rank_arr[$act][$theheid][$key]['class'] ='DW 1'; break;
            case 1:  $rank_arr[$act][$theheid][$key]['class'] ='DW 2'; break;
            case 2:
            case 3:  $rank_arr[$act][$theheid][$key]['class'] ='DW 3'; break;
            
            case 16:  $rank_arr[$act][$theheid][$key]['class'] ='DK 1'; break;
            case 17:  $rank_arr[$act][$theheid][$key]['class'] ='DK 2'; break;
            case 18:
            case 19:  $rank_arr[$act][$theheid][$key]['class'] ='DK 3'; break;
            
            case 32:  $rank_arr[$act][$theheid][$key]['class'] ='Elf1 '; break;
            case 33:  $rank_arr[$act][$theheid][$key]['class'] ='Elf 2'; break;
            case 34:
            case 35:  $rank_arr[$act][$theheid][$key]['class'] ='Elf 3';  break;
            
            case 48:  $rank_arr[$act][$theheid][$key]['class'] ='MG 1'; break;
            case 49:
            case 50:  $rank_arr[$act][$theheid][$key]['class'] ='MG 3'; break;
            
            case 64:  $rank_arr[$act][$theheid][$key]['class'] ='DL 1'; break;
            case 65:
            case 66:  $rank_arr[$act][$theheid][$key]['class'] ='DL 3'; break;
            
            case 80:  $rank_arr[$act][$theheid][$key]['class'] ='SUM 1'; break;
            case 81:  $rank_arr[$act][$theheid][$key]['class'] ='SUM 2'; break;
            case 82:
            case 83:  $rank_arr[$act][$theheid][$key]['class'] ='SUM 3'; break;
            
            case 96:  $rank_arr[$act][$theheid][$key]['class'] ='RF 1'; break;
            case 97:
            case 98:  $rank_arr[$act][$theheid][$key]['class'] ='RF 3'; break;
        }
    }
    $rank = $rank_arr[$act][$theheid];
    $title_top[] = "TOP Reset <strong>$title_top_class</strong> $title_top_date <strong>$value</strong>";
    	
    
	$page_template = 'templates/rank/rank_pmaster.tpl';
}
}
?>