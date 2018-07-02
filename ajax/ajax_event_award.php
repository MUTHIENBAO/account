<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
$action = $_GET['action'];

switch ($action){ 
    
    case 'award_receive':
        $award_id = $_GET['award_id'];    $award_id = abs(intval($award_id));
        
        $getcontent_url = $server_url . "/event_award.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'name'    =>  $_SESSION['mu_nvchon'],
            'action'    =>  'award_receive',
            'award_id'    =>  $award_id,
            
            'string_login'    =>  $_SESSION['checklogin'],
            'passtransfer'    =>  $passtransfer
        );
        
        $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
        
        if ( empty($reponse) ) echo "Server bảo trì.";
        elseif($reponse == "login_other") {
        	echo "Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.";
        	session_destroy();
        }
        else {
        	if ( read_TagName($reponse, 'info', 1) == 'OK' ) {
                $award_unreceive_count = read_TagName($reponse, 'award_unreceive_count', 1);
                echo "|OK|$award_unreceive_count|";
        	} else echo $reponse;
        }
    break;
    
    
}

?>