<?php
    if(strlen($_SESSION['acc_phone']) <= 0) {
?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Cập nhập Thông tin tài khoản</h1>
        <div class="form-1">
            <div class="form-1-row">
                <div class="form-1-col-1"><span>Tài khoản</span></div>
                <div class="form-1-col-2"><span class="tag tag-orange"><?php echo isset($_SESSION['mu_username']) ? $_SESSION['mu_username'] : 'demo'; ?></span></div>
                <div class="form-1-col-3">&nbsp;</div>
            </div>
            <div class="out-top-20">
                <div class='error out-bottom-10'>Thông tin tài khoản chưa đầy đủ. Vui lòng cập nhật thêm.</div>
                <a href="#acc_manager&act=update_acc_info" rel="ajax" class="btn btn-block btn-green btn-lg" >Cập nhật thêm</a>
            </div>
        </div>
    </div>
</div>
<?php
    }
?>

<div class="primary-block out-top-20">
    <ul class="menu-main-tabs">
        <li class="main-tab active"><a href="javascript:;">Chú Ý</a></li>
        <!--<li class="main-tab"><a href="javascript:;">Giờ sự Kiện Game</a></li>-->
    </ul>
    
    <div class="in-20" >
        <ul class="content-main-tabs">
            <li class="content-m-tab active">
                <?php
                    // KM Card
                    include('config/config_napthe.php');
                    if(isset($khuyenmai_begin) && isset($khuyenmai_end) && strtotime($khuyenmai_begin) <= time() && (strtotime($khuyenmai_end) + 24*60*60 - 1) >= time() && $khuyenmai_phantram > 0) {
                        $khuyenmai_begin_date = date('d/m', strtotime($khuyenmai_begin));
                        $khuyenmai_end_date = date('d/m', strtotime($khuyenmai_end));
                        
                        echo "<center>Hiện đang <span class='tag tag-orange'>Khuyến mại nạp thẻ</span> : <span class='tag tag-red'>$khuyenmai_phantram%</span> từ 0h $khuyenmai_begin_date - 24h $khuyenmai_end_date.</center><br /><br />";
                    } else {
                        $day_of_week = date('w', time());
                        $khuyenmai_phantram = $khuyenmai_week_phantram[$day_of_week];
                        if($khuyenmai_phantram > 0) {
                            echo "<center>Hiện đang <span class='tag tag-orange'>Khuyến mại nạp thẻ</span> : <span class='tag tag-red'><strong>$khuyenmai_phantram%</strong></span> trong ngày.</center><br /><br />";
                        }
                    }
                    
                    // KM Card End
                    
                    
                    $config_notice = file_get_contents('config/config_notice.txt');
                    $config_notice = htmlspecialchars_decode(urldecode($config_notice));
                    echo "<div class='info_noimg'>". $config_notice ."</div>";
                ?>
            </li>
            
            <!--<li class="content-m-tab">
                <script>
                $(document).ready(function() {
                    $('[data-countdown]').each(function() {
                        var $this = $(this), finalDate = $(this).data('countdown');
                        $this.countdown(finalDate, function(event) {
                            $this.html(event.strftime('%H:%M:%S'));
                        });
                    });
                });
                </script>
                
                <div class="form-1">
                    <?php
                        foreach($eventgame_show_arr as $eventgame_k => $eventgame_v) { 
                            foreach($eventgame_v as $eventgame_k2 => $eventgame_v2) { 
                    ?>
                    <div class="form-1-row">
                        <div class="form-1-col-1_event"><span><?php echo $eventgame_v2['name']; ?></span></div>
                        <div class="form-1-col-2_event"><span class="tag tag-orange"><?php echo $eventgame_v2['server']; ?></span></div>
                        <div class="form-1-col-3_event"><span class="tag tag-green"><?php echo $eventgame_v2['timer_show']; ?></span> <span data-countdown="<?php echo $eventgame_v2['timer']; ?>">&nbsp;</span></div>
                    </div>
                    <?php } } ?>
                </div>
                
                <div class="form-1">
                    <center>
                        <strong>Kundun</strong><br />
                        Cập nhập <?php echo date('H:i', $data_arr['kudnun']['timecheck']); ?> (5 phút cập nhập 1 lần)
                    </center>
                    <?php
                        if(is_array($data_arr['kudnun']['data'])) {
                            foreach($data_arr['kudnun']['data'] as $kundun_k => $kundun_v) { 
                                if($kundun_v['stat'] == 1) {
                                    $kundun_stat = "Đang có";
                                } else {
                                    $kundun_stat = $kundun_v['next'];
                                }
                    ?>
                    <div class="form-1-row">
                        <div class="form-1-col-1_event"><span><?php echo $kundun_v['server']; ?></span></div>
                        <div class="form-1-col-2_event"><span class="tag tag-orange"><?php echo $kundun_stat; ?></span></div>
                        <?php if($kundun_v['stat'] == 0) { ?> 
                        <div class="form-1-col-3_event"><span class="tag tag-red" data-countdown="<?php echo $kundun_v['date_next']; ?>" >&nbsp;</span></div>
                        <?php } ?>
                    </div>
                    <?php } } ?>
                </div>
            </li>-->
        </ul>
    </div>
</div>

