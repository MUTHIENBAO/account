<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include('config/config_relife.php');
include('config/config_reset.php');
include('config/config_resetvip.php');
include('config/config_hotrotanthu.php');
include('config/config_gioihanrs.php');
include('config/config_ipbonus.php');
include('modules/box_facebook.php');
include('config/config_vip.php');
include('config/config_vip_system.php');


$thehe_choise = $_SESSION['acc_thehe'];

$zen_rsvip_percent = isset($zen_rsvip_percent) ? $zen_rsvip_percent : 0;
$time_rsvip_percent = isset($time_rsvip_percent) ? $time_rsvip_percent : 100;
if ( ($_SESSION['nv_reset'] >= $reset_cap_0) AND ($_SESSION['nv_reset'] < $reset_cap_1) )
{
	$level = $level_cap_1_vip;
    $zen = floor($zen_cap_1*$zen_rsvip_percent/100);
	$gcoin_reset_vip = $gcoin_cap_1_vip;
    $timers = floor($time_reset_next_1*$time_rsvip_percent/100);
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_1) AND ($_SESSION['nv_reset'] < $reset_cap_2) )
{
	$level = $level_cap_2_vip;
    $zen = floor($zen_cap_2*$zen_rsvip_percent/100);
	$gcoin_reset_vip = $gcoin_cap_2_vip;
    $timers = floor($time_reset_next_2*$time_rsvip_percent/100);
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_2) AND ($_SESSION['nv_reset'] < $reset_cap_3) )
{
	$level = $level_cap_3_vip;
    $zen = floor($zen_cap_3*$zen_rsvip_percent/100);
	$gcoin_reset_vip = $gcoin_cap_3_vip;
    $timers = floor($time_reset_next_3*$time_rsvip_percent/100);
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_3) AND ($_SESSION['nv_reset'] < $reset_cap_4) )
{
	$level = $level_cap_4_vip;
    $zen = floor($zen_cap_4*$zen_rsvip_percent/100);
	$gcoin_reset_vip = $gcoin_cap_4_vip;
    $timers = floor($time_reset_next_4*$time_rsvip_percent/100);
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_4) AND ($_SESSION['nv_reset'] < $reset_cap_5) )
{
	$level = $level_cap_5_vip;
    $zen = floor($zen_cap_5*$zen_rsvip_percent/100);
	$gcoin_reset_vip = $gcoin_cap_5_vip;
    $timers = floor($time_reset_next_5*$time_rsvip_percent/100);
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_5) AND ($_SESSION['nv_reset'] < $reset_cap_6) )
{
	$level = $level_cap_6_vip;
    $zen = floor($zen_cap_6*$zen_rsvip_percent/100);
	$gcoin_reset_vip = $gcoin_cap_6_vip;
    $timers = floor($time_reset_next_6*$time_rsvip_percent/100);
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_6) AND ($_SESSION['nv_reset'] < $reset_cap_7) )
{
	$level = $level_cap_7_vip;
    $zen = floor($zen_cap_7*$zen_rsvip_percent/100);
	$gcoin_reset_vip = $gcoin_cap_7_vip;
    $timers = floor($time_reset_next_7*$time_rsvip_percent/100);
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_7) AND ($_SESSION['nv_reset'] < $reset_cap_8) )
{
	$level = $level_cap_8_vip;
    $zen = floor($zen_cap_8*$zen_rsvip_percent/100);
	$gcoin_reset_vip = $gcoin_cap_8_vip;
    $timers = floor($time_reset_next_8*$time_rsvip_percent/100);
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_8) AND ($_SESSION['nv_reset'] < $reset_cap_9) )
{
	$level = $level_cap_9_vip;
    $zen = floor($zen_cap_9*$zen_rsvip_percent/100);
	$gcoin_reset_vip = $gcoin_cap_9_vip;
    $timers = floor($time_reset_next_9*$time_rsvip_percent/100);
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_9) AND ($_SESSION['nv_reset'] < $reset_cap_10) )
{
	$level = $level_cap_10_vip;
    $zen = floor($zen_cap_10*$zen_rsvip_percent/100);
	$gcoin_reset_vip = $gcoin_cap_10_vip;
    $timers = floor($time_reset_next_10*$time_rsvip_percent/100);
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_10) AND ($_SESSION['nv_reset'] < $reset_cap_11) )
{
	$level = $level_cap_11_vip;
    $zen = floor($zen_cap_11*$zen_rsvip_percent/100);
	$gcoin_reset_vip = $gcoin_cap_11_vip;
    $timers = floor($time_reset_next_11*$time_rsvip_percent/100);
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_11) AND ($_SESSION['nv_reset'] < $reset_cap_12) )
{
	$level = $level_cap_12_vip;
    $zen = floor($zen_cap_12*$zen_rsvip_percent/100);
	$gcoin_reset_vip = $gcoin_cap_12_vip;
    $timers = floor($time_reset_next_12*$time_rsvip_percent/100);
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_12) AND ($_SESSION['nv_reset'] < $reset_cap_13) )
{
	$level = $level_cap_13_vip;
    $zen = floor($zen_cap_13*$zen_rsvip_percent/100);
	$gcoin_reset_vip = $gcoin_cap_13_vip;
    $timers = floor($time_reset_next_13*$time_rsvip_percent/100);
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_13) AND ($_SESSION['nv_reset'] < $reset_cap_14) )
{
	$level = $level_cap_14_vip;
    $zen = floor($zen_cap_14*$zen_rsvip_percent/100);
	$gcoin_reset_vip = $gcoin_cap_14_vip;
    $timers = floor($time_reset_next_14*$time_rsvip_percent/100);
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_14) AND ($_SESSION['nv_reset'] < $reset_cap_15) )
{
	$level = $level_cap_15_vip;
    $zen = floor($zen_cap_15*$zen_rsvip_percent/100);
	$gcoin_reset_vip = $gcoin_cap_15_vip;
    $timers = floor($time_reset_next_15*$time_rsvip_percent/100);
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_15) AND ($_SESSION['nv_reset'] < $reset_cap_16) )
{
	$level = $level_cap_16_vip;
    $zen = floor($zen_cap_16*$zen_rsvip_percent/100);
	$gcoin_reset_vip = $gcoin_cap_16_vip;
    $timers = floor($time_reset_next_16*$time_rsvip_percent/100);
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_16) AND ($_SESSION['nv_reset'] < $reset_cap_17) )
{
	$level = $level_cap_17_vip;
    $zen = floor($zen_cap_17*$zen_rsvip_percent/100);
	$gcoin_reset_vip = $gcoin_cap_17_vip;
    $timers = floor($time_reset_next_17*$time_rsvip_percent/100);
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_17) AND ($_SESSION['nv_reset'] < $reset_cap_18) )
{
	$level = $level_cap_18_vip;
    $zen = floor($zen_cap_18*$zen_rsvip_percent/100);
	$gcoin_reset_vip = $gcoin_cap_18_vip;
    $timers = floor($time_reset_next_18*$time_rsvip_percent/100);
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_18) AND ($_SESSION['nv_reset'] < $reset_cap_19) )
{
	$level = $level_cap_19_vip;
    $zen = floor($zen_cap_19*$zen_rsvip_percent/100);
	$gcoin_reset_vip = $gcoin_cap_19_vip;
    $timers = floor($time_reset_next_19*$time_rsvip_percent/100);
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_19) AND ($_SESSION['nv_reset'] < $reset_cap_20) )
{
	$level = $level_cap_20_vip;
    $zen = floor($zen_cap_20*$zen_rsvip_percent/100);
	$gcoin_reset_vip = $gcoin_cap_20_vip;
    $timers = floor($time_reset_next_20*$time_rsvip_percent/100);
}
	$vpoint_reset_vip = floor($gcoin_reset_vip*(1+$vpoint_extra/100));

