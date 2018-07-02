<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Máy Ép Wing 3 Online</h1>
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Vật liệu để ép</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li><strong>Wing cần ép phải để ở vị trí đầu tiên như hình vẽ</strong></li>
			<br>
			<p align="center">
			<img border="0" src="./images/epwing3.png" width="260" height="258">
			&nbsp;</li>
			<li>Số Lông Vũ Condor cần thiết: <strong><?php echo $FeatherOfCondorEpCanh3; ?></strong> Chiếc</li>
			<li>Số Linh Hồn Condor cần thiết: <strong><?php echo $FlameOfCondorEpCanh3; ?></strong> Cái</li>
			<li>Số Chaos cần thiết: <strong><?php echo $ChaoEpCanh3; ?></strong> Viên</li>
			<li>Số Creation cần thiết: <strong><?php echo $CreationEpCanh3; ?></strong> Viên</li>
			<li>Số Cụm Bless cần thiết: <strong><?php echo $BlessEpCanh3; ?></strong> Cụm</li>
			<li>Số Cụm Soul cần thiết: <strong><?php echo $SoulEpCanh3; ?></strong> Cụm</li>
			<li>Tỉ lệ thành công xoay wing 3 mặc định là: <strong><?php echo ''.$TiLeEpCanhMacDinh.'%' ?></strong></li>
			
			<li>Khi quay thành công sẽ mất: <strong><?php echo number_format($GcoinEpThanhCong, 0, ',', '.'); ?></strong> GCent</li>
			<li>Khi quay thất bại sẽ mất: <strong><?php echo number_format($GcoinEpXit, 0, ',', '.'); ?></strong> GCent</li>
		
			<li>Muốn tăng tỷ lệ thành công cao bạn hãy đặt thật nhiều <strong> Lông Vũ Condor</strong> vào (mỗi Lông Vũ Condor tương ứng với<strong> <?php echo $LongVuTangThem.'%'; ?></strong> nhưng không được quá 3 Lông Vũ Condor trên 1 lần ép)</li>
			<li>Lệnh bài Tăng tỉ lệ Wing 3 (<img border="0" src="./images/LenhBaiWing3.png" width="50" height="50">) được nhận từ Event <strong>Vòng quay may mắn</strong></li>
        </ul>
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý khi xoay đồ:</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Cất hết đồ trong cửa hàng cá nhân.</li>
            <li>Chỉ để đồ cần ép và nguyên liệu cần thiết ở dưới thùng đồ chung</li>
			<li>Đồ cần ép phải ở vị trí đầu tiên như trên hình</li> 
			<li><strong>Sử dụng WING 2 Class nào thì sẽ ra WING 3 Class đó</strong></li>
			<li>Khi quay thất bại thì Wing cần ép vẫn còn, Các nguyên liệu như Chaos, bless, soul, linh hồn condor, lông vũ condor sẽ mất.</li> 
			<li><strong>Mọi trường hợp không làm theo mất đồ BQT không chịu trách nghiệm</strong></li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lựa chọn bổ sung</span></h1>
    </div>
    <div class="in-20">
	<form id="epwing3" name="epwing3" method="post" action="index.php?mod=maychao&act=epwing3">
		<input type="hidden" name="action" value="epwing3" />
		<input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />
	
			<div class="form-2">
				<div class="form-row">
				<div class="form-col-1"><span>Nhân vật Ép đồ</span></div>
				<div class="form-col-2">
					<span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
				</div>
			</div>
			 <div class="form-row">
                <div class="form-col-1"><span>Đổi nhân vật</span></div>
                <div class="form-col-2"><?php echo $doinv; ?></div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <div class="form-row">
                <div class="form-col-1"><span>Thoát Game</span></div>
                <div class="form-col-2"><?php echo $online; ?></div>
                <div class="form-col-3">&nbsp;</div>
            </div>
			
            <div class="form-row">
                <div class="form-col-1">
                    <span>GCent hiện có </span>
                </div>
                <div class="form-col-2">
                    <span class="tag tag-blue"><b><span id="ch_point_pp"><?php echo number_format($_SESSION['acc_gcoin'], 0, ',', '.'); ?></span></b></font></span>
                </div>
				<div class="form-col-3">
                    <b><span id="ch_point_pp"><?php echo $notice_gcoin; ?></span></b></font>
                </div>
				
            </div>
            
            <div class="form-row">
                <div class="form-col-1">
                    <span>Lệnh bài đang có</span>
                </div>
                <div class="form-col-2">
                    <span class="tag tag-blue"><b><span id="ch_point_pp_extra"><?php echo $lenhbaiepdo; ?></span></b></font></span>
                </div>
				<div class="form-col-3">
                    <b><span id="ch_point_pp"><img border="0" src="./images/LenhBaiWing3.png" width="25" height="25"></span></b></font>
                </div>
            </div>
			
			<div class="form-row">
            <div class="form-col-1"><span>Chọn thêm lệnh bài</span></div>
            <div class="form-col-2">
                <select name="lenhbai_choise" class="form-style">
					<option value="0" selected="selected">Không sử dụng lệnh bài</option>
					<option value="1">Sử dụng 1 lệnh bài: Tăng <?php echo $SuDungLenhBaiEpWing3.'%'; ?></option>
					<option value="2">Sử dụng 2 lệnh bài: Tăng <?php echo $SuDungLenhBaiEpWing3*2 .'%'; ?></option>
					<option value="3">Sử dụng 3 lệnh bài: Tăng <?php echo $SuDungLenhBaiEpWing3*3 .'%'; ?></option>
					<option value="4">Sử dụng 4 lệnh bài: Tăng <?php echo $SuDungLenhBaiEpWing3*4 .'%'; ?></option>
					<option value="5">Sử dụng 5 lệnh bài: Tăng <?php echo $SuDungLenhBaiEpWing3*5 .'%'; ?></option>
					<option value="6">Sử dụng 6 lệnh bài: Tăng <?php echo $SuDungLenhBaiEpWing3*6 .'%'; ?></option>
					<option value="7">Sử dụng 7 lệnh bài: Tăng <?php echo $SuDungLenhBaiEpWing3*7 .'%'; ?></option>
					<option value="8">Sử dụng 8 lệnh bài: Tăng <?php echo $SuDungLenhBaiEpWing3*8 .'%'; ?></option>
					<option value="9">Sử dụng 9 lệnh bài: Tăng <?php echo $SuDungLenhBaiEpWing3*9 .'%'; ?></option>
					<option value="10">Sử dụng 10 lệnh bài: Tăng <?php echo $SuDungLenhBaiEpWing3*10 .'%'; ?></option>
				</select>
            </div>
			</div>
		<div class="form-submit">
            <button class="btn btn-green btn-block btn-lg" type="submit" name="submit" onclick="return confirm('Lưu ý:\n + Nếu ép đồ THẤT BẠI món đồ sẽ không mát nhưng các nguyên liệu như:.\n + Chaos, Bless, Soul, Lông Vũ, Linh Hồn, Creation sẽ mất sạch.\n + Nếu THÀNH CÔNG bạn sẽ phải chi phí cho mỗi lần Ép là <?php echo $GcoinEpThanhCong; ?> Gcent. \n + Nếu THẤT BẠI bạn sẽ phải chi phí cho mỗi lần Ép là <?php echo $GcoinEpXit; ?> Gcent');" <?php if($accept=='0') { echo 'disabled="disabled"'; } ?> >Thực hiện Xoay Wing 3</button>
        </div>
		
        </div>
	</form>	
    </div>
</div>

<?php } ?>