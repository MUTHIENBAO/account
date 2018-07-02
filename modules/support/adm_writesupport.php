<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
if( in_array($_SESSION[mu_username], $quantri_arr )) {
	
if ( $_POST['action'] == 'sendsupport' )
{
	$supporttitle = $_POST['supporttitle'];
	$supportcontent = $_POST['supportcontent'];
	
    if (empty($supporttitle))
	{
		$notice = "Chưa nhập Tiêu đề Tin nhắn";
	}
	elseif (empty($supportcontent))
	{
		$notice = "Chưa nhập Nội dung Tin nhắn";
	}
	else {
	   $supporttitle .= " - <b><i>BQT gửi</i></b>";
        $support_add_query = "INSERT INTO support (AccountID, sup_title, sup_content, sup_timenew, sup_time, sup_read, sup_status) VALUES ('$_SESSION[mu_username]', '$supporttitle', '$supportcontent', $time_now, $time_now, 1, 9)";
        $support_add_result = mysql_query($support_add_query);
            check_queryerror($support_add_query, $support_add_result);
        $notice = "Gửi tin nhắn đến người chơi thành công.";
        $addsupport_status = 1;
	}
} 
if ($addsupport_status != 1 ) $page_template = "templates/support/adm_writesupport.tpl";
} else echo "<center><font color='red'>Bạn không phải BQT - Không được phép truy cập</font></center>";
?>