$char_in_top = $_SESSION['nv_top50'];

$top_view_max = 0;
//Begin hỗ trợ tân thủ
$gc_rs_after = $gcoin_reset_vip;
$vc_rs_after = $vpoint_reset_vip;

$gc_rs_tanthu = '';
$gc_rs_fb = '';
$gc_rs_ipbonus = '';

$vc_rs_tanthu = '';
$vc_rs_fb = '';
$vc_rs_ipbonus = '';

if ($hotrotanthu == 1) {
    $info_hotro = 1;
    $level_config = $level;
	if($char_in_top == 1) {
        $info_hotro = 0;
        $level_reset = $level_config;
        $level_giam = 0;
        
        $timers_show = "<strong>{$timers}</strong>";
        $timers_giam = 0;
        
        $zen_rs_giam = 0;
        $zen_decre_percent = 0;
        $zen_rs_after = $zen;
        $zen_rs_show = "<strong>". number_format($zen, 0, ',', '.') ."</strong>";
        
        $money_decre_percent = 0;
        $gc_rs_giam = 0;
        $vc_rs_giam = 0;
    }
	else {
        $intop_flag = false;
        for($i=1; $i< $tanthu_cap_max; $i++) {
            if( ($char_in_top > $tanthu_top_cap[$i-1]) && ($char_in_top <= $tanthu_top_cap[$i]) ) {
                $intop_flag = true;
                $level_giam = $tanthu_lvredure[$i];
                $level_reset = $level - $level_giam;
                $level_rs_tanthu_view = "<br />- $level_giam LV Tân Thủ";
                
                $timers_giam = isset($tanthu_time_rs_redure[$i]) ? $tanthu_time_rs_redure[$i] : 0;
                $timers_after = $timers - $timers_giam;
                if($timers_after < 1) $timers_after = 1;
                $timers_show = "<font size=1>(<i><u>$timers</u></i>)</font> {$timers_after}";
                
                $zen_rs_giam = isset($tanthu_zen_rs_redure[$i]) ? floor($zen*$tanthu_zen_rs_redure[$i]/100) : 0;
                $zen_decre_percent = $tanthu_zen_rs_redure[$i];
                $zen_rs_after = $zen - $zen_rs_giam;
                $zen_rs_show = number_format($zen_rs_after, 0, ',', '.') ." <font size=1>(<i><u>$zen</u></i>)</font>";
                
                $money_decre_percent = $tanthu_money_rs_redure[$i];
                $gc_rs_giam = isset($money_decre_percent) ? floor($gcoin_reset_vip*$money_decre_percent/100) : 0;
                $gc_rs_after = $gc_rs_after - $gc_rs_giam;
                
                $vc_rs_giam = isset($money_decre_percent) ? floor($vpoint_reset_vip*$money_decre_percent/100) : 0;
                $vc_rs_after = $vc_rs_after - $vc_rs_giam;
                
                $gc_rs_tanthu = "<br />- $gc_rs_giam Gc ($money_decre_percent% Tân thủ)";
                $vc_rs_tanthu = "<br />- $vc_rs_giam Vc ($money_decre_percent% Tân thủ)";
                
                $tanthu_group = "TOP ". $tanthu_top_cap[$i-1] ." - ". $tanthu_top_cap[$i];
                break;
            }
        }
        
        if($intop_flag == false) {
            $top_view_max = $tanthu_top_cap[$tanthu_cap_max - 1];
            $char_in_top = '> '. $tanthu_top_cap[$tanthu_cap_max - 1];
            $level_giam = $tanthu_lvredure[$tanthu_cap_max];
            $level_reset = $level - $level_giam;
            $level_rs_tanthu_view = "<br />- $level_giam LV Tân Thủ";
            
            $timers_giam = isset($tanthu_time_rs_redure[$tanthu_cap_max]) ? $tanthu_time_rs_redure[$tanthu_cap_max] : 0;
            $timers_after = $timers - $timers_giam;
            if($timers_after < 1) $timers_after = 1;
            $timers_show = "<font size=1>(<i><u>$timers</u></i>)</font> {$timers_after}";
            
            $zen_rs_giam = isset($tanthu_zen_rs_redure[$tanthu_cap_max]) ? floor($zen*$tanthu_zen_rs_redure[$tanthu_cap_max]/100) : 0;
            $zen_decre_percent = $tanthu_zen_rs_redure[$tanthu_cap_max];
            $zen_rs_after = $zen - $zen_rs_giam;
            $zen_rs_show = number_format($zen_rs_after, 0, ',', '.') ." <font size=1>(<i><u>$zen</u></i>)</font>";
            
            $money_decre_percent = $tanthu_money_rs_redure[$tanthu_cap_max];
            $gc_rs_giam = isset($money_decre_percent) ? floor($gcoin_reset_vip*$money_decre_percent/100) : 0;
            $gc_rs_after = $gc_rs_after - $gc_rs_giam;
            
            $vc_rs_giam = isset($money_decre_percent) ? floor($vpoint_reset_vip*$money_decre_percent/100) : 0;
            $vc_rs_after = $vc_rs_after - $vc_rs_giam;
            
            $gc_rs_tanthu = "<br />- $gc_rs_giam Gc ($money_decre_percent% Tân thủ)";
            $vc_rs_tanthu = "<br />- $vc_rs_giam Vc ($money_decre_percent% Tân thủ)";
            
            $tanthu_group = "TOP ". $char_in_top;
        }
    }
} else {
    $level_config = $level;
    $level_reset = $level_config;
    $level_giam = 0;
    $info_hotro = 0;
    $timers_giam = 0;
    $timers_show = "<strong>{$timers}</strong>";
    
    $zen_rs_giam = 0;
    $zen_decre_percent = 0;
    $zen_rs_after = $zen;
    $zen_rs_show = "<strong>". number_format($zen, 0, ',', '.') ."</strong>";
    
    $money_decre_percent = 0;
    $gc_rs_giam = 0;
    $gc_rs_after = $gcoin_reset_vip;
    
    $vc_rs_giam = 0;
    $vc_rs_after = $vpoint_reset_vip;
    
}
//End hỗ trợ tân thủ

