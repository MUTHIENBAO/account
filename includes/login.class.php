<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
// Dang nhap
$ip_client = get_ip();

if (isset($_POST["login"]))
{
    
    if($_SESSION['login_wrong'] > 10 && (time() - $_SESSION['login_timewait'] < 15*60) ) {
        $wait_time = $_SESSION['login_timewait'] + 15*60 - time();
        $wait_minutes = floor($wait_time/60);
        $wait_seconds = $wait_time - $wait_minutes*60;
        $wait_show = "$wait_minutes phút $wait_seconds giây";
        
        $error = "<font size='4' color='red'>Bạn đã đăng nhập sai trên 10 lần, vui lòng đợi $wait_show để được đăng nhập lại.</font>";
    } else {
        $nweb_security_login_code1 = $_POST['nweb_security_login_code1'];
        $nweb_security_login_code2 = $_POST['nweb_security_login_code2'];
        $nweb_security_login_code3 = $_POST['nweb_security_login_code3'];
        
        $tach_time = substr($nweb_security_login_code3, $nweb_security_login_code2 - $nweb_security_login_code1, 10);
        $time_load_form_login_chenh = time() - $tach_time;
        
        if($time_load_form_login_chenh > 30*60) {
            $error = "<font size='4' color='red'>Thời gian đăng nhập quá lâu, vui lòng đăng nhập lại.</font>";
        } else {
            include_once("config/config.php");
            include_once("config/config_sms.php");
			include_once("config/config_sms_pri.php");
        
            $accountid = $_POST['username'];
            $passwordid = $_POST['password'];
        
            if($_SESSION['login_wrong'] > 5) {
                include_once("vimage.php");
            	$vImage = new vImage();
            	$vImage->loadCodes();
            }
            
        	if($_SESSION['login_wrong'] > 5 && !($vImage->checkCode())) {
        		$error = "Sai mã kiểm tra";
        	}
        	elseif (($accountid == NULL) || ($passwordid == NULL)) {$error = "<font size='4' color='red'>Hãy điền tên đăng nhập và mật khẩu.</font>";}
        	elseif (preg_match("/[^a-zA-Z0-9_$]/", $accountid))
        		{
        			$error = "<font size='4' color='red'>Dữ liệu lỗi - Tài khoản chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font>";
        		}
        	elseif (preg_match("/[^a-zA-Z0-9_$]/", $passwordid))
        		{
        			$error = "<font size='4' color='red'>Dữ liệu lỗi - Mật khẩu chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font>";
        		}
        	elseif ( $accountid == 'demo' && $passwordid == 'demo')
        		{
        			$_SESSION['mu_username'] = $accountid;
                    $_SESSION['mu_nvchon'] = 'Demo';
        			$_SESSION['mu_Ranking'] = 'Rankingok';
                    
            		jum('index.php');
        		}
        	else {
                $getcontent_url = $server_url . "/view.php";
                $getcontent_data = array(
                    'action'    =>  'login',
                    'login'    =>  $accountid,
                    'pass'    =>  md5($passwordid),
                    'ip'    =>  $ip_client,
                    'passtransfer'    =>  $passtransfer
                ); 
                
                $show_reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
                
        		if( empty($show_reponse) )
        		{
        			$error = "<font size='3' color='red'>Server đang bảo trì</font>";
        		}
        		else if($show_reponse == 'PASSRAN_KGCO') {
        			$error = "<font color='red'><b>Danh sách Mật khẩu ngẫu nhiên chưa khởi tạo hoặc đã sử dụng hết</b></font>.<br>Tài khoản của bạn đang ở chế độ <b>sử dụng mật khẩu ngẫu nhiên để tăng độ bảo mật</b>.<br>Vui lòng <b>dùng SĐT của tài khoản <font color='red'>$accountid</font></b> nhắn tin với cú pháp bên dưới để lấy danh sách mật khẩu ngẫu nhiên mới.<br><font color='red'><b>MUHN&nbsp;&nbsp;&nbsp;OTP&nbsp;&nbsp;&nbsp; $cuphap &nbsp;&nbsp;&nbsp; PR &nbsp;&nbsp;&nbsp; $accountid</b></font> &nbsp;&nbsp;&nbsp; gửi &nbsp;&nbsp;&nbsp; <font color='blue'> <b>$dauso</b> </font> <font color='gray'><i>(Phí nhắn tin : $sms_price VNĐ)</i></font>";
        		}
        		else if($show_reponse == 'PASSRAN_SAI') {
        			$error = "<font color='red'><b>Mật khẩu không đúng</b></font>.<br>Tài khoản của bạn đang ở chế độ <b>sử dụng mật khẩu ngẫu nhiên để tăng độ bảo mật</b>.<br>Nếu bạn quên danh sách mật khẩu ngẫu nhiên đã nhận, vui lòng <b>dùng SĐT của tài khoản <font color='red'>$accountid</font></b> nhắn tin với cú pháp bên dưới để lấy danh sách mật khẩu ngẫu nhiên mới.<br><font color='red'><b>MUHN&nbsp;&nbsp;&nbsp;OTP&nbsp;&nbsp;&nbsp; $cuphap &nbsp;&nbsp;&nbsp; PR &nbsp;&nbsp;&nbsp; $accountid</b></font> &nbsp;&nbsp;&nbsp; gửi &nbsp;&nbsp;&nbsp; <font color='blue'> <b>$dauso</b> </font> <font color='gray'><i>(Phí nhắn tin : $sms_price VNĐ)</i></font><br>
        Các Mật khẩu cũ chưa sử dụng thì sẽ bị xóa hết để bảo mật.";
        		}
        		else {
        			$info = read_TagName($show_reponse, 'info', 1);
                    if ($info == 'OK') {
                        $_SESSION['login_wrong'] = 0;
        				$_SESSION['mu_username'] = $accountid;
                        $acc_data = read_TagName($show_reponse, 'acc_data', 1);
                        $acc_arr = json_decode($acc_data, true);
                        
                        $_SESSION['checklogin'] = $acc_arr['stringlogin'];
                        
                        $accthehe = abs(intval($acc_arr['thehe']));
                        if ($accthehe == 0) $accthehe = 1;
                        $_SESSION['acc_thehe'] = $accthehe;
                        $_SESSION['thehe'] = $accthehe;
                        
                        $_SESSION['acc_card_total'] = $acc_arr['card_total'];
                        $_SESSION['acc_gcoin'] = $acc_arr['gcoin'];
                        $_SESSION['acc_gcoin_km'] = $acc_arr['gcoinkm'];
                        $_SESSION['acc_vpoint'] = $acc_arr['vpoint'];
                        $_SESSION['acc_vpoint_km'] = $acc_arr['vpoint_km'];
                        $_SESSION['WCoin'] = $acc_arr['WCoin'];
                        $_SESSION['WCoinP'] = $acc_arr['WCoinP'];
                        $_SESSION['GoblinCoin'] = $acc_arr['GoblinCoin'];
                        $_SESSION['acc_ppoint'] = $acc_arr['ppoint'];
                        $_SESSION['acc_ppoint_extra'] = $acc_arr['ppoint_extra'];
                        $_SESSION['acc_zen'] = $acc_arr['zen'];
                        $_SESSION['acc_heart'] = $acc_arr['heart'];
                        $_SESSION['acc_chao'] = $acc_arr['chao'];
                        $_SESSION['acc_cre'] = $acc_arr['create'];
                        $_SESSION['acc_blue'] = $acc_arr['blue'];
                        $_SESSION['acc_phone'] = $acc_arr['phone'];
                        $_SESSION['acc_email'] = $acc_arr['email'];
                        $_SESSION['acc_reg_day'] = $acc_arr['reg_day'];
                        $_SESSION['acc_passran'] = $acc_arr['passran'];
                        $_SESSION['IPBonusPoint'] = $acc_arr['IPBonusPoint'];
                        $_SESSION['acc_warehouse_secure_slot'] = $acc_arr['warehouse_secure_slot'];
                        $_SESSION['acc_warehouse_secure_item'] = $acc_arr['warehouse_secure_item'];
                        $_SESSION['fb_fanpage_like'] = $acc_arr['nbb_fb_fanpage_like'];
                        $_SESSION['ipbonus_info'] = $acc_arr['ipbonus_info'];
                        $_SESSION['ipbonus_active'] = $acc_arr['ipbonus_active'];
                        $_SESSION['nbb_vip'] = $acc_arr['nbb_vip'];
                        $_SESSION['nbb_vip_time'] = $acc_arr['nbb_vip_time'];
                        $_SESSION['nbb_vip_time_used'] = $acc_arr['nbb_vip_time_used'];
						$_SESSION['acc_vip'] = $acc_arr['acc_vip'];
                        $_SESSION['acc_vip_day'] = $acc_arr['acc_vip_day'];
                        $_SESSION['acc_vip_time'] = $acc_arr['acc_vip_time'];
                        
                        $nv_slg = 0;
                        for($i=1;$i<=5;$i++)
                        {
                            if(strlen($acc_arr['char'.$i])>=4)
                            {
                                $nv_slg++;
                                $_SESSION['char'.$nv_slg] = $acc_arr['char'.$i];
                            }
                        }
                        $_SESSION['nv_slg'] = $nv_slg;
                        if(strlen($ipbonus_info) > 10) $notice = $ipbonus_info . "<br />Do IP Quán NET hay bị thay đổi mỗi khi nhảy mạng, vì vậy các bạn thường xuyên đăng nhập lại để kiểm tra. Nếu thấy thông báo không chơi ở Quán NET đăng ký IP Bonus, vui lòng liên hệ chủ quán để cập nhập IP mới.";
                        else $notice = '<strong>Bạn hiện không chơi ở Quán NET đăng ký IP Bonus.<br />Hãy chơi ở quán NET đăng ký IP Bonus để nhận được nhiều ưu đãi trong quá trình chơi.<br /><a href="#acc_manager&act=ipbonus_list" rel="menuajax">Danh sách quán NET đăng ký IP Bonus xem tại đây</a></strong>';
                        
                        jum('./#acc_manager');
        			}
        			else { 
                        $_SESSION['login_wrong']++;
                        if($_SESSION['login_wrong'] > 10) {
                            $_SESSION['login_timewait'] = time();
                        }
        				$error = "<font size='4' color='red'>$show_reponse</font>"; 
        			}
        		}
            }
        }
    }
}

// Logout
if (isset($_POST['logout'])) {
  session_destroy();
  setcookie("last_sendsv", "", time()-3600);
  jum('index.php');
}

?>