<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
if ( !isset($_SESSION['mu_username']) ) {
	echo "<div align=center><font color=red><b>Hãy Login trước khi thực hiện chức năng này</b></font></div>";
	include('modules/home.php');
} else 
{
	if(isset($_GET['act'])) $act = $_GET['act'];
    else $act = null;
		switch ($act)
		{
            case 'rankrs':  include('modules/rank/rankrs.php'); break;
            case 'rankrs2':  include('modules/rank/rankrs2.php'); break;
            case 'rankrs3':  include('modules/rank/rankrs3.php'); break;
            case 'rankpointrs': include('modules/rank/rankpointrs.php'); break;
            case 'rankpointrs2': include('modules/rank/rankpointrs2.php'); break;
            case 'ranking': include('modules/rank/ranking.php'); break;
            case 'ranking_guild': include('modules/rank/ranking_guild.php'); break;
            case 'rank50': include('modules/rank/rank50.php'); break;
            case 'rank_tuluyen': include('modules/rank/rank_tuluyen.php'); break;
            case 'rank_phucloi': include('modules/rank/rank_phucloi.php'); break;
            case 'rank_point': include('modules/rank/rank_point.php'); break;
            case 'rank_songtu': include('modules/rank/rank_songtu.php'); break;
            case 'rank_pmaster': include('modules/rank/rank_pmaster.php'); break;
			
			default : $page_template = 'templates/rank.tpl';
		}
}
?>