//VIP1
if($Use_VIP == 1) {
    if($_SESSION['nbb_vip'] == 1) {
        $vip_lv = 0;
        $nbb_vip_time_used_day = floor($_SESSION['nbb_vip_time_used']/(24*60*60));
        if(is_array($vip_level_day)) {
            foreach($vip_level_day as $k => $v) {
                if($nbb_vip_time_used_day >= $v) {
                	$vip_lv = $k;
                	$vip_day_lv = $v;
                }
                else break;
            }
        }
        
        $vip_lv_show = $vip_lv+1;
        $level_reset = $level_reset - $vip_rs_lv_decre[$vip_lv];
        
        $vip_day_view = '';
        if($vip_day_lv > 0) $vip_day_view = "<span>". $vip_day_lv ."d</span>";
        
        $level_rs_acc_vip = "<br />- $vip_rs_lv_decre[$vip_lv] LV <span class='vip-box' title='VIP'><img src='images/super.gif' />$vip_day_view</span>";
    } else {
        $level_rs_acc_vip = "<br />- <font color='red'>Giảm thêm <strong><font color='blue'>". $vip_rs_lv_decre[$vip_level_slg-1] ." LV</font></strong> khi <strong><font color='blue'>đăng ký Hỗ Trợ</font></strong></font>";
    }
    
    $vip_rs_price_decre_flag = -1;
    if(is_array($vip_rs_price_decre_rsday)) {
        foreach($vip_rs_price_decre_rsday as $k => $v) {
            if($_SESSION['nv_resetday'] + 1 >= $v && $vip_rs_price_decre_rsday[$vip_rs_price_decre_flag] < $v) {
                $vip_rs_price_decre_flag = $k;
            }
        }
    }
    if($vip_rs_price_decre_flag >= 0) {
        if($_SESSION['nbb_vip'] == 1) {
            $gc_vip_giam = floor($gcoin_reset_vip*$vip_rs_price_decre_percent[$vip_rs_price_decre_flag]/100);
            $vc_vip_giam = floor($vpoint_reset_vip*$vip_rs_price_decre_percent[$vip_rs_price_decre_flag]/100);
            
            $gc_rs_after = $gc_rs_after - $gc_vip_giam;
            $vc_rs_after = $vc_rs_after - $vc_vip_giam;
            
            $gc_rs_acc_vip = "<br />- $gc_vip_giam Gc (". $vip_rs_price_decre_percent[$vip_rs_price_decre_flag] ."% Gói Hỗ Trợ)";
            $vc_rs_acc_vip = "<br />- $vc_vip_giam Vc (". $vip_rs_price_decre_percent[$vip_rs_price_decre_flag] ."% Gói Hỗ Trợ)";
        } else {
            $gc_rs_acc_vip = "<br />- <font color='red'>Giảm thêm <strong><font color='blue'>". $vip_rs_price_decre_percent[$vip_rs_price_decre_flag] ."%</font></strong> khi <strong><font color='blue'>đăng ký Hỗ Trợ</font></strong></font>";
            $vc_rs_acc_vip = "<br />- <font color='red'>Giảm thêm <strong><font color='blue'>". $vip_rs_price_decre_percent[$vip_rs_price_decre_flag] ."%</font></strong> khi <strong><font color='blue'>đăng ký Hỗ Trợ</font></strong></font>";
        }
    }
}
//End VIP1

