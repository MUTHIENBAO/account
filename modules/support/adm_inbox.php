<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
if( in_array($_SESSION[mu_username], $quantri_arr )) {
	
    
    $supporttheodoi_query = "SELECT AccountID, supid, sup_title, sup_timenew, sup_status FROM support WHERE supid_parent=0 AND sup_theodoi=1 ORDER BY sup_timenew";
    $supporttheodoi_result = mysql_query($supporttheodoi_query);
        check_queryerror($supporttheodoi_query, $supporttheodoi_result);
    while( $support_theodoi = mysql_fetch_assoc($supporttheodoi_result) )
    {
        $timepost = date('h:i A d/m/Y', $support_theodoi['sup_timenew']);
        switch($support_theodoi['sup_status'])
        {
            case 1 : $support_status = "<font color=blue><i>Đã trả lời</i></font>"; break;
            case 9 : $support_status = "<font color=red><i>Đã khóa</i></font>"; break;
            default : $support_status = "<font color=red>Chưa trả lời</font>";
        }

        $supporttheodoi[] = array(
                            'supid' => $support_theodoi['supid'],
                            'AccountID' =>  $support_theodoi['AccountID'],
                            'sup_title' => $support_theodoi['sup_title'],
                            'sup_time' => $timepost
                        );
    }
    
    $supportget_query = "SELECT AccountID, supid, sup_title, sup_timenew FROM support WHERE supid_parent=0 AND sup_status=0 AND sup_theodoi=0 ORDER BY sup_timenew";
    $supportget_result = mysql_query($supportget_query);
        check_queryerror($supportget_query, $supportget_result);
    while( $supportget = mysql_fetch_assoc($supportget_result) )
    {
        $timepost = date('h:i A d/m/Y', $supportget['sup_timenew']);
		switch($supportget['sup_status'])
        {
            case 1 : $support_status = "<font color=blue><i>Đã trả lời</i></font>"; break;
            case 9 : $support_status = "<font color=red><i>Đã khóa</i></font>"; break;
            default : $support_status = "<font color=red>Chưa trả lời</font>";
        }
        $supportlist[] = array(
                            'supid' => $supportget['supid'],
                            'AccountID' =>  $supportget['AccountID'],
                            'sup_title' => $supportget['sup_title'],
                            'sup_time' => $timepost,
                        );
    }
$page_template = "templates/support/adm_inbox.tpl";
} else echo "<center><font color='red'>Bạn không phải BQT - Không được phép truy cập</font></center>";
?>