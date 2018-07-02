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
	$file_host = "data/top_phucloi.txt";
    
    if(isset($_GET['action'])) $action = $_GET['action'];
    else $action = 'daily';
        
	$time = time();
    $time_top = 0;
    
	$fp_host = fopen($file_host, "a+");
	$rank_info = fgets($fp_host);
	fclose($fp_host);
    
    $rank_arr = json_decode($rank_info, true);
    if(is_array($rank_arr) && isset($rank_arr[$action]['time'])) {
        $time_top = $rank_arr[$action]['time'];
    }
        
        $time_top = intval($time_top);
    
	if ($time >= ($time_top+1*60*60) || $time_top > $time || date("d", $time) != date("d", $time_top) )
	{
		$getcontent_url = $server_url . "/view_topphucloi.php";
        $getcontent_data = array(
            'action'    =>  $action,
            'passtransfer'    =>  $passtransfer
        ); 
        
        $show = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

		if ( !empty($show) )
		{
            $info = read_TagName($show, 'info', 1);
            if($info == 'OK') {
                $rank_get_arr = json_decode(read_TagName($show, 'toppl', 1), true);
                $rank_get_arr[$action]['time'] = $time;
                $rank_arr[$action] = $rank_get_arr[$action];
                $rank_arr[$action]['date'] = $rank_get_arr[$action]['date'];
                
                $rank_data = json_encode($rank_arr);
                
                //Ghi vào file
        			$fp = fopen($file_host, "w+");  
        			fputs ($fp, $rank_data);
        			fclose($fp);
        		//End Ghi vào File
                
                $time_top = $time;
            } else {
                $error = "Lỗi : $show";
            }
		}
	}
    
    $time_top = date("h:i A d/m/Y",$time_top);
    
   
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
    
    $theheid = $_SESSION['thehe'];
	foreach($rank_arr[$action]['date'] as $value) {
        $rank[] = $rank_arr[$action][$value][$theheid];
        $title_top[] = "TOP Phúc Lợi $title_top_date <strong>$value</strong>";
    }
    
	$page_template = 'templates/rank/rank_phucloi.tpl';
}
}
?>