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


if ( !isset($_SESSION['mu_username']) ) {


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


	


	


	/*


		Các bước tiến hành:


		B1: Đọc file trên host lấy thời gian lưu file


		B2: So sánh thời gian hiện tại với thời gian lưu file


		B3: Nếu thời gian hiện tại lớn hơn thời gian lưu file 3600 (1h) thì đọc file trên Server


		B4: Lưu nội dung file trên Server vào file trên Host


		B5: Đọc file lưu trên Host và hiển thị


	*/


	if(isset($_GET['type'])) $type = $_GET['type'];


    else $type = 'all';


    switch($type)


    {


        case "DW": $file_host = "data/top_DW.txt"; $title_top = "Dark Wizark"; break;


    	case "DK": $file_host = "data/top_DK.txt"; $title_top = "Dark Knight"; break;


    	case "ELF": $file_host = "data/top_ELF.txt"; $title_top = "ELF"; break;


    	case "MG": $file_host = "data/top_MG.txt"; $title_top = "Magic Gladiator"; break;


    	case "DL": $file_host = "data/top_DL.txt"; $title_top = "DarkLord"; break;


    	case "SuM": $file_host = "data/top_SuM.txt"; $title_top = "Summoner"; break;


    	case "RF": $file_host = "data/top_RF.txt"; $title_top = "Rage Fighter"; break;


    	default: $file_host = "data/top.txt"; $title_top = "Tất cả";


    }


	





	$time = time();





	$fp_host = fopen($file_host, "r");


	$time_host = intval(fgets($fp_host,15));


	fclose($fp_host);


	if ($time >= ($time_host+300) || $time_host > $time || date("d", $time) != date("d", $time_host) )


	{

		if ( $type == "all" || $type == "DW" || $type == "DK" || $type == "ELF" || $type == "MG" || $type == "DL" || $type == "SuM" || $type == "RF" || empty($type) )


		{


			$getcontent_url = $server_url . "/view_topresets.php";


	        $getcontent_data = array(


	            'top_type'    =>  $type,


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


	}


	


	$line = 0;


	$fopen_host = fopen($file_host, "r");


	while (!feof($fopen_host)) {


		$line++;


		$character = fgets($fopen_host,200);


		$char_info = explode('<nbb>', $character);


		if ( $line == 1 )


		{


			$time_top = date("h:i A d/m/Y", intval($character));


		}


		else {


              if(isset($char_info[6])) $thehe_id = trim($char_info[6]);


              else $thehe_id = 1;


              $thehe_id = trim($thehe_id);


              if ($thehe_id == $_SESSION['thehe'] && isset($char_info[1]))


              {


                switch(intval($char_info[1]))


                  {


                    case 0:  $Class ='DW 1'; break;


        			case 1:  $Class ='DW 2'; break;


        			case 2:


                    case 3:  $Class ='DW 3'; break;


        			


        			case 16:  $Class ='DK 1'; break;


        			case 17:  $Class ='DK 2'; break;


        			case 18:


                    case 19:  $Class ='DK 3'; break;


        			


        			case 32:  $Class ='Elf 1'; break;


        			case 33:  $Class ='Elf 2'; break;


        			case 34:


                    case 35:  $Class ='Elf 3';  break;


        			


        			case 48:  $Class ='MG 1'; break;


        			case 49:


                    case 50:  $Class ='MG 3'; break;


        			


        			case 64:  $Class ='DL 1'; break;


        			case 65:


                    case 66:  $Class ='DL 3'; break;


        			


        			case 80:  $Class ='SUM 1'; break;


        			case 81:  $Class ='SUM 2'; break;


        			case 82:


                    case 83:  $Class ='SUM 3'; break;


        			


        			case 96:  $Class ='RF 1'; break;


        			case 97:


                    case 98:  $Class ='RF 3'; break;


                  }


                $char[] = array (


    				'name'	=> isset($char_info[0]) ? $char_info[0] : null,


    				'nvclass'	=> $Class,


    				'relife'	=> isset($char_info[2]) ? $char_info[2] : 0,


    				'reset'	=> isset($char_info[3]) ? $char_info[3] : 0,


                    'level'	=> isset($char_info[4]) ? $char_info[4] : 1,


                    'dgt_time'	=> isset($char_info[5]) ? $char_info[5] : 0,


                    'point_ut'	=> isset($char_info[7]) ? $char_info[7] : 0,


                    'pc_point'	=> isset($char_info[8]) ? $char_info[8] : 0,


                    'point_total'	=> isset($char_info[9]) ? $char_info[9] : 0,


                    'lastrs_time'	=> isset($char_info[10]) ? date('d/m H:i:s', $char_info[10]) : '',


                    'master_point'	=> isset($char_info[11]) ? $char_info[11] : '-',


                    'vip'	=> isset($char_info[12]) ? $char_info[12] : 0,


                    'vip_day'	=> isset($char_info[13]) ? $char_info[13] : 0,


                    'thehe' =>  $thehe_choise[$thehe_id]


    			);


              }


		}


	}


	fclose($fopen_host);


	


	$page_template = 'templates/rank/ranking.tpl';


}


}


?>