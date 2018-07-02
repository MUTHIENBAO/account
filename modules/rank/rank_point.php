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
	$file_host = "data/top_point.txt";

	if(is_file($file_host)) $fp_host = fopen($file_host, "r");
	else $fp_host = fopen($file_host, "w");
	
	$time_host = intval(fgets($fp_host,15));
	fclose($fp_host);
	
	$time = time();
	
	if ($time >= ($time_host+1*60*60) || $time_host > $time || date("d", $time) != date("d", $time_host) )
	{
		
		$getcontent_url = $server_url . "/view_toppoint.php";
        $getcontent_data = array(
            'passtransfer'    =>  $passtransfer
        ); 
        
        $show = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

		if ( !empty($show) )
		{
    		$info = read_TagName($show, 'info', 1);
            if($info == "OK") {
                $toppoint = read_TagName($show, 'toppoint', 1);
                //Ghi vào file
        			$fp = fopen($file_host, "w");  
        			fputs ($fp,$time."\n".$toppoint);
        			fclose($fp);
        		//End Ghi vào File
            }
		}
	}
	
	$fopen_host = fopen($file_host, "r");
	
    $toppoint_arr = array();
	while (!feof($fopen_host)) {
		$toppoint_load = fgets($fopen_host);
		
		if ( strlen($toppoint_load) < 50 )
		{
			$time_top = date("H:i A d/m/Y", intval($toppoint_load));
		}
		else {
			$toppoint_arr = json_decode($toppoint_load, true);
		}
	}
	
	fclose($fopen_host);

	$page_template = 'templates/rank/rank_point.tpl';
}
}
?>