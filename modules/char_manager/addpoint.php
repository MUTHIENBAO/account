<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
if (isset($_POST['action']))
{
	$action = $_POST['action'];
	if ($action == 'addpoint')
	{
		$character = $_POST['character'];
		$str = $_POST['str'];
		$dex = $_POST['dex'];
		$vit = $_POST['vit'];
		$ene = $_POST['ene'];
		$ml = $_POST['ml'];
        $keeppoint = abs(intval($_POST['keeppoint']));

		$sum_point = $str + $dex + $vit + $ene + $ml;
		
		if (empty($character))
		{
			$notice = "Chưa chọn nhân vật cần Cộng Điểm";
		}
		elseif (preg_match("/[^a-zA-Z0-9_$]/", $character))
			{
				$notice = "<font size='4' color='red'>Dữ liệu lỗi - Nhân vật chỉ được sử dụng kí tự a-z, A-Z, số (1-9) và dấu _.</font>";
			}
		elseif (preg_match("/[^0-9$]/", $str))
		{
	    	$notice = "<font size='2' color='red'>Dữ liệu lỗi : Điểm cộng cho Sức mạnh chỉ được sử dụng số (1-9).</font>"; 
		}
		elseif (preg_match("/[^0-9$]/", $dex))
		{
	    	$notice = "<font size='2' color='red'>Dữ liệu lỗi : Điểm cộng cho Nhanh nhẹn chỉ được sử dụng số (1-9).</font>"; 
		}
		elseif (preg_match("/[^0-9$]/", $vit))
		{
	    	$notice = "<font size='2' color='red'>Dữ liệu lỗi : Điểm cộng cho Sức khỏe chỉ được sử dụng số (1-9).</font>"; 
		}
		elseif (preg_match("/[^0-9$]/", $ene))
		{
	    	$notice = "<font size='2' color='red'>Dữ liệu lỗi : Điểm cộng cho Năng lượng chỉ được sử dụng số (1-9).</font>"; 
		}
		elseif (preg_match("/[^0-9$]/", $ml))
		{
	    	$notice = "<font size='2' color='red'>Dữ liệu lỗi : Điểm cộng cho Mệnh lệnh chỉ được sử dụng số (1-9).</font>"; 
		}
		elseif ($sum_point == 0) {
			$notice = "<font size='2' color='red'>Dữ liệu lỗi : Chưa điền điểm để cộng.</font>";
		}
		elseif ($sum_point > $_SESSION['nv_point'] + $_SESSION['nv_pointdutru'])
		{
			$notice = "<font size='2' color='red'>Dữ liệu lỗi : Tổng điểm cộng lớn hơn Point hiện có.</font>";
		}
		else {
			
			$getcontent_url = $server_url . "/sv_char.php";
            $getcontent_data = array(
                'login'    =>  $_SESSION['mu_username'],
                'name'    =>  $character,
                'str'    =>  $str,
                'dex'    =>  $dex,
                'vit'    =>  $vit,
                'ene'    =>  $ene,
                'ml'    =>  $ml,
                'keeppoint'    =>  $keeppoint,
                
                'pagesv'	=>	'sv_char_addpoint',
                'string_login'    =>  $_SESSION['checklogin'],
                'passtransfer'    =>  $passtransfer
            ); 
            
            $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);

			if ( empty($reponse) ) $notice = "<font size='3' color='red'>Server bảo trì.</font>";
			elseif($reponse == "login_other") {
				$notice = "<font size='3' color='red'>Tài khoản đã được đăng nhập trên trình duyệt khác hoặc máy tính khác.</font>";
				session_destroy();
			}
			else {
				$info = explode('<nbb>',$reponse);
				if ($info[0] == 'OK') {
					$notice = $info[1];
                    
                    if($_SESSION['nv_pointdutru'] >= $sum_point) $_SESSION['nv_pointdutru'] = $_SESSION['nv_pointdutru'] - $sum_point;
                    else {
                        $_SESSION['nv_point'] = $_SESSION['nv_point'] - ($sum_point - $_SESSION['nv_pointdutru']);
                        $_SESSION['nv_pointdutru'] = 0;
                    }
                    
                    $_SESSION['nv_str'] = $_SESSION['nv_str'] + $str;
                    $_SESSION['nv_dex'] = $_SESSION['nv_dex'] + $dex;
                    $_SESSION['nv_vit'] = $_SESSION['nv_vit'] + $vit;
                    $_SESSION['nv_ene'] = $_SESSION['nv_ene'] + $ene;
                    $_SESSION['nv_com'] = $_SESSION['nv_com'] + $ml;
				}
				else $notice = $reponse;
			}
		}
	}
}

$accept = 1;
if ($_SESSION['nv_doinv'] == 0) { $accept = 0; }

$page_template = "templates/char_manager/addpoint.tpl";
?>