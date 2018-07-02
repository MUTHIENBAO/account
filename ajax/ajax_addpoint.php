<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
/*
	Create : 19:32 28/12/2011
*/

    $str = $_GET['istr'];         $str = abs(intval($str));
    $dex = $_GET['idex'];         $dex = abs(intval($dex));
    $vit = $_GET['ivit'];         $vit = abs(intval($vit));
    $ene = $_GET['iene'];         $ene = abs(intval($ene));
    $com = $_GET['icom'];         $com = abs(intval($com));
    
    
    $str_new = $_SESSION['nv_str'] + $str;
    $dex_new = $_SESSION['nv_dex'] + $dex;
    $vit_new = $_SESSION['nv_vit'] + $vit;
    $ene_new = $_SESSION['nv_ene'] + $ene;
    $com_new = $_SESSION['nv_com'] + $com;
    $total_point_new = $_SESSION['nv_point'] + $_SESSION['nv_pointdutru'] - ($str + $dex + $vit + $ene + $com);
    
    $accept = 1;
    if($total_point_new < 0 || $str_new > 65000 || $dex_new > 65000 || $vit_new > 65000 || $ene_new > 65000 || $com_new > 65000 || ($str == 0 && $dex == 0 && $vit == 0 && $ene == 0 && $com == 0)) {
        $accept = 0;
    }
    
    echo "|$accept|$total_point_new|$str_new|$dex_new|$vit_new|$ene_new|$com_new|";

?>