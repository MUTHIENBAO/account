<?php
/**		
 * @author		ndgame	
 * @copyright	2014 - 2015	
 * @website		http://ndgame.net	
 * @HotLine		0169 330 22 84	
 * @Version		v1.05.62		
*/	
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include('config/config_event.php');
 $file_giftcode = 'config/giftcode_random.txt';
	//Đọc File GiftCode
		$giftcode_arr = array();
		if(is_file($file_giftcode)) {
			$fopen_host = fopen($file_giftcode, "r");
			$giftcode_read = fgets($fopen_host);
					
			$giftcode_arr = json_decode($giftcode_read, true);
			fclose($fopen_host);
			if(!is_array($giftcode_arr)) $giftcode_arr = array();
		}
				
		$gift_name = $giftcode_arr[$giftcode_nt_use]['name'];
		$item_read = $giftcode_arr[$giftcode_nt_use]['gift'];
		
$page_template = "templates/giftcode/giftcode_nt.tpl";
?>