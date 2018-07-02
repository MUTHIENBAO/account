<?php

include('global.php');
$forum_url = "http://forum.mumanhlong.net";


$forum_id = $_POST['forumid'];
$news_slg = $_POST['news_slg'];      $news_slg = abs(intval($news_slg));
$news_title_trim = $_POST['news_title_trim'];    $news_title_trim = abs(intval($news_title_trim));
$order = $_POST['order'];    $order = abs(intval($order));			// 0 : lastest post, 1: started post

if(!isset($news_slg) || $news_slg == 0) $news_slg = 10;
if(!isset($news_title_trim) || $news_title_trim == 0) $news_title_trim = 70;
if(!isset($order) || $order != 1) $order = 0;


// Xuat tin
    $forum_news_arr = _get_news_forum($forum_url, $forum_id, $news_slg, $news_title_trim, $order);
    //$forum_news_arr['GET'] = $_GET;
    //$forum_news_arr['POST'] = $_POST;
    $forum_news = json_encode($forum_news_arr);
    //echo "<pre>";
    echo $forum_news;
    //print_r($forum_news_arr);
    //echo "</pre>";
// Xuat tin


/* ------------- UTF8 to Ascii ------------- */
/**
 * _utf8_to_ascii()
 * 
 * @param mixed $string
 * @return
 */
function _utf8_to_ascii($string){
        if(!$string) return false;
        $unicode = array(
            'a' => 'A|Á|À|Ả|Ã|Ạ|Ă|Ắ|Ằ|Ẳ|Ẵ|Ặ|Â|Ấ|Ầ|Ẩ|Ẫ|Ậ|á|à|ả|ã|ạ|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ',
            'b' =>  'B',
            'c' =>  'C',
            'd' => 'D|Đ|đ',
            'e' => 'E|É|È|Ẻ|Ẽ|Ẹ|Ê|Ế|Ề|Ể|Ễ|Ệ|é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ',
            'f' => 'F',
            'g' => 'G',
            'h' => 'H',
            'i' => 'I|Í|Ì|Ỉ|Ĩ|Ị|í|ì|ỉ|ĩ|ị',
            'j' => 'J',
            'k' => 'K',
            'l' => 'L',
            'm' => 'M',
            'n' => 'N',
            'o' => 'O|Ó|Ò|Ỏ|Õ|Ọ|Ô|Ố|Ồ|Ổ|Ỗ|Ộ|Ơ|Ớ|Ờ|Ở|Ỡ|Ợ|ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ',
            'p' => 'P',
            'q' => 'Q',
            'r' => 'R',
            's' => 'S',
            't' => 'T',
            'u' => 'U|Ú|Ù|Ủ|Ũ|Ụ|Ư|Ứ|Ừ|Ử|Ữ|Ự|ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự',
            'v' => 'V',
            'w' => 'W',
            'x' => 'X',
            'y' => 'Y|Ý|Ỳ|Ỷ|Ỹ|Ỵ|ý|ỳ|ỷ|ỹ|ỵ',
            'z' => 'Z'
        );
        foreach($unicode as $nonUnicode=>$uni) $string = preg_replace("/($uni)/i",$nonUnicode,$string);
    return $string;
}

/**
 * clean_entities()
 * 
 * @param mixed $string
 * @return
 */
function _clean_entities($string)
	{
	   $CLEAN_URL_REGEX = '*([\s$+,./:=\?@"\'<>%{}()|\\*^~[\]`\r\n\t\x00-\x1f\x7f]|(?(?<!&)#|#(?![0-9]+;))|&(?!#[0-9]+;)|(?<!&#\d|&#\d{2}|&#\d{3}|&#\d{4}|&#\d{5});)*s';
		$string = preg_replace($CLEAN_URL_REGEX, '-', strip_tags($string));
		$string = trim(preg_replace('#-+#', '-', $string), '-');

		return $string;
	}

// Ky tu dac biet
/**
 * unhtmlspecialchars()
 * 
 * @param mixed $string
 * @return
 */
