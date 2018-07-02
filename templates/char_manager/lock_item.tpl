<div class="primary-block">    
	<div class="main-content">        
		<h1 class="title-content">Bảo vệ Item</h1>    
	</div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
	<h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>

    <div class="in-20">
		<div id="rs_content">
			<ul class="noted in-left-10">
				<li>Item bảo vệ <strong>không thể giao dịch</strong> sang nhân vật khác</li>
				<li>Item bảo vệ <strong>không thể bán Shop cá nhân</strong></li>
				<li><strong>Bảo Vệ/Hủy Bảo</strong> Vệ phải dùng <strong>SĐT của tài khoản</strong> để thay đổi vì vậy độ <strong>an toàn rất cao</strong></li>
				<li>Được hỗ trợ <strong>khôi phục lấy lại đồ</strong> khi bị mất đồ.</li>
			</ul>
		</div>
	</div>
</div>
<div class="primary-block out-top-20">
    <div class="in-20">
	 <div class="form-2">
	<div class="form-row">
	<div class="form-col-1"><span>Nhân vật Chọn</span></div>
	<div class="form-col-2">	<span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
	</div>
	</div> 
	<div class="line">	</div> 	<p class="in-10">Điều kiện Bảo vệ Item</p>            
	<div class="form-row">                
	<div class="form-col-1"><span>Bảo vệ Item</span></div>                
	<div class="form-col-2">
		<strong><span id="price_lock"><span class='tag tag-red'><?php echo number_format($lockitem_gcoin, 0, ',', '.'); ?> Gcent</span></span></strong>
	</div>
	<div class="form-col-3">Chỉ mất 1 lần khi bật bảo vệ Item, không mất phí duy trì hàng ngày</div>
	</div>
	<div class="form-row">
	<div class="form-col-1"><span>Hủy Bảo vệ Item</span>
	</div> 
	<div class="form-col-2">                    Miễn Phí                </div> 
	</div>            
	<div class="form-row"> 
	<div class="form-col-1"><span>Đổi nhân vật</span>
	</div>           
	<div class="form-col-2">                    <?php echo $doinv; ?>               
	</div>        
    </div>          
	<div class="form-row">    
	<div class="form-col-1"><span>Thoát Game</span></div>     
	<div class="form-col-2">                    <?php echo $online; ?>                </div>       
	</div>     
	</div>  
	<center>        <br />       
	<font color='red'><strong>Mật khẩu <font color='blue'>OPD</font> (One Pass Day) : 1 Mật khẩu duy nhất dùng trong 24h kể từ khi nhận cho tất cả các chức năng cần sử dụng Mật Khẩu OPD</strong></font>.<br /><br />        <font color='blue'><strong>Hướng dẫn nhận Mật Khẩu OPD</strong></font><br />        
	<font color='black'>Vui lòng dùng <strong>SĐT của tài khoản</strong> nhắn tin với cú pháp bên dưới để hoàn tất</font><br>		
	<font color='red'><b><?php echo $cuphap_pri; ?>&nbsp;&nbsp;&nbsp;<?php echo $cuphap; ?>&nbsp;&nbsp;&nbsp;OPD&nbsp;&nbsp;&nbsp;<?php echo $_SESSION['mu_username']; ?></b></font>&nbsp;&nbsp;&nbsp;gửi&nbsp;&nbsp;&nbsp;<font color='blue'><b><?php echo $dauso; ?></b></font> <font color='gray'><i>(Phí nhắn tin : <?php echo $sms_price; ?> VNĐ)</i></font><br /><br />    </center>   
	<table class='table table-blue-white table-border-1 table-text-center'>        <thead>            <tr>                <th align="center"><b>Hình Ảnh</b></th>                <th align="center"><b>Thông tin</b></th>                <th align="center"></th>            </tr>        </thead>        <tbody>        <?php            if(isset($listitem_arr) && count($listitem_arr) > 0) {            foreach($listitem_arr as $item) {         ?>        <tr>            <td align="center" bgcolor="#121212"><img src="items/<?php echo $item['image']; ?>.gif"></td>            <td align="center" bgcolor="#121212"><?php echo $item['info']; ?></td>            <td align="center" id="td_<?php echo $item['vitri']; ?>">                <?php                     if($item['item_spec'] == 1 || $item['item_spec'] == 3) {                        echo "Item đặc biệt.<br />Không thể bảo vệ";                    } else if ($item['item_spec'] == 2) {                ?>                    <span id="lockinfo_<?php echo $item['vitri']; ?>"><font color='blue'>Item đã bảo vệ</font></span><br />                    Mật khẩu OPD: <input type="password" id="opd_<?php echo $item['vitri']; ?>" value="" size="6" maxlength="6" /><br />                    <span id="button_<?php echo $item['vitri']; ?>"><input type='button' vitri='<?php echo $item['vitri']; ?>' class='lockitem_unlock' value='Hủy Bảo vệ Item' /> <font color='blue'>Miễn Phí</font></span> <span id="loading_<?php echo $item['vitri']; ?>"></span><br /> <span id="err_<?php echo $item['vitri']; ?>"  style="color:#FF0000"></span>                <?php                    } else {                        if($item['event_epitem'] == 1) {                            echo "Item đang tham gia Event.<br />Không thể bảo vệ.";                        } else {                ?>                <span id="lockinfo_<?php echo $item['vitri']; ?>"><font color='red'><strong>Item chưa được bảo vệ</strong></font></span><br />                Mật khẩu OPD: <input type="password" id="opd_<?php echo $item['vitri']; ?>" value="" size="6" maxlength="6" /><br />                <span id="button_<?php echo $item['vitri']; ?>"><input type="button" vitri='<?php echo $item['vitri']; ?>' serial='<?php echo $item['serial']; ?>' class="lockitem_lock" value="Bảo vệ Item" <?php if($accept=='0') { echo 'disabled="disabled" class="NotAccept"'; } else { echo 'class="Accept"'; } ?> /> <font color='red'><?php echo number_format($lockitem_gcoin, 0, ',', '.'); ?> Gcent</font></span> <span id="loading_<?php echo $item['vitri']; ?>"></span><br /> <span id="err_<?php echo $item['vitri']; ?>"  style="color:#FF0000"></span>                <?php } } ?>            </td>        </tr>        <?php } } else echo "<center><font color='red'><strong>Không có Item hợp lệ</strong></font></center>"; ?>        </tbody>    </table>						            </div></div>