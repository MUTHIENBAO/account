<div class="primary-block">
    <div class="in-20">
        <p class="title-text-lg in-top-20">Lấy mật khẩu Web cấp 1</p>
        <div class="out-top-20">
            <form id="changepass1" name="changepass1" method="post" action="index.php?mod=receive_pass1">

                <div class="form-3">
                    <div class="form-row">
                        <div class="form-col-1">Tên đăng nhập</div>
                        <div class="form-col-2"><input type="text" name="acc" id="acc" class="form-style" maxlength="10"></div>
                        <div class="form-col-3">
                            <div id="user_suggestion" style="display:none;">
                                <li>Tên tài khoản không được viết Hoa</li>
                                <li>Chỉ cho phép sử dụng 6-10 kí tự a-z,0-9</li>
                            </div>
                            <div id="msg_username"></div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-col-1">&nbsp;</div>
                        <div class="form-col-2"><img src="img.php?size=6&v=<?php echo time(); ?>" /></div>
                        <div class="form-col-3">&nbsp;</div>
                    </div>
                    <div class="form-row">
                        <div class="form-col-1">Xác minh mã kiểm tra</div>
                        <div class="form-col-2"><?php $vImage->showCodBox(1); ?></div>
                        <div class="form-col-3">&nbsp;</div>
                    </div>
                </div>
                <div class="line"></div>
                <div class="form-row">
                    <div class="form-col-1">&nbsp;</div>
                    <div class="form-col-2"><button class="btn btn-green btn-block btn-lg" type="submit" name="submit">Lấy lại mật khẩu</button></div>
                    <div class="form-col-3">&nbsp;</div>
                </div>
            <input type="hidden" name="action" value="receivepass1" />
        </form>
        
        </div>
    </div>
</div>