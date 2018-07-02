<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Đưa Item lên Chợ Trời</h1>
    </div>
</div>

<?php 
    include('templates/com/daugia_head.tpl'); 
    if(isset($error_module)) echo "<center><font color='red'><strong>$error_module</strong></font></center>";
?>



<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li><font color='red'><strong>Mật khẩu <font color='blue'>OPD</font> (One Pass Day) : 1 Mật khẩu duy nhất dùng trong 24h kể từ khi nhận cho tất cả các chức năng cần sử dụng Mật Khẩu OPD</strong></font>.</li>
            <li><font color='blue'><strong>Hướng dẫn nhận Mật Khẩu OPD</strong></font></li>
            <li><font color='black'>Vui lòng dùng <strong>SĐT của tài khoản</strong> nhắn tin với cú pháp bên dưới để hoàn tất</font></li>
            <li><font color='red'><b><?php echo $cuphap_pri; ?>&nbsp;&nbsp;&nbsp;<?php echo $cuphap; ?>&nbsp;&nbsp;&nbsp;OPD&nbsp;&nbsp;&nbsp;<?php echo $_SESSION['mu_username']; ?></b></font>&nbsp;&nbsp;&nbsp;gửi&nbsp;&nbsp;&nbsp;<font color='blue'><b><?php echo $dauso; ?></b></font> <font color='gray'><i>(Phí nhắn tin : <?php echo $sms_price; ?> VNĐ)</i></font></li>
        </ul>
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Danh sách Item trong rương đồ của bạn</span></h1>
    </div>
    <div class="in-20">
    
    <table class='table table-blue-white table-border-2 table-text-center'>
        <thead>
            <tr>
                <th align="center"><b>Hình Ảnh</b></th>
                <th align="center"><b>Thông tin</b></th>
            </tr>
        </thead>
        <tbody>
        <?php 
            if(count($listitem_arr) > 0) {
            foreach($listitem_arr as $item) { 
        ?>
        <tr>
            <td align="center" bgcolor="#121212"><img src="items/<?php echo $item['image']; ?>.gif"></td>
            <td align="center" bgcolor="#121212"><?php echo $item['info']; ?></td>
        </tr>
        <tr>
            <td align="center" colspan="2" id="item_<?php echo $item['vitri']; ?>">
                <span id="itembid_unactive_<?php echo $item['vitri']; ?>">
                <?php
                    if($item['item_spec'] == 1 || $item['item_spec'] == 3) {
                            echo "<s>Item đặc biệt không thể tham gia</s>";
                        } else if($item['item_spec'] == 2) {
                            echo "<s>Item đã bảo vệ không được tham gia</s>";
                        } else {
                ?>
                    <a href="#" class="itembid_up" vitri="<?php echo $item['vitri']; ?>">Đưa Item : <strong><?php echo $item['name']; ?></strong> lên Chợ Trời</a>
                <?php } ?>
                </span>
                <span id="itembid_active_<?php echo $item['vitri']; ?>" style="display: none;">
                    <a href="#" class="itembid_down" vitri="<?php echo $item['vitri']; ?>">Đóng lại</a><br /><br />
                    
                    Giá khởi điểm : <input type="text" id="price_min_<?php echo $item['vitri']; ?>" value="0" /><br />
                    Giá mua đứt : <input type="text" id="price_max_<?php echo $item['vitri']; ?>" value="0" /><br />
                    Thời gian Item đưa lên Chợ Trời : 
                    <select id="bidday_<?php echo $item['vitri']; ?>">
                      <option value="1"><?php echo number_format($Bid_Vpoint_Daily, 0, ',', '.'); ?> Vcent / ngày</option>
                      <option value="2"><?php echo number_format($Bid_Vpoint_Daily*2, 0, ',', '.'); ?> Vcent / 2 ngày</option>
                      <option value="3"><?php echo number_format($Bid_Vpoint_Daily*3, 0, ',', '.'); ?> Vcent / 3 ngày</option>
                    </select><br />
                    
                    Mật khẩu bảo vệ : <input type="password" id="itempass_<?php echo $item['vitri']; ?>" size="7" maxlength="10" />
                    <br />
                    <i><font color="silver" size="2">
                            - Muốn bán cho tất cả : Để trống Mật khẩu bảo vệ.<br />
                            - Muốn bán cho 1 người : Nhập Mật khẩu và cung cấp Mật khẩu cho người muốn mua.
                    </font></i>
                    <br />
                    
                    Mật khẩu OPD : <input type="password" id="passopd_<?php echo $item['vitri']; ?>" size="10" />
                    <br />
                    <i><font color="silver" size="2">
                            - Hướng dẫn Mật khẩu One Pass Day xem đầu trang.<br />
                            - Điền Mật khẩu OPD nếu muốn người mua an tâm hơn về đồ bán.
                    </font></i>
                    <br />
                    
                    <input type="button" class="itembid_send" vitri="<?php echo $item['vitri']; ?>" item_code="<?php echo $item['item_code']; ?>" value="Đưa Item lên Chợ Trời" /> 
                    <span id="itembid_send_loading_<?php echo $item['vitri']; ?>"></span><br />
                    <span id="itembid_send_view_<?php echo $item['vitri']; ?>"></span>
                </span>
                <br /><br />
            </td>
        </tr>
        <?php } } else echo "<center><font color='red'><strong>Không có Item</strong></font></center>"; ?>
        </tbody>
    </table>
    
        
    </div>
</div>
<?php } else include('templates/char_manager.tpl'); ?>