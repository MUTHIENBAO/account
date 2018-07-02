<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include('config/config_giftcode_rs.php');

switch ($giftcode_rs_use){ 
	case 1:
        $file_giftcode = 'config/giftcode_random_type1.txt';
	break;

	case 2:
        $file_giftcode = 'config/giftcode_random_type2.txt';
	break;

	case 3:
        $file_giftcode = 'config/giftcode_random_type3.txt';
	break;

	default :  $file_giftcode = 'config/giftcode_random_type1.txt';
}

    //Đọc File GiftCode
	$slg_item = 0;
	if(is_file($file_giftcode)) {
		$fopen_host = fopen($file_giftcode, "r");
		$total_rate = 0;
		while (!feof($fopen_host)) {
			$get_item = fgets($fopen_host,1000);
			$get_item = preg_replace('(\n)', '', $get_item);
			if($get_item) {
				$item_info = explode('|', $get_item);
				if(strlen($item_info[1]) > 0 && strlen($item_info[1])%32 == 0) {
				    $check_stat = substr($get_item,0,2);
    				if($check_stat == '//') $stat = 0;
    				else $stat = 1;
    				if($stat == 1) {
    				    $slg_item++;
        				$total_rate += $item_info[3];
        				$item_read[] = array (
        					'des'	=> $item_info[2],
        					'rate'	=> $item_info[3],
        					'stat'	=> $stat
        				);
    				}
				}
			}
		}
	} else $fopen_host = fopen($filename, "w");
	fclose($fopen_host);
    
    for($i=0; $i<count($item_read); $i++) {
        $item_read[$i]['rate'] = floor($item_read[$i]['rate']*100/$total_rate);
    }

$page_template = "templates/giftcode/giftcode_rs.tpl";
?>