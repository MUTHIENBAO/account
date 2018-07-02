<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Đánh Lô</h1>
        <ul class="tabs-content">
            <li><a href="#relax&act=relax_de" rel="ajax">Đánh Đề</a></li>
            <li class="active"><a href="#relax&act=relax_lo" rel="ajax">Đánh Lô</a></li>
        </ul>
    </div>
</div>

<div class="out-top-20">

    <table class="table table-blue-white table-border-1 table-text-center">
        <thead>
        <tr class="span">
            <th colspan="2">Kết quả xổ số <strong>Miền Bắc</strong> ngày <strong><?php echo date('d/m/Y', strtotime($kqxs_arr['date'])); ?></strong></th>
        </tr>
        </thead>
        <tbody>
          <tr>
            <td align="right" width="100"><b>Giải đặc biệt</b></td>
            <td align="center"><?php echo $giai[0]; ?></td>
          </tr>
          <tr>
            <td align="right"><b>Giải nhất</b></td>
            <td align="center"><?php echo $giai[1]; ?></td>
          </tr>
          <tr>
            <td align="right"><b>Giải nhì</b></td>
            <td align="center"><?php echo $giai[2]; ?></td>
          </tr>
          <tr>
            <td align="right"><b>Giải ba</b></td>
            <td align="center"><?php echo $giai[3]; ?></td>
          </tr>
          <tr>
            <td align="right"><b>Giải tư</b></td>
            <td align="center"><?php echo $giai[4]; ?></td>
          </tr>
          <tr>
            <td align="right"><b>Giải năm</b></td>
            <td align="center"><?php echo $giai[5]; ?></td>
          </tr>
          <tr>
            <td align="right"><b>Giải sáu</b></td>
            <td align="center"><?php echo $giai[6]; ?></td>
          </tr>
          <tr>
            <td align="right"><b>Giải bảy</b></td>
            <td align="center"><?php echo $giai[7]; ?></td>
          </tr>
        </tbody>
    </table>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Luật chơi</span></h1>
    </div>
    <div class="in-20">
        <div id="rs_content">
            <ul class="noted in-left-10">
                <li>1 điểm = <?php echo number_format($lo_diem_gcoin, 0, ',', '.'); ?> Gcent</li>
                <li>1 điểm ăn <?php echo number_format($lo_win, 0, ',', '.'); ?> Gcent</li>
                <li>Đọ 2 số cuối 27 giải</li>
                <li>0h00 - 17h00 (5h chiều) mở ghi lô</li>
                <li>20h00 (8h tối) - 24h00 (12h đêm) trả kết quả lô</li>
                <li>Nếu trúng n nháy (n = 2,3,4,...) sẽ nhận : n x <?php echo number_format($lo_win, 0, ',', '.'); ?> Gcent</li>
            </ul>
        </div>
    </div>
</div>


<div class="primary-block out-top-20">
    <div class="in-20">

    <center>
    <?php if($hour_now >= 17) { echo "<strong>Đã hết giờ ghi Lô</strong>."; } else { ?>
        <br />
        Bạn đang có <font color='red'><strong><span id="lo_gcoin"><?php echo number_format($_SESSION['acc_gcoin'], 0, ',', '.'); ?></span></strong></font> Gcent | <strong><span id="lo_vpoint"><?php echo number_format($_SESSION['acc_vpoint'], 0, ',', '.'); ?></span></strong></font> Vcent<br /><br />
        Đánh con 
        <select id="lo_so">
            <?php for($i=0; $i<=99; $i++) { ?>
            <option value="<?php echo $i; ?>"><?php echo strlen($i)<2? '0'. $i: $i; ?></option>
            <?php } ?>
        </select>
        sử dụng 
        <select id="lo_diem">
            <?php for($i=0; $i<=$max_diemlo; $i++) { ?>
            <option value="<?php echo $i; ?>"><?php echo $i ?></option>
            <?php } ?>
        </select>
        điểm = <span id="diemlo_money">0</span> 
        <input type="radio" name="money_type" value="1" /> Gcent 
        <input type="radio" name="money_type" value="2" checked="checked" /> Vcent
        <br /><br />
        <input class="Accept" type="submit" name="Submit" id="relax_lo_danh" value="Đánh Lô" />
        <div id="lo_msg"></div>
    <?php } ?>
        <br /><br />
        <input type="button" id="btn_lo_history" value="Xem lịch sử ghi Lô" />
    </center>
    
    <div id="lo_history">
        &nbsp;
    </div>
        
    </div>
</div>