<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/

if (isset($_SESSION[mu_username])) {
    include_once("config/config_support.php");
    if ( $user_support == 1 )
    {
        $support_unread_query = "SELECT * FROM support WHERE sup_read=0 AND supid_parent=0 AND AccountID='$_SESSION[mu_username]'";
        $support_unread_result = mysql_query($support_unread_query);
            check_queryerror($support_unread_query, $support_unread_result);
        $unread = mysql_num_rows($support_unread_result);
        
        $bqtsend_query = "SELECT supid FROM support WHERE AccountID IN ($quantri_support) AND AccountID<>'$_SESSION[mu_username]' AND supid_parent=0";
        $bqtsend_result = mysql_query($bqtsend_query);
            check_queryerror($bqtsend_query, $bqtsend_result);
        while( $bqtsend = mysql_fetch_assoc($bqtsend_result) )
        {
            $check_readbqt_query = "SELECT * FROM support_readbqt WHERE supid=$bqtsend[supid] AND AccountID='$_SESSION[mu_username]'";
            $check_readbqt_result = mysql_query($check_readbqt_query);
                check_queryerror($check_readbqt_query, $check_readbqt_result);
            $readed = mysql_num_rows($check_readbqt_result);
            if( $readed == 0 ) $unread++;
        }     
        
        if( in_array($_SESSION[mu_username], $quantri_arr )) {  // Neu la BQT
            $support_notans_query = "SELECT * FROM support WHERE sup_status=0 AND supid_parent=0";
            $support_notans_result = mysql_query($support_notans_query);
                check_queryerror($support_notans_query, $support_notans_result);
            $support_notans = mysql_num_rows($support_notans_result);         
        }    
        include('templates/box_support.tpl');
    }
}

?>