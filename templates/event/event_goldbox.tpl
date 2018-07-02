<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content"><?php echo $event1_name; ?></h1>
</div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">
    	<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#9999FF">
		  <tr bgcolor="#FFFFFF">
		    <td colspan="3" align="center">
		    	<b>Vật phẩm Event</b>
	    	</td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		    <td align="center"><b>Tên vật phẩm</b></td>
		    <td align="center"><b>Hình Ảnh</b></td>
		    <td align="center"><b>Ghi chú</b></td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		    <td align="center">Hộp quà Bạc</td>
		    <td align="center"><img src="items/1412400.gif"></td>
		    <td align="center"><b>Cách Nhận</b> : Đánh quái khi tham gia sự kiện <strong>Lâu Đài Máu</strong>, <strong>Quảng Trưởng Quỷ</strong> hoặc mua tại <strong><a href="#webshop&act=shop_taphoa" rel="ajax" >Shop Tạp Hóa</a></strong><br>
<b>Chức Năng</b> : Sử dụng để đổi ra phần thưởng</td>
		  </tr>
          <tr bgcolor="#FFFFFF">
		    <td align="center">Hộp quà Vàng</td>
		    <td align="center"><img src="items/1412300.gif"></td>
		    <td align="center"><b>Cách Nhận</b> : Đánh quái khi tham gia sự kiện <strong>Lâu Đài Máu</strong>, <strong>Quảng Trưởng Quỷ</strong> hoặc mua tại <strong><a href="#webshop&act=shop_taphoa" rel="ajax" >Shop Tạp Hóa</a></strong><br>
<b>Chức Năng</b> : Sử dụng để đổi ra phần thưởng</td>
		  </tr>
		</table>
		<br>
    	
    	<table width="100%" border="0" cellpadding="3" cellspacing="1">
		<tr>
    		<td align="justify" colspan="2">
    		  <p align="center"><strong>Công Thức Ghép Đổi Lấy Phần Thưởng</strong></p>
    		  <p><strong> Loại 1</strong></p>
    		  <ul>
    		    <li> 1 Hộp quà Bạc   +  <?php echo number_format($event_goldbox_loai1_zen1, 0, ',', '.'); ?> Zen = <?php echo $event_goldbox_loai1_pl1_min; ?> - <?php echo $event_goldbox_loai1_pl1_max; ?> Point    		      </li>
  		        <li>1 Hộp quà Vàng + <?php echo number_format($event_goldbox_loai1_zen2, 0, ',', '.'); ?> Zen = <?php echo $event_goldbox_loai1_pl2_min; ?> - <?php echo $event_goldbox_loai1_pl2_max; ?> Point </li>
    		  </ul>
                    <i>Đổi tối đa trong ngày : <b><?php echo $event_goldbox_loai1_daily_slg; ?></b> Phần thưởng loại 1 / ngày</i><br>
                    <i>Đổi tối đa : <b><?php echo $event_goldbox_loai1_slg; ?></b> Phần thưởng loại 1 / nhân vật</i><br>
			  <br />
    		  
    		  <p><strong>Loại 2    		    </strong></p>
    		  <ul>
    		    <li>1 Hộp quà Bạc + <?php echo $event_goldbox_loai2_gcoin1; ?> Gcent = <?php echo $event_goldbox_loai2_pl1_min; ?> - <?php echo $event_goldbox_loai2_pl1_max; ?> Point    		      </li>
  		        <li>1 Hộp quà Vàng + <?php echo $event_goldbox_loai2_gcoin2; ?> Gcent = <?php echo $event_goldbox_loai2_pl2_min; ?> - <?php echo $event_goldbox_loai2_pl2_max; ?> Point </li>
   		      </ul>
                    <i>Đổi tối đa trong ngày : <b><?php echo $event_goldbox_loai2_daily_slg; ?></b> Phần thưởng loại 2 / ngày</i><br>
                    <i>Đổi tối đa : <b><?php echo $event_goldbox_loai2_slg; ?></b> Phần thưởng loại 2 / nhân vật</i><br>
			  <br />    		  
    		  <p><strong>Lưu ý: </strong></p>
    		  <ul>
    		    <li>Số Điểm Phúc Lợi nhận được là ngẫu nhiên trong khoảng theo bảng trên</li>
  		        <li> Điểm Phúc Lợi nhận được sử dụng tương tự như Điểm Phúc Lợi nhận từ nhiệm vụ hàng ngày,... như đổi sang Điểm Song Tu, Điểm Tu Luyện, Điểm Cường Hóa, Điểm Hoàn Hảo Hóa,...</li>
   		        <li> Nhân vật đổi Event không được đang trong Game và không được là nhân vật thoát sau cùng<br>
	                                          </li>
   		    </ul>
		</td>
		</tr>
		<tr>
    		<td align="center" colspan="2">
	    		Nhân vật đổi Event: <strong class="clr02"><?php echo $_SESSION['mu_nvchon']; ?></strong>
				  <br>
				  Chọn loại phần thưởng : 
				  <input name="event_goldbox_type" type="radio" value="1" />
			    Loại 1 
			    <input name="event_goldbox_type" type="radio" value="2" checked="checked" />
			    Loại 2 
		    </td>
		</tr>
		<tr>
			<td align="right" width='200'>Đổi nhân vật</td>
			<td><?php echo $doinv; ?></td>
		</tr>
		<tr>
			<td align="right">Thoát Game</td>
			<td><?php echo $online; ?></td>
		</tr>
		<tr>
			<td align="right">Mật khẩu cấp 2</td>
			<td><input type="password" name="pass2" size="14" maxlength="32" class="keyboardInput"/></td>
		</tr>
		<tr>
			<td align="center" colspan="2"><input type="submit" name="Submit" value="Đổi Event" <?php if($accept=='0') { echo 'disabled="disabled" class="NotAccept"'; } else { echo 'class="Accept"'; } ?> /></td>
		</tr>
	  </table>
        
    </div>
</div>
<?php } else include('templates/char_manager.tpl'); ?>