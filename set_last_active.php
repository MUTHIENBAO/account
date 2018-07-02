<?php
if(!isset($_SESSION)) session_start();
date_default_timezone_set('Asia/Ho_Chi_Minh');

if(isset($_SESSION['mu_username'])) {
    $_SESSION['last_active'] = time();
}
?>