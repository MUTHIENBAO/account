<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Rương đồ An Toàn</h1>
    </div>
</div>
<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Cất đồ vào rương an toàn.</li>
            <li>Tuyệt đối An toàn, phải sử dụng mật khẩu OPD lấy từ điện thoại mới có thể gửi / lấy đồ.</li>
        </ul>
    </div>
</div>
<div class="primary-block out-top-20">
    
<?php 
    if(isset($error_module)) echo "<div class='form-error'>$error_module</div>";
?>
    <div class="in-20">
        
        <center>
            <font color='red'><strong>Mật khẩu <font color='blue'>OPD</font> (One Pass Day) : 1 Mật khẩu duy nhất dùng trong 24h kể từ khi nhận cho tất cả các chức năng cần sử dụng Mật Khẩu OPD</strong></font>.<br /><br />
            <font color='blue'><strong>Hướng dẫn nhận Mật Khẩu OPD</strong></font><br />
            <font color='black'>Vui lòng dùng <strong>SĐT của tài khoản</strong> nhắn tin với cú pháp bên dưới để hoàn tất</font><br><br />
    		<span class="tag tag-bold"><font color='red'><b><?php echo $cuphap_pri; ?>&nbsp;&nbsp;&nbsp;<?php echo $cuphap; ?>&nbsp;&nbsp;&nbsp;OPD&nbsp;&nbsp;&nbsp;<?php echo $_SESSION['mu_username']; ?></b></font>&nbsp;&nbsp;&nbsp;gửi&nbsp;&nbsp;&nbsp;<font color='blue'><b><?php echo $dauso; ?></b></font></span> <font color='gray'><i>(Phí nhắn tin : <?php echo $sms_price; ?> VNĐ)</i></font><br /><br /><br />
            
            Rương nhận <strong>Miễn phí</strong> tại <a href="#event&act=event_giftthangcap" rel="ajax">Event Thăng Cấp</a> hoặc <a href="#" class="btn btn-green btn-lg" id="btn_warehouse_secure_buy">Mua <?php echo number_format($warehouse_secure_price, 0, ',', '.') ." ". $money_name; ?> / Rương</a> <span id="warehouse_secure_buy_loading"></span> <br /><br />
            Mật khẩu OPD : <input type="password" id="pass_opd" />
        </center>
        <div class="trader-block">
            <div class="traider-guide"></div>
            
            <div class="trader-condition tdr-col">
                <div class="tdr-content" style="margin-bottom: 10px;">
                    <p class="txt-tdr"><strong>Rương đồ Game</strong></p>
                    <ul class="tdr-list-item" id="warehouse_list">
                        <?php
                        if(is_array($warehouse_info_arr)) {
                            foreach($warehouse_info_arr as $k => $v) {
                                $img_resize = _img_resize_view("items/". $v['item_image'] .".gif", 60, 60);
                                echo '
                                    <li class="tdr-item warehouse_move" warehouse_type="0" itemcode="'. $v['item_code'] .'" key="'. $k .'">
                                        <div class="tdr-img"><img src="items/'. $v['item_image'] .'.gif" width="'. $img_resize['width'] .'" height="'. $img_resize['height'] .'" /><span id="'. $v['item_code'] . $k .'"></span></div>
                                        <div class="tdr-item-info">
                                            <p>'. $v['item_info'] .'</p>
                                        </div>
                                    </li>
                                ';
                            }
                        }
                        ?>
                    </ul>
                </div>


            </div>
            <div class="trader-result tdr-col">
                <div class="tdr-content">
                    <p class="txt-tdr"><strong>Rương đồ An toàn</strong> <span class="badge"><strong><span id="item_in_warehouse_secure"><?php echo $_SESSION['acc_warehouse_secure_item']; ?></span></strong> / <strong><span id="page_warehouse_secure_slot"><?php echo $_SESSION['acc_warehouse_secure_slot']; ?></span></strong></span></p>
                    <ul class="tdr-list-item" id="warehouse_secure_list">
                        <?php
                        if(is_array($warehouse_secure_list_arr)) {
                            foreach($warehouse_secure_list_arr as $k => $v) {
                                $img_resize = _img_resize_view("items/". $v['item_image'] .".gif", 60, 60);
                                echo '
                                    <li class="tdr-item warehouse_move" warehouse_type="1" itemcode="'. $v['item_code'] .'" key="'. $k .'" time_gui="'. $v['time_gui'] .'">
                                        <div class="tdr-img"><img src="items/'. $v['item_image'] .'.gif" width="'. $img_resize['width'] .'" height="'. $img_resize['height'] .'" /><span id="'. $v['item_code'] . $k .'"></span></div>
                                        <div class="tdr-item-info">
                                            <p>'. $v['item_info'] .'</p>
                                        </div>
                                    </li>
                                ';
                            }
                        }
                        ?>
                    </ul>
                </div>
            </div>
        </div>







    
        
    </div>
</div>