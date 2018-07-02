<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Reset</h1>
        <?php include('templates/char_manager/reset_head.tpl'); ?>
    </div>
</div>



<div class="primary-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Thông tin nhân vật</span></h1>
    </div>
    <div class="in-20">
        <div class="form-2" id="rs_content">
            <div class="form-row">
                <div class="form-col-1"><span>Nhân vật Reset</span></div>
                <div class="form-col-2"><span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span></div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <div class="line"></div>
            <p class="in-10">Điều kiện Reset <i><font color='red'>(Màu đỏ là không đủ điều kiện)</font></i></p>
            <div class="form-row">
                <div class="form-col-1"><span>Reset lần thứ</span></div>
                <div class="form-col-2"><?php echo $_SESSION['nv_reset']+1; ?></div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <?php if($hotrotanthu == 1 || $use_gioihanrs[$thehe_choise] > 0) { ?>
            <div class="form-row">
                <div class="form-col-1"><span>TOP lúc 0h00</span></div>
                <div class="form-col-2"><?php echo $char_in_top; ?> (bạn được Reset <?php echo "$notice_resetday"; ?> lần trong ngày) </div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <?php } ?>
                 <?php
                    if($use_gioihanrs[$thehe_choise] == 1) {
                ?>

            <div class="form-row">
                <div class="form-col-1"><span>Giới hạn Reset</span></div>
                <div class="form-col-2"><?php echo $gioihanrs; ?> lần / ngày</div>
                <div class="form-col-3">&nbsp;</div>
            </div>
                <?php } ?>
                <?php
                    if($hotrotanthu == 1) {
                ?>
            <div class="form-row">
                <div class="form-col-1"><span>Hỗ Trợ Tân Thủ</span></div>
                <div class="form-col-2"><?php echo $tanthu_group; ?></div>
                <div class="form-col-3">
                    Giảm <strong><?php echo $level_giam; ?> LV</strong><br />
                    Giảm <?php echo $timers_giam; ?> phút chờ RS<br />
                    Giảm <?php echo $zen_decre_percent; ?>% ZEN<br />
                </div>
            </div>
                <?php } ?>
            
            <?php
                    if($Use_VIP == 1 && $_SESSION['nbb_vip'] != 1) {
                ?>
            <div class="form-row">
                <div class="form-col-1"><span>Gói Hỗ Trợ</span> được</div>
                <div class="form-col-2_extra">
                    Giảm <strong><?php echo $vip_rs_lv_decre[$vip_level_slg-1]; ?> LV</strong> khi Reset<br />
                    Thêm <strong><?php echo number_format($vip_rs_point_incre[$vip_level_slg-1], 0, ',', '.'); ?> Point</strong> khi Reset<br />
                    Thêm <strong><?php echo $vip_rs_point_percent_incre[$vip_level_slg-1]; ?>% Point</strong> khi Reset<br />
                    <?php
                    if(is_array($vip_rs_price_decre_percent)) {
                        foreach($vip_rs_price_decre_percent as $k => $v) {
                    ?>
                    <font color="<?php if($v > 50) echo "red"; else echo "blue"; ?>">Giảm <?php echo $v; ?>%</font> phí RS ( <img src="templates/images/icons/items/zen.png" title="ZEN" border="0" /> <img src="templates/images/icons/items/chaos.png" title="Ngọc Hỗn Nguyên ngân hàng" border="0" /> <img src="templates/images/icons/items/creation.png" title="Ngọc Sáng Tạo ngân hàng" border="0" /> <img src="templates/images/icons/items/blue.png" title="Lông Vũ ngân hàng" border="0" /> ) từ lần RS thứ <?php echo $vip_rs_price_decre_rsday[$k]; ?> trong ngày<br />
                    <?php
                        }
                    }
                    ?>
                    
                    <?php if($_SESSION['nbb_vip'] == 0) { ?>
                        <br />
                        <a href="#acc_manager&act=super" rel="ajax" class="btn btn-green btn-block btn-lg">Xem phúc lợi Hỗ Trợ ngay</a>
                    <?php  } ?>
                </div>
            </div>
            <?php } ?>
			<?php
                    if($Use_VIP == 2) {
                ?>
            <div class="form-row">
                <div class="form-col-1"><span>Tài khoản VIP</span></div>
                <div class="form-col-2">
					<?php if($_SESSION['acc_vip'] > 0 && $_SESSION['acc_vip_day'] >= $enable_vip['level_reset']) { ?>
					<div class="image-vip-title vip-<?php echo $_SESSION['acc_vip']; ?>"></div>
					<?php } else { ?>
					<a href="#vip_system" title="Nâng cấp VIP"><div class="image-vip-title upgrade-vip vip-2"></div></a> (Nâng cấp VIP ngay!)
					<?php } ?>
				</div>
                <div class="form-col-3">Giảm <strong><?php echo $extra_level_reset; ?> LV</strong></div>
            </div>
                <?php } ?>  
			
            		
            <div class="form-row">
                <div class="form-col-1"><span>Cấp độ</span></div>
                <div class="form-col-2"><?php echo $_SESSION['nv_level'] . " / {$level_show}"; ?>

                </div>
                <div class="form-col-3">
                    <?php echo $notice_level; ?>
                    
                </div>
                
                <div class="form-col-1_extra" style="clear: left;">&nbsp;</div>
	            <div class="form-col-2_extra">
	                <?php echo $level_rs_decre; ?>
	            </div>
            </div>
            
            		
            <div class="form-row">
                <div class="form-col-1"><span class="bank-icon bank-zen"></span></div>
                <div class="form-col-2"><?php echo $zen_show; ?> <?php if($_SESSION['acc_vip'] > 0) { ?> (<i><s><?php echo number_format($zen_show+$extra_zen_reset, 0, ',', '.'); ?></s></i>)<?php } ?></div>
                <div class="form-col-3"><? echo $notice_zen; ?></div>
                
                <div class="form-col-1_extra" style="clear: left;">&nbsp;</div>
	            <div class="form-col-2_extra">
	                <?php echo $zen_rs_decre; ?>
	            </div>

            </div>
            	
            <div class="form-row">
                <div class="form-col-1"><span class="bank-icon bank-chaos"></span></div>
                <div class="form-col-2"><?php echo $_SESSION['acc_chao'] ." / $chao_show" ; ?></div>
                <div class="form-col-3"><? echo $notice_chao; ?></div>
                
                <div class="form-col-1_extra" style="clear: left;">&nbsp;</div>
	            <div class="form-col-2_extra">
	                <?php echo $chao_rs_decre; ?>
	            </div>
            </div>
	            
            	
            <div class="form-row">
                <div class="form-col-1"><span class="bank-icon bank-creation"></span></div>
                <div class="form-col-2"><?php echo $_SESSION['acc_cre'] . " / $cre_show"; ?></div>
                <div class="form-col-3"><? echo $notice_cre; ?></div>
                
                <div class="form-col-1_extra" style="clear: left;">&nbsp;</div>
	            <div class="form-col-2_extra">
	                <?php echo $cre_rs_decre; ?>
	            </div>
            </div>
	            
            	
            <div class="form-row">
                <div class="form-col-1"><span class="bank-icon bank-blue"></span></div>
                <div class="form-col-2"><?php echo $_SESSION['acc_blue'] ." / $blue_show"; ?></div>
                <div class="form-col-3"><? echo $notice_blue; ?></div>
                
                <div class="form-col-1_extra" style="clear: left;">&nbsp;</div>
	            <div class="form-col-2_extra">
	                <?php echo $blue_rs_decre; ?>
	            </div>
            </div>
	            
            	
            <div class="form-row">
                <div class="form-col-1"><span>Reset/ngày</span></div>
                <div class="form-col-2_extra"><?php echo "$notice_resetday"; ?></div>
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
                <div class="form-col-1"><span>Thời gian chờ Reset</span></div>
                <div class="form-col-2"><?php echo $timers_show; ?> phút</div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <div class="form-submit">

                    <button class="btn btn-green btn-block btn-lg" type="button" id="btn_rs" <?php if($accept=='0') { echo 'disabled="disabled"'; } ?> >Thực hiện Reset</button>
                    <span id="rs_loading"></span>

                    <div id="rs_err"></div>

            </div>
            <?php include('templates/box_facebook.tpl'); ?>
        </div>
        
    </div>
