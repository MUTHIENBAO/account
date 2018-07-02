<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Đổi Số Điện Thoại</h1>
        <ul class="tabs-content">
            <li class="active"><a href="#acc_manager&act=changesdt_info" rel="ajax">Dùng thông tin tài khoản</a></li>
            <li><a href="#acc_manager&act=changesdt" rel="ajax">Dùng dịch vụ SMS</a></li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Dùng thông tin tài khoản</span></h1>
    </div>
        <form id="changesdt_info" name="changesdt_info" method="post" action="index.php?mod=acc_manager&act=changesdt_info">
            <input type="hidden" name="action" value="changesdt_info" />
        <div class="form-3">
            <div class="form-row">
                <div class="form-col-1">Số điện thoại mới</div>
                <div class="form-col-2"><input class="form-style" type="text" name="tel" id="tel" size="14" maxlength="11" onfocus="focus_tel(this.value,'msg_'+this.name);" onkeyup="check_tel(this.value,'msg_'+this.name)"></div>
                <div class="form-col-3"><label id="msg_tel" class="msg"></label></div>
            </div>
            <div class="line"></div>
            <p class="in-10">Thông tin kiểm tra</p>
            <div class="form-row">
                <div class="form-col-1">Mật khẩu Web cấp 2 <font color="red">*</font></div>
                <div class="form-col-2">
                    <input class="form-style" name="pass2" type="password" id="pass2" size="14" maxlength="32" onfocus="focus_chuso(this.value,'msg_'+this.name);" onkeyup="check_chuso_4_20(this.value,'msg_'+this.name)">

                </div>
                <div class="form-col-3"><label id="msg_pass2" class="msg"></label></div>
            </div>
            <div class="form-row">
                <div class="form-col-1">Địa chỉ E-Mail <font color="red">*</font></div>
                <div class="form-col-2"><input class="form-style" name="email" type="text" id="email" size="17" maxlength="50" value="<?php echo $_POST['email']; ?>" onkeyup="check_email(this.value,'msg_'+this.name)"></div>
                <div class="form-col-3"><label id="msg_email" class="msg"></label></div>
            </div>
            <div class="form-row">
                <div class="form-col-1">Câu hỏi bí mật <font color="red">*</font></div>
                <div class="form-col-2">
                    <select name="quest" class="form-style">
				    <option value="0">- Chọn câu hỏi bí mật -</option>
				    <option value="1" <?php if ($_POST['quest']=='1') { ?> selected="selected" <?php } ?> >Tên con vật yêu thích?</option>
				    <option value="2" <?php if ($_POST['quest']=='2') { ?> selected="selected" <?php } ?> >Trường cấp 1 của bạn tên gì?</option>
				    <option value="3" <?php if ($_POST['quest']=='3') { ?> selected="selected" <?php } ?> >Người bạn yêu quý nhất?</option>
				    <option value="4" <?php if ($_POST['quest']=='4') { ?> selected="selected" <?php } ?> >Trò chơi bạn thích nhất?</option>
				    <option value="5" <?php if ($_POST['quest']=='5') { ?> selected="selected" <?php } ?> >Nơi để lại kỉ niệm khó quên nhất?</option>
				  </select>
                </div>
                <div class="form-col-3"><label id="msg_quest" class="msg"></label></div>
            </div>

            <div class="form-row">
                <div class="form-col-1">Trả lời bí mật <font color="red">*</font></div>
                <div class="form-col-2">
                    <input class="form-style" name="ans" type="text" id="ans" size="17" maxlength="50" value="<?php echo $_POST['ans']; ?>" onfocus="focus_chuso(this.value,'msg_'+this.name);" onkeyup="check_chuso_4_10(this.value,'msg_'+this.name)"></div>
                <div class="form-col-3"><label id="msg_ans" class="msg"></label></div>
            </div>
            <div class="form-row">
                <div class="form-col-1">Số điện thoại cũ<font color="red">*</font></div>
                <div class="form-col-2"><input class="form-style" name="tel_old" type="text" id="tel_old" size="17" maxlength="15" value="<?php echo $_POST['tel']; ?>" onfocus="focus_tel(this.value,'msg_'+this.name);" onkeyup="check_tel(this.value,'msg_'+this.name)"></div>
                <div class="form-col-3"><label id="msg_tel_old" class="msg"></label></div>
            </div>
            <div class="form-row">
                <div class="form-col-1">&nbsp;</div>
                <div class="form-col-2"><button class="btn btn-green btn-block btn-lg" type="submit" onsubmit="return btn_check_sdtinfo();">Hoàn tất thay đổi</button></div>
                <div class="form-col-3">&nbsp;</div>
            </div>
        </div>
        </form>
</div>
