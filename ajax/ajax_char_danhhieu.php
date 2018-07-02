<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
$file_edit = 'config/config_title.txt';

$fopen_host = fopen($file_edit, "r");
$title_data = fgets($fopen_host);
fclose($fopen_host);
$title_arr = json_decode($title_data, true);
if(!is_array($title_arr)) $title_arr = array();

$action = $_GET['action'];

switch ($action){ 

	default :
        $danhhieu_type = $_GET['danhhieu_type'];
        $danhhieu_id = $_GET['danhhieu_id'];
        
        $getcontent_url = $server_url . "/sv_char.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'name'    =>  $_SESSION['mu_nvchon'],
            'danhhieu_type'    =>  $danhhieu_type,
            'danhhieu_id'    =>  $danhhieu_id,
            
            'action'	=>	$action,
            'pagesv'	=>	'sv_char_danhhieu',
            'string_login'    =>  $_SESSION['checklogin'],
            'passtransfer'    =>  $passtransfer
        );
        
        $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
        
        if ( empty($reponse) ) $notice = "Server bảo trì.";
        elseif($reponse == "login_other") {
        	$notice = "Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.";
        	session_destroy();
        }
        else {
        	if ( read_TagName($reponse, 'info', 1) == 'OK' ) {
        	   $danhhieu_index = read_TagName($reponse, 'danhhieu_index', 1);
               switch ($title_arr[$danhhieu_type][$danhhieu_id][5]){ 
                	case 1:
                        $_SESSION['nv_RankTitle1'] = $danhhieu_index;
                	break;
                
                	case 2:
                        $_SESSION['nv_RankTitle2'] = $danhhieu_index;
                	break;
                
                	case 3:
                        $_SESSION['nv_RankTitle3'] = $danhhieu_index;
                	break;
                
                	default :
                        $_SESSION['nv_title'] = $danhhieu_index;
                }
               if($danhhieu_type == 'buy') $_SESSION['acc_gcoin'] -= $title_arr[$danhhieu_type][$danhhieu_id][0];
               
               echo "OK";
        	} else echo $reponse;
        }
}



echo $notice;


?>