<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Đổi giới tính</h1>
    </div>
</div>


<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <div id="rs_content">
            <ul class="noted in-left-10">
                <?php if($keep_bxh != 1) { ?>
                <li>Đổi nhân vật khác trước khi đổi giới tính.</li>
                <li>Sau khi đổi giới tính, sẽ bị xóa toàn bộ nhiệm vụ đã thực hiện.</li>
                <li>Sau khi đổi giới tính, sẽ bị xóa toàn bộ dữ liệu trong Bảng Xếp Hạng : Danh Vọng, thực hiện Reset.</li>
                <li>Nếu bạn nằm trong danh sách đạt giải Event, vui lòng không Đổi Giới Tính cho đến khi có thông báo tổng kết giải.</li>
                <?php } else { ?>
                <li><font color='red'><strong>Đổi Giới Tính không bị xóa dữ liệu trong bảng xếp hạng</strong></font>.</li>
                <?php } ?>
            </ul>
        </div>
    </div>
</div>
<div class=" out-top-20">
    <table class="table table-blue table-text-center table-border-2">
        <thead>
            <tr>
                <th align="center" scope="col">Gcent</th>
                <th align="center" scope="col">% Reset bị trừ <?php if($_SESSION['acc_vip'] > 0 && $_SESSION['acc_vip_day'] >= $enable_vip['dgt']) { ?><br />(Tài khoản VIP)<?php } ?></th>
                <th align="center" scope="col">Reset ít nhất</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td align="center"><?php echo number_format($doigt_gcoin, 0, ',', '.'); ?> Gcent</td>
                <td align="center"><?php echo $doigt_trureset; ?> %<?php if($_SESSION['acc_vip'] > 0 && $_SESSION['acc_vip_day'] >= $enable_vip['dgt']) { ?> (<i><s><?php echo $doigt_trureset+$extra_doigt_trureset; ?> %</s></i>)<?php } ?></td>
                <td align="center"><?php echo $doigt_resetmin; ?> Reset</td>
            </tr>
        </tbody>
    </table>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">


