<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Đổi mật khẩu vào Game</h1>
        <ul class="tabs-content">
            <li><a href="#acc_manager&act=changepassgame_info" rel="ajax">Dùng thông tin tài khoản</a></li>
            <li class="active"><a href="#acc_manager&act=changepassgame" rel="ajax">Dùng dịch vụ SMS</a></li>
        </ul>
    </div>
</div>
<div class="primary-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Dùng thông tin tài khoản</span></h1>
    </div>
        <form id="changepassgame" name="changepassgame" method="post" action="index.php?mod=acc_manager&act=changepassgame">
        <input type="hidden" name="action" value="changepassgame" />
            <div class="form-3">
                <div class="form-row">
                    <div class="form-col-1">Mật khẩu Game mới</div>
                    <div class="form-col-2"><input class="form-style" type="password" name="passgamenew" id="passgamenew" size="14" maxlength="10" onfocus="focus_chuso(this.value,'msg_'+this.name);" onkeyup="check_chuso_4_20(this.value,'msg_'+this.name)" /></div>
                    <div class="form-col-3"><label id="msg_passgamenew" class="msg"></label></div>
                </div>
                <div class="line"></div>
                <div class="form-row">
                    <div class="form-col-1">Xác minh Mật khẩu Game mới</div>
                    <div class="form-col-2"><input class="form-style" type="password" name="passgamenew_verify" id="passgamenew_verify" size="14" maxlength="10" onfocus="focus_chuso(this.value,'msg_'+this.name);" onblur="onblur_check_repass(this.form.passgamenew.value,this.value,'msg_'+this.name)" /></div>
                    <div class="form-col-3"><label id="msg_passgamenew_verify" class="msg"></label></div>
                </div>
                <div class="line"></div>
                <div class="form-row">
                    <div class="form-col-1">&nbsp;</div>
                    <div class="form-col-2"><button class="btn btn-green btn-block btn-lg" type="submit" onsubmit="return btn_check_changepassgame();">Hoàn tất thay đổi</button></div>
                    <div class="form-col-3">&nbsp;</div>
                </div>
            </div>
        </form>
</div>