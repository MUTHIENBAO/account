<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");

if (isset($_SESSION['mu_nvchon'])) {
    
    include('config/config_questdaily.php');
    include('config/config_vip_system.php');
    
    $getcontent_url = $server_url . "/sv_char.php";
    $getcontent_data = array(
        'login'    =>  $_SESSION['mu_username'],
        'name'    =>  $_SESSION['mu_nvchon'],
        
        'pagesv'	=>	'sv_char_questdaily',
        'action'    =>  'view',
        'string_login'    =>  $_SESSION['checklogin'],
        'passtransfer'    =>  $passtransfer
    ); 
    
    $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
    
    if ( empty($reponse) ) $notice = "<font size='3' color='red'>Server bảo trì.</font>";
    elseif($reponse == "login_other") {
    	$notice = "<font size='3' color='red'>Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.</font>";
    	session_destroy();
    }
    else {
    	$info = explode('<nbb>',$reponse);
    	if ($info[1] == 'OK') {
    		$quest_info = $info[2];
    		$quest_arr = json_decode($quest_info, true);
    	}
    	else $notice = $reponse;
    }
    
    
    if($quest_arr['nvchinh'] == 1) {
        
        $file_giftcode_type = 'config/giftcode_type.txt';

        //Đọc File GiftCode Type
        $giftcode_type_arr = array();
        if(is_file($file_giftcode_type)) {
    		$fopen_host = fopen($file_giftcode_type, "r");
            $giftcode_type_read = fgets($fopen_host);
            
            $giftcode_type_arr = json_decode($giftcode_type_read, true);
    	} else $fopen_host = fopen($file_giftcode_type, "w");
    	fclose($fopen_host);
        
        if(!is_array($giftcode_type_arr)) $giftcode_type_arr = array();
        
        $_SESSION['quest_daily'] = $quest_arr['quest_wait'];
        $nvonline = floor($quest_arr['timeonline']/60) . " giờ ". ($quest_arr['timeonline'] - floor($quest_arr['timeonline']/60)*60) . " phút";
        
        $gift_unused_tab[1] = 0;
        $gift_unused_tab[2] = 0;
        $gift_unused_tab[3] = 0;
        $gift_unused_tab[4] = 0;
        //VIP2
		if($Use_VIP == 2 && $_SESSION['acc_vip'] > 0 && $_SESSION['acc_vip_day'] >= $enable_vip['questdaily']) {
			if($_SESSION['acc_vip'] == 1) {
				$extra_questdaily_slg = $gold_vip['questdaily'];
				$quest_daily_slgmax = $quest_daily_slgmax + $gold_vip['questdaily'];
			}
			elseif($_SESSION['acc_vip'] == 2) {
				$extra_questdaily_slg = $silver_vip['questdaily'] ;
				$quest_daily_slgmax = $quest_daily_slgmax + $silver_vip['questdaily'];		
			}   
		}
		//End VIP2
        for($i=1; $i<=49; $i++) {
            if($quest_daily[$i] == 1) {
                switch ($i){ 
                	case 1:
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                    case 6:
                        $quest_name[$i] = "Online ". $quest_daily_dk[$i] ." giờ";
                        $quest_status[$i] = floor($quest_arr['timeonline']/60);
                        if($quest_arr['quest_finish'] < $quest_daily_slgmax && $quest_arr[$i] == 1) {
                            $gift_unused_tab[1]++;
                        }
                        $input_tab = 1;
                	break;
                    
                    case 7:
                    case 8:
                    case 9:
                    case 10:
                    case 11:
                    case 12:
                    case 13:
                        $quest_name[$i] = "RS Tổng ". $quest_daily_dk[$i] ." lần";
                        $quest_status[$i] = $quest_arr['rsall'];
                        if($quest_arr['quest_finish'] < $quest_daily_slgmax && $quest_arr[$i] == 1) {
                            $gift_unused_tab[2]++;
                        }
                        $input_tab = 2;
                	break;
                
                	case 14:
                    case 15:
                    case 16:
                    case 17:
                    case 18:
                    case 19:
                    case 20:
                        $quest_name[$i] = "RS VIP Tổng ". $quest_daily_dk[$i] ." lần";
                        $quest_status[$i] = $quest_arr['rsvip'];
                        if($quest_arr['quest_finish'] < $quest_daily_slgmax && $quest_arr[$i] == 1) {
                            $gift_unused_tab[2]++;
                        }
                        $input_tab = 2;
                	break;
                
                	case 21:
                    case 22:
                    case 23:
                    case 24:
                    case 25:
                    case 26:
                    case 27:
                        $quest_name[$i] = "RS OVER Tổng ". $quest_daily_dk[$i] ." lần";
                        $quest_status[$i] = $quest_arr['rsover'];
                        if($quest_arr['quest_finish'] < $quest_daily_slgmax && $quest_arr[$i] == 1) {
                            $gift_unused_tab[2]++;
                        }
                        $input_tab = 2;
                	break;
                    
                    case 28:
                    case 29:
                    case 30:
                    case 31:
                    case 32:
                    case 33:
                    case 34:
                        $quest_name[$i] = "RS OVER VIP ". $quest_daily_dk[$i] ." lần";
                        $quest_status[$i] = $quest_arr['rsover_vip'];
                        if($quest_arr['quest_finish'] < $quest_daily_slgmax && $quest_arr[$i] == 1) {
                            $gift_unused_tab[2]++;
                        }
                        $input_tab = 2;
                	break;
                
                	case 35:
                        $quest_name[$i] = "Nạp thẻ lần đầu";
                        $quest_status[$i] = $quest_arr['card_nap_first'];
                        if($quest_arr['quest_finish'] < $quest_daily_slgmax && $quest_arr[$i] == 1) {
                            $gift_unused_tab[3]++;
                        }
                        $input_tab = 3;
                	break;
                
                	case 36:
                    case 37:
                    case 38:
                    case 39:
                    case 40:
                    case 41:
                    case 42:
                        $quest_name[$i] = "Nạp thẻ " . number_format($quest_daily_dk[$i], 0, ',', '.') ." VNĐ";
                        $quest_status[$i] = $quest_arr['cardnap'];
                        if($quest_arr['quest_finish'] < $quest_daily_slgmax && $quest_arr[$i] == 1) {
                            $gift_unused_tab[3]++;
                        }
                        $input_tab = 3;
                	break;
                
              		case 43:
                    case 44:
                    case 45:
                    case 46:
                    case 47:
                    case 48:
                    case 49:
                        $quest_name[$i] = "Sử dụng tiền tệ " . number_format($quest_daily_dk[$i], 0, ',', '.');
                        $quest_status[$i] = $quest_arr['usemoney'];
                        if($quest_arr['quest_finish'] < $quest_daily_slgmax && $quest_arr[$i] == 1) {
                            $gift_unused_tab[4]++;
                        }
                        $input_tab = 4;
                	break;
                	
                    default :
                        $quest_name[$i] = "Chưa định nghĩa";
                        $quest_status[$i] = "";
                }
                
                $phanthuong[$i] = "";
                
                if($quest_daily_gcoin[$i] > 0) {
                    // if(strlen($phanthuong[$i]) > 0) $phanthuong[$i] .= " + ";
                    $phanthuong[$i] .= "<div class='item-box' title='GCent'><img src='templates/images/icons/g.png' /><span>x{$quest_daily_gcoin[$i]}</span></div>";
                }
                if($quest_daily_gcoinkm[$i] > 0) {
                    // if(strlen($phanthuong[$i]) > 0) $phanthuong[$i] .= " + ";
                    $phanthuong[$i] .= "<div class='item-box' title='GCent khuyến mại'><img src='templates/images/icons/g+.png' /><span>x{$quest_daily_gcoinkm[$i]}</span></div>";
                }
                
                if($quest_daily_vpoint[$i] > 0) {
                    // if(strlen($phanthuong[$i]) > 0) $phanthuong[$i] .= " + ";
                    $phanthuong[$i] .= "<div class='item-box' title='VCent'><img src='templates/images/icons/v.png' /><span>x{$quest_daily_vpoint[$i]}</span></div>";
                }
                if($quest_daily_vpoint_km[$i] > 0) {
                    // if(strlen($phanthuong[$i]) > 0) $phanthuong[$i] .= " + ";
                    $phanthuong[$i] .= "<div class='item-box' title='VCent khuyến mại'><img src='templates/images/icons/v+.png' /><span>x{$quest_daily_vpoint_km[$i]}</span></div>";
                }
                
                if($quest_daily_pl[$i] > 0) {
                    // if(strlen($phanthuong[$i]) > 0) $phanthuong[$i] .= " + ";
                    $phanthuong[$i] .= "<div class='item-box' title='PPoint'><img src='templates/images/icons/p.png' /><span>x{$quest_daily_pl[$i]}</span></div>";
                }
                if($quest_daily_pl_extra[$i] > 0) {
                    // if(strlen($phanthuong[$i]) > 0) $phanthuong[$i] .= " + ";
                    $phanthuong[$i] .= "<div class='item-box' title='PPoint +'><img src='templates/images/icons/p+.png' /><span>x{$quest_daily_pl_extra[$i]}</span></div>";
                }
                
                if($quest_daily_pcpoint[$i] > 0) {
                    // if(strlen($phanthuong[$i]) > 0) $phanthuong[$i] .= " + ";
                    $phanthuong[$i] .= "<div class='item-box' title='PCPoint'><img src='templates/images/icons/pc-point.png' /><span>x{$quest_daily_pcpoint[$i]}</span></div>";
                }
                if($quest_daily_wcoin[$i] > 0) {
                    //if(strlen($phanthuong[$i]) > 0) $phanthuong[$i] .= " + ";
                    $phanthuong[$i] .= " <div class='item-box' title='WCoin'><img src='templates/images/icons/w.png' /><span>x{$quest_daily_wcoin[$i]}</span></div>";
                }
                
                if($quest_daily_chao[$i] > 0) {
                    //if(strlen($phanthuong[$i]) > 0) $phanthuong[$i] .= " + ";
                    $phanthuong[$i] .=  " <div class='item-box' title='Chaos ngân hàng'><img src='templates/images/icons/items/chaos.png' /><span>x{$quest_daily_chao[$i]}</span></div>";
                }
                if($quest_daily_cre[$i] > 0) {
                    // if(strlen($phanthuong[$i]) > 0) $phanthuong[$i] .= " + ";
                    $phanthuong[$i] .= "<div class='item-box' title='Creation ngân hàng'><img src='templates/images/icons/items/creation.png' /><span>x{$quest_daily_cre[$i]}</span></div>";
                }
                if($quest_daily_blue[$i] > 0) {
                    // if(strlen($phanthuong[$i]) > 0) $phanthuong[$i] .= " + ";
                    $phanthuong[$i] .= "<div class='item-box' title='Blue ngân hàng'><img src='templates/images/icons/items/blue.png' /><span>x{$quest_daily_blue[$i]}</span></div>";
                }
                
                if($quest_daily_pmaster[$i] > 0) {
                    // if(strlen($phanthuong[$i]) > 0) $phanthuong[$i] .= " + ";
                    $phanthuong[$i] .= "<div class='item-box' title='Skill Master Point'><img src='templates/images/icons/skill-master-point.png' /><span>x{$quest_daily_pmaster[$i]}</span></div>";
                }
                
                if(isset($quest_daily_exp[$i]) && $quest_daily_exp[$i] > 0) {
                    // if(strlen($phanthuong[$i]) > 0) $phanthuong[$i] .= " + ";
                    $phanthuong[$i] .= "<div class='item-box' title='Bùa Exp ". $quest_daily_exp[$i] ." giờ'><img src='templates/images/icons/exp.png' /><span>x{$quest_daily_exp[$i]} h</span></div>";
                }
                
                if(isset($quest_daily_giftcode[$i]) && $quest_daily_giftcode[$i] != 999999) {
                    // if(strlen($phanthuong[$i]) > 0) $phanthuong[$i] .= " + ";
                    $giftcode_type = $quest_daily_giftcode[$i];
                    $phanthuong[$i] .= "<div class='item-box' title='". $giftcode_type_arr[$giftcode_type]['name'] ."'><img src='templates/images/icons/Gift-icon.png' /></div>";
                }
                
                if( (isset($quest_daily_item_time[$i]) && strlen($quest_daily_item_time[$i]) > 0 && $quest_daily_item_time_day[$i] > 0) || (isset($quest_daily_item[$i]) && strlen($quest_daily_item[$i]) > 0) ) {
                    $phanthuong[$i] .= "<br style='clear: both;' /><br /><center>Phần thưởng <strong style='color: red;'>Vật phẩm</strong> khi <strong style='color: blue;'>Reset > {$quest_daily_item_reset[$i]}</strong></center>";
                    
                    if(isset($quest_daily_item_time[$i]) && strlen($quest_daily_item_time[$i]) > 0 && $quest_daily_item_time_day[$i] > 0) {
                        $quest_daily_item_time_info_arr[$i] = json_decode($quest_daily_item_time_info[$i], true);
                        foreach($quest_daily_item_time_info_arr[$i] as $v) {
                            $phanthuong[$i] .= "<div class='item-box' title='". $v['item_name'] ." ". $quest_daily_item_time_day[$i] ." ngày'><img src='items/". $v['item_image'] .".gif' height='35' /><span style='color: red;'>{$quest_daily_item_time_day[$i]}d</span></div>";
                        }
                    }
                    
                    if(isset($quest_daily_item[$i]) && strlen($quest_daily_item[$i]) > 0) {
                        $quest_daily_item_info_arr[$i] = json_decode($quest_daily_item_info[$i], true);
                        foreach($quest_daily_item_info_arr[$i] as $v) {
                            $phanthuong[$i] .= "<div class='item-box' title='". $v['item_name'] ." vĩnh viễn'><img src='items/". $v['item_image'] .".gif' height='35' /><span style='color: blue;'>vĩnh viễn</span></div>";
                        }
                    }
                }
                
                    
                
                
                if($quest_arr[$i] == 0) {
                    $input[$i] = '<input type="button" class="btn btn-green btn-lg btn-gift" id="btn_quest_'. $i .'" qindex="'. $i .'" value="Chưa đạt" disabled="disabled" />';
                } elseif($quest_arr[$i] == 1) {
                    if($quest_arr['quest_finish'] < $quest_daily_slgmax) {
                        $input[$i] = '<span class="btn_phucloi_stat"><input type="button" class="btn_phucloi btn btn-green btn-lg btn-gift" id="btn_quest_'. $i .'" qindex="'. $i .'" inptab="'. $input_tab .'" value="Nhận thưởng" /></span>';
                        $btnval[$i] = "Nhận thưởng";
                    } else {
                        $input[$i] = 'Đã hết số phần thưởng có thể nhận.';
                    }
                } else {
                    $input[$i] = "<span class='tag tag-blue'>Đã nhận</span>";
                }
            }
        }
    }
    
}  
    $page_template = 'templates/char_manager/questdaily.tpl';
?>