//VIP2
if($Use_VIP == 2) {
	if($_SESSION['acc_vip'] > 0 && $_SESSION['acc_vip_day'] >= $enable_vip['level_reset']) {
		if($_SESSION['acc_vip'] == 1) {
		$extra_level_reset = floor($level_reset*$gold_vip['level_reset']/100);
		$extra_zen_reset = floor($zen*$gold_vip['level_reset']/100);
		$level_reset = $level_reset - $extra_level_reset;
		$zen_rs_after = $zen_rs_after - $extra_zen_reset;
		
        $level_rs_acc_vip = "<br />- $extra_level_reset LV <span class='vip-box' title='VIP'><img src='templates/images/icons/vip/gold-title-".$_SESSION['acc_vip_day'].".png' /></span>";
        $zen_rs_acc_vip = "<br />- ". $extra_zen_reset ." ZEN Gói VIP Vàng";
		}
		elseif($_SESSION['acc_vip'] == 2) {
			$extra_level_reset = floor($level_reset*$silver_vip['level_reset']/100);
			$extra_zen_reset = floor($zen*$silver_vip['level_reset']/100);
			$level_reset = $level_reset - $extra_level_reset;
			$zen_rs_after = $zen_rs_after - $extra_zen_reset;		
			
			$level_rs_acc_vip = "<br />- $extra_level_reset LV <span class='vip-box' title='VIP'><img src='templates/images/icons/vip/silver-title-".$_SESSION['acc_vip_day'].".png' /></span>";
			$zen_rs_acc_vip = "<br />- ". $extra_zen_reset ." ZEN Gói VIP Bạc";
		}
	}
	else {
		$extra_level_reset = floor($level_reset*$silver_vip['level_reset']/100);
		$extra_zen_reset = floor($zen*$silver_vip['level_reset']/100);
		$level_rs_acc_vip = "<br />- <font color='red'>Giảm thêm <strong><font color='blue'>". $extra_level_reset ." LV</font></strong> khi <strong><font color='blue'>đăng ký VIP</font></strong></font>";
		$zen_rs_acc_vip = "<br />- <font color='red'>Giảm thêm <strong><font color='blue'>". $extra_zen_reset ." ZEN</font></strong> khi <strong><font color='blue'>đăng ký VIP</font></strong></font>";
	}             
}
//End VIP2

