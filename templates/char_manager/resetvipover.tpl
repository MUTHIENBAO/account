<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Reset OVER VIP</h1>
        <?php include('templates/char_manager/reset_head.tpl'); ?>
    </div>
</div>

<?php
    if($use_gioihanrs[$thehe_choise] == 0) {
        echo "<div class='primary-block out-top-20 in-20'><font color='red'>Chức năng không được sử dụng do chưa bật Giới Hạn Reset</font></div>";
} else {
?>
<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li><strong><font color='red'>Reset OVER VIP không tăng Reset thực của nhân vật</font></strong>.</li>
            <li>Reset OVER VIP sẽ nhận được số điểm Ủy Thác ngẫu nhiên.</li>
            <li>Số điểm Ủy Thác nhận được tương ứng với mỗi mốc Reset.</li>
            <li><strong>Reset OVER VIP không được tính vào BXH TOP.</li>
            <li><strong>Reset OVER VIP </strong> chỉ thực hiện được khi đã <strong>MAX Reset ngày và Reset vượt mức</strong>.</li>
            <li>Reset không cần cởi đồ.</li>
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
            </div>
            <div class="form-row">
                <div class="form-col-1"><span>Reset lần thứ</span></div>
                <div class="form-col-2"><?php echo $_SESSION['nv_reset']+1; ?></div>
            </div>
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
                <div class="form-col-2">
                    <?php echo $_SESSION['nv_level'] . " / {$level_show}"; ?>
                </div>
                <div class="form-col-3"><? echo $notice_level; ?></div>
            </div>
            <div class="form-row">
                <div class="form-col-1"><span class="bank-icon bank-zen"></span></div>
                <div class="form-col-2"><?php echo number_format($zen, 0, ',', '.'); ?> <?php if($_SESSION['acc_vip'] > 0) { ?> (<i><s><?php echo number_format($zen+$extra_zen_reset, 0, ',', '.'); ?></s></i>)<?php } ?></div>
                <div class="form-col-3"><? echo $notice_zen; ?></div>
            </div>
            <div class="form-row" id="use_gcoin" style="display: none;">
                <div class="form-col-1"><span class="bank-icon bank-g"></span> <span class="bank-icon bank-g2"></span></div>
                <div class="form-col-2"><?php echo $gcoin_reset_vip; ?></div>
                <div class="form-col-3"><? echo $notice_gcoin; ?></div>
            </div>
            <div class="form-row" id="use_vpoint">
                <div class="form-col-1"><span class="bank-icon bank-v"></span> <span class="bank-icon bank-v2"></span></div>
                <div class="form-col-2"><?php echo $vpoint_reset_vip; ?></div>
                <div class="form-col-3"><? echo $notice_vpoint; ?></div>
            </div>
            <div class="form-row">
                <div class="form-col-1"><span>Reset/ngày</span></div>
                <div class="form-col-2"><?php echo "$notice_resetday"; ?></div>
                <div class="form-col-3">&nbsp;</div>
            </div>
            <div class="form-row">
                <div class="form-col-1"><span>Đổi nhân vật</span></div>
                <div class="form-col-2"><?php echo $doinv; ?></div>
            </div>
            <div class="form-row">
                <div class="form-col-1"><span>Thoát Game</span></div>
                <div class="form-col-2"><?php echo $online; ?></div>
            </div>
            <div class="form-row">
                <div class="form-col-1"><span>Thời gian chờ Reset</span></div>
                <div class="form-col-2"><?php echo $timers; ?> phút</div>
            </div>
            <div class="form-row">
                <div class="form-col-1"><span>Chọn loại đơn vị Tiền Tệ</span></div>
                <div class="form-col-2">
                    <input type="radio" name="tiente" value="gcoin" id="use_gcent" /> <label for="use_gcent">Gcent</label><br />
                    <input type="radio" name="tiente" value="vpoint" id="use_vcent" checked="checked" /> <label for="use_vcent">Vcent</label>
                </div>
            </div>
            <div class="form-submit">

                    <button class="btn btn-green btn-block btn-lg" type="button" name="Submit" id="btn_rs_over_vip" <?php if($accept=='0') { echo 'disabled="disabled" class="NotAccept"'; } else { echo 'class="Accept"'; } ?> >Thực hiện Reset VIP OVER</button>
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
    <th align="center"><b>Phần thưởng</b></th>
</tr>
<tr>
    <th align="center"><b>Level</b></th>
    <th align="center"><b>Zen</b></th>
    <th align="center"><b>Gcent</b></th>
    <th align="center"><b>Vcent</b></th>
    <th align="center"><b>Điểm Ủy Thác</b></th>
</tr>
</thead>
<tbody>
<?php if ($cap_reset_max>0) { ?>
<tr>
    <td align="center"><?php $reset_cap_0++; echo "$reset_cap_0 - $reset_cap_1"; ?></td>
    <td align="center"><?php echo $level_cap_1_vip; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_1*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_1_vip; ?></td>
    <td align="center"><?php $vpoint_cap_1_vip = floor($gcoin_cap_1_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_1_vip; ?></td>
    <td><div align="center"><?php echo $uythacpoint_cap1_min. " - ". $uythacpoint_cap1_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>1) { ?>
<tr>
    <td align="center"><?php $reset_cap_1++; echo "$reset_cap_1 - $reset_cap_2"; ?></td>
    <td align="center"><?php echo $level_cap_2_vip; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_2*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_2_vip; ?></td>
    <td align="center"><?php $vpoint_cap_2_vip = floor($gcoin_cap_2_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_2_vip; ?></td>
    <td><div align="center"><?php echo $uythacpoint_cap2_min. " - ". $uythacpoint_cap2_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>2) { ?>
<tr>
    <td align="center"><?php $reset_cap_2++; echo "$reset_cap_2 - $reset_cap_3"; ?></td>
    <td align="center"><?php echo $level_cap_3_vip; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_3*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_3_vip; ?></td>
    <td align="center"><?php $vpoint_cap_3_vip = floor($gcoin_cap_3_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_3_vip; ?></td>
    <td><div align="center"><?php echo $uythacpoint_cap3_min. " - ". $uythacpoint_cap3_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>3) { ?>
<tr>
    <td align="center"><?php $reset_cap_3++; echo "$reset_cap_3 - $reset_cap_4"; ?></td>
    <td align="center"><?php echo $level_cap_4_vip; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_4*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_4_vip; ?></td>
    <td align="center"><?php $vpoint_cap_4_vip = floor($gcoin_cap_4_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_4_vip; ?></td>
    <td><div align="center"><?php echo $uythacpoint_cap4_min. " - ". $uythacpoint_cap4_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>4) { ?>
<tr>
    <td align="center"><?php $reset_cap_4++; echo "$reset_cap_4 - $reset_cap_5"; ?></td>
    <td align="center"><?php echo $level_cap_5_vip; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_5*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_5_vip; ?></td>
    <td align="center"><?php $vpoint_cap_5_vip = floor($gcoin_cap_5_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_5_vip; ?></td>
    <td><div align="center"><?php echo $uythacpoint_cap5_min. " - ". $uythacpoint_cap5_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>5) { ?>
<tr>
    <td align="center"><?php $reset_cap_5++; echo "$reset_cap_5 - $reset_cap_6"; ?></td>
    <td align="center"><?php echo $level_cap_6_vip; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_6*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_6_vip; ?></td>
    <td align="center"><?php $vpoint_cap_6_vip = floor($gcoin_cap_6_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_6_vip; ?></td>
    <td><div align="center"><?php echo $uythacpoint_cap6_min. " - ". $uythacpoint_cap6_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>6) { ?>
<tr>
    <td align="center"><?php $reset_cap_6++; echo "$reset_cap_6 - $reset_cap_7"; ?></td>
    <td align="center"><?php echo $level_cap_7_vip; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_7*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_7_vip; ?></td>
    <td align="center"><?php $vpoint_cap_7_vip = floor($gcoin_cap_7_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_7_vip; ?></td>
    <td><div align="center"><?php echo $uythacpoint_cap7_min. " - ". $uythacpoint_cap7_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>7) { ?>
<tr>
    <td align="center"><?php $reset_cap_7++; echo "$reset_cap_7 - $reset_cap_8"; ?></td>
    <td align="center"><?php echo $level_cap_8_vip; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_8*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_8_vip; ?></td>
    <td align="center"><?php $vpoint_cap_8_vip = floor($gcoin_cap_8_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_8_vip; ?></td>
    <td><div align="center"><?php echo $uythacpoint_cap8_min. " - ". $uythacpoint_cap8_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>8) { ?>
<tr>
    <td align="center"><?php $reset_cap_8++; echo "$reset_cap_8 - $reset_cap_9"; ?></td>
    <td align="center"><?php echo $level_cap_9_vip; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_9*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_9_vip; ?></td>
    <td align="center"><?php $vpoint_cap_9_vip = floor($gcoin_cap_9_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_9_vip; ?></td>
    <td><div align="center"><?php echo $uythacpoint_cap9_min. " - ". $uythacpoint_cap9_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>9) { ?>
<tr>
    <td align="center"><?php $reset_cap_9++; echo "$reset_cap_9 - $reset_cap_10"; ?></td>
    <td align="center"><?php echo $level_cap_10_vip; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_10*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_10_vip; ?></td>
    <td align="center"><?php $vpoint_cap_10_vip = floor($gcoin_cap_10_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_10_vip; ?></td>
    <td><div align="center"><?php echo $uythacpoint_cap10_min. " - ". $uythacpoint_cap10_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>10) { ?>
<tr>
    <td align="center"><?php $reset_cap_10++; echo "$reset_cap_10 - $reset_cap_11"; ?></td>
    <td align="center"><?php echo $level_cap_11_vip; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_11*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_11_vip; ?></td>
    <td align="center"><?php $vpoint_cap_11_vip = floor($gcoin_cap_11_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_11_vip; ?></td>
    <td><div align="center"><?php echo $uythacpoint_cap11_min. " - ". $uythacpoint_cap11_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>11) { ?>
<tr>
    <td align="center"><?php $reset_cap_11++; echo "$reset_cap_11 - $reset_cap_12"; ?></td>
    <td align="center"><?php echo $level_cap_12_vip; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_12*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_12_vip; ?></td>
    <td align="center"><?php $vpoint_cap_12_vip = floor($gcoin_cap_12_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_12_vip; ?></td>
    <td><div align="center"><?php echo $uythacpoint_cap12_min. " - ". $uythacpoint_cap12_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>12) { ?>
<tr>
    <td align="center"><?php $reset_cap_12++; echo "$reset_cap_12 - $reset_cap_13"; ?></td>
    <td align="center"><?php echo $level_cap_13_vip; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_13*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_13_vip; ?></td>
    <td align="center"><?php $vpoint_cap_13_vip = floor($gcoin_cap_13_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_13_vip; ?></td>
    <td><div align="center"><?php echo $uythacpoint_cap13_min. " - ". $uythacpoint_cap13_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>13) { ?>
<tr>
    <td align="center"><?php $reset_cap_13++; echo "$reset_cap_13 - $reset_cap_14"; ?></td>
    <td align="center"><?php echo $level_cap_14_vip; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_14*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_14_vip; ?></td>
    <td align="center"><?php $vpoint_cap_14_vip = floor($gcoin_cap_14_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_14_vip; ?></td>
    <td><div align="center"><?php echo $uythacpoint_cap14_min. " - ". $uythacpoint_cap14_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>14) { ?>
<tr>
    <td align="center"><?php $reset_cap_14++; echo "$reset_cap_14 - $reset_cap_15"; ?></td>
    <td align="center"><?php echo $level_cap_15_vip; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_15*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_15_vip; ?></td>
    <td align="center"><?php $vpoint_cap_15_vip = floor($gcoin_cap_15_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_15_vip; ?></td>
    <td><div align="center"><?php echo $uythacpoint_cap15_min. " - ". $uythacpoint_cap15_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>15) { ?>
<tr>
    <td align="center"><?php $reset_cap_15++; echo "$reset_cap_15 - $reset_cap_16"; ?></td>
    <td align="center"><?php echo $level_cap_16_vip; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_16*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_16_vip; ?></td>
    <td align="center"><?php $vpoint_cap_16_vip = floor($gcoin_cap_16_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_16_vip; ?></td>
    <td><div align="center"><?php echo $uythacpoint_cap16_min. " - ". $uythacpoint_cap16_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>16) { ?>
<tr>
    <td align="center"><?php $reset_cap_16++; echo "$reset_cap_16 - $reset_cap_17"; ?></td>
    <td align="center"><?php echo $level_cap_17_vip; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_17*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_17_vip; ?></td>
    <td align="center"><?php $vpoint_cap_17_vip = floor($gcoin_cap_17_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_17_vip; ?></td>
    <td><div align="center"><?php echo $uythacpoint_cap17_min. " - ". $uythacpoint_cap17_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>17) { ?>
<tr>
    <td align="center"><?php $reset_cap_17++; echo "$reset_cap_17 - $reset_cap_18"; ?></td>
    <td align="center"><?php echo $level_cap_18_vip; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_18*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_18_vip; ?></td>
    <td align="center"><?php $vpoint_cap_18_vip = floor($gcoin_cap_18_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_18_vip; ?></td>
    <td><div align="center"><?php echo $uythacpoint_cap18_min. " - ". $uythacpoint_cap18_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>18) { ?>
<tr>
    <td align="center"><?php $reset_cap_18++; echo "$reset_cap_18 - $reset_cap_19"; ?></td>
    <td align="center"><?php echo $level_cap_19_vip; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_19*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_19_vip; ?></td>
    <td align="center"><?php $vpoint_cap_19_vip = floor($gcoin_cap_19_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_19_vip; ?></td>
    <td><div align="center"><?php echo $uythacpoint_cap19_min. " - ". $uythacpoint_cap19_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>19) { ?>
<tr>
    <td align="center"><?php $reset_cap_19++; echo "$reset_cap_19 - $reset_cap_20"; ?></td>
    <td align="center"><?php echo $level_cap_20_vip; ?></td>
    <td align="right"><?php echo number_format(floor($zen_cap_20*$zen_rsvip_percent/100), 0, ',', '.'); ?></td>
    <td align="center"><?php echo $gcoin_cap_20_vip; ?></td>
    <td align="center"><?php $vpoint_cap_20_vip = floor($gcoin_cap_20_vip*(1+$vpoint_extra/100)); echo $vpoint_cap_20_vip; ?></td>
    <td><div align="center"><?php echo $uythacpoint_cap20_min. " - ". $uythacpoint_cap20_max; ?></div></td>
</tr>
<?php } ?>
</tbody>
</table>
</div>
<?php } ?>
