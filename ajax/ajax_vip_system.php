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
	case 'upgrade_vip':	
			$pass2 = $_GET['pass2'];
			$type = $_GET['type'];
			$plan = $_GET['plan'];
			
			if(empty($type)) {
				$notice = "Chưa chọn gói VIP.";
			}
			elseif (preg_match("/[^0-9$]/", $type)){
				$notice = "Dữ liệu lỗi - Chỉ được sử dụng số (1-9).";
			}
			elseif(empty($plan)) {
				$notice = "Chưa chọn hạn sử dụng.";
			}
			elseif (preg_match("/[^0-9$]/", $plan)){
				$notice = "Dữ liệu lỗi - Chỉ được sử dụng số (1-9).";
			}
			elseif (empty($pass2))
			{
				$notice = "Chưa nhập mật khẩu cấp 2";
			}
			elseif (preg_match("/[^a-zA-Z0-9_$]/", $pass2)){
				$notice = "Dữ liệu lỗi - Mật khẩu cấp 2 chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.";
			}
			else {
					$getcontent_url = $server_url . "/sv_vip_system.php";
					$getcontent_data = array(
						'login'    =>  $_SESSION['mu_username'],
						'name'    =>  $_SESSION['mu_nvchon'],
						'action'    =>  'upgrade_vip',
						'pass2'    =>  $pass2,
						'type'    =>  $type,
						'plan'    =>  $plan,
						
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
						$reponse_explode = explode('|', $reponse);
						if($reponse_explode[1] == 'OK') {
							$_SESSION['acc_gcoin'] = $reponse_explode[3];
							$_SESSION['acc_vip'] = $reponse_explode[4];
							$_SESSION['acc_vip_day'] = $reponse_explode[5];
							$_SESSION['acc_vip_time'] = $reponse_explode[6];
						}						
						$notice = $reponse;
					}
			}
        echo $notice;
	break;
	
	case 'receivepl':	
			$getcontent_url = $server_url . "/sv_vip_system.php";
			$getcontent_data = array(
				'login'    =>  $_SESSION['mu_username'],
				'name'    =>  $_SESSION['mu_nvchon'],				
				'action'	=>	'receivepl',
				
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
				$pointut = read_TagName($reponse, 'pointut', 1);
				$_SESSION['nv_point_uythac'] += $pointut;
                $bank_data = read_TagName($reponse, 'bank_data', 1);
                if(strlen($bank_data) > 2) {
                    $bank_arr = json_decode($bank_data, true);
                    $_SESSION['acc_gcoin_km'] = $bank_arr['gcoin_km'];
                    $_SESSION['acc_vpoint_km'] = $bank_arr['vpoint_km'];
                    $_SESSION['acc_zen'] = $bank_arr['bank'];
                    $_SESSION['acc_ppoint_extra'] = $bank_arr['nbb_pl_extra'];
                    
                    $_SESSION['acc_chao'] = $bank_arr['jewel_chao'];
                    $_SESSION['acc_cre'] = $bank_arr['jewel_cre'];
                    $_SESSION['acc_blue'] = $bank_arr['jewel_blue'];
                }               
				
                $bank_view_arr = array(
                    'gcoin_km'  =>  number_format($_SESSION['acc_gcoin_km'], 0, ',', '.'),
                    'vpoint_km'  =>  number_format($_SESSION['acc_vpoint_km'], 0, ',', '.'),
                    'bank'  =>  number_format($_SESSION['acc_zen'], 0, ',', '.'),
                    'nbb_pl_extra'  =>  number_format($_SESSION['acc_ppoint_extra'], 0, ',', '.'),
                    'jewel_chao'  =>  number_format($_SESSION['acc_chao'], 0, ',', '.'),
                    'jewel_cre'  =>  number_format($_SESSION['acc_cre'], 0, ',', '.'),
                    'jewel_blue'  =>  number_format($_SESSION['acc_blue'], 0, ',', '.')
                );
                $bank_view_data = json_encode($bank_view_arr);

                $msg = read_TagName($reponse, 'msg', 1);
                echo "|OK|$msg|$bank_view_data|";
    		} else echo $reponse;
			}
	break;
	
	default:
        echo "Dữ liệu sai";
}

?>