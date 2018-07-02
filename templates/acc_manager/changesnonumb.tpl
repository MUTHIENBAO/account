<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Đổi 7 số bí mật</h1>
        <ul class="tabs-content">
            <li><a href="#acc_manager&act=changesnonumb_info" rel="ajax">Dùng thông tin tài khoản</a></li>
            <li class="active"><a href="#acc_manager&act=changesnonumb" rel="ajax">Dùng dịch vụ SMS</a></li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Dùng Tin Nhắn SMS</span></h1>
    </div>

    <fieldset class="notify-red out-10">
        <legend>Lưu ý:</legend>
        <div class="in-10">
            Sử dụng <strong>7 mã số bí mật</strong> khi : Xóa nhân vật, Đặt mã khóa hòm đồ,...<br />
            <b>Sau khi đổi xong, phải đăng nhập lại Game mới có hiệu lực</b>
        </div>
    </fieldset>

    <form id="changesnonumb" name="changesnonumb" method="post" action="index.php?mod=acc_manager&act=changesnonumb">
        <input type="hidden" name="action" value="changesnonumb" />
        <div class="form-3">
            <div class="form-row">
                <div class="form-col-1">7 số bí mật mới</div>
                <div class="form-col-2">
                    <input class="form-style" type="text" name="snonumb" id="snonumb" size="14" maxlength="7" onkeyup="check_so(this.value,'msg_'+this.name)">
                </div>
                <div class="form-col-3"><label id="msg_snonumb" class="msg"></label></div>
            </div>
            <div class="line"></div>
            <div class="form-row">
                <div class="form-col-1">&nbsp;</div>
                <div class="form-col-2"><button class="btn btn-green btn-block btn-lg" type="submit" name="Submit">Hoàn tất thay đổi</button></div>
                <div class="form-col-3">&nbsp;</div>
            </div>
        </div>
    </form>
</div>