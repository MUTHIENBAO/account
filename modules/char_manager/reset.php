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
include('config/config_hotrotanthu.php');
include('config/config_gioihanrs.php');
include('config/config_vip.php');
include('config/config_vip_system.php');

include('modules/box_facebook.php');

$thehe_choise = $_SESSION['acc_thehe'];

//Info Reset
if ( ($_SESSION['nv_reset'] >= $reset_cap_0) AND ($_SESSION['nv_reset'] < $reset_cap_1) )
{
	$level = $level_cap_1;
	$zen = $zen_cap_1;
	$chao = $chao_cap_1;
	$cre = $cre_cap_1;
	$blue = $blue_cap_1;
    $timers = $time_reset_next_1;
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_1) AND ($_SESSION['nv_reset'] < $reset_cap_2) )
{
	$level = $level_cap_2;
	$zen = $zen_cap_2;
	$chao = $chao_cap_2;
	$cre = $cre_cap_2;
	$blue = $blue_cap_2;
    $timers = $time_reset_next_2;
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_2) AND ($_SESSION['nv_reset'] < $reset_cap_3) )
{
	$level = $level_cap_3;
	$zen = $zen_cap_3;
	$chao = $chao_cap_3;
	$cre = $cre_cap_3;
	$blue = $blue_cap_3;
    $timers = $time_reset_next_3;
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_3) AND ($_SESSION['nv_reset'] < $reset_cap_4) )
{
	$level = $level_cap_4;
	$zen = $zen_cap_4;
	$chao = $chao_cap_4;
	$cre = $cre_cap_4;
	$blue = $blue_cap_4;
    $timers = $time_reset_next_4;
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_4) AND ($_SESSION['nv_reset'] < $reset_cap_5) )
{
	$level = $level_cap_5;
	$zen = $zen_cap_5;
	$chao = $chao_cap_5;
	$cre = $cre_cap_5;
	$blue = $blue_cap_5;
    $timers = $time_reset_next_5;
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_5) AND ($_SESSION['nv_reset'] < $reset_cap_6) )
{
	$level = $level_cap_6;
	$zen = $zen_cap_6;
	$chao = $chao_cap_6;
	$cre = $cre_cap_6;
	$blue = $blue_cap_6;
    $timers = $time_reset_next_6;
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_6) AND ($_SESSION['nv_reset'] < $reset_cap_7) )
{
	$level = $level_cap_7;
	$zen = $zen_cap_7;
	$chao = $chao_cap_7;
	$cre = $cre_cap_7;
	$blue = $blue_cap_7;
    $timers = $time_reset_next_7;
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_7) AND ($_SESSION['nv_reset'] < $reset_cap_8) )
{
	$level = $level_cap_8;
	$zen = $zen_cap_8;
	$chao = $chao_cap_8;
	$cre = $cre_cap_8;
	$blue = $blue_cap_8;
    $timers = $time_reset_next_8;
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_8) AND ($_SESSION['nv_reset'] < $reset_cap_9) )
{
	$level = $level_cap_9;
	$zen = $zen_cap_9;
	$chao = $chao_cap_9;
	$cre = $cre_cap_9;
	$blue = $blue_cap_9;
    $timers = $time_reset_next_9;
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_9) AND ($_SESSION['nv_reset'] < $reset_cap_10) )
{
	$level = $level_cap_10;
	$zen = $zen_cap_10;
	$chao = $chao_cap_10;
	$cre = $cre_cap_10;
	$blue = $blue_cap_10;
    $timers = $time_reset_next_10;
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_10) AND ($_SESSION['nv_reset'] < $reset_cap_11) )
{
	$level = $level_cap_11;
	$zen = $zen_cap_11;
	$chao = $chao_cap_11;
	$cre = $cre_cap_11;
	$blue = $blue_cap_11;
    $timers = $time_reset_next_11;
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_11) AND ($_SESSION['nv_reset'] < $reset_cap_12) )
{
	$level = $level_cap_12;
	$zen = $zen_cap_12;
	$chao = $chao_cap_12;
	$cre = $cre_cap_12;
	$blue = $blue_cap_12;
    $timers = $time_reset_next_12;
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_12) AND ($_SESSION['nv_reset'] < $reset_cap_13) )
{
	$level = $level_cap_13;
	$zen = $zen_cap_13;
	$chao = $chao_cap_13;
	$cre = $cre_cap_13;
	$blue = $blue_cap_13;
    $timers = $time_reset_next_13;
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_13) AND ($_SESSION['nv_reset'] < $reset_cap_14) )
{
	$level = $level_cap_14;
	$zen = $zen_cap_14;
	$chao = $chao_cap_14;
	$cre = $cre_cap_14;
	$blue = $blue_cap_14;
    $timers = $time_reset_next_14;
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_14) AND ($_SESSION['nv_reset'] < $reset_cap_15) )
{
	$level = $level_cap_15;
	$zen = $zen_cap_15;
	$chao = $chao_cap_15;
	$cre = $cre_cap_15;
	$blue = $blue_cap_15;
    $timers = $time_reset_next_15;
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_15) AND ($_SESSION['nv_reset'] < $reset_cap_16) )
{
	$level = $level_cap_16;
	$zen = $zen_cap_16;
	$chao = $chao_cap_16;
	$cre = $cre_cap_16;
	$blue = $blue_cap_16;
    $timers = $time_reset_next_16;
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_16) AND ($_SESSION['nv_reset'] < $reset_cap_17) )
{
	$level = $level_cap_17;
	$zen = $zen_cap_17;
	$chao = $chao_cap_17;
	$cre = $cre_cap_17;
	$blue = $blue_cap_17;
    $timers = $time_reset_next_17;
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_17) AND ($_SESSION['nv_reset'] < $reset_cap_18) )
{
	$level = $level_cap_18;
	$zen = $zen_cap_18;
	$chao = $chao_cap_18;
	$cre = $cre_cap_18;
	$blue = $blue_cap_18;
    $timers = $time_reset_next_18;
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_18) AND ($_SESSION['nv_reset'] < $reset_cap_19) )
{
	$level = $level_cap_19;
	$zen = $zen_cap_19;
	$chao = $chao_cap_19;
	$cre = $cre_cap_19;
	$blue = $blue_cap_19;
    $timers = $time_reset_next_19;
}
elseif ( ($_SESSION['nv_reset'] >= $reset_cap_19) AND ($_SESSION['nv_reset'] < $reset_cap_20) )
{
	$level = $level_cap_20;
	$zen = $zen_cap_20;
	$chao = $chao_cap_20;
	$cre = $cre_cap_20;
	$blue = $blue_cap_20;
    $timers = $time_reset_next_20;
}
$zen_rs_after = $zen;
$chao_rs_after = $chao;
$cre_rs_after = $cre;
$blue_rs_after = $blue;

