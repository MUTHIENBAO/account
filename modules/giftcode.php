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
        case 'giftcode_rs': 
			include('config/config_giftcode_rs.php');
            if ($giftcode_rs_use != 'none') { include('modules/giftcode/giftcode_rs.php'); }
			else { echo "<center>GiftCode chưa bật</center>"; }
			break;
        case 'giftcode_week': 
			include('config/config_giftcode_week.php');
            if ($giftcode_week_use != 'none') { include('modules/giftcode/giftcode_week.php'); }
			else { echo "<center>GiftCode chưa bật</center>"; }
			break;
        case 'giftcode_month': 
			include('config/config_giftcode_month.php');
            if ($giftcode_month_use != 'none') { include('modules/giftcode/giftcode_month.php'); }
			else { echo "<center>GiftCode chưa bật</center>"; }
			break;
		case 'giftcode_nt': 
            if ($giftcode_nt_use > 0 && (strtotime($event_napthegc_end) >= time() - 5*24*60*60)) { include('modules/giftcode/giftcode_nt.php'); }
			else { echo "<center>GiftCode chưa bật</center>"; }
			break;	
        case 'giftcode_tanthu': 
			include('config/config_giftcode_tanthu.php');
            if ($giftcode_tanthu_use == 1) { include('modules/giftcode/giftcode_tanthu.php'); }
			else { echo "<center>GiftCode chưa bật</center>"; }
			break;
        case 'giftcode_tanthu2': 
			include('config/config_giftcode_tanthu2.php');
            if ($giftcode_tanthu2_use == 1) { include('modules/giftcode/giftcode_tanthu2.php'); }
			else { echo "<center>GiftCode chưa bật</center>"; }
			break;
        case 'giftcode_change': 
			include('modules/giftcode/giftcode_change.php');
			break;
        case 'giftcode_history': 
			include('modules/giftcode/giftcode_history.php');
			break;
        
        
        default:
            $page_template = 'templates/giftcode.tpl';
	}
}
}
?>