<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Reset Hộ</h1>
        <?php include('templates/char_manager/reset_head.tpl'); ?>
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li><strong>Reset Hộ</strong> : nhờ hệ thống train Reset giúp khi có việc bận.</li>
            <li><strong>Reset Hộ</strong> : trợ giúp người chơi Reset khi không có đủ thời gian Reset hết số lần Reset trong ngày.</li>
            <li><strong>Reset Hộ</strong> : tương tự như Reset VIP mà không cần quan tâm cấp độ nhân vật.</li>
            <li><strong>Reset Hộ</strong> : lên số lần Reset của nhân vật nhưng chưa cập nhập Point ngay, phải Reset bằng ngọc hoặc Reset VIP mới lấy Point Reset Hộ.</li>
            <li>Phí Reset Hộ = Phí Reset VIP + Phí hệ thống train hộ.</li>
            <li><strong>Reset Hộ không được tính vào Đua TOP</strong></li>
            <li>Reset không cần cởi đồ</li>
            <li>Zen để trên người nhân vật</li>
            <li><b><a href="#char_manager&act=rutpoint" onclick="$('index2.php?mod=char_manager&act=rutpoint','hienthi');">Rút Point</a></b> để lấy Point sử dụng sau khi Reset</li>
        </ul>
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
            <div class="form-row">
                <div class="form-col-1"><span>Reset lần thứ</span></div>
                <div class="form-col-2"><?php echo $_SESSION['nv_reset']+1; ?></div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <?php if($hotrotanthu == 1 || $use_gioihanrs[$thehe_choise] > 0) { ?>
            <div class="form-row">
                <div class="form-col-1"><span>TOP 0h</span></div>
                <div class="form-col-2">
                    <?php echo $char_in_top; ?></strong>
                </div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <?php } ?>
            <?php
                    if($use_gioihanrs[$thehe_choise] == 1) {
                ?>
            <div class="form-row">
                <div class="form-col-1"><span>Giới hạn Reset</span></div>
                <div class="form-col-2">
                    <?php echo $gioihanrs; ?>lần / ngày
                </div>
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
                    Giảm <?php echo $money_decre_percent; ?>% GC hoặc VC<br />
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
                    <font color="<?php if($v > 50) echo "red"; else echo "blue"; ?>">Giảm <?php echo $v; ?>%</font> phí RS VIP ( <img src="templates/images/icons/g.png" title="Gcent" border="0" /> <img src="templates/images/icons/g+.png" title="Gcent" border="0" /> <img src="templates/images/icons/v.png" title="Vcent" border="0" /> <img src="templates/images/icons/v+.png" title="Vcent+" border="0" /> ) từ lần RS thứ <?php echo $vip_rs_price_decre_rsday[$k]; ?> trong ngày<br />
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
                <div class="form-col-1"><span class="bank-icon bank-zen"></span></div>
                <div class="form-col-2">
                    <?php echo $zen_rs_show; ?> <?php if($_SESSION['acc_vip'] > 0) { ?> (<i><s><?php echo number_format($zen_rs_show+$extra_zen_reset, 0, ',', '.'); ?></s></i>)<?php } ?>
                </div>
                <div class="form-col-3">
                    <? echo $notice_zen; ?>
                </div>
            </div>
            <div class="form-row" id="use_gcoin" <?php if($chenhlech_vpoint >= 0) { ?> style="display: none;" <?php } ?> >
                <div class="form-col-1"><span class="bank-icon bank-g"></span> <span class="bank-icon bank-g2"></span></div>
                <div class="form-col-2">
                    <?php echo $gc_rs_show; ?>
                </div>
                <div class="form-col-3">
                    <? echo $notice_gcoin; ?>
                </div>
                
                <div class="form-col-1_extra" style="clear: left;">&nbsp;</div>
                <div class="form-col-2_extra">
                    <?php echo $gc_rs_decre; ?>
                </div>
            </div>
            <div class="form-row" id="use_vpoint" <?php if($chenhlech_vpoint < 0) { ?> style="display: none;" <?php } ?> >
                <div class="form-col-1"><span class="bank-icon bank-v"></span> <span class="bank-icon bank-v2"></span></div>
                <div class="form-col-2">
                    <?php echo $vc_rs_show; ?>
                </div>
                <div class="form-col-3">
                    <? echo $notice_vpoint; ?>
                </div>
                
                <div class="form-col-1_extra" style="clear: left;">&nbsp;</div>
                <div class="form-col-2_extra">
                    <?php echo $vc_rs_decre; ?>
                </div>
            </div>
            <div class="form-row">
                <div class="form-col-1"><span>Reset/ngày</span></div>
                <div class="form-col-2_extra">
                    <?php echo "$notice_resetday"; ?>
                </div>
            </div>
            <div class="form-row">
                <div class="form-col-1"><span>Reset vượt mức</span></div>
                <div class="form-col-2">
                    <?php echo "$notice_vuotmuc"; ?>
                </div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <div class="form-row">
                <div class="form-col-1"><span>Đổi nhân vật</span></div>
                <div class="form-col-2">
                    <?php echo $doinv; ?>
                </div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <div class="form-row">
                <div class="form-col-1"><span>Thoát Game</span></div>
                <div class="form-col-2">
                    <?php echo $online; ?>
                </div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <div class="form-row">
                <div class="form-col-1"><span>Chọn loại đơn vị Tiền Tệ</span></div>
                <div class="form-col-2">
                    <input type="radio" name="tiente" value="gcoin" id="use_gcent" <?php if($chenhlech_vpoint < 0) { ?> checked="checked" <?php } ?> /> <label for="use_gcent">Gcent</label><br />
                    <input type="radio" name="tiente" value="vpoint" id="use_vcent" <?php if($chenhlech_vpoint >= 0) { ?> checked="checked" <?php } ?> /> <label for="use_vcent">Vcent</label>
                </div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <?php if($use_gioihanrs[$thehe_choise]==1 && $use_overrs[$thehe_choise]==1) { ?>

            <div class="form-row">
                <div class="form-col-1"><span>Reset Vượt Mức</span></div>
                <div class="form-col-2">

                    <i>Cho phép Reset vượt mức quy định trong ngày : <b> <?php echo $overrs_rs[$thehe_choise]; ?> lần Reset </b><br />
                        Bắt buộc phải Reset bằng Gcent.<br />
                        Chi phí thêm : <b> <?php echo $overrs_gcoin[$thehe_choise]; ?> Gcent </b></i>
                </div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <?php } ?>
            <div class="form-submit">
                
                    <button class="btn btn-green btn-block btn-lg" type="button" name="Submit" id="btn_rs_up" <?php if($accept=='0') { echo 'disabled="disabled"'; } ?> >Thực hiện Reset Hộ</button>

                <span id="rs_loading"></span>
                <div id="rs_err"></div>
            </div>
            <?php include('templates/box_facebook.tpl'); ?>
        </div>
    </div>
</div>

<div class="out-top-20">
<table class="table table-blue table-text-center table-border-2">
<thead>
<tr>
    <th align="center" rowspan="2"><b>Reset</b></th>
    <th align="center" colspan="4"><b>Điều kiện Reset</b></th>
    <th align="center" colspan="2"><b>Phần thưởng</b></th>
</tr>
<tr>
    <th align="center"><b>Level</b></th>
    <th align="center"><b>Zen</b></th>
    <th align="center"><b>Gcent</b></th>
    <th align="center"><b>Vcent</b></th>
    <th align="center"><b>Point</b></th>
    <th align="center"><b>ML</b></th>
</tr>
<tbody>
<?php if ($cap_reset_max>0) { ?>
<tr>
    <td align="center"><?php $reset_cap_0++; echo "$reset_cap_0 - $reset_cap_1"; ?></td>
    <td align="center"><?php echo "<b>" . abs($level_cap_1_vip - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_1_vip ."</s></i>)</font>";; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_1*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_1_vip; ?></td>
    <td align="center"><?php $vpoint_cap_1_vip = floor($gcoin_cap_1_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_1_vip; ?></td>
    <td align="center"><?php echo $point_cap_1_vip; ?></td>
    <td align="center"><?php echo $ml_cap_1_vip; ?></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>1) { ?>
<tr>
    <td align="center"><?php $reset_cap_1++; echo "$reset_cap_1 - $reset_cap_2"; ?></td>
    <td align="center"><?php echo "<b>" . abs($level_cap_2_vip - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_2_vip ."</s></i>)</font>";; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_2*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_2_vip; ?></td>
    <td align="center"><?php $vpoint_cap_2_vip = floor($gcoin_cap_2_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_2_vip; ?></td>
    <td align="center"><?php echo $point_cap_2_vip; ?></td>
    <td align="center"><?php echo $ml_cap_2_vip; ?></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>2) { ?>
<tr>
    <td align="center"><?php $reset_cap_2++; echo "$reset_cap_2 - $reset_cap_3"; ?></td>
    <td align="center"><?php echo "<b>" . abs($level_cap_3_vip - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_3_vip ."</s></i>)</font>";; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_3*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_3_vip; ?></td>
    <td align="center"><?php $vpoint_cap_3_vip = floor($gcoin_cap_3_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_3_vip; ?></td>
    <td align="center"><?php echo $point_cap_3_vip; ?></td>
    <td align="center"><?php echo $ml_cap_3_vip; ?></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>3) { ?>
<tr>
    <td align="center"><?php $reset_cap_3++; echo "$reset_cap_3 - $reset_cap_4"; ?></td>
    <td align="center"><?php echo "<b>" . abs($level_cap_4_vip - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_4_vip ."</s></i>)</font>";; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_4*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_4_vip; ?></td>
    <td align="center"><?php $vpoint_cap_4_vip = floor($gcoin_cap_4_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_4_vip; ?></td>
    <td align="center"><?php echo $point_cap_4_vip; ?></td>
    <td align="center"><?php echo $ml_cap_4_vip; ?></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>4) { ?>
<tr>
    <td align="center"><?php $reset_cap_4++; echo "$reset_cap_4 - $reset_cap_5"; ?></td>
    <td align="center"><?php echo "<b>" . abs($level_cap_5_vip - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_5_vip ."</s></i>)</font>";; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_5*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_5_vip; ?></td>
    <td align="center"><?php $vpoint_cap_5_vip = floor($gcoin_cap_5_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_5_vip; ?></td>
    <td align="center"><?php echo $point_cap_5_vip; ?></td>
    <td align="center"><?php echo $ml_cap_5_vip; ?></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>5) { ?>
<tr>
    <td align="center"><?php $reset_cap_5++; echo "$reset_cap_5 - $reset_cap_6"; ?></td>
    <td align="center"><?php echo "<b>" . abs($level_cap_6_vip - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_6_vip ."</s></i>)</font>";; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_6*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_6_vip; ?></td>
    <td align="center"><?php $vpoint_cap_6_vip = floor($gcoin_cap_6_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_6_vip; ?></td>
    <td align="center"><?php echo $point_cap_6_vip; ?></td>
    <td align="center"><?php echo $ml_cap_6_vip; ?></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>6) { ?>
<tr>
    <td align="center"><?php $reset_cap_6++; echo "$reset_cap_6 - $reset_cap_7"; ?></td>
    <td align="center"><?php echo "<b>" . abs($level_cap_7_vip - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_7_vip ."</s></i>)</font>";; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_7*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_7_vip; ?></td>
    <td align="center"><?php $vpoint_cap_7_vip = floor($gcoin_cap_7_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_7_vip; ?></td>
    <td align="center"><?php echo $point_cap_7_vip; ?></td>
    <td align="center"><?php echo $ml_cap_7_vip; ?></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>7) { ?>
<tr>
    <td align="center"><?php $reset_cap_7++; echo "$reset_cap_7 - $reset_cap_8"; ?></td>
    <td align="center"><?php echo "<b>" . abs($level_cap_8_vip - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_8_vip ."</s></i>)</font>";; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_8*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_8_vip; ?></td>
    <td align="center"><?php $vpoint_cap_8_vip = floor($gcoin_cap_8_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_8_vip; ?></td>
    <td align="center"><?php echo $point_cap_8_vip; ?></td>
    <td align="center"><?php echo $ml_cap_8_vip; ?></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>8) { ?>
<tr>
    <td align="center"><?php $reset_cap_8++; echo "$reset_cap_8 - $reset_cap_9"; ?></td>
    <td align="center"><?php echo "<b>" . abs($level_cap_9_vip - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_9_vip ."</s></i>)</font>";; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_9*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_9_vip; ?></td>
    <td align="center"><?php $vpoint_cap_9_vip = floor($gcoin_cap_9_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_9_vip; ?></td>
    <td align="center"><?php echo $point_cap_9_vip; ?></td>
    <td align="center"><?php echo $ml_cap_9_vip; ?></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>9) { ?>
<tr>
    <td align="center"><?php $reset_cap_9++; echo "$reset_cap_9 - $reset_cap_10"; ?></td>
    <td align="center"><?php echo "<b>" . abs($level_cap_10_vip - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_10_vip ."</s></i>)</font>";; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_10*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_10_vip; ?></td>
    <td align="center"><?php $vpoint_cap_10_vip = floor($gcoin_cap_10_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_10_vip; ?></td>
    <td align="center"><?php echo $point_cap_10_vip; ?></td>
    <td align="center"><?php echo $ml_cap_10_vip; ?></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>10) { ?>
<tr>
    <td align="center"><?php $reset_cap_10++; echo "$reset_cap_10 - $reset_cap_11"; ?></td>
    <td align="center"><?php echo "<b>" . abs($level_cap_11_vip - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_11_vip ."</s></i>)</font>";; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_11*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_11_vip; ?></td>
    <td align="center"><?php $vpoint_cap_11_vip = floor($gcoin_cap_11_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_11_vip; ?></td>
    <td align="center"><?php echo $point_cap_11_vip; ?></td>
    <td align="center"><?php echo $ml_cap_11_vip; ?></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>11) { ?>
<tr>
    <td align="center"><?php $reset_cap_11++; echo "$reset_cap_11 - $reset_cap_12"; ?></td>
    <td align="center"><?php echo "<b>" . abs($level_cap_12_vip - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_12_vip ."</s></i>)</font>";; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_12*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_12_vip; ?></td>
    <td align="center"><?php $vpoint_cap_12_vip = floor($gcoin_cap_12_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_12_vip; ?></td>
    <td align="center"><?php echo $point_cap_12_vip; ?></td>
    <td align="center"><?php echo $ml_cap_12_vip; ?></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>12) { ?>
<tr>
    <td align="center"><?php $reset_cap_12++; echo "$reset_cap_12 - $reset_cap_13"; ?></td>
    <td align="center"><?php echo "<b>" . abs($level_cap_13_vip - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_13_vip ."</s></i>)</font>";; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_13*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_13_vip; ?></td>
    <td align="center"><?php $vpoint_cap_13_vip = floor($gcoin_cap_13_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_13_vip; ?></td>
    <td align="center"><?php echo $point_cap_13_vip; ?></td>
    <td align="center"><?php echo $ml_cap_13_vip; ?></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>13) { ?>
<tr>
    <td align="center"><?php $reset_cap_13++; echo "$reset_cap_13 - $reset_cap_14"; ?></td>
    <td align="center"><?php echo "<b>" . abs($level_cap_14_vip - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_14_vip ."</s></i>)</font>";; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_14*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_14_vip; ?></td>
    <td align="center"><?php $vpoint_cap_14_vip = floor($gcoin_cap_14_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_14_vip; ?></td>
    <td align="center"><?php echo $point_cap_14_vip; ?></td>
    <td align="center"><?php echo $ml_cap_14_vip; ?></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>14) { ?>
<tr>
    <td align="center"><?php $reset_cap_14++; echo "$reset_cap_14 - $reset_cap_15"; ?></td>
    <td align="center"><?php echo "<b>" . abs($level_cap_15_vip - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_15_vip ."</s></i>)</font>";; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_15*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_15_vip; ?></td>
    <td align="center"><?php $vpoint_cap_15_vip = floor($gcoin_cap_15_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_15_vip; ?></td>
    <td align="center"><?php echo $point_cap_15_vip; ?></td>
    <td align="center"><?php echo $ml_cap_15_vip; ?></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>15) { ?>
<tr>
    <td align="center"><?php $reset_cap_15++; echo "$reset_cap_15 - $reset_cap_16"; ?></td>
    <td align="center"><?php echo "<b>" . abs($level_cap_16_vip - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_16_vip ."</s></i>)</font>";; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_16*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_16_vip; ?></td>
    <td align="center"><?php $vpoint_cap_16_vip = floor($gcoin_cap_16_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_16_vip; ?></td>
    <td align="center"><?php echo $point_cap_16_vip; ?></td>
    <td align="center"><?php echo $ml_cap_16_vip; ?></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>16) { ?>
<tr>
    <td align="center"><?php $reset_cap_16++; echo "$reset_cap_16 - $reset_cap_17"; ?></td>
    <td align="center"><?php echo "<b>" . abs($level_cap_17_vip - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_17_vip ."</s></i>)</font>";; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_17*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_17_vip; ?></td>
    <td align="center"><?php $vpoint_cap_17_vip = floor($gcoin_cap_17_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_17_vip; ?></td>
    <td align="center"><?php echo $point_cap_17_vip; ?></td>
    <td align="center"><?php echo $ml_cap_17_vip; ?></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>17) { ?>
<tr>
    <td align="center"><?php $reset_cap_17++; echo "$reset_cap_17 - $reset_cap_18"; ?></td>
    <td align="center"><?php echo "<b>" . abs($level_cap_18_vip - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_18_vip ."</s></i>)</font>";; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_18*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_18_vip; ?></td>
    <td align="center"><?php $vpoint_cap_18_vip = floor($gcoin_cap_18_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_18_vip; ?></td>
    <td align="center"><?php echo $point_cap_18_vip; ?></td>
    <td align="center"><?php echo $ml_cap_18_vip; ?></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>18) { ?>
<tr>
    <td align="center"><?php $reset_cap_18++; echo "$reset_cap_18 - $reset_cap_19"; ?></td>
    <td align="center"><?php echo "<b>" . abs($level_cap_19_vip - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_19_vip ."</s></i>)</font>";; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_19*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_19_vip; ?></td>
    <td align="center"><?php $vpoint_cap_19_vip = floor($gcoin_cap_19_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_19_vip; ?></td>
    <td align="center"><?php echo $point_cap_19_vip; ?></td>
    <td align="center"><?php echo $ml_cap_19_vip; ?></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>19) { ?>
<tr>
    <td align="center"><?php $reset_cap_19++; echo "$reset_cap_19 - $reset_cap_20"; ?></td>
    <td align="center"><?php echo "<b>" . abs($level_cap_20_vip - $level_giam) . "</b> <font size=1>(<i><s>". $level_cap_20_vip ."</s></i>)</font>";; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_20*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_20_vip; ?></td>
    <td align="center"><?php $vpoint_cap_20_vip = floor($gcoin_cap_20_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_20_vip; ?></td>
    <td align="center"><?php echo $point_cap_20_vip; ?></td>
    <td align="center"><?php echo $ml_cap_20_vip; ?></td>
</tr>
<?php } ?>
</tbody>
</table>
</div>
<?php if($use_gioihanrs[$thehe_choise] == 1) { ?>
<div class="out-top-20">
    <table class="table table-blue table-text-center table-border-2">
        <thead>
        <tr>
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
        <tr>
            <th align="center">TOP <b>1</b></th>
            <th align="center"><?php echo $ghrs2_rsmax_cap[$thehe_choise][1]; ?> lần / ngày</th>
            <th align="center"><?php echo $ghrs2_rsmax_cap[$thehe_choise][1] + +floor($ghrs2_rsmax_cap[$thehe_choise][1] * $overrs_sat_extra[$thehe_choise]/100); ?> lần / ngày</th>
            <th align="center"><?php echo $ghrs2_rsmax_cap[$thehe_choise][1] + +floor($ghrs2_rsmax_cap[$thehe_choise][1] * $overrs_sun_extra[$thehe_choise]/100); ?> lần / ngày</th>
        </tr>
        </thead>
        <tbody>
        <?php for($ghrs_cap_i = 2; $ghrs_cap_i < $ghrs_cap_max; $ghrs_cap_i++) { ?>
        <tr>
            <td align="center">TOP <b><?php echo $ghrs2_top_cap[$ghrs_cap_i-1] + 1; ?></b> - <?php echo $ghrs2_top_cap[$ghrs_cap_i]; ?></td>
            <td align="center" colspan="3">Reset không giới hạn cho đến khi cách TOP 1 MAX ngày : <?php echo $ghrs2_rsmax_cap[$thehe_choise][$ghrs_cap_i]; ?> RS và tối đa Reset <?php echo $ghrs2_rsmax_daily[$thehe_choise][$ghrs_cap_i]; ?> lần / ngày</td>
        </tr>
        <?php } ?>
        <tr>
            <td align="center"><b>TOP > <?php echo $ghrs2_top_cap[$ghrs_cap_i-1]; ?></b></td>
            <td align="center" colspan="3">Reset không giới hạn cho đến khi cách TOP 1 MAX ngày : <?php echo $ghrs2_rsmax_cap[$thehe_choise][$ghrs_cap_i]; ?> RS và tối đa Reset <?php echo $ghrs2_rsmax_daily[$thehe_choise][$ghrs_cap_i]; ?> lần / ngày</td>
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
        <tr>
            <th colspan="2" align="center">
                <b>Tân Thủ Được giảm cấp độ khi Reset</b>
            </th>
        </tr>
        <tr>
            <th align="center"><b>Nhân vật thuộc TOP</b></th>
            <th align="center"><b>Cấp độ khi Reset được giảm</b></th>
        </tr>
        </thead>

        <tbody>
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
        </tbody>
    </table>
</div>
<?php
                }
        ?>
