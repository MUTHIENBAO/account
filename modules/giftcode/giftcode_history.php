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

if ( !isset($_SESSION['mu_username']) ) {
	echo "<div align=center><font color=red><b>Hãy Login trước khi thực hiện chức năng này</b></font></div>";
	include('modules/home.php');
} else {
		$file_giftcode_type = 'config/giftcode_type.txt';
        $file_giftcode = 'config/giftcode_random.txt';

        //Đọc File GiftCode Type
        $giftcode_type_arr = array();
        if(is_file($file_giftcode_type)) {
    		$fopen_host = fopen($file_giftcode_type, "r");
            $giftcode_type_read = fgets($fopen_host);
            
            $giftcode_type_arr = json_decode($giftcode_type_read, true);
    	} else $fopen_host = fopen($file_giftcode_type, "w");
    	fclose($fopen_host);
        
        if(!is_array($giftcode_type_arr)) $giftcode_type_arr = array();
        
        //Đọc File GiftCode
        $giftcode_arr = array();
    	if(is_file($file_giftcode)) {
    		$fopen_host = fopen($file_giftcode, "r");
            $giftcode_read = fgets($fopen_host);
            
            $giftcode_arr = json_decode($giftcode_read, true);
            fclose($fopen_host);
            if(!is_array($giftcode_arr)) $giftcode_arr = array();
        }
        
        
		$getcontent_url = $server_url . "/view_giftcode_history.php";
        $getcontent_data = array(
            'login' =>  $_SESSION['mu_username'],
            'passtransfer'    =>  $passtransfer
        ); 
        
        $show = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
        
        $giftcode_history_arr = array();
        if ( !empty($show) )
		{
            $show_explode = explode('<nbb>', $show);
            if($show_explode[1] == 'OK') {
                $giftcode_history_arr = unserialize_safe($show_explode[2]);
            } else {
                $err = "Lỗi : $show";
            }
		}
        // Giftcode SMS
        if(!isset($giftcode_history_arr['sms'])) $giftcode_history_arr['sms'] = array();
        foreach($giftcode_history_arr['sms'] as $key => $val) {
            if($val['exp'] == 1) {
                $giftcode_history_arr['sms'][$key]['sms_cuphap'] = "GiftCode đã hết hạn kích hoạt, vui lòng tạo GiftCode mới";
            } else {
                $giftcode_history_arr['sms'][$key]['sms_cuphap'] = "<font color='red'><b>$cuphap_pri &nbsp;&nbsp;$cuphap&nbsp;&nbsp;". $giftcode_history_arr['sms'][$key]['Code'] ."</b></font>&nbsp;&nbsp;gửi&nbsp;&nbsp;<font color='blue'><b>$dauso</b></font>";
            }
                
            $giftcode_history_arr['sms'][$key]['time_create'] = date('H:i d/m', $giftcode_history_arr['sms'][$key]['time']);
            
            switch ($val['KeyXuLy']){ 
            	case 'GIFTCODE_RS':
                    $giftcode_history_arr['sms'][$key]['time_exp'] = date('H:i d/m', $giftcode_history_arr['sms'][$key]['time'] + 60*60);
                    $giftcode_history_arr['sms'][$key]['type_name'] = "Reset";
            	break;
            
            	case 'GIFTCODE_WEEK':
                    $giftcode_history_arr['sms'][$key]['time_exp'] = date('H:i d/m', $giftcode_history_arr['sms'][$key]['time'] + 5*60);
                    $giftcode_history_arr['sms'][$key]['type_name'] = "Tuần";
            	break;
            
            	case 'GIFTCODE_MONTH':
                    $giftcode_history_arr['sms'][$key]['time_exp'] = date('H:i d/m', $giftcode_history_arr['sms'][$key]['time'] + 5*60);
                    $giftcode_history_arr['sms'][$key]['type_name'] = "Tháng";
            	break;
            
            	default :
            }
            
        }
        
        
        // GiftCode History
        if(!isset($giftcode_history_arr['giftcode'])) $giftcode_history_arr['giftcode'] = array();
        foreach($giftcode_history_arr['giftcode'] as $key => $val) {
            switch ($val['type']){ 
            	case 1:
                    $giftcode_history_arr['giftcode'][$key]['type_name'] = "Giftcode Reset";
            	break;
            
            	case 2:
                    $giftcode_history_arr['giftcode'][$key]['type_name'] = "Giftcode Tuần";
            	break;
            
            	case 3:
                    $giftcode_history_arr['giftcode'][$key]['type_name'] = "Giftcode Tháng";
            	break;
                
                case 4:
                    $giftcode_gifttype = $val['giftcode_gifttype'];
                    if(isset($giftcode_type_arr[$giftcode_gifttype]['name'])) {
                        $giftcode_history_arr['giftcode'][$key]['type_name'] = $giftcode_type_arr[$giftcode_gifttype]['name'];
                    } else {
                        $giftcode_history_arr['giftcode'][$key]['type_name'] = "Giftcode chưa định nghĩa. Mã Loại Giftcode : $giftcode_gifttype";
                    }
                    
                    
                    //$giftcode_history_arr['giftcode'][$key]['type_name'] = "Giftcode Tài Khoản";
            	break;
                
                case 5:
                    $giftcode_gifttype = $val['giftcode_gifttype'];
                    if(isset($giftcode_type_arr[$giftcode_gifttype]['name'])) {
                        $giftcode_history_arr['giftcode'][$key]['type_name'] = $giftcode_type_arr[$giftcode_gifttype]['name'];
                    } else {
                        $giftcode_history_arr['giftcode'][$key]['type_name'] = "Giftcode chưa định nghĩa. Mã Loại Giftcode : $giftcode_gifttype";
                    }
                    
                    //$giftcode_history_arr['giftcode'][$key]['type_name'] = "Giftcode Phát";
            	break;
                
                case 6:
                    $giftcode_history_arr['giftcode'][$key]['type_name'] = "Giftcode 1 FOR ALL";
                    
                    //$giftcode_history_arr['giftcode'][$key]['type_name'] = "Giftcode Phát";
            	break;
                
                case 8:
                    $giftcode_history_arr['giftcode'][$key]['type_name'] = "Giftcode Tân Thủ 2";
            	break;
                
                case 9:
                    $giftcode_history_arr['giftcode'][$key]['type_name'] = "Giftcode Tân Thủ";
            	break;
            
			    case 10:
                    $giftcode_history_arr['giftcode'][$key]['type_name'] = "Giftcode Nạp Thẻ";
            	break;
				
            	default : $giftcode_history_arr['giftcode'][$key]['type_name'] = "Chưa định nghĩa";
            }
            
            $giftcode_history_arr['giftcode'][$key]['time_create'] = date('H:i d/m', $val['gift_time']);
            
            switch ($val['status']){ 
            	case 0:
                    $giftcode_history_arr['giftcode'][$key]['status_info'] = "Chưa kích hoạt";
            	break;
            
            	case 1:
                    $giftcode_history_arr['giftcode'][$key]['status_info'] = "<font color='blue'><b>Có thể sử dụng</b></font>";
            	break;
            
            	case 2:
                    if(isset($val['gift_timeuse'])) {
                        $time_used = date('H:i d/m', $val['gift_timeuse']);
                    } else {
                        $time_used = date('H:i d/m', $val['gift_time']);
                    }
                    
                    $giftcode_history_arr['giftcode'][$key]['status_info'] = "Đã sử dụng : $time_used";
            	break;
            
            	default :
            }
        }
	
	$page_template = 'templates/giftcode/giftcode_history.tpl';
}
?>