<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
foreach ($_GET as $check_get) {
	if (!preg_match("/^[a-zA-Z0-9_\.@!#$^&%=]*$/i", $check_get))
	{
        echo "$check_get Khong duoc su dung ky tu dac biet";
		exit();
	}
}

function antiinject_query($value) {
    $value = stripslashes($value);
    $value = htmlspecialchars($value, ENT_QUOTES, "UTF-8");
    return $value;
}

function viewchar($login) {
	include('config/config.php');
	$form_data = "action=view_char&login=$login&passtransfer=$passtransfer";
	$show_reponse = @file_get_contents($server_url."/view.php?".$form_data);
	$char = explode('<netbanbe>',$show_reponse);
	for ($i=0; $i<5; ++$i)
	{
		if ( !empty($char[$i]))
		{
			$showchar[] = $char[$i];
		}
	}
	return $showchar;
}

function kiemtra_kitudacbiet($login) {
	if (!preg_match("/^[a-zA-Z0-9_]*$/i", $login))
	{
    echo "Du lieu loi : $login . Chi duoc su dung ki tu a-z, A-Z, so (1-9) va dau _."; exit();
	}
}

function kiemtra_kituso($login) {
	if (!preg_match("/^[0-9]*$/i", $login))
	{
    echo "Du lieu loi : $login . Chi duoc su dung so (1-9)."; exit();
	}
}

function kiemtra_email($email) {
	if (!preg_match("/^[a-zA-Z0-9\.@_-]*$/i", $email))	{
    echo "Email Khong duoc su dung nhung ky tu dac biet."; exit();
	}
	if (!preg_match("/^[a-z0-9]+([_\\.-][a-z0-9]+)*@([a-z0-9]+([\.-][a-z0-9]+)*)+\\.[a-z]{2,6}$/i", $email)) {
	echo "Dia chi Email khong dung. Xin vui long kiem tra lai."; exit();
	}
}

function _getdaugia_list ($file_host = 'data/daugia_bidding.txt', $time_wait = 60) {
    global $server_url, $getcontent_method, $getcontent_curl, $passtransfer;
    
    $time = time()+date("25200");

	$fp_host = fopen($file_host, "a+");
	$time_host = fgets($fp_host);
	fclose($fp_host);
	if ($time >= ($time_host+$time_wait) || $time_host > $time)
	{
		$getcontent_url = $server_url . "/sv_com.php";
        $getcontent_data = array(
            'login'    =>  $_SESSION['mu_username'],
            'name'    =>  $_SESSION['mu_nvchon'],
            
            'action'    =>  'listitem_biding',
            'pagesv'    =>  'sv_com_daugia',
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
                $err = "Lỗi : $reponse";
                echo $err;
            }
		} else {
		  echo "Không nhận được dữ liệu";
		}
	}
}

function jum($local) {
	header("Location: $local");
}

