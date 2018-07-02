<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include('config/config_relife.php');
	
if (isset($_POST['action']))
{
	$action = $_POST['action'];
	if ($action == 'relife')
	{
		$character = $_POST['character'];
		
		
		if( $sendsv === false ) { $notice = "Tốc độ xử lý của bạn quá nhanh, vui lòng chờ vài giây rồi tiếp tục thực hiện."; }
		elseif (empty($character))
		{
			$notice = "Chưa chọn nhân vật cần ReLife";
		}
		elseif (preg_match("/[^a-zA-Z0-9_$]/", $character))
			{
				$error = "<font size='4' color='red'>Dữ liệu lỗi - Nhân vật chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font>";
			}
		else {
			
			$getcontent_url = $server_url . "/sv_char.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $character,
                
                'pagesv'	=>	'sv_char_relife',
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
				$info = explode('<netbanbe>',$reponse);
				$char = explode('<nbb>',$info[0]);
				if ($char[0] == 'OK') {
					$notice = $info[1];
					if ( ($_SESSION['nv_class'] == 80) || ($_SESSION['nv_class'] == 81) || ($_SESSION['nv_class'] == 82) ) {
						$notice .= "<br><b>Nhân vật của bạn là Summoner. Để học được ngay Skill Buff Dmg, ngay sau khi ReLife hãy cộng ngay vào Năng Lượng 1000 điểm từ chức năng trên Web trước khi vào Game. Nếu điểm Reset của bạn < 1500 điểm sẽ được hỗ trợ ngay 1000 điểm vào Energy để có Skill Buff Dmg.</b>";
					}
					$_SESSION['nv_reset'] = 0;
					$_SESSION['nv_relife'] = $_SESSION['nv_relife']+1;
					$_SESSION['nv_level'] = 6;
					$_SESSION['nv_point'] = $char[1];
					$_SESSION['nv_pointdutru'] = $char[2];
                    
                    $relife_new = $_SESSION['nv_relife'];
                    $_SESSION['nv_zen'] = $char[7];
                    $_SESSION['acc_chao'] = $char[3];
                    $_SESSION['acc_cre'] = $char[4];
                    $_SESSION['acc_blue'] = $char[5];
                    $_SESSION['acc_zen'] = $char[6];
				}
				else $notice = $reponse;
			}
		}
	}
}

$relife_next = $_SESSION['nv_relife'] + 1;
$rl_reset_relifes = $rl_reset_relife[$relife_next];
$rl_zen_relifes = $rl_zen_relife[$relife_next];
$rl_chao_relifes = $rl_chao_relife[$relife_next];
$rl_cre_relifes = $rl_cre_relife[$relife_next];
$rl_blue_relifes = $rl_blue_relife[$relife_next];

$chenhlech_level = 400 - $_SESSION['nv_level'];
$chenhlech_reset = $rl_reset_relifes - $_SESSION['nv_reset'];

$chenhlech_zen = $rl_zen_relifes - ($_SESSION['nv_zen'] + $_SESSION['acc_zen']);
$chenhlech_chao = $rl_chao_relifes - $_SESSION['acc_chao'];
$chenhlech_cre = $rl_cre_relifes - $_SESSION['acc_cre'];
$chenhlech_blue = $rl_blue_relifes - $_SESSION['acc_blue'];

$font_thieu_begin = "<font color='red'><b>";
$font_thieu_end = "</b></font>";
$font_du_begin = "<font color='green'><b>";
$font_du_end = "</b></font>";

if ($chenhlech_level > 0) { $notice_level = "$font_thieu_begin Thiếu ". ABS($chenhlech_level) ." Level $font_thieu_end"; } else { $notice_level = "$font_du_begin Đủ Level $font_du_end"; }
if ($chenhlech_reset > 0) { $notice_reset = "$font_thieu_begin Thiếu ". ABS($chenhlech_reset) ." Reset $font_thieu_end"; } else { $notice_reset = "$font_du_begin Đủ  $rl_reset_relifes Reset $font_du_end"; }
if ($chenhlech_zen > 0) { $notice_zen = "$font_thieu_begin Thiếu ". number_format(ABS($chenhlech_zen), 0, ',', '.') ." ZEN $font_thieu_end"; } else { $notice_zen = "$font_du_begin Đủ  ". number_format($rl_zen_relifes, 0, ',', '.') ." ZEN $font_du_end"; }
if ($chenhlech_chao > 0) { $notice_chao = "$font_thieu_begin Thiếu ". ABS($chenhlech_chao) ." Ngọc Hỗn Nguyên $font_thieu_end"; } else { $notice_chao = "$font_du_begin Đủ  $rl_chao_relifes Ngọc Hỗn Nguyên $font_du_end"; }
if ($chenhlech_cre > 0) { $notice_cre = "$font_thieu_begin Thiếu ". ABS($chenhlech_cre) ." Ngọc Sáng Tạo $font_thieu_end"; } else { $notice_cre = "$font_du_begin Đủ  $rl_cre_relifes Ngọc Sáng Tạo $font_du_end"; }
if ($chenhlech_blue > 0) { $notice_blue = "$font_thieu_begin Thiếu ". ABS($chenhlech_blue) ." Lông Chim $font_thieu_end"; } else { $notice_blue = "$font_du_begin Đủ  $rl_blue_relifes Lông Chim $font_du_end"; }

$accept = 1;
if ( ($chenhlech_level > 0) || ($chenhlech_reset > 0) || ($chenhlech_zen > 0) || ($chenhlech_chao > 0) || ($chenhlech_cre > 0) || ($chenhlech_blue > 0) ) { $accept = 0; }

$page_template = "templates/char_manager/relife.tpl";
?>