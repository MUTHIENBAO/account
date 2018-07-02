<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Ủy thác Offline</h1>
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li><b>Điểm Ủy Thác</b>: <?php echo $phut_1point; ?> phút Ủy Thác Offline = 1 điểm Ủy Thác</li>
            <li>Chi phí Ủy thác Offline: <?php echo number_format($uythacoff_price, 0, ',', '.'); ?> Gcent / 1 phút Ủy thác</li>
            <li><b>Được sử dụng Gcent Khuyến Mại</b></li>
            <li><b>Khi Ủy Thác Offline : Nhân vật sẽ bị khóa</b>. Kết thúc Ủy thác Offline nhân vật sẽ được mở khóa.</li>
            <li><b>Lưu ý</b>: <font color='red'>Điểm Ủy Thác sẽ <b>suy giảm 10%</b> vào 24h hàng ngày. Các bạn lưu ý sử dụng hết trước 24h hàng ngày.</font></li>
        </ul>
    </div>
</div>
<?php if($_SESSION['nv_uythac_offline']==0) { ?>

<div class="primary-block out-top-20">
    <div class="in-20">
        <form id="uythacoffline" name="uythacoffline" method="post" action="index.php?mod=char_manager&act=uythacoffline">
            <input type="hidden" name="action" value="uythacoffline" />
            <input type="hidden" name="act" value="uythac_begin" />
            <input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />
            <div class="form-2">
                <div class="form-row">
                    <div class="form-col-1"><span>Nhân vật Ủy thác Offline </span></div>
                    <div class="form-col-2">
                        <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
                    </div>
                </div>
                <div class="line"></div>
	    	<?php if($Use_VIP == 2) {  ?>
		<div class="form-row">
		    <div class="form-col-1">
                    	<span>Tài khoản VIP</span>
                    </div>
                    <div class="form-col-2">
                    	<span>
			     <?php if($_SESSION['acc_vip'] > 0 && $_SESSION['acc_vip_day'] >= $enable_vip['utoff']) { ?>
			     <div class="image-vip-title vip-<?php echo $_SESSION['acc_vip']; ?>"></div>
			     <?php } else { ?>
			     <a href="#vip_system" title="Nâng cấp VIP"><div class="image-vip-title upgrade-vip vip-<?php if($_SESSION['acc_vip'] > 0) echo $_SESSION['acc_vip']; else echo 2; ?>-<?php echo $enable_vip['utoff']; ?>"></div></a> (Nâng cấp VIP ngay!)
			     <?php } ?>
                    	</span>
		     </div>
            	</div>
	    	<?php } ?>				
                <div class="form-row">
                    <div class="form-col-1"><span>Đổi nhân vật</span></div>
                    <div class="form-col-2">
                        <?php echo $doinv; ?>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Thoát Game</span></div>
                    <div class="form-col-2">
                        <?php echo $online; ?>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Mật khẩu Cấp 2</span></div>
                    <div class="form-col-2">
                        <input class="form-style" type="password" name="pass2" size="20" />
                    </div>
                </div>
                <div class="form-submit">

                        <button class="btn btn-green btn-block btn-lg" type="submit" name="Submit" <?php if($accept=='0') { echo 'disabled="disabled" class="NotAccept"'; } else { echo 'class="Accept"'; } ?> >Ủy thác Offline</button>

                </div>
            </div>
        </form>
    </div>
</div>
<?php } else { ?>

<div class="primary-block out-top-20">
    <div class="in-20">
        <form id="uythacoffline" name="uythacoffline" method="post" action="index.php?mod=char_manager&act=uythacoffline">
            <input type="hidden" name="action" value="uythacoffline" />
            <input type="hidden" name="act" value="uythac_end" />
            <input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />
            <div class="form-3">
                <div class="form-row">
                    <div class="form-col-1"><span>Nhân vật Ủy thác Offline </span></div>
                    <div class="form-col-2">
                        <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
                    </div>
                    <div class="form-col-3">&nbsp;</div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Đã Ủy Thác </span></div>
                    <div class="form-col-2">
                        <?php echo number_format($_SESSION['nv_uythac_offline_time'], 0, ',', '.'); ?></strong> phút<br />
                        <?php echo $uythac_msg; ?>.
                    </div>
                    <div class="form-col-3">&nbsp;</div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Mật khẩu Cấp 2</span></div>
                    <div class="form-col-2">
                        <input class="form-style" type="password" name="pass2" size="20" />
                    </div>
                    <div class="form-col-3">&nbsp;</div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Nhận Ủy Thác</span></div>
                    <div class="form-col-2">
                        <input type="checkbox" name="getuythac" checked="checked" /> <i>(Tích nếu muốn dùng Gcent để đổi điểm Ủy Thác.<br />Không tích nếu muốn bỏ qua lần Ủy Thác này)</i>
                    </div>
                    <div class="form-col-3">&nbsp;</div>
                </div>
                <div class="form-submit">
                    <div class="form-col-1">&nbsp;</div>
                    <div class="form-col-2">
                        <button class="btn btn-green btn-block btn-lg" class="Accept" type="submit" name="Submit">Kết thúc Ủy thác Offline</button>
                    </div>
                    <div class="form-col-3">&nbsp;</div>
                </div>
            </div>
        </form>
    </div>
</div>
<?php } ?>
