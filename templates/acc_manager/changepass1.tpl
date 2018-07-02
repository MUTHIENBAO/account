<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Đổi mật khẩu Web 1</h1>
        <ul class="tabs-content">
            <li><a href="#acc_manager&act=changepass1_info" rel="ajax">Dùng thông tin tài khoản</a></li>
            <li class="active"><a href="#acc_manager&act=changepass1" rel="ajax">Dùng dịch vụ SMS</a></li>
        </ul>
	</div>
</div>
<div class="primary-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Dùng Tin Nhắn SMS</span></h1>
    </div>
    <form id="changepass1" name="changepass1" method="post" action="index.php?mod=acc_manager&act=changepass1">
        <input type="hidden" name="action" value="changepass1" />
        <div class="form-3">
            <div class="form-row">
                <div class="form-col-1">Mật khẩu Web mới</div>
                <div class="form-col-2"><input class="form-style" type="password" name="pass1new" id="pass1new" size="14" maxlength="32" onfocus="focus_chuso(this.value,'msg_'+this.name);" onkeyup="check_chuso_4_20(this.value,'msg_'+this.name)"></div>
                <div class="form-col-3"><label id="msg_pass1new" class="msg"></label></div>
            </div>
            <div class="line"></div>
            <div class="form-row">
                <div class="form-col-1">Nhập lại mật khẩu Web mới</div>
                <div class="form-col-2"><input class="form-style" type="password" name="pass1new_verify" id="pass1new_verify" size="14" maxlength="32" onfocus="focus_chuso(this.value,'msg_'+this.name);" onblur="onblur_check_repass(this.form.pass1new.value,this.value,'msg_'+this.name)"></div>
                <div class="form-col-3"><label id="msg_pass1new_verify" class="msg"></label></div>
            </div>
            <div class="line"></div>
            <div class="form-row">
                <div class="form-col-1">&nbsp;</div>
                <div class="form-col-2"><button class="btn btn-green btn-block btn-lg" type="submit" onsubmit="return btn_check_changepass1();">Hoàn tất thay đổi</button></div>
                <div class="form-col-3">&nbsp;</div>
            </div>
        </div>
    </form>
</div>