<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");

if ( $_POST['action'] == 'sendsupport' )
{
	$supporttitle = $_POST['supporttitle'];
	$supportcontent = $_POST['supportcontent'];
	
    if( $sendsv === false ) { $notice = "Tốc độ xử lý của bạn quá nhanh, vui lòng chờ vài giây rồi tiếp tục thực hiện."; }
	elseif (empty($supporttitle))
	{
		$notice = "Chưa nhập Tiêu đề Hỗ trợ";
	}
	elseif (empty($supportcontent))
	{
		$notice = "Chưa nhập Nội dung Hỗ trợ";
	}
	else {
        $support_add_query = "INSERT INTO support (AccountID, sup_title, sup_content, sup_timenew, sup_time) VALUES ('$_SESSION[mu_username]', '$supporttitle', '$supportcontent', $time_now, $time_now)";
        $support_add_result = mysql_query($support_add_query);
            check_queryerror($support_add_query, $support_add_result);
        $notice = "Thêm hỗ trợ thành công. BQT sẽ trả lời bạn trong giây lát, chậm nhất là 24h.";
        $addsupport_status = 1;
	}
} 
if ($addsupport_status != 1 ) $page_template = "templates/support/writesupport.tpl";
?>