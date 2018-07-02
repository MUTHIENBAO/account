<? if(isset($_SESSION['mu_username'])){ include('templates/acc_manager.tpl'); }else{ ?>

<div class="home-login-block">
    <div class="home-left">
        <div class="out-right-30" id='BlockLeft'>
            <div class="primary-block">
                <div class="home-slide">
<script type="text/javascript">
    $(document).ready(function(){
        var homesl_w = $(".home-slide").width();
        $("#slider_container, #homesl2, #sls2").width( homesl_w );
    });
</script>

<div id="slider_container" style="position:relative;margin:0 auto;height:310px;left:0px;top:0px;">
<div u="loading" style="position:absolute;top:0px;left:0px;">
<div style="filter:alpha(opacity=70);opacity:0.7;position:absolute;display:block;background-color:#000000;top:0px;left:0px;width:100%;height:100%;">
</div>
<div id="homesl2" style="position:absolute;display:block;background:url(loading.gif) no-repeat center center;top:0px;left:0px;width:100%;height:100%;">
</div>
</div>
<div id="sls2" u="slides" style="cursor:move;position:absolute;left:0px;top:0px;height:310px;overflow:hidden;">
    <script type="text/javascript" src="/slide.js?v=<? echo $_SERVER['REQUEST_TIME']; ?>"></script>
</div>
</div>
<input id="stTransition" readonly="" type="text" style="width:630px;height:22px; display: none;">



                    
                </div>
            </div>
            <div class="primary-block out-top-30">
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

                            if($event_toprs_on == 1 && (strtotime($event_toprs_end) >= time() - 5*24*60*60) ) {
                                $lang_arr = array($event_toprs_name, date('d/m', strtotime($event_toprs_begin)), date('d/m', strtotime($event_toprs_end)));
                                echo "<li><a href='javascript:void(0);'>". _langarr($lang_home_event_toprs, $lang_arr) ."</a></li>";
                            }
                        ?>
                    </ul>
                </div>
            </div>
        </div>

    </div>
    <div class="home-right">
        <div class="primary-block">
            <div class="login-block in-10">
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
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php } ?>