if($level_reset < $level_config) {
    $level_show = "{$level_reset} <font size=1>(<i><u>$level_config</u></i>)</font>";
} else {
    $level_show = "<strong>{$level_reset}</strong>";
}


// Like FanPage
if(isset($use_facebook) && $use_facebook == 1 && $_SESSION['fb_fanpage_like'] == 1 && $fb_like_fanpage_decre_price > 0) {
    $gc_fb_giam = floor($gcoin_reset_vip*$fb_like_fanpage_decre_price/100);
    $vc_fb_giam = floor($vpoint_reset_vip*$fb_like_fanpage_decre_price/100);
    
    $gc_rs_after = $gc_rs_after - $gc_fb_giam;
    $vc_rs_after = $vc_rs_after - $vc_fb_giam;
    
    $gc_rs_fb = "<br />- $gc_fb_giam Gc ($fb_like_fanpage_decre_price% Like FanPage)";
    $vc_rs_fb = "<br />- $vc_fb_giam Vc ($fb_like_fanpage_decre_price% Like FanPage)";
} else {
    // $gc_rs_fb = "<br />- <font color='red'>Giảm thêm <strong><font color='blue'>$fb_like_fanpage_decre_price%</font></strong> khi <strong><font color='blue'>Like FanPage</font></strong> dưới nút Reset</font>";
    // $vc_rs_fb = "<br />- <font color='red'>Giảm thêm <strong><font color='blue'>$fb_like_fanpage_decre_price%</font></strong> khi <strong><font color='blue'>Like FanPage</font></strong> dưới nút Reset</font>";
}
// Like FanPage End

