<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");

if (isset($_POST['action']))
{
	if( $sendsv === false ) { $notice = "Tốc độ xử lý của bạn quá nhanh, vui lòng chờ vài giây rồi tiếp tục thực hiện."; } else {
		$accept = 1;
		
		$getcontent_url = $server_url . "/view_card.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'string_login'    =>  $_SESSION['checklogin'],
            'passtransfer'    =>  $passtransfer
        ); 
        
        $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

		if ( empty($reponse) ) $error = "<font size='3' color='red'>Server bảo trì.</font>";
		elseif($reponse == "login_other") {
				$notice = "Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.";
				session_destroy();
			}
			else {
		$list_cardphone = explode("<br>\n", $reponse);
		$stt = 0;
		for($i=0;$i<10;$i++)
			{
				$info_cardphone = explode("<nbb>", isset($list_cardphone[$i]) ? $list_cardphone[$i] : null);
				if ( !empty($info_cardphone[1]) ) {
					++$stt;
					$card_num = $info_cardphone[1];
					$card_serial = $info_cardphone[2];
					
					switch ($info_cardphone[4])
					{
						case 0: $card_status = "Thẻ vừa nạp/Đang chờ"; $card_num = "xxxxxxxx".$info_cardphone[1]; $card_serial = "xxxxxxxx".$info_cardphone[2]; break;
						case 1: $card_status = "<font color='orange'>Tạm ứng/Chờ kiểm tra</font>"; $card_num = "xxxxxxxx".$info_cardphone[1]; $card_serial = "xxxxxxxx".$info_cardphone[2]; break;
						case 2: $card_status = "<font color='blue'>Thẻ đúng/Hoàn tất</font>"; break;
						case 3: $card_status = "<font color='red'>Thẻ sai</font>"; break;
					}
		
					$cardphone[] = array (
						'stt'	=> $stt,	
						'card_type'	=> $info_cardphone[0],
						'card_num'	=> $card_num,
						'card_serial'	=> $card_serial,
						'card_time'	=> $info_cardphone[3],
						'card_status'	=> $card_status,
					);
				}
			}
			if($stt == 0) $notice = $reponse;
		}
	}
}
$page_template = "templates/napthe/listcard.tpl";
?>