</div>
<!--
<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Quy định reset</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <font color="Crimson"><li>Reset không cần cởi đồ</li>
            <li>Zen để trên người nhân vật</li>
			<li>Zen reset lần đầu là 50.000 zen, những lần kế tiếp + thêm 50.000 zen, tối đa là 20tr zen thì ngừng</li></font>
			<li> Reset lần đầu tiên phải đạt tối thiểu là 200 level. Những lần kế tiếp yêu cầu +5 level, tối đa là 400 level<br>
					- Ví dụ : Reset lần 1 là 200 lv , Reset lần 2 là 205 lv ,Reset lần 3 là 210 lv... cho đến khi tối đa là 400 level</li>
					<li> Nhân vật reset lần đầu tiên được 1000 điểm Point<br>
					- Từ lần thứ 2 đến 49 lần: 150 point/lần reset<br>
					- Từ lần 50 đến 99 lần: 100 point/lần reset<br>
					- Từ lần 100 đến 199 lần: 75 point/lần reset<br>
					- Từ lần 200 đến 299 lần: 50 point/lần reset<br>
					- Từ lần 300 trở đi : 25 point/lần reset<br></li>
					<li> Bạn không cần cất đồ khi Reset. Bạn cần tăng đủ Str để mặc đồ, nếu không tăng đủ sẽ không nhận được tác dụng của đồ vì thiếu điều kiện sử dụng.</li>
					<li> <strong>Giới hạn reset ngày</strong><br>
					- Giới hạn reset của Top1 là 1 lần/ngày<br>
					- Các Top bên dưới Top1 được reset cho tới khi bằng reset với Top1 thì ngừng</li>
        </ul>
    </div>
