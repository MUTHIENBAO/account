<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Thông tin tài khoản</h1>
        <form method="post" name="update_acc_info" action='index.php?mod=acc_manager&act=update_acc_info'>
            <input type="hidden" name="update_acc_info" value="1" />
            <div class="form-3">
            
                <div class="line"></div>
                <p class="in-10">Thông tin kiểm tra <span class="color-red">(bắt buộc)</span></p>
                <div class="form-row">
                    <div class="form-col-1">Mật khẩu web cấp 1</div>
                    <div class="form-col-2"><input class="form-style" type="password" id="passweb1" name="pass1" size="30" maxlength="16" /></div>
                    <div class="form-col-3"></div>
                </div>
                <div class="line"></div>
                <p class="in-10">Thông tin tài khoản cập nhập thêm <span class="color-red">(bắt buộc)</span></p>
                
                <div class="form-row">
                    <div class="form-col-1">Mật khẩu Game</div>
                    <div class="form-col-2"><input class="form-style" onblur="hideSuggestion('passgame_suggestion');" onfocus="showSuggestion('passgame_suggestion'); hideError('passgame');" type="password" id="passgame" name="passgame" maxlength="10" /></div>
                    <div class="form-col-3">
                        <div id="passgame_suggestion" style="display:none;">
                            <li>Chỉ cho phép sử dụng 6-16 kí tự a-z,0-9</li>
                        </div>
                        <div id="msg_passgame"></div>
                    </div>
                </div>
                <div class="line"></div>
                
                <div class="form-row">
                    <div class="form-col-1">Mật khẩu web cấp 2</div>
                    <div class="form-col-2"><input class="form-style" onblur="hideSuggestion('passweb2_suggestion');" onfocus="showSuggestion('passweb2_suggestion'); hideError('passweb2');" type="password" id="passweb2" name="pass2" maxlength="16" /></div>
                    <div class="form-col-3">
                        <div id="passweb2_suggestion" style="display:none;">
                            <li>Chỉ cho phép sử dụng 6-16 kí tự a-z,0-9</li>
                        </div>
                        <div id="msg_pass2"></div>
                    </div>
                </div>
                <div class="line"></div>
                
                <div class="form-row">
                    <div class="form-col-1">Địa chỉ email</div>
                    <div class="form-col-2"><input class="form-style" onblur="hideSuggestion('email_suggestion');" onfocus="showSuggestion('email_suggestion'); hideError('email');" type="text" value="<?php if(isset($_POST['email'])) echo $_POST['email']; ?>" id="email" name="email" size="30" maxlength="50" /></div>
                    <div class="form-col-3">
                        <div id="email_suggestion" style="display:none;">
                            <li>Được dùng tối đa 45 kí tự a-z,@,.,0-9</li>
                        </div>
                        <div id="msg_email"></div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-col-1">Câu hỏi bí mật</div>
                    <div class="form-col-2">
                        <select class="form-style" onfocus="hideError('quest');" id="quest" name="quest" style="width: 206px">
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
                    <div class="form-col-3"><div id="msg_quest"></div></div>
                </div>
                <div class="form-row">
                    <div class="form-col-1">Câu trả lời bí mật</div>
                    <div class="form-col-2"><input class="form-style" onfocus="hideError('answer');" type="text" value="<?php if(isset($_POST['ans'])) echo $_POST['ans']; ?>" id="answer" name="ans" size="30" maxlength="45" /></div>
                    <div class="form-col-3"><div id="msg_ans"></div></div>
                </div>
                <div class="form-row">
                    <div class="form-col-1">Số điện thoại</div>
                    <div class="form-col-2"><input class="form-style" onblur="hideSuggestion('phone_suggestion');" onfocus="showSuggestion('phone_suggestion'); hideError('phone');" type="text" value="<?php if(isset($_POST['tel'])) echo $_POST['tel']; ?>" id="phone" name="tel" size="30" maxlength="12" /></div>
                    <div class="form-col-3">
                        <div id="phone_suggestion" style="display:none;">
                            <li>Dùng để xác minh tài khoản. Điền số Phone có thực.</li>
                        </div>
                        <div id="msg_tel"></div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-col-1">&nbsp;</div>
                    <div class="form-col-2"><img src="img.php?size=6&v=<?php echo time(); ?>" /></div>
                    <div class="form-col-3">&nbsp;</div>
                </div>
                <div class="form-row">
                    <div class="form-col-1">Mã xác nhận</div>
                    <div class="form-col-2"><?php $vImage->showCodBox(1); ?></div>
                    <div class="form-col-3">
                        <div id="vImageCodP_suggestion" style="display:none;">
                            <li>Nhập lại 6 ký tự từ ảnh trên.</li>
                        </div>
                        <div id="security_code_error"></div>
                    </div>
                </div>
                <div class="line"></div>
                <div class="form-row">
                    <div class="form-col-1">&nbsp;</div>
                    <div class="form-col-2"><button class="btn btn-green btn-block btn-lg" type="submit" name="submit">Hoàn tất thay đổi</button></div>
                    <div class="form-col-3">&nbsp;</div>
                </div>
            </div>
        </form>
    </div>
</div>
