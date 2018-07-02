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
	if(isset($_GET['act'])) $act = $_GET['act'];
    else $act = null;
	switch ($act)
	{
		case 'relax_lo': 
            if(isset($Use_GiaiTri_Lo) && $Use_GiaiTri_Lo == 1) {
                include('modules/relax/relax_lo.php'); 
            } else {
                $page_template = 'templates/relax.tpl';
            }
            break;
            
        case 'relax_de': 
            if(isset($Use_GiaiTri_De) && $Use_GiaiTri_De == 1) {
                include('modules/relax/relax_de.php'); 
            } else {
                $page_template = 'templates/relax.tpl';
            }
            break;
            
		default : $page_template = 'templates/relax.tpl';
	}
}
?>