$char_in_top = $_SESSION['nv_top50'];
$top_view_max = 0;

//Begin hỗ trợ tân thủ
if ($hotrotanthu == 1) {
    $info_hotro = 1;
    $level_config = $level;
	if($char_in_top == 1) {
        $info_hotro = 0;
        $level_reset = $level_config;
        $level_giam = 0;
        
        $timers_giam = 0;
        $timers_show = "<strong>{$timers}</strong>";
        
        $zen_rs_giam = 0;
        $zen_decre_percent = 0;
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
                $zen_rs_after = $zen_rs_after - $zen_rs_giam;
                $zen_rs_tanthu_view = "<br />- $zen_rs_giam ZEN (". $zen_decre_percent ."% Tân Thủ)";
                
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
            $zen_rs_after = $zen_rs_after - $zen_rs_giam;
            $zen_rs_tanthu_view = "<br />- $zen_rs_giam ZEN (". $zen_decre_percent ."% Tân Thủ)";
            
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
    $zen_rs_show = "<strong>". number_format($zen, 0, ',', '.') ."</strong>";
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
            $zen_vip_giam = floor($zen*$vip_rs_price_decre_percent[$vip_rs_price_decre_flag]/100);
            $chao_vip_giam = floor($chao*$vip_rs_price_decre_percent[$vip_rs_price_decre_flag]/100);
            $cre_vip_giam = floor($cre*$vip_rs_price_decre_percent[$vip_rs_price_decre_flag]/100);
            $blue_vip_giam = floor($blue*$vip_rs_price_decre_percent[$vip_rs_price_decre_flag]/100);
            
            $zen_rs_after = $zen_rs_after - $zen_vip_giam;
            $chao_rs_after = $chao_rs_after - $chao_vip_giam;
            $cre_rs_after = $cre_rs_after - $cre_vip_giam;
            $blue_rs_after = $blue_rs_after - $blue_vip_giam;
            
            $zen_rs_acc_vip = "<br />- ". number_format($zen_vip_giam, 0, ',', '.') ." ZEN (". $vip_rs_price_decre_percent[$vip_rs_price_decre_flag] ."% Gói Hỗ Trợ)";
            $chao_rs_acc_vip = "<br />- $chao_vip_giam Chao (". $vip_rs_price_decre_percent[$vip_rs_price_decre_flag] ."% Gói Hỗ Trợ)";
            $cre_rs_acc_vip = "<br />- $cre_vip_giam Cre (". $vip_rs_price_decre_percent[$vip_rs_price_decre_flag] ."% Gói Hỗ Trợ)";
            $blue_rs_acc_vip = "<br />- $blue_vip_giam Blue (". $vip_rs_price_decre_percent[$vip_rs_price_decre_flag] ."% Gói Hỗ Trợ)";
        } else {
            $zen_rs_acc_vip = "<br />- <font color='red'>Giảm thêm <strong><font color='blue'>". number_format($zen_vip_giam, 0, ',', '.') ." ZEN</font></strong> ( ". $vip_rs_price_decre_percent[$vip_rs_price_decre_flag] ."% ) khi <strong><font color='blue'>đăng ký Hỗ Trợ</font></strong></font>";
            $chao_rs_acc_vip = "<br />- <font color='red'>Giảm thêm <strong><font color='blue'>$chao_rs_after Chao</font></strong> ( ". $vip_rs_price_decre_percent[$vip_rs_price_decre_flag] ."% ) khi <strong><font color='blue'>đăng ký Hỗ Trợ</font></strong></font>";
            $cre_rs_acc_vip = "<br />- <font color='red'>Giảm thêm <strong><font color='blue'>$cre_vip_giam Cre</font></strong> ( ". $vip_rs_price_decre_percent[$vip_rs_price_decre_flag] ."% ) khi <strong><font color='blue'>đăng ký Hỗ Trợ</font></strong></font>";
            $blue_rs_acc_vip = "<br />- <font color='red'>Giảm thêm <strong><font color='blue'>$blue_vip_giam Blue</font></strong> ( ". $vip_rs_price_decre_percent[$vip_rs_price_decre_flag] ."% ) khi <strong><font color='blue'>đăng ký Hỗ Trợ</font></strong></font>";
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

if($zen_rs_after < $zen) {
    $zen_show = number_format($zen_rs_after, 0, ',', '.') ." <font size=1>(<i><u>". number_format($zen, 0, ',', '.') ."</u></i>)</font>";
} else {
    $zen_show = "<strong>". number_format($zen_rs_after, 0, ',', '.') ."</strong>";
}

if($chao_rs_after < $chao) {
    $chao_show = number_format($chao_rs_after, 0, ',', '.') ." <font size=1>(<i><u>". number_format($chao, 0, ',', '.') ."</u></i>)</font>";
} else {
    $chao_show = "<strong>". number_format($chao_rs_after, 0, ',', '.') ."</strong>";
}

if($cre_rs_after < $cre) {
    $cre_show = number_format($cre_rs_after, 0, ',', '.') ." <font size=1>(<i><u>". number_format($cre, 0, ',', '.') ."</u></i>)</font>";
} else {
    $cre_show = "<strong>". number_format($cre_rs_after, 0, ',', '.') ."</strong>";
}

if($blue_rs_after < $blue) {
    $blue_show = number_format($blue_rs_after, 0, ',', '.') ." <font size=1>(<i><u>". number_format($blue, 0, ',', '.') ."</u></i>)</font>";
} else {
    $blue_show = "<strong>". number_format($blue_rs_after, 0, ',', '.') ."</strong>";
}

$level_rs_decre = "$level_rs_tanthu_view $level_rs_acc_vip";
$zen_rs_decre = "$zen_rs_tanthu_view $zen_rs_acc_vip";
$chao_rs_decre = "$chao_rs_acc_vip";
$cre_rs_decre = "$cre_rs_acc_vip";
$blue_rs_decre = "$blue_rs_acc_vip";


$chenhlech_level = $_SESSION['nv_level'] - $level_reset;
$chenhlech_zen = $_SESSION['nv_zen'] + $_SESSION['acc_zen'] - $zen_rs_after;
$chenhlech_chao = $_SESSION['acc_chao'] - $chao_rs_after;
$chenhlech_cre = $_SESSION['acc_cre'] - $cre_rs_after;
$chenhlech_blue = $_SESSION['acc_blue'] - $blue_rs_after;

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
		$accept = 0;
		$notice_resetday = "$font_red_begin $_SESSION[nv_resetday] $font_red_end / $font_blue_begin $gioihanrs $font_blue_end";
	} else $notice_resetday = "$font_blue_begin $_SESSION[nv_resetday] / $gioihanrs $font_blue_end";
} elseif($use_gioihanrs[$thehe_choise] == 2) {
    
    $gioihanrs = $_SESSION['nv_ghrs'];
    
    if($ghrs2_top_cap[$ghrs_cap_max-1] > $top_view_max) {
        $top_view_max = $ghrs2_top_cap[$ghrs_cap_max-1];
    }

    if( $_SESSION['nv_resetday'] >= $gioihanrs )
	{
		$accept = 0;
		$notice_resetday = "$font_red_begin $_SESSION[nv_resetday] $font_red_end / $font_blue_begin $gioihanrs $font_blue_end";
	} else $notice_resetday = "$font_blue_begin $_SESSION[nv_resetday] / $gioihanrs $font_blue_end";
	
} else {
	$gioihanrs = '--';
	$notice_resetday = "$font_red_begin $_SESSION[nv_resetday] $font_red_end / $font_blue_begin $gioihanrs $font_blue_end";
}

