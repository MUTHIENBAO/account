<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/

if(!isset($_SESSION)) session_start();
if( !isset($_SESSION['mu_username']) ) {
    $rand = mt_rand(1,5);
    $nweb_security_login_code1 = $rand;
    $rand = mt_rand(6,10);
    $nweb_security_login_code2 = $rand;
    
    //Config
	$characters = '123456789';
	
    // Create Rand String 1
    $random_string_length = $nweb_security_login_code2 - $nweb_security_login_code1;
    $rand_string1 = "";
    for ($i = 0; $i < $random_string_length; $i++) { 
		$rand_string1 .= $characters[rand(0, strlen($characters) - 1)]; 
 	}
    
    // Create Rand String 2
    $random_string2_length = rand(1,5);
    $rand_string2 = "";
    for ($i = 0; $i < $random_string2_length; $i++) { 
		$rand_string2 .= $characters[rand(0, strlen($characters) - 1)]; 
 	}
    
    $timenow = time();
    $nweb_security_login_code3 = $rand_string1 . $timenow . $rand_string2;

    //include('templates/box_login.tpl');
}
?>