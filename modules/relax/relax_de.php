<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
	
include('config/config_relax_de.php');
    
    $file_host = "data/kqxs.txt";
    
    if(is_file($file_host)) $fopen_host = fopen($file_host, "r");
	else $fopen_host = fopen($file_host, "w");
	
    $line = 0;
	while (!feof($fopen_host)) {
		$line++;
        if($line == 1) {
            $time_host = intval(fgets($fopen_host));
        } else if($line == 2) {
            $kqxs = fgets($fopen_host);
            $kqxs_arr = json_decode($kqxs, true);
        }
	}
    fclose($fopen_host);
    $hour_host = date('H', $time_host);
    $min_host = date('i', $time_host);
    $datetime_kqxs_host = strtotime($kqxs_arr['date']);
	
	$time = time();
    $hour_now = date('H', $time);
    $min_now = date('i', $time);
    $datetime = strtotime(date('Y-m-d', $time));
	
	if ( ( ( $hour_now < 20 && abs($datetime - $datetime_kqxs_host) > 24*60*60 ) || ($hour_now >= 20 && $datetime != $datetime_kqxs_host) ) && abs($min_now - $min_host) >= 5 )
	{
		$getcontent_url = $server_url . "/sv_relax.php";
        $getcontent_data = array(
            'pagesv'    =>  'sv_relax_kqxs',
            'passtransfer'    =>  $passtransfer
        ); 
        
        $show = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

		if ( !empty($show) )
		{
            $kqxs_data = read_TagName($show, 'kqxs', 1);
            if(strlen($kqxs_data) > 10) {
            //Ghi vào file
    			$fp = fopen($file_host, "w");  
    			fputs ($fp,$time."\n".$kqxs_data);
    			fclose($fp);
    		//End Ghi vào File
            }
		}
	}
	
	$fopen_host = fopen($file_host, "r");
	
	while (!feof($fopen_host)) {
		$kqxs_load = fgets($fopen_host);
        if(strlen($kqxs_load) > 15) {
            $kqxs_arr = json_decode($kqxs_load, true);
            break;
        }
	}
    fclose($fopen_host);
    
    for($i=0; $i<=7; $i++) {
        $giai[$i] = "";
        if(is_array($kqxs_arr['kqxs'][$i])) {
            foreach($kqxs_arr['kqxs'][$i] as $v) {
                if(strlen($giai[$i]) > 0) $giai[$i] .= " - ";
                $giai[$i] .= $v;
            }
        } else {
            $giai[$i] = $kqxs_arr['kqxs'][$i];
        }
            
    }
    
$hour_now = date('H', time());
$max_diemde = floor($_SESSION['acc_vpoint']/1000);if($max_diemde > 100) $max_diemde = 100;

$page_template = "templates/relax/relax_de.tpl";
?>