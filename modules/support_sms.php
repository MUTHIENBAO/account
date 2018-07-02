<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include('config/config_sms.php');
include_once("config/config_sms_pri.php");

$leng_cuphap = strlen($cuphap);
if($leng_cuphap == 0) echo "<center><font color='red'>Chưa thiết lập cấu hình SMS. Vui lòng liên hệ BQT để được hỗ trợ.</font></center>";
else {
    $page_template = 'templates/support_sms.tpl';
}
?>