<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Máy Ép Đồ Online</h1>
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Vật liệu để ép</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Món đồ cần ép và nguyên vật liệu phải đặt tại vi trí số 1 trên hòm đồ nhân vật như hình vẽ.</li>
			<br>
			<p align="center">
			<img border="0" src="./images/epdocong.jpg" width="260" height="258">
			&nbsp;</li>
            <li>Cần ít nhất 1 Một viên <span>Bless</span> và 1 viên <span>Soul</span> và 1 viên <span>Chaos</span></li>
			<li>Tỉ lệ thành công lên: + 10, + 11 , + 12 , + 13 , +14 , +15 lần lượt là: </li> 
			<li><strong><?php echo ''.$EpDoLen10.'%,  '.$EpDoLen11.'%,  '.$EpDoLen12.'%,  '.$EpDoLen13.'%,  '.$EpDoLen14.'%,  '.$EpDoLen15.'%' ?></strong></li>
			<li>Số lượng Bless, Soul cần thiết để ép lên: + 10, + 11 , + 12 , + 13 , +14 , +15 lần lượt là: </li> 
			<li><strong>+ 01, + 02 , + 03 , + 04 , +05 , +06 (Viên)</strong></li> 
			<li>GCoin Cần thiết để ép đồ lên: + 10, + 11 , + 12 , + 13 , +14 , +15 lần lượt là: </li> 
			<li><strong><?php echo number_format($GcoinEpdo, 0, ',', '.'); ?> Gcent,
						<?php echo number_format(($PhanTramTangGcoin*1+100)/100*$GcoinEpdo, 0, ',', '.'); ?> Gcent,
						<?php echo number_format(($PhanTramTangGcoin*2+100)/100*$GcoinEpdo, 0, ',', '.'); ?> Gcent,
						<?php echo number_format(($PhanTramTangGcoin*3+100)/100*$GcoinEpdo, 0, ',', '.'); ?> Gcent,
						<?php echo number_format(($PhanTramTangGcoin*4+100)/100*$GcoinEpdo, 0, ',', '.'); ?> Gcent,
						<?php echo number_format(($PhanTramTangGcoin*5+100)/100*$GcoinEpdo, 0, ',', '.'); ?> Gcent,
			</strong></li>
			 
			<li>Khi quay món đồ nếu thành công bạn sẽ mất <strong>Gcent tương ứng với Gcent cần thiết với cấp độ</strong>, còn nếu thất bại các bạn sẽ mất <strong><?php echo number_format($GcoinEpXit, 0, ',', '.'); ?> Gcent</strong> phí.</li> 
			<li>Khi quay thất bại thì đồ cần ép vẫn còn nguyên, Các nguyên liệu như Chaos, bless, soul sẽ mất.</li> 
			<li>Muốn tăng tỷ lệ thành công cao bạn hãy đặt thật nhiều <strong> Chaos</strong> vào (mỗi viên Chaos tương ứng với<strong> <?php echo $ChaoTangThem.'%'; ?></strong> nhưng không được quá 20 viên trên 1 lần ép)</li>
			<li>Lệnh bài ép đồ (<img border="0" src="./images/LenhBaiEpDo.gif" width="50" height="50">) được nhận từ Event <strong>Vòng quay may mắn</strong></li>
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
			<li><strong>Mọi trường hợp không làm theo mất đồ BQT không chịu trách nghiệm</strong></li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lựa chọn bổ sung</span></h1>
    </div>
    <div class="in-20">
	<form id="epdocong" name="epdocong" method="post" action="index.php?mod=maychao&act=epdocong">
		<input type="hidden" name="action" value="epdocong" />
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
                    <b><span id="ch_point_pp"><img border="0" src="./images/LenhBaiEpDo.gif" width="25" height="25"></span></b></font>
                </div>
            </div>
			
			<div class="form-row">
            <div class="form-col-1"><span>Chọn thêm lệnh bài</span></div>
            <div class="form-col-2">
                <select name="lenhbai_choise" class="form-style">
					<option value="0" selected="selected">Không sử dụng lệnh bài</option>
					<option value="1">Sử dụng 1 lệnh bài: Tăng <?php echo $LenhBaiTangThem.'%'; ?></option>
					<option value="2">Sử dụng 2 lệnh bài: Tăng <?php echo $LenhBaiTangThem*2 .'%'; ?></option>
					<option value="3">Sử dụng 3 lệnh bài: Tăng <?php echo $LenhBaiTangThem*3 .'%'; ?></option>
					<option value="4">Sử dụng 4 lệnh bài: Tăng <?php echo $LenhBaiTangThem*4 .'%'; ?></option>
					<option value="5">Sử dụng 5 lệnh bài: Tăng <?php echo $LenhBaiTangThem*5 .'%'; ?></option>
					<option value="6">Sử dụng 6 lệnh bài: Tăng <?php echo $LenhBaiTangThem*6 .'%'; ?></option>
					<option value="7">Sử dụng 7 lệnh bài: Tăng <?php echo $LenhBaiTangThem*7 .'%'; ?></option>
					<option value="8">Sử dụng 8 lệnh bài: Tăng <?php echo $LenhBaiTangThem*8 .'%'; ?></option>
					<option value="9">Sử dụng 9 lệnh bài: Tăng <?php echo $LenhBaiTangThem*9 .'%'; ?></option>
					<option value="10">Sử dụng 10 lệnh bài: Tăng <?php echo $LenhBaiTangThem*10 .'%'; ?></option>
				</select>
            </div>
			</div>
		<div class="form-submit">
            <button class="btn btn-green btn-block btn-lg" type="submit" name="submit" onclick="return confirm('Lưu ý:\n + Nếu ép đồ THẤT BẠI món đồ sẽ không mát nhưng các nguyên liệu như:.\n + Chaos, Bless, Soul sẽ mất sạch.\n + Nếu THÀNH CÔNG bạn sẽ phải chi phí cho mỗi lần Ép. \n + Nếu THẤT BẠI bạn sẽ phải chi phí cho mỗi lần Ép là <?php echo number_format($GcoinEpXit, 0, ',', '.'); ?> Gcent');" <?php if($accept=='0') { echo 'disabled="disabled"'; } ?> >Thực hiện Ép đồ</button>
        </div>
		
        </div>
	</form>	
    </div>
</div>

<?php } ?>