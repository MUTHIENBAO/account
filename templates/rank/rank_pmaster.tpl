<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Xếp hạng Reset nhân vật</h1>
        <div class="intro-content">
            <div class="in-20">
                <span class="color-violet">Xếp hạng Theo Số lần thực hiện Reset :</span><br />
                    <span class="tag tag-red">Reset</span>
                    <span class="tag tag-red">Reset VIP</span>
                    <span class="tag tag-red">Reset OVER</span>
                    <span class="tag tag-red">Reset OVER VIP</span>
            </div>
        </div>
    </div>
</div>

<div class="primary-block out-top-20">
    <?php include('templates/rank/rankrs_top.tpl'); ?>
    
    <div class="in-20 font-14 text-semibold">
        <p class="update-time"><span class="color-red">Cập nhập lúc:</span> <span class="color-brown"><?php echo $time_top; ?><span class="color-red"> <span class="color-red">( 60 phút cập nhập 1 lần )</span></p>

        <div class="out-top-20">
            <table class="table table-blue table-border-1 table-text-center table-sort">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Nhân vật</th>
                    <th>P.Master Tổng</th>
                    <th>P.Master Chính</th>
                    <th>P.Master Thêm</th>
                    <th>Relife / Reset</th>
                    <th>Lớp nhân vật</th>
                </tr>
                </thead>
                <tbody>
                <?php 
                    foreach($rank as $key => $val) { 
                        $vip_day_view = '';
                        if($val['vip_day'] > 0) $vip_day_view = "<span>". $val['vip_day'] ."d</span>";
                ?>
                <tr>
                    <td align="center"><?php echo $key+1; ?></td>
                    <td align="center"><?php echo $val['name']; ?> <?php if($val['vip_day'] > 0) echo "<span class='vip-box' title='VIP'><img src='images/super.gif' />$vip_day_view</span>"; ?></td>
                    <td align="center"><?php echo $val['SCFMasterLevel'] + $val['nbb_pmaster']; ?></td>
                    <td align="center"><?php echo $val['SCFMasterLevel']; ?></td>
                    <td align="center"><?php echo $val['nbb_pmaster']; ?></td>
                    <td align="center"><?php echo '<font color"red">'. $val['relife'] .'</font> / '. $val['reset']; ?></td>
                    <td align="center"><?php echo $val['class']; ?></td>
                </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>