// IP Bonus
if(isset($use_ipbonus) && $use_ipbonus == 1 && $_SESSION['ipbonus_active'] == 1) {
    $gc_ipbonus_giam = floor($gcoin_reset_vip*$ipbonus_decre_price/100);
    $vc_ipbonus_giam = floor($vpoint_reset_vip*$ipbonus_decre_price/100);
    
    $gc_rs_after = $gc_rs_after - $gc_ipbonus_giam;
    $vc_rs_after = $vc_rs_after - $vc_ipbonus_giam;
    
    $gc_rs_ipbonus = "<br />- $gc_ipbonus_giam Gc ($ipbonus_decre_price% IP Bonus)";
    $vc_rs_ipbonus = "<br />- $vc_ipbonus_giam Vc ($ipbonus_decre_price% IP Bonus)";
} else {
    $gc_rs_ipbonus = "Giảm thêm <strong><font color='blue'>$ipbonus_decre_price%</font></strong> khi chơi tại <a href='#acc_manager&act=ipbonus_list' rel='ajax'><strong><font color='blue'>IP Bonus</font></strong></a></font>";
    $vc_rs_ipbonus = "Giảm thêm <strong><font color='blue'>$ipbonus_decre_price%</font></strong> khi chơi tại <a href='#acc_manager&act=ipbonus_list' rel='ajax'><strong><font color='blue'>IP Bonus</font></strong></a></font>";
}
// IP Bonus End

$level_rs_decre = "$level_rs_tanthu_view $level_rs_acc_vip";

if($gc_rs_after < 0) $gc_rs_after = 0;
$gc_rs_show = "<strong>". number_format($gc_rs_after, 0, ',', '.') ."</strong>";
if($gc_rs_after < $gcoin_reset_vip) $gc_rs_show .= " <font size=1>(<i><u>$gcoin_reset_vip</u></i>)</font>";
$gc_rs_decre = "$gc_rs_acc_vip $gc_rs_tanthu $gc_rs_fb $gc_rs_ipbonus";

if($vc_rs_after < 0) $vc_rs_after = 0;
$vc_rs_show = "<strong>". number_format($vc_rs_after, 0, ',', '.') ."</strong>";
if($vc_rs_after < $vpoint_reset_vip) $vc_rs_show .= " <font size=1>(<i><u>$vpoint_reset_vip</u></i>)</font>";
$vc_rs_decre = "$vc_rs_acc_vip $vc_rs_tanthu $vc_rs_fb $vc_rs_ipbonus";


