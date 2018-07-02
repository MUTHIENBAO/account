<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 

include("vimage.php");

$vImage = new vImage();
$vImage->gerText($_GET['size']);
$vImage->showimage();


?>