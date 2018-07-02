<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
	$time = time()+date("25200");

	$fp_host = fopen($file_host, "r");
	$time_host = fgets($fp_host,15);
	fclose($fp_host);
	if ($time >= ($time_host+60))
	{
		
		$getcontent_url = $server_url . "/view_event_bongda.php";
        $getcontent_data = array(
            'action'    =>  'view',
            'passtransfer'    =>  $passtransfer
        ); 
        
        $show = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

		if ( !empty($show) )
		{
		//Ghi vào file
			$fp = fopen($file_host, "w+");  
			fputs ($fp, $time."\n".$show);
			fclose($fp);
		//End Ghi vào File
		}
	}
	
	$line = 0;
	$fopen_host = fopen($file_host, "r");
	$dudoan_info = 0;
	while (!feof($fopen_host)) {
		$line++;
		$line_info = fgets($fopen_host,200);
		if ( $line == 1 )
		{
			$time_get = gmdate("h:i d/m/Y",$line_info);
		}
		else {
			if( substr($line_info,0,10) == '<netbanbe>') $dudoan_info++;
			else {
				if($dudoan_info == 0)
				{
					$tran_info = explode('<nbb>', $line_info);
					$tran_id = $tran_info[1];
					$doi1 = $tran_info[2];
					$doi2 = $tran_info[3];
					$time_dau = date('h:iA d/m/Y',$tran_info[4]);
					$giai = $tran_info[5];
					
					if($giai) {
						$bong_dudoan[] = array (
							'tran_id' => $tran_id,
							'doi1' => $doi1,
							'doi2' => $doi2,
							'time_dau' => $time_dau,
							'giai' => $giai
						);
					}
				}
				elseif($dudoan_info == 1)
				{
					$tran_info = explode('<nbb>', $line_info);
					$tran_id = $tran_info[1];
					$doi1 = $tran_info[2];
					$doi2 = $tran_info[3];
					$time_dau = date('h:iA d/m/Y',$tran_info[4]);
					$giai = $tran_info[5];
					
					if($giai) {
						$bong_wait[] = array (
							'tran_id' => $tran_id,
							'doi1' => $doi1,
							'doi2' => $doi2,
							'time_dau' => $time_dau,
							'giai' => $giai
						);
					}
				}
				else {
					$tran_info = explode('<nbb>', $line_info);
					$tran_id = $tran_info[1];
					$doi1 = $tran_info[2];
					$doi2 = $tran_info[3];
					$tyso1 = $tran_info[4];
					$tyso2 = $tran_info[5];
					$time_dau = date('h:iA d/m/Y',$tran_info[6]);
					$giai = $tran_info[7];
					
					if($giai) {
						$bong_finish[] = array (
							'tran_id' => $tran_id,
							'doi1' => $doi1,
							'doi2' => $doi2,
							'tyso1' => $tyso1,
							'tyso2' => $tyso2,
							'time_dau' => $time_dau,
							'giai' => $giai
						);
					}
				}
			}
		}
	}
	fclose($fopen_host);

$page_template = "templates/event/event_bongda_view.tpl";
?>