<?php
    if(!isset($_SESSION['popup_notice'])) $_SESSION['popup_notice'] = 0;
    if(time() - $_SESSION['popup_notice'] > 15*60) {
?>
<a id="fancybox_popup_link" href="#fancybox_popup" style="display:none">Show Popup</a>
<div style="display:none">
<div class="priority-block out-top-20" id="fancybox_popup" style="width: 600px;">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Chú Ý</span></h1>
    </div>
    <div class="in-20">
    <?php
        include('config/config_ipbonus.php');
        if(isset($use_ipbonus) && $use_ipbonus == 1) {
            echo "<strong>IP Bonus</strong> :<br />";
            echo '<ul class="noted in-left-10">';
            echo '<li>'. $_SESSION['ipbonus_info'] .'</li>';
            echo '<li><a href="#acc_manager&act=ipbonus_list" rel="ajax">Danh sách quán NET đăng ký IP Bonus và Ưu Đãi</a></li>';
            echo '</ul>';
        }
    ?>
    </div>
</div>
</div>
<?php
        $_SESSION['popup_notice'] = time();
    }
?>

<!--<?php include('forum_news/getdata.php'); ?>-->

<div class="primary-block out-top-20">
    <div class="main-content">
        <h1 class="title-content">Thông tin tài khoản</h1>
        <div class="form-1">
            <div class="form-1-row">
                <div class="form-1-col-1"><span>Tài khoản</span></div>
                <div class="form-1-col-2"><span class="tag tag-orange"><?php echo isset($_SESSION['mu_username']) ? $_SESSION['mu_username'] : 'demo'; ?></span></div>
                <div class="form-1-col-3">&nbsp;</div>
            </div>
			<!--
			<?php if($_SESSION['acc_vip'] > 0) { ?>
            <div class="form-1-row">
                <div class="form-1-col-1"><span>Tình trạng VIP</span></div>
                <div class="form-1-col-2">
					<div class="image-vip-title vip-<?php echo $_SESSION['acc_vip']; ?>"></div>(Còn: <?php echo $vip_days_left; ?> ngày <?php echo $vip_hours_left; ?> giờ <?php echo $vip_mins_left; ?> phút)
				</div>
                <div class="form-1-col-3">&nbsp;</div>
            </div>
			<?php } else { ?>
            <div class="form-1-row">
                <div class="form-1-col-1"><span>Tình trạng VIP</span></div>
                <div class="form-1-col-2">
					<font color="red">Chưa nâng cấp VIP</font>
				</div>
                <div class="form-1-col-3"><a href="#vip_system" rel="ajax" class="btn btn-orange btn-icon-setup">Nâng cấp</a></div>
            </div>
			<?php } ?>-->
            <?php
                if(strlen($_SESSION['acc_phone']) > 0) {
            ?>
            <div class="form-1-row">
                <div class="form-1-col-1"><span>Mật khẩu Game</span></div>
                <div class="form-1-col-2">******</div>
                <div class="form-1-col-3"><a href="#acc_manager&act=changepassgame_info" rel="ajax" class="btn btn-green btn-icon-setup">Chỉnh sửa</a></div>
            </div>
            <div class="form-1-row">
                <div class="form-1-col-1"><span>Mật khẩu Web 1</span></div>
                <div class="form-1-col-2">******</div>
                <div class="form-1-col-3"><a href="#acc_manager&act=changepass1_info" rel="ajax" class="btn btn-green btn-icon-setup">Chỉnh sửa</a></div>
            </div>
            <div class="form-1-row">
                <div class="form-1-col-1"><span>Mật khẩu Web 2</span></div>
                <div class="form-1-col-2">******</div>
                <div class="form-1-col-3"><a href="#acc_manager&act=changepass2_info" rel="ajax" class="btn btn-green btn-icon-setup">Chỉnh sửa</a></div>
            </div>
            <div class="form-1-row">
                <div class="form-1-col-1"><span>Email</span></div>
                <div class="form-1-col-2"><?php echo isset($_SESSION['acc_email']) ? $_SESSION['acc_email'] : 'demo'; ?></div>
                <div class="form-1-col-3"><a href="#acc_manager&act=changeemail_info" rel="ajax" class="btn btn-green btn-icon-setup">Chỉnh sửa</a></div>
            </div>
            <div class="form-1-row">
                <div class="form-1-col-1"><span>Số điện thoại</span></div>
                <div class="form-1-col-2">*******<?php echo isset($_SESSION['acc_phone']) ? $_SESSION['acc_phone'] : 'demo'; ?></div>
                <div class="form-1-col-3"><a href="#acc_manager&act=changesdt_sms" rel="ajax" class="btn btn-green btn-icon-setup">Chỉnh sửa</a></div>
            </div>
            <div class="form-1-row">
                <div class="form-1-col-1"><span>Câu hỏi bí mật</span></div>
                <div class="form-1-col-2">&nbsp;</div>
                <div class="form-1-col-3"><a href="#acc_manager&act=changequest" rel="ajax" class="btn btn-green btn-icon-setup">Chỉnh sửa</a></div>
            </div>
            <div class="form-1-row">
                <div class="form-1-col-1"><span>Câu trả lời bí mật</span></div>
                <div class="form-1-col-2">&nbsp;</div>
                <div class="form-1-col-3"><a href="#acc_manager&act=changeans" rel="ajax" class="btn btn-green btn-icon-setup">Chỉnh sửa</a></div>
            </div>
			
			<div class="form-1-row">
                <div class="form-1-col-1"><span>7 Số bí mật</span></div>
                <div class="form-1-col-2">*******<?php echo isset($_SESSION['acc_phone']) ? $_SESSION['acc_phone'] : 'demo'; ?></div>
                <div class="form-1-col-3"><a href="#acc_manager&act=changesnonumb" rel="ajax" class="btn btn-green btn-icon-setup">Chỉnh sửa</a></div>
            </div>

            <?php
                }
            ?>
            
            
            
        </div>
        
        
    </div>
</div>