function _unhtmlspecialchars( $string )
{
    $string = str_replace ( '&amp;', '&', $string );
    $string = str_replace ( '&#039;', '\'', $string );
    $string = str_replace ( '&quot;', '"', $string );
    $string = str_replace ( '&lt;', '<', $string );
    $string = str_replace ( '&gt;', '>', $string );
    
    return $string;
}

/**
 * url_friently()
 * 
 * @param mixed $string
 * @return
 */
function _url_friently($string) {
    $string = str_replace ( 'amp', '-', $string );
    $string = str_replace ( '039', '-', $string );
    $string = str_replace ( 'quot', '-', $string );
    $string = str_replace ( 'lt', '-', $string );
    $string = str_replace ( 'gt', '-', $string );
    $string = _utf8_to_ascii($string);
    $string = _clean_entities($string);
    $string = _unhtmlspecialchars($string);
    return $string;
}

function _subword($str, $len) {
    $str = str_replace('  ', ' ', $str);
    $str_explode = explode(' ', $str);
    $str_explode_total = count($str_explode);

    $str_new = '';    
    for($i=0; $i<$str_explode_total; ++$i) {
        if($i == 0) {
            $str_new = $str_explode[0];
        }
        elseif(strlen($str_new . ' ' . $str_explode[$i]) < $len) {
            $str_new .= ' ' . $str_explode[$i];
        } else {
            break;
        }
    }
    
    return $str_new;
}

function _trip_bbcode($bbcode_str, $bbcode_allow) {
    $bbcode_str_quote = str_replace(array('[',']'), array('<','>'), $bbcode_str);
    $bbcode_allow_quote = str_replace(array('[',']'), array('<','>'), $bbcode_allow);
    $bbcode_str_strip = strip_tags($bbcode_str_quote, $bbcode_allow_quote);
    $bbcode_str_output = str_replace(array('<','>'), array('[',']'), $bbcode_str_strip);
    
    return $bbcode_str_output;
}

function is_odd($intNumber) 
{ 
    if ($intNumber % 2 == 0 ) return true; 
    else return false; 
} 

function badlink($link, $prefix) { 
    if ($prefix == "mailto:") { 
        if (strpos($link, "@") === FALSE || strpos($link, ".", (strpos($link, "@")+2)) === FALSE || substr_count($link, "@") > 1 || strpos($link, "@") == 0) { 
            return 1; 
        } 
    } 
    if (strpos($link, ".") == 0 || strpos($link, ".") == strlen($link) || (strpos($link, "/") < strpos($link, ".") && strpos($link, "/") !== FALSE)) { 
        return 1;  
    } 
}; 
    
function setlinks($r, $prefix) { 
    if (substr($r, 0, strlen($prefix)) == $prefix) { 
        $r = "\n".$r; 
    } 
    $r = str_replace("<br>".$prefix, "<br>\n".$prefix, $r); 
    $r = str_replace(" ".$prefix, " \n".$prefix, $r); 
    while (strpos($r, "\n".$prefix) !== FALSE) { 
        list($r1, $r2) = explode("\n".$prefix, $r, 2); 
        if (strpos($r2, " ") === FALSE && strpos($r2, "<br>") === FALSE) { 
            if ($prefix != "mailto:") { 
                $target = ' target="_blank"'; 
                } 
            else { 
                $target = ""; 
                } 
            if (strpos($r2, ".") > 1 && strpos($r2, ".") < strlen($r2) && badlink($r2, $prefix) != 1) { 
                $r = $r1.'<a href="'.$prefix.$r2.'"'.$target.'><font size="2" color="blue">'.$prefix.$r2.'</font></a>'; 
                } 
            else { 
                $r = $r1.$prefix.$r2; 
                } 
            } 
        else { 
            if (strpos($r2, " ") === FALSE || ( strpos($r2, " ") > strpos($r2, "<br>") && strpos($r2, "<br>") !== FALSE)) { 
                list($r2, $r3) = explode("<br>", $r2, 2); 
                if (badlink($r2, $prefix) != 1) { 
                    $r = $r1.'<a href="'.$prefix.$r2.'"'.$target.'><font size="3" color="blue">'.$prefix.$r2.'</font></a><br>'.$r3; 
                    } 
                else { 
                    $r = $r1.$prefix.$r2.'<br>'.$r3; 
                    } 
                } 
            else { 
                list($r2, $r3) = explode(" ", $r2, 2); 
                if (strpos($r2, ".") > 1 && strpos($r2, ".") < strlen($r2) && badlink($r2, $prefix) != 1) { 
                    $r = $r1.'<a href="'.$prefix.$r2.'"'.$target.'><font size="3" color="blue">'.$prefix.$r2.'</font></a> '.$r3; 
                    } 
                else { 
                    $r = $r1.$prefix.$r2.' '.$r3; 
                    } 
                } 
            } 
        } 
    return $r; 
}; 


