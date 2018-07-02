<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Tẩy tủy</h1>
    </div>
</div>


<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Sau khi tẩy tủy, nhân vật sẽ bị trừ 1 lần Reset và có LV 400.</li>
            <li>Sau khi tẩy tủy, nhân vật sẽ bị xóa toàn bộ số điểm Danh Vọng trong ngày.</li>
            <li>Chi phí tẩy tủy: <?php echo number_format($taytuy_vpoint, 0, ',', '.'); ?> Vcent</li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">
        <form id="taytuy" name="taytuy" method="post" action="index.php?mod=char_manager&act=taytuy">
            <input type="hidden" name="action" value="taytuy" />
            <input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />
            <div class="form-2">
                <div class="form-row">
                    <div class="form-col-1"><span>Nhân vật Tẩy tủy </span></div>
                    <div class="form-col-2">
                        <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
                    </div>
                </div>
                <div class="line"></div>
                <p class="in-10">Điều kiện Tẩy tủy</p>

                <div class="form-row">
                    <div class="form-col-1"><span>Đổi nhân vật</span></div>
                    <div class="form-col-2">
                        <?php echo $doinv; ?>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Mật khẩu Cấp 2</span></div>
                    <div class="form-col-2">
                        <input class="form-style" type="password" name="pass2" size="20" />
                    </div>
                </div>
                <div class="form-submit">

                        <button class="btn btn-green btn-block btn-lg" type="submit" name="Submit" <?php if($accept=='0') { echo 'disabled="disabled"'; }  ?> >Tẩy tủy</button>

                </div>
            </div>
        </form>
    </div>
</div>