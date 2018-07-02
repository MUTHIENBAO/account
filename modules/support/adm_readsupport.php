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

$subid = $_GET['id'];   $subid = abs(intval($subid));

if ( $_POST['action'] == 'sendsupport' )
{
	$supportcontent = $_POST['supportcontent'];
    $theodoi = $_POST['theodoi'];
	
    if (empty($supportcontent))
	{
		$notice = "Chưa nhập Nội dung Trả lời Hỗ trợ";
	}
	else {
        $support_add_query = "INSERT INTO support (AccountID, supid_parent, sup_content, sup_time) VALUES ('$_SESSION[mu_username]', $subid, '$supportcontent', $time_now)";
        $support_add_result = mysql_query($support_add_query);
            check_queryerror($support_add_query, $support_add_result);
        
        $update_support_status_query = "UPDATE support SET sup_timenew=$time_now, sup_status=1, sup_read=0";
        
        if($theodoi) $update_support_status_query .= ", sup_theodoi=1";
            else $update_support_status_query .= ", sup_theodoi=0";
        
        $update_support_status_query .= " WHERE supid=$subid";
        $update_support_status_result = mysql_query($update_support_status_query);
            check_queryerror($update_support_status_query, $update_support_status_result);
            
        $notice = "Trả lời hỗ trợ thành công.";
        $replied = 1;
	}
}

if($_POST['check'] == 1)
{
        $update_check_query = "UPDATE support SET ";
        if(isset($_POST['repplied'])) $update_check_query .= "sup_status=1, ";
            else $update_check_query .= "sup_status=0, ";

        if(isset($_POST['theodoi'])) $update_check_query .= "sup_theodoi=1 ";
            else $update_check_query .= "sup_theodoi=0 ";
        $update_check_query .= "WHERE supid=$subid";
        
        $update_check_result = mysql_query($update_check_query);
            check_queryerror($update_check_query, $update_check_result);
}
    
    $supportget_questbegin_query = "SELECT AccountID, sup_title, sup_content, sup_time, sup_status, sup_theodoi FROM support WHERE supid=$subid";
    $supportget_questbegin_result = mysql_query($supportget_questbegin_query);
        check_queryerror($supportget_questbegin_query, $supportget_questbegin_result);
    $check_questbegin = mysql_num_rows($supportget_questbegin_result);
    if( $check_questbegin>0 )   // Nếu tồn tại Support
    {
        $supportget_questbegin = mysql_fetch_assoc($supportget_questbegin_result);
        $repllied =  $supportget_questbegin['sup_status'];
        $theodoi = $supportget_questbegin['sup_theodoi'];
		switch($repllied)
        {
            case 1 : $status = "Đã hoàn thành"; break;
            case 9 : $status = "<font color=red>Đã khóa</font>"; break;
            default : $status = "<font color=red>Chưa hoàn thành</font>";
        }
        $timepost = date('h:i A d/m/Y', $supportget_questbegin['sup_time']);

		$account = $supportget_questbegin['AccountID'];
        $title = $supportget_questbegin['sup_title'];	

        $support_read[] = array (
							'timepost'	=> $timepost,		
                            'title' =>  "<i> $timepost </i> - <b> $title </b><i> ( Tài khoản : <font color=red>$supportget_questbegin[AccountID]</font> )</i>",
                            'content'   =>  $supportget_questbegin['sup_content'],
							'account'	=> $account,
                        );
        
        $supportget_continue_query = "SELECT AccountID, sup_content, sup_time FROM support WHERE supid_parent=$subid ORDER BY sup_time";
        $supportget_continue_result = mysql_query($supportget_continue_query);
            check_queryerror($supportget_continue_query, $supportget_continue_result);
        while( $supportget_continue = mysql_fetch_assoc($supportget_continue_result) )
        {
            $timepost = date('h:i A d/m/Y', $supportget_continue['sup_time']);
            if($supportget_continue['AccountID'] != $_SESSION[mu_username]) // Nếu là người chơi
            {
                $account = $supportget_continue['AccountID'];
            } else  // Nếu là BQT
            {
                $account = "<font color='red'>Ban Quản Trị đã trả lời</font>";
            }
            
        $support_read[] = array (
							'timepost'	=> $timepost,
                            'title' =>  "<b>". $title ."</b>",
                            'content'   =>  $supportget_continue['sup_content'],
							'account'	=> $account,
                        );

        }
    } else  // Nếu không tồn tại Support 
    {
        $notice = "Không tồn tại Hỗ trợ";
    }

$page_template = "templates/support/adm_readsupport.tpl";
} else echo "<center><font color='red'>Bạn không phải BQT - Không được phép truy cập</font></center>";
?>