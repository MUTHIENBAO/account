<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Reset OVER</h1>
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
            <li><strong>Lưu ý : <font color='red'>Reset OVER không tăng Reset thực của nhân vật</font></strong>.</li>
            <li>Reset OVER sẽ nhận được số điểm Ủy Thác ngẫu nhiên.</li>
            <li>Số điểm Ủy Thác nhận được tương đương với khi Ủy Thác Offline.</li>
            <li><font color='blue'><strong>Do vậy, Reset OVER không ảnh hưởng tới TOP <font color='red'>Reset/Relife</font></strong></font>.</li>
            <li><strong>Reset OVER </strong> chỉ thực hiện được khi đã <strong>MAX Reset ngày và Reset vượt mức</strong>.</li>
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
            <div class="line"></div>
            <p class="in-10">Điều kiện Reset OVER <i><font color='red'>(Màu đỏ là không đủ điều kiện)</font></i></p>
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
                    <?php echo $_SESSION['nv_level'] . " / {$level_show}"; ?>  <?php if($_SESSION['acc_vip'] > 0) { ?> (<i><s><?php echo $level_show+$extra_level_reset; ?></s></i>)<?php } ?>
                </div>
                <div class="form-col-3"><? echo $notice_level; ?></div>
            </div>
            <div class="form-row">
                <div class="form-col-1"><span class="bank-icon bank-zen"></span></div>
                <div class="form-col-2"><?php echo number_format($zen, 0, ',', '.'); ?> <?php if($_SESSION['acc_vip'] > 0) { ?> (<i><s><?php echo number_format($zen+$extra_zen_reset, 0, ',', '.'); ?></s></i>)<?php } ?></div>
                <div class="form-col-3"><? echo $notice_zen; ?></div>
            </div>
            <div class="form-row">
                <div class="form-col-1"><span class="bank-icon bank-chaos"></span></div>
                <div class="form-col-2"><?php echo $chao; ?></div>
                <div class="form-col-3"><? echo $notice_chao; ?></div>
            </div>
            <div class="form-row">
                <div class="form-col-1"><span class="bank-icon bank-creation"></span></div>
                <div class="form-col-2"><?php echo $cre; ?></div>
                <div class="form-col-3"><? echo $notice_cre; ?></div>
            </div>
            <div class="form-row">
                <div class="form-col-1"><span class="bank-icon bank-blue"></span></div>
                <div class="form-col-2"><?php echo $blue; ?></div>
                <div class="form-col-3"><? echo $notice_blue; ?></div>
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
            <div class="form-submit">
                <button class="btn btn-green btn-block btn-lg" type="button" name="Submit" id="btn_rs_over" <?php if($accept=='0') { echo 'disabled="disabled"'; } ?> >Thực hiện Reset OVER</button>
                <span id="rs_loading"></span></div>
                <div id="rs_err"></div>
            </div>
			<?php include('templates/box_facebook.tpl'); ?>
        </div>
    </div>
</div>

<div class="out-top-20">
<table class="table table-blue table-text-center table-border-2">
<thead>
<tr class="span">
    <th colspan="8" align="center">
        Jewel cần cho Reset phải được gửi trong <a href="#bank&act=jewel2bank" onclick="$('index2.php?mod=bank&act=jewel2bank','hienthi');">ngân hàng</a><br>
    </th>
</tr>
<tr>
    <td align="center" rowspan="2"><b>Reset</b></td>
    <td align="center" colspan="5"><b>Điều kiện Reset</b></td>
    <td align="center"><b>Phần thưởng</b></td>
</tr>
<tr>
    <td align="center"><b>Level</b></td>
    <td align="center"><b>Zen</b></td>
    <td align="center"><b>Chao</b></td>
    <td align="center"><b>Create</b></td>
    <td align="center"><b>Blue</b></td>
    <td align="center"><b>Điểm Ủy Thác</b></td>
