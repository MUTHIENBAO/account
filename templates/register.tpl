<div class="primary-block">
    <div class="in-20">
        <p class="title-text-lg in-top-20">Đăng ký</p>
        <div class="out-top-20">
            <form method="post" name="register" action='index.php?mod=register' onsubmit="return onSubmit_register();">
                <input type="hidden" name="register" value="register" />
                <div class="form-3">
                    <div class="form-row">
                        <div class="form-col-1">Tên đăng nhập</div>
                        <div class="form-col-2"><input class="form-style" type="text" id="user" name="username" maxlength="10" value="<?php if(isset($_POST['username'])) echo $_POST['username']; ?>" onfocus="onBlur_check_user('user', 'msg_username')" onkeyup="onBlur_check_user('user', 'msg_username')"/></div>
                        <div class="form-col-3 form-error-msg">
                            <div id="user_suggestion"></div>
                            <div id="msg_username"></div>
                        </div>
                    </div>
                    <div class="form-row">
                        <?php
						$thehe_count = 0;
						$thehe_lastid = 0;
						for($i=count($thehe_choise)-1;$i>=1;$i--) {
							if(strlen($thehe_choise[$i]) > 0) {
								if($thehe_lastid == 0) $thehe_lastid = $i;
								$thehe_count++;
							}
						}

                        if($thehe_count > 1) {
                        ?>
                        <div class="form-col-1">Thế hệ </div>
                        <div class="form-col-2">
                            <select name="thehe">
                                <?php
                        for($i=count($thehe_choise)-1;$i>=1;$i--) {
                                if(strlen($thehe_choise[$i]) > 0) {
                                ?>
                                <option value="<?php echo $i; ?>"><?php echo $thehe_choise[$i]; ?></option>
                                <?php
                        } }
                    ?>
                            </select>
                        </div>
                        <div class="form-col-3 form-error-msg">
                            
                        </div>
                        <?php
                } else {
                    echo "<input type='hidden' name='thehe' value='". $thehe_lastid ."' />";
                        }
                        ?>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-col-1">Mật khẩu Game</div>
                        <div class="form-col-2"><input class="form-style" type="password" id="passgame" name="passgame" maxlength="10"  onfocus="onBlur_check_pass('passgame', 'msg_passgame')" onkeyup="onBlur_check_pass('passgame', 'msg_passgame')"/></div>
                        <div class="form-col-3 form-error-msg">
                            <div id="passgame_suggestion">
                            </div>
                            <div id="msg_passgame"></div>
                        </div>
                    </div>
                    <div class="line"></div>
                    
                    <div class="form-row">
                        <div class="form-col-1">Mật khẩu web 1</div>
                        <div class="form-col-2"><input class="form-style" type="password" id="passweb1" name="pass1" maxlength="16"  onfocus="onBlur_check_pass('passweb1', 'msg_pass1')" onkeyup="onBlur_check_pass('passweb1', 'msg_pass1')"/></div>
                        <div class="form-col-3 form-error-msg">
                            <div id="passweb1_suggestion">
                            </div>
                            <div id="msg_pass1"></div>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-col-1">Mật khẩu web 2</div>
                        <div class="form-col-2"><input class="form-style" type="password" id="passweb2" name="pass2" maxlength="16" onfocus="onBlur_check_pass('passweb2', 'msg_pass2')" onkeyup="onBlur_check_pass('passweb2', 'msg_pass2')"/></div>
                        <div class="form-col-3 form-error-msg">
                            <div id="passweb2_suggestion">
                            </div>	
                            <div id="msg_pass2"></div>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-col-1">Email</div>
                        <div class="form-col-2"><input class="form-style" type="text" id="email" name="email" maxlength="50" onfocus="onBlur_check_mail('email', 'msg_email')" onkeyup="onBlur_check_mail('email', 'msg_email')"/></div>
                        <div class="form-col-3 form-error-msg">
                            <div id="email_suggestion"></div>	
                            <div id="msg_email"></div>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-col-1">Câu hỏi bí mật</div>
                        <div class="form-col-2">
                            <select id="quest" name="quest" onchange="onBlur_check_quest()">
                                <option value="0">[Chọn câu hỏi]</option>
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
                        <div class="form-col-3 form-error-msg">
                            <div id="msg_quest"></div>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-col-1">&nbsp;</div>
                        <div class="form-col-2"><input class="form-style" type="text" id="answer" name="ans" onfocus="onBlur_check_quest()" onkeyup="onBlur_check_quest()" /></div>
                        <div class="form-col-3 form-error-msg">
                            <div id="msg_ans"></div>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-col-1">7 số bí mật</div>
                        <div class="form-col-2"><input class="form-style" type="text" id="sno_numb" name="sno_numb"  onfocus="onBlur_check_sno('sno_numb', 'msg_sno_numb')" onkeyup="onBlur_check_sno('sno_numb', 'msg_sno_numb')" /></div>
                        <div class="form-col-3 form-error-msg">
                            <div id="sno_numb_suggestion" style="display:none;">
                                <li>Dùng để xác minh khi thoát Guild, thoát Liên Minh,...</li>
                            </div>
                        	<div id="msg_sno_numb"></div>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-col-1">Số điện thoại</div>
                        <div class="form-col-2"><input class="form-style" type="text" id="phone" name="tel" onfocus="onBlur_check_phone('phone', 'msg_tel')" onkeyup="onBlur_check_phone('phone', 'msg_tel')" /></div>
                        <div class="form-col-3 form-error-msg">
                            <div id="phone_suggestion" style="display:none;">
                                <li>Dùng để xác minh tài khoản. Điền số Phone có thực.</li>
                            </div>
                        	<div id="msg_tel"></div>
                        </div>
                    </div>
                    
                    
                    
                    <div class="form-row">
                        <div class="form-col-1">&nbsp;</div>
                        <div class="form-col-2"><img src="img.php?size=6&v=<?php echo time(); ?>" /></div>
                        <div class="form-col-3 form-error-msg">&nbsp;</div>
                    </div>
                    <div class="form-row">
                        <div class="form-col-1">Mã xác nhận</div>
                        <div class="form-col-2">
                            <?php $vImage->showCodBox(1); ?>
                        </div>
                        <div class="form-col-3 form-error-msg">
                            <div id="vImageCodP_suggestion" style="display:none;">
                                <li>Nhập lại 6 ký tự từ ảnh trên.</li>
                            </div>
                            <div id="security_code_error"></div>
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="form-row">
                        <div class="form-col-1">&nbsp;</div>
                        <div class="form-col-2"><input type="submit" name="register_submit" class="btn btn-green btn-block btn-lg" value="Đăng ký tài khoản" /><a rel="ajax" href="http://id.muthienbao.net" class="btn btn-orange btn-block btn-lg tooltipstered" style="width: initial; margin-top: 10px;" id="home_toggle">Trở về</a></div>
                        <div class="form-col-3 form-error-msg">&nbsp;</div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

