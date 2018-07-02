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
        $thehe = $_SESSION['thehe'];
    }
    
    $index = 1;
    if(isset($_GET['index'])) $index = abs(intval($_GET['index']));

	if ($act == "event_toprs") { 
		$file_host = "data/toprs.txt"; 
		$action = "view_toprs"; 
        $type_name = 'toprs';
		
        $info1_name = "Nhân Vật";
        $info3_name = "Chủng Tộc";
        $info4_name = "Reset Cuối";
                
        if(!isset($_GET['type']) || $_GET['type'] != 'danhvong') {
            $type = 'rs';
    		$info2_name = "Reset/Level/Reset All/Relifes";
        } else {
            $type = 'danhvong';
    		$info2_name = "Tổng Danh vọng";
        }
		if($index == 1) {
            $name = $event_toprs_name;
            $time_begin = $event_toprs_begin;
    		$time_end = $event_toprs_end;
		} else {
            $name = $event_toprs[$index]['name'];
            $time_begin = $event_toprs[$index]['begin'];
    		$time_end = $event_toprs[$index]['end'];
		}
	}
	elseif ($act == "event_toppoint") { 
		$file_host = "data/toppoint.txt"; 
		$action = "view_toppoint"; 
        $type_name = 'toppoint';
		$name = $event_toppoint_name; 
		$info1_name = "Nhân Vật";
		$info2_name = "Point";
		$time_begin = $event_toppoint_begin;
		$time_end = $event_toppoint_end;
	}
	elseif ($act == "event_topcard") { 
		$file_host = "data/topcard.txt"; 
		$action = "view_topcard"; 
        $type_name = 'topcard';
		$name = $event_topcard_name; 
		$info1_name = "Nhân Vật";
		$info2_name = "Gcent nạp";
        
        if($index == 1) {
            $name = $event_topcard_name;
            $time_begin = $event_topcard_begin;
    		$time_end = $event_topcard_end;
		} else {
            $name = $event_topcard[$index]['name'];
            $time_begin = $event_topcard[$index]['begin'];
    		$time_end = $event_topcard[$index]['end'];
		}
	}
    elseif ($act == "event_goldbox_top") { 
		$file_host = "data/top_goldbox.txt"; 
		$action = "view_top_goldbox"; 
        $type_name = 'topgoldbox';
		$name = $event_top_goldbox_on; 
		$info1_name = "Nhân Vật";
		$info2_name = "Phúc Lợi";
		$time_begin = $event_goldbox_begin;
		$time_end = $event_goldbox_end;
	}

	$time = time();

	if(is_file($file_host)) $fp_host = fopen($file_host, "r");
	else $fp_host = fopen($file_host, "w");
	$data_file = fgets($fp_host);
	fclose($fp_host);
    
    $get_data_sv = false;
    if(strlen($data_file) == strlen(abs(intval($data_file)))) {
        $get_data_sv = true;
        $data_arr = array();
    } else {
        $data_arr = json_decode($data_file, true);
        $time_lastsv = $data_arr[$type_name][$index]['time'];
        if($time > ($time_lastsv + 300)) $get_data_sv = true;
    }
    
	if ($get_data_sv === true)
	{
		$getcontent_url = $server_url . "/view_eventtop_intime.php";
        $getcontent_data = array(
            'action'    =>  $action,
            'index'     =>  $index,
            'passtransfer'    =>  $passtransfer
        ); 
        
        $show = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
        $show_explode = explode('<nbb>', $show);
        
		//Ghi vào file
        if(strlen($show_explode[1]) > 0) {
            $data_arr[$type_name][$index]['time'] = $time;
            $data_arr[$type_name][$index]['data'] = json_decode($show_explode[1], true);
            $data_encode = json_encode($data_arr);
            $fp = fopen($file_host, "w");  
			fputs ($fp, $data_encode);
			fclose($fp);
        }
		//End Ghi vào File
	}
	
    if ($act == "event_toprs") {
        $time_top = date('d/m H:i', $data_arr[$type_name][$index]['time']);
        $event_toprs_array = $data_arr[$type_name][$index]['data'];
    } else {
        $time_top = date('d/m H:i', $data_arr[$type_name][$index]['time']);
        $event_topcard_array = $data_arr[$type_name][$index]['data'][$thehe];
    }
	
	$page_template = 'templates/event/eventtop_intime.tpl';
}
}
?>