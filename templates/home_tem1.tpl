<?php if(isset($_SESSION['mu_username'])){ include('templates/acc_manager.tpl'); }else{ ?>

<div class="home-login-block">
    <div class="home-login">
        <div class="primary-block">
            <div class="login-block">
                <p class="login-text">Đăng nhập</p>

                <form class="form-login" action="" id="login" method="post">
                    <input name="login" value="login" type="hidden" />
                    <input name="nweb_security_login_code1" value="<?php echo $nweb_security_login_code1; ?>" type="hidden" />
                    <input name="nweb_security_login_code2" value="<?php echo $nweb_security_login_code2; ?>" type="hidden" />
                    <input name="nweb_security_login_code3" value="<?php echo $nweb_security_login_code3; ?>" type="hidden" />

                    <div class="out-10">
                        <input type="text" class="form-style input-lg" required="required" name="username" id="username" maxlength="24" placeholder="Tên đăng nhập" autofocus />
                    </div>
                    <div class="out-10">
                        <input type="password" class="form-style input-lg" required="required" name="password" id="password" maxlength="30" placeholder="Mật khẩu cấp 1" />
                    </div>
                    <?php if($_SESSION['login_wrong'] > 5) { ?>
                    <div class="out-10">
                        <img src="img.php?size=6&v=<?php echo time(); ?>" />
                    </div>
                    <div class="out-10">
                        <input type="text" class="form-style input-lg" required="required" name="vImageCodP" id="vImageCodP" placeholder="Nhập 6 mã kiểm tra bên trên" />
                    </div>
                    <?php } ?>
                    <div class="out-10">
                        <p class="lostpass"><a rel="ajax" href="#receive_pass1">Tôi đã quên mật khẩu ?</a></p>
                    </div>
                    <div class="out-10">
                        <button class="btn btn-blue btn-block btn-upper btn-lg" type="submit" id="submit" name="submit">Đăng nhập</button>
                    </div>
                    <div class="out-10 register-line-block">
                        <p>Tôi chưa có tài khoản</p>
                        <a rel="ajax" href="#register" class="btn btn-orange btn-block btn-lg">Đăng ký tài khoản</a>
                        <div class="out-top-10">
                            <a rel="ajax" href="#register" class="btn btn-orange btn-block btn-lg">Đăng ký nhanh</a>
                        </div>
						<div class="out-top-10">
                            <a rel="ajax" href="#taigame" class="btn btn-green btn-block btn-lg">Tải Game</a>
                        </div>
                    </div>
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
					<div class="event-countdown">
                        <fieldset>
    						<legend>Sự Kiện Ingame</legend>
                        	<table>
                        		<tbody id="event-time">
								    <?php
										foreach($eventgame_show_arr as $eventgame_k => $eventgame_v) { 
											foreach($eventgame_v as $eventgame_k2 => $eventgame_v2) { 
									?>
										<tr><td width="75" align="center"><strong><?php echo $eventgame_v2['timer_show']; ?></strong></td>
										<td align="center"><?php echo $eventgame_v2['name']; ?></td>
										<td width="80" align="center"><span data-countdown="<?php echo $eventgame_v2['timer']; ?>">&nbsp;</span></td></tr>					
									<?php } } ?>
								</tbody>
                        	</table>							
                        </fieldset><br />
						<fieldset>
						<legend>Kundun cập nhập <?php echo date('H:i', $data_arr['kudnun']['timecheck']); ?> (5 phút cập nhập 1 lần)</legend>
                        	<table>
                        		<tbody id="event-time">
								   <?php
										if(is_array($data_arr['kudnun']['data'])) {
											foreach($data_arr['kudnun']['data'] as $kundun_k => $kundun_v) { 
												if($kundun_v['stat'] == 1) {
													$kundun_stat = "Đang có";
												} else {
													$kundun_stat = $kundun_v['next'];
												}
									?>
										<tr><td width="75" align="center"><strong><?php echo $kundun_v['server']; ?></strong></td>
										<td align="center"><span class="tag tag-orange"><?php echo $kundun_stat; ?></span></td>
										<?php if($kundun_v['stat'] == 0) { ?> 
										<td width="80" align="center"><span class="tag tag-red" data-countdown="<?php echo $kundun_v['date_next']; ?>">&nbsp;</span></td></tr>					
									    <?php } ?>
									<?php } } ?>
								</tbody>
                        	</table>
						</fieldset>
                    </div>
                </form>
            </div>
        </div>
    </div>
	<div class="home-ct">
        <div id="BlockLeft">
	<?php if($_GET['mod']=='register') include('templates/register.tpl');?>
	<?php if($_GET['mod']=='receive_pass1') include('templates/receive_pass1.tpl');?>
	<?php if(!$_GET['mod']) { ?>
	<div class="primary-block">
                <div class="head-block">
                    <p class="title-head"><? echo $lang_home_event; ?></p>
                </div>
                <div class="in-10 list-events-block">
                    <ul class="list-events">
                        <?php
                            if(isset($khuyenmai_begin) && isset($khuyenmai_end) && strtotime($khuyenmai_begin) <= time() && (strtotime($khuyenmai_end) + 24*60*60 - 1) >= time() && $khuyenmai_phantram > 0) {
                                $khuyenmai_begin_date = date('d/m', strtotime($khuyenmai_begin));
                                $khuyenmai_end_date = date('d/m', strtotime($khuyenmai_end));
                                
                                $lang_arr = array($khuyenmai_phantram, $khuyenmai_begin_date, $khuyenmai_end_date);
                                echo "<li><a href='javascript:void(0);'>". _langarr($lang_home_eventcard, $lang_arr) ."</a></li>";
                            } else {
                                $day_of_week = date('w', time());
                                $khuyenmai_phantram = $khuyenmai_week_phantram[$day_of_week];
                                if($khuyenmai_phantram > 0) {
                                    $lang_arr = array($khuyenmai_phantram);
                                    echo "<li><a href='javascript:void(0);'>". _langarr($lang_home_eventcard_week, $lang_arr) ."</a></li>";
                                }
                            }

                            if($event_epitem_on == 1 && (strtotime($event_epitem_end) >= time() - 5*24*60*60) ) {
                                $lang_arr = array($event_epitem_name, date('d/m', strtotime($event_epitem_begin)), date('d/m', strtotime($event_epitem_end)));
                                echo "<li><a href='javascript:void(0);'>". _langarr($lang_home_eventepitem, $lang_arr) ."</a></li>";
                            }

                            if($giftcode_rs_use > 0) {
                                echo "<li><a href='javascript:void(0);'>". $lang_home_event_giftcoders ."</a></li>";
                            }

                            if($giftcode_week_use > 0) {
                                echo "<li><a href='javascript:void(0);'>". $lang_home_event_giftcodeweek ."</a></li>";
                            }

                            if($giftcode_month_use > 0) {
                                echo "<li><a href='javascript:void(0);'>". $lang_home_event_giftcodemonth ."</a></li>";
                            }

                            if($giftcode_tanthu_use == 1) {
                                echo "<li><a href='javascript:void(0);'>". $lang_home_event_giftcodenewmem ."</a></li>";
                            }

                            if($event_santa_ticket == 1) {
                                echo "<li><a href='javascript:void(0);'>". $lang_home_event_santaticket ."</a></li>";
                            }

                            if($event_bongda_on == 1) {
                                echo "<li><a href='javascript:void(0);'>". $lang_home_event_football ."</a></li>";
                            }

                            if($event2_on == 1 && (strtotime($event2_end) >= time() - 5*24*60*60) ) {
                                $lang_arr = array($event2_name, date('d/m', strtotime($event2_begin)), date('d/m', strtotime($event2_end)));
                                echo "<li><a href='javascript:void(0);'>". _langarr($lang_home_event2, $lang_arr) ."</a></li>";
                            }
                            
                            if($event_goldbox_on == 1 && (strtotime($event_goldbox_end) >= time() - 5*24*60*60) ) {
                                $lang_arr = array($event_goldbox_name, date('d/m', strtotime($event_goldbox_begin)), date('d/m', strtotime($event_goldbox_end)));
                                echo "<li><a href='javascript:void(0);'>". _langarr($lang_home_event_goldbox, $lang_arr) ."</a></li>";
                            }

                            if($event_top_goldbox_on == 1 && (strtotime($event_goldbox_end) >= time() - 5*24*60*60) ) {
                                $lang_arr = array($event_top_goldbox_name, date('d/m', strtotime($event_goldbox_begin)), date('d/m', strtotime($event_goldbox_end)));
                                echo "<li><a href='javascript:void(0);'>". _langarr($lang_home_event_top_goldbox, $lang_arr) ."</a></li>";
                            }

                            if($event_toppoint_on == 1 && (strtotime($event_toppoint_end) >= time() - 5*24*60*60) ) {
                                $lang_arr = array($event_toppoint_name, date('d/m', strtotime($event_toppoint_begin)), date('d/m', strtotime($event_toppoint_end)));
                                echo "<li><a href='javascript:void(0);'>". _langarr($lang_home_event_topitem2point, $lang_arr) ."</a></li>";
                            }

                            if($event_topcard_on == 1 && (strtotime($event_topcard_end) >= time() - 5*24*60*60) ) {
                                $lang_arr = array($event_topcard_name, date('d/m', strtotime($event_topcard_begin)), date('d/m', strtotime($event_topcard_end)));
                                echo "<li><a href='javascript:void(0);'>". _langarr($lang_home_event_topcard, $lang_arr) ."</a></li>";
                            }
                            
                            for($topcard_i=2; $topcard_i <= 5; $topcard_i++) {
                                if($event_topcard[$topcard_i]['on'] == 1 && (strtotime($event_topcard[$topcard_i]['end']) >= time() - 5*24*60*60) ) {
                                    $lang_arr = array($event_topcard[$topcard_i]['name'], date('d/m', strtotime($event_topcard[$topcard_i]['begin'])), date('d/m', strtotime($event_topcard[$topcard_i]['end'])));
                                    echo "<li><a href='javascript:void(0);'>". _langarr($lang_home_event_topcard, $lang_arr) ."</a></li>";
                                }
                            }
                            
                            if($event_toprs_on == 1 && (strtotime($event_toprs_end) >= time() - 5*24*60*60) ) {
                                $lang_arr = array($event_toprs_name, date('d/m', strtotime($event_toprs_begin)), date('d/m', strtotime($event_toprs_end)));
                                echo "<li><a href='javascript:void(0);'>". _langarr($lang_home_event_toprs, $lang_arr) ."</a></li>";
                            }
                            
                            for($toprs_i=2; $toprs_i <= 5; $toprs_i++) {
                                if($event_toprs[$toprs_i]['on'] == 1 && (strtotime($event_toprs[$toprs_i]['end']) >= time() - 5*24*60*60) ) {
                                   $lang_arr = array($event_toprs[$toprs_i]['name'], date('d/m', strtotime($event_toprs[$toprs_i]['begin'])), date('d/m', strtotime($event_toprs[$toprs_i]['end'])));
                                    echo "<li><a href='javascript:void(0);'>". _langarr($lang_home_event_toprs, $lang_arr) ."</a></li>";
                                }
                            }
                        ?>
                    </ul>
                </div>
            </div>
            
           <!-- <div class="primary-block out-top-20">
                <div class="home-slide">
                    <div id="slider_container" style="position:relative;margin:0px;height:310px;left:0px;top:0px;">
                    
                    <div style="left:0px;top:0px;height:310px;overflow:hidden;">
                        <?php include('forum_news/getdata.php'); ?>
                    </div>
                    </div>
                    <input id="stTransition" readonly="" type="text" style="width:630px;height:22px; display: none;" />
                </div>
            </div>-->
	</div>
	<? } ?>
		</div
	</div>
</div>
<?php } ?>