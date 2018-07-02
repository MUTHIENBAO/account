<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
include('config/config_daugia.php');

$action = $_GET['action'];

switch ($action){ 
	case 'itembid_send':
        $vitri = $_GET['vitri'];    $vitri = abs(intval($vitri));
        $item_code = $_GET['item_code'];
        $price_min = $_GET['price_min'];    $price_min = abs(intval($price_min));
        $price_max = $_GET['price_max'];    $price_max = abs(intval($price_max));
        $bidday = $_GET['bidday'];          $bidday = abs(intval($bidday));
        $itempass = $_GET['itempass'];
        $passopd = $_GET['passopd'];
        
        if($vitri < 0 || $vitri > 120) {
            echo '<font color="red"><b>Vị trí Item sai</b></font>';
        } else if(strlen($item_code) != 32) {
            echo '<font color="red"><b>Item Code sai</b></font>';
        } else if($price_min <= 0) {
            echo '<font color="red"><b>Giá khởi điểm phải lớn hơn 0 Vcent</b></font>';
        } else if($price_min % 100 != 0) {
            echo '<font color="red"><b>Giá khởi điểm phải chia hết cho 100</b></font>';
        } else if($price_max <= $price_min) {
            echo '<font color="red"><b>Giá mua đứt phải lớn hơn giá khởi điểm</b></font>';
        } else if($price_max % 100 != 0) {
            echo '<font color="red"><b>Giá mua đứt phải chia hết cho 100</b></font>';
        } else if(!preg_match("/^[0-9A-F]*$/i", $item_code)) {
            echo '<font color="red"><b>Item Code không hợp lệ</b></font>';
        } else if($bidday <= 0 || $bidday > 3) {
            echo '<font color="red"><b>Thời gian Item trên sàn không cho phép</b></font>';
        } else if($bidday*$Bid_Vpoint_Daily > ($_SESSION['acc_vpoint']) ) {
            echo "<font color='red'><b>Tài khoản không đủ Vcent để tham gia đấu giá. Cần có ít nhất ". number_format($bidday*$Bid_Vpoint_Daily, 0, ',', '.') ." Vcent để đưa Item lên sàn đấu giá trong vòng ". $bidday ." ngày</b></font>";
        } else if(!preg_match("/^[a-zA-Z0-9_]*$/i", $itempass)) {
            echo "<font color='red'><b>Mật khẩu bảo vệ chỉ được bao gồm a-z, A-Z, 0-9</b></font>";
        } else if(!preg_match("/^[a-zA-Z0-9_]*$/i", $passopd)) {
            echo "<font color='red'><b>Mật khẩu OPD chỉ được bao gồm a-z, A-Z, 0-9</b></font>";
        } else {
            $getcontent_url = $server_url . "/sv_com.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $_SESSION['mu_nvchon'],
                'action'    =>  'itembid_send',
                'vitri'    =>  $vitri,
                'item_code'   =>  $item_code,
                'price_min'   =>  $price_min,
                'price_max'   =>  $price_max,
                'bidday'   =>  $bidday,
                'itempass'   =>  $itempass,
                'passopd'   =>  $passopd,
                
                'pagesv'	=>	'sv_com_daugia',
                'string_login'    =>  $_SESSION['checklogin'],
                'passtransfer'    =>  $passtransfer
            );
            
            $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
            
            if ( empty($reponse) ) echo "Server bảo trì.";
            elseif($reponse == "login_other") {
            	echo "Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.";
            	session_destroy();
            }
            else {
            	if ( read_TagName($reponse, 'info', 1) == 'OK' ) {
                    _getdaugia_list('data/daugia_bidding.txt', 0);
                    echo "OK";
            	} else echo "<font color='red'><b>$reponse</b></font>";
            }
        }
	break;

	case 'bid':
        $bidid = $_GET['bidid'];
        $bid = $_GET['bid'];
        $itempass = $_GET['itempass'];
        $bid_vpoint = $_GET['bid_vpoint'];
        $price_max = $_GET['price_max'];
        
        if($bid <= $bid_vpoint) {
            echo "Giá Đấu $bid Vpoint phải lớn hơn Giá đấu hiện tại $bid_vpoint Vcent";
        } else if($bid % 100 != 0) {
            echo "Giá đấu $bid Vcent phải chia hết cho 100";
        } else if($bid > $price_max) {
            echo "Giá đấu $bid Vcent chỉ được bằng $price_max Vcent để mua đứt Item.";
        } else if($bid + $Bid_Vpoint_Member > $_SESSION['acc_vpoint'] ) {
            echo "Tài khoản không đủ Vcent để tham gia đấu giá. Cần có ít nhất $bid Vcent để đặt và $Bid_Vpoint_Member Vcent chi phí đấu giá";
        } else {
            $getcontent_url = $server_url . "/sv_com.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $_SESSION['mu_nvchon'],
                'action'    =>  'bid',
                'bidid'    =>  $bidid,
                'bid'   =>  $bid,
                'itempass'   =>  $itempass,
                
                'pagesv'	=>	'sv_com_daugia',
                'string_login'    =>  $_SESSION['checklogin'],
                'passtransfer'    =>  $passtransfer
            );
            
            $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
            
            if ( empty($reponse) ) echo "Server bảo trì.";
            elseif($reponse == "login_other") {
            	echo "Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.";
            	session_destroy();
            }
            else {
                $info = read_TagName($reponse, 'info', 1);
            	if ( $info == 'OK' || $info == 'OK2' ) {
                    _getdaugia_list('data/daugia_bidding.txt', 0);
                    $_SESSION['acc_vpoint'] = $_SESSION['acc_vpoint'] - ($bid + $Bid_Vpoint_Member);
                    echo $info;
            	} else echo $reponse;
            }
        }
    break;
    
    case 'reward':
        $bidid = $_GET['bidid'];    $bidid = abs(intval($bidid));
        $getcontent_url = $server_url . "/sv_com.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'name'    =>  $_SESSION['mu_nvchon'],
            'action'    =>  'reward',
            'bidid'    =>  $bidid,
            
            'pagesv'	=>	'sv_com_daugia',
            'string_login'    =>  $_SESSION['checklogin'],
            'passtransfer'    =>  $passtransfer
        );
        
        $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
        
        if ( empty($reponse) ) echo "Server bảo trì.";
        elseif($reponse == "login_other") {
        	echo "Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.";
        	session_destroy();
        }
        else {
        	if ( read_TagName($reponse, 'info', 1) == 'OK' ) {
                _getdaugia_list('data/daugia_bidding.txt', 0);
                echo "OK";
        	} else echo $reponse;
        }
    break;
    
    case 'dg_giahan':
        $bidid = $_GET['bidid'];    $bidid = abs(intval($bidid));
        $bidday = $_GET['bidday'];  $bidday = abs(intval($bidday));
        
        $getcontent_url = $server_url . "/sv_com.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'name'    =>  $_SESSION['mu_nvchon'],
            'action'    =>  'giahan',
            'bidid'    =>  $bidid,
            'bidday'    =>  $bidday,
            
            'pagesv'	=>	'sv_com_daugia',
            'string_login'    =>  $_SESSION['checklogin'],
            'passtransfer'    =>  $passtransfer
        );
        
        $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
        
        if ( empty($reponse) ) echo "Server bảo trì.";
        elseif($reponse == "login_other") {
        	echo "Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.";
        	session_destroy();
        }
        else {
        	if ( read_TagName($reponse, 'info', 1) == 'OK' ) {
                _getdaugia_list('data/daugia_bidding.txt', 0);
                echo "OK";
        	} else echo $reponse;
        }
    break;
    
    case 'dg_rutitem':
        $bidid = $_GET['bidid'];    $bidid = abs(intval($bidid));
        
        $getcontent_url = $server_url . "/sv_com.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'name'    =>  $_SESSION['mu_nvchon'],
            'action'    =>  'rutitem',
            'bidid'    =>  $bidid,
            
            'pagesv'	=>	'sv_com_daugia',
            'string_login'    =>  $_SESSION['checklogin'],
            'passtransfer'    =>  $passtransfer
        );
        
        $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
        
        if ( empty($reponse) ) echo "Server bảo trì.";
        elseif($reponse == "login_other") {
        	echo "Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.";
        	session_destroy();
        }
        else {
        	if ( read_TagName($reponse, 'info', 1) == 'OK' ) {
                _getdaugia_list('data/daugia_bidding.txt', 0);
                echo "OK";
        	} else echo $reponse;
        }
    break;
}



?>