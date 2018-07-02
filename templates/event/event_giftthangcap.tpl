<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content"><?php echo $event_giftthangcap_name; ?></h1>
    </div>
</div>


<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li><strong>Reset đã thực hiện</strong> : Là tổng số lần <strong>Reset</strong> + <strong>Reset VIP</strong> + <strong>Reset OVER</strong> + <strong>Reset OVER VIP</strong></li>
            <li><strong>Reset đã thực hiện</strong> sẽ bị xóa về <strong><font color='red'>0</font></strong> nếu nhân vật <strong>Đổi Giới Tính</strong></li>
            <li><strong>Bùa</strong> : Nếu nhân vật <strong>đang sử dụng bùa</strong> sẽ được tăng thêm thời hạn sử dụng.<br />Nếu nhân vật <strong>chưa có bùa</strong>, sẽ được tặng bùa Thiên Sứ.</li>
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
                    <span>Reset đã thực hiện </span>
                </div>
                <div class="form-col-2">
                    <span class="tag tag-red"><b><?php echo number_format($thuchien_rs, 0, ',', '.'); ?></b></font></span>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="out-top-20">

        <!--<div id="tlsuccess"></div>
        <div id="tlerror"></div>-->
        
        <table class="table table-blue table-border-2">
            <thead>

            <tr bgcolor="#FFFFFF">
                <th align="center"><b>Reset thực hiện</b></th>
                <th align="center"><b>Phần Thưởng</b></th>
                <th align="center"><b>Nhận thưởng</b></th>
            </tr>

            </thead>

            <tbody>
            
            <?php
            if(is_array($giftthangcap_arr)) {
                foreach($giftthangcap_arr as $k => $v) {
                    $gift_des = '';
                    if(strlen($v['item_all']) > 0 && strlen($v['item_all'])%32 == 0) {
                        $gift_des .= "Phần thưởng Item vĩnh viễn : ". $v['msg_item_all'] ."<br />";
                    }
                    if(strlen($v['item_time_all']) > 0 && strlen($v['item_time_all'])%32 == 0) {
                        $gift_des .= "Phần thưởng Item sử dụng trong <strong>". $v['day_item_time_all'] ." ngày</strong> : ". $v['msg_item_time_all'] ."<br />";
                    }
                    if($v['buff_day'] > 0) {
                        $gift_des .= "Bùa : ". $v['buff_day'] ." ngày.<br />";
                    }
                    if($v['warehouse_secure'] > 0) {
                        $gift_des .= "Rương đồ An Toàn : ". $v['warehouse_secure'] ." rương.<br />";
                    }
                    
                    $nganhang_msg = '';
                    if($v['gcent_km'] > 0) $nganhang_msg .= "<div class='item-box' title='GCent khuyến mại'><img src='templates/images/icons/g+.png' /><span>x". number_format($v['gcent_km'], 0, ',', '.') ."</span></div>";
                    if($v['vcent_km'] > 0) {
                        $nganhang_msg .= "<div class='item-box' title='VCent khuyến mại'><img src='templates/images/icons/v+.png' /><span>x". number_format($v['vcent_km'], 0, ',', '.') ."</span></div>";
                    }
                    if($v['zen'] > 0) {
                        $nganhang_msg .= "<div class='item-box' title='ZEN ngân hàng'><img src='templates/images/icons/items/zen.png' /><b> x". number_format($v['zen'], 0, ',', '.') ."</b></div>";
                    }
                    if($v['chao'] > 0) {
                        $nganhang_msg .= "<div class='item-box' title='Ngọc Hỗn Nguyên ngân hàng'><img src='templates/images/icons/items/chaos.png' /><span>x". number_format($v['chao'], 0, ',', '.') ."</span></div>";
                    }
                    if($v['cre'] > 0) {
                        $nganhang_msg .= "<div class='item-box' title='Ngọc Sáng Tạo ngân hàng'><img src='templates/images/icons/items/creation.png' /><span>x". number_format($v['cre'], 0, ',', '.') ."</span></div>";
                    }
                    if($v['blue'] > 0) {
                        $nganhang_msg .= "<div class='item-box' title='Lông Vũ ngân hàng'><img src='templates/images/icons/items/blue.png' /><span>x". number_format($v['blue'], 0, ',', '.') ."</span></div>";
                    }
                    if($v['pp_extra'] > 0) {
                        $nganhang_msg .= "<div class='item-box' title='PPoint +'><img src='templates/images/icons/p+.png' /><span>x". number_format($v['pp_extra'], 0, ',', '.') ."</span></div>";
                    }
                    if(strlen($nganhang_msg) > 0) $nganhang_msg .= "<br /><br />";
                    $gift_des .= $nganhang_msg;
                    
                    $gift_dw = '';
                    if(strlen($v['item_dw']) > 0 && strlen($v['item_dw'])%32 == 0) {
                        $gift_dw .= "Phần thưởng Item vĩnh viễn : ". $v['msg_item_dw'] ."<br />";
                    }
                    if(strlen($v['item_time_dw']) > 0 && strlen($v['item_time_dw'])%32 == 0 && $v['day_item_time_dw'] > 0) {
                        $gift_dw .= "Phần thưởng Item sử dụng trong <strong>". $v['day_item_time_dw'] ." ngày</strong> : ". $v['msg_item_time_dw'] ."<br />";
                    }
                    if(strlen($gift_dw) > 0) $gift_des .= "<hr /><strong>Phù Thủy</strong><br />$gift_dw";
                    
                    $gift_dk = '';
                    if(strlen($v['item_dk']) > 0 && strlen($v['item_dk'])%32 == 0) {
                        $gift_dk .= "Phần thưởng Item vĩnh viễn : ". $v['msg_item_dk'] ."<br />";
                    }
                    if(strlen($v['item_time_dk']) > 0 && strlen($v['item_time_dk'])%32 == 0 && $v['day_item_time_dk'] > 0) {
                        $gift_dk .= "Phần thưởng Item sử dụng trong <strong>". $v['day_item_time_dk'] ." ngày</strong> : ". $v['msg_item_time_dk'] ."<br />";
                    }
                    if(strlen($gift_dk) > 0) $gift_des .= "<hr /><strong>Chiến Binh</strong><br />$gift_dk";
                    
                    $gift_elf = '';
                    if(strlen($v['item_elf']) > 0 && strlen($v['item_elf'])%32 == 0) {
                        $gift_elf .= "Phần thưởng Item vĩnh viễn : ". $v['msg_item_elf'] ."<br />";
                    }
                    if(strlen($v['item_time_elf']) > 0 && strlen($v['item_time_elf'])%32 == 0 && $v['day_item_time_elf'] > 0) {
                        $gift_elf .= "Phần thưởng Item sử dụng trong <strong>". $v['day_item_time_elf'] ." ngày</strong> : ". $v['msg_item_time_elf'] ."<br />";
                    }
                    if(strlen($gift_elf) > 0) $gift_des .= "<hr /><strong>Tiên Nữ</strong><br />$gift_elf";
                    
                    $gift_mg = '';
                    if(strlen($v['item_mg']) > 0 && strlen($v['item_mg'])%32 == 0) {
                        $gift_mg .= "Phần thưởng Item vĩnh viễn : ". $v['msg_item_mg'] ."<br />";
                    }
                    if(strlen($v['item_time_mg']) > 0 && strlen($v['item_time_mg'])%32 == 0 && $v['day_item_time_mg'] > 0) {
                        $gift_mg .= "Phần thưởng Item sử dụng trong <strong>". $v['day_item_time_mg'] ." ngày</strong> : ". $v['msg_item_time_mg'] ."<br />";
                    }
                    if(strlen($gift_mg) > 0) $gift_des .= "<hr /><strong>Đấu Sĩ</strong><br />$gift_mg";
                    
                    $gift_dl = '';
                    if(strlen($v['item_dl']) > 0 && strlen($v['item_dl'])%32 == 0) {
                        $gift_dl .= "Phần thưởng Item vĩnh viễn : ". $v['msg_item_dl'] ."<br />";
                    }
                    if(strlen($v['item_time_dl']) > 0 && strlen($v['item_time_dl'])%32 == 0 && $v['day_item_time_dl'] > 0) {
                        $gift_dl .= "Phần thưởng Item sử dụng trong <strong>". $v['day_item_time_dl'] ." ngày</strong> : ". $v['msg_item_time_dl'] ."<br />";
                    }
                    if(strlen($gift_dl) > 0) $gift_des .= "<hr /><strong>Chúa Tể</strong><br />$gift_dl";
                    
                    $gift_sum = '';
                    if(strlen($v['item_sum']) > 0 && strlen($v['item_sum'])%32 == 0) {
                        $gift_sum .= "Phần thưởng Item vĩnh viễn : ". $v['msg_item_sum'] ."<br />";
                    }
                    if(strlen($v['item_time_sum']) > 0 && strlen($v['item_time_sum'])%32 == 0 && $v['day_item_time_sum'] > 0) {
                        $gift_sum .= "Phần thưởng Item sử dụng trong <strong>". $v['day_item_time_sum'] ." ngày</strong> : ". $v['msg_item_time_sum'] ."<br />";
                    }
                    if(strlen($gift_sum) > 0) $gift_des .= "<hr /><strong>Thuật Sĩ</strong><br />$gift_sum";
                    
                    $gift_rf = '';
                    if(strlen($v['item_rf']) > 0 && strlen($v['item_rf'])%32 == 0) {
                        $gift_rf .= "Phần thưởng Item vĩnh viễn : ". $v['msg_item_rf'] ."<br />";
                    }
                    if(strlen($v['item_time_rf']) > 0 && strlen($v['item_time_rf'])%32 == 0 && $v['day_item_time_rf'] > 0) {
                        $gift_rf .= "Phần thưởng Item sử dụng trong <strong>". $v['day_item_time_rf'] ." ngày</strong> : ". $v['msg_item_time_rf'] ."<br />";
                    }
                    if(strlen($gift_rf) > 0) $gift_des .= "<hr /><strong>Thiết Binh</strong><br />$gift_rf";
                    
                    $percent_bar = ($thuchien_rs*100)/$k;
                    if($percent_bar > 100) $percent_bar = 100;
                    
                    if(is_array($gift_danhan_arr) && in_array($k, $gift_danhan_arr)) {
                        $btn_val = "Đã nhận";
                        $btn_avai = "disabled='disabled'";
                    } else {
                        if($thuchien_rs < $k) {
                            $btn_val = "Chưa đạt";
                            $btn_avai = "disabled='disabled'";
                        } else {
                            $btn_val = "Nhận thưởng";
                            $btn_avai = "";
                        }
                    }
            ?>
            <tr bgcolor="#FFFFFF">
                <td align="center">
                    <b><?php echo $thuchien_rs; ?></b> / <?php echo $k; ?>
                    <div class="progress-bar">
                        <div class="progress" id="progress_bar_str" style="width:<?php echo $percent_bar; ?>%"></div>
                    </div>
                </td>
                <td align="center"><?php echo $gift_des; ?></td>
                <td align="center">
                    <div class="group-popup2">
                        <div class="box-popup box-popup-red" data-popup="popup-click-<?php echo $k; ?>"></div>
                        <input data-showpopup="<?php echo $k; ?>" value="<?php echo $btn_val; ?>" <?php echo $btn_avai; ?> class="gift_thangcap btn btn-green btn-block btn-lg" id="btn_giftthangcap_<?php echo $k; ?>" gift_rs="<?php echo $k; ?>" type="button" />

                    </div>

                    <span id="loading_<?php echo $k; ?>"></span>
                </td>
            </tr>
            <?php
                }
            }
            ?>
            </tbody>
        </table>

</div>
<?php } else include('templates/char_manager.tpl'); ?>