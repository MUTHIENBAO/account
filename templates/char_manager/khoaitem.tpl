<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Khóa đồ</h1>
    </div>
</div>
<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Hướng dẫn</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
			<li>Khi khóa item thì mọi thứ trên người nhân vật sẽ được <strong>Bảo Vệ</strong> không thể di chuyển hoặc bán shop</li>
			<li>Có thể uống bình HP, Mana và mua vật phẩm ở Shop game nhưng không thể bán bất kì item nào vào shop</li>
		</ul>
    </div>
</div>
<div class="primary-block out-top-20">
    <div class="in-20">
        <div class="form-2">
            <div class="form-row">
                <div class="form-col-1"><span>Nhân vật Chọn</span></div>
                <div class="form-col-2">
                <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
                </div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <div class="line"></div>
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
            <div class="line"></div>
<?php if($_SESSION[nv_khoado] != 1) { ?>
		<form id="khoaitem" name="khoaitem" method="post" action="index.php?mod=char_manager&act=khoaitem">

		  <input type="hidden" name="action" value="khoaitem" />
            <p class="in-10">Khóa Đồ</p>
            <div class="form-row">
                <div class="form-col-1"><span>Khởi tạo Mã khóa đồ </span></div>
                <div class="form-col-2">
                    <input class="form-style" type="password" name="makhoado" size="14" maxlength="10"/>
                </div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <div class="form-row">
                <div class="form-col-1"><span>Nhập lại mã khóa đồ  </span></div>
                <div class="form-col-2">
                    <input class="form-style" type="password" name="remakhoado" size="14" maxlength="10"/>
                </div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <div class="form-submit">

                    <button class="btn btn-green btn-block btn-lg" type="submit" name="Submit" <?php if($accept=='0') { echo 'disabled="disabled"'; }  ?>>Khóa Đồ</button>

            </div>
        </form>
		
<?php } else { ?>
		
		<form id="mokhoaitem" name="mokhoaitem" method="post" action="index.php?mod=char_manager&act=khoaitem">

		  <input type="hidden" name="action" value="mokhoaitem" />
		  	<p class="in-10">Mở Khóa Đồ</p>
            <div class="form-row">
                <div class="form-col-1"><span>Mã khóa đồ </span></div>
                <div class="form-col-2">
                    <input class="form-style" type="password" name="makhoado" size="14" maxlength="10"/>
                </div>
            </div>
            <div class="form-submit">

                    <button class="btn btn-green btn-block btn-lg" type="submit" name="Submit" <?php if($accept=='0') { echo 'disabled="disabled"'; }  ?> >Mở Khóa Đồ</button>

            </div>
        </form>
		
		<form id="editmakhoa" name="editmakhoa" method="post" action="index.php?mod=char_manager&act=khoaitem">

		  <input type="hidden" name="action" value="editmakhoa" />
            <p class="in-10">Đổi mã Khóa Đồ</p>
            <div class="form-row">
                <div class="form-col-1"><span>Mật khẩu Cấp 2 </span></div>
                <div class="form-col-2">
                    <input class="form-style" type="password" name="pass2" size="14" maxlength="32"/>
                </div>
            </div>
            <div class="form-row">
                <div class="form-col-1"><span>Mã khóa đồ mới </span></div>
                <div class="form-col-2">
                    <input class="form-style" type="password" name="makhoado" size="14" maxlength="10"/>
                </div>
            </div>
            <div class="form-row">
                <div class="form-col-1"><span>Nhập lại mã khóa đồ mới </span></div>
                <div class="form-col-2">
                    <input class="form-style" type="password" name="remakhoado" size="14" maxlength="10"/>
                </div>
            </div>
            <div class="form-row">

                    <button class="btn btn-green btn-block btn-lg" type="submit" name="Submit">Sửa mã Khóa Đồ</button>

            </div>
        </form>
<?php } ?>
        </div>
    </div>
</div>
						