</div>-->

<div class="out-top-20">
        <table class="table table-blue table-text-center table-border-2">
            <thead>
                <tr class="span">
                    <th colspan="8">Jewel cần cho Reset phải được gửi trong <a class="btn btn-green" href="#char_manager&act=jewel2bank" rel="ajax">ngân hàng</a></th>
                </tr>
                <tr>
                    <th align="center"><b>Reset</b></th>
                    <th align="center"><b>Level</b></th>
                    <th align="center"><b>Zen</b></th>
                    <th align="center"><b>Chao</b></th>
                    <th align="center"><b>Create</b></th>
                    <th align="center"><b>Blue</b></th>
                    <th align="center"><b>Point</b></th>
                    <th align="center"><b>Mệnh lệnh</b></th>
                </tr>
            </thead>
            <tbody>

<?php if ($cap_reset_max>0) { ?>
		  <tr>
		    <td><div align="center"><?php $reset_cap_0++; echo "$reset_cap_0 - $reset_cap_1"; ?></div></td>
		    <td><div align="center"><?php echo "<b>" . abs($level_cap_1 - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_1 ."</s></i>)</font>"; ?></div></td>
		    <td><div align="center"><?php echo number_format($zen_cap_1, 0, ',', '.'); ?></div></td>
		    <td><div align="center"><?php echo $chao_cap_1; ?></div></td>
		    <td><div align="center"><?php echo $cre_cap_1; ?></div></td>
		    <td><div align="center"><?php echo $blue_cap_1; ?></div></td>
		    <td><div align="center"><?php echo $point_cap_1; ?></div></td>
		    <td><div align="center"><?php echo $ml_cap_1; ?></div></td>
		  </tr>
<?php } ?>
<?php if ($cap_reset_max>1) { ?>
		  <tr>
		    <td><div align="center"><?php $reset_cap_1++; echo "$reset_cap_1 - $reset_cap_2"; ?></div></td>
		    <td><div align="center"><?php echo "<b>" . abs($level_cap_2 - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_2 ."</s></i>)</font>"; ?></div></td>
		    <td><div align="center"><?php echo number_format($zen_cap_2, 0, ',', '.'); ?></div></td>
		    <td><div align="center"><?php echo $chao_cap_2; ?></div></td>
		    <td><div align="center"><?php echo $cre_cap_2; ?></div></td>
		    <td><div align="center"><?php echo $blue_cap_2; ?></div></td>
		    <td><div align="center"><?php echo $point_cap_2; ?></div></td>
		    <td><div align="center"><?php echo $ml_cap_2; ?></div></td>
		  </tr>
<?php } ?>
<?php if ($cap_reset_max>2) { ?>
		  <tr>
		    <td><div align="center"><?php $reset_cap_2++; echo "$reset_cap_2 - $reset_cap_3"; ?></div></td>
		    <td><div align="center"><?php echo "<b>" . abs($level_cap_3 - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_3 ."</s></i>)</font>"; ?></div></td>
		    <td><div align="center"><?php echo number_format($zen_cap_3, 0, ',', '.'); ?></div></td>
		    <td><div align="center"><?php echo $chao_cap_3; ?></div></td>
		    <td><div align="center"><?php echo $cre_cap_3; ?></div></td>
		    <td><div align="center"><?php echo $blue_cap_3; ?></div></td>
		    <td><div align="center"><?php echo $point_cap_3; ?></div></td>
		    <td><div align="center"><?php echo $ml_cap_3; ?></div></td>
		  </tr>
<?php } ?>
<?php if ($cap_reset_max>3) { ?>
		  <tr>
		    <td><div align="center"><?php $reset_cap_3++; echo "$reset_cap_3 - $reset_cap_4"; ?></div></td>
		    <td><div align="center"><?php echo "<b>" . abs($level_cap_4 - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_4 ."</s></i>)</font>"; ?></div></td>
		    <td><div align="center"><?php echo number_format($zen_cap_4, 0, ',', '.'); ?></div></td>
		    <td><div align="center"><?php echo $chao_cap_4; ?></div></td>
		    <td><div align="center"><?php echo $cre_cap_4; ?></div></td>
		    <td><div align="center"><?php echo $blue_cap_4; ?></div></td>
		    <td><div align="center"><?php echo $point_cap_4; ?></div></td>
		    <td><div align="center"><?php echo $ml_cap_4; ?></div></td>
		  </tr>
<?php } ?>
<?php if ($cap_reset_max>4) { ?>
		  <tr>
		    <td><div align="center"><?php $reset_cap_4++; echo "$reset_cap_4 - $reset_cap_5"; ?></div></td>
		    <td><div align="center"><?php echo "<b>" . abs($level_cap_5 - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_5 ."</s></i>)</font>"; ?></div></td>
		    <td><div align="center"><?php echo number_format($zen_cap_5, 0, ',', '.'); ?></div></td>
		    <td><div align="center"><?php echo $chao_cap_5; ?></div></td>
		    <td><div align="center"><?php echo $cre_cap_5; ?></div></td>
		    <td><div align="center"><?php echo $blue_cap_5; ?></div></td>
		    <td><div align="center"><?php echo $point_cap_5; ?></div></td>
		    <td><div align="center"><?php echo $ml_cap_5; ?></div></td>
		  </tr>
<?php } ?>
<?php if ($cap_reset_max>5) { ?>
		  <tr>
		    <td><div align="center"><?php $reset_cap_5++; echo "$reset_cap_5 - $reset_cap_6"; ?></div></td>
		    <td><div align="center"><?php echo "<b>" . abs($level_cap_6 - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_6 ."</s></i>)</font>"; ?></div></td>
		    <td><div align="center"><?php echo number_format($zen_cap_6, 0, ',', '.'); ?></div></td>
		    <td><div align="center"><?php echo $chao_cap_6; ?></div></td>
		    <td><div align="center"><?php echo $cre_cap_6; ?></div></td>
		    <td><div align="center"><?php echo $blue_cap_6; ?></div></td>
		    <td><div align="center"><?php echo $point_cap_6; ?></div></td>
		    <td><div align="center"><?php echo $ml_cap_6; ?></div></td>
		  </tr>
<?php } ?>
<?php if ($cap_reset_max>6) { ?>
		  <tr>
		    <td><div align="center"><?php $reset_cap_6++; echo "$reset_cap_6 - $reset_cap_7"; ?></div></td>
		    <td><div align="center"><?php echo "<b>" . abs($level_cap_7 - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_7 ."</s></i>)</font>"; ?></div></td>
		    <td><div align="center"><?php echo number_format($zen_cap_7, 0, ',', '.'); ?></div></td>
		    <td><div align="center"><?php echo $chao_cap_7; ?></div></td>
		    <td><div align="center"><?php echo $cre_cap_7; ?></div></td>
		    <td><div align="center"><?php echo $blue_cap_7; ?></div></td>
		    <td><div align="center"><?php echo $point_cap_7; ?></div></td>
		    <td><div align="center"><?php echo $ml_cap_7; ?></div></td>
		  </tr>
<?php } ?>
<?php if ($cap_reset_max>7) { ?>
		  <tr>
		    <td><div align="center"><?php $reset_cap_7++; echo "$reset_cap_7 - $reset_cap_8"; ?></div></td>
		    <td><div align="center"><?php echo "<b>" . abs($level_cap_8 - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_8 ."</s></i>)</font>"; ?></div></td>
		    <td><div align="center"><?php echo number_format($zen_cap_8, 0, ',', '.'); ?></div></td>
		    <td><div align="center"><?php echo $chao_cap_8; ?></div></td>
		    <td><div align="center"><?php echo $cre_cap_8; ?></div></td>
		    <td><div align="center"><?php echo $blue_cap_8; ?></div></td>
		    <td><div align="center"><?php echo $point_cap_8; ?></div></td>
		    <td><div align="center"><?php echo $ml_cap_8; ?></div></td>
		  </tr>
<?php } ?>
<?php if ($cap_reset_max>8) { ?>
		  <tr>
		    <td><div align="center"><?php $reset_cap_8++; echo "$reset_cap_8 - $reset_cap_9"; ?></div></td>
		    <td><div align="center"><?php echo "<b>" . abs($level_cap_9 - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_9 ."</s></i>)</font>"; ?></div></td>
		    <td><div align="center"><?php echo number_format($zen_cap_9, 0, ',', '.'); ?></div></td>
		    <td><div align="center"><?php echo $chao_cap_9; ?></div></td>
		    <td><div align="center"><?php echo $cre_cap_9; ?></div></td>
		    <td><div align="center"><?php echo $blue_cap_9; ?></div></td>
		    <td><div align="center"><?php echo $point_cap_9; ?></div></td>
		    <td><div align="center"><?php echo $ml_cap_9; ?></div></td>
		  </tr>
<?php } ?>
<?php if ($cap_reset_max>9) { ?>
		  <tr>
		    <td><div align="center"><?php $reset_cap_9++; echo "$reset_cap_9 - $reset_cap_10"; ?></div></td>
		    <td><div align="center"><?php echo "<b>" . abs($level_cap_10 - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_10 ."</s></i>)</font>"; ?></div></td>
		    <td><div align="center"><?php echo number_format($zen_cap_10, 0, ',', '.'); ?></div></td>
		    <td><div align="center"><?php echo $chao_cap_10; ?></div></td>
		    <td><div align="center"><?php echo $cre_cap_10; ?></div></td>
		    <td><div align="center"><?php echo $blue_cap_10; ?></div></td>
		    <td><div align="center"><?php echo $point_cap_10; ?></div></td>
		    <td><div align="center"><?php echo $ml_cap_10; ?></div></td>
		  </tr>
<?php } ?>
<?php if ($cap_reset_max>10) { ?>
		  <tr>
		    <td><div align="center"><?php $reset_cap_10++; echo "$reset_cap_10 - $reset_cap_11"; ?></div></td>
		    <td><div align="center"><?php echo "<b>" . abs($level_cap_11 - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_11 ."</s></i>)</font>"; ?></div></td>
		    <td><div align="center"><?php echo number_format($zen_cap_11, 0, ',', '.'); ?></div></td>
		    <td><div align="center"><?php echo $chao_cap_11; ?></div></td>
		    <td><div align="center"><?php echo $cre_cap_11; ?></div></td>
		    <td><div align="center"><?php echo $blue_cap_11; ?></div></td>
		    <td><div align="center"><?php echo $point_cap_11; ?></div></td>
		    <td><div align="center"><?php echo $ml_cap_11; ?></div></td>
		  </tr>
<?php } ?>
<?php if ($cap_reset_max>11) { ?>
		  <tr>
		    <td><div align="center"><?php $reset_cap_11++; echo "$reset_cap_11 - $reset_cap_12"; ?></div></td>
		    <td><div align="center"><?php echo "<b>" . abs($level_cap_12 - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_12 ."</s></i>)</font>"; ?></div></td>
		    <td><div align="center"><?php echo number_format($zen_cap_12, 0, ',', '.'); ?></div></td>
		    <td><div align="center"><?php echo $chao_cap_12; ?></div></td>
		    <td><div align="center"><?php echo $cre_cap_12; ?></div></td>
		    <td><div align="center"><?php echo $blue_cap_12; ?></div></td>
		    <td><div align="center"><?php echo $point_cap_12; ?></div></td>
		    <td><div align="center"><?php echo $ml_cap_12; ?></div></td>
		  </tr>
<?php } ?>
<?php if ($cap_reset_max>12) { ?>
		  <tr>
		    <td><div align="center"><?php $reset_cap_12++; echo "$reset_cap_12 - $reset_cap_13"; ?></div></td>
		    <td><div align="center"><?php echo "<b>" . abs($level_cap_13 - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_13 ."</s></i>)</font>"; ?></div></td>
		    <td><div align="center"><?php echo number_format($zen_cap_13, 0, ',', '.'); ?></div></td>
		    <td><div align="center"><?php echo $chao_cap_13; ?></div></td>
		    <td><div align="center"><?php echo $cre_cap_13; ?></div></td>
		    <td><div align="center"><?php echo $blue_cap_13; ?></div></td>
		    <td><div align="center"><?php echo $point_cap_13; ?></div></td>
		    <td><div align="center"><?php echo $ml_cap_13; ?></div></td>
		  </tr>
<?php } ?>
<?php if ($cap_reset_max>13) { ?>
		  <tr>
		    <td><div align="center"><?php $reset_cap_13++; echo "$reset_cap_13 - $reset_cap_14"; ?></div></td>
		    <td><div align="center"><?php echo "<b>" . abs($level_cap_14 - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_14 ."</s></i>)</font>"; ?></div></td>
		    <td><div align="center"><?php echo number_format($zen_cap_14, 0, ',', '.'); ?></div></td>
		    <td><div align="center"><?php echo $chao_cap_14; ?></div></td>
		    <td><div align="center"><?php echo $cre_cap_14; ?></div></td>
		    <td><div align="center"><?php echo $blue_cap_14; ?></div></td>
		    <td><div align="center"><?php echo $point_cap_14; ?></div></td>
		    <td><div align="center"><?php echo $ml_cap_14; ?></div></td>
		  </tr>
<?php } ?>
<?php if ($cap_reset_max>14) { ?>
		  <tr>
		    <td><div align="center"><?php $reset_cap_14++; echo "$reset_cap_14 - $reset_cap_15"; ?></div></td>
		    <td><div align="center"><?php echo "<b>" . abs($level_cap_15 - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_15 ."</s></i>)</font>"; ?></div></td>
		    <td><div align="center"><?php echo number_format($zen_cap_15, 0, ',', '.'); ?></div></td>
		    <td><div align="center"><?php echo $chao_cap_15; ?></div></td>
		    <td><div align="center"><?php echo $cre_cap_15; ?></div></td>
		    <td><div align="center"><?php echo $blue_cap_15; ?></div></td>
		    <td><div align="center"><?php echo $point_cap_15; ?></div></td>
		    <td><div align="center"><?php echo $ml_cap_15; ?></div></td>
		  </tr>
<?php } ?>
<?php if ($cap_reset_max>15) { ?>
		  <tr>
		    <td><div align="center"><?php $reset_cap_15++; echo "$reset_cap_15 - $reset_cap_16"; ?></div></td>
		    <td><div align="center"><?php echo "<b>" . abs($level_cap_16 - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_16 ."</s></i>)</font>"; ?></div></td>
		    <td><div align="center"><?php echo number_format($zen_cap_16, 0, ',', '.'); ?></div></td>
		    <td><div align="center"><?php echo $chao_cap_16; ?></div></td>
		    <td><div align="center"><?php echo $cre_cap_16; ?></div></td>
		    <td><div align="center"><?php echo $blue_cap_16; ?></div></td>
		    <td><div align="center"><?php echo $point_cap_16; ?></div></td>
		    <td><div align="center"><?php echo $ml_cap_16; ?></div></td>
		  </tr>
<?php } ?>
<?php if ($cap_reset_max>16) { ?>
		  <tr>
		    <td><div align="center"><?php $reset_cap_16++; echo "$reset_cap_16 - $reset_cap_17"; ?></div></td>
		    <td><div align="center"><?php echo "<b>" . abs($level_cap_17 - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_17 ."</s></i>)</font>"; ?></div></td>
		    <td><div align="center"><?php echo number_format($zen_cap_17, 0, ',', '.'); ?></div></td>
		    <td><div align="center"><?php echo $chao_cap_17; ?></div></td>
		    <td><div align="center"><?php echo $cre_cap_17; ?></div></td>
		    <td><div align="center"><?php echo $blue_cap_17; ?></div></td>
		    <td><div align="center"><?php echo $point_cap_17; ?></div></td>
		    <td><div align="center"><?php echo $ml_cap_17; ?></div></td>
		  </tr>
<?php } ?>
<?php if ($cap_reset_max>17) { ?>
		  <tr>
		    <td><div align="center"><?php $reset_cap_17++; echo "$reset_cap_17 - $reset_cap_18"; ?></div></td>
		    <td><div align="center"><?php echo "<b>" . abs($level_cap_18 - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_18 ."</s></i>)</font>"; ?></div></td>
		    <td><div align="center"><?php echo number_format($zen_cap_18, 0, ',', '.'); ?></div></td>
		    <td><div align="center"><?php echo $chao_cap_18; ?></div></td>
		    <td><div align="center"><?php echo $cre_cap_18; ?></div></td>
		    <td><div align="center"><?php echo $blue_cap_18; ?></div></td>
		    <td><div align="center"><?php echo $point_cap_18; ?></div></td>
		    <td><div align="center"><?php echo $ml_cap_18; ?></div></td>
		  </tr>
<?php } ?>
<?php if ($cap_reset_max>18) { ?>
		  <tr>
		    <td><div align="center"><?php $reset_cap_18++; echo "$reset_cap_18 - $reset_cap_19"; ?></div></td>
		    <td><div align="center"><?php echo "<b>" . abs($level_cap_19 - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_19 ."</s></i>)</font>"; ?></div></td>
		    <td><div align="center"><?php echo number_format($zen_cap_19, 0, ',', '.'); ?></div></td>
		    <td><div align="center"><?php echo $chao_cap_19; ?></div></td>
		    <td><div align="center"><?php echo $cre_cap_19; ?></div></td>
		    <td><div align="center"><?php echo $blue_cap_19; ?></div></td>
		    <td><div align="center"><?php echo $point_cap_19; ?></div></td>
		    <td><div align="center"><?php echo $ml_cap_19; ?></div></td>
		  </tr>
<?php } ?>
<?php if ($cap_reset_max>19) { ?>
		  <tr>
		    <td><div align="center"><?php $reset_cap_19++; echo "$reset_cap_19 - $reset_cap_20"; ?></div></td>
		    <td><div align="center"><?php echo "<b>" . abs($level_cap_20 - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_20 ."</s></i>)</font>"; ?></div></td>
		    <td><div align="center"><?php echo number_format($zen_cap_20, 0, ',', '.'); ?></div></td>
		    <td><div align="center"><?php echo $chao_cap_20; ?></div></td>
		    <td><div align="center"><?php echo $cre_cap_20; ?></div></td>
		    <td><div align="center"><?php echo $blue_cap_20; ?></div></td>
		    <td><div align="center"><?php echo $point_cap_20; ?></div></td>
		    <td><div align="center"><?php echo $ml_cap_20; ?></div></td>
		  </tr>
<?php } ?>
            </tbody>
		</table>
</div>
<?php if($use_gioihanrs[$thehe_choise] == 1) { ?>

<div class="out-top-20">
    <table class="table table-blue table-text-center table-border-2">
        <thead>
            <tr class="span">
                <th colspan="4" align="center">
                    <b>Giới hạn Reset trong ngày</b><br>
                    Nhân vật <strong class="clr02"><?php echo $_SESSION['mu_nvchon']; ?></strong> đứng TOP <?php echo $char_in_top; ?> được Reset tối đa <b><?php echo $gioihanrs; ?></b> lần / ngày<br />
                    <i>(TOP nhân vật tính tại lúc 0h00 hàng ngày)</i>
                </th>
            </tr>
            <tr>
                <th align="center" rowspan="2"><b>TOP</b></th>
                <th align="center" colspan="3"><b>Giới hạn số lần Reset/ngày</b></th>
            </tr>
            <tr>
                <th align="center"><b>Thứ 2 - Thứ 6</b></th>
                <th align="center"><b>Thứ 7</b></th>
                <th align="center"><b>Chủ Nhật</b></th>
            </tr>
        </thead>
        <tbody>
          <?php for($ghrs_cap_i = 1; $ghrs_cap_i < $ghrs_cap_max; $ghrs_cap_i++) { ?>
		  <tr>
		    <td align="center">TOP <b><?php echo $ghrs_top_cap[$ghrs_cap_i-1] + 1; ?></b> - <?php echo $ghrs_top_cap[$ghrs_cap_i]; ?></td>
		    <td align="center"><?php echo $ghrs_rsmax_cap[$thehe_choise][$ghrs_cap_i]; ?> lần / ngày</td>
            <td align="center"><?php echo $ghrs_rsmax_cap[$thehe_choise][$ghrs_cap_i] + +floor($ghrs_rsmax_cap[$thehe_choise][$ghrs_cap_i] * $overrs_sat_extra[$thehe_choise]/100); ?> lần / ngày</td>
            <td align="center"><?php echo $ghrs_rsmax_cap[$thehe_choise][$ghrs_cap_i] + +floor($ghrs_rsmax_cap[$thehe_choise][$ghrs_cap_i] * $overrs_sun_extra[$thehe_choise]/100); ?> lần / ngày</td>
		  </tr>
          <?php } ?>
		  <tr>
		    <td align="center"><b>TOP > <?php echo $ghrs_top_cap[$ghrs_cap_i-1]; ?></b></td>
		    <td align="center"><?php echo $ghrs_rsmax_cap[$thehe_choise][$ghrs_cap_i]; ?> lần / ngày</td>
            <td align="center"><?php echo $ghrs_rsmax_cap[$thehe_choise][$ghrs_cap_i] + +floor($ghrs_rsmax_cap[$thehe_choise][$ghrs_cap_i] * $overrs_sat_extra[$thehe_choise]/100); ?> lần / ngày</td>
            <td align="center"><?php echo $ghrs_rsmax_cap[$thehe_choise][$ghrs_cap_i] + +floor($ghrs_rsmax_cap[$thehe_choise][$ghrs_cap_i] * $overrs_sun_extra[$thehe_choise]/100); ?> lần / ngày</td>
		  </tr>
        </tbody>
        </table>
    </div>
<?php } elseif($use_gioihanrs[$thehe_choise] == 2) { ?>
<div class="out-top-20">
    <table class="table table-blue table-text-center table-border-2">
        <thead>
		  <tr class="span">
		    <th colspan="4" align="center">
		    	Nhân vật <strong class="clr02"><?php echo $_SESSION['mu_nvchon']; ?></strong> đứng <font color="Crimson"><?php echo $char_in_top; ?></font> xếp hạng lúc 0h00
	    	</th>
		  </tr>
		  <tr>
		    <th align="center" rowspan="2"><b>TOP</b></th>
		    <th align="center" colspan="3"><b>Giới hạn số lần Reset/ngày</b></th>
		  </tr>
          <tr>
		    <th align="center"><b>Thứ 2 - Thứ 6</b></th>
		    <th align="center"><b>Thứ 7</b></th>
            <th align="center"><b>Chủ Nhật</b></th>
		  </tr>
        </thead>
        <tbody>
          <tr>
		    <td align="center">TOP <b>1</b></td>
		    <td align="center"><?php echo $ghrs2_rsmax_cap[$thehe_choise][1]; ?> lần / ngày</td>
            <td align="center"><?php echo $ghrs2_rsmax_cap[$thehe_choise][1] + +floor($ghrs2_rsmax_cap[$thehe_choise][1] * $overrs_sat_extra[$thehe_choise]/100); ?> lần / ngày</td>
            <td align="center"><?php echo $ghrs2_rsmax_cap[$thehe_choise][1] + +floor($ghrs2_rsmax_cap[$thehe_choise][1] * $overrs_sun_extra[$thehe_choise]/100); ?> lần / ngày</td>
		  </tr>
          <?php for($ghrs_cap_i = 2; $ghrs_cap_i < $ghrs_cap_max; $ghrs_cap_i++) { ?>
		  <tr>
		    <td align="center">TOP <b><?php echo $ghrs2_top_cap[$ghrs_cap_i-1] + 1; ?></b> - <?php echo $ghrs2_top_cap[$ghrs_cap_i]; ?></td>
		    <td align="center" colspan="3">Reset không giới hạn cho đến khi cách TOP 1 MAX ngày : <?php echo $ghrs2_rsmax_cap[$thehe_choise][$ghrs_cap_i]; ?> RS và tối đa Reset <?php echo $ghrs2_rsmax_daily[$thehe_choise][$ghrs_cap_i]; ?> lần / ngày</td>
		  </tr>
          <?php } ?>
		  <tr>
		    <td align="center"><b>TOP > <?php echo $ghrs2_top_cap[$ghrs_cap_i-1]; ?></b></td>
		    <td align="center" colspan="3">Được reset không giới hạn cho đến khi bằng reset với Top 1</td>
		    <!--<td align="center" colspan="3">Reset không giới hạn cho đến khi cách TOP 1 MAX ngày : <?php echo $ghrs2_rsmax_cap[$thehe_choise][$ghrs_cap_i]; ?> RS và tối đa Reset <?php echo $ghrs2_rsmax_daily[$thehe_choise][$ghrs_cap_i]; ?> lần / ngày</td>-->
		  </tr>
        </tbody>
        </table>
    </div>
<?php } ?>

        <?php
            if($hotrotanthu == 1) {
        ?>
<div class="out-top-20">
    <table class="table table-blue table-text-center table-border-2">
        <thead>
            <tr class="span">
                <th colspan="2" align="center">
                	<b>Tân Thủ Được giảm cấp độ khi Reset</b>
                </th>
            </tr>
            <tr>
                <th align="center"><b>Nhân vật thuộc TOP</b></th>
                <th align="center"><b>Cấp độ khi Reset được giảm</b></th>
            </tr>
        </thead>
            <?php for($tanthu_cap_i = 1; $tanthu_cap_i < $tanthu_cap_max; $tanthu_cap_i++) { ?>
            <tr>
                <td align="center">TOP <b><?php echo $tanthu_top_cap[$tanthu_cap_i-1] + 1; ?> - <?php echo $tanthu_top_cap[$tanthu_cap_i] ?></b></td>
                <td align="center">Giảm <b><?php echo $tanthu_lvredure[$tanthu_cap_i]; ?></b> LV khi Reset</td>
            </tr>
            <?php } ?>
            
            <tr>
                <td align="center"><b>TOP > <?php echo $tanthu_top_cap[$tanthu_cap_i-1]; ?></b></td>
                <td align="center">Giảm <b><?php echo $tanthu_lvredure[$tanthu_cap_i]; ?></b> LV khi Reset</td>
            </tr>
            
        </table>
    </div>
        <?php
                }
        ?>
