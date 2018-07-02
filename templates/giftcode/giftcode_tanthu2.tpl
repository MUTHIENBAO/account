<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">GiftCode >> <?php echo $giftcode_tanthu2_name; ?></h1>
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Thời gian nhận GiftCode : <strong>0h00 <?php echo date('d/m/Y', strtotime($giftcode_tanthu2_begin)); ?> - 24h00 <?php echo date('d/m/Y', strtotime($giftcode_tanthu2_end)); ?></strong></li>
            <li>GiftCode chỉ dành cho tài khoản đăng ký từ : <strong>0h00 <?php echo date('d/m/Y', strtotime($giftcode_tanthu2_acc_reg)); ?></strong> trở đi.</li>
            <li>Phần thưởng chung : Tất cả các lớp nhân vật đều được nhận.</li>
            <li>Phần thưởng riêng nhận được tương ứng với lớp nhân vật chọn khi <strong>nhận phần thưởng GiftCode</strong>.</li>
            <li>Mỗi tài khoản chỉ nhận và sử dụng được <?php echo $giftcode_tanthu2_name; ?> : 1 lần duy nhất.</li>
            <li>Không thể sử dụng <?php echo $giftcode_tanthu2_name; ?> của tài khoản này cho tài khoản khác.</li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">
    	<table class="table table-blue table-text-center table-border-2">
				<tr bgcolor="#FFFFFF" >
					<td align="center"><strong>Lớp nhân vật</strong></td>
					<td align="center"><strong>Thông tin phần thưởng <?php echo $giftcode_tanthu2_name; ?></strong></td>
				</tr>
				
                <tr bgcolor="#FFFFFF" >
					<td align="center"><strong>Phần thưởng chung</strong></td>
					<td align="left">
                        <?php 
                            if(strlen($gift_all) > 0 && strlen($gift_all)%32 == 0) {
                                echo "Phần thưởng Item vĩnh viễn : ". $msg_all ."<br />";
                            }
                            
                            if(strlen($gift_time_all) > 0 && strlen($gift_time_all)%32 == 0) {
                                echo "Phần thưởng Item sử dụng trong <strong>". $day_time_all ." ngày</strong> : ". $msg_time_all ."<br />";
                            }
                            
                            if(isset($buff) && $buff > 0 && $buff_day > 0) {
                                switch ($buff){ 
                                	case 6699:
                                        $buff_n = "<strong>Bùa tăng Exp</strong> $buff_day ngày";
                                	break;
                                
                                	case 6700:
                                        $buff_n = "<strong>Bùa Thiên Sứ</strong> $buff_day ngày";
                                	break;
                                
                                	case 6749:
                                        $buff_n = "<strong>Bùa Master</strong> $buff_day ngày";
                                	break;
                                }
                                if(strlen($buff_n) > 0) echo "Bùa : $buff_n <br />";
                            }
                            
                            $nganhang_msg = '';
                            if($gcent_km > 0) $nganhang_msg .= "<div class='item-box' title='GCent khuyến mại'><img src='templates/images/icons/g+.png' /><span>x". number_format($gcent_km, 0, ',', '.') ."</span></div>";
                            if($vcent_km > 0) $nganhang_msg .= "<div class='item-box' title='VCent khuyến mại'><img src='templates/images/icons/v+.png' /><span>x". number_format($vcent_km, 0, ',', '.') ."</span></div>";
                            if($zen > 0) $nganhang_msg .= "<div class='item-box' title='ZEN ngân hàng'><img src='templates/images/icons/items/zen.png' /><span>x". number_format($zen, 0, ',', '.') ."</span></div>";
                            if($chao > 0) $nganhang_msg .= "<div class='item-box' title='Ngọc Hỗn Nguyên ngân hàng'><img src='templates/images/icons/items/chaos.png' /><span>x". number_format($chao, 0, ',', '.') ."</span></div>";
                            if($cre > 0) $nganhang_msg .= "<div class='item-box' title='Ngọc Sáng Tạo ngân hàng'><img src='templates/images/icons/items/creation.png' /><span>x". number_format($cre, 0, ',', '.') ."</span></div>";
                            if($blue > 0) $nganhang_msg .= "<div class='item-box' title='Lông Vũ ngân hàng'><img src='templates/images/icons/items/blue.png' /><span>x". number_format($blue, 0, ',', '.') ."</span></div>";
                            if($pp_extra > 0) $nganhang_msg .= "<div class='item-box' title='PPoint +'><img src='templates/images/icons/p+.png' /><span>x". number_format($pp_extra, 0, ',', '.') ."</span></div>";
                            
                            echo "<br />". $nganhang_msg;
                        ?>
                    </td>
				</tr>
                
                <tr bgcolor="#FFFFFF" >
					<td align="center"><strong>Phù Thủy</strong></td>
					<td align="left">
                        <?php 
                            if(strlen($gift_dw) > 0 && strlen($gift_dw)%32 == 0) {
                                echo "Phần thưởng Item vĩnh viễn : ". $msg_dw ."<br />";
                            }
                            if(strlen($gift_time_dw) > 0 && strlen($gift_time_dw)%32 == 0) {
                                echo "Phần thưởng Item sử dụng trong <strong>". $day_time_dw ." ngày</strong> : ". $msg_time_dw ."<br />";
                            }
                        ?>
                    </td>
				</tr>
                <tr bgcolor="#FFFFFF" >
					<td align="center"><strong>Chiến Binh</strong></td>
					<td align="left">
                        <?php 
                            if(strlen($gift_dk) > 0 && strlen($gift_dk)%32 == 0) {
                                echo "Phần thưởng Item vĩnh viễn : ". $msg_dk ."<br />";
                            }
                            if(strlen($gift_time_dk) > 0 && strlen($gift_time_dk)%32 == 0) {
                                echo "Phần thưởng Item sử dụng trong <strong>". $day_time_dk ." ngày</strong> : ". $msg_time_dk ."<br />";
                            }
                        ?>
                    </td>
				</tr>
                <tr bgcolor="#FFFFFF" >
					<td align="center"><strong>Tiên Nữ</strong></td>
					<td align="left">
                        <?php 
                            if(strlen($gift_elf) > 0 && strlen($gift_elf)%32 == 0) {
                                echo "Phần thưởng Item vĩnh viễn : ". $msg_elf ."<br />";
                            }
                            if(strlen($gift_time_elf) > 0 && strlen($gift_time_elf)%32 == 0) {
                                echo "Phần thưởng Item sử dụng trong <strong>". $day_time_elf ." ngày</strong> : ". $msg_time_elf ."<br />";
                            }
                        ?>
                    </td>
				</tr>
                <tr bgcolor="#FFFFFF" >
					<td align="center"><strong>Đấu Sĩ</strong></td>
					<td align="left">
                        <?php 
                            if(strlen($gift_mg) > 0 && strlen($gift_mg)%32 == 0) {
                                echo "Phần thưởng Item vĩnh viễn : ". $msg_mg ."<br />";
                            }
                            if(strlen($gift_time_mg) > 0 && strlen($gift_time_mg)%32 == 0) {
                                echo "Phần thưởng Item sử dụng trong <strong>". $day_time_mg ." ngày</strong> : ". $msg_time_mg ."<br />";
                            }
                        ?>
                    </td>
				</tr>
                <tr bgcolor="#FFFFFF" >
					<td align="center"><strong>Chúa Tể</strong></td>
					<td align="left">
                        <?php 
                            if(strlen($gift_dl) > 0 && strlen($gift_dl)%32 == 0) {
                                echo "Phần thưởng Item vĩnh viễn : ". $msg_dl ."<br />";
                            }
                            if(strlen($gift_time_dl) > 0 && strlen($gift_time_dl)%32 == 0) {
                                echo "Phần thưởng Item sử dụng trong <strong>". $day_time_dl ." ngày</strong> : ". $msg_time_dl ."<br />";
                            }
                        ?>
                    </td>
				</tr>
                <tr bgcolor="#FFFFFF" >
					<td align="center"><strong>Thuật Sĩ</strong></td>
					<td align="left">
                        <?php 
                            if(strlen($gift_sum) > 0 && strlen($gift_sum)%32 == 0) {
                                echo "Phần thưởng Item vĩnh viễn : ". $msg_sum ."<br />";
                            }
                            if(strlen($gift_time_sum) > 0 && strlen($gift_time_sum)%32 == 0) {
                                echo "Phần thưởng Item sử dụng trong <strong>". $day_time_sum ." ngày</strong> : ". $msg_time_sum ."<br />";
                            }
                        ?>
                    </td>
				</tr>
                <tr bgcolor="#FFFFFF" >
					<td align="center"><strong>Chiến Binh Thép</strong></td>
					<td align="left">
                        <?php 
                            if(strlen($gift_rf) > 0 && strlen($gift_rf)%32 == 0) {
                                echo "Phần thưởng Item vĩnh viễn : ". $msg_rf ."<br />";
                            }
                            if(strlen($gift_time_rf) > 0 && strlen($gift_time_rf)%32 == 0) {
                                echo "Phần thưởng Item sử dụng trong <strong>". $day_time_rf ." ngày</strong> : ". $msg_time_rf ."<br />";
                            }
                        ?>
                    </td>
				</tr>
                <tr bgcolor="#FFFFFF" >
					<td align="center" colspan="2">
                        <?php 
                            if(strtotime($giftcode_tanthu2_begin) > time()) {
                                echo "Chưa đến thời gian nhận GiftCode";
                            } else if(strtotime($giftcode_tanthu2_end) + 24*60*60 < time()) {
                                echo "Đã hết thời gian nhận GiftCode";
                            } else if($_SESSION['acc_reg_day'] < strtotime($giftcode_tanthu2_acc_reg)) {
                                echo "Tài khoản đăng ký trước ngày : <strong>". date('d/m/Y', strtotime($giftcode_tanthu2_acc_reg)) ."</strong>. Không được nhận <strong>". $giftcode_tanthu2_name ."</strong>";
                            } else {
                        ?>
                        <font color='red'><strong>Để nhận mã <?php echo $giftcode_tanthu2_name; ?></strong></font><br />
                        <font color='black'>Vui lòng dùng SĐT của tài khoản nhắn tin với cú pháp bên dưới để hoàn tất</font><br>
						<font color='red'><b><?php echo $cuphap_pri; ?>&nbsp;&nbsp;&nbsp;<?php echo $cuphap; ?>&nbsp;&nbsp;&nbsp;TanThu2&nbsp;&nbsp;&nbsp;<?php echo $_SESSION['mu_username']; ?></b></font>&nbsp;&nbsp;&nbsp;gửi&nbsp;&nbsp;&nbsp;<font color='blue'><b><?php echo $dauso; ?></b></font> <font color='gray'><i>(Phí nhắn tin : <?php echo $sms_price; ?> VNĐ)</i></font>
                        <?php } ?>
                    </td>
				</tr>
			</table>
        
    </div>
</div>