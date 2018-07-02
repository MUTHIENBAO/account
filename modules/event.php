<?php
/**
 * @author		NetBanBe
 * @copyright	2005 - 2012
 * @website		http://netbanbe.net
 * @Email		nwebmu@gmail.com
 * @HotLine		094 92 92 290
 * @Version		v5.12.0722
 * @Release		22/07/2012
 
 * WebSite hoan toan duoc thiet ke boi NetBanBe.
 * Vi vay, hay ton trong ban quyen tri tue cua NetBanBe
 * Hay ton trong cong suc, tri oc NetBanBe da bo ra de thiet ke nen NWebMU
 * Hay su dung ban quyen duoc cung cap boi NetBanBe de gop 1 phan nho chi phi phat trien NWebMU
 * Khong nen su dung NWebMU ban crack hoac tu nguoi khac dua cho. Nhung hanh dong nhu vay se lam kim ham su phat trien cua NWebMU do khong co kinh phi phat trien cung nhu san pham tri tue bi danh cap.
 * Cac ban hay su dung NWebMU duoc cung cap boi NetBanBe de NetBanBe co dieu kien phat trien them nhieu tinh nang hay hon, tot hon.
 * Cam on nhieu!
 */
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
if ($Use_Event != 1) {
	echo "<center>Chức năng không có hoặc không được sử dụng</center>";
}
else {
include('config/config_event.php');

if ( !isset($_SESSION['mu_username']) ) {
	echo "<div align=center><font color=red><b>Hãy Login trước khi thực hiện chức năng này</b></font></div>";
	include('modules/home.php');
} else {	
	if(isset($_GET['act'])) $act = $_GET['act'];
    else $act = null;
	switch ($act)
	{
		case 'event_top_auto': 
                if ($Use_TopAuto_RS_Day == 1 && $_GET['type'] == 'rs' && $_GET['date'] == 'day') { include('modules/event/event_top_auto.php'); }
                elseif ($Use_TopAuto_RS_Week == 1 && $_GET['type'] == 'rs' && $_GET['date'] == 'week') { include('modules/event/event_top_auto.php'); }
                elseif ($Use_TopAuto_RS_Month == 1 && $_GET['type'] == 'rs' && $_GET['date'] == 'month') { include('modules/event/event_top_auto.php'); }
                elseif ($Use_TopAuto_card_Day == 1 && $_GET['type'] == 'card' && $_GET['date'] == 'day') { include('modules/event/event_top_auto.php'); }
                elseif ($Use_TopAuto_card_Week == 1 && $_GET['type'] == 'card' && $_GET['date'] == 'week') { include('modules/event/event_top_auto.php'); }
                elseif ($Use_TopAuto_card_Month == 1 && $_GET['type'] == 'card' && $_GET['date'] == 'month') { include('modules/event/event_top_auto.php'); }
    			else { echo "<center>Event chưa bật</center>"; }
			break;
        
        
        case 'event_week': 
			if ($event_week == 1) { include('modules/event/event_week.php'); }
			else { echo "<center>Event chưa bật</center>"; }
			break;
        case 'event_month': 
			if ($event_month == 1) { include('modules/event/event_month.php'); }
			else { echo "<center>Event chưa bật</center>"; }
			break;
            
        case 'event_bongda': 
			if ($event_bongda_on == 1) { include('modules/event/event_bongda.php'); }
			else { echo "<center>Event chưa bật</center>"; }
			break;
        case 'event_giftthangcap': 
            if ($event_giftthangcap_on == 1) { include('modules/event/event_giftthangcap.php'); }
			else { echo "<center>Event chưa bật</center>"; }
			break;
        case 'event_epitem': 
			if ($event_epitem_on == 1) { include('modules/event/event_epitem.php'); }
			else { echo "<center>Event chưa bật</center>"; }
			break;
		case 'event2': 
			if ($event2_on == 1) { include('modules/event/event2.php'); }
			else { echo "<center>Event chưa bật</center>"; }
			break;
		case 'event1': 
			if ($event1_on == 1) { include('modules/event/event1.php'); }
			else { echo "<center>Event chưa bật</center>"; }
			break;
		case 'event_goldbox': 
			if ($event1_on == 1) { include('modules/event/event_goldbox.php'); }
			else { echo "<center>Event chưa bật</center>"; }
			break;
		case 'event_goldbox_top': 
			if ($event1_on == 1) { include('modules/event/eventtop_intime.php'); }
			else { echo "<center>Event chưa bật</center>"; }
			break;
		case 'santa_ticket': 
			if ($event_santa_ticket == 1) { include('modules/event/santa_ticket.php'); }
			else { echo "<center>Event chưa bật</center>"; }
			break;
		case 'event_toprs': 
			$index = $_GET['index'];
            if ($event_toprs_on == 1 || $event_toprs[$index]['on'] == 1) { include('modules/event/eventtop_intime.php'); }
			else { echo "<center>Event chưa bật</center>"; }
			break;
		case 'event_toppoint': 
			if ($event_toppoint_on == 1) { include('modules/event/eventtop_intime.php'); }
			else { echo "<center>Event chưa bật</center>"; }
			break;
		case 'event_topcard': 
			$index = $_GET['index'];
            if ($event_topcard_on == 1 || $event_topcard[$index]['on'] == 1) { include('modules/event/eventtop_intime.php'); }
			else { echo "<center>Event chưa bật</center>"; }
			break;
        
        case 'giftcode_rs': 
			include('config/config_giftcode_rs.php');
            if ($giftcode_rs_use != 'none') { include('modules/event/giftcode_rs.php'); }
			else { echo "<center>Event chưa bật</center>"; }
			break;
        case 'giftcode_week': 
			include('config/config_giftcode_week.php');
            if ($giftcode_week_use != 'none') { include('modules/event/giftcode_week.php'); }
			else { echo "<center>Event chưa bật</center>"; }
			break;
        case 'giftcode_month': 
			include('config/config_giftcode_month.php');
            if ($giftcode_month_use != 'none') { include('modules/event/giftcode_month.php'); }
			else { echo "<center>Event chưa bật</center>"; }
			break;
        case 'giftcode_tanthu': 
			include('config/config_giftcode_tanthu.php');
            if ($giftcode_tanthu_use == 1) { include('modules/event/giftcode_tanthu.php'); }
			else { echo "<center>Event chưa bật</center>"; }
			break;
        case 'giftcode_change': 
			include('modules/event/giftcode_change.php');
			break;
        case 'giftcode_history': 
			include('modules/event/giftcode_history.php');
			break;
            
        case 'award':
            include('modules/event/award.php');
        break;
        
        case 'itemfind': include('modules/event/event_itemfind.php'); break;
        
        case 'itemfull':
            if ($hotroitem_on == 1) { include('modules/event/itemfull.php'); }
            else { echo "<center>Event chưa bật</center>"; }
        break;
        case 'luckyspin': 
			if ($Use_luckyspin == 1) { include('modules/event/luckyspin.php'); }
			else { echo "<center>Event chưa bật</center>"; }
			break;
        
        default:
            $page_template = 'templates/event.tpl';
	}
}
}
?>