if($char_in_top == 0 || $char_in_top > $top_view_max) {
    $char_in_top = "TOP > $top_view_max";
}

$item_bank_buy_btn = "";
if(isset($Use_ShopBank) && $Use_ShopBank == 1) {
    $item_bank_buy_btn = "<a class='btn btn-green' href='#webshop&act=shop_bank' rel='ajax' title='Mua Item Ngân Hàng'>Mua thêm</a>";
}

if ($chenhlech_level < 0) { $notice_level = "$font_red_begin Thiếu ". ABS($chenhlech_level) ." level $font_red_end"; } else { $notice_level = "$font_blue_begin Đủ Level $font_blue_end"; }

if ($chenhlech_zen < 0) { $notice_zen = "$font_red_begin Thiếu ". number_format(ABS($chenhlech_zen), 0, ',', '.') ." Zen $font_red_end"; } else { $notice_zen = "$font_blue_begin Đủ Zen $font_blue_end"; }
if ($chenhlech_chao < 0) { $notice_chao = "$font_red_begin Thiếu ". ABS($chenhlech_chao) ." Ngọc Hỗn Nguyên $font_red_end <a class='btn btn-green' href='#char_manager&act=jewel2bank' rel='ajax' title='Gửi Ngọc Hỗn Nguyên vào Ngân Hàng'>Gửi</a> $item_bank_buy_btn"; } else { $notice_chao = "$font_blue_begin Đủ Ngọc Hỗn Nguyên $font_blue_end $item_bank_buy_btn"; }

