<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Gửi Jewel vào ngân hàng</h1>
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Nhân vật Gửi Jewel vào ngân hàng không được đang trong Game và không được là nhân vật thoát sau cùng</li>
            <li>Những Jewel có thể gửi</b>: Chao, Create, Blue Feather, Trái Tim .</li>
            <li>Jewel trong ngân hàng không thể rút ra, chỉ có thể sử dụng để Reset.</li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Thông tin nhân vật</span></h1>
    </div>
<form id="jewel2bank" name="jewel2bank" method="post" action="index.php?mod=char_manager&act=jewel2bank">
	<input type="hidden" name="action" value="jewel2bank" />
	<input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />

    <div class="in-20">
        <div class="form-2">
            <div class="form-row">
                <div class="form-col-1"><span>Nhân vật gửi Jewel </span></div>
                <div class="form-col-2">
                    <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
                </div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <div class="line"></div>
            <div class="form-row">
                <div class="form-col-1"><span>Đổi nhân vật</span></div>
                <div class="form-col-2">
                    <?php echo $doinv; ?>
                </div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <div class="form-row">
                <div class="form-col-1"><span>Thoát Game</span></div>
                <div class="form-col-2">
                    <?php echo $online; ?>
                </div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <div class="form-submit">

                    <button class="btn btn-green btn-block btn-lg" type="submit" name="Submit" <?php if($accept == 0) { ?> disabled="disabled" <?php } ?> >Gửi Jewel</button>

            </div>
        </div>
        </div>
</form>
</div>
<?php } else include('templates/char_manager.tpl'); ?>