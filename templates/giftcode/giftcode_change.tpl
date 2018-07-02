<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Nhận phần thưởng GiftCode</h1>
</div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Phần thưởng nhận được tương ứng với lớp nhân vật đang chọn.</li>
            <li><strong>Ngọc Hỗn Nguyên, Ngọc Sáng Tạo, Lông Vũ</strong> nhận được sẽ nằm trong ngân hàng.</li>
            <!--<li><strong>Bùa EXP</strong> : Nếu nhân vật đang sử dụng bùa sẽ được cộng thêm thời hạn sử dụng.<br />Nếu nhân vật chưa có bùa hoặc đã hết hạn sẽ được tặng <strong>Bùa Thiên Sứ</strong></li>-->
            <li><strong>Item không thời hạn</strong> : Sau khi nhận sẽ được chuyển vào Rương đồ chung</li>
            <li><strong><font color='red'>Item có thời hạn</font></strong> : Đến <strong>Server 1, Lorencia</strong>, giao dịch với NPC <strong>ReWard (143, 138)</strong> để rút Item.</li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">
<form id="giftcode_change" name="giftcode_change" method="post" action="index.php?mod=giftcode&act=giftcode_change">
	<input type="hidden" name="action" value="giftcode_change" />
	<input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />

    <div class="form-3">
        <div class="form-row">
            <div class="form-col-1">Nhân vật đổi Event</div>
            <div class="form-col-2">
                <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
            </div>
            <div class="form-col-3">&nbsp;</div>
        </div>
        <div class="form-row">
            <div class="form-col-1">Thoát Game</div>
            <div class="form-col-2">
                <?php echo $online; ?>
            </div>
            <div class="form-col-3">&nbsp;</div>
        </div>
        <div class="form-row">
            <div class="form-col-1">Mã GiftCode</div>
            <div class="form-col-2">
                <input class="form-style" name="giftcode" size="14" maxlength="10" />
            </div>
            <div class="form-col-3">&nbsp;</div>
        </div>
        <div class="form-row">
            <div class="form-col-1">Mật khẩu cấp 2</div>
            <div class="form-col-2">
                <input class="form-style" type="password" name="pass2" size="14" maxlength="32" class="keyboardInput"/>
            </div>
            <div class="form-col-3">&nbsp;</div>
        </div>
        <div class="form-row">
            <div class="form-col-1">&nbsp;</div>
            <div class="form-col-2">
                <button class="btn btn-green btn-block btn-lg" type="submit" name="Submit" <?php if($accept=='0') { echo 'disabled="disabled"'; } ?> >Đổi GiftCode</button>
            </div>
            <div class="form-col-3">&nbsp;</div>
        </div>
    </div>
</form>
    </div>
</div>
<?php } else include('templates/char_manager.tpl'); ?>