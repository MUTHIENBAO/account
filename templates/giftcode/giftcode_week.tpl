<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">GiftCode Tuần</h1>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">
    <form id="giftcode_week" name="giftcode_week" method="post" action="index.php?mod=giftcode&act=giftcode_week">
        <input type="hidden" name="action" value="giftcode_week" />
    	<table class="table table-blue table-text-center table-border-2">
				<tr bgcolor="#FFFFFF" >
					<td align="center"><strong>STT</strong></td>
					<td align="center"><strong>Thông tin phần thưởng GiftCode Tuần</strong></td>
				</tr>
				<?php for($i=0; $i<count($item_read); $i++) { ?>
                <tr bgcolor="#FFFFFF" >
                    <td align="center"><?php echo $i+1; ?></td>
					<td align="center"><strong><?php echo $item_read[$i]['des']; ?></strong></td>
				</tr>
                <?php } ?>
                <tr bgcolor="#FFFFFF" >
					<td align="justify" colspan="3">
					<center><b>Lưu Ý</b></center><br />
                    - Tài khoản phải có nhân vật <strong>Reset từ <?php echo $gift_reset_min; ?> lần trở lên hoặc đã ReLife</strong> mới được nhận GiftCode Tuần.<br />
					- Phần thưởng nhận được là ngẫu nhiên trong danh sách bên trên.<br />
                    - Mỗi tài khoản chỉ nhận và sử dụng được GiftCode tuần 1 lần duy nhất trong vòng 7 ngày.<br />
                    - Không thể sử dụng GiftCode tuần của tài khoản này cho tài khoản khác.<br />
                    - Phần thưởng GiftCode tuần <strong>
                    <?php 
                        if($trade == 1) echo "Có thể giao dịch, ";
                        else echo "Không thể giao dịch, ";
                     ?>
                     <?php 
                        if($sell == 1) echo "Có thể bán SHOP, ";
                        else echo "Không thể bán SHOP, ";
                     ?>
                     <?php 
                        if($repair == 1) echo "Có thể Sửa.";
                        else echo "Không thể Sửa.";
                     ?>
                     </strong>
					</td>
				</tr>
                <tr bgcolor="#FFFFFF" >
                    <td align="justify" colspan="3">
                        <table align="center">
                        <tr>
                			<td align="right" colspan="2"><strong>Đăng ký nhận GiftCode Tuần</strong></td>
                		</tr>
                        <tr>
                			<td align="right">Thời gian nhận GiftCode:</td>
                			<td><strong><?php echo $giftcode_week_timebegin ."h00 - ". $giftcode_week_timeend ."h00" ?></strong> hàng ngày</td>
                		</tr>
                        <tr>
                			<td align="right">Cơ hội nhận GiftCode:</td>
                			<td><strong>50%</strong></td>
                		</tr>
                        <tr>
                			<td align="right">GiftCode phát tối đa:</td>
                			<td><strong><?php echo $gift_week_max; ?></strong> / ngày</td>
                		</tr>
                        <tr>
                			<td align="right">Mật khẩu cấp 2</td>
                			<td><input type="password" name="pass2" size="14" maxlength="32" class="keyboardInput"/></td>
                		</tr>
                		<tr>
                			<td>&nbsp;</td>
                			<td><input type="submit" name="Submit" value="Đăng ký nhận GiftCode" <?php if($accept=='0') { echo 'disabled="disabled" class="NotAccept"'; } else { echo 'class="Accept"'; } ?> /></td>
                		</tr>
                        </table>
                    </td>
                </tr>
			</table>
        </form>
        
    </div>
</div>