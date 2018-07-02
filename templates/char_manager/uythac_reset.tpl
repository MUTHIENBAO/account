<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Reset Ủy Thác</h1>
        <?php include('templates/char_manager/reset_head.tpl'); ?>
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Sử dụng điểm Ủy Thác để Reset</li>
            <li>Reset không cần cởi đồ</li>
            <li>Zen để trên người nhân vật</li>
            <li>Nguyên Liệu gửi vào Ngân Hàng</li>
            <li>Reset Ủy Thác chỉ tăng số lần Reset</li>
            <li>Khi thực hiện Reset Thường hoặc Reset Vip sẽ nhận được Point tương ứng</li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">

        <form id="uythac_reset" name="uythac_reset" method="post" action="index.php?mod=char_manager&act=uythac_reset">
            <input type="hidden" name="action" value="uythac_reset" />
            <input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />

            <div class="form-2">
                <div class="form-row">
                    <div class="form-col-1"><span>Nhân vật Reset</span></div>
                    <div class="form-col-2">
                        <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
                    </div>
                </div>
                <div class="line"></div>
                <div class="form-row">
                    <div class="form-col-1"><span>Reset lần thứ</span></div>
                    <div class="form-col-2">
                        <?php echo $_SESSION['nv_reset']+1; ?>
                    </div>
                    <div class="form-col-3">&nbsp;</div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Điểm Ủy Thác</span></div>
                    <div class="form-col-2">
                        <?php echo number_format($_SESSION['nv_point_uythac'], 0, ',', '.') . " / " . number_format($point_uythac, 0, ',', '.'); ?>
                    </div>
                    <div class="form-col-3"><? echo $notice_point_uythac; ?></div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span class="bank-icon bank-zen"></span></div>
                    <div class="form-col-2"><?php echo number_format($zen, 0, ',', '.'); ?></div>
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
                    <div class="form-col-1"><span>Đổi nhân vật</span></div>
                    <div class="form-col-2"><?php echo $doinv; ?></div>
                    <div class="form-col-3">&nbsp;</div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Chọn cách Reset</span></div>
                    <div class="form-col-2">
                        <input type="radio" name="rsut_all" value="0" id="up_one" checked="checked" /> <label for="up_one">Chỉ tăng 1 lần Reset</label><br />
                        <input type="radio" name="rsut_all" value="1" id="up_more" /> <label for="up_more">Reset hết điểm UT</label>
                    </div>
                </div>
                <div class="form-submit">

                        <button class="btn btn-green btn-block btn-lg" type="submit" name="Submit" <?php if($accept=='0') { echo 'disabled="disabled"'; } ?> >Thực hiện Reset UT</button>

                </div>
				<?php include('templates/box_facebook.tpl'); ?>
            </div>
        </form>
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
    <th align="center"><b>Reset</b></th>
    <th align="center"><b>Điểm Ủy Thác</b></th>
    <th align="center"><b>Zen</b></th>
    <th align="center"><b>Chao</b></th>
    <th align="center"><b>Create</b></th>
    <th align="center"><b>Blue</b></th>
