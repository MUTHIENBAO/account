<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");

$subid = $_GET['id'];   $subid = abs(intval($subid));

if ( $_POST['action'] == 'sendsupport' )
{
	$supportcontent = $_POST['supportcontent'];
	
    if( $sendsv === false ) { $notice = "Tốc độ xử lý của bạn quá nhanh, vui lòng chờ vài giây rồi tiếp tục thực hiện."; }
	elseif (empty($supportcontent))
	{
		$notice = "Chưa nhập Nội dung Phản Hồi";
	}
	else {
        $support_add_query = "INSERT INTO support (AccountID, supid_parent, sup_content, sup_time, sup_status) VALUES ('$_SESSION[mu_username]', $subid, '$supportcontent', $time_now, 0)";
        $support_add_result = mysql_query($support_add_query);
            check_queryerror($support_add_query, $support_add_result);
            
        $update_support_status_query = "UPDATE support SET sup_timenew=$time_now, sup_status=0, sup_read=1 WHERE supid=$subid";
        $update_support_status_result = mysql_query($update_support_status_query);
            check_queryerror($update_support_status_query, $update_support_status_result);
        
        $notice = "Thêm phản hồi thành công. BQT sẽ trả lời bạn trong giây lát, chậm nhất là 24h.";
	}
} 

    
    $supportget_questbegin_query = "SELECT AccountID, sup_title, sup_content, sup_time, sup_read, sup_status FROM support WHERE supid=$subid AND (AccountID='$_SESSION[mu_username]' OR AccountID IN ($quantri_support))";
    $supportget_questbegin_result = mysql_query($supportget_questbegin_query);
        check_queryerror($supportget_questbegin_query, $supportget_questbegin_result);
    $check_questbegin = mysql_num_rows($supportget_questbegin_result);
    if( $check_questbegin>0 )   // Nếu tồn tại Support
    {
        $supportget_questbegin = mysql_fetch_assoc($supportget_questbegin_result);
        $timepost = date('h:i A d/m/Y', $supportget_questbegin['sup_time']);
		$support_status = $supportget_questbegin['sup_status'];
		switch($supportget_questbegin['sup_status'])
        {
            case 1 : $status = "Đã hoàn thành"; break;
            case 9 : $status = "<font color=red>Đã khóa</font>"; break;
            default : $status = "<font color=red>Chưa hoàn thành</font>";
        }
		$account = $supportget_questbegin['AccountID'];
        if($supportget_questbegin['AccountID'] == $_SESSION[mu_username]) // Nếu là người chơi gửi
        {
            // Update da doc
            if($supportget_questbegin['sup_read'] == 0)
            {
                $update_read_query = "UPDATE support SET sup_read=1 WHERE sup_read=0 AND supid=$subid";
                $update_read_result = mysql_query($update_read_query);
                    check_queryerror($update_read_query, $update_read_result);
            }      
            $title = $supportget_questbegin['sup_title'];
        } else  // Nếu là BQT gửi
        {
            // Update da doc
            $check_readbqt_query = "SELECT * FROM support_readbqt WHERE supid=$subid AND AccountID='$_SESSION[mu_username]'";
            $check_readbqt_result = mysql_query($check_readbqt_query);
                check_queryerror($check_readbqt_query, $check_readbqt_result);
            $check_readbqt = mysql_num_rows($check_readbqt_result);
            if($check_readbqt == 0) // Neu chua doc
            {
                $update_read_query = "INSERT INTO support_readbqt (supid, AccountID) VALUES ($subid, '$_SESSION[mu_username]')";
                $update_read_result = mysql_query($update_read_query);
                    check_queryerror($update_read_query, $update_read_result);
            }           
            $title = "Ban Quản Trị gửi";
        }
        $support_read[] = array (
							'timepost'	=> $timepost,
                            'title' =>  "<b>". $title ."</b>",
                            'content'   =>  $supportget_questbegin['sup_content'],
							'status' =>	$support_status,
							'account' => $account,
                        );
        
        $supportget_continue_query = "SELECT AccountID, sup_content, sup_time FROM support WHERE supid_parent=$subid AND (AccountID='$_SESSION[mu_username]' OR AccountID IN ($quantri_support)) ORDER BY sup_time";
        $supportget_continue_result = mysql_query($supportget_continue_query);
            check_queryerror($supportget_continue_query, $supportget_continue_result);
        while( $supportget_continue = mysql_fetch_assoc($supportget_continue_result) )
        {
            $timepost = date('h:i A d/m/Y', $supportget_continue['sup_time']);
            if($supportget_continue['AccountID'] == $_SESSION[mu_username]) // Nếu là người chơi
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
							'status' =>	$support_status,
							'account'	=> $account,
                        );

        }
    } else  // Nếu không tồn tại Support 
    {
        $notice = "Không tồn tại Hỗ trợ của bạn";
    }

$page_template = "templates/support/readsupport.tpl";
?>