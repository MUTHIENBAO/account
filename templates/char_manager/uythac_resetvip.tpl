<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Reset Ủy Thác VIP</h1>
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
            <li class="tik">Được sử dụng Gcent Khuyến Mại</li>
            <li>Reset không cần cởi đồ</li>
            <li>Không tốn Nguyên Liệu</li>
            <li>Không tốn Zen</li>
            <li>Reset Ủy Thác VIP chỉ tăng số lần Reset</li>
            <li>Khi thực hiện Reset Thường hoặc Reset Vip sẽ nhận được Point tương ứng</li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">
        <form id="reset" name="reset" method="post" action="index.php?mod=char_manager&act=uythac_resetvip">
            <input type="hidden" name="action" value="uythac_resetvip" />
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
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Điểm Ủy Thác</span></div>
                    <div class="form-col-2">
                        <?php echo number_format($_SESSION['nv_point_uythac'], 0, ',', '.') . " / " . number_format($point_uythac, 0, ',', '.'); ?>

                    </div>
                    <div class="form-col-3"><? echo $notice_point_uythac; ?></div>
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
                    <div class="form-col-1"><span>Đổi nhân vật</span></div>
                    <div class="form-col-2"><?php echo $doinv; ?></div>
                    <div class="form-col-3">&nbsp;</div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Chọn loại đơn vị Tiền Tệ</span></div>
                    <div class="form-col-2">
                        <input name="tiente" type="radio" value="gcoin" id="use_gcent" /> <label for="use_gcent">Gcent</label><br />
                        <input type="radio" name="tiente" value="vpoint" id="use_vcent" checked="checked" /> <label for="use_vcent">Vcent</label>
                    </div>
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

                        <button class="btn btn-green btn-block btn-lg" type="submit" name="Submit" <?php if($accept=='0') { echo 'disabled="disabled"'; } ?> >Thực hiện Reset UT VIP</button>

                </div>
				<?php include('templates/box_facebook.tpl'); ?>
            </div>
        </form>
    </div>
</div>