$font_red_begin = "<font color='red'><b>";
$font_red_end = "</b></font>";
$font_blue_begin = "<font color='green'><b>";
$font_blue_end = "</b></font>";

$accept = 1;

if($use_gioihanrs[$thehe_choise] == 1) {
    $gioihanrs = $ghrs_rsmax_cap[$thehe_choise][$ghrs_cap_max];
	for($i=1; $i<= $ghrs_cap_max; $i++) {
        if( ($char_in_top > $ghrs_top_cap[$i-1]) && ($char_in_top <= $ghrs_top_cap[$i]) ) {
            $gioihanrs = $ghrs_rsmax_cap[$thehe_choise][$i];
            break;
        }
    }
    
    $dayofweek = date('w', time());
    if($dayofweek == 0) {
        $gioihanrs = $gioihanrs + floor($gioihanrs * $overrs_sun_extra[$thehe_choise]/100);
    } else if($dayofweek == 6) {
        $gioihanrs = $gioihanrs + floor($gioihanrs * $overrs_sat_extra[$thehe_choise]/100);
    }
    
    if($ghrs_top_cap[$ghrs_cap_max-1] > $top_view_max) {
        $top_view_max = $ghrs_top_cap[$ghrs_cap_max-1];
    }
    
	if( $_SESSION['nv_resetday'] >= $gioihanrs ) 
	{
		if($use_overrs[$thehe_choise] == 1 && $overrs_rs[$thehe_choise] > 0) {}
        else $overrs_rs[$thehe_choise] = 0;
        if($_SESSION['nv_resetday'] >= ($gioihanrs+$overrs_rs[$thehe_choise])) {
        	$accept = 0;
        	$notice_vuotmuc = "$font_red_begin <b> $overrs_rs[$thehe_choise] </b> $font_red_end / $font_blue_begin {$overrs_rs[$thehe_choise]} $font_blue_end"; 
        } else {
        	$rs_overed = $_SESSION['nv_resetday'] - $gioihanrs;
        	$notice_vuotmuc = "$font_blue_begin <b> $rs_overed </b> / {$overrs_rs[$thehe_choise]} $font_blue_end";
        }
		$notice_resetday = "$font_red_begin $_SESSION[nv_resetday] $font_red_end / $font_blue_begin $gioihanrs $font_blue_end";
	} else {
		$notice_vuotmuc = "$font_blue_begin <b> 0 </b> / {$overrs_rs[$thehe_choise]} $font_blue_end"; 
		$notice_resetday = "$font_blue_begin $_SESSION[nv_resetday] / $gioihanrs $font_blue_end";
	}
	
} elseif($use_gioihanrs[$thehe_choise] == 2) {
    $gioihanrs = $_SESSION['nv_ghrs'];
    if($use_overrs[$thehe_choise] == 1 && $overrs_rs[$thehe_choise] > 0) {}
    else $overrs_rs[$thehe_choise] = 0;
    $gioihanrs_over = $gioihanrs + $overrs_rs[$thehe_choise];
    
    if($ghrs2_top_cap[$ghrs_cap_max-1] > $top_view_max) {
        $top_view_max = $ghrs2_top_cap[$ghrs_cap_max-1];
    }
    
    if( $_SESSION['nv_resetday'] >= $gioihanrs ) 
	{
		if($use_overrs[$thehe_choise] == 1 && $overrs_rs[$thehe_choise] > 0) {}
        else $overrs_rs[$thehe_choise] = 0;
       
	   //echo $_SESSION['nv_ghrs_vuot'];
        if(($_SESSION['nv_ghrs_vuot'] >= $overrs_rs[$thehe_choise])) {
        	$accept = 0;
        	$notice_vuotmuc = "$font_red_begin <b> $overrs_rs[$thehe_choise] </b> $font_red_end / $font_blue_begin {$overrs_rs[$thehe_choise]} $font_blue_end"; 
        } else {
        	$rs_overed = $_SESSION['nv_ghrs_vuot'];// - $gioihanrs;
        	$notice_vuotmuc = "$font_blue_begin <b> $rs_overed </b> / {$overrs_rs[$thehe_choise]} $font_blue_end";
        }
        
        $notice_resetday = "$font_red_begin $_SESSION[nv_resetday] $font_red_end / $font_blue_begin $gioihanrs $font_blue_end";
	} else {
		$notice_vuotmuc = "$font_blue_begin <b> 0 </b> / {$overrs_rs[$thehe_choise]} $font_blue_end"; 
		$notice_resetday = "$font_blue_begin $_SESSION[nv_resetday] / $gioihanrs $font_blue_end";
	}
	
	
	
} else {
	$gioihanrs = '--';
	$notice_resetday = "$font_red_begin <b> $_SESSION[nv_resetday] </b> $font_red_end / $font_blue_begin $gioihanrs $font_blue_end";
}

