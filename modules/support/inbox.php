<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
    $supportget_query = "SELECT AccountID, supid, sup_title, sup_timenew, sup_read, sup_status FROM support WHERE supid_parent=0 AND (AccountID='$_SESSION[mu_username]' OR AccountID IN ($quantri_support)) ORDER BY sup_timenew DESC LIMIT 0,20";
    $supportget_result = mysql_query($supportget_query);
        check_queryerror($supportget_query, $supportget_result);
    while( $supportget = mysql_fetch_assoc($supportget_result) )
    {
        $timepost = date('h:i A d/m/Y', $supportget['sup_timenew']);
        if($supportget['AccountID'] == $_SESSION[mu_username]) // Nếu là người chơi gửi
        {
            $readed = $supportget['sup_read'];
        } else  // Nếu là BQT gửi
        {
            $check_readbqt_query = "SELECT * FROM support_readbqt WHERE supid=$supportget[supid] AND AccountID='$_SESSION[mu_username]'";
            $check_readbqt_result = mysql_query($check_readbqt_query);
                check_queryerror($check_readbqt_query, $check_readbqt_result);
            $readed = mysql_num_rows($check_readbqt_result);
        }
        
        switch($readed)
        {
            case 1 : $support_title = $supportget['sup_title']; break;
            default : $support_title = "<b><font color='red'>" . $supportget['sup_title'] . "</font></b>";
        }
        switch($supportget['sup_status'])
        {
            case 1 : $support_status = "<font color=blue><i>Đã trả lời</i></font>"; break;
            case 9 : $support_status = "<font color=red><i>Đã khóa</i></font>"; break;
            default : $support_status = "Chưa trả lời";
        }
		$_SESSION['support'] = 0;
        $supportlist[] = array(
                            'supid' => $supportget['supid'],
                            'sup_title' => $support_title,
                            'sup_time' => $timepost,
                            'sup_status' => $support_status,
                        );
    }
$page_template = "templates/support/inbox.tpl";
?>