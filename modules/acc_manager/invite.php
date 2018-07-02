<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");

$link_invite = $host_url.'/index.php?mod=register&invite='.$_SESSION['mu_username'];

if(!isset($_SESSION['mu_invdata']))
{
	
	$getcontent_url = $server_url . "/view.php";
    $getcontent_data = array(
        'login'    =>  $_SESSION['mu_username'],
        'action'    =>  'view_invite',
        'passtransfer'    =>  $passtransfer
    ); 
    
    $show_reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

	if ( empty($show_reponse) ) $notice = "<font color='red'>Server bảo trì.</font>";
	else {
		$invite_split = explode('<netbanbe>',$show_reponse);
		if( $invite_split[0] == 'OK')
		{
			$_SESSION['mu_invdata'] = 1;
			$slg_inv = count($invite_split)-1;
			$_SESSION['slg_inv'] = $slg_inv;
			for($i=1;$i<=$slg_inv;$i++)
			{
				$info_inv = explode('<nbb>',$invite_split[$i]);
				$time_inv = date('d/m/Y H:i',$info_inv[1]);
				$_SESSION['info_invite'][$i] = array(
					'character' => $info_inv[0] ,
					'time_inv' =>  $time_inv ,
					'vpoint' => $info_inv[2]
				);
			}
		}
	}
}

$page_template = "templates/acc_manager/invite.tpl";
?>