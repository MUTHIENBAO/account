<?php if(isset($_SESSION['mu_username'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Nâng cấp tài khoản VIP</h1>
    </div>
</div>


<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Sau khi nâng cấp VIP hoặc nhận thưởng Phúc lợi hàng ngày xong, cần phải thoát tài khoản đăng nhập lại để cập nhật.</li>
            <li class="tik">Khi nâng cấp gói VIP hoặc ngày sử dụng mới thì gói VIP, ngày sử dụng cũ sẽ bị mất.</li>
            <li>Mọi trường hợp không đọc kỹ trước khí sử dụng đều không được giải quyết.</li>
        </ul>
    </div>
</div>
<div class="primary-block out-top-20">
    <div class="main-content vip">
        <ul class="tabs-content">
            <li id="day" class="active">
                <a href="javascript:;" class="day">3 ngày</a>
            </li>
            <li id="week">
                <a href="javascript:;" class="week">7 ngày</a>
            </li>
            <li id="month">
                <a href="javascript:;" class="month">30 ngày</a>
            </li>			
        </ul>
    </div>
<div class="out-top-20">
    <table class="table table-blue table-text-center table-border-2">
        <thead>
            <tr>
                <th align="center">Phúc lợi</th>
                <th align="center"><strong>VIP Vàng</strong></th>
                <th align="center"><strong>VIP Bạc</strong></th>
            </tr>
        </thead>
        <tbody>
            <tr class="plan_<?php echo $enable_vip['level_reset']; ?>">
                <td align="center">Giảm % Level khi Reset</td>
                <td align="center"><?php echo $gold_vip['level_reset']; ?> %</td>
                <td align="center"><?php echo $silver_vip['level_reset']; ?> %</td>
            </tr>
            <tr class="plan_<?php echo $enable_vip['point_reset']; ?>">
                <td align="center">Thêm % Point nhận được sau khi Reset</td>
                <td align="center"><?php echo $gold_vip['point_reset']; ?> %</td>
                <td align="center"><?php echo $silver_vip['point_reset']; ?> %</td>
            </tr>
            <tr class="plan_<?php echo $enable_vip['point_reset']; ?>">
                <td align="center">Giảm % Zen khi Reset</td>
                <td align="center"><?php echo $gold_vip['zen_reset']; ?> %</td>
                <td align="center"><?php echo $silver_vip['zen_reset']; ?> %</td>
            </tr>
            <tr class="plan_<?php echo $enable_vip['utoff']; ?>">
                <td align="center">Thêm % Điểm Ủy Thác khi Ủy Thác Offline</td>
                <td align="center"><?php echo $gold_vip['point_utoffline']; ?> %</td>
                <td align="center"><?php echo $silver_vip['point_utoffline']; ?> %</td>
            </tr>
            <tr class="plan_<?php echo $enable_vip['dgt']; ?>">
                <td align="center">Giảm % trừ Reset sau khi Đổi giới tính</td>
                <td align="center"><?php echo $gold_vip['reset_dgt']; ?> %</td>
                <td align="center"><?php echo $silver_vip['reset_dgt']; ?> %</td>
            </tr>
            <tr class="plan_<?php echo $enable_vip['tuluyen']; ?>">
                <td align="center">Giảm % Exp yêu cầu khi Thăng cấp Tu luyện.</td>
                <td align="center"><?php echo $gold_vip['exp_tuluyen']; ?> %</td>
                <td align="center"><?php echo $silver_vip['exp_tuluyen']; ?> %</td>
            </tr>
            <tr class="plan_<?php echo $enable_vip['questdaily']; ?>">
                <td align="center">Thêm số lượng Nhiệm vụ tối đa hàng ngày.</td>
                <td align="center"><?php echo $gold_vip['questdaily']; ?></td>
                <td align="center"><?php echo $silver_vip['questdaily']; ?></td>
            </tr>            			
        </tbody>
    </table>
</div>
</div>
<div class="primary-block out-top-20">
    <table class="table table-blue table-text-center table-border-2">
        <thead>
			<tr class="span">
				<th colspan="3"><strong>Phúc lợi hàng ngày</strong></th>
			</tr>		
            <tr>
                <th align="center">Phần thưởng</th>
                <th align="center"><strong>VIP Vàng</strong></th>
                <th align="center"><strong>VIP Bạc</strong></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td align="center">PPoint+</td>
                <td align="center"><?php echo $gold_daily['ppextra']; ?></td>
                <td align="center"><?php echo $silver_daily['ppextra']; ?></td>
            </tr>
            <tr>
                <td align="center">Ngọc Hỗn Nguyên</td>
                <td align="center"><?php echo $gold_daily['chao']; ?></td>
                <td align="center"><?php echo $silver_daily['chao']; ?></td>
            </tr>
            <tr>
                <td align="center">Ngọc Sáng Tạo</td>
                <td align="center"><?php echo $gold_daily['cre']; ?></td>
                <td align="center"><?php echo $silver_daily['cre']; ?></td>
            </tr>
            <tr>
                <td align="center">Lông Vũ</span></td>
                <td align="center"><?php echo $gold_daily['blue']; ?></td>
                <td align="center"><?php echo $silver_daily['blue']; ?></td>
            </tr>
            <tr>
                <td align="center">Gcent+</td>
                <td align="center"><?php echo $gold_daily['gcent']; ?></td>
                <td align="center"><?php echo $silver_daily['gcent']; ?></td>
            </tr>
            <tr>
                <td align="center">Vcent+</td>
                <td align="center"><?php echo $gold_daily['vcent']; ?></td>
                <td align="center"><?php echo $silver_daily['vcent']; ?></td>
            </tr>
            <tr>
                <td align="center">Điểm Ủy Thác</td>
                <td align="center"><?php echo $gold_daily['pointut']; ?></td>
                <td align="center"><?php echo $silver_daily['pointut']; ?></td>
            </tr>
            <tr>
                <td align="center">Zen</td>
                <td align="center"><?php echo number_format($gold_daily['zen'], 0, ',' ,'.'); ?></td>
                <td align="center"><?php echo number_format($silver_daily['zen'], 0, ',' ,'.'); ?></td>
            </tr>			
        </tbody>
    </table>
</div>
<?php if($_SESSION[acc_vip] > 0 && $_SESSION['mu_nvchon']){ ?>
<div class="primary-block out-top-20">
	<div class="form-3">
        <div class="form-row">
            <div class="form-col-1"><strong>Nhân vật Nhận thưởng</strong></div>
            <div class="form-col-2"><span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span></div>
			<div class="form-col-3">&nbsp;</div>
        </div>

         <div class="form-row">
            <button class="btn btn-green btn-block btn-lg" type="submit" name="Submit" id="btn_vip_receivepl" <?php if($accept=='0') { echo 'disabled="disabled">Đã nhận'; } else { ?>>Nhận thưởng<?php } ?></button>
        </div>
	</div>	
</div>
<?php } ?>
<div class="primary-block out-top-20">
    <table class="table table-blue table-text-center table-border-2">
        <thead>
            <tr>
                <th align="center">Gói VIP</th>
                <th align="center"><strong>VIP Vàng</strong></th>
                <th align="center"><strong>VIP Bạc</strong></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td align="center">3 ngày</td>
                <td align="center"><?php echo number_format($gold_vip['valid'][0], 0, ',' ,'.'); ?> G.Cent</td>
                <td align="center"><?php echo number_format($silver_vip['valid'][0], 0, ',' ,'.'); ?> G.Cent</td>
            </tr>
            <tr>
                <td align="center">7 ngày</td>
                <td align="center"><?php echo number_format($gold_vip['valid'][1], 0, ',' ,'.'); ?> G.Cent</td>
                <td align="center"><?php echo number_format($silver_vip['valid'][1], 0, ',' ,'.'); ?> G.Cent</td>

            </tr>
            <tr>
                <td align="center">30 ngày</td>
                <td align="center"><?php echo number_format($gold_vip['valid'][2], 0, ',' ,'.'); ?> G.Cent</td>
                <td align="center"><?php echo number_format($silver_vip['valid'][2], 0, ',' ,'.'); ?> G.Cent</td>
            </tr>
        </tbody>
    </table>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">
    <div class="form-3" id="uv_content">
	
        <div class="form-row">
            <div class="form-col-1">Tình trạng </div>
            <div class="form-col-2">
				<?php if($_SESSION['acc_vip'] > 0) { ?>
					<div class="image-vip-title vip-<?php echo $_SESSION['acc_vip']; ?>"></div>(Còn: <?php echo $vip_days_left; ?> ngày <?php echo $vip_hours_left; ?> giờ <?php echo $vip_mins_left; ?> phút)
				<?php } else { ?>
					<font color="red">Chưa nâng cấp VIP</font>
				<?php }  ?>
            </div>
        </div>
	
        <div class="form-row">
            <div class="form-col-1">Gói VIP </div>
            <div class="form-col-2">
            	<select name="type" class="form-style">
					<option value="">[Chọn gói VIP]</option>
	                <option label="VIP Vàng" value="1">
	                VIP Vàng</option>
	                <option label="VIP Bạc" value="2">
	                VIP Bạc</option>
				  </select>
            </div>
        </div>

        <div class="form-row">
            <div class="form-col-1">Hạn sử dụng </div>
            <div class="form-col-2">
            	<select name="plan" class="form-style">
					<option value="">[Chọn thời hạn sử dụng]</option>
	                <option label="3 ngày" value="3">
	                3 ngày</option>
	                <option label="7 ngày" value="7">
	                7 ngày</option>
 	                <option label="30 ngày" value="30">
	                30 ngày</option>                   
				</select>
            </div>
        </div>

        <div class="form-row">
            <div class="form-col-1">Mật khẩu cấp 2</div>
            <div class="form-col-2"><input class="form-style" type="password" name="pass2" size="14" maxlength="32"/></div>
        </div>

        <div class="form-submit">
            <input id="btn_upgradevip" class="btn btn-green btn-lg" type="button" value="Nâng cấp VIP" name="Submit"><span id="uv_loading"></span></input>
        </div>
    </div>
    <div id="uv_err"></div>
    </div>
</div>
<?php } else include('templates/char_manager.tpl'); ?>