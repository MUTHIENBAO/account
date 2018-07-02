<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 

include('config/config_relax_de.php');

$action = $_GET['action'];

switch ($action){
    case 'change_money':
        $money_type = $_GET['imoney_type'];     $money_type = abs(intval($money_type));
        
        if($money_type == 2) {
            $max_diemde = floor($_SESSION['acc_vpoint']/1000);
        } else {
            $max_diemde = floor($_SESSION['acc_gcoin']/1000);
        }
        
        $output = "<option value='0'>0</option>";
        for($i=1; $i<=$max_diemde; $i++) {
            $output .= "<option value='". $i ."'>$i</option>";
        }
        
        echo $output;
    break;
    
    case 'danhde':
        $de_so = $_GET['de_so'];            $de_so = abs(intval($de_so));
        $de_diem = $_GET['de_diem'];        $de_diem = abs(intval($de_diem));
        $money_type = $_GET['money_type'];      $money_type = abs(intval($money_type));
        
        $hour_now = date('H', time());
        if($hour_now >= 17) {
            echo "Đã quá giờ ghi Lô. Không thể đánh.";
        } else {
            if($de_diem == 0) {
                echo "Chưa chọn số tiền muốn đánh";
            } else {
                $getcontent_url = $server_url . "/sv_relax.php";
                $getcontent_data = array(
                    'login'    =>  $_SESSION['mu_username'],
                    'action'    =>  'danhde',
                    'de_so'    =>  $de_so,
                    'de_diem'    =>  $de_diem,
                    'money_type'    =>  $money_type,
                    
                    'pagesv'    =>  'sv_relax_de',
                    'string_login'    =>  $_SESSION['checklogin'],
                    'passtransfer'    =>  $passtransfer
                );
                
                $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
            
            	if ( empty($reponse) ) $error_module = "Server bảo trì.";
            	elseif($reponse == "login_other") {
            		$error_module = "Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.";
            		session_destroy();
            	}
            	else {
            		if ( read_TagName($reponse, 'info', 1) == 'OK' ) {
                        $money_new = read_TagName($reponse, 'money_new', 1);
                        if($money_type == 2) {
                            $_SESSION['acc_vpoint'] = $money_new;
                        } else {
                            $_SESSION['acc_gcoin'] = $money_new;
                        }
                        
                        
                        echo "|OK|". number_format($money_new, 0, ',', '.') ."|";
            		} else echo $reponse;
            	}
            }
        }
        
        break;
        
    case 'de_history':
        $getcontent_url = $server_url . "/sv_relax.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'action'    =>  'de_history',
            
            'pagesv'    =>  'sv_relax_de',
            'string_login'    =>  $_SESSION['checklogin'],
            'passtransfer'    =>  $passtransfer
        );
        
        $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
    
    	if ( empty($reponse) ) $error_module = "Server bảo trì.";
    	elseif($reponse == "login_other") {
    		$error_module = "Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.";
    		session_destroy();
    	}
    	else {
    		if ( read_TagName($reponse, 'info', 1) == 'OK' ) {
                
                $de_history = read_TagName($reponse, 'de_history', 1);
                $de_history_arr = json_decode($de_history, true);
                $de_his_content = "";
                if(is_array($de_history_arr) && count($de_history_arr) > 0) {
                        $de_his_content .= '<table width="100%" border="0" bgcolor="#9999FF" class="table table-blue-white table-border-2 table-text-center">';
                        $de_his_content .= '<tr bgcolor="#FFFFFF">';
                        $de_his_content .= '<th scope="col" align="center">#</th>';
                        $de_his_content .= '<th scope="col" align="center">Đánh Con</th>';
                        $de_his_content .= '<th scope="col" align="center">Tiền Đánh</th>';
                        $de_his_content .= '<th scope="col" align="center">Ngày đánh</th>';
                        $de_his_content .= '<th scope="col" align="center">Thông tin</th>';
                        $de_his_content .= '</tr>';
                    foreach($de_history_arr as $k => $v) {
                        $stt = $k + 1;
                        
                        if($v['money_type'] == 2) {
                            $money_name = "Vcent";
                        } else {
                            $money_name = "Gcent";
                        }
                        
                        $info = '';
                        if($v['status'] == 0) {
                            $info = "Chưa xổ";
                        } else if($v['status'] == 1) {
                            $info = "Đã trúng được ". $v['gcoin_win'] ." $money_name";
                        } else if($v['status'] == 2) {
                            $info = "Không trúng Đề";
                        }
                        
                        
                        
                        $de_his_content .= '<tr bgcolor="#FFFFFF">';
                        $de_his_content .= '<td align="center">'. $stt .'</td>';
                        $de_his_content .= '<td align="center">'. $v['danhso'] .'</td>';
                        $de_his_content .= '<td align="center">'. number_format($v['gcoin_danh'], 0, ',', '.') .' '. $money_name .'</td>';
                        $de_his_content .= '<td align="center">'. date('d/m/Y H:i', $v['time_danh']) .'</td>';
                        $de_his_content .= '<td align="center">'. $info .'</td>';
                        $de_his_content .= '</tr>';
                    }
                        $de_his_content .= '</table>';
                }
                
                echo $de_his_content;
    		} else echo $reponse;
    	}
        
        break;
    
    default:
        $lo_diem = $_GET['ilo_diem'];         $lo_diem = abs(intval($lo_diem));
        
        $lo_gcoin = $lo_diem * $lo_diem_gcoin;
        echo number_format($lo_gcoin, 0, ',', '.');
}

        

?>