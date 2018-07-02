<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
include('config/config_rewarditem.php');
$file_thueitem = 'config/rewarditem.txt';

$action = $_GET['action'];

switch ($action){ 
	case 'rewardprice':
        $reward_type = abs(intval($_GET['reward_type']));   if($reward_type < 1 || $reward_type > 13) $reward_type = 99;
        $vitri = $_GET['vitri'];
        $luck = abs(intval($_GET['luck']));         if($luck != 1) $luck = 0;
        $exl[1] = abs(intval($_GET['exl1']));         if($exl[1] != 1) $exl[1] = 0;
        $exl[2] = abs(intval($_GET['exl2']));         if($exl[2] != 1) $exl[2] = 0;
        $exl[3] = abs(intval($_GET['exl3']));         if($exl[3] != 1) $exl[3] = 0;
        $exl[4] = abs(intval($_GET['exl4']));         if($exl[4] != 1) $exl[4] = 0;
        $exl[5] = abs(intval($_GET['exl5']));         if($exl[5] != 1) $exl[5] = 0;
        $exl[6] = abs(intval($_GET['exl6']));         if($exl[6] != 1) $exl[6] = 0;
        $lvl = abs(intval($_GET['lvl']));           if($lvl < 0 || $lvl > 15) $lvl = 0;
        $opt = abs(intval($_GET['opt']));           if($opt < 0 || $opt > 7) $opt = 0;
        $rewardday = abs(intval($_GET['rewardday']));           if(!in_array($rewardday, array(1,3,7,15,30))) $rewardday = 0;
        
        $error = "";
        if($rewardday == 0) {
            $error .= "Chưa chọn ngày Thuê.<br />";
        }
        if($use_day[$rewardday] != 1) {
            $error .= "Thời gian Thuê không cho phép. Vui lòng chọn lại thời gian thuê.<br />";
        }
        if (!preg_match("/^[A-F0-9]*$/i", $vitri))
    	{
            $error .= "Dữ liệu lỗi <strong>Mã Item</strong> : $vitri . Chi duoc su dung ki tu a-f, A-F, so (1-9).<br />"; 
    	}
        if( strlen($vitri) <> 32 ) {
            $error .= "Dữ liệu lỗi <strong>Mã Item</strong> : $vitri phải có 32 ký tự.<br />";
        }
        if( $lvl > $item_lv_max ) {
            $error .= "Dữ liệu lỗi <strong>Cấp độ Item</strong> : <strong>$lvl</strong> không được lớn hơn <strong>$item_lv_max</strong>.<br />";
        }
        
        if(strlen($error) == 0) {
            //Đọc File Reward
        	$fopen_host = fopen($file_thueitem, "r");
            $item_get = fgets($fopen_host);
        	fclose($fopen_host);
            
            $item_listall_arr = json_decode($item_get, true);
            
            $item = array();
            if(isset($item_listall_arr[$reward_type][$vitri])) {
                $item = $item_listall_arr[$reward_type][$vitri];
                
                $msg = "<table border='1' style='border-collapse:collapse' width='100%'><tr><td align='center' width='320'><strong>Thông Tin</strong></td><td align='center'><strong>Chi Phí</strong></td></tr>";
                
                $price_reward = $item['price'];
                $msg .= "<tr><td align='right'>Chi phí Gốc </td><td align='right'>". number_format($price_reward, 0, ',', '.') ." Gcoin</td>";
                
                // Luck
                if($luck == 1) {
                    $price_reward += $price_luck;
                    $msg .= "<tr><td align='right'>Dòng May Mắn </td><td align='right'>". number_format($price_luck, 0, ',', '.') ." Gcoin</td>";
                }
                
                switch ($item['exl_type']) {
                	case 0 :
                		$exl_info[1]	= 'Tăng lượng MANA khi giết quái (MANA/8)';
                		$exl_info[2]	= 'Tăng lượng LIFE khi giết quái (LIFE/8)';
                		$exl_info[3]	= 'Tốc độ tấn công +7';
                		$exl_info[4]	= 'Tăng lực tấn công 2%';
                		$exl_info[5]	= 'Tăng lực tấn công (Cấp độ/20)';
                		$exl_info[6]	= 'Khả năng xuất hiện lực tấn công hoàn hảo +10%';
                        
                        $price_exl[1]	= $vukhi_exl[1];
                		$price_exl[2]	= $vukhi_exl[2];
                		$price_exl[3]	= $vukhi_exl[3];
                		$price_exl[4]	= $vukhi_exl[4];
                		$price_exl[5]	= $vukhi_exl[5];
                		$price_exl[6]	= $vukhi_exl[6];
                        
                        $opt_info['option_type'] = 'Tăng thêm sát thương'; 
                        $opt_info['option_mul'] = 4;
                        $opt_info['option_bonus'] = '';
                		break;
                	case 1:
                		$exl_info[1]	= 'Lượng ZEN rơi ra khi giết quái +40%';
                		$exl_info[2]	= 'Khả năng xuất hiện phòng thủ hoàn hảo +10%';
                		$exl_info[3]	= 'Phản hồi sát thương +5%';
                		$exl_info[4]	= 'Giảm sát thương +4%';
                		$exl_info[5]	= 'Lượng MANA tối đa +4%';
                		$exl_info[6]	= 'Lượng HP tối đa +4%';
                        
                        $price_exl[1]	= $giap_exl[1];
                		$price_exl[2]	= $giap_exl[2];
                		$price_exl[3]	= $giap_exl[3];
                		$price_exl[4]	= $giap_exl[4];
                		$price_exl[5]	= $giap_exl[5];
                		$price_exl[6]	= $giap_exl[6];
                        
                        $price_lv_plus[$lvl] = $price_shield_lv_plus[$lvl];
                        
                        $opt_info['option_type'] = 'Tăng thêm phòng thủ'; 
                        $opt_info['option_mul'] = 4;
                        $opt_info['option_bonus'] = '';
                		break;
                	case 2:
                		$exl_info[1]	= 'Lượng ZEN rơi ra khi giết quái +40%';
                		$exl_info[2]	= 'Khả năng xuất hiện phòng thủ hoàn hảo +10%';
                		$exl_info[3]	= 'Phản hồi sát thương +5%';
                		$exl_info[4]	= 'Giảm sát thương +4%';
                		$exl_info[5]	= 'Lượng MANA tối đa +4%';
                		$exl_info[6]	= 'Lượng HP tối đa +4%';
                        
                        $price_exl[1]	= $giap_exl[1];
                		$price_exl[2]	= $giap_exl[2];
                		$price_exl[3]	= $giap_exl[3];
                		$price_exl[4]	= $giap_exl[4];
                		$price_exl[5]	= $giap_exl[5];
                		$price_exl[6]	= $giap_exl[6];
                        
                        $price_lv_plus[$lvl] = $price_armor_lv_plus[$lvl];
                        
                        $opt_info['option_type'] = 'Tăng thêm phòng thủ'; 
                        $opt_info['option_mul'] = 4;
                        $opt_info['option_bonus'] = '';
                		break;
                	case 3: 
                		$exl_info[1]	= '+ 115 Lượng HP tối đa';
                		$exl_info[2]	= '+ 115 Lượng MP tối đa';
                		$exl_info[3]	= 'Khả năng loại bỏ phòng thủ đối phương +3%';
                		$exl_info[4]	= '+ 50 Lực hành động tối đa';
                		$exl_info[5]	= 'Tốc độ tấn công +7';
                        
                        $price_exl[1]	= $wing2_exl[1];
                		$price_exl[2]	= $wing2_exl[2];
                		$price_exl[3]	= $wing2_exl[3];
                		$price_exl[4]	= $wing2_exl[4];
                		$price_exl[5]	= $wing2_exl[5];
                        
                        $price_lv_plus[$lvl] = $wing2_price_lv_plus[$lvl];
                        
                        $opt_info['option_type'] = 'Tăng thêm sát thương'; 
                        $opt_info['option_mul'] = 4;
                        $opt_info['option_bonus'] = '';
                		break;
                	case 4:
                		$exl_info[1]	= 'Lượng ZEN rơi ra khi giết quái +40%';
                		$exl_info[2]	= 'Khả năng xuất hiện phòng thủ hoàn hảo +10%';
                		$exl_info[3]	= 'Phản hồi sát thương +5%';
                		$exl_info[4]	= 'Giảm sát thương +4%';
                		$exl_info[5]	= 'Lượng MANA tối đa 4%';
                		$exl_info[6]	= 'Lượng HP tối đa 4%';
                        
                        $price_exl[1]	= $giap_exl[1];
                		$price_exl[2]	= $giap_exl[2];
                		$price_exl[3]	= $giap_exl[3];
                		$price_exl[4]	= $giap_exl[4];
                		$price_exl[5]	= $giap_exl[5];
                		$price_exl[6]	= $giap_exl[6];
                        
                        $price_option[$opt] = $pent_ring_price_option[$opt];
                        $price_lv_plus[$lvl] = $price_ring_lv_plus[$lvl];
                        
                        $opt_info['option_type'] = 'Tự động hồi phục HP'; 
                        $opt_info['option_mul'] = 1;
                        $opt_info['option_bonus'] = '%';
                		break;
                	case 5:
                		$exl_info[1]	= 'Tăng lượng MANA khi giết quái (MANA/8)';
                		$exl_info[2]	= 'Tăng lượng LIFE khi giết quái (LIFE/8)';
                		$exl_info[3]	= 'Tốc độ tấn công +7';
                		$exl_info[4]	= 'Tăng lực tấn công 2%';
                		$exl_info[5]	= 'Tăng lực tấn công (Cấp độ/20)';
                		$exl_info[6]	= 'Khả năng xuất hiện lực tấn công hoàn hảo +10%';
                        
                        $price_exl[1]	= $vukhi_exl[1];
                		$price_exl[2]	= $vukhi_exl[2];
                		$price_exl[3]	= $vukhi_exl[3];
                		$price_exl[4]	= $vukhi_exl[4];
                		$price_exl[5]	= $vukhi_exl[5];
                		$price_exl[6]	= $vukhi_exl[6];
                        
                        $price_option[$opt] = $pent_ring_price_option[$opt];
                        $price_lv_plus[$lvl] = $price_pendant_lv_plus[$lvl];
                        
                        $opt_info['option_type'] = 'Tự động hồi phục HP'; 
                        $opt_info['option_mul'] = 1;
                        $opt_info['option_bonus'] = '%';
                		break;
                	case 6:
                		$exl_info[1]	= 'Sói Tấn Công';
                		$exl_info[2]	= 'Sói Phòng Thủ';
                		$exl_info[3]	= 'Sói Hoàng Kim';
                        
                        $price_exl[1]	= 'Sói Tấn Công';
                		$price_exl[2]	= 'Sói Phòng Thủ';
                		$price_exl[3]	= 'Sói Hoàng Kim';
                        $opt_info['option_type'] = ''; 
                        $opt_info['option_mul'] = 1;
                        $opt_info['option_bonus'] = '';
                		break;
                    case 7:
                		$exl_info[1]	= '5% cơ hội loại bỏ sức phòng thủ';
                		$exl_info[2]	= '5 % phản đòn khi cận chiến';
                		$exl_info[3]	= '5% khả năng hồi phục hoàn toàn HP';
                		$exl_info[4]	= '5% khả năng hồi phục hoàn toàn nội lực';
                        
                        $price_exl[1]	= $wing3_exl[1];
                		$price_exl[2]	= $wing3_exl[2];
                		$price_exl[3]	= $wing3_exl[3];
                		$price_exl[4]	= $wing3_exl[4];
                        
                        $price_option[$opt] = $w3_price_option[$opt];
                        $price_lv_plus[$lvl] = $w3_price_lv_plus[$lvl];
                        
                        $opt_info['option_type'] = 'Tự động hồi phục HP'; 
                        $opt_info['option_mul'] = 1;
                        $opt_info['option_bonus'] = '%';
                		break;
                    case 8:
                		$exl_info[1]	= '3% cơ hội loại bỏ sức phòng thủ';
                		$exl_info[2]	= '3 % phản đòn khi cận chiến';
                		$exl_info[3]	= '3% khả năng hồi phục hoàn toàn HP';
                		$exl_info[4]	= '3% khả năng hồi phục hoàn toàn nội lực';
                        
                        $price_exl[1]	= $wing25_exl[1];
                		$price_exl[2]	= $wing25_exl[2];
                		$price_exl[3]	= $wing25_exl[3];
                		$price_exl[4]	= $wing25_exl[4];
                        
                        $price_option[$opt] = $wing25_price_option[$opt];
                        $price_lv_plus[$lvl] = $wing25_price_lv_plus[$lvl];
                        
                        $opt_info['option_type'] = 'Tự động hồi phục HP';
                        $opt_info['option_mul'] = 1; 
                        $opt_info['option_bonus'] = '%';
                		break;
                    case 9:
                		$exl_info[1]	= '7% cơ hội loại bỏ sức phòng thủ';
                		$exl_info[2]	= '7 % phản đòn khi cận chiến';
                		$exl_info[3]	= '7% khả năng hồi phục hoàn toàn HP';
                		$exl_info[4]	= '7% khả năng hồi phục hoàn toàn nội lực';
                        
                        $price_exl[1]	= $wing4_exl[1];
                		$price_exl[2]	= $wing4_exl[2];
                		$price_exl[3]	= $wing4_exl[3];
                		$price_exl[4]	= $wing4_exl[4];
                        
                        $price_option[$opt] = $w4_price_option[$opt];
                        $price_lv_plus[$lvl] = $w4_price_lv_plus[$lvl];
                        
                        $opt_info['option_type'] = 'Tự động hồi phục HP'; 
                        $opt_info['option_mul'] = 1;
                        $opt_info['option_bonus'] = '%';
                		break;
                	default:
               	}
                
                // Lvl
                if($lvl >= 1 && $lvl <= 15) {
                    $price_reward += $price_lv_plus[$lvl];
                    $msg .= "<tr><td align='right'>Cấp Độ +". $lvl ." </td><td align='right'>". number_format($price_lv_plus[$lvl], 0, ',', '.') ." Gcoin</td>";
                    
                }
                
                // Option
                if($opt >= 1 && $opt <= 7) {
                    $price_reward += $price_option[$opt];
                    $msg .= "<tr><td align='right'>". $opt_info['option_type'] ." +". $opt_info['option_mul']*$opt ." ". $opt_info['option_bonus'] ." </td><td align='right'>". number_format($price_option[$opt], 0, ',', '.') ." Gcoin</td>";
                }
                
                // Excellent
                $exl_total = 0;
                foreach($exl as $k => $v) {
                    if($v == 1) {
                        ++$exl_total;
                        $price_reward += $price_exl[$k];
                        $msg .= "<tr><td align='right'><strong>". $exl_info[$k] ."</strong> </td><td align='right'>". number_format($price_exl[$k], 0, ',', '.') ." Gcoin</td>";
                    }
                }
                
                if($exl_total > 0 && $price_exl_plus[$exl_total] > 0) {
                    $price_reward += $price_exl_plus[$exl_total];
                    $msg .= "<tr><td align='right'>Có ". $exl_total ." dòng hoàn hảo trả thêm </td><td align='right'>". number_format($price_exl_plus[$exl_total], 0, ',', '.') ." Gcoin</td>";
                }
                
                $msg .= "<tr><td align='right'><strong><font color='blue'>Chi phí thuê 1 Ngày</font></strong> </td><td align='right'><strong><font color='blue'>". number_format($price_reward, 0, ',', '.') ." Gcoin</font></strong></td>";
                
                if($rewardday > 1) {
                    $price_reward = $price_reward * $rewardday;
                    $msg .= "<tr><td align='right'>Chi phí thuê ". $rewardday ." Ngày chưa giảm </td><td align='right'>". number_format($price_reward, 0, ',', '.') ." Gcoin</td>";
                    
                    $price_redure = floor($price_reward * $price_day_redure[$rewardday] / 100);
                    $msg .= "<tr><td align='right'><font color='brown'>Thuê ". $rewardday ." Ngày được giảm ". $price_day_redure[$rewardday] ." %</font> </td><td align='right'><font color='brown'>- ". number_format($price_redure, 0, ',', '.') ." Gcoin</font></td>";
                    
                    $price_reward -= $price_redure;
                    
                    $msg .= "<tr><td align='right'><strong><font color='red'>Chi phí thuê ". $rewardday ." Ngày</font></strong> </td><td align='right'><strong><font color='red'>". number_format($price_reward, 0, ',', '.') ." Gcoin</font></strong></td>";
                }
                
                $msg .= "</table>";
                echo "|OK|$msg|";
            } else {
                $error = "Item muốn Thuê không có.";
            }
        }
        
        if(strlen($error) > 0) {
            echo $error;
        }
	break;

	case 'rewardsend':
        $reward_type = abs(intval($_GET['reward_type']));   if($reward_type < 1 || $reward_type > 13) $reward_type = 99;
        $vitri = $_GET['vitri'];
        $luck = abs(intval($_GET['luck']));         if($luck != 1) $luck = 0;
        $exl[1] = abs(intval($_GET['exl1']));         if($exl[1] != 1) $exl[1] = 0;
        $exl[2] = abs(intval($_GET['exl2']));         if($exl[2] != 1) $exl[2] = 0;
        $exl[3] = abs(intval($_GET['exl3']));         if($exl[3] != 1) $exl[3] = 0;
        $exl[4] = abs(intval($_GET['exl4']));         if($exl[4] != 1) $exl[4] = 0;
        $exl[5] = abs(intval($_GET['exl5']));         if($exl[5] != 1) $exl[5] = 0;
        $exl[6] = abs(intval($_GET['exl6']));         if($exl[6] != 1) $exl[6] = 0;
        $lvl = abs(intval($_GET['lvl']));           if($lvl < 0 || $lvl > 15) $lvl = 0;
        $opt = abs(intval($_GET['opt']));           if($opt < 0 || $opt > 7) $opt = 0;
        $rewardday = abs(intval($_GET['rewardday']));           if(!in_array($rewardday, array(1,3,7,15,30))) $rewardday = 0;
        
        $error = "";
        if($rewardday == 0) {
            $error .= "Chưa chọn ngày Thuê.<br />";
        }
        if($use_day[$rewardday] != 1) {
            $error .= "Thời gian Thuê không cho phép. Vui lòng chọn lại thời gian thuê.<br />";
        }
        if (!preg_match("/^[A-F0-9]*$/i", $vitri))
    	{
            $error .= "Dữ liệu lỗi <strong>Mã Item</strong> : $vitri . Chi duoc su dung ki tu a-f, A-F, so (1-9).<br />"; 
    	}
        if( strlen($vitri) <> 32 ) {
            $error .= "Dữ liệu lỗi <strong>Mã Item</strong> : $vitri phải có 32 ký tự.<br />";
        }
        
        if(strlen($error) == 0) {
            $getcontent_url = $server_url . "/sv_reward.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $_SESSION['mu_nvchon'],
                'action'    =>  'reward_item',
                'code'    =>  $vitri,
                'reward_type'    =>  $reward_type,
                'luck'    =>  $luck,
                'exl1'    =>  $exl[1],
                'exl2'    =>  $exl[2],
                'exl3'    =>  $exl[3],
                'exl4'    =>  $exl[4],
                'exl5'    =>  $exl[5],
                'exl6'    =>  $exl[6],
                'lvl'    =>  $lvl,
                'opt'    =>  $opt,
                'rewardday'    =>  $rewardday,
                
                'string_login'    =>  $_SESSION['checklogin'],
                'passtransfer'    =>  $passtransfer
            );
            
            $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
        
        	if ( empty($reponse) ) $error_module = "Server bảo trì.";
        	elseif($reponse == "login_other") {
        		$error_module = "Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.";
        		session_destroy();
        	}
        	else {
        		if ( read_TagName($reponse, 'info', 1) == 'OK' ) {
                    $_SESSION['acc_gcoin'] = read_TagName($reponse, 'gcoin', 1);
                    $_SESSION['acc_gcoin_km'] = read_TagName($reponse, 'gcoinkm', 1);
                    $msg = "Thuê Item thành công.<br /> Đến <b>Server 1</b> - <b>Lorencia</b> tọa độ <b>143, 138</b>.<br />Tiến hành <b>Giao Dịch</b> với NPC <b>ReWard</b> để lấy Item.";
                    echo "|OK|$msg|". number_format($_SESSION['acc_gcoin'], 0, ',', '.') ."|". number_format($_SESSION['acc_gcoin_km'], 0, ',', '.') ."|";
        		} else echo $reponse;
        	}
        }
        
        if(strlen($error) > 0) {
            echo $error;
        }
    break;
    
}



?>