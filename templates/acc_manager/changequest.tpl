<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Đổi câu hỏi bí mật</h1>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Đổi câu hỏi bí mật</span></h1>
    </div>
    <form id="changequest" name="changequest" method="post" action="index.php?mod=acc_manager&act=changequest">
        <input type="hidden" name="action" value="changequest" />
        <div class="form-3">
            <div class="form-row">
                <div class="form-col-1">Câu hỏi bí mật mới</div>
                <div class="form-col-2"><select name="quest" class="form-style">
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
				  </select></div>
                <div class="form-col-3"><label id="msg_quest" class="msg"></label></div>
            </div>
            <div class="line"></div>
            <div class="form-row">
                <div class="form-col-1">&nbsp;</div>
                <div class="form-col-2"><button class="btn btn-green btn-block btn-lg" type="submit" onsubmit="return btn_check_quest();">Hoàn tất thay đổi</button></div>
                <div class="form-col-3">&nbsp;</div>
            </div>
        </div>
    </form>
</div>