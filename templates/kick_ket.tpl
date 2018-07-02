<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Kích Kẹt</a></h1>
    </div>
</div>         
<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
			<li><strong>Tác dụng Chức năng Kích Kẹt</strong>:
			<ul>
				<li>Sử dụng <strong>Kích Kẹt</strong> để kích nhân vật bị kẹt trong Game.</li>
			</ul>
    </div>
</div>
<div class="primary-block out-top-20">
	 <div class="in-20">
        <div class="in-top-20">
            <fieldset class="notify-yellow">
                <legend><strong>Cú Pháp:</strong></legend>
                <div class="in-10">
				<center>
					<font color='red'><strong>Mật khẩu <font color='blue'>OPD</font> (One Pass Day) : 1 Mật khẩu duy nhất dùng trong 24h kể từ khi nhận cho tất cả các chức năng cần sử dụng Mật Khẩu OPD</strong></font>.<br />
					Chức năng cần sử dụng <strong>Mật khẩu OPD</strong> để đảm bảo an toàn cho tài khoản.<br />
					<br /><br />
					<font color='blue'><strong>Hướng dẫn nhận Mật Khẩu OPD</strong></font><br />
					<font color='black'>Vui lòng dùng <strong>SĐT của tài khoản</strong> nhắn tin với cú pháp bên dưới để hoàn tất</font><br>
					<font color='red'><b><?php echo $cuphap_pri; ?>&nbsp;&nbsp;&nbsp;<?php echo $cuphap; ?>&nbsp;&nbsp;&nbsp;OPD&nbsp;&nbsp;&nbsp;<?php echo $_SESSION['mu_username']; ?></b></font>&nbsp;&nbsp;&nbsp;gửi&nbsp;&nbsp;&nbsp;<font color='blue'><b><?php echo $dauso; ?></b></font> <font color='gray'><i>(Phí nhắn tin : <?php echo $sms_price; ?> VNĐ)</i></font><br /><br />
				</center>	
                </div>
            </fieldset>
        </div><br />
        <div class="form-3">
			<div class="form-row">
					<div class="form-col-1"><span>Mật Khẩu OPD :</span></div>
					<div class="form-col-2"><input class="form-style" type="text" name="opd" id="opd" size="14" maxlength="6" onfocus="focus_tel(this.value,'msg_'+this.name);" onkeyup="check_tel(this.value,'msg_'+this.name)"></div>
					<div class="form-col-3">&nbsp;</div>
			</div>
			<div class="line"></div>
			<div class="form-row">
                <div class="form-col-1">&nbsp;</div>
                <div class="form-col-2"><button class="btn btn-green btn-block btn-lg" id="kickket" type="submit" name="Submit">Kích Kẹt</button></div>
                <div class="form-col-3">&nbsp;</div>
            </div>
			<p id="kickket_msg"></p>
		</div>		
        </div>
</div>  
  