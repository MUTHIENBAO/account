<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Đổi câu trả lời bí mật</h1>
    </div>
</div>
<div class="primary-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Dùng tin nhắn SMS</span></h1>
    </div>
    <form id="changeans" name="changeans" method="post" action="index.php?mod=acc_manager&act=changeans">
        <input type="hidden" name="action" value="changeans" />
        <div class="form-3">
            <div class="form-row">
                <div class="form-col-1">Câu trả lời bí mật mới</div>
                <div class="form-col-2"><input class="form-style" type="password" name="ans" id="ans" maxlength="50" onfocus="focus_chuso(this.value,'msg_'+this.name);" onkeyup="check_chuso_4_10(this.value,'msg_'+this.name)"> <label id="msg_ans" class="msg"></label></div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <div class="form-row">
                <div class="form-col-1">Xác minh Câu trả lời bí mật mới</div>
                <div class="form-col-2"><input class="form-style" type="password" name="ans_verify" id="ans_verify" maxlength="50" onfocus="focus_chuso(this.value,'msg_'+this.name);" onblur="onblur_check_repass(this.form.ans.value,this.value,'msg_'+this.name)"> <label id="msg_ans_verify" class="msg"></label></div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <div class="line"></div>
            <div class="form-row">
                <div class="form-col-1">&nbsp;</div>
                <div class="form-col-2"><button class="btn btn-green btn-block btn-lg" type="submit" onsubmit="return btn_check_ans();">Hoàn tất thay đổi</button></div>
                <div class="form-col-3">&nbsp;</div>
            </div>
        </div>
    </form>
</div>

