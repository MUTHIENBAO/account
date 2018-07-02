<?php

/**
 * @author NetBanBe
 * @copyright 2015
 */

include('config/config_facebook.php');

$fb_show = 0;
$fb_like_fanpage = 0;
if(isset($use_facebook) && $use_facebook == 1) {
    if(isset($fb_fanpage_url) && strlen($fb_fanpage_url) > 8 && $_SESSION['fb_fanpage_like'] != 1) {
        $fb_show = 1;
        $fb_like_fanpage = 1;
    }
    
    if(is_array($fb_post_link) && count($fb_post_link) > 0) {
        $fb_post_link_count = count($fb_post_link);
        $time_now = time();
        for($i=0; $i<$fb_post_link_count; $i++) {
            if(strtotime($fb_post_time[$i]) + 24*60*60 > $time_now) {
                $fb_post_link_new[] = $fb_post_link[$i];
                if($fb_show == 0) $fb_show = 1;
            }
        }
    }

    if(count($fb_post_link_new) > 0) $fb_post_link_get = $fb_post_link_new[array_rand($fb_post_link_new)];
}

?>