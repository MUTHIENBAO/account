<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include_once("vimage.php");
$vImage = new vImage();

include('config/config_napthe.php');
include('config/config_ipbonus.php');

if (isset($_POST['action']))
{
	$action = $_POST['action'];
	if ($action == 'vpoint_gate')
	{
		$vImage->loadCodes();
	
        if($vImage->checkCode()) {
            $cardtype = $_POST['card'];
			$card_num = $_POST['card_num'];
			$card_serial = $_POST['card_serial'];
			
			if( $sendsv === false ) { $notice = "Tốc độ xử lý của bạn quá nhanh, vui lòng chờ vài giây rồi tiếp tục thực hiện."; }
			elseif (empty($card_num)) {
				$notice = "Chưa điền Mã thẻ";
			}
			elseif (preg_match("/[^a-zA-Z0-9$]/", $card_num))
			{
		    	$notice = "<font size='2' color='red'>Dữ liệu lỗi : $card_num . Chỉ được sử dụng chu a-z, A-Z và số (1-9).</font>"; 
			}
			elseif (empty($card_serial)) {
				$notice = "Chưa điền Serial thẻ";
			}
			elseif (preg_match("/[^a-zA-Z0-9$]/", $card_serial))
			{
		    	$notice = "<font size='2' color='red'>Dữ liệu lỗi : $card_serial . Serial Chỉ được sử dụng chu a-z, A-Z và số (1-9).</font>"; 
			}
			else {
			
    			$getcontent_url = $server_url . "/vpoint_cardphone.php";
                $getcontent_data = array(
                    'login'    =>  $_SESSION['mu_username'],
                    'cardtype'    =>  $cardtype,
                    'menhgia'    =>  $menhgia,
                    'card_num'    =>  $card_num,
                    'card_serial'    =>  $card_serial,
                    'string_login'    =>  $_SESSION['checklogin'],
                    'passtransfer'    =>  $passtransfer
                ); 
                
                $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

				if ( empty($reponse) ) $notice = "<font size='3' color='red'>Server bảo trì.</font>";
				elseif($reponse == "login_other") {
					$notice = "<font size='3' color='red'>Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.</font>";
					session_destroy();
				} else {
				    $notice = read_TagName($reponse, 'msg', 1);
                    $gcoin = read_TagName($reponse, 'gcoin', 1);
                    $gcoinkm = read_TagName($reponse, 'gcoinkm', 1);
                    $acc_card_total = read_TagName($reponse, 'card_total', 1);
                    if(strlen($notice) == 0) $notice = $reponse;
                    elseif($gcoin > 0 || $gcoinkm > 0) {
                        $_SESSION['acc_gcoin'] = $gcoin;
                        $_SESSION['acc_gcoin_km'] = $gcoinkm;
                        $_SESSION['acc_card_total'] = $acc_card_total;
                    }
				}
			}
        } else $error = "<center><font color='red'>Dữ liệu lỗi - Mã kiểm tra không chính xác.</font></center>";
	}
}


// Kiem tra bao tri he thong the nap
$vina_baotri = 0;
$mobi_baotri = 0;
$viettel_baotri = 0;

$file_knp_status = "data/knp_status.txt";
if(is_file($file_knp_status)) {
    $file_time_modify = filemtime($file_knp_status);
    if($file_time_modify > time() || $file_time_modify < time() - 300) {
        $url_card_knp_status = "http://api.knp.vn/hethong/";
        $card_knp_status_reponse = @file_get_contents($url_card_knp_status);
        if(strpos($card_knp_status_reponse, 'RESULT:')) {
            $card_status_split = explode('@', $card_knp_status_reponse);
            if($card_status_split[0] == 'RESULT:01') {
                $vina_baotri = 1;
                $mobi_baotri = 1;
                $viettel_baotri = 1;
            } elseif($card_status_split[0] == 'RESULT:00') {
                $card_status_type = explode(';', $card_status_split[1]);
                if($card_status_type[0] == 1) $vina_baotri = 1;
                if($card_status_type[1] == 1) $mobi_baotri = 1;
                if($card_status_type[2] == 1) $viettel_baotri = 1;
            }
        }
        
        $card_status_arr = array(
            'vina'  =>  $vina_baotri,
            'mobi'  =>  $mobi_baotri,
            'viettel'   =>  $viettel_baotri
        );
        $card_status = json_encode($card_status_arr);
        
        //Ghi vào file
		$fp = fopen($file_knp_status, "w");  
		fputs ($fp, $card_status);
		fclose($fp);
	//End Ghi vào File
    } else {
        $fp_host = fopen($file_knp_status, "r");
    	$card_status = fgets($fp_host);
    	fclose($fp_host);
        
        $card_status_arr = json_decode($card_status, true);
        
        $vina_baotri = $card_status_arr['vina'];
        $mobi_baotri = $card_status_arr['mobi'];
        $viettel_baotri = $card_status_arr['viettel'];
    }
}

if(isset($khuyenmai_begin) && isset($khuyenmai_end) && strtotime($khuyenmai_begin) <= time() && (strtotime($khuyenmai_end) + 24*60*60 - 1) >= time() && $khuyenmai_phantram > 0) {
    $khuyenmai = 1;
    $khuyenmai_week = 0;
    $khuyenmai_begin_date = date('d/m', strtotime($khuyenmai_begin));
    $khuyenmai_end_date = date('d/m', strtotime($khuyenmai_end));
} else {
    $day_of_week = date('w', time());
    $khuyenmai_phantram = $khuyenmai_week_phantram[$day_of_week];
    if($khuyenmai_phantram > 0) {
        $khuyenmai = 1;
        $khuyenmai_week = 1;
    }
}

$page_template = "templates/napthe/gate.tpl";
?>