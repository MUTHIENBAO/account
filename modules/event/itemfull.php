<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");

include_once("config/config_event.php");

if($hotroitem_on != 1) {
    echo "Chức năng chưa bật!"; exit();
} else {

    $file_item = 'config/event_itemhotro.txt';
            
    if (isset($_POST['action']))
    {
    	$action = $_POST['action'];
    	if ($action == 'event_itemfull')
    	{
    		$item = $_POST['item'];
    		$pass2 = $_POST['pass2'];
    		
    		if( $sendsv === false ) { $notice = "Tốc độ xử lý của bạn quá nhanh, vui lòng chờ vài giây rồi tiếp tục thực hiện."; }
    		elseif(empty($item)) {
    			$notice = "Chưa chọn vé tham gia Event muốn mua";
    		}
    		elseif (preg_match("/[^a-zA-Z0-9_$]/", $item))
    			{
    				$notice = "Dữ liệu lỗi - Item chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.";
    			}
    		elseif (empty($pass2))
    		{
    			$notice = "Chưa nhập mật khẩu cấp 2";
    		}
    		elseif (preg_match("/[^a-zA-Z0-9_$]/", $pass2))
    			{
    				$notice = "Dữ liệu lỗi - Mật khẩu cấp 2 chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.";
    			}
    		else {
    		
        		$getcontent_url = $server_url . "/event_itemfull.php";
                $getcontent_data = array(
                    'login'    =>  $_SESSION['mu_username'],
                    'pass2'    =>  $pass2,
                    'item'    =>  $item,
                    'string_login'    =>  $_SESSION['checklogin'],
                    'passtransfer'    =>  $passtransfer
                ); 
                
                $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
    
    			if ( empty($reponse) ) $notice = "Server bảo trì.";
    			elseif($reponse == "login_other") {
    				$notice = "<font size='3' color='red'>Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.</font>";
    				session_destroy();
    			}
    			else {
    				$info = read_TagName($reponse, 'info', 1);
    				if ($info == 'OK') {
    					$item_name = read_TagName($reponse, 'item_name', 1);
                        $notice = "Nhận thành công <strong>$item_name</strong> .<br />Vui lòng vào rương đồ chung để nhận đồ.";
    				}
    				else $notice = $reponse;
    			}
    		}
    	}
    }
    	//Đọc File Item
    	$slg_item = 0;
    	$fopen_host = fopen($file_item, "r");
    	while (!feof($fopen_host)) {
    		$item_get = fgets($fopen_host);
    		$item_get = preg_replace('(\n)', '', $item_get);
            $item_get = trim($item_get);
            if(substr($item_get,0,2) != '//') {
        		$item_info = explode('|', $item_get);
        		
        		if(strlen($item_info[1]) % 32 == 0)
        		{
        			$item_read[] = array (
        				'key'	=> $item_info[0],
        				'code'	=> $item_info[1],
        				'des'	=> $item_info[2]
        			);
        			++$slg_item;
        		}
            }
    	}
    	fclose($fopen_host);
        
    	$page_template = "templates/event/itemfull.tpl";
        
}
?>