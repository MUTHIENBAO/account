<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
if ( !isset($_SESSION['mu_username']) ) {
	echo "<div align=center><font color=red><b>". $lang_notice_login ."</b></font></div>";
	include('modules/home.php');
} else {
	if (strlen($_SESSION['mu_nvchon']) > 0) {
        if(isset($_GET['act'])) $act = $_GET['act'];
        else $act = null;
        switch ($act)
        {
        	case 'balance': include("templates/guild/balance.tpl"); break;
        	default : $page_template = 'templates/guild.tpl';
        }
	} else {
	   $page_template = 'templates/guild.tpl';
	}
        
}
?>