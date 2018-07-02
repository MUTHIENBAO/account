<div class="primary-block in-top-20">
    <div class="main-content">
        <?php if(!isset($_SESSION['mu_nvchon'])) { ?>
        <script>
            $(document).ready(function() {
                $('.blackBg').show();
                $(".character-wrap-block").addClass('guideShow');
                $('.blackBg').click(function(){
                    $('.blackBg').hide();
                    $(".character-wrap-block").removeClass('guideShow');
                });
            });
        </script>
        <?php } else { ?>
        <div class="main-character">
            <div class="image-character character-<?php echo $_SESSION['nv_class']; ?>">
                <span class="charactername"><? echo $_SESSION['mu_nvchon']; ?></span>
				<?php if($Use_VIP == 2) { ?>
					<?php if($_SESSION['acc_vip'] > 0) { ?>
						<a href="#vip_system"><div class="image-vip vip-<?php echo $_SESSION['acc_vip']; ?>"></div></a>
					<?php } else { ?>
						<a href="#vip_system" title="Nâng cấp VIP"><div class="image-vip upgrade-vip vip-2"></div></a>
					<?php } ?>
				<?php } ?>	
            </div>
            <div class="info-character">
                <ul class="list-info">
                    <li class="list-col">
                        <div class="list-row">
                            <div class="label-info"><span class="color-orange">Reset</span> / <span class="color-blue">Relife</span></div>
                            <div class="text-info"><span class="tag tag-orange tag-bold"><?php echo $_SESSION['nv_reset']; ?></span> <span class="tag tag-blue tag-bold"><?php echo $_SESSION['nv_relife']; ?></span> </div>

                        </div>
                        <div class="list-row">
                            <div class="label-info">Reset ngày / tháng</div>
                            <div class="text-info"><?php echo $_SESSION['nv_resetday']; ?> / <? echo $_SESSION['nv_resetmonth']; ?></div>
                        </div>
                        <div class="list-row">
                            <div class="label-info">Level</div>
                            <div class="text-info"><?php echo $_SESSION['nv_level']; ?></div>
                        </div>
                        <div class="list-row">
                            <div class="label-info">Zen trên người</div>
                            <div class="text-info"><?php echo number_format($_SESSION['nv_zen']); ?></div>
                        </div>
                        <div class="list-row">
                            <div class="label-info">Master : Lvl / P / P+thêm</div>
                            <div class="text-info"><?php echo $_SESSION['nv_MasterLevel']; ?> / <?php echo $_SESSION['nv_MasterPoints']; ?> / <?php echo $_SESSION['nv_nbb_pmaster']; ?></div>
                        </div>
                        <div class="list-row">
                            <div class="label-info">PP / PP+</div>
                            <div class="text-info">
                            <?php 
                                echo $_SESSION['acc_ppoint'].' / '.$_SESSION['acc_ppoint_extra'];
                                if(isset($Use_ShopPP) && $Use_ShopPP == 1) {
                                    echo '&nbsp;&nbsp;&nbsp; <a class="btn btn-green" rel="ajax" href="#chopl">Mua - Bán PP</a>';
                                }
                            ?>
                            </div>
                        </div>
                    </li>
                    <li class="list-col">
                        <div class="list-row">
                            <div class="label-info">Point dư / Point dự trữ</div>
                            <div class="text-info">
                            <?php 
                                echo $_SESSION['nv_point'].' / '.$_SESSION['nv_pointdutru'];
                                if($_SESSION['nv_point'] >  0 || $_SESSION['nv_pointdutru'] > 0) {
                                    echo '&nbsp;&nbsp;&nbsp; <a class="btn btn-green" rel="ajax" href="#char_manager&act=addpoint">Cộng điểm</a>';
                                }
                            ?>
                            </div>
                        </div>
                        <div class="list-row">
                            <div class="label-info">Point event huy chương</div>
                            <div class="text-info"><?php echo isset($_SESSION['point_event']) ? number_format($_SESSION['point_event'], 0, ',', '.') : 0; ?></div>
                        </div>
                        <div class="list-row">
                            <div class="label-info">Lần PK</div>
                            <div class="text-info"><?php echo $_SESSION['PkCount']; ?></div>
                        </div>
                        <div class="list-row">
                            <div class="label-info">Ủy thác Offline</div>
                            <div class="text-info"><?php echo isset($_SESSION['nv_uythac_offline_time']) ? $_SESSION['nv_uythac_offline_time'] : 0; ?> phút </div>
                        </div>
                        <div class="list-row">
                            <div class="label-info">Ủy thác (Điểm)</div>
                            <div class="text-info"><?php echo $_SESSION['nv_point_uythac']; ?></div>
                        </div>
                        <div class="list-row">
                            <div class="label-info">Đổi nhân vật</div>
                            <div class="text-info"><?php echo $doinv; ?></div>
                        </div>
                        <div class="list-row">
                            <div class="label-info">Trạng thái online</div>
                            <div class="text-info"><?php echo $online; ?></div>
                        </div>
                        <div class="list-row">
                            <div class="label-info">Khóa đồ</div>
                            <div class="text-info"><a href="#char_manager&act=khoaitem"><?php if($_SESSION[nv_khoado] == 18){ ?><span class="tag tag-green">Đã khóa</span><?php } else { ?><span class="tag tag-red">Chưa khóa</span><?php } ?> </a></div>
                        </div>
                        <div class="list-row">
                            <div class="label-info">Bùa Exp</div>
                            <div class="text-info">
                            <?php 
                                echo $_SESSION['SCFSealItem'];
                                if(isset($buats_use) && $buats_use == 1) {
                                    echo '&nbsp;&nbsp;&nbsp; <a class="btn btn-green" rel="ajax" href="#char_manager&act=buats">Mua Bùa TS</a>';
                                }
                            ?>
                            </div>
                        </div>
                        <div class="list-row">
                            <div class="label-info"></div>
                            <div class="text-info"><?php echo $_SESSION['SCFSealTime']; ?></div>
                        </div>
                        <div class="list-row">
                            <div class="label-info">Bùa Thuộc Tính</div>
                            <div class="text-info"><?php echo $_SESSION['SCFScrollItem']; ?></div>
                        </div>
                        <div class="list-row">
                            <div class="label-info"></div>
                            <div class="text-info"><?php echo $_SESSION['SCFScrollTime']; ?></div>
                        </div>
                    </li>
                </ul>
                <div class="buttons-character">
                    
                    <a class="btn btn-green" rel="ajax" href="#char_manager&act=reset">Reset</a>
                    <a class="btn btn-green" rel="ajax" href="#char_manager&act=rsmaster">Reset điểm Master</a>
                    <a class="btn btn-green" rel="ajax" href="#char_manager&act=jewel2bank">Gửi Jewel</a>
                    <a class="btn btn-green" rel="ajax" href="#char_manager&act=uythacoffline">Ủy thác Offline</a>
                    <a class="btn btn-green" rel="ajax" href="#char_manager&act=pk">Rửa tội</a>
                    <a class="btn btn-green" rel="ajax" href="#char_manager&act=move">Di chuyển</a>
                    <a class="btn btn-green" rel="ajax" href="#char_manager&act=resetpoint">Tẩy điểm</a>
                    <a class="btn btn-green" rel="ajax" href="#char_manager&act=khoaitem">Khóa item</a>					<a class="btn btn-blue" rel="ajax" href="#char_manager&act=taytuy">Tẩy Tủy</a>
                    <?php 
                        if(isset($Use_QuestDaily) && $Use_QuestDaily == 1) {
                            if(isset($_SESSION['quest_daily']) && $_SESSION['quest_daily']>0) {
                                $char_manager_nvhn_note = '<span class="badge">'. $_SESSION['quest_daily'] .'</span>';
                            }
                    ?>
					<a class="btn btn-orange" rel="ajax" href="#char_manager&act=questdaily">Nhiệm vụ Hàng ngày <?php echo $char_manager_nvhn_note; ?></a> 
                    <?php } ?>
					<?php if (isset($Use_ChangeName) && $Use_ChangeName == 1) { ?>
						<a class="btn btn-blue" rel="ajax" href="#char_manager&act=changename" rel="ajax">Đổi tên nhân vật</a></li>
					<?php } ?>
                    <?php if (isset($Use_TuLuyen) && $Use_TuLuyen == 1) { ?>
                    &nbsp;<a class="btn btn-blue" rel="ajax" href="#char_manager&act=tuluyen">Tu Luyện</a>
                    <?php } ?>
                    
                    <?php if (isset($Use_WareHouse_Secure) && $Use_WareHouse_Secure == 1) { ?>
                    &nbsp;<a class="btn btn-orange" rel="ajax" href="#acc_manager&act=warehouse_secure">Rương đồ An Toàn <span class="badge"><strong><?php echo $_SESSION['acc_warehouse_secure_item']; ?></strong> / <strong><?php echo $_SESSION['acc_warehouse_secure_slot']; ?></strong></span></a>
                    <?php } ?>
                    
                    <?php if(isset($quest3_use) && $quest3_use == 1 && in_array($_SESSION['nv_class'], array(0,1,16,17,32,33,48,64,80,81,96))) { ?>
                    <a class="btn btn-green" rel="ajax" href="#char_manager&act=quest3">Làm nhiệm vụ Cấp 3</a>
                    <?php } ?>
                    
                    <hr />
                    <?php 
                    if ( (isset($Use_TopAuto_RS_Day) && $Use_TopAuto_RS_Day == 1) || (isset($Use_TopAuto_RS_Week) && $Use_TopAuto_RS_Week == 1) || (isset($Use_TopAuto_RS_Month) && $Use_TopAuto_RS_Month == 1) ) { 
                        if(isset($Use_TopAuto_RS_Day) && $Use_TopAuto_RS_Day == 1) $date_link = 'day';
                        elseif(isset($Use_TopAuto_RS_Week) && $Use_TopAuto_RS_Week == 1) $date_link = 'week';
                        elseif(isset($Use_TopAuto_RS_Month) && $Use_TopAuto_RS_Month == 1) $date_link = 'month';
                    ?>
					<a class="btn btn-orange" rel="ajax" href="#event&act=event_top_auto&type=rs&date=<?php echo $date_link; ?>">TOP Bá Đạo</a> 
                    <?php } ?>
                    
                    <?php 
                    if ( (isset($Use_TopAuto_card_Day) && $Use_TopAuto_card_Day == 1) || (isset($Use_TopAuto_card_Week) && $Use_TopAuto_card_Week == 1) || (isset($Use_TopAuto_card_Month) && $Use_TopAuto_card_Month == 1) ) { 
                        if(isset($Use_TopAuto_card_Day) && $Use_TopAuto_card_Day == 1) $date_link = 'day';
                        elseif(isset($Use_TopAuto_card_Week) && $Use_TopAuto_card_Week == 1) $date_link = 'week';
                        elseif(isset($Use_TopAuto_card_Month) && $Use_TopAuto_card_Month == 1) $date_link = 'month';
                    ?>
					<a class="btn btn-blue" rel="ajax" href="#event&act=event_top_auto&type=card&date=<?php echo $date_link; ?>">TOP Bá Giả</a> 
                    <?php } ?>

                </div>
            </div>
        </div>
        <?php } ?>

    </div>
</div>

<div class="primary-block out-top-20">
    <ul class="menu-main-tabs">
        <li class="main-tab active"><a href="javascript:;">Chú Ý</a></li>
        <li class="main-tab"><a href="javascript:;">Giờ sự Kiện Game</a></li>
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
            
            <li class="content-m-tab">
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
            </li>
        </ul>
    </div>
</div>

<!--<?php include('forum_news/getdata.php'); ?>-->