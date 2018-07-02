<?php
error_reporting(E_ALL ^ E_NOTICE);

$file_data = "forum_news/data_forum.txt";

$forum_arr[] = array(
    'url' => 'http://forum.muviet2015.net',
    'forumid' => '3,4',
    'news_slg' => 9,
    'news_title_trim' => 100,
    'order' =>  1               // ORDER by started time DESC
);

function _getContent2( $url, $data = null, $method = "GET", $use_curl = false ) {
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
        curl_setopt($ch, CURLOPT_HEADER, 0);
    	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    	curl_setopt($ch, CURLOPT_TIMEOUT, 5);
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
        
        if($method == "GET") {
            if(isset($postdata)) $url = $url . "?" . $postdata;
            $content = @file_get_contents($url);
        } else {
            $content = @file_get_contents($url, false, $context);
        }
    }
	return $content;
}

function _showtime($time) {
    date_default_timezone_set('Asia/Ho_Chi_Minh');
    $time_now = time();
    $time_begin_day_now = strtotime(date('Y-m-d', time()));
    $time_begin_yesterday = $time_begin_day_now - 24*60*60;
    if($time >= $time_begin_day_now) {
        $time_show = "<font color='red'><strong>". date('H:i', $time) ."</strong></font>";
    } elseif($time >= $time_begin_yesterday && $time < $time_begin_day_now) {
        $time_show = "<font color='blue'><strong>". date('d/m', $time) ."</strong></font> ". date('H:i', $time);
    } else {
        $time_show = "<strong>". date('d/m', $time) ."</strong> " .date('H:i', $time);
    }
    
    return $time_show;
}


if (!file_exists($file_data) || (file_exists($file_data) && (filemtime($file_data) < (time() - 5*60)))) {

    foreach ($forum_arr as $key => $forum) {
        $news_get = _getContent2($forum['url'], $forum, 'POST', true);
        $news_arr = json_decode($news_get, true);
        if ($news_arr !== false)
            $forum_arr[$key]['data'] = $news_arr;
    }

    //Ghi vao file
    $content = json_encode($forum_arr);
    if (strlen($content) > 500) {
        $fp = fopen($file_data, "w+");
        fputs($fp, $content);
        fclose($fp);
    } else {
        touch($file_data);
    }
    //End Ghi vao File
}

// Echo Data
$fp = fopen($file_data, "r");
$data = fgets($fp);
fclose($fp);
//$data = file_get_contents($file_data);
$data_arr = json_decode($data, true);
//echo "<pre>";
//print_r($data_arr);
//echo "</pre>";

?>

<div class="in-top-20">
    <table class="table table-blue table-border-1">
        <thead>
        <tr>
            <th colspan="2">Thông Báo - Sự Kiện</th>
        </tr>
        </thead>
        <tbody>
        <?php 
            foreach($data_arr as $key1 => $forum) {
                foreach ($forum['data'] as $forum_news) {
        ?>
        <tr>
            <td width="80%"><?php echo "<strong>". $forum_news['prefix_rich'] ."</strong>"; ?> <a href="<?php echo $forum_news['link'] . "?" . $forum_news['lastpost']; ?>" target="_blank"><?php echo $forum_news['title']; ?></a></td>
            <td><?php echo _showtime($forum_news['date']); ?></td>
        </tr>
        <?php } } ?>
        </tbody>
    </table>
</div>