<div class="out-top-20">
    <table class="table table-blue table-text-center table-border-2">
        <thead>
        <tr bgcolor="#FFFFFF">
            <th align="center"><b>Reset</b></th>
            <th align="center"><b>Điểm Ủy Thác</b></th>
            <th align="center"><b>Gcent</b></th>
            <th align="center"><b>Vcent</b></th>
        </tr>
        </thead>
        <tbody>

        <?php if ($cap_reset_max>0) { ?>
        <tr bgcolor="#FFFFFF">
            <td align="center"><?php $reset_cap_0++; echo "$reset_cap_0 - $reset_cap_1"; ?></td>
            <td align="center"><?php echo $point_uythac_rsvip_cap_1; ?></td>
            <td align="center"><?php echo $gcoin_cap_1_vip; ?></td>
            <td align="center"><?php $vpoint_cap_1_vip = $gcoin_cap_1_vip*(1+$vpoint_extra/100); echo $vpoint_cap_1_vip; ?></td>
        </tr>
        <?php } ?>
        <?php if ($cap_reset_max>1) { ?>
        <tr bgcolor="#FFFFFF">
            <td align="center"><?php $reset_cap_1++; echo "$reset_cap_1 - $reset_cap_2"; ?></td>
            <td align="center"><?php echo $point_uythac_rsvip_cap_2; ?></td>
            <td align="center"><?php echo $gcoin_cap_2_vip; ?></td>
            <td align="center"><?php $vpoint_cap_2_vip = $gcoin_cap_2_vip*(1+$vpoint_extra/100); echo $vpoint_cap_2_vip; ?></td>
        </tr>
        <?php } ?>
        <?php if ($cap_reset_max>2) { ?>
        <tr bgcolor="#FFFFFF">
            <td align="center"><?php $reset_cap_2++; echo "$reset_cap_2 - $reset_cap_3"; ?></td>
            <td align="center"><?php echo $point_uythac_rsvip_cap_3; ?></td>
            <td align="center"><?php echo $gcoin_cap_3_vip; ?></td>
            <td align="center"><?php $vpoint_cap_3_vip = $gcoin_cap_3_vip*(1+$vpoint_extra/100); echo $vpoint_cap_3_vip; ?></td>
        </tr>
        <?php } ?>
        <?php if ($cap_reset_max>3) { ?>
        <tr bgcolor="#FFFFFF">
            <td align="center"><?php $reset_cap_3++; echo "$reset_cap_3 - $reset_cap_4"; ?></td>
            <td align="center"><?php echo $point_uythac_rsvip_cap_4; ?></td>
            <td align="center"><?php echo $gcoin_cap_4_vip; ?></td>
            <td align="center"><?php $vpoint_cap_4_vip = $gcoin_cap_4_vip*(1+$vpoint_extra/100); echo $vpoint_cap_4_vip; ?></td>
        </tr>
        <?php } ?>
        <?php if ($cap_reset_max>4) { ?>
        <tr bgcolor="#FFFFFF">
            <td align="center"><?php $reset_cap_4++; echo "$reset_cap_4 - $reset_cap_5"; ?></td>
            <td align="center"><?php echo $point_uythac_rsvip_cap_5; ?></td>
            <td align="center"><?php echo $gcoin_cap_5_vip; ?></td>
            <td align="center"><?php $vpoint_cap_5_vip = $gcoin_cap_5_vip*(1+$vpoint_extra/100); echo $vpoint_cap_5_vip; ?></td>
        </tr>
        <?php } ?>
        <?php if ($cap_reset_max>5) { ?>
        <tr bgcolor="#FFFFFF">
            <td align="center"><?php $reset_cap_5++; echo "$reset_cap_5 - $reset_cap_6"; ?></td>
            <td align="center"><?php echo $point_uythac_rsvip_cap_6; ?></td>
            <td align="center"><?php echo $gcoin_cap_6_vip; ?></td>
            <td align="center"><?php $vpoint_cap_6_vip = $gcoin_cap_6_vip*(1+$vpoint_extra/100); echo $vpoint_cap_6_vip; ?></td>
        </tr>
        <?php } ?>
        <?php if ($cap_reset_max>6) { ?>
        <tr bgcolor="#FFFFFF">
            <td align="center"><?php $reset_cap_6++; echo "$reset_cap_6 - $reset_cap_7"; ?></td>
            <td align="center"><?php echo $point_uythac_rsvip_cap_7; ?></td>
            <td align="center"><?php echo $gcoin_cap_7_vip; ?></td>
            <td align="center"><?php $vpoint_cap_7_vip = $gcoin_cap_7_vip*(1+$vpoint_extra/100); echo $vpoint_cap_7_vip; ?></td>
        </tr>
        <?php } ?>
        <?php if ($cap_reset_max>7) { ?>
        <tr bgcolor="#FFFFFF">
            <td align="center"><?php $reset_cap_7++; echo "$reset_cap_7 - $reset_cap_8"; ?></td>
            <td align="center"><?php echo $point_uythac_rsvip_cap_8; ?></td>
            <td align="center"><?php echo $gcoin_cap_8_vip; ?></td>
            <td align="center"><?php $vpoint_cap_8_vip = $gcoin_cap_8_vip*(1+$vpoint_extra/100); echo $vpoint_cap_8_vip; ?></td>
        </tr>
        <?php } ?>
        <?php if ($cap_reset_max>8) { ?>
        <tr bgcolor="#FFFFFF">
            <td align="center"><?php $reset_cap_8++; echo "$reset_cap_8 - $reset_cap_9"; ?></td>
            <td align="center"><?php echo $point_uythac_rsvip_cap_9; ?></td>
            <td align="center"><?php echo $gcoin_cap_9_vip; ?></td>
            <td align="center"><?php $vpoint_cap_9_vip = $gcoin_cap_9_vip*(1+$vpoint_extra/100); echo $vpoint_cap_9_vip; ?></td>
        </tr>
        <?php } ?>
        <?php if ($cap_reset_max>9) { ?>
        <tr bgcolor="#FFFFFF">
            <td align="center"><?php $reset_cap_9++; echo "$reset_cap_9 - $reset_cap_10"; ?></td>
            <td align="center"><?php echo $point_uythac_rsvip_cap_10; ?></td>
            <td align="center"><?php echo $gcoin_cap_10_vip; ?></td>
            <td align="center"><?php $vpoint_cap_10_vip = $gcoin_cap_10_vip*(1+$vpoint_extra/100); echo $vpoint_cap_10_vip; ?></td>
        </tr>
        <?php } ?>
        <?php if ($cap_reset_max>10) { ?>
        <tr bgcolor="#FFFFFF">
            <td align="center"><?php $reset_cap_10++; echo "$reset_cap_10 - $reset_cap_11"; ?></td>
            <td align="center"><?php echo $point_uythac_rsvip_cap_11; ?></td>
            <td align="center"><?php echo $gcoin_cap_11_vip; ?></td>
            <td align="center"><?php $vpoint_cap_11_vip = $gcoin_cap_11_vip*(1+$vpoint_extra/100); echo $vpoint_cap_11_vip; ?></td>
        </tr>
        <?php } ?>
        <?php if ($cap_reset_max>11) { ?>
        <tr bgcolor="#FFFFFF">
            <td align="center"><?php $reset_cap_11++; echo "$reset_cap_11 - $reset_cap_12"; ?></td>
            <td align="center"><?php echo $point_uythac_rsvip_cap_12; ?></td>
            <td align="center"><?php echo $gcoin_cap_12_vip; ?></td>
            <td align="center"><?php $vpoint_cap_12_vip = $gcoin_cap_12_vip*(1+$vpoint_extra/100); echo $vpoint_cap_12_vip; ?></td>
        </tr>
        <?php } ?>
        <?php if ($cap_reset_max>12) { ?>
        <tr bgcolor="#FFFFFF">
            <td align="center"><?php $reset_cap_12++; echo "$reset_cap_12 - $reset_cap_13"; ?></td>
            <td align="center"><?php echo $point_uythac_rsvip_cap_13; ?></td>
            <td align="center"><?php echo $gcoin_cap_13_vip; ?></td>
            <td align="center"><?php $vpoint_cap_13_vip = $gcoin_cap_13_vip*(1+$vpoint_extra/100); echo $vpoint_cap_13_vip; ?></td>
        </tr>
        <?php } ?>
        <?php if ($cap_reset_max>13) { ?>
        <tr bgcolor="#FFFFFF">
            <td align="center"><?php $reset_cap_13++; echo "$reset_cap_13 - $reset_cap_14"; ?></td>
            <td align="center"><?php echo $point_uythac_rsvip_cap_14; ?></td>
            <td align="center"><?php echo $gcoin_cap_14_vip; ?></td>
            <td align="center"><?php $vpoint_cap_14_vip = $gcoin_cap_14_vip*(1+$vpoint_extra/100); echo $vpoint_cap_14_vip; ?></td>
        </tr>
        <?php } ?>
        <?php if ($cap_reset_max>14) { ?>
        <tr bgcolor="#FFFFFF">
            <td align="center"><?php $reset_cap_14++; echo "$reset_cap_14 - $reset_cap_15"; ?></td>
            <td align="center"><?php echo $point_uythac_rsvip_cap_15; ?></td>
            <td align="center"><?php echo $gcoin_cap_15_vip; ?></td>
            <td align="center"><?php $vpoint_cap_15_vip = $gcoin_cap_15_vip*(1+$vpoint_extra/100); echo $vpoint_cap_15_vip; ?></td>
        </tr>
        <?php } ?>
        <?php if ($cap_reset_max>15) { ?>
        <tr bgcolor="#FFFFFF">
            <td align="center"><?php $reset_cap_15++; echo "$reset_cap_15 - $reset_cap_16"; ?></td>
            <td align="center"><?php echo $point_uythac_rsvip_cap_16; ?></td>
            <td align="center"><?php echo $gcoin_cap_16_vip; ?></td>
            <td align="center"><?php $vpoint_cap_16_vip = $gcoin_cap_16_vip*(1+$vpoint_extra/100); echo $vpoint_cap_16_vip; ?></td>
        </tr>
        <?php } ?>
        <?php if ($cap_reset_max>16) { ?>
        <tr bgcolor="#FFFFFF">
            <td align="center"><?php $reset_cap_16++; echo "$reset_cap_16 - $reset_cap_17"; ?></td>
            <td align="center"><?php echo $point_uythac_rsvip_cap_17; ?></td>
            <td align="center"><?php echo $gcoin_cap_17_vip; ?></td>
            <td align="center"><?php $vpoint_cap_17_vip = $gcoin_cap_17_vip*(1+$vpoint_extra/100); echo $vpoint_cap_17_vip; ?></td>
        </tr>
        <?php } ?>
        <?php if ($cap_reset_max>17) { ?>
        <tr bgcolor="#FFFFFF">
            <td align="center"><?php $reset_cap_17++; echo "$reset_cap_17 - $reset_cap_18"; ?></td>
            <td align="center"><?php echo $point_uythac_rsvip_cap_18; ?></td>
            <td align="center"><?php echo $gcoin_cap_18_vip; ?></td>
            <td align="center"><?php $vpoint_cap_18_vip = $gcoin_cap_18_vip*(1+$vpoint_extra/100); echo $vpoint_cap_18_vip; ?></td>
        </tr>
        <?php } ?>
        <?php if ($cap_reset_max>18) { ?>
        <tr bgcolor="#FFFFFF">
            <td align="center"><?php $reset_cap_18++; echo "$reset_cap_18 - $reset_cap_19"; ?></td>
            <td align="center"><?php echo $point_uythac_rsvip_cap_19; ?></td>
            <td align="center"><?php echo $gcoin_cap_19_vip; ?></td>
            <td align="center"><?php $vpoint_cap_19_vip = $gcoin_cap_19_vip*(1+$vpoint_extra/100); echo $vpoint_cap_19_vip; ?></td>
        </tr>
        <?php } ?>
        <?php if ($cap_reset_max>19) { ?>
        <tr bgcolor="#FFFFFF">
            <td align="center"><?php $reset_cap_19++; echo "$reset_cap_19 - $reset_cap_20"; ?></td>
            <td align="center"><?php echo $point_uythac_rsvip_cap_20; ?></td>
            <td align="center"><?php echo $gcoin_cap_20_vip; ?></td>
            <td align="center"><?php $vpoint_cap_20_vip = $gcoin_cap_20_vip*(1+$vpoint_extra/100); echo $vpoint_cap_20_vip; ?></td>
        </tr>
        <?php } ?>
        </tbody>
    </table>

</div>