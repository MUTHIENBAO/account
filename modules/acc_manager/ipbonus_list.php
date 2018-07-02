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
    include('config/config_ipbonus.php');
    
    $file_host = "data/ipbonus_list.txt";
	
	$time = time()+date("25179");

	if(is_file($file_host)) $fp_host = fopen($file_host, "r");
		else $fp_host = fopen($file_host, "w");
		
	$time_host = fgets($fp_host,15);
	fclose($fp_host);
	if ($time >= ($time_host+300))
	{
		$getcontent_url = $server_url . "/view_ipbonus.php";
        $getcontent_data = array(
            'passtransfer'    =>  $passtransfer
        ); 
        
        $show = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
		
		if ( !empty($show) )
		{
		//Ghi vào file
			$fp = fopen($file_host, "w");  
			fputs ($fp, $time."\n".$show);
			fclose($fp);
		//End Ghi vào File
		}
	}
	$line = 0;
	$fopen_host = fopen($file_host, "r");
	while (!feof($fopen_host)) {
		$line ++;
		$character = fgets($fopen_host,200);
		$char_info = explode('<nbb>', $character);
		if ( $line == 1 )
		{
			$time_get = gmdate("h:i A d/m/Y", intval($character));
		}
		elseif(isset($char_info[1]) && strlen($char_info[1])>0) {
            $netname[] = $char_info[1];
            $netaddr[] = $char_info[2];
		}
	}
	fclose($fopen_host);
        
    $page_template = 'templates/acc_manager/ipbonus_list.tpl';
}
?>