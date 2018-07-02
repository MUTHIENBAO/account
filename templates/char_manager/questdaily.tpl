<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Nhiệm vụ Hàng ngày</h1>
    </div>
</div>

<?php 
if (!isset($_SESSION['mu_nvchon'])) {
    echo "<div class='form-error'><strong>Chưa chọn nhân vật</strong>. <br />Nhiệm vụ phúc lợi chỉ thực hiện với nhân vật có Relife/Reset cao nhất trong tài khoản.<br />Vui lòng chọn nhân vật có <strong>Relife/Reset cao nhất</strong> trong tài khoản.</div>";
} else {
    if($quest_arr['nvchinh'] != 1) {
        echo "<div class='form-error'>Nhân vật đang chọn không phải nhân vật chính.<br />Vui lòng chọn nhân vật có số lần Relife/Reset cao nhất trong tài khoản</div>";
    } else {
?>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
	        <li><strong>Online</strong> : Tổng thời gian Online trong ngày (Online ở Server Ủy Thác không được tính). Thời gian Online chỉ cập nhập khi thoát Game.</li>
	        <li><strong>RS Tổng</strong> : Tổng số lần thực hiện <strong>Reset + Reset VIP + Reset OVER + Reset OVER VIP</strong>.</li>
	        <li><strong>RS VIP Tổng</strong> : Tổng số lần thực hiện <strong>Reset VIP + Reset VIP OVER</strong>.</li>
			<li><strong>RS OVER Tổng</strong> : Tổng số lần thực hiện <strong>Reset OVER + Reset OVER VIP</strong>.</li>
	        <li><strong>RS OVER VIP</strong> : Tổng số lần thực hiện <strong>Reset OVER VIP</strong>.</li>
	        <li><strong>Sử dụng Tiền Tệ</strong> : Tổng (Gcent + Gcent Khuyến Mãi + Vcent + Vcent Event) sử dụng trên Web trừ WebShop, Mua Item VCent.</li>
	        <li><strong>Ngọc Hỗn Nguyên, Ngọc Sáng Tạo, Lông Vũ</strong> nhận được sẽ nằm trong ngân hàng.</li>
            <li><strong>Bùa EXP</strong> : Nếu nhân vật đang sử dụng bùa sẽ được cộng thêm thời hạn sử dụng.<br />Nếu nhân vật chưa có bùa hoặc đã hết hạn sẽ được tặng <strong>Bùa Thiên Sứ</strong></li>
            <li><strong>GiftCode</strong> : Sau khi nhận vào <a href="#giftcode&act=giftcode_history" rel="ajax" >GiftCode > Lịch Sử GiftCode</a> để lấy mã GiftCode</li>
            <li><strong>Item vĩnh viễn</strong> : Sau khi nhận sẽ được chuyển vào Rương đồ chung</li>
            <li><strong><font color='red'>Item có thời hạn</font></strong> : Đến <strong>Server 1, Lorencia</strong>, giao dịch với NPC <strong>ReWard (143, 138)</strong> để rút Item.<br /> 
                <strong>Lưu ý</strong> : Phải rút ngay Item có thời hạn, nếu để qua ngày không rút phần thưởng sẽ mất.
            </li>
		</ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Thông tin Nhiệm vụ</span></h1>
    </div>
    <ul class="menu-main-tabs">
        <li class="main-tab active"><a href="javascript:;">Online <?php if($gift_unused_tab[1] > 0) echo '<span class="badge" id="nvhn_tab1">'. $gift_unused_tab[1] .'</span>'; ?></a></li>
        <li class="main-tab"><a href="javascript:;">Reset <?php if($gift_unused_tab[2] > 0) echo '<span class="badge" id="nvhn_tab2">'. $gift_unused_tab[2] .'</span>'; ?></a></li>
        <li class="main-tab"><a href="javascript:;">Nạp thẻ<?php if($gift_unused_tab[3] > 0) echo '<span class="badge" id="nvhn_tab3">'. $gift_unused_tab[3] .'</span>'; ?></a></li>
        <li class="main-tab"><a href="javascript:;">Tiêu Phí<?php if($gift_unused_tab[4] > 0) echo '<span class="badge" id="nvhn_tab4">'. $gift_unused_tab[4] .'</span>'; ?></a></li>
    </ul>
    
    <div class="in-20" >
            
        <center>
            <strong>Số lượng phần thưởng đã nhận</strong> : <strong><font color='red'><span id="nvhn_finish"><?php echo $quest_arr['quest_finish']; ?></span></font> / <?php echo $quest_daily_slgmax; ?> <?php if($_SESSION['acc_vip'] > 0 && $_SESSION['acc_vip_day'] >= $enable_vip['questdaily']) { ?> (<i><s><?php echo $quest_daily_slgmax-$extra_questdaily_slg; ?></s></i>)<?php } ?></strong>
        </center>
    
        <ul class="content-main-tabs">
            <li class="content-m-tab active">
                <table class="table table-blue table-text-center table-border-2">
                    <thead>
                        <tr>
                            <th align="center"><b>Nhiệm vụ</b></th>
                            <th align="center"><b>Tình Trạng</b></th>
                            <th align="center"><b>Phần thưởng</b></th>
                            <th align="center"><b>Nhận thưởng</b></th>
                        </tr>
                    </thead>
                    <tbody>

                <?php 
                    for($i=1; $i<=6; $i++) { 
                    if($quest_daily[$i] == 1) {
                ?>
                      <tr>
                        <td align="right"><b><?php echo $quest_name[$i]; ?></b></td>
                        <td align="center"><?php echo number_format($quest_status[$i], 0, ',', '.') .' / '. number_format($quest_daily_dk[$i], 0, ',', '.'); ?>
                            <div class="progress-bar">
                                <div class="progress" style="width:<? $percent = ($quest_status[$i]/$quest_daily_dk[$i])*100; echo $percent>100 ? 100 : $percent; ?>%"></div>
                            </div>
                        </td>
                        <td align="left"><?php echo $phanthuong[$i]; ?></td>
                        <td align="center"><span id="btn_spanquest_<?php echo $i; ?>"><?php echo $input[$i]; ?></span> <span id="loading_quest_<?php echo $i; ?>"></span></td>
                      </tr>
                <?php } } ?>
                    </tbody>
                </table>
            </li>
            <li class="content-m-tab">
                <table class="table table-blue table-text-center table-border-2">
                    <thead>
                        <tr>
                            <th align="center"><b>Nhiệm vụ</b></th>
                            <th align="center"><b>Tình Trạng</b></th>
                            <th align="center"><b>Phần thưởng</b></th>
                            <th align="center"><b>Nhận thưởng</b></th>
                        </tr>
                    </thead>
                    <tbody>

                <?php 
                    for($i=7; $i<=34; $i++) { 
                    if($quest_daily[$i] == 1) {
                ?>
                      <tr>
                        <td align="right"><b><?php echo $quest_name[$i]; ?></b></td>
                        <td align="center"><?php echo number_format($quest_status[$i], 0, ',', '.') .' / '. number_format($quest_daily_dk[$i], 0, ',', '.'); ?>
                            <div class="progress-bar">
                                <div class="progress" style="width:<? $percent = ($quest_status[$i]/$quest_daily_dk[$i])*100; echo $percent>100 ? 100 : $percent; ?>%"></div>
                            </div>
                        </td>
                        <td align="left"><?php echo $phanthuong[$i]; ?></td>
                        <td align="center"><span id="btn_spanquest_<?php echo $i; ?>"><?php echo $input[$i]; ?></span> <span id="loading_quest_<?php echo $i; ?>"></span></td>
                      </tr>
                <?php } } ?>
                    </tbody>
                </table>
            </li>
            <li class="content-m-tab">
                <table class="table table-blue table-text-center table-border-2">
                    <thead>
                        <tr>
                            <th align="center"><b>Nhiệm vụ</b></th>
                            <th align="center"><b>Tình Trạng</b></th>
                            <th align="center"><b>Phần thưởng</b></th>
                            <th align="center"><b>Nhận thưởng</b></th>
                        </tr>
                    </thead>
                    <tbody>

                <?php 
                    for($i=35; $i<=42; $i++) { 
                    if($quest_daily[$i] == 1) {
                ?>
                      <tr>
                        <td align="right"><b><?php echo $quest_name[$i]; ?></b></td>
                        <td align="center"><?php echo number_format($quest_status[$i], 0, ',', '.') .' / '. number_format($quest_daily_dk[$i], 0, ',', '.'); ?>
                            <div class="progress-bar">
                                <div class="progress" style="width:<? $percent = ($quest_status[$i]/$quest_daily_dk[$i])*100; echo $percent>100 ? 100 : $percent; ?>%"></div>
                            </div>
                        </td>
                        <td align="left"><?php echo $phanthuong[$i]; ?></td>
                        <td align="center"><span id="btn_spanquest_<?php echo $i; ?>"><?php echo $input[$i]; ?></span> <span id="loading_quest_<?php echo $i; ?>"></span></td>
                      </tr>
                <?php } } ?>
                    </tbody>
                </table>
            </li>
            <li class="content-m-tab">
                <table class="table table-blue table-text-center table-border-2">
                    <thead>
                        <tr>
                            <th align="center"><b>Nhiệm vụ</b></th>
                            <th align="center"><b>Tình Trạng</b></th>
                            <th align="center"><b>Phần thưởng</b></th>
                            <th align="center"><b>Nhận thưởng</b></th>
                        </tr>
                    </thead>
                    <tbody>

                <?php 
                    for($i=43; $i<=49; $i++) { 
                    if($quest_daily[$i] == 1) {
                ?>
                      <tr>
                        <td align="right"><b><?php echo $quest_name[$i]; ?></b></td>
                        <td align="center"><?php echo number_format($quest_status[$i], 0, ',', '.') .' / '. number_format($quest_daily_dk[$i], 0, ',', '.'); ?>
                            <div class="progress-bar">
                                <div class="progress" style="width:<? $percent = ($quest_status[$i]/$quest_daily_dk[$i])*100; echo $percent>100 ? 100 : $percent; ?>%"></div>
                            </div>
                        </td>
                        <td align="left"><?php echo $phanthuong[$i]; ?></td>
                        <td align="center"><span id="btn_spanquest_<?php echo $i; ?>"><?php echo $input[$i]; ?></span> <span id="loading_quest_<?php echo $i; ?>"></span></td>
                      </tr>
                <?php } } ?>
                    </tbody>
                </table>
            </li>
        </ul>
        
    </div>
</div>
<?php 
	}
}
?>