<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
if ( !isset($_SESSION[mu_username]) ) {
	echo "<div align=center><font color=red><b>Hãy Login trước khi thực hiện chức năng này</b></font></div>";
	include('modules/home.php');
} else 
{
    if ( $user_support == 1 )
    {
    	$act = $_GET['act'];
		switch ($act)
		{
			case 'writesupport': include('modules/support/writesupport.php'); break;
			case 'readsupport': include('modules/support/readsupport.php'); break;
            
            case 'adm_writesupport': include('modules/support/adm_writesupport.php'); break;
			case 'adm_readsupport': include('modules/support/adm_readsupport.php'); break;
            case 'adm_inbox': include('modules/support/adm_inbox.php'); break;
            
			default : include('modules/support/inbox.php');
		}
    }
}
?>