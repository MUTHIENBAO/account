<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Hệ thống Hỗ Trợ</h1>
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Những lý do nên sử dụng Hỗ Trợ :
                <ul class="noted in-left-10">
                    <li>Chỉ <strong><?php echo number_format($vip_price, 0, ',', '.') ."</strong> Gcent nhận <strong>". $vip_bua_thiensu; ?> ngày Bùa Thiên Sứ</strong> (+50% Exp, +50% tỷ lệ rớt đồ).</li>
                    <li>Nếu mua trong Game Bùa Thiên Sứ <strong>7.500 WCoin / 1 ngày</strong>, đắt hơn gói Hỗ Trợ rất nhiều.</li>
                    <li>Ngoài ra sử dụng gói Hỗ Trợ còn được <strong>thêm Point</strong> giúp Train, săn Boss kiếm đồ dễ dàng hơn.</li>
                    <li><strong>Giảm chi phí khi Reset</strong> : Chi phí được giảm khi Reset hơn rất nhiều chi phí gói Hỗ Trợ.</li>
                    <li><strong>Giảm LV khi Reset</strong> : LV khi Reset được giảm giúp Reset nhanh hơn.</li>
                    <li class="tik">Vì vậy, sử dụng gói Hỗ Trợ rẻ hơn rất nhiều khi không sử dụng gói Hỗ Trợ.</li>
                </ul>
            </li>
            <li><strong>Tri ân Hỗ Trợ</strong> : Tương ứng với số ngày đã sử dụng gói Hỗ Trợ.</li>
            <li class="tik">Thời gian đã sử dụng gói Hỗ Trợ càng lâu, tri ân Hỗ Trợ càng nhiều.</li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Thông tin hệ thống VIP</span></h1>
    </div>
        <div class="form-3">
            
            <table class="table table-blue table-text-center table-border-2">
                <thead>
                    <tr><th align="center" colspan="6">Reset - Reset VIP được nhận</th></tr>
                    <tr>
                        <th align="center">&nbsp;</th>
                        <th align="center">Biểu Tượng</th>
                        <th align="center">Số ngày đã sử dụng gói Hỗ Trợ</th>
                        <th align="center">LV Reset giảm</th>
                        <th align="center">Point nhận thêm</th>
                        <th align="center">% Point nhận thêm</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        for($i=0; $i<$vip_level_slg; $i++) {
                            if($i == 0) {
                                $vip_view = "<span class='tag tag-orange'><strong>Hỗ Trợ</strong></span>";
                                $icon_view = "<span class='vip-box' title='VIP'><img src='images/super.gif' /></span>";
                            } else {
                                $vip_view = "Tri ân sau $vip_level_day[$i] ngày";
                                $icon_view = "<span class='vip-box' title='VIP'><img src='images/super.gif' /><span>". $vip_level_day[$i] ."d</span></span>";
                            }
                    ?>
                    <tr>
                        <td align="center"><?php echo $vip_view; ?></td>
                        <td align="center"><?php echo $icon_view; ?></td>
                        <td align="center"><?php echo $vip_level_day[$i]; ?> ngày</td>
                        <td align="center"><?php echo $vip_rs_lv_decre[$i]; ?> LV Giảm</td>
                        <td align="center"><?php echo number_format($vip_rs_point_incre[$i], 0, ',', '.'); ?> Point</td>
                        <td align="center"><?php echo $vip_rs_point_percent_incre[$i]; ?> % Point</td>
                    </tr>
                    <?php } ?>
                </tbody>
            </table>
            
            <br /><br />
            <table class="table table-blue table-text-center table-border-2">
                <thead>
                    <tr><th align="center" colspan="<?php if(isset($Use_ResetVIP) && $Use_ResetVIP == 1) echo 3; else echo 2; ?>">Phí <strong> Reset</strong> được giảm</th></tr>
                    <tr>
                        <th align="center">Reset / ngày</th>
                        <th align="center">Reset thường</th>
                        <?php if(isset($Use_ResetVIP) && $Use_ResetVIP == 1) { ?>
                        <th align="center">Reset VIP</th>
                        <?php } ?>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        if(is_array($vip_rs_price_decre_percent)) {
                            foreach($vip_rs_price_decre_percent as $k => $v) {
                    ?>
                    <tr>
                        <td align="center"><?php echo $vip_rs_price_decre_rsday[$k]; ?> Reset / ngày</td>
                        <td align="center"><img src="templates/images/icons/items/zen.png" title="ZEN" border="0" /> <img src="templates/images/icons/items/chaos.png" title="Ngọc Hỗn Nguyên ngân hàng" border="0" /> <img src="templates/images/icons/items/creation.png" title="Ngọc Sáng Tạo ngân hàng" border="0" /> <img src="templates/images/icons/items/blue.png" title="Lông Vũ ngân hàng" border="0" /> giảm <?php echo $v; ?> %</td>
                        <?php if(isset($Use_ResetVIP) && $Use_ResetVIP == 1) { ?>
                        <td align="center"><img src="templates/images/icons/g.png" title="Gcent" border="0" /> <img src="templates/images/icons/g+.png" title="Gcent" border="0" /> <img src="templates/images/icons/v.png" title="Vcent" border="0" /> <img src="templates/images/icons/v+.png" title="Vcent+" border="0" /> giảm  <?php echo $v; ?> %</td>
                        <?php } ?>
                    </tr>
                    <?php } } ?>
                </tbody>
            </table>
            
            <div class="form-row">
                <div class="form-col-1"><strong>Bùa Thiên Sứ</strong> khi kích hoạt</div>
                <div class="form-col-2"><?php echo $vip_bua_thiensu; ?> ngày</div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            
            <div class="form-row">
                <div class="form-col-1">&nbsp;</div>
                <div class="form-col-2"><span class="tag tag-green">Thông tin <strong>Hỗ Trợ</strong> tài khoản</span></div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <div class="form-row">
                <div class="form-col-1">Tình Trạng</div>
                <div class="form-col-2" id="vip_status">
                <?php 
                    if($_SESSION['nbb_vip'] == 0) {
                        if($_SESSION['nbb_vip_time'] == 0) {
                            echo "Chưa đăng ký Hỗ Trợ";
                        } else {
                            echo "Đã hết hạn Hỗ Trợ ( ". date('H:i d/m', $_SESSION['nbb_vip_time']) ." )";
                        }
                    } else {
                        echo "<span class='tag tag-orange'><strong>Hỗ Trợ</strong></span> ". date('H:i d/m', $_SESSION['nbb_vip_time']);
                    }
                
                ?></div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <div class="form-row">
                <div class="form-col-1">Tri ân</div>
                <div class="form-col-2" id="vip_lv">
                <?php 
                    if($_SESSION['nbb_vip'] == 1) {
                        echo "<span class='vip-box' title='VIP'><img src='images/super.gif' />$vip_day_view</span> $nbb_vip_time_used_day ngày $nbb_vip_time_used_hour giờ";
                    } else {
                        echo "-";
                    }
                    
                
                ?></div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <div class="form-row">
                <div class="form-col-1">Chi Phí</div>
                <div class="form-col-2"><?php echo number_format($vip_price, 0, ',', '.') ." Gcent / ". $vip_day; ?> ngày</div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            
            <div class="form-row">
                <div class="form-col-1">&nbsp;</div>
                <div class="form-col-2"><button class="btn btn-green btn-block btn-lg" id="vip_reg" type="submit" ><?php if($_SESSION['nbb_vip'] == 0) echo "Đăng ký Hỗ Trợ"; else echo "Gia hạn Hỗ Trợ"; ?></button></div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <div class="form-row">
                <div class="form-col-1">&nbsp;</div>
                <div class="form-col-2_extra" id="msg_vip">&nbsp;</div>
            </div>
        </div>
</div>