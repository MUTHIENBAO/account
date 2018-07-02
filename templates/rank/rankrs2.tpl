<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Xếp hạng Reset nhân vật</h1>
        <div class="intro-content">
            <div class="in-20">
                <span class="color-violet">Xếp hạng Theo Số lần thực hiện Reset :</span><br />
                    <span class="tag tag-red">Reset</span>
                    <span class="tag tag-red">Reset VIP</span>
            </div>
        </div>
    </div>
</div>

<div class="primary-block out-top-20">
    <?php include('templates/rank/rankrs_top.tpl'); ?>
    
    <div class="in-20 font-14 text-semibold">
        <p class="update-time"><span class="color-red">Cập nhập lúc:</span> <span class="color-brown"><?php echo $time_top; ?><span class="color-red"> <span class="color-red">( 5 phút cập nhập 1 lần )</span></p>


        <?php
        foreach($rank as $key => $val) {
        ?>
        <div class="out-top-20">
            <p class="in-10">
                <span class="color-blue"><?php echo $title_top[$key]; ?></span>
            </p>
            <table class="table table-blue table-border-1 table-text-center ">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Nhân vật</th>
                    <th>Reset</th>
                    <th>Lớp nhân vật</th>
                    <th>RS Cuối</th>
                </tr>
                </thead>
                <tbody>
                <?php 
                    foreach($val as $key2 => $val2) { 
                        $vip_day_view = '';
                        if($val2['vip_day'] > 0) $vip_day_view = "<span>". $val2['vip_day'] ."d</span>";
                ?>
                <tr>
                    <td align="center"><?php echo $key2+1; ?></td>
                    <td align="center"><?php echo $val2['name']; ?> <?php if($val2['vip'] > 0) echo "<span class='vip-box' title='VIP'><img src='images/super.gif' />$vip_day_view</span>"; ?></td>
                    <td align="center"><?php echo $val2['reset']; ?></td>
                    <td align="center"><?php echo $val2['class']; ?></td>
                    <td align="center"><?php echo $val2['lastrs_time']; ?></td>
                </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
        <?php
        }
        ?>
    </div>
</div>