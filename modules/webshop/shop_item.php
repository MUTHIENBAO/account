<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
$file_shopitem = 'config/webshopitem.txt';
include('config/config_webshop.php');

switch ($act)
{
	case 'shop_taphoa': 
		$tilte = "Cửa hàng Tạp Hóa";
        $webshop_type = 1;
		break;
	case 'shop_event': 
		$tilte = "Cửa hàng vé Event";
        $webshop_type = 15;
		break;
	case 'shop_kiem': 
		$tilte = "Cửa hàng Kiếm";
        $webshop_type = 2;
		break;
	case 'shop_gay': 
		$tilte = "Cửa hàng Gậy";
        $webshop_type = 3;
		break;
	case 'shop_cung': 
		$tilte = "Cửa hàng Cung";
        $webshop_type = 4;
		break;
	case 'shop_vukhikhac': 
		$tilte = "Cửa hàng Vũ Khí Khác";
        $webshop_type = 5; 
		break;
	case 'shop_khien': 
		$tilte = "Cửa hàng Khiên";
        $webshop_type = 6;
		break;
	case 'shop_mu': 
		$tilte = "Cửa hàng Mũ";
        $webshop_type = 7;
		break;
	case 'shop_ao': 
		$tilte = "Cửa hàng Áo";
        $webshop_type = 8;
		break;
	case 'shop_quan': 
		$tilte = "Cửa hàng Quần";
        $webshop_type = 9;
		break;
	case 'shop_tay': 
		$tilte = "Cửa hàng Tay";
        $webshop_type = 10;
		break;
	case 'shop_chan': 
		$tilte = "Cửa hàng Chân";
        $webshop_type = 11;
		break;
	case 'shop_trangsuc': 
		$tilte = "Cửa hàng Trang Sức";
        $webshop_type = 12; 
		break;
	case 'shop_canh': 
		$tilte = "Cửa hàng Cánh";
        $webshop_type = 13;
		break;
	case 'shop_acient': 
		$tilte = "Cửa hàng SET Thần Thánh";
        $webshop_type = 14;
		break;
	default: 
        $tilte = "Cửa hàng không tồn tại.";
        $webshop_type = 99;
}
	
	
	//Đọc File WebShop
	$fopen_host = fopen($file_shopitem, "r");
    $item_get = fgets($fopen_host);
	fclose($fopen_host);
    
    $item_listall_arr = json_decode($item_get, true);
    $item_arr = $item_listall_arr[$webshop_type];
    
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
            		break;
                case 8:
            		$item_arr[$key]['exl'][1]	= '3% cơ hội loại bỏ sức phòng thủ';
            		$item_arr[$key]['exl'][2]	= '3 % phản đòn khi cận chiến';
            		$item_arr[$key]['exl'][3]	= '3% khả năng hồi phục hoàn toàn HP';
            		$item_arr[$key]['exl'][4]	= '3% khả năng hồi phục hoàn toàn nội lực';
            		$item_arr[$key]['option_type'] = 'Tự động hồi phục HP';
                    $item_arr[$key]['option_mul'] = 1; 
                    $item_arr[$key]['option_bonus'] = '%';
            		break;
                case 9:
            		$item_arr[$key]['exl'][1]	= '7% cơ hội loại bỏ sức phòng thủ';
            		$item_arr[$key]['exl'][2]	= '7 % phản đòn khi cận chiến';
            		$item_arr[$key]['exl'][3]	= '7% khả năng hồi phục hoàn toàn HP';
            		$item_arr[$key]['exl'][4]	= '7% khả năng hồi phục hoàn toàn nội lực';
            		$item_arr[$key]['option_type'] = 'Tự động hồi phục HP'; 
                    $item_arr[$key]['option_mul'] = 1;
                    $item_arr[$key]['option_bonus'] = '%';
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
    
	$page_template = "templates/webshop/shop_item.tpl";
?>