if($char_in_top == 0 || $char_in_top > $top_view_max) {
    $char_in_top = "TOP > $top_view_max";
}

if(($use_extra_point_reset == 1) && ($_SESSION['nv_resetday'] >= $gioihanrs)) {

	if($level_extra_reset < $level_reset) {
		$level_reset = $level_extra_reset;
		
		$level_show = "<strong>{$level_reset}</strong>";
	}
    
	$chenhlech_level = $_SESSION['nv_level'] - $level_reset;

} else {

    $chenhlech_level = $_SESSION['nv_level'] - $level_reset;
    
}


if($_SESSION['nv_resetday'] >= $gioihanrs) {
	//echo $_SESSION['nv_resetday'];
	$gc_rs_after = $overrs_gcoin[$thehe_choise];
	if($gc_rs_after < 0) $gc_rs_after = 0;
	$gc_rs_show = "<strong>". number_format($overrs_gcoin[$thehe_choise], 0, ',', '.') ."</strong>";
}

$chenhlech_zen = $_SESSION['nv_zen'] + $_SESSION['acc_zen'] - $zen_rs_after;
$chenhlech_gcoin = ($_SESSION['acc_gcoin'] + $_SESSION['acc_gcoin_km']) - $gc_rs_after;
$chenhlech_vpoint = $_SESSION['acc_vpoint'] + $_SESSION['acc_vpoint_km'] - $vc_rs_after;

if ($chenhlech_level < 0) { $notice_level = "$font_red_begin Thiếu ". ABS($chenhlech_level) ." level $font_red_end"; } else { $notice_level = "$font_blue_begin Đủ Level Reset $font_blue_end"; }
if ($chenhlech_zen < 0) { $notice_zen = "$font_red_begin Thiếu ". number_format(ABS($chenhlech_zen), 0, ',', '.') ." Zen $font_red_end"; } else { $notice_zen = "$font_blue_begin Đủ Zen Reset $font_blue_end"; }
if ($chenhlech_gcoin < 0) { $notice_gcoin = "$font_red_begin Thiếu ". ABS($chenhlech_gcoin) ." Gcent $font_red_end"; } else { $notice_gcoin = "$font_blue_begin Đủ Gcent Reset $font_blue_end"; }
if ($chenhlech_vpoint < 0) { $notice_vpoint = "$font_red_begin Thiếu ". ABS($chenhlech_vpoint) ." Vcent $font_red_end"; } else { $notice_vpoint = "$font_blue_begin Đủ Vcent Reset $font_blue_end"; }

if ( $_SESSION['nv_online'] == 1 || $_SESSION['nv_doinv'] == 0 || $chenhlech_level < 0 || $chenhlech_zen < 0 || ( $chenhlech_gcoin < 0 && $chenhlech_vpoint < 0) ) { $accept = 0; }	

$page_template = "templates/char_manager/resetvip.tpl";
?>