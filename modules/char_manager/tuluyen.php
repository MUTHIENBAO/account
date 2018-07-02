<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");

include('config/config_tuluyen.php');
include('config/config_vip_system.php');

$getcontent_url = $server_url . "/sv_char.php";
$getcontent_data = array(
    'login'    =>  $_SESSION['mu_username'],
    'name'    =>  $_SESSION['mu_nvchon'],
    
    'pagesv'	=>	'sv_char_tuluyen',
    'action'    =>  'view',
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
	if ($info[1] == 'OK') {
		$tuluyen_info = $info[2];
		$tuluyen_arr = json_decode($tuluyen_info, true);
	}
	else $notice = $reponse;
}

$thangcap_any_stat = 0;

for($pointtype = 1; $pointtype <=4; $pointtype++) {
    switch ($pointtype){ 
	case 1:
        $type_cap = $tuluyen_arr['str_cap'];
        $type_exp = $tuluyen_arr['str_exp'];
        $type_point = $tuluyen_arr['str_point'];
        $type_cp = $tuluyen_arr['str_cp'];
        $type = 'str';
        $tl_name = "Sức Mạnh";
	break;

	case 2:
        $type_cap = $tuluyen_arr['agi_cap'];
        $type_exp = $tuluyen_arr['agi_exp'];
        $type_point = $tuluyen_arr['agi_point'];
        $type_cp = $tuluyen_arr['agi_cp'];
        $type = 'agi';
        $tl_name = "Nhanh nhẹn";
	break;

	case 3:
        $type_cap = $tuluyen_arr['vit_cap'];
        $type_exp = $tuluyen_arr['vit_exp'];
        $type_point = $tuluyen_arr['vit_point'];
        $type_cp = $tuluyen_arr['vit_cp'];
        $type = 'vit';
        $tl_name = "Thể Lực";
	break;

	case 4:
        $type_cap = $tuluyen_arr['ene_cap'];
        $type_exp = $tuluyen_arr['ene_exp'];
        $type_point = $tuluyen_arr['ene_point'];
        $type_cp = $tuluyen_arr['ene_cp'];
        $type = 'ene';
        $tl_name = "Năng Lượng";
	break;
}
    
    $exp_tuluyen_sum[$pointtype] = 0;
    $sumpoint[$pointtype] = 0;
    for($i=1; $i<=$type_cap+1; $i++) {
		//VIP2
		if($Use_VIP == 2 && $_SESSION['acc_vip'] > 0 && $_SESSION['acc_vip_day'] >= $enable_vip['tuluyen']) {
			if($_SESSION['acc_vip'] == 1) {
				$extra_exp_tuluyen[$pointtype] = $gold_vip['exp_tuluyen'];
				$exp_tuluyen_sum[$pointtype] = $exp_tuluyen_sum[$pointtype] - $gold_vip['exp_tuluyen'];
			}
			elseif($_SESSION['acc_vip'] == 2) {
				$extra_exp_tuluyen[$pointtype] = $silver_vip['exp_tuluyen'] ;
				$exp_tuluyen_sum[$pointtype] = $exp_tuluyen_sum[$pointtype] - $silver_vip['exp_tuluyen'];		
			}   
		}
		//End VIP2
        $exp_tuluyen[$pointtype] = floor($tuluyen_expcoban * (1 + $tuluyen_expextra * ($i-1) ));
        $exp_tuluyen_sum[$pointtype] = $exp_tuluyen_sum[$pointtype] + $exp_tuluyen[$pointtype];
        $pointcap[$pointtype] = floor($tuluyen_pointcoban * (1 + $tuluyen_pointextra * ($i-1) ));
        $sumpoint[$pointtype] = $sumpoint[$pointtype] + $pointcap[$pointtype];
    }
    
    if($type_cap >= $tl_max) {
        $exp_now[$pointtype] = '0';
        $exp_tuluyen_sum[$pointtype] = '--';
        $percent_bar[$pointtype] = 0;
        $sumpoint[$pointtype] = '--';
    } else {
        if($type_exp >= $exp_tuluyen_sum[$pointtype]) {
            $thangcap_any_stat++;
            $thangcap[$pointtype] = 1;
            $exp_now[$pointtype] = "$type_exp";
            $percent_bar[$pointtype] = ($exp_now[$pointtype]*100)/$exp_tuluyen_sum[$pointtype];
            if($percent_bar[$pointtype] > 100) $percent_bar[$pointtype] = 100;
            $form_input[$pointtype] = '<input data-showpopup="'. $type .'" type="button" value="Thăng Cấp" class="tl_thangcap btn btn-green btn-block btn-lg" id="btn_tc_'. $type .'" tltype="'. $type .'" /><br /><strong><font color="red">Chúc Phúc : <span id="tlcp_'. $type .'">'. $type_cp .'</span> %</font></strong>';
        }
        else {
            $thangcap[$pointtype] = 0;
            $exp_now[$pointtype] = "$type_exp";
            $percent_bar[$pointtype] = ($exp_now[$pointtype]*100)/$exp_tuluyen_sum[$pointtype];
            if($percent_bar[$pointtype] > 100) $percent_bar[$pointtype] = 100;
            $form_input[$pointtype] = '<input data-showpopup="'. $type .'" type="button" value="'. $tl_name .'" class="tuluyen btn btn-green btn-block btn-lg" id="btn_tl_'. $type .'" tltype="'. $type .'" />';
        }
    }
}
    
	
$page_template = "templates/char_manager/tuluyen.tpl";
?>