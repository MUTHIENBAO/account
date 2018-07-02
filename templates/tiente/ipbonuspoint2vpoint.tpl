<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Đổi IP Bonus Point sang Vcent</h1>
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Tỷ lệ quy đổi : 1 IP Bonus Point = 1 Vcent</li>
            <li><strong>IP Bonus Point</strong> hiện có : <strong><?php echo $_SESSION['IPBonusPoint']; ?></strong> <i>(Đăng nhập lại tài khoản để cập nhập mới)</i></li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">

<form id="ipbonuspoint2vpoint" name="ipbonuspoint2vpoint" method="post" action="index.php?mod=tiente&act=ipbonuspoint2vpoint">
    <input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />
    <input type="hidden" name="action" value="ipbonuspoint2vpoint" />

    <div class="form-3">
        <div class="form-row">
            <div class="form-col-1">IP Bonus Point</div>
            <div class="form-col-2"><input class="form-style" type="text" name="ipbonuspoint" id="ipbonuspoint" size="14" maxlength="10"/>
            </div>
            <div class="form-col-3">
                <span class="form-middle">đổi sang VCent</span>
            </div>
        </div>

        <div class="form-row">
            <div class="form-col-1">Mật khẩu cấp 2</div>
            <div class="form-col-2"><input class="form-style" type="password" name="pass2" size="14" maxlength="32"/>
            </div>
        </div>

        <div class="form-submit">
            <button class="btn btn-green btn-lg" type="submit" name="Submit">Đổi IP Bonus Point sang Vcent</button>
        </div>
    </div>
</form>
    </div>
</div>