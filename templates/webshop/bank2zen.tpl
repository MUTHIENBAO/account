<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Rút Zen</h1>
        <?php include('templates/webshop/shop_head.tpl'); ?>
    </div>
</div>

<div class="primary-block">
    <div class="in-20">
<form id="bank2zen" name="bank2zen" method="post" action="index.php?mod=webshop&act=bank2zen">
	<input type="hidden" name="action" value="bank2zen" />
	<input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />
    <div class="form-2">
        <div class="form-row">
            <div class="form-col-1">Nhân vật Rút Zen </div>
            <div class="form-col-2">
                <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
			</div>
        </div>
		<p class="in-10">Điều kiện Rút Zen</p>
        <div class="form-row">
            <div class="form-col-1">Đổi nhân vật</div>
            <div class="form-col-2"><?php echo $doinv; ?></div>
        </div>
        <div class="form-row">
            <div class="form-col-1">Số lượng Zen cần rút</div>
            <div class="form-col-2"><input class="form-style" name="zen" id="zen"></div>
        </div>
        <div class="form-row">
            <button class="btn btn-green btn-block btn-lg" type="submit" name="Submit" onclick="return btn_check_verify(this.form.vImageCodP.value,'msg_vImageCodP');" <?php if($accept=='0') { echo 'disabled="disabled"'; }  ?>>Rút Zen</button>
        </div>
    </div>
</form>
    </div>
</div>
<?php } else include('templates/char_manager.tpl'); ?>