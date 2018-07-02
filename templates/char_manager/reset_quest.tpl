<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Reset Quest - Làm lại nhiệm vụ</h1>
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Sau khi Reset Quest, nhân vật sẽ phải làm lại nhiệm vụ từ đầu.</li>
            <li>Sau khi Reset Quest, nhân vật sẽ trở về chủng tộc cấp 1.</li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">

        <form id="reset_quest" name="reset_quest" method="post" action="index.php?mod=char_manager&act=reset_quest">
            <input type="hidden" name="action" value="reset_quest" />
            <input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />
            <div class="form-2">
                <div class="form-row">
                    <div class="form-col-1"><span>Nhân vật Reset Quest</span></div>
                    <div class="form-col-2">
                        <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
                    </div>
                </div>
                <div class="line"></div>
                <div class="form-row">
                    <div class="form-col-1"><span>Đổi nhân vật</span></div>
                    <div class="form-col-2">
                        <?php echo $doinv; ?>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Tháo đồ</span></div>
                    <div class="form-col-2">
                        Tháo hết đồ trên người
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Mật khẩu Cấp 2</span></div>
                    <div class="form-col-2">
                        <input class="form-style" type="password" name="pass2" size="20" />
                    </div>
                </div>
                <div class="form-submit">

                        <button class="btn btn-green btn-block btn-lg" type="submit" name="Submit" <?php if($accept=='0') { echo 'disabled="disabled"'; }  ?> onclick="return confirm('Bạn chắc chắn đã tháo hết đồ trên người chưa?\n- Nếu chưa hãy chọn Cancel để hủy.\n- Nếu đã cất chọn OK để tiếp tục.\nMọi vấn đề mất đồ không làm theo hướng dẫn, BQT không chịu trách nhiệm.');">Reset Quest</button>

                </div>
            </div>
        </form>
    </div>
</div>