</tr>
</thead>
<tbody>
<?php if ($cap_reset_max>0) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_0++; echo "$reset_cap_0 - $reset_cap_1"; ?></div></td>
    <td><div align="center"><?php echo $point_uythac_rs_cap_1; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_1, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_1; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_1; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_1; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>1) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_1++; echo "$reset_cap_1 - $reset_cap_2"; ?></div></td>
    <td><div align="center"><?php echo $point_uythac_rs_cap_2; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_2, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_2; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_2; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_2; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>2) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_2++; echo "$reset_cap_2 - $reset_cap_3"; ?></div></td>
    <td><div align="center"><?php echo $point_uythac_rs_cap_3; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_3, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_3; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_3; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_3; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>3) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_3++; echo "$reset_cap_3 - $reset_cap_4"; ?></div></td>
    <td><div align="center"><?php echo $point_uythac_rs_cap_4; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_4, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_4; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_4; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_4; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>4) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_4++; echo "$reset_cap_4 - $reset_cap_5"; ?></div></td>
    <td><div align="center"><?php echo $point_uythac_rs_cap_5; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_5, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_5; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_5; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_5; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>5) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_5++; echo "$reset_cap_5 - $reset_cap_6"; ?></div></td>
    <td><div align="center"><?php echo $point_uythac_rs_cap_6; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_6, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_6; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_6; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_6; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>6) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_6++; echo "$reset_cap_6 - $reset_cap_7"; ?></div></td>
    <td><div align="center"><?php echo $point_uythac_rs_cap_7; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_7, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_7; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_7; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_7; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>7) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_7++; echo "$reset_cap_7 - $reset_cap_8"; ?></div></td>
    <td><div align="center"><?php echo $point_uythac_rs_cap_8; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_8, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_8; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_8; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_8; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>8) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_8++; echo "$reset_cap_8 - $reset_cap_9"; ?></div></td>
    <td><div align="center"><?php echo $point_uythac_rs_cap_9; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_9, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_9; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_9; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_9; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>9) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_9++; echo "$reset_cap_9 - $reset_cap_10"; ?></div></td>
    <td><div align="center"><?php echo $point_uythac_rs_cap_10; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_10, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_10; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_10; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_10; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>10) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_10++; echo "$reset_cap_10 - $reset_cap_11"; ?></div></td>
    <td><div align="center"><?php echo $point_uythac_rs_cap_11; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_11, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_11; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_11; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_11; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>11) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_11++; echo "$reset_cap_11 - $reset_cap_12"; ?></div></td>
    <td><div align="center"><?php echo $point_uythac_rs_cap_12; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_12, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_12; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_12; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_12; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>12) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_12++; echo "$reset_cap_12 - $reset_cap_13"; ?></div></td>
    <td><div align="center"><?php echo $point_uythac_rs_cap_13; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_13, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_13; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_13; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_13; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>13) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_13++; echo "$reset_cap_13 - $reset_cap_14"; ?></div></td>
    <td><div align="center"><?php echo $point_uythac_rs_cap_14; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_14, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_14; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_14; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_14; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>14) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_14++; echo "$reset_cap_14 - $reset_cap_15"; ?></div></td>
    <td><div align="center"><?php echo $point_uythac_rs_cap_15; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_15, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_15; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_15; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_15; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>15) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_15++; echo "$reset_cap_15 - $reset_cap_16"; ?></div></td>
    <td><div align="center"><?php echo $point_uythac_rs_cap_16; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_16, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_16; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_16; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_16; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>16) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_16++; echo "$reset_cap_16 - $reset_cap_17"; ?></div></td>
    <td><div align="center"><?php echo $point_uythac_rs_cap_17; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_17, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_17; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_17; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_17; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>17) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_17++; echo "$reset_cap_17 - $reset_cap_18"; ?></div></td>
    <td><div align="center"><?php echo $point_uythac_rs_cap_18; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_18, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_18; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_18; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_18; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>18) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_18++; echo "$reset_cap_18 - $reset_cap_19"; ?></div></td>
    <td><div align="center"><?php echo $point_uythac_rs_cap_19; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_19, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_19; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_19; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_19; ?></div></td>
</tr>
<?php } ?>
<?php if ($cap_reset_max>19) { ?>
<tr>
    <td><div align="center"><?php $reset_cap_19++; echo "$reset_cap_19 - $reset_cap_20"; ?></div></td>
    <td><div align="center"><?php echo $point_uythac_rs_cap_20; ?></div></td>
    <td><div align="center"><?php echo number_format($zen_cap_20, 0, ',', '.'); ?></div></td>
    <td><div align="center"><?php echo $chao_cap_20; ?></div></td>
    <td><div align="center"><?php echo $cre_cap_20; ?></div></td>
    <td><div align="center"><?php echo $blue_cap_20; ?></div></td>
</tr>
<?php } ?>
</tbody>
</table>

</div>