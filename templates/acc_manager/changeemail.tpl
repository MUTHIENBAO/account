<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Đổi Email</h1>
        <ul class="tabs-content">
            <li><a href="#acc_manager&act=changeemail_info" rel="ajax">Dùng thông tin tài khoản</a></li>
            <li class="active"><a href="#acc_manager&act=changeemail" rel="ajax">Dùng dịch vụ SMS</a></li>
        </ul>
    </div>
</div>
<div class="primary-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Dùng dịch vụ SMS</span></h1>
    </div>
    <form id="changeemail" name="changeemail" method="post" action="index.php?mod=acc_manager&act=changeemail">
        <input type="hidden" name="action" value="changeemail" />
        <div class="form-3">
            <div class="form-row">
                <div class="form-col-1">Email mới</div>
                <div class="form-col-2"><input class="form-style" type="text" name="email" id="email" maxlength="50" onkeyup="check_email(this.value,'msg_'+this.name)"></div>
                <div class="form-col-3"><label id="msg_email" class="msg"></label></div>
            </div>
            <div class="line"></div>
            <div class="form-row">
                <div class="form-col-1">&nbsp;</div>
                <div class="form-col-2"><button class="btn btn-green btn-block btn-lg" type="submit" onsubmit="return btn_check_email();">Hoàn tất thay đổi</button></div>
                <div class="form-col-3">&nbsp;</div>
            </div>
        </div>
    </form>
</div>