</tr>
</thead>
<tbody>
<?php if ($cap_reset_max>0) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_0++; echo "$reset_cap_0 - $reset_cap_1"; ?></div></td>
    <td><div align="center"><?php echo $level_cap_1; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_1, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_1; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_1; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_1; ?></div></td>
    <td><div align="center"><?php echo $uythacpoint_cap1_min. " - ". $uythacpoint_cap1_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>1) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_1++; echo "$reset_cap_1 - $reset_cap_2"; ?></div></td>
    <td><div align="center"><?php echo $level_cap_2; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_2, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_2; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_2; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_2; ?></div></td>
    <td><div align="center"><?php echo $uythacpoint_cap2_min. " - ". $uythacpoint_cap2_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>2) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_2++; echo "$reset_cap_2 - $reset_cap_3"; ?></div></td>
    <td><div align="center"><?php echo $level_cap_3; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_3, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_3; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_3; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_3; ?></div></td>
    <td><div align="center"><?php echo $uythacpoint_cap3_min. " - ". $uythacpoint_cap3_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>3) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_3++; echo "$reset_cap_3 - $reset_cap_4"; ?></div></td>
    <td><div align="center"><?php echo $level_cap_4; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_4, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_4; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_4; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_4; ?></div></td>
    <td><div align="center"><?php echo $uythacpoint_cap4_min. " - ". $uythacpoint_cap4_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>4) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_4++; echo "$reset_cap_4 - $reset_cap_5"; ?></div></td>
    <td><div align="center"><?php echo $level_cap_5; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_5, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_5; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_5; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_5; ?></div></td>
    <td><div align="center"><?php echo $uythacpoint_cap5_min. " - ". $uythacpoint_cap5_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>5) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_5++; echo "$reset_cap_5 - $reset_cap_6"; ?></div></td>
    <td><div align="center"><?php echo $level_cap_6; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_6, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_6; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_6; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_6; ?></div></td>
    <td><div align="center"><?php echo $uythacpoint_cap6_min. " - ". $uythacpoint_cap6_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>6) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_6++; echo "$reset_cap_6 - $reset_cap_7"; ?></div></td>
    <td><div align="center"><?php echo $level_cap_7; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_7, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_7; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_7; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_7; ?></div></td>
    <td><div align="center"><?php echo $uythacpoint_cap7_min. " - ". $uythacpoint_cap7_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>7) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_7++; echo "$reset_cap_7 - $reset_cap_8"; ?></div></td>
    <td><div align="center"><?php echo $level_cap_8; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_8, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_8; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_8; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_8; ?></div></td>
    <td><div align="center"><?php echo $uythacpoint_cap8_min. " - ". $uythacpoint_cap8_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>8) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_8++; echo "$reset_cap_8 - $reset_cap_9"; ?></div></td>
    <td><div align="center"><?php echo $level_cap_9; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_9, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_9; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_9; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_9; ?></div></td>
    <td><div align="center"><?php echo $uythacpoint_cap9_min. " - ". $uythacpoint_cap9_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>9) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_9++; echo "$reset_cap_9 - $reset_cap_10"; ?></div></td>
    <td><div align="center"><?php echo $level_cap_10; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_10, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_10; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_10; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_10; ?></div></td>
    <td><div align="center"><?php echo $uythacpoint_cap10_min. " - ". $uythacpoint_cap10_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>10) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_10++; echo "$reset_cap_10 - $reset_cap_11"; ?></div></td>
    <td><div align="center"><?php echo $level_cap_11; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_11, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_11; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_11; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_11; ?></div></td>
    <td><div align="center"><?php echo $uythacpoint_cap11_min. " - ". $uythacpoint_cap11_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>11) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_11++; echo "$reset_cap_11 - $reset_cap_12"; ?></div></td>
    <td><div align="center"><?php echo $level_cap_12; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_12, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_12; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_12; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_12; ?></div></td>
    <td><div align="center"><?php echo $uythacpoint_cap12_min. " - ". $uythacpoint_cap12_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>12) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_12++; echo "$reset_cap_12 - $reset_cap_13"; ?></div></td>
    <td><div align="center"><?php echo $level_cap_13; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_13, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_13; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_13; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_13; ?></div></td>
    <td><div align="center"><?php echo $uythacpoint_cap13_min. " - ". $uythacpoint_cap13_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>13) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_13++; echo "$reset_cap_13 - $reset_cap_14"; ?></div></td>
    <td><div align="center"><?php echo $level_cap_14; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_14, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_14; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_14; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_14; ?></div></td>
    <td><div align="center"><?php echo $uythacpoint_cap14_min. " - ". $uythacpoint_cap14_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>14) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_14++; echo "$reset_cap_14 - $reset_cap_15"; ?></div></td>
    <td><div align="center"><?php echo $level_cap_15; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_15, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_15; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_15; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_15; ?></div></td>
    <td><div align="center"><?php echo $uythacpoint_cap15_min. " - ". $uythacpoint_cap15_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>15) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_15++; echo "$reset_cap_15 - $reset_cap_16"; ?></div></td>
    <td><div align="center"><?php echo $level_cap_16; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_16, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_16; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_16; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_16; ?></div></td>
    <td><div align="center"><?php echo $uythacpoint_cap16_min. " - ". $uythacpoint_cap16_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>16) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_16++; echo "$reset_cap_16 - $reset_cap_17"; ?></div></td>
    <td><div align="center"><?php echo $level_cap_17; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_17, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_17; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_17; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_17; ?></div></td>
    <td><div align="center"><?php echo $uythacpoint_cap17_min. " - ". $uythacpoint_cap17_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>17) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_17++; echo "$reset_cap_17 - $reset_cap_18"; ?></div></td>
    <td><div align="center"><?php echo $level_cap_18; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_18, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_18; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_18; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_18; ?></div></td>
    <td><div align="center"><?php echo $uythacpoint_cap18_min. " - ". $uythacpoint_cap18_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>18) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_18++; echo "$reset_cap_18 - $reset_cap_19"; ?></div></td>
    <td><div align="center"><?php echo $level_cap_19; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_19, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_19; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_19; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_19; ?></div></td>
    <td><div align="center"><?php echo $uythacpoint_cap19_min. " - ". $uythacpoint_cap19_max; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>19) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_19++; echo "$reset_cap_19 - $reset_cap_20"; ?></div></td>
    <td><div align="center"><?php echo $level_cap_20; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_20, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_20; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_20; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_20; ?></div></td>
    <td><div align="center"><?php echo $uythacpoint_cap20_min. " - ". $uythacpoint_cap20_max; ?></div></td>
</tr>
<?php } ?>
</tbody>
</table>

</div>
<?php } ?>
