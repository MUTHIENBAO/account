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
include('config/config_gioihanrs.php');
include('config/config_resetvip_over.php');
include('config/config_vip.php');
include('config/config_vip_system.php');

include('modules/box_facebook.php');

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

$level_config = $level;
$level_reset = $level;

//VIP1
if($Use_VIP == 1 && $_SESSION['nbb_vip'] == 1) {
    $vip_lv = 0;
    $nbb_vip_time_used_day = floor($_SESSION['nbb_vip_time_used']/(24*60*60));
    if(is_array($vip_level_day)) {
        foreach($vip_level_day as $k => $v) {
            if($nbb_vip_time_used_day >= $v) $vip_lv = $k;
            else break;
        }
    }
    
    $level_reset = $level_reset - $vip_rs_lv_decre[$vip_lv];
}
//End VIP1

//VIP2
if($Use_VIP == 2 && $_SESSION['acc_vip'] > 0 && $_SESSION['acc_vip_day'] >= $enable_vip['level_reset']) {
    if($_SESSION['acc_vip'] == 1) {
		$extra_level_reset = floor($level_reset*$gold_vip['level_reset']/100);
		$extra_zen_reset = floor($zen*$gold_vip['level_reset']/100);
		$level_reset = $level_reset - $extra_level_reset;
		$zen_rs_after = $zen_rs_after - $extra_zen_reset;
	}
	elseif($_SESSION['acc_vip'] == 2) {
		$extra_level_reset = floor($level_reset*$silver_vip['level_reset']/100);
		$extra_zen_reset = floor($zen*$silver_vip['level_reset']/100);
		$level_reset = $level_reset - $extra_level_reset;
		$zen_rs_after = $zen_rs_after - $extra_zen_reset;
	}             
}
//End VIP2

if($level_reset < $level_config) {
    $level_show = "{$level_reset} <font size=1>(<i><u>$level_config</u></i>)</font>";
} else {
    $level_show = "<strong>{$level_reset}</strong>";
}

$chenhlech_level = $_SESSION['nv_level'] - $level_reset;
$chenhlech_zen = $_SESSION['nv_zen'] + $_SESSION['acc_zen'] - $zen;
$chenhlech_gcoin = ($_SESSION['acc_gcoin'] + $_SESSION['acc_gcoin_km']) - $gcoin_reset_vip;
$chenhlech_vpoint = $_SESSION['acc_vpoint'] + $_SESSION['acc_vpoint_km'] - $vpoint_reset_vip;

$font_red_begin = "<font color='red'><b>";
$font_red_end = "</b></font>";
$font_blue_begin = "<font color='green'><b>";
$font_blue_end = "</b></font>";

$accept = 1;

if($use_overrs[$thehe_choise] == 0) {
    $overrs_rs[$thehe_choise] = 0;
}

$char_in_top = $_SESSION['nv_top50'];

if($use_gioihanrs[$thehe_choise] == 1) {
    for($i=1; $i<= $ghrs_cap_max; $i++) {
        if( ($char_in_top > $ghrs_top_cap[$i-1]) && ($char_in_top <= $ghrs_top_cap[$i]) ) {
            $gioihanrs = $ghrs_rsmax_cap[$thehe_choise][$i];
        }
    }
    
    $dayofweek = date('w', time());
    if($dayofweek == 0) {
        $gioihanrs = $gioihanrs + floor($gioihanrs * $overrs_sun_extra[$thehe_choise]/100);
    } else if($dayofweek == 6) {
        $gioihanrs = $gioihanrs + floor($gioihanrs * $overrs_sat_extra[$thehe_choise]/100);
    }
    
    if($use_overrs[$thehe_choise] == 1 && $overrs_rs[$thehe_choise] > 0) {}
        else $overrs_rs[$thehe_choise] = 0;
    if( $_SESSION['nv_resetday'] < ($gioihanrs + $overrs_rs[$thehe_choise]) ) 
    {
    	$accept = 0;
        $notice_vuotmuc = '';
        if($_SESSION['nv_resetday'] >= $gioihanrs) $notice_vuotmuc = "<br /><i>Cần phải Reset đủ <strong>". $overrs_rs[$thehe_choise] ."</strong> lần vượt mức bên Reset VIP mới có thể Reset OVER </i>";
    	$notice_resetday = "$font_red_begin $_SESSION[nv_resetday] / $gioihanrs + ". $overrs_rs[$thehe_choise] ." $font_red_end $notice_vuotmuc";
    } else $notice_resetday = "$font_blue_begin $_SESSION[nv_resetday] / $gioihanrs + ". $overrs_rs[$thehe_choise] ." $font_blue_end";
} elseif($use_gioihanrs[$thehe_choise] == 2) {
    $gioihanrs = $_SESSION['nv_ghrs'];
    if($use_overrs[$thehe_choise] == 1 && $overrs_rs[$thehe_choise] > 0) {}
        else $overrs_rs[$thehe_choise] = 0;
    $gioihanrs_over = $gioihanrs + $overrs_rs[$thehe_choise];
    if( $_SESSION['nv_resetday'] >= $gioihanrs_over )
	{
		$notice_resetday = "$font_blue_begin Đã hết số lần Reset chính. Được phép Reset OVER $font_blue_end";
	} else {
	   $accept = 0;
       if($_SESSION['nv_resetday'] < $gioihanrs) {
       	   $reset_less = $gioihanrs - $_SESSION['nv_resetday'];
            $notice_resetday = "$font_red_begin Còn $reset_less lần Reset";
            if($use_overrs[$thehe_choise] == 1 && $overrs_rs[$thehe_choise] > 0) {
                $notice_resetday .= " <br />và {$overrs_rs[$thehe_choise]} lần Reset VIP vượt mức";
            }
       }
       else {
            $rsover_less = $gioihanrs_over - $_SESSION['nv_resetday'];
            $notice_resetday = "$font_red_begin Còn $rsover_less lần Reset VIP vượt mức";
       }
       
       $notice_resetday .= "<br />Không đủ điều kiện Reset OVER $font_red_end";
	}
}

if ($chenhlech_level < 0) { $notice_level = "$font_red_begin Thiếu ". ABS($chenhlech_level) ." level $font_red_end"; } else { $notice_level = "$font_blue_begin Đủ Level Reset $font_blue_end"; }
if ($chenhlech_zen < 0) { $notice_zen = "$font_red_begin Thiếu ". number_format(ABS($chenhlech_zen), 0, ',', '.') ." Zen $font_red_end"; } else { $notice_zen = "$font_blue_begin Đủ Zen Reset $font_blue_end"; }
if ($chenhlech_gcoin < 0) { $notice_gcoin = "$font_red_begin Thiếu ". ABS($chenhlech_gcoin) ." Gcent $font_red_end"; } else { $notice_gcoin = "$font_blue_begin Đủ Gcent Reset $font_blue_end"; }
if ($chenhlech_vpoint < 0) { $notice_vpoint = "$font_red_begin Thiếu ". ABS($chenhlech_vpoint) ." Vcent $font_red_end"; } else { $notice_vpoint = "$font_blue_begin Đủ Vcent Reset $font_blue_end"; }

if ( $_SESSION['nv_online'] == 1 || $_SESSION['nv_doinv'] == 0 || $chenhlech_level < 0 || $chenhlech_zen < 0 || ( $chenhlech_gcoin < 0 && $chenhlech_vpoint < 0) || $use_gioihanrs[$thehe_choise] == 0 ) { $accept = 0; }	

$page_template = "templates/char_manager/resetvipover.tpl";
?>