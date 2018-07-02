<?php if(isset($_SESSION['mu_nvchon'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Đổi Item Vcent ra Vcent</h1>
    </div>
</div>


<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Số Vcent nhận được tương ứng với số Item Vcent đổi.</li>
            <li>Sau khi đổi xong,cần phải thoát tài khoản đăng nhập lại để cập nhật.</li>
            <li class="tik">Item Vcent 50k không được ném ra đất</li>
            <li>Mọi trường hợp không đọc kỹ trước khí sử dụng đều không được giải quyết</li>
        </ul>
    </div>
</div>

<div class="out-top-20">
    <table class="table table-blue table-text-center table-border-2">
        <thead>
            <tr>
                <th align="center">#</th>
                <th align="center"><strong>Hình ảnh</strong></th>
                <th align="center"><strong>Tên Item</strong></th>
                <th align="center"><strong>Nhận được</strong> (Vcent)</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td align="center">1</td>
                <td align="center" bgcolor="#121212"><img src="img_item/gold.gif"></td>
                <td align="center">Item 1.000 Vcent</td>
                <td align="center"><b><?php echo number_format($item_low, 0, ',', '.'); ?></b></td>
            </tr>
            <tr>
                <td align="center">2</td>
                <td align="center" bgcolor="#121212"><img src="img_item/zen.gif"></td>
                <td align="center">Item 10.000 Vcent</td>
                <td align="center"><b><?php echo number_format($item_hight, 0, ',', '.'); ?></b></td>

            </tr>
            <tr>
                <td align="center">3</td>
                <td align="center" bgcolor="#121212"><img src="items/1412000.gif"></td>
                <td align="center">Item 50.000 Vcent</td>
                <td align="center"><b><?php echo number_format($item_50k, 0, ',', '.'); ?></b></td>
            </tr>
            <!--<tr>
                <td align="center">4</td>
                <td align="center" bgcolor="#121212"><img src="img_item/zen50k.jpg"></td>
                <td align="center">Item "Zen"</td>
                <td align="center"><b><?php echo number_format($item_50k, 0, ',', '.'); ?></b></td>
            </tr>-->
        </tbody>
    </table>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">
<form id="item2vpoint" name="item2vpoint" method="post" action="index.php?mod=tiente&act=item2vpoint">
	<input type="hidden" name="action" value="item2vpoint" />
	<input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />

    <div class="form-3">
        <div class="form-row">
            <div class="form-col-1">Nhân vật Đổi Item Vcent </div>
            <div class="form-col-2">
                <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
            </div>
        </div>

        <div class="form-row">
            <div class="form-col-1">Mật khẩu cấp 2</div>
            <div class="form-col-2"><input class="form-style" type="password" name="pass2" size="14" maxlength="32"/></div>
        </div>

        <div class="form-submit">
            <button class="btn btn-green btn-lg" type="submit" name="Submit">Đổi Vcent</button>
        </div>
    </div>
</form>
    </div>
</div>
<?php } else include('templates/char_manager.tpl'); ?>