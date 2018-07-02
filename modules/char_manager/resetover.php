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
include('config/config_gioihanrs.php');
include('config/config_reset_over.php');
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

$level_config = $level;
$level_reset = $level;

//VIP
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
//End VIP

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
$chenhlech_chao = $_SESSION['acc_chao'] - $chao;
$chenhlech_cre = $_SESSION['acc_cre'] - $cre;
$chenhlech_blue = $_SESSION['acc_blue'] - $blue;

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
if ($chenhlech_chao < 0) { $notice_chao = "$font_red_begin Thiếu ". ABS($chenhlech_chao) ." Chao $font_red_end (<a href='#char_manager&act=jewel2bank' rel='ajax'>Gửi Chao vào Ngân Hàng</a>)"; } else { $notice_chao = "$font_blue_begin Đủ Chao Reset $font_blue_end"; }
if ($chenhlech_cre < 0) { $notice_cre = "$font_red_begin Thiếu ". ABS($chenhlech_cre) ." Creation $font_red_end (<a href='#char_manager&act=jewel2bank' rel='ajax'>Gửi Creation vào Ngân Hàng</a>)"; } else { $notice_cre = "$font_blue_begin Đủ Creation Reset $font_blue_end"; }
if ($chenhlech_blue < 0) { $notice_blue = "$font_red_begin Thiếu ". ABS($chenhlech_blue) ." Blue Feather $font_red_end (<a href='#char_manager&act=jewel2bank' rel='ajax'>Gửi Lông Chim vào Ngân Hàng</a>)"; } else { $notice_blue = "$font_blue_begin Đủ Blue Feather Reset $font_blue_end"; }

if ($_SESSION['nv_online'] == 1 || $_SESSION['nv_doinv'] == 0 || $chenhlech_level < 0 || $chenhlech_zen < 0 || $chenhlech_chao < 0 || $chenhlech_cre < 0 || $chenhlech_blue < 0 || $use_gioihanrs[$thehe_choise] == 0 ) { $accept = 0; }

$page_template = "templates/char_manager/resetover.tpl";
?>