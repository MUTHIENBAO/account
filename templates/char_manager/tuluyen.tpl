<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Hệ thống tu luyện</h1>
    </div>
</div>


<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Điểm <strong>PP, PP+</strong> nhận được khi : hoàn thành nhiệm vụ ngày.</li>
            <?php if(!isset($tl_point_type) || $tl_point_type == 0) { ?>
            <li><strong>Điểm Tu Luyện</strong> nhận được khi : Reset, Reset VIP, Reset OVER, Reset OVER VIP <strong><?php echo $tl_rsmax; ?></strong> lần đầu tiên trong ngày.</li>
            <li><strong>Resset VIP, Reset OVER VIP</strong> nhận được <strong>nhiều hơn</strong> Reset, Reset OVER : <strong>1.5 lần</strong></li>
            <?php } ?>
            <li>Với <strong>1  PP, PP+<?php if(!isset($tl_point_type) || $tl_point_type == 0) echo ', Điểm Tu Luyện'; ?></strong> : nhận <strong>1 Exp Tu Luyện</strong></li>
            <li>Ưu tiên sử dụng : <?php if(!isset($tl_point_type) || $tl_point_type == 0) echo 'Điểm Tu Luyện > '; ?> PP+ > PP</li>
            <li>Tu Luyện Ngẫu nhiên : Miễn Phí</li>
            <li>Tu Luyện đúng chỉ số : Phí <strong><?php echo $tl_vip_money_price; ?> tiền tệ / 1 Exp Tu Luyện</strong> <i>(Tiền tệ sử dụng ưu tiên : <?php if($tl_vip_money_type == 0) echo 'Vcent+ > Gcent+ > Vcent > Gcent.'; else echo 'Gcent+ > Vcent > Gcent.'; ?>)</i></li>
            <li><strong>Thăng cấp</strong> : Cần <strong>1 Chao</strong> trong <a href="#char_manager&act=jewel2bank" rel="ajax">ngân hàng</a></li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Thông tin nhân vật</span></h1>
    </div>
    <div class="in-20">
        <div class="form-2">
         <?php if($Use_VIP == 2) {  ?>
            <div class="form-row">
                <div class="form-col-1">
                    <span>Tài khoản VIP</span>
                </div>
                <div class="form-col-2">
                    <span>
			<?php if($_SESSION['acc_vip'] > 0 && $_SESSION['acc_vip_day'] >= $enable_vip['tuluyen']) { ?>
			<div class="image-vip-title vip-<?php echo $_SESSION['acc_vip']; ?>"></div>
			<?php } else { ?>
			<a href="#vip_system" title="Nâng cấp VIP nhận ưu đãi giảm % Exp yêu cầu khi Thăng cấp Tu luyện."><div class="image-vip-title upgrade-vip vip-<?php if($_SESSION['acc_vip'] > 0) echo $_SESSION['acc_vip']; else echo 2; ?>-<?php echo $enable_vip['tuluyen']; ?>"></div></a>
			<?php } ?>
		    </span>
                </div>
            </div>
	    <?php } ?>    
            <div class="form-row">
                <div class="form-col-1">
                    <span>Điểm PP hiện có </span>
                </div>
                <div class="form-col-2">
                    <span class="tag tag-red"><b><span id="tl_point_pp"><?php echo number_format($_SESSION['acc_ppoint'], 0, ',', '.'); ?></span></b></font></span>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-col-1">
                    <span>Điểm PP+ hiện có </span>
                </div>
                <div class="form-col-2">
                    <span class="tag tag-red"><b><span id="tl_point_pp_extra"><?php echo number_format($_SESSION['acc_ppoint_extra'], 0, ',', '.'); ?></span></b></font></span>
                </div>
            </div>
            
            <?php 
            $total_tl_point = $_SESSION['acc_ppoint'] + $_SESSION['acc_ppoint_extra'];
            if(!isset($tl_point_type) || $tl_point_type == 0) { 
                $total_tl_point += $tuluyen_arr['tuluyen_point'];
            ?>
            <div class="form-row">
                <div class="form-col-1">
                    <span>Điểm Tu Luyện hiện có </span>
                </div>
                <div class="form-col-2">
                    <span class="tag tag-red"><b><span id="tl_point"><?php echo number_format($tuluyen_arr['tuluyen_point'], 0, ',', '.'); ?></span></b></font></span>
                </div>
            </div>
            <?php } ?>
            
            <div class="form-row">
                <div class="form-col-1">
                    <span>Tổng Điểm </span>
                </div>
                <div class="form-col-2">
                    <span class="tag tag-red"><b><span id="tl_point_total"><?php echo number_format($total_tl_point, 0, ',', '.'); ?></span></b></font></span>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="out-top-20">

        <!--<div id="tlsuccess"></div>
        <div id="tlerror"></div>-->
        
        <table class="table table-blue-white table-border-2">
            <thead>

            <tr bgcolor="#FFFFFF">
                <th align="center"><b>Thuộc Tính</b></th>
                <th align="center"><b>Cấp</b></th>
                <th align="center"><b>Point</b> nhận khi RS</th>
                <th align="center"><b>Exp Tu Luyện</b></th>
                <th align="center"><b>Point cấp sau</b></th>
                <th align="center"><b>Tiền tệ</b></th>
                <th align="center"><b>Tu Luyện</b></th>
            </tr>

            </thead>

            <tbody>
            <tr bgcolor="#FFFFFF">
                <td align="center"><strong>Sức Mạnh</strong></td>
                <td align="center"><font color='blue'><b><span id="tlcap_str"><?php echo $tuluyen_arr['str_cap']; ?></span></b></font></td>
                <td align="center"><font color='red'><span id="tlpoint_str"><?php echo $tuluyen_arr['str_point']; ?></span></font></td>
                <td align="center"><b><span id="tlexp_str">
                    <?php echo $exp_now[1]; ?></span></b> / <span id="tlexpnext_str"><?php echo $exp_tuluyen_sum[1]; ?><?php if($_SESSION['acc_vip'] > 0 && $_SESSION['acc_vip_day'] >= $enable_vip['tuluyen']) { ?> (<i><s><?php echo $exp_tuluyen_sum[1]+$extra_exp_tuluyen[1]; ?></s></i>)<?php } ?></span>
                    <div class="progress-bar">
                        <div class="progress" id="progress_bar_str" style="width:<?php echo $percent_bar[1]; ?>%"></div>
                    </div>
                </td>
                <td align="center"><span id="tlpointnext_str"><?php echo $sumpoint[1]; ?></span></td>
                <td align="center"><span id="tl_money_str"><?php if($thangcap[1] == 0) {echo $tl_vip_money_price*5;} else echo '0'; ?></span></td>
                <td align="center"><div id="btn_tlstr">
                    <?php if($thangcap[1] == 0) { ?>
                    <div class="select-box sl-bx-tl"><select id="tl_select_str" class="tl_select" tltype="str">
                        <?php for($i=1; $i<=20; $i++) echo "<option value='". $i*5 ."'>". $i*5 ." Exp</option>"; ?>
                    </select></div>
                    <?php } ?>
                    <div class="group-popup">
                        <div class="box-popup box-popup-red" data-popup="popup-click-str"></div>
                        <?php echo $form_input[1]; ?>

                    </div>

                </div> <span id="loading_tlstr"></span></td>
            </tr>

            <tr bgcolor="#FFFFFF">
                <td align="center"><strong>Nhanh Nhẹn</strong></td>
                <td align="center"><font color='blue'><b><span id="tlcap_agi"><?php echo $tuluyen_arr['agi_cap']; ?></span></b></font></td>
                <td align="center"><font color='red'><span id="tlpoint_agi"><?php echo $tuluyen_arr['agi_point']; ?></span></font></td>
                <td align="center"><b><span id="tlexp_agi"><?php echo $exp_now[2]; ?></span></b> / <span id="tlexpnext_agi"><?php echo $exp_tuluyen_sum[2]; ?><?php if($_SESSION['acc_vip'] > 0 && $_SESSION['acc_vip_day'] >= $enable_vip['tuluyen']) { ?> (<i><s><?php echo $exp_tuluyen_sum[2]+$extra_exp_tuluyen[2]; ?></s></i>)<?php } ?></span>
                    <div class="progress-bar">
                        <div class="progress" id="progress_bar_agi" style="width:<?php echo $percent_bar[2]; ?>%"></div>
                    </div>
                </td>
                <td align="center"><span id="tlpointnext_agi"><?php echo $sumpoint[2]; ?></span></td>
                <td align="center"><span id="tl_money_agi"><?php if($thangcap[2] == 0) {echo $tl_vip_money_price*5;} else echo '0'; ?></span></td>
                <td align="center"><div id="btn_tlagi">
                    <?php if($thangcap[2] == 0) { ?>
                    <div class="select-box sl-bx-tl"><select id="tl_select_agi" class="tl_select" tltype="agi">
                        <?php for($i=1; $i<=20; $i++) echo "<option value='". $i*5 ."'>". $i*5 ." Exp</option>"; ?>
                    </select></div>
                    <?php } ?>
                    <div class="group-popup">
                        <div class="box-popup box-popup-red" data-popup="popup-click-agi"></div>
                        <?php echo $form_input[2]; ?>
                    </div>

                </div> <span id="loading_tlagi"></span></td>
            </tr>

            <tr bgcolor="#FFFFFF">
                <td align="center"><strong>Thể Lực</strong></td>
                <td align="center"><font color='blue'><b><span id="tlcap_vit"><?php echo $tuluyen_arr['vit_cap']; ?></span></b></font></td>
                <td align="center"><font color='red'><span id="tlpoint_vit"><?php echo $tuluyen_arr['vit_point']; ?></span></font></td>
                <td align="center"><b><span id="tlexp_vit"><?php echo $exp_now[3]; ?></span></b> / <span id="tlexpnext_vit"><?php echo $exp_tuluyen_sum[3]; ?><?php if($_SESSION['acc_vip'] > 0 && $_SESSION['acc_vip_day'] >= $enable_vip['tuluyen']) { ?> (<i><s><?php echo $exp_tuluyen_sum[3]+$extra_exp_tuluyen[3]; ?></s></i>)<?php } ?></span>
                    <div class="progress-bar">
                        <div class="progress" id="progress_bar_vit" style="width:<?php echo $percent_bar[3]; ?>%"></div>
                    </div>
                </td>
                <td align="center"><span id="tlpointnext_vit"><?php echo $sumpoint[3]; ?></span></td>
                <td align="center"><span id="tl_money_vit"><?php if($thangcap[3] == 0) {echo $tl_vip_money_price*5;} else echo '0'; ?></span></td>
                <td align="center"><div id="btn_tlvit">
                    <?php if($thangcap[3] == 0) { ?>
                    <div class="select-box sl-bx-tl"><select id="tl_select_vit" class="tl_select" tltype="vit">
                        <?php for($i=1; $i<=20; $i++) echo "<option value='". $i*5 ."'>". $i*5 ." Exp</option>"; ?>
                    </select></div>
                    <?php } ?>
                    <div class="group-popup">
                        <div class="box-popup box-popup-red" data-popup="popup-click-vit"></div>
                        <?php echo $form_input[3]; ?>

                    </div>

                </div> <span id="loading_tlvit"></span></td>
            </tr>

            <tr bgcolor="#FFFFFF">
                <td align="center"><strong>Năng Lượng</strong></td>
                <td align="center"><font color='blue'><b><span id="tlcap_ene"><?php echo $tuluyen_arr['ene_cap']; ?></span></b></font></td>
                <td align="center"><font color='red'><span id="tlpoint_ene"><?php echo $tuluyen_arr['ene_point']; ?></span></font></td>
                <td align="center"><b><span id="tlexp_ene"><?php echo $exp_now[4]; ?></span></b> / <span id="tlexpnext_ene"><?php echo $exp_tuluyen_sum[4]; ?><?php if($_SESSION['acc_vip'] > 0 && $_SESSION['acc_vip_day'] >= $enable_vip['tuluyen']) { ?> (<i><s><?php echo $exp_tuluyen_sum[4]+$extra_exp_tuluyen[4]; ?></s></i>)<?php } ?></span>
                    <div class="progress-bar">
                        <div class="progress" id="progress_bar_ene" style="width:<?php echo $percent_bar[4]; ?>%"></div>
                    </div>
                </td>
                <td align="center"><span id="tlpointnext_ene"><?php echo $sumpoint[4]; ?></span></td>
                <td align="center"><span id="tl_money_ene"><?php if($thangcap[4] == 0) {echo $tl_vip_money_price*5;} else echo '0'; ?></span></td>
                <td align="center"><span id="btn_tlene">
                   
                    <?php if($thangcap[4] == 0) { ?>
                    <div class="select-box sl-bx-tl"><select id="tl_select_ene" class="tl_select" tltype="ene">
                        <?php for($i=1; $i<=20; $i++) echo "<option value='". $i*5 ."'>". $i*5 ." Exp</option>"; ?>
                    </select></div>
                    <?php } ?>
                    
                    <div class="group-popup">
                    <div class="box-popup box-popup-red" data-popup="popup-click-ene"></div>
                    <?php echo $form_input[4]; ?>

                </div>

                </span> <span id="loading_enestr"></span></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
                <td align="center"><strong>Ngẫu nhiên</strong></td>
                <td align="center" colspan="4"></td>
                <td align="center"><span id="tl_money_random">Miễn Phí</span></td>
                <td align="center">
                    <div class="select-box sl-bx-tl"><select id="tl_select_random">
                        <?php for($i=1; $i<=20; $i++) echo "<option value='". $i*5 ."'>". $i*5 ." Exp</option>"; ?>
                    </select></div>

                    <div class="group-popup">
                        <div class="box-popup" data-popup="popup-hover-random">
                            <p>Tu Luyện Ngẫu nhiên 1 trong 4 chỉ số</p>
                            
                            <?php if($thangcap_any_stat > 0) echo "<p><font color='red'><strong>Chỉ sử dụng được khi Thăng Cấp hết thuộc tính</strong></font></p>"; ?>
                        </div>
                        <div class="box-popup box-popup-red" data-popup="popup-click-random"></div>
                    
                    <input type="button" value="Ngẫu nhiên" class="tuluyen btn btn-green btn-block btn-lg" <?php if($thangcap_any_stat > 0) echo "disabled='disabled'"; ?> id="btn_tl_random" tltype="random" data-showpopup="random" />

                </div>

                <span id="loading_enestr"></span></td>
            </tr>
            </tbody>
        </table>


</div>
<?php } else include('templates/char_manager.tpl'); ?>