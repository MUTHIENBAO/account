<?php if (isset($_SESSION[mu_nvchon])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Đổi IP Bonus Point sang PC Point</h1>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">
<form id="ipbonuspoint2pcpoint" name="ipbonuspoint2pcpoint" method="post" action="index.php?mod=tiente&act=ipbonuspoint2pcpoint">
    <input type="hidden" name="action" value="ipbonuspoint2pcpoint" />
    <input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />
    <div class="form-3">
        <div class="form-row">
            <div class="form-col-1">&nbsp;</div>
            <div class="form-col-2">
                <div class="caption-block caption-blue">Tỷ lệ quy đổi : 1 IP Bonus Point = 1 PC Point<br /><strong>IP Bonus Point</strong> hiện có : <strong><?php echo $_SESSION['IPBonusPoint']; ?></strong> <i>(Đăng nhập lại tài khoản để cập nhập mới)</i></span></div>
            </div>
        </div>
        <div class="form-row">
            <div class="form-col-1">Nhân vật nhận PC Point </div>
            <div class="form-col-2">
                <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
            </div>
        </div>

        <div class="form-row">
            <div class="form-col-1">IP Bonus Point</div>
            <div class="form-col-2">
                <input class="form-style" type="text" name="ipbonuspoint" id="ipbonuspoint" size="14" maxlength="10"/>
            </div>
            <div class="form-col-3">
                <span class="form-middle">đổi sang PC Point</span>
            </div>
        </div>

        <div class="form-row">
			<div class="form-col-1">Mật khẩu cấp 2</div>
            <div class="form-col-2">
                <input class="form-style" type="password" name="pass2" size="14" maxlength="32"/>
            </div>
        </div>
        <div class="form-row">

            <button class="btn btn-green btn-lg" type="submit" name="Submit">Đổi IP Bonus Point sang PC Point</button>
        </div>
    </div>
</form>
    </div>
<?php } else include('templates/char_manager.tpl'); ?>