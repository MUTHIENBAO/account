<?php if (isset($_SESSION[mu_nvchon])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Đổi vé Santa Ticket</h1>
    </div>
</div>

<div class="out-top-20">
    <table class="table table-blue table-text-center table-border-2">
        <thead>
            <tr>
                <th align="center">Tên Vật Phẩm</th>
                <th align="center">Hình Ảnh</th>
                <th align="center">Giá Trị Quy Đổi</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td align="center"><?php echo $event_item_name; ?></td>
                <td align="center"><img src="img_item/santa_ticket.jpg"></td>
                <td align="center"><b> <?php echo number_format($event_vpoint, 0, ',', '.'); ?> </b> Vcent</td>
            </tr>
        </tbody>
    </table>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">
<form id="santa_ticket" name="santa_ticket" method="post" action="index.php?mod=event&act=santa_ticket">
	<input type="hidden" name="action" value="santa_ticket" />
	<input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />
    <div class="form-2">
        <div class="form-row">
            <div class="form-col-1">Nhân vật đổi Event</div>
            <div class="form-col-2">
                <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
            </div>
        </div>

        <div class="form-row">
            <div class="form-col-1">Đổi nhân vật</div>
            <div class="form-col-2"><?php echo $doinv; ?></div>
        </div>
        <div class="form-row">
            <div class="form-col-1">Thoát Game</div>
            <div class="form-col-2"><?php echo $online; ?></div>
        </div>
        <div class="form-row">
            <div class="form-col-1">Mật khẩu cấp 2</div>
            <div class="form-col-2"><input type="password" name="pass2" size="14" maxlength="32" class="form-style"/></div>
        </div>
        <div class="form-row">
            <button class="btn btn-green btn-block btn-lg" type="submit" name="Submit" <?php if($accept=='0') { echo 'disabled="disabled" class="NotAccept"'; } else { echo 'class="Accept"'; } ?> >Đổi Vcent</button>
		</div>
    </div>
</form>
        
    </div>
</div>
<?php } else include('templates/char_manager.tpl'); ?>