<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Đổi tên nhân vật</h1>
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <div id="rs_content">
            <ul class="noted in-left-10">
                <li><b>Chi phí : <?php echo number_format($changename_gcoin, 0, ',', '.'); ?> Gcent</b></li>
                <li>Được sử dụng Gcent Khuyến Mãi</li>
                <li><strong>Hướng dẫn Đổi Tên nhân vật : </strong></li>
                <li><strong>Đổi Tên Nhân vật</strong> thực chất là chuyển toàn bộ dữ liệu từ Nhân vật này sang Nhân vật khác trong cùng 1 tài khoản.</li>
                <li>Tạo sẵn nhân vật với tên mới cần đổi</li>
                <li>Chọn nhân vật cần đổi tên</li>
                <li>Chọn nhân vật với tên mới cần đổi</li>
            </ul>
        </div>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">

<form id="changename" name="changename" method="post" action="index.php?mod=char_manager&act=changename">
    <input type="hidden" name="action" value="changename" />
    <input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />
    <div class="form-2">
        <div class="form-row">
            <div class="form-col-1"><span>Nhân vật đổi tên </span></div>
            <div class="form-col-2">
                <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
            </div>
            <div class="form-col-3">&nbsp;</div>
        </div>

        <div class="form-row">
            <div class="form-col-1"><span>Tên mới</span></div>
            <div class="form-col-2">

            <select name="namenew" class="form-style">
			    <option value="0">-- Chọn nhân vật --</option>
			    	<?php if ($_SESSION[nv_slg]>0 && $_SESSION[char1]!=$_SESSION[mu_nvchon]) { ?> <option value="<?php echo $_SESSION[char1] ?>" <?php if($_SESSION[mu_nvchon]==$_SESSION[char1]) { ?> selected='selected' <?php } ?> > <?php echo $_SESSION[char1]; ?></option> <?php } ?>
					<?php if ($_SESSION[nv_slg]>1 && $_SESSION[char2]!=$_SESSION[mu_nvchon]) { ?> <option value="<?php echo $_SESSION[char2] ?>" <?php if($_SESSION[mu_nvchon]==$_SESSION[char2]) { ?> selected='selected' <?php } ?> > <?php echo $_SESSION[char2]; ?></option> <?php } ?>
					<?php if ($_SESSION[nv_slg]>2 && $_SESSION[char3]!=$_SESSION[mu_nvchon]) { ?> <option value="<?php echo $_SESSION[char3] ?>" <?php if($_SESSION[mu_nvchon]==$_SESSION[char3]) { ?> selected='selected' <?php } ?> > <?php echo $_SESSION[char3]; ?></option> <?php } ?>
					<?php if ($_SESSION[nv_slg]>3 && $_SESSION[char4]!=$_SESSION[mu_nvchon]) { ?> <option value="<?php echo $_SESSION[char4] ?>" <?php if($_SESSION[mu_nvchon]==$_SESSION[char4]) { ?> selected='selected' <?php } ?> > <?php echo $_SESSION[char4]; ?></option> <?php } ?>
					<?php if ($_SESSION[nv_slg]>4 && $_SESSION[char5]!=$_SESSION[mu_nvchon]) { ?> <option value="<?php echo $_SESSION[char5] ?>" <?php if($_SESSION[mu_nvchon]==$_SESSION[char5]) { ?> selected='selected' <?php } ?> > <?php echo $_SESSION[char5]; ?></option> <?php } ?>

			  	</select>

            </div>
            <div class="form-col-3"><label id="msg_nhanvat" class="msg"></label></div>
        </div>
        <div class="line"></div>
        <div class="form-row">
            <div class="form-col-1"><span>Mật khẩu Web cấp 2 <font color="red">*</font></span></div>
            <div class="form-col-2">
                <input class="form-style" name="pass2" type="password" id="pass2" size="14" maxlength="32" onfocus="focus_chuso(this.value,'msg_'+this.name);" onkeyup="check_chuso_4_20(this.value,'msg_'+this.name)">

            </div>
            <div class="form-col-3"><label id="msg_pass2" class="msg"></label></div>
        </div>
        <div class="form-row">
            <div class="form-col-1"><span>Câu hỏi bí mật <font color="red">*</font></span></div>
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
            <div class="form-col-1"><span>Trả lời bí mật <font color="red">*</font></span></div>
            <div class="form-col-2">
                <input class="form-style" name="ans" type="text" id="ans" size="17" maxlength="10" value="<?php echo $_POST['ans']; ?>" onfocus="focus_chuso(this.value,'msg_'+this.name);" onkeyup="check_chuso_4_10(this.value,'msg_'+this.name)">

            </div>
            <div class="form-col-3"><label id="msg_ans" class="msg"></label></div>
        </div>
        <div class="form-row">
            <div class="form-col-1"><span>Đổi nhân vật</span></div>
            <div class="form-col-2">
                <?php echo $doinv; ?>
            </div>
            <div class="form-col-3">&nbsp;</div>
        </div>
        <div class="form-row">
            <div class="form-col-1"><span>Thoát Game</span></div>
            <div class="form-col-2">
                <?php echo $online; ?>
            </div>
            <div class="form-col-3">&nbsp;</div>
        </div>
        <div class="form-submit">

                <button class="btn btn-green btn-block btn-lg" type="submit" name="Submit" <?php if($accept=='0') { echo 'disabled="disabled"'; } ?> >Đổi Tên Nhân Vật</button>

        </div>
    </div>
</form>
    </div>
</div>