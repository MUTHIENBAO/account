<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Luyện Bảo >> Cường Hóa</h1>
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Điểm <strong>PP, PP+</strong> nhận được khi : hoàn thành <a href="#char_manager&act=questdaily" rel="ajax">nhiệm vụ ngày</a>.</li>
            <?php if(!isset($ch_point_type) || $ch_point_type == 0) { ?>
            <li><strong>Điểm Cường Hóa</strong> nhận được khi : Reset, Reset VIP, Reset OVER, Reset OVER VIP <strong><?php echo $ch_rsmax; ?></strong> lần đầu tiên trong ngày.</li>
            <li><strong>Resset VIP, Reset OVER VIP</strong> nhận được <strong>nhiều hơn</strong> Reset, Reset OVER : <strong>1.5 lần</strong></li>
            <?php } ?>
            <li><strong>Phí Cường Hóa</strong> : 100 (Điểm Cường Hóa, PP+, PP) và 1 Chao trong Ngân Hàng để tăng Chúc Phúc<br />
            <strong>Ưu tiên sử dụng</strong> : <?php if(!isset($ch_point_type) || $ch_point_type == 0) echo 'Điểm Cường Hóa > '; ?> PP+ > PP</li>
            <li><strong>Chúc phúc</strong> càng cao, tỷ lệ thành công Cường Hóa càng lớn.</li>
            <li><strong>PCPoint</strong> : lấy từ <a href="#char_manager&act=questdaily" rel="ajax">nhiệm vụ ngày</a> hoặc <strong>săn BOSS</strong></li>
            <li>Cường Hóa Item thất bại : Item giữ nguyên (không bị mất), Chúc phúc giữ nguyên.</li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Thông tin nhân vật</span></h1>
    </div>
    <div class="in-20">
        <div class="form-2">
            
            <div class="form-row">
                <div class="form-col-1">
                    <span>Điểm PP hiện có </span>
                </div>
                <div class="form-col-2">
                    <span class="tag tag-blue"><b><span id="ch_point_pp"><?php echo number_format($_SESSION['acc_ppoint'], 0, ',', '.'); ?></span></b></font></span>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-col-1">
                    <span>Điểm PP+ hiện có </span>
                </div>
                <div class="form-col-2">
                    <span class="tag tag-blue"><b><span id="ch_point_pp_extra"><?php echo number_format($_SESSION['acc_ppoint_extra'], 0, ',', '.'); ?></span></b></font></span>
                </div>
            </div>
            
            <?php 
            $total_ch_point = $_SESSION['acc_ppoint'] + $_SESSION['acc_ppoint_extra'];
            if(!isset($ch_point_type) || $ch_point_type == 0) { 
                $total_ch_point += $ch_point;
            ?>
            <div class="form-row">
                <div class="form-col-1">
                    <span>Điểm Cường hóa hiện có </span>
                </div>
                <div class="form-col-2">
                    <span class="tag tag-blue"><b><span id="ch_point"><?php echo number_format($ch_point, 0, ',', '.'); ?></span></b></font></span>
                </div>
            </div>
            <?php } ?>
            
            <div class="form-row">
                <div class="form-col-1">
                    <span>Tổng Điểm </span>
                </div>
                <div class="form-col-2">
                    <span class="tag tag-red"><b><span id="ch_point_total"><?php echo number_format($total_ch_point, 0, ',', '.'); ?></span></b></font></span>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-col-1">
                    <span>PCPoint </span>
                </div>
                <div class="form-col-2">
                    <span class="tag tag-blue"><b><span id="pcpoint"><?php echo number_format($pcpoint, 0, ',', '.'); ?></span></b></font></span>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">

<center>
    <b>Danh sách Item được phép Cường Hóa trong rương đồ của bạn</b>
</center>
<br />
    
    <table  class="table table-blue table-text-center table-border-2">
        <tr bgcolor="#FFFF00">
            <td align="center"><b>Hình Ảnh</b></td>
            <td align="center"><b>Thông tin</b></td>
        </tr>
        <?php 
            if(count($listitem_arr) > 0) {
            foreach($listitem_arr as $item) { 
        ?>
        <tr bgcolor="#FFFFFF">
            <td align="center" bgcolor="#121212"><img src="items/<?php echo $item['image']; ?>.gif"></td>
            <td align="center" bgcolor="#121212"><?php echo $item['info']; ?></td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td align="center" colspan="2" id="item_<?php echo $item['vitri']; ?>">
                <span id="itemch_unactive_<?php echo $item['vitri']; ?>">
                <?php
                    if($item['item_spec'] == 1 || $item['item_spec'] == 3) {
                            echo "<s>Item đặc biệt không thể Cường Hóa</s>";
                    } else if($item['item_spec'] == 2) {
                        echo "<s>Item đã bảo vệ không được Cường Hóa. Hãy Hủy Bảo vệ để Tiến Hành Cường Hóa.</s>";
                    } else {
                ?>
                    <a href="#" class="item_ch_open" id="item_ch_open_<?php echo $item['vitri']; ?>" style="<?php if($item['cp_percent'] > 0) echo "display: none;"; ?>" vitri="<?php echo $item['vitri']; ?>">Tiến hành Cường Hóa <strong><?php echo $item['name']; ?></strong></a>
                <?php } ?>
                </span>
                <span id="itemch_active_<?php echo $item['vitri']; ?>" style="<?php if($item['cp_percent'] == 0) echo "display: none;"; ?>">
                    <a href="#" class="item_ch_close" vitri="<?php echo $item['vitri']; ?>">Đóng lại</a><br /><br />
                    Cấp độ hiện tại : +<strong><span id="itemlv_now_<?php echo $item['vitri']; ?>"><?php echo $item['level']; ?></span></strong><br />
                    Tiến hành Cường Hóa lên : +<strong><font color="blue"><span id="itemlv_up_<?php echo $item['vitri']; ?>"><?php echo $item['level']+1; ?></span></font></strong><br />
                    Chúc Phúc : <font color="red"><strong><span id="itemch_cp_<?php echo $item['vitri']; ?>"><?php echo $item['cp_percent']; ?></span> %</strong></font><br /> <font color="red"><i>(Cường hóa thất bại => Tăng Chúc Phúc (Chúc Phúc càng cao, tỷ lệ thành công càng cao))</i></font><br />
                    <input type="button" class="chitem" id="chitem_<?php echo $item['vitri']; ?>" value="Tiến hành Cường Hóa" vitri="<?php echo $item['vitri']; ?>" serial="<?php echo $item['serial']; ?>" item_lvl="<?php echo $item['level']; ?>" />
                    
                    <span id="itemch_loading_<?php echo $item['vitri']; ?>"></span><br />
                    <span id="itemch_view_<?php echo $item['vitri']; ?>"></span>
                </span>
                <br /><br />
            </td>
        </tr>
        <?php } } else echo "<center><font color='red'><strong>Không có Item</strong></font></center>"; ?>
    </table>
    
        
    </div>
</div>
<?php } ?>