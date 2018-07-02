<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include('config/config_giftcode_week.php');
include('config/config_sms.php');
include_once("config/config_sms_pri.php");

if (isset($_POST['action']))
{
	$action = $_POST['action'];

	if ($action == 'giftcode_week')
	{
		$pass2 = $_POST['pass2'];
		
		if( $sendsv === false ) { $notice = "Tốc độ xử lý của bạn quá nhanh, vui lòng chờ vài giây rồi tiếp tục thực hiện."; }
		elseif (empty($pass2))
		{
			$notice = "Chưa nhập mật khẩu cấp 2";
		}
		elseif (!preg_match("/^[a-zA-Z0-9_]*$/i", $pass2))
			{
				$error = "<font size='4' color='red'>Dữ liệu lỗi - Mật khẩu cấp 2 chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font>";
			}
		else {
			
			$getcontent_url = $server_url . "/sms_web.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'KeyXuLy'    =>  'GIFTCODE_WEEK',
                'pass2'    =>  $pass2,
                'string_login'    =>  $_SESSION['checklogin'],
                'passtransfer'    =>  $passtransfer
            ); 
            
            $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

			if ( empty($reponse) ) $notice = "<font size='3' color='red'>Server bảo trì.</font>";
			elseif($reponse == "login_other") {
				$notice = "<font size='3' color='red'>Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.</font>";
				session_destroy();
			}
			else {
				$info = explode('<nbb>',$reponse);
				if($info[1] == 'OK') {
					$notice = "<font color='black'>Vui lòng dùng SĐT của tài khoản nhắn tin với cú pháp bên dưới để hoàn tất</font><br>
						<font color='red'><b>$cuphap_pri &nbsp;&nbsp;&nbsp;$cuphap&nbsp;&nbsp;&nbsp;$info[2]</b></font>&nbsp;&nbsp;&nbsp;gửi&nbsp;&nbsp;&nbsp;<font color='blue'><b>$dauso</b></font> <font color='gray'><i>(Phí nhắn tin : $sms_price VNĐ)</i></font><br>
						<font color='black'>Thời gian chờ tin nhắn chứng thực : 5 phút (sau 5 phút, yêu cầu sẽ bị hủy bỏ)</font>";
				}
				else $notice = $reponse;
			}
		}
	}
}

switch ($giftcode_week_use){ 
	case 1:
        $file_giftcode = 'config/giftcode_random_type1.txt';
	break;

	case 2:
        $file_giftcode = 'config/giftcode_random_type2.txt';
	break;

	case 3:
        $file_giftcode = 'config/giftcode_random_type3.txt';
	break;

	default :  $file_giftcode = 'config/giftcode_random_type1.txt';
}

    //Đọc File GiftCode
	$slg_item = 0;
	if(is_file($file_giftcode)) {
		$fopen_host = fopen($file_giftcode, "r");
		$total_rate = 0;
		while (!feof($fopen_host)) {
			$get_item = fgets($fopen_host,1000);
			$get_item = preg_replace('(\n)', '', $get_item);
			if($get_item) {
				$item_info = explode('|', $get_item);
				if(strlen($item_info[1]) > 0 && strlen($item_info[1])%32 == 0) {
				    $check_stat = substr($get_item,0,2);
    				if($check_stat == '//') $stat = 0;
    				else $stat = 1;
    				if($stat == 1) {
    				    $slg_item++;
        				$total_rate += $item_info[3];
        				$item_read[] = array (
        					'des'	=> $item_info[2],
        					'rate'	=> $item_info[3],
        					'stat'	=> $stat
        				);
    				}
				}
			}
		}
	} else $fopen_host = fopen($filename, "w");
	fclose($fopen_host);
    
    for($i=0; $i<count($item_read); $i++) {
        $item_read[$i]['rate'] = floor($item_read[$i]['rate']*100/$total_rate);
    }

$accept = 1;

$hour_now = date('H', time());
if($hour_now != 19) {
    $accept = 0;
}

$page_template = "templates/giftcode/giftcode_week.tpl";
?>