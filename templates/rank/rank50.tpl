<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Xếp hạng TOP lúc 0h</h1>
    </div>
</div>

<div class="primary-block out-top-20">
    <?php include('templates/rank/rankrs_top.tpl'); ?>
    
    <div class="in-20">
<?php if(isset($err)) echo "<center><font color='red'><b>$err</b></font></center>"; ?>

        <center><font color='blue'><strong><?php echo $title_top; ?></strong></font></center><br />


        <table class="table table-blue table-border-1 table-text-center table-sort">
            <thead>
              <tr>
                <th align="center" scope="col">#</th>
                <th align="center" scope="col">Nhân vật</th>
                <th align="center" scope="col">Relife</th>
                <th align="center" scope="col">Reset</th>
                <th align="center" scope="col">Level</th>
                <th align="center" scope="col">P.Master</th>
                <th align="center" scope="col">P.UT</th>
                <th align="center" scope="col">Class</th>
                <th align="center" scope="col">RS Cuối</th>
              </tr>
            </thead>
            <tbody>
<?php 
    foreach($rank as $key => $val) { 
        if(is_int($key)) {
            $vip_day_view = '';
            if($val['vip_day'] > 0) $vip_day_view = "<span>". $val['vip_day'] ."d</span>";
?>

		  <tr>
		    <td align="center"><?php echo $key; ?></td>
		    <td align="center"><?php echo $val['name']; ?> <?php if($val['vip'] > 0) echo "<span class='vip-box' title='VIP'><img src='images/super.gif' />$vip_day_view</span>"; ?></td>
		    <td align="center"><?php echo $val['relife']; ?></td>
            <td align="center"><?php echo $val['reset']; ?></td>
            <td align="center"><?php echo $val['clevel']; ?></td>
            <td align="center"><?php echo $val['master_point']; ?></td>
            <td align="center"><?php echo $val['point_ut']; ?></td>
		    <td align="center"><?php echo $val['class']; ?></td>
            <td align="center"><?php echo $val['lastrs_time']; ?></td>
		  </tr>
<?php } } ?>
            </tbody>
		</table>
        
    </div>
</div>