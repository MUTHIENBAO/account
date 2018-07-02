<?php

$action = $_GET['action'];

switch ($action){
	case 'spin_number':
		$getcontent_url = $server_url . "/event_luckyspin.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'name'    =>  $_SESSION['mu_nvchon'],
            'action'    =>  'spin_number',
            'string_login'    =>  $_SESSION['checklogin'],
            'passtransfer'    =>  $passtransfer
        );
        $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

        if (empty($reponse)) echo "Server bảo trì.";
        elseif($reponse == "login_other") {
        	echo "Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.";
        	session_destroy();
        }
        else {
			$report = read_TagName($reponse, 'info', 1);
			$result = explode('|', $report);
        	if ($result[0]=='OK') echo $result[1];
        	else echo $result[0];
        }
    break;
    case 'spin_receive':
        $getcontent_url = $server_url . "/event_luckyspin.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'name'    =>  $_SESSION['mu_nvchon'],
            'action'    =>  'spin_receive',
            'string_login'    =>  $_SESSION['checklogin'],
            'passtransfer'    =>  $passtransfer
        );
        $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

        if (empty($reponse)) echo "Server bảo trì.";
        elseif($reponse == "login_other") {
        	echo "Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.";
        	session_destroy();
        }
        else {
			$report = read_TagName($reponse, 'info', 1);
        	if (strpos($report,'OK')!==FALSE) echo $report;
        	else {
				$result = explode('|', $report);
				echo $result[0];
			}
        }
    break;				case 'spin_history':		$getcontent_url = $server_url . "/event_luckyspin.php";        $getcontent_data = array(            'login'    =>  $_SESSION['mu_username'],            'name'    =>  $_SESSION['mu_nvchon'],            'action'    =>  'spin_history',                 'string_login'    =>  $_SESSION['checklogin'],            'passtransfer'    =>  $passtransfer        );        $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);    	if ( empty($reponse) ) $error_module = "Server bảo trì.";    	elseif($reponse == "login_other") {    		$error_module = "Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.";    		session_destroy();    	}    	else {    		if ( read_TagName($reponse, 'info', 1) == 'OK' ) {                      $spin_history = read_TagName($reponse, 'spin_history', 1);	                $spin_history_arr = json_decode($spin_history, true);                $spin_his_content = "";                if(is_array($spin_history_arr) && count($spin_history_arr) > 0) {                        $spin_his_content .= '<table width="100%" border="0" bgcolor="#9999FF" class="table table-blue-white table-border-2 table-text-center">';                        $spin_his_content .= '<tr bgcolor="#FFFFFF">';                        $spin_his_content .= '<th scope="col" align="center">#</th>';                        $spin_his_content .= '<th scope="col" align="center">Nhân vật</th>';                        $spin_his_content .= '<th scope="col" align="center">Phần thưởng</th>';                        $spin_his_content .= '<th scope="col" align="center">Quay lúc</th>';                        $spin_his_content .= '</tr>';                    foreach($spin_history_arr as $k => $v) {                        $stt = $k + 1;          						                        $spin_his_content .= '<tr bgcolor="#FFFFFF">';                        $spin_his_content .= '<td align="center">'. $stt .'</td>';                        $spin_his_content .= '<td align="center">'. $v['name'] .'</td>';                        $spin_his_content .= '<td align="center">'. $v['des'] .'</td>';                        $spin_his_content .= '<td align="center">'. date('d/m/Y H:i', $v['time']) .'</td>';                        $spin_his_content .= '</tr>';                    }                        $spin_his_content .= '</table>';                }                echo $spin_his_content;    		} else echo $reponse;    	}               break;	break;
}

?>