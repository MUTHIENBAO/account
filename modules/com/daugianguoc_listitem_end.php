<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
    
    $file_host = "data/daugianguoc_bidend.txt";
    
	$time = time()+date("25200");

	$fp_host = fopen($file_host, "a+");
	$time_host = fgets($fp_host);
	fclose($fp_host);
	if ($time >= ($time_host+60))
	{
		$getcontent_url = $server_url . "/sv_com.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'name'    =>  $_SESSION['mu_nvchon'],
            
            'action'    =>  'listitem_end',
            'pagesv'    =>  'sv_com_daugianguoc',
            'string_login'    =>  $_SESSION['checklogin'],
            'passtransfer'    =>  $passtransfer
        );
        $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
		if ( !empty($reponse) )
		{
            $reponse_explode = explode('<nbb>', $reponse);
            if($reponse_explode[1] == 'OK') {
                //Ghi vào file
        			$fp = fopen($file_host, "w+");  
        			fputs ($fp, $time."\n".$reponse_explode[2]);
        			fclose($fp);
        		//End Ghi vào File
            } else {
                $error_module = "Lỗi : $reponse";
            }
		}
	}
    
    $line = 0;
	$fopen_host = fopen($file_host, "r");
	while (!feof($fopen_host)) {
		$line++;
		$info = fgets($fopen_host);
		if ( $line == 1 )
		{
			$time_top = gmdate("h:i A d/m/Y",$info);
		}
		else {
              $listitem = $info;
		}
	}
	fclose($fopen_host);
    $listitem_arr = unserialize_safe($listitem);
    if(!is_array($listitem_arr)) $listitem_arr = array();

$page_template = "templates/com/daugianguoc_listitem_end.tpl";
?>