if ($chenhlech_cre < 0) { $notice_cre = "$font_red_begin Thiếu ". ABS($chenhlech_cre) ." Ngọc Sáng Tạo $font_red_end <a class='btn btn-green' href='#char_manager&act=jewel2bank' rel='ajax' title='Gửi Ngọc Sáng Tạo vào Ngân Hàng'>Gửi</a> $item_bank_buy_btn"; } else { $notice_cre = "$font_blue_begin Đủ ngọc Sáng Tạo $font_blue_end $item_bank_buy_btn"; }

if ($chenhlech_blue < 0) { $notice_blue = "$font_red_begin Thiếu ". ABS($chenhlech_blue) ." Lông Vũ $font_red_end <a class='btn btn-green' href='#char_manager&act=jewel2bank' rel='ajax' title='Gửi Lông Vũ vào Ngân Hàng'>Gửi</a> $item_bank_buy_btn"; } else { $notice_blue = "$font_blue_begin Đủ Lông Vũ $font_blue_end $item_bank_buy_btn"; }

if ($_SESSION['nv_online'] == 1 || $_SESSION['nv_doinv'] == 0 || $chenhlech_level < 0 || $chenhlech_zen < 0 || $chenhlech_chao < 0 || $chenhlech_cre < 0 || $chenhlech_blue < 0 ) { $accept = 0; }

$page_template = "templates/char_manager/reset.tpl";
?>