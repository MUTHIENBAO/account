<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Đổi Số điện thoại</h1>
        <ul class="tabs-content">
            <li><a href="#acc_manager&act=changesdt_info" rel="ajax">Dùng thông tin tài khoản</a></li>
            <li class="active"><a href="#acc_manager&act=changesdt" rel="ajax">Dùng dịch vụ SMS</a></li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Dùng tin nhắn SMS</span></h1>
    </div>
    <form id="changesdt_sms" name="changesdt_sms" method="post" action="index.php?mod=acc_manager&act=changesdt_sms">
        <input type="hidden" name="action" value="changesdt_sms" />
        <div class="form-3">
            <div class="form-row">
                <div class="form-col-1">Số điện thoại mới</div>
                <div class="form-col-2">
                    <input class="form-style" type="text" name="tel" id="tel" size="14" maxlength="11" onfocus="focus_tel(this.value,'msg_'+this.name);" onkeyup="check_tel(this.value,'msg_'+this.name)">
                </div>
                <div class="form-col-3"><label id="msg_tel" class="msg"></label></div>
            </div>
            <div class="line"></div>
            <div class="form-row">
                <div class="form-col-1">&nbsp;</div>
                <div class="form-col-2"><button class="btn btn-green btn-block btn-lg" type="submit" onsubmit="return btn_check_sdtsms();">Hoàn tất thay đổi</button></div>
                <div class="form-col-3">&nbsp;</div>
            </div>
        </div>
    </form>
</div>