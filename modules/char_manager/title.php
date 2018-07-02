<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
include('config/config_vip_system.php');
$file_edit = 'config/config_title.txt';

$fopen_host = fopen($file_edit, "r");
$title_data = fgets($fopen_host);
fclose($fopen_host);
$title_arr = json_decode($title_data, true);
if(!is_array($title_arr)) $title_arr = array();

    if(is_array($title_arr)) {
        foreach($title_arr as $k1 => $v1) {
            if(is_array($title_arr[$k1])) {
                foreach($v1 as $k2 => $v2) {
                    if($k1 == 'rs') {
                        $title_arr[$k1][$k2][4] = " Reset";
                        if( ((!isset($v2[5]) || $v2[5] == 0) && $_SESSION['nv_title'] == $v2[1]) || (($v2[5] == 1) && $_SESSION['nv_RankTitle1'] == $v2[1]) || (($v2[5] == 2) && $_SESSION['nv_RankTitle2'] == $v2[1]) || (($v2[5] == 3) && $_SESSION['nv_RankTitle3'] == $v2[1]) ) {
                            $title_arr[$k1][$k2][3] = "<font color='blue'>Đã kích hoạt</font>";
                        } else if($_SESSION['nv_rs_total'] >= $v2[0]) {
                            $title_arr[$k1][$k2][3] = "<button class='btn btn-green danhhieu_choise' id='btn_". $k1 ."_". $k2 ."' danhhieu_type='". $k1 ."' danhhieu_id='". $k2 ."' >Kích hoạt danh hiệu</button> <span id='msg_". $k1 ."_". $k2 ."'></span>";
                        } else {
                            $title_arr[$k1][$k2][3] = "Không đủ điều kiện";
                        }
                    } else if($k1 == 'card') {
                        $title_arr[$k1][$k2][4] = " VNĐ thẻ nạp";
                        if( ( ((!isset($v2[5]) || $v2[5] == 0) && $_SESSION['nv_title'] == $v2[1]) || (($v2[5] == 1) && $_SESSION['nv_RankTitle1'] == $v2[1]) || (($v2[5] == 2) && $_SESSION['nv_RankTitle2'] == $v2[1]) || (($v2[5] == 3) && $_SESSION['nv_RankTitle3'] == $v2[1]) ) ) {
                            $title_arr[$k1][$k2][3] = "<font color='blue'>Đã kích hoạt</font>";
                        } else if($_SESSION['acc_card_total'] >= $v2[0]) {
                            $title_arr[$k1][$k2][3] = "<button class='btn btn-green danhhieu_choise' id='btn_". $k1 ."_". $k2 ."' danhhieu_type='". $k1 ."' danhhieu_id='". $k2 ."' >Kích hoạt danh hiệu</button> <span id='msg_". $k1 ."_". $k2 ."'></span>";
                        } else {
                            $title_arr[$k1][$k2][3] = "Không đủ điều kiện";
                        }
                    } else if($k1 == 'vip2' && $Use_VIP == 2) {
                        if( ( ((!isset($v2[5]) || $v2[5] == 0) && $_SESSION['nv_title'] == $v2[1]) || (($v2[5] == 1) && $_SESSION['nv_RankTitle1'] == $v2[1]) || (($v2[5] == 2) && $_SESSION['nv_RankTitle2'] == $v2[1]) || (($v2[5] == 3) && $_SESSION['nv_RankTitle3'] == $v2[1]) ) ) {
                            $title_arr[$k1][$k2][3] = "<font color='blue'>Đã kích hoạt</font>";
                        } else if($_SESSION['acc_vip'] == $v2[0]) {
                            $title_arr[$k1][$k2][3] = "<button class='btn btn-green danhhieu_choise' id='btn_". $k1 ."_". $k2 ."' danhhieu_type='". $k1 ."' danhhieu_id='". $k2 ."' >Kích hoạt danh hiệu</button> <span id='msg_". $k1 ."_". $k2 ."'></span>";
                        } else {
                            $title_arr[$k1][$k2][3] = "Không đủ điều kiện";
                        }
                    } else if($k1 == 'buy') {
						$title_arr[$k1][$k2][4] = " Gcent";
                        if( ( ((!isset($v2[5]) || $v2[5] == 0) && $_SESSION['nv_title'] == $v2[1]) || (($v2[5] == 1) && $_SESSION['nv_RankTitle1'] == $v2[1]) || (($v2[5] == 2) && $_SESSION['nv_RankTitle2'] == $v2[1]) || (($v2[5] == 3) && $_SESSION['nv_RankTitle3'] == $v2[1]) ) ) {
                            $title_arr[$k1][$k2][3] = "<font color='blue'>Đã kích hoạt</font>";
                        } else if($_SESSION['acc_gcoin'] >= $v2[0]) {
                            $title_arr[$k1][$k2][3] = "<button class='btn btn-green danhhieu_choise' id='btn_". $k1 ."_". $k2 ."' danhhieu_type='". $k1 ."' danhhieu_id='". $k2 ."' >Mua danh hiệu</button> <span id='msg_". $k1 ."_". $k2 ."'></span>";
                        } else {
                            $title_arr[$k1][$k2][3] = "Không đủ Gcent";
                        }
                    }
                }
            }
        }
    }

$page_template = "templates/char_manager/title.tpl";

?>