function bb($r) 
{ 

    $r = trim($r); 
    //$r = htmlentities($r); 
    $r = str_replace("\r\n","<br>",$r); 
    $r = str_replace("[B]","<b>",$r); 
    $r = str_replace("[/B]","</b>",$r); 
    $r = str_replace("[IMG]","<img src='",$r); 
    $r = str_replace("[/IMG]","'>",$r); 
    $r = str_replace("[IMG]","<img src='",$r); 
    $r = str_replace("[/IMG]","'>",$r); 
    $r = str_replace("[S]","<s>",$r); 
    $r = str_replace("[/S]","</s>",$r); 
    $r = str_replace("[UL]","<ul>",$r); 
    $r = str_replace("[/UL]","</ul>",$r); 
    $r = str_replace("[LI]","<li>",$r); 
    $r = str_replace("[/LI]","</li>",$r); 
    $r = str_replace("[OL]","<ol>",$r); 
    $r = str_replace("[/OL]","</ol>",$r); 
    $r = str_replace("[QUOTE","<br /><table width='80%' bgcolor='#ffff66' align='center'><tr><td style='border: 1px dotted black'><font color=black><b>Quote:<br></b>",$r); 
    $r = str_replace("[/QUOTE]","</font></td></tr></table>",$r); 
    $r = str_replace("[I]","<i>",$r); 
    $r = str_replace("[/I]","</i>",$r); 
    $r = str_replace("[U]","<u>",$r); 
    $r = str_replace("[/U]","</u>",$r); 
    $r = str_replace("[SPOILER]",'[spoiler]<font bgcolor ="#000000" color="#DDDDDD">',$r); 
    $r = str_replace("[/SPOILER]","</font>[/spoiler]",$r); 
    $r = str_replace("[CENTER]","<center>",$r); 
    $r = str_replace("[/CENTER]","</center>",$r); 
    
    //set [link]s 
    while (strpos($r, "[link=") !== FALSE) 
    { 
        list ($r1, $r2) = explode("[link=", $r, 2); 
        if (strpos($r2, "]") !== FALSE) { 
            list ($r2, $r3) = explode("]", $r2, 2); 
            if (strpos($r3, "[/link]") !== FALSE) { 
                list($r3, $r4) = explode("[/link]", $r3, 2); 
                $target = ' target="_blank"'; 
                if (substr($r2, 0, 7) == "mailto:") { 
                    $target = ""; 
                } 
                $r = $r1.'<a href="'.$r2.'"'.$target.'><font size="3" color="blue">'.$r3.'</font></a>'.$r4; 
            } 
            else { 
                $r = $r1."[link\n=".$r2."]".$r3; 
            } 
        } 
        else { 
            $r = $r1."[link\n=".$r2; 
        } 
    } 
    $r = str_replace("[link\n=","[link=",$r); 
    ////[link] 
    
    ///default url link setting 
    $r = setlinks($r, "http://"); 
    $r = setlinks($r, "https://"); 
    $r = setlinks($r, "ftp://"); 
    $r = setlinks($r, "mailto:"); 
    ////links 
    
    $r = trim($r); 
    return $r; 

} 

