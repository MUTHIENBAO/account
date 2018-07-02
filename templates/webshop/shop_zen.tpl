<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Shop Zen</h1>
        <?php include('templates/webshop/shop_head.tpl'); ?>
    </div>
</div>
<!--
<div class="priority-block">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Hệ thống sẽ sử dụng Vcent Event hết rồi mới đến Vcent.</li>
        </ul>
    </div>
</div>
-->
<div class="primary-block out-top-20">
    <div class="in-20">
        <form id="shop_zen" name="shop_zen" method="post" action="index.php?mod=webshop&act=shop_zen">
            <input type="hidden" name="action" value="shop_zen" />
            <div class="form-2">
                <div class="form-row">
                    <div class="form-col-1">Chọn mức Zen cần mua</div>
                    <div class="form-col-2">
                        <select name="slg" class="form-style" style="width: 300px;">
                            <option value="1" selected="selected"><?php echo number_format($zen_mua, 0, ',', '.'); ?> Zen = <?php echo number_format($vpoint_chiphi, 0, ',', '.'); ?> Vcent</option>
                            <option value="2"><?php echo number_format($zen_mua*2, 0, ',', '.'); ?> Zen = <?php echo number_format($vpoint_chiphi*2, 0, ',', '.'); ?> Vcent</option>
                            <option value="3"><?php echo number_format($zen_mua*3, 0, ',', '.'); ?> Zen = <?php echo number_format($vpoint_chiphi*3, 0, ',', '.'); ?> Vcent</option>
                            <option value="4"><?php echo number_format($zen_mua*4, 0, ',', '.'); ?> Zen = <?php echo number_format($vpoint_chiphi*4, 0, ',', '.'); ?> Vcent</option>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-col-1">Mật khẩu cấp 2</div>
                    <div class="form-col-2">
                        <input class="form-style" type="password" name="pass2" size="14" maxlength="32"/>
                    </div>
                </div>

                <div class="form-row">
                    <button class="btn btn-green btn-block btn-lg" type="submit" name="Submit" onclick="return btn_check_verify(this.form.vImageCodP.value,'msg_vImageCodP');">Mua Zen</button>
                </div>
            </div>
        </form>
    </div>
</div>