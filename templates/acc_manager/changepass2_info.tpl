<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Đổi mật khẩu Web 2</h1>
        <ul class="tabs-content">
            <li class="active"><a href="#acc_manager&act=changepass2_info" rel="ajax">Dùng thông tin tài khoản</a></li>
            <li><a href="#acc_manager&act=changepass2" rel="ajax">Dùng dịch vụ SMS</a></li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Dùng thông tin tài khoản</span></h1>
    </div>

    <form id="changepass2" name="changepass2" method="post" action="index.php?mod=acc_manager&act=changepass2_info">
        <input type="hidden" name="action" value="changepass2" />
        <div class="form-3">
            <div class="form-row">
                <div class="form-col-1">Mật khẩu Cấp 2 mới</div>
                <div class="form-col-2"><input class="form-style" type="password" name="pass2new" id="pass2new" size="14" maxlength="32" onfocus="focus_chuso(this.value,'msg_'+this.name);" onkeyup="check_chuso_4_20(this.value,'msg_'+this.name)"></div>
                <div class="form-col-3"><label id="msg_pass2new" class="msg"></label></div>
            </div>
            <div class="form-row">
                <div class="form-col-1">Xác minh Mật khẩu Cấp 2 mới</div>
                <div class="form-col-2"><input class="form-style" type="password" name="pass2new_verify" id="pass2new_verify" size="14" maxlength="32" onfocus="focus_chuso(this.value,'msg_'+this.name);" onblur="onblur_check_repass(this.form.pass2new.value,this.value,'msg_'+this.name)"></div>
                <div class="form-col-3"><label id="msg_pass2new_verify" class="msg"></label></div>
            </div>
            <div class="line"></div>
            <p class="in-10">Thông tin kiểm tra</p>
            <div class="form-row">
                <div class="form-col-1">Mật khẩu Web cấp 2 cũ<font color="red">*</font></div>
                <div class="form-col-2"><input class="form-style" name="pass2" type="password" id="pass2" size="14" maxlength="32" onfocus="focus_chuso(this.value,'msg_'+this.name);" onkeyup="check_chuso_4_20(this.value,'msg_'+this.name)"></div>
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
				    <option value="">[Chọn câu hỏi]</option>
			                <option label="Tên cha của bạn là gì?" value="1" <?php if (isset($_POST['quest']) && $_POST['quest']=='1') { ?> selected="selected" <?php } ?> >
			                Tên cha của bạn là gì?</option>
			                <option label="Tên ngôi trường đầu tiên của bạn là gì?" value="2" <?php if (isset($_POST['quest']) && $_POST['quest']=='2') { ?> selected="selected" <?php } ?> >
			                Tên ngôi trường đầu tiên của bạn là gì?			  </option>
			                <option label="Người anh hùng trong thời thơ ấu của bạn là ai?" value="3" <?php if (isset($_POST['quest']) && $_POST['quest']=='3') { ?> selected="selected" <?php } ?> >
			                Người anh hùng trong thời thơ ấu của bạn là ai?			  </option>
			                <option label="Khái niệm đẹp của bạn là gì?" value="4" <?php if (isset($_POST['quest']) && $_POST['quest']=='4') { ?> selected="selected" <?php } ?> >
			                Khái niệm đẹp của bạn là gì?			  </option>
			                <option label="Đội thể thao bạn thích nhất là đội nào?" value="5" <?php if (isset($_POST['quest']) && $_POST['quest']=='5') { ?> selected="selected" <?php } ?> >
			                Đội thể thao bạn thích nhất là đội nào?			  </option>
			                <option label="Vật mang lại may mắn thời học sinh của bạn là gì?" value="6" <?php if (isset($_POST['quest']) && $_POST['quest']=='6') { ?> selected="selected" <?php } ?> >
			                Vật mang lại may mắn thời học sinh của bạn là gì?			  </option>
			                <option label="Nơi bạn gặp vợ(chồng) của bạn nơi nào?" value="7" <?php if (isset($_POST['quest']) && $_POST['quest']=='7') { ?> selected="selected" <?php } ?> >
			                Nơi bạn gặp vợ(chồng) của bạn nơi nào?</option>
			                <option label="Tên con thú cưng của bạn là gì?" value="8" <?php if (isset($_POST['quest']) && $_POST['quest']=='8') { ?> selected="selected" <?php } ?> >
			                Tên con thú cưng của bạn là gì?</option>
		  </select>
                </div>
                <div class="form-col-3"><label id="msg_quest" class="msg"></label></div>
            </div>

            <div class="form-row">
                <div class="form-col-1">Trả lời bí mật <font color="red">*</font></div>
                <div class="form-col-2">
                    <input class="form-style" name="ans" type="text" id="ans" size="17" maxlength="50" value="<?php echo $_POST['ans']; ?>" onfocus="focus_chuso(this.value,'msg_'+this.name);" onkeyup="check_chuso_4_10(this.value,'msg_'+this.name)"></div>
                <div class="form-col-3">
                    <label id="msg_ans" class="msg"></label>
                </div>
            </div>
            <div class="line"></div>
            <div class="form-row">
                <div class="form-col-1">&nbsp;</div>
                <div class="form-col-2"><button class="btn btn-green btn-block btn-lg" type="submit" onsubmit="return btn_check_changepass2();">Hoàn tất thay đổi</button></div>
                <div class="form-col-3">&nbsp;</div>
            </div>
        </div>
    </form>
</div>