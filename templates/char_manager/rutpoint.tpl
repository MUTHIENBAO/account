<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Rút Point</h1>
    </div>
</div>


<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Rút Point từ <b>Point dự trữ</b> sang <b>Point chưa cộng</b> để sử dụng cộng điểm cho nhân vật</li>
            <li>Số Point chưa cộng sau khi rút không được lớn hơn 32.000 Point.</li>
        </ul>
    </div>
</div>


<div class="primary-block out-top-20">
    <div class="in-20">

        <form id="rutpoint" name="rutpoint" method="post" action="index.php?mod=char_manager&act=rutpoint">
            <input type="hidden" name="action" value="rutpoint" />
            <input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />
            <div class="form-2">
                <div class="form-row">
                    <div class="form-col-1"><span>Nhân vật Rút Point </span></div>
                    <div class="form-col-2">
                        <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
                    </div>
                </div>
                <div class="line"></div>
                <p class="in-10">Điều kiện Rút Point</p>
                <div class="form-row">
                    <div class="form-col-1"><span>Đổi nhân vật</span></div>
                    <div class="form-col-2">
                        <?php echo $doinv; ?>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Số Point cần rút</span></div>
                    <div class="form-col-2">
                        <input class="form-style" name="point" id="point" size="7" maxlength="5" onfocus="focus_so(this.value,'msg_'+this.name);" onkeyup="check_so(this.value,'msg_'+this.name)" /> (Tối đa <b> <?php echo $_SESSION['nv_pointdutru']; ?> </b> point )

                    </div>
                    <div class="form-col-3"><label id="msg_point" class="msg"></label></div>
                </div>
                <div class="form-submit">

                        <button class="btn btn-green btn-block btn-lg" type="submit" name="Submit" onclick="return btn_check_rutpoint();" <?php if($accept=='0') { echo 'disabled="disabled" class="NotAccept"'; } else { echo 'class="Accept"'; } ?> >Rút Point</button>

                </div>
            </div>
        </form>
    </div>
</div>