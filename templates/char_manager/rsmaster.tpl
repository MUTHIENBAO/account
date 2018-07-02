<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Reset Master Skill</h1>
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Reset Master Skill : Xóa toàn bộ Master Skill đã cộng, lấy lại điểm Master Skill theo <b>Cấp độ Master</b></li>
            <li>Toàn bộ skill phép sẽ bị xóa và bạn cần phải học lại trong game.</li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">


        <form id="rsmaster" name="rsmaster" method="post" action="index.php?mod=char_manager&act=rsmaster">
            <input type="hidden" name="action" value="rsmaster" />
            <input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />
            <div class="form-2">
                <div class="form-row">
                    <div class="form-col-1"><span>Nhân vật Reset Master Skill</span></div>
                    <div class="form-col-2">
                        <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
                    </div>
                </div>
                <div class="line"></div>

                <div class="form-row">
                    <div class="form-col-1"><span>Chi phí</span></div>
                    <div class="form-col-2"><?php echo $money_notice; ?></div>
                    <div class="form-col-3"><?php echo $money_less_notice; ?></div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>ZEN</span></div>
                    <div class="form-col-2"><?php echo $zen_notice; ?></div>
                    <div class="form-col-3"><?php echo $zen_less_notice; ?></div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Nhân vật Master</span></div>
                    <div class="form-col-2">
                        <?php echo $nvmaster; ?>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Đổi nhân vật</span></div>
                    <div class="form-col-2">
                        <?php echo $doinv; ?>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Mật khẩu cấp 2</span></div>
                    <div class="form-col-2">
                        <input class="form-style" type="password" name="pass2" size="14" maxlength="32"/>
                    </div>
                </div>
                <div class="form-submit">

                        <button class="btn btn-green btn-block btn-lg" type="submit" name="Submit" <?php if($accept=='0') { echo 'disabled="disabled"'; }  ?> >Reset Master Skill</button>

                </div>
            </div>
        </form>
    </div>
</div>