<form id="doigioitinh" name="doigioitinh" method="post" action="index.php?mod=char_manager&act=doigioitinh">
	<input type="hidden" name="action" value="doigioitinh" />
	<input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />
    <div class="form-2">
        <div class="form-row">
            <div class="form-col-1"><span>Nhân vật Đổi Giới Tính</span></div>
            <div class="form-col-2">
                <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
            </div>
            <div class="form-col-3">&nbsp;</div>
        </div>
		
		<?php if($Use_VIP == 2) {  ?>
            <div class="form-row">
                <div class="form-col-1">
                    <span>Tài khoản VIP</span>
                </div>
                <div class="form-col-2">
                    <span>
			<?php if($_SESSION['acc_vip'] > 0 && $_SESSION['acc_vip_day'] >= $enable_vip['dgt']) { ?>
			<div class="image-vip-title vip-<?php echo $_SESSION['acc_vip']; ?>"></div>
			<?php } else { ?>
			<a href="#vip_system" title="Nâng cấp VIP"><div class="image-vip-title upgrade-vip vip-<?php if($_SESSION['acc_vip'] > 0) echo $_SESSION['acc_vip']; else echo 2; ?>-<?php echo $enable_vip['dgt']; ?>"></div></a> (Nâng cấp VIP ngay!)
			<?php } ?>
		    </span>
                </div>
	       	<div class="form-col-3">&nbsp;</div>
            </div>
	    <?php } ?>
        <div class="line"></div>
        <div class="form-row">
            <div class="form-col-1"><span>Reset / Relife trước</span></div>
            <div class="form-col-2"><span class="tag tag-orange"><?php echo $_SESSION['nv_reset']; ?></span> / <span class="tag tag-blue"><?php echo $_SESSION['nv_relife']; ?></span></div>
            <div class="form-col-3">&nbsp;</div>
        </div>
        <div class="form-row">
            <div class="form-col-1"><span>Reset tổng</span></div>
            <div class="form-col-2">
                <?php echo "$reset_total"; ?>
            </div>
            <div class="form-col-3"><? echo $notice_reset; ?></div>
        </div>
        <div class="form-row">
            <div class="form-col-1"><span>Gcent</span></div>
            <div class="form-col-2">
                <?php echo number_format($doigt_gcoin, 0, ',', '.'); ?>
            </div>
            <div class="form-col-3"><? echo $notice_gcoin; ?></div>
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
            <div class="form-col-1"><span>Chọn Giới Tính cần đổi</span></div>
            <div class="form-col-2">
                <select name="gioitinh" class="form-style">
					<?php if ($_SESSION['nv_class'] != $class_dw_1 && $_SESSION['nv_class'] != $class_dw_2 && $_SESSION['nv_class'] != $class_dw_3 ) { ?><option value="0" selected="selected">Dark Wizard</option><?php } ?>
					<?php if ($_SESSION['nv_class'] != $class_dk_1 && $_SESSION['nv_class'] != $class_dk_2 && $_SESSION['nv_class'] != $class_dk_3 ) { ?><option value="16">Dark Knight</option><?php } ?>
					<?php if ($_SESSION['nv_class'] != $class_elf_1 && $_SESSION['nv_class'] != $class_elf_2 && $_SESSION['nv_class'] != $class_elf_3 ) { ?><option value="32">Elf</option><?php } ?>
					<?php if ($_SESSION['nv_class'] != $class_mg_1 && $_SESSION['nv_class'] != $class_mg_2 && ( !isset($mg_use) || $mg_use == 1 ) ) { ?><option value="48">Magic Gladiator</option><?php } ?>
					<?php if ($_SESSION['nv_class'] != $class_dl_1 && $_SESSION['nv_class'] != $class_dl_2 && ( !isset($dl_use) || $dl_use == 1 ) ) { ?><option value="64">Dark Lord</option><?php } ?>
					<?php if ($_SESSION['nv_class'] != $class_sum_1 && $_SESSION['nv_class'] != $class_sum_2 && $_SESSION['nv_class'] != $class_sum_3 && ( !isset($sum_use) || $sum_use == 1 ) ) { ?><option value="80">Summoner</option><?php } ?>
                    <?php if ( $_SESSION['nv_class'] != $class_rf_1 && $_SESSION['nv_class'] != $class_rf_2  && ( !isset($rf_use) || $rf_use == 1 ) ) { ?><option value="96">Rage Fighter</option><?php } ?>
				</select>
            </div>
            <div class="form-col-3">&nbsp;</div>
        </div>
        <div class="form-row">
            <div class="form-col-1"><span>Mật khẩu cấp 2</span></div>
            <div class="form-col-2">
                <input class="form-style" type="password" name="pass2" size="14" maxlength="32"/>
            </div>
            <div class="form-col-3">&nbsp;</div>
        </div>
        
        <div class="line"></div>
        <div class="form-row">
            <div class="form-col-1"><span>Sau khi đổi Giới tính</span></div>
            <div class="form-col-2">&nbsp;</div>
            <div class="form-col-3">&nbsp;</div>
        </div>
        <div class="form-row">
            <div class="form-col-1"><span>Reset bị trừ</span></div>
            <div class="form-col-2">- <?php echo $reset_total_redure; ?> Reset</div>
            <div class="form-col-3">&nbsp;</div>
        </div>
        <div class="form-row">
            <div class="form-col-1"><span>Reset / Relife sau</span></div>
            <div class="form-col-2"><span class="tag tag-orange"><?php echo $reset_after; ?></span> / <span class="tag tag-blue"><?php echo $relife_after; ?></span></div>
            <div class="form-col-3">&nbsp;</div>
        </div>
        
        <div class="form-submit">
            <button class="btn btn-green btn-block btn-lg" type="submit" name="submit" onclick="return confirm('Lưu ý:\n + Đổi Giới Tính sẽ bị xóa hết số lần Reset, Danh Vọng trong Bảng Xếp Hạng.\n + Nếu bạn nằm trong danh sách đạt giải Event, vui lòng không Đổi Giới Tính cho đến khi có thông báo tổng kết giải.\n\n Bạn có chắc chắn muốn Đổi Giới Tính không?');" <?php if($accept=='0') { echo 'disabled="disabled"'; } ?> >Thực hiện đổi giới tính</button>
        </div>
    </div>
</form>
    </div>
    </div>