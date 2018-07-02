<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
//error_reporting(E_ALL);
//ini_set('display_errors', '1');

$pathinfo = pathinfo(__FILE__);
$_filename = $pathinfo['basename'];
$_path = str_replace('//','/',str_replace($_filename,'',$_SERVER['PHP_SELF']));

define('DIR','http://'.$_SERVER['HTTP_HOST'].'/'.$_path);

include('checkwrite.php');

if(!isset($_SESSION)) session_start();
date_default_timezone_set('Asia/Ho_Chi_Minh');
define('DWebMU',true);
include_once('lang/lang_vn.php');
include_once('includes/function.php');
include_once('config/config_dongbo.php');
include_once('config/config_chucnang.php');
include_once('config/config_sms.php');
include_once("config/config_sms_pri.php");
include_once('config/config.php');
include_once('config/config_support.php');
include_once('config/config_domain.php');
include_once('config/config_event.php');
include_once('config/config_thehe.php');
include_once('hosting_sync2.php');

if(!isset($_SESSION['login_wrong'])) $_SESSION['login_wrong'] = 0;

$server_url = _trimendslashurl($server_url);
if($opensite == 0)
{
	echo $lang_off; exit();
}

include_once('config/config_firewall.php');
if($use_antiddos == 1)
{
	include_once('firewall.php');
}

if(isset($_SESSION['mu_username'])) {
    if(isset($_SESSION['last_active']) && ($_SESSION['last_active'] < time() - 30*60) ) {
        session_destroy();
        setcookie("last_sendsv", "", time()-3600);
        jum('./');
    } else {
        $_SESSION['last_active'] = time();
    }
}

if(isset($_SESSION['thehe']) && $_SESSION['thehe'] > 0) {
    $thehe_check = $_SESSION['thehe'];
    if(strlen($thehe_choise[$thehe_check]) == 0) {
        session_destroy();
        setcookie("last_sendsv", "", time()-3600);
        jum('./');
    }
}

$sendsv = _checksendsv();

include_once('includes/login.class.php');

_loaddata();

include_once("vimage.php");
$vImage = new vImage();

// Nếu có $Module -> Load trang Module
if(isset($_GET['mod'])) $module = $_GET['mod'];
if(isset($module)) {
    // Kiểm tra điều kiện biến Module
    // Nếu không có ký tự đặc biệt thì Load Module
    // Nếu có ký tự đặc biệt thì Load Page ErrorFile
    if (!preg_match("/^[a-zA-Z0-9_]*$/i", $module)) {
        $module = "errorfile";
    }
} else {
    if(isset($_SESSION['mu_username'])) {
        $module = "acc_manager";
    } else {
        $module = "home";
    }
}
// Kiểm tra nếu tồn tại Module thì Load Module
if (is_file("modules/". $module .".php")) 
    include("modules/". $module .".php");
// Nếu không tồn tại Module thì Load Page ErrorFile
else {
    include("modules/errorfile.php");
    $module = "errorfile";
}

include("templates/templates".$type.".php");
?>