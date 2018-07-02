<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include('config/config_rewarditem.php');
$file_thueitem = 'config/rewarditem.txt';

switch ($act)
{
	case 'thue_taphoa': 
		$tilte = "Cho thuê Tạp Hóa";
        $reward_type = 1;
		break;
	case 'thue_kiem': 
		$tilte = "Cho thuê Kiếm";
        $reward_type = 2;
		break;
	case 'thue_gay': 
		$tilte = "Cho thuê Gậy";
        $reward_type = 3;
		break;
	case 'thue_cung': 
		$tilte = "Cho thuê Cung";
        $reward_type = 4;
		break;
	case 'thue_vukhikhac': 
		$tilte = "Cho thuê Vũ Khí Khác";
        $reward_type = 5; 
		break;
	case 'thue_khien': 
		$tilte = "Cho thuê Khiên";
        $reward_type = 6;
		break;
	case 'thue_mu': 
		$tilte = "Cho thuê Mũ";
        $reward_type = 7;
		break;
	case 'thue_ao': 
		$tilte = "Cho thuê Áo";
        $reward_type = 8;
		break;
	case 'thue_quan': 
		$tilte = "Cho thuê Quần";
        $reward_type = 9;
		break;
	case 'thue_tay': 
		$tilte = "Cho thuê Tay";
        $reward_type = 10;
		break;
	case 'thue_chan': 
		$tilte = "Cho thuê Chân";
        $reward_type = 11;
		break;
	case 'thue_trangsuc': 
		$tilte = "Cho thuê Trang Sức";
        $reward_type = 12; 
		break;
	case 'thue_canh': 
		$tilte = "Cho thuê Cánh";
        $reward_type = 13;
		break;
	default: 
        $tilte = "Cửa hàng cho thuê không tồn tại.";
        $reward_type = 99;
}
	
	
	//Đọc File Reward
	$fopen_host = fopen($file_thueitem, "r");
    $item_get = fgets($fopen_host);
	fclose($fopen_host);
    
    $item_listall_arr = json_decode($item_get, true);
    $item_arr = $item_listall_arr[$reward_type];
    
    if(is_array($item_arr)) {
        foreach($item_arr as $key => $val) {
            switch ($val['exl_type']) {
            	case 0 :
            		$item_arr[$key]['exl'][1]	= 'Tăng lượng MANA khi giết quái (MANA/8)';
            		$item_arr[$key]['exl'][2]	= 'Tăng lượng LIFE khi giết quái (LIFE/8)';
            		$item_arr[$key]['exl'][3]	= 'Tốc độ tấn công +7';
            		$item_arr[$key]['exl'][4]	= 'Tăng lực tấn công 2%';
            		$item_arr[$key]['exl'][5]	= 'Tăng lực tấn công (Cấp độ/20)';
            		$item_arr[$key]['exl'][6]	= 'Khả năng xuất hiện lực tấn công hoàn hảo +10%';
            		$item_arr[$key]['option_type'] = 'Tăng thêm sát thương'; 
                    $item_arr[$key]['option_mul'] = 4;
                    $item_arr[$key]['option_bonus'] = '';
                    $item_arr[$key]['exl_use'] = $vukhi_exl_use;
            		break;
            	case 1:
            		$item_arr[$key]['exl'][1]	= 'Lượng ZEN rơi ra khi giết quái +40%';
            		$item_arr[$key]['exl'][2]	= 'Khả năng xuất hiện phòng thủ hoàn hảo +10%';
            		$item_arr[$key]['exl'][3]	= 'Phản hồi sát thương +5%';
            		$item_arr[$key]['exl'][4]	= 'Giảm sát thương +4%';
            		$item_arr[$key]['exl'][5]	= 'Lượng MANA tối đa +4%';
            		$item_arr[$key]['exl'][6]	= 'Lượng HP tối đa +4%';
            		$item_arr[$key]['option_type'] = 'Tăng thêm phòng thủ'; 
                    $item_arr[$key]['option_mul'] = 5;
                    $item_arr[$key]['option_bonus'] = '';
                    $item_arr[$key]['exl_use'] = $giap_exl_use;
            		break;
            	case 2:
            		$item_arr[$key]['exl'][1]	= 'Lượng ZEN rơi ra khi giết quái +40%';
            		$item_arr[$key]['exl'][2]	= 'Khả năng xuất hiện phòng thủ hoàn hảo +10%';
            		$item_arr[$key]['exl'][3]	= 'Phản hồi sát thương +5%';
            		$item_arr[$key]['exl'][4]	= 'Giảm sát thương +4%';
            		$item_arr[$key]['exl'][5]	= 'Lượng MANA tối đa +4%';
            		$item_arr[$key]['exl'][6]	= 'Lượng HP tối đa +4%';
            		$item_arr[$key]['option_type'] = 'Tăng thêm phòng thủ'; 
                    $item_arr[$key]['option_mul'] = 4;
                    $item_arr[$key]['option_bonus'] = '';
                    $item_arr[$key]['exl_use'] = $giap_exl_use;
            		break;
            	case 3: 
            		$item_arr[$key]['exl'][1]	= '+ 115 Lượng HP tối đa';
            		$item_arr[$key]['exl'][2]	= '+ 115 Lượng MP tối đa';
            		$item_arr[$key]['exl'][3]	= 'Khả năng loại bỏ phòng thủ đối phương +3%';
            		$item_arr[$key]['exl'][4]	= '+ 50 Lực hành động tối đa';
            		$item_arr[$key]['exl'][5]	= 'Tốc độ tấn công +7';
            		$item_arr[$key]['option_type'] = 'Tăng thêm sát thương'; 
                    $item_arr[$key]['option_mul'] = 4;
                    $item_arr[$key]['option_bonus'] = '';
                    $item_arr[$key]['exl_use'] = $wing2_exl_use;
            		break;
            	case 4:
            		$item_arr[$key]['exl'][1]	= 'Lượng ZEN rơi ra khi giết quái +40%';
            		$item_arr[$key]['exl'][2]	= 'Khả năng xuất hiện phòng thủ hoàn hảo +10%';
            		$item_arr[$key]['exl'][3]	= 'Phản hồi sát thương +5%';
            		$item_arr[$key]['exl'][4]	= 'Giảm sát thương +4%';
            		$item_arr[$key]['exl'][5]	= 'Lượng MANA tối đa 4%';
            		$item_arr[$key]['exl'][6]	= 'Lượng HP tối đa 4%';
            		$item_arr[$key]['option_type'] = 'Tự động hồi phục HP'; 
                    $item_arr[$key]['option_mul'] = 1;
                    $item_arr[$key]['option_bonus'] = '%';
                    $item_arr[$key]['exl_use'] = $giap_exl_use;
            		break;
            	case 5:
            		$item_arr[$key]['exl'][1]	= 'Tăng lượng MANA khi giết quái (MANA/8)';
            		$item_arr[$key]['exl'][2]	= 'Tăng lượng LIFE khi giết quái (LIFE/8)';
            		$item_arr[$key]['exl'][3]	= 'Tốc độ tấn công +7';
            		$item_arr[$key]['exl'][4]	= 'Tăng lực tấn công 2%';
            		$item_arr[$key]['exl'][5]	= 'Tăng lực tấn công (Cấp độ/20)';
            		$item_arr[$key]['exl'][6]	= 'Khả năng xuất hiện lực tấn công hoàn hảo +10%';
            		$item_arr[$key]['option_type'] = 'Tự động hồi phục HP'; 
                    $item_arr[$key]['option_mul'] = 1;
                    $item_arr[$key]['option_bonus'] = '%';
                    $item_arr[$key]['exl_use'] = $vukhi_exl_use;
            		break;
            	case 6:
            		$item_arr[$key]['exl'][1]	= 'Sói Tấn Công';
            		$item_arr[$key]['exl'][2]	= 'Sói Phòng Thủ';
            		$item_arr[$key]['exl'][3]	= 'Sói Hoàng Kim';
            		$item_arr[$key]['option_type'] = ''; 
                    $item_arr[$key]['option_mul'] = 1;
                    $item_arr[$key]['option_bonus'] = '';
            		break;
                case 7:
            		$item_arr[$key]['exl'][1]	= '5% cơ hội loại bỏ sức phòng thủ';
            		$item_arr[$key]['exl'][2]	= '5 % phản đòn khi cận chiến';
            		$item_arr[$key]['exl'][3]	= '5% khả năng hồi phục hoàn toàn HP';
            		$item_arr[$key]['exl'][4]	= '5% khả năng hồi phục hoàn toàn nội lực';
            		$item_arr[$key]['option_type'] = 'Tự động hồi phục HP'; 
                    $item_arr[$key]['option_mul'] = 1;
                    $item_arr[$key]['option_bonus'] = '%';
                    $item_arr[$key]['exl_use'] = $wing3_exl_use;
            		break;
                case 8:
            		$item_arr[$key]['exl'][1]	= '3% cơ hội loại bỏ sức phòng thủ';
            		$item_arr[$key]['exl'][2]	= '3 % phản đòn khi cận chiến';
            		$item_arr[$key]['exl'][3]	= '3% khả năng hồi phục hoàn toàn HP';
            		$item_arr[$key]['exl'][4]	= '3% khả năng hồi phục hoàn toàn nội lực';
            		$item_arr[$key]['option_type'] = 'Tự động hồi phục HP';
                    $item_arr[$key]['option_mul'] = 1; 
                    $item_arr[$key]['option_bonus'] = '%';
                    $item_arr[$key]['exl_use'] = $wing25_exl_use;
            		break;
                case 9:
            		$item_arr[$key]['exl'][1]	= '7% cơ hội loại bỏ sức phòng thủ';
            		$item_arr[$key]['exl'][2]	= '7 % phản đòn khi cận chiến';
            		$item_arr[$key]['exl'][3]	= '7% khả năng hồi phục hoàn toàn HP';
            		$item_arr[$key]['exl'][4]	= '7% khả năng hồi phục hoàn toàn nội lực';
            		$item_arr[$key]['option_type'] = 'Tự động hồi phục HP'; 
                    $item_arr[$key]['option_mul'] = 1;
                    $item_arr[$key]['option_bonus'] = '%';
                    $item_arr[$key]['exl_use'] = $wing4_exl_use;
            		break;
            	default:
            		$item_arr[$key]['option_type'] = ''; 
                    $item_arr[$key]['option_mul'] = 1;
                    $item_arr[$key]['option_bonus'] = '';
            	}
        }
    } else {
        $item_arr = array();
    }
    
	$page_template = "templates/reward/reward_item.tpl";
?>