function empty_field($login) {
	if (empty($login))
	{
    	$error = "<font size='2' color='red'>Chưa điền đầy đủ tất cả dữ liệu cần thiết.</font>"; 
	}
}
function get_ip(){
# Enable X_FORWARDED_FOR IP matching?	$do_check = 1;	$addrs = array();	if( $do_check )	{		if(isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {		  foreach( array_reverse(explode(',', $_SERVER['HTTP_X_FORWARDED_FOR'])) as $x_f )    		{    			$x_f = trim($x_f);    			if( preg_match('/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/', $x_f) )    			{    				$addrs[] = $x_f;    			}    		}		}            		if(isset($_SERVER['HTTP_CLIENT_IP'])) $addrs[] = $_SERVER['HTTP_CLIENT_IP'];		if(isset($_SERVER['HTTP_PROXY_USER'])) $addrs[] = $_SERVER['HTTP_PROXY_USER'];	}	$addrs[] = $_SERVER['REMOTE_ADDR'];	foreach( $addrs as $v )	{		if( $v )		{			preg_match("/^([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})$/", $v, $match);			$ip = $match[1].'.'.$match[2].'.'.$match[3].'.'.$match[4];			if( $ip && $ip != '...' )			{				break;			}		}	}	if( ! $ip || $ip == '...' )	{		echo "Không thể xác định địa chỉ IP của bạn.";	}	return $ip;}

function _trimendslashurl ($url)
{
    // Trim End URL /
    while(substr($url, -1) == "/") {
        $url = substr($url, 0, -1);
    }
    return $url;
}


function _checksendsv( $second_check = 1 )
{
    if(isset($_COOKIE['last_sendsv'])) $last_send = $_COOKIE['last_sendsv'];
    $timenowcheck = time();
    if(isset($last_send) && $last_send>0) {
        if( ($timenowcheck - $last_send) > $second_check ) {
            $expire=time()+60*60*24*30;
            setcookie("last_sendsv", time(), $expire);
            return true;
        } else {
            return false;
        }
    } else {
        $expire=time()+60*60*24*30;
        setcookie("last_sendsv", time(), $expire);
        return true;
    }
    return true;
}

/**
 * _langarr()
 * 
 * @param mixed $string
 * @param mixed $arr
 * @return
 */
function _langarr($string, $arr) {
    foreach($arr as $str_replace) {
        $string = preg_replace('/%s/', $str_replace, $string, 1);
    }
    
    return $string;
}

function _loaddata() {
    if( isset($_SESSION['mu_username']) && isset($_SESSION['mu_nvchon']) && isset($_SESSION['checklogin']) && strlen($_SESSION['mu_username']) > 0 && strlen($_SESSION['mu_nvchon']) > 0 && ( !isset($_COOKIE["nweb_loaddata"]) || $_COOKIE["nweb_loaddata"] < (time() - 300) ) ) {
        
        global $server_url, $getcontent_method, $getcontent_curl, $passtransfer;
        
        $getcontent_url = $server_url . "/view.php";
        $getcontent_data = array(
            'action'    =>  'view_infoacc',
            'login'    =>  $_SESSION['mu_username'],
            'name'    =>  $_SESSION['mu_nvchon'],
            'string_login'  =>  $_SESSION['checklogin'],
            'passtransfer'    =>  $passtransfer
        ); 
        
        $reponse = _getContent($getcontent_url, $getcontent_data, $getcontent_method, $getcontent_curl);
        $data = unserialize_safe($reponse);
        if(is_array($data)) {
            
            $_SESSION['acc_gcoin'] = $data['acc_gcoin'];
            $_SESSION['acc_gcoin_km'] = $data['acc_gcoin_km'];
            $_SESSION['acc_vpoint'] = $data['acc_vpoint'];
            $_SESSION['acc_vpoint_km'] = $data['acc_vpoint_km'];
            $_SESSION['acc_zen'] = $data['acc_zen'];
            $_SESSION['acc_heart'] = $data['acc_heart'];
            $_SESSION['acc_chao'] = $data['acc_chao'];
            $_SESSION['acc_cre'] = $data['acc_cre'];
            $_SESSION['acc_blue'] = $data['acc_blue'];
            $_SESSION['acc_ppoint'] = $data['acc_ppoint'];
            $_SESSION['acc_ppoint_extra'] = $data['acc_ppoint_extra'];
            $_SESSION['IPBonusPoint'] = $data['acc_ipbonuspoint'];
            
            $_SESSION['nv_online'] = $data['online'];
			$_SESSION['nv_doinv'] = $data['doinv'];
			$_SESSION['nv_level'] = $data['nv_level'];
			$_SESSION['nv_point'] = $data['nv_point'];
			$_SESSION['nv_pointdutru'] = $data['nv_pointdutru'];
			$_SESSION['nv_zen'] = $data['nv_zen'];
			$_SESSION['nv_reset'] = $data['nv_reset'];
			$_SESSION['nv_resetday'] = $data['nv_resetday'];
			$_SESSION['nv_resetmonth'] = $data['nv_resetmonth'];
			$_SESSION['nv_relife'] = $data['nv_relife'];
			$_SESSION['nv_khoado'] = $data['nv_khoado'];
			$_SESSION['nv_uythaconline'] = $data['nv_uythacon'];
			$_SESSION['nv_point_uythac'] = $data['nv_pointuythac'];
            $_SESSION['nv_point_uythac_event'] = $data['nv_pointuythac_event'];
			$_SESSION['nv_uythac_offline'] = $data['nv_uythac_offline'];
			$_SESSION['nv_uythac_offline_time'] = $data['nv_uythac_offline_time'];
            $_SESSION['nv_uythac_offline_daily'] = $data['nv_uythac_offline_daily'];
            $_SESSION['nv_top50'] = $data['nv_top50'];
            $_SESSION['point_event'] = $data['nv_point_event'];
            $_SESSION['event1_type1'] = $data['nv_event1_type1'];
            $_SESSION['event1_type2'] = $data['nv_event1_type2'];
            $_SESSION['event1_type3'] = $data['nv_event1_type3'];
            $_SESSION['event1_type1_daily'] = $data['nv_event1_type1_daily'];
            $_SESSION['event1_type2_daily'] = $data['nv_event1_type2_daily'];
            $_SESSION['event1_type3_daily'] = $data['nv_event1_type3_daily'];
            $_SESSION['quest_daily'] = $data['qwait'];
            
            setcookie("nweb_loaddata", time(), time()+24*60*60);
        } else {
            setcookie("nweb_loaddata", time()+3600, time()+24*60*60);
        }
    }
}

function unserialize_safe($serialized) {
    // unserialize will return false for object declared with small cap o
    // as well as if there is any ws between O and :
    if (is_string($serialized) && strpos($serialized, "\0") === false) {
        if (strpos($serialized, 'O:') === false) {
            // the easy case, nothing to worry about
            // let unserialize do the job
            return @unserialize($serialized);
        } else if (!preg_match('/(^|;|{|})O:[0-9]+:"/', $serialized)) {
            // in case we did have a string with O: in it,
            // but it was not a true serialized object
            return @unserialize($serialized);
        }
    }
    return false;
}

function _json_fileload($filename)
{
	if(is_file($filename)) {
		$fopen_host = fopen($filename, "r");
        $file_read = fgets($fopen_host);
        
        $out_arr = json_decode($file_read, true);

	} else $fopen_host = fopen($filename, "w");
	fclose($fopen_host);
    
    if(!is_array($out_arr)) $out_arr = array();
	return $out_arr;
}


/**
 * _img_resize_view()
 * 
 * @param mixed $file_img (URL File)
 * @param string $width (Img Width Max)
 * @param string $height (IMG Height Max))
 * @return array(width, height)
 */
function _img_resize_view($file_img, $width = 'auto', $height = 'auto') {
    list($x, $y, $type, $attr) = getimagesize($file_img);
    
    if( $width !='auto' && $height != 'auto' ) {
        if( ($x/$y) > ($width/$height) ) {
            $height = 'auto';
        } else {
            $width = 'auto';
        }
    }
    
    if($width == 'auto' && is_numeric($height)){
		$width =($height/$y*100)*($x/100);
	}
	if($height == 'auto' && is_numeric($width)){
		$height = ($width/$x*100)*($y/100);
	}
    
    $out = array(
        'width'     =>  $width,
        'height'    =>  $height
    );
    
    return $out;
}

/**
 * read_TagName()
 * 
 * @param mixed $content
 * @param mixed $tagname
 * @param integer $vitri
 * $vitri = 0 : output All
 * $vitri = x : output Element x, Element 0 : Count Total Element
 * @return
 */
function read_TagName($content, $tagname, $vitri = 0)
{
    $tag_begin = '<'. $tagname . '>';
    $tag_end = '</'. $tagname . '>';
    $content1 = explode($tag_begin, $content);
    $slg_string = count($content1)-1;
    $output[] = $slg_string;    // Vị trí đầu tiên xuất ra số lượng phần tử
    for($i=1; $i<count($content1); $i++)    // Duyệt từ phần tử thứ 1 đến hết
    {
        $content2 = explode($tag_end, $content1[$i]);
        $output[] = $content2[0];
    }
    
    if($vitri == 0) return $output;
    else return isset($output[$vitri]) ? $output[$vitri] : null;
}

/**
 * _getContent()
 * 
 * @param string $url
 * @param array $data
 * @param string $method - GET OR POST
 * @param bool $use_curl - true OR false
 * @return
 */
function _getContent( $url, $data = null, $method = "GET", $use_curl = false ) {
    $file_logconnect = "data/log_connect.txt";
    $connect_err = false;
    $content = '';
    
    // Read Check Connect
    if(file_exists($file_logconnect)) {
        $fp = fopen($file_logconnect, "r");  
    	$data_read = fgets ($fp);
    	fclose($fp);
        
        $data_read_arr = explode('nbb', $data_read);
        if(isset($data_read_arr[2])) {
            $connect_status_read = $data_read_arr[1];
            $connect_time_read = $data_read_arr[2];
            
            if($connect_status_read == 0) {
                $time_now = time();
                if($connect_time_read > $time_now - 5) {
                    $time_wait = $connect_time_read + 5 - $time_now;
                    $content = "Kết nối đến Server đang xảy ra sự cố.<br /> Vui lòng chờ trong <strong>$time_wait giây</strong> rồi thực hiện lại. ";
                    $connect_err = true;
                }
            }
        }
    } else {
        $content = "Lỗi : Không tồn tại File : $file_logconnect";
        $connect_err = true;
    }
    // Read Check Connect _End
    
    if($connect_err === false) {
        if(!is_array($data)) $data = null;
        if( count($data) > 0 ) {
            $postdata = urldecode(http_build_query($data, '', '&'));
        }
        else $postdata = "";
        if($method != "POST") $method = "GET";
        
        if ( $use_curl === true ) {
            $ch = curl_init();
            if($method == "POST") {
                curl_setopt($ch,CURLOPT_URL, $url);
                curl_setopt($ch, CURLOPT_POST, 1);
                curl_setopt($ch, CURLOPT_POSTFIELDS, $postdata);
            } else {
                curl_setopt($ch, CURLOPT_URL,$url . "?" . $postdata);
            }
            //curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
            curl_setopt($ch, CURLOPT_HEADER, 0);
        	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        	curl_setopt($ch, CURLOPT_TIMEOUT, 120);
        	$content = curl_exec($ch);
        	curl_close($ch);
        } else {
            $opts = array(
                'http' => array(
                    'method'    =>  $method,
                    'content'   =>  $postdata
                )
            );
            $context = stream_context_create($opts);
            
            if($method == "GET" && $postdata) $url = $url . "?" . $postdata;
            $content = @file_get_contents($url, false, $context);
        }
        
        // Write Log Connect
        if(empty($content)) {
            $connect_status = 0;
        } else {
            $connect_status = 1;
        }
        $time_now = time();
        
        if(file_exists($file_logconnect)) {
            $data = "<nbb>$connect_status<nbb>$time_now<nbb>";
            $fp = fopen($file_logconnect, "w");  
        	fputs ($fp, $data);
        	fclose($fp);
        } else {
            $error = "Lỗi : Không tồn tại File : $file_logconnect";
        }
        // Write Log Connect _End
        
        setcookie("nweb_loaddata", time(), time()+24*60*60);
    }
    
	return $content;
}function spin_load($filename){	$stt = 0;	if(is_file($filename)) {		$fopen_host = fopen($filename, "r");		while (!feof($fopen_host)) {			$get_item = fgets($fopen_host);			$get_item = preg_replace('(\n)', '', $get_item);			if($get_item) {				$item_info = explode('|', $get_item);				$check_stat = substr($get_item,0,2);				if($check_stat == '//') $stat = 0;				else $stat = 1;				$stt++;				$item_read[] = array (					'stt'	=> $stt,					'type'	=> $item_info[0],					'code'	=> $item_info[1],					'des'	=> $item_info[2],					'number'	=> $item_info[3],					'percent'	=> $item_info[4],					'img'	=> $item_info[5],					'name'	=> $item_info[6],					'stat'	=> $stat				);			}		}	} 	else $fopen_host = fopen($filename, "w");	fclose($fopen_host);	return $item_read;}
?>