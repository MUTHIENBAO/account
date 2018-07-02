<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");

    $file_host = 'data/daugia_bidding.txt';
    
    _getdaugia_list($file_host);
    
    $line = 0;
	$fopen_host = fopen($file_host, "r");
	while (!feof($fopen_host)) {
		$line++;
		$info = fgets($fopen_host);
		if ( $line == 1 )
		{
			$time_top = gmdate("h:i A d/m/Y", intval($info));
		}
		else {
              $data = $info;
		}
	}
	fclose($fopen_host);
    $data_arr = unserialize_safe($data);
    if(!is_array($data_arr)) {
        $listitem_arr = array();
        $item_group_count = array();
    } else {
        $listitem_arr = $data_arr['listitem'];
        $item_group_count = $data_arr['item_group_count'];
    }
    
    $group_item = array();
    foreach($item_group_count as $group_type => $group_count) {
        switch ($group_type){ 
        	case 0:    $group_name = $lang_itemgroup_sword;
        	break;
        
        	case 1:    $group_name = $lang_itemgroup_axe;
        	break;
            
        	case 2:    $group_name = $lang_itemgroup_mace;
        	break;
            
        	case 3:    $group_name = $lang_itemgroup_crepter;
        	break;
            
        	case 4:    $group_name = $lang_itemgroup_spear;
        	break;
            
        	case 5:    $group_name = $lang_itemgroup_bow;
        	break;
            
        	case 6:    $group_name = $lang_itemgroup_crossbow;
        	break;
            
        	case 7:    $group_name = $lang_itemgroup_staff;
        	break;
            
        	case 8:    $group_name = $lang_itemgroup_shield;
        	break;
            
        	case 9:    $group_name = $lang_itemgroup_helm;
        	break;
            
        	case 10:    $group_name = $lang_itemgroup_armor;
        	break;
            
        	case 11:    $group_name = $lang_itemgroup_pant;
        	break;
            
        	case 12:    $group_name = $lang_itemgroup_glove;
        	break;
            
        	case 13:    $group_name = $lang_itemgroup_boot;
        	break;
            
        	case 14:    $group_name = $lang_itemgroup_wing;
        	break;
            
        	case 15:    $group_name = $lang_itemgroup_pet;
        	break;
            
        	case 16:    $group_name = $lang_itemgroup_ring;
        	break;
            
        	case 17:    $group_name = $lang_itemgroup_pendant;
        	break;
            
        	case 18:    $group_name = $lang_itemgroup_orb;
        	break;
            
        	case 19:    $group_name = $lang_itemgroup_scrool;
        	break;
            
        	case 20:    $group_name = $lang_itemgroup_jewel;
        	break;
            
        	case 21:    $group_name = $lang_itemgroup_potion;
        	break;
            
        	case 22:    $group_name = $lang_itemgroup_amulet;
        	break;
            
        	case 23:    $group_name = $lang_itemgroup_event;
        	break;
            
        	case 24:    $group_name = $lang_itemgroup_eventmix;
        	break;
            
        	case 25:    $group_name = $lang_itemgroup_quest;
        	break;
            
        	case 26:    $group_name = $lang_itemgroup_gift;
        	break;
            
        	case 27:    $group_name = $lang_itemgroup_petmix;
        	break;
            
        	case 28:    $group_name = $lang_itemgroup_itemmix;
        	break;
            
        	case 29:    $group_name = $lang_itemgroup_castlesiege;
        	break;
            
        	default :    $group_name = $lang_itemgroup_other;
        }
        $group_item[] = array(
            'group_type'    =>  $group_type,
            'group_name'    =>  $group_name,
            'group_count'   =>  $group_count
        );
    }
    
if(isset($_GET['type']) && strlen($_GET['type']) > 0) {
    foreach($listitem_arr as $listitem_val) {
        if($listitem_val['item_group'] == $_GET['type']) {
            $item_arr[] = $listitem_val;
        }
    }
    
    $page_template = "templates/com/daugia_biding.tpl";
} else {
    $page_template = "templates/com/daugia_choisetype.tpl";
} 
    
?>