function _get_news_forum($forum_url, $forum_id = 1, $limit = 1, $txtlimit = 50, $order = 0) {
    
    if (isset($forum_id) && ( (strlen($forum_id) == 1 && $forum_id != 0) || strlen($forum_id) > 1 )) {
    	$forumid = "AND forumid IN ($forum_id)";
    }
    
    if ($limit) {
    	$limited = "LIMIT 0,$limit";
    }
    
    if($order == 1) {
    	$order_query = "t.dateline DESC";
    } else {
    	$order_query = "t.lastpost DESC";
    }
    
    $thread_sql = mysql_query("SELECT t.threadid, t.title, t.dateline, prefixid, p.username, p.pagetext, forumid, firstpostid, lastpostid, t.visible, open FROM thread AS t JOIN post AS p ON t.firstpostid=p.postid $forumid ORDER BY ". $order_query ." $limited");
    
    $content = array();
    while($thread_get=mysql_fetch_array($thread_sql))
    {
        $tid = $thread_get['threadid'];
        $title = $thread_get['title'];  $titlefull = $title;
        $timepost = $thread_get['dateline'];
        $username = $thread_get['username'];
        $first_content = bb($thread_get['pagetext']);   if(strlen($first_content)>1000) $first_content = "<b><font color='red'>Nội dung dài...</font></b>";
        $firstpostid = $thread_get['firstpostid'];
        $lastpostid = $thread_get['lastpostid'];
        $visible = $thread_get['visible'];
        $open = $thread_get['open'];
        
        $prefixid = $thread_get['prefixid'];
        
        $lastpost_time = $timepost;
        $lastpost_user = $username;
        $reply_arr = array();
        $reply_query = "SELECT username, pagetext, dateline FROM post WHERE threadid={$tid} AND postid <> {$firstpostid} ORDER BY postid DESC LIMIT 0,3";
        $reply_result = mysql_query($reply_query);
        while($reply_get = mysql_fetch_array($reply_result)) {
            $reply_arr[] = array(
                'username'  =>  $reply_get['username'],
                'reply_post'    =>  (strlen(bb($reply_get['pagetext']))>1000 ? "<b><font color='red'>Nội dung dài...</font></b>" : bb($reply_get['pagetext'])),
                'reply_time'    =>  $reply_get['dateline']
            );
            
            if($lastpost_time < $reply_get['dateline']) {
                $lastpost_time = $reply_get['dateline'];
                $lastpost_user = $reply_get['username'];
            }
        }
        $reply_count = count($reply_arr);
        if($reply_count > 1) {
            $reply_arr_tg = $reply_arr;
            $reply_arr = array();
            for($i=$reply_count-1; $i>=0; $i--) {
                $reply_arr[] = $reply_arr_tg[$i];
            }
        }
        
        
        if(strlen($prefixid) > 0) {
            $prefix_query = "SELECT varname, text FROM phrase WHERE varname='prefix_". $prefixid ."_title_rich'";
            $prefix_result = mysql_query($prefix_query);
            while($prefix_fetch = mysql_fetch_array($prefix_result)) {
                if($prefix_fetch['varname'] == 'prefix_'. $prefixid .'_title_plain') {
                    $prefix_plain = $prefix_fetch['text'];
                } else if($prefix_fetch['varname'] == 'prefix_'. $prefixid .'_title_rich') {
                    $prefix_rich = $prefix_fetch['text'];
                }
            }
        }
        
        $forumid = $thread_get['forumid'];
        $forum_title_query = "SELECT title FROM forum WHERE forumid='$forumid'";
        $forum_title_result = mysql_query($forum_title_query);
        $forum_title_fetch = mysql_fetch_array($forum_title_result);
        $forum_title = $forum_title_fetch['title'];
        
        $title_short = _subword($title, $txtlimit - strlen($prefix_plain));
        if(strlen($title_short) < strlen($title)) $title_short .= "...";
        
        $url_title = _url_friently($titlefull);
        
        $content[] = array(
            'title' =>  $titlefull,
            'title_short'   =>  $title_short,
            'prefix_plain'  =>  $prefix_plain,
            'prefix_rich'  =>  $prefix_rich,
            'username'  =>  $username,
            'text'  =>  $first_content,
            'forum_title'   =>  $forum_title,
            'link'  =>  $forum_url ."/showthread.php?". $tid ."-". $url_title,
            'date'  =>  $timepost,
            'lastpost_time'  =>  $lastpost_time,
            'lastpost_user'    =>  $lastpost_user,
            'visible'  =>  $visible,
            'open'  =>  $open,
            'reply' =>  $reply_arr
            
        );
    }
    return $content;
}
    
?>