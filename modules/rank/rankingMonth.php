<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
if ($Use_XepHang != 1) {
	echo "<center>Chức năng không có hoặc không được sử dụng</center>";
}
else {
if ( !isset($_SESSION[mu_username]) ) {
	echo "<div align=center><font color=red><b>Hãy Login trước khi thực hiện chức năng này</b></font></div>";
	include('modules/home.php');
} else {
    
	// Chon The he
    if ($thehe_choise)
    {
        if(!isset($_SESSION['thehe'])) $_SESSION['thehe'] = count($thehe_choise)-1;
        if(isset($_GET['thehe'])) $_SESSION['thehe'] = abs(intval($_GET['thehe']));
        $theheid = $_SESSION['thehe'];
    }
	
    
		$file_host = "data/topmonth.txt";
	
		$time = time();
	
		if(is_file($file_host)) $fp_host = fopen($file_host, "r");
			else $fp_host = fopen($file_host, "w");
			
		$time_host = fgets($fp_host,15);
		fclose($fp_host);
		if ($time >= ($time_host+300) || $time_host > $time || date("d", $time) != date("d", $time_host) )
		{
				$getcontent_url = $server_url . "/view_topresetsMonth.php";
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
				$time_top = date("h:i A d/m/Y",$character);
			}
			else {

                $thehe_id = $char_info[5];
                $thehe_id = trim($thehe_id);
                if ($thehe_id == $_SESSION['thehe'])
                {
                    switch($char_info[1])
                     {
                        case 0:  $Class ='Dark Wizark'; break;
            			case 1:  $Class ='Soul Master'; break;
            			case 2:
                        case 3:  $Class ='Grand Master'; break;
            			
            			case 16:  $Class ='Dark Knight'; break;
            			case 17:  $Class ='Blade Knight'; break;
            			case 18:
                        case 19:  $Class ='Blade Master'; break;
            			
            			case 32:  $Class ='Elf'; break;
            			case 33:  $Class ='Muse Elf'; break;
            			case 34:
                        case 35:  $Class ='Hight Elf';  break;
            			
            			case 48:  $Class ='Magic Gladiator'; break;
            			case 49:
                        case 50:  $Class ='Duel Master'; break;
            			
            			case 64:  $Class ='DarkLord'; break;
            			case 65:
                        case 66:  $Class ='Lord Emperor'; break;
            			
            			case 80:  $Class ='Sumonner'; break;
            			case 81:  $Class ='Bloody Summoner'; break;
            			case 82:
                        case 83:  $Class ='Dimension Master'; break;
            			
            			case 96:  $Class ='Rage Fighter'; break;
            			case 97:
                        case 98:  $Class ='First Master'; break;
                     }
                    $thehe_name = $thehe_choise[$thehe_id];
    			     if($char_info[2]) {
    			         $char[] = array (
        					'name'	=> $char_info[0],
        					'nvclass'	=> $Class,
        					'reset'	=> $char_info[2],
                            'level'	=> $char_info[3],
                            'dgt_time'	=> $char_info[4],
                            'thehe' =>  $thehe_name
    				    );
    			    }
                }
			}
		}
		fclose($fopen_host);

	
	$page_template = 'templates/rank/rankingmonth.tpl';
}
}
?>