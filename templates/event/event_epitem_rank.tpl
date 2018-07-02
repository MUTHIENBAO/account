<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content"><?php echo $event_epitem_name; ?></h1>
    </div>
</div>

<?php include('templates/event/event_epitem_head.tpl'); ?>

<div class="primary-block">
    <div class="in-20">
<?php 
    if(isset($error_module)) echo "<center><font color='red'><strong>$error_module</strong></font></center>";
?>
<center><b>Xếp hạng Event <?php echo $event_epitem_name; ?></b></center>
    <br /><br />
    <table class="table table-blue table-border-2 table-text-center item_form">
        <thead>
        <tr bgcolor="#FFFF00">
            <th align="center" colspan="4"><b>Xếp hạng theo Item ép thành công cao nhất và sớm nhất</b></th>
        </tr>
        <tr bgcolor="#FFFF00">
            <th align="center"><b>Nhân Vật</b></th>
            <th align="center"><b>Hình Ảnh</b></th>
            <th align="center"><b>Item đăng ký</b></th>
            <th align="center"><b>Item Hoàn Thành</b></th>
        </tr>
        </thead>
        <?php 
            $trname_bgcolor1 = "#FFFFFF";
            $trname_bgcolor2 = "#FFCCFF";
            $trname_bgcolor = $trname_bgcolor1;
            if(isset($list_rank_ear_arr) && is_array($list_rank_ear_arr)) {
                foreach($list_rank_ear_arr as $rank_ear) {
        ?>
        <tr bgcolor="#FFFFFF">
            <td align="center" bgcolor="<?php echo $trname_bgcolor; ?>"><strong><?php echo $rank_ear['name']; ?></strong></td>
            <td align="center" bgcolor="#121212"><img src="items/<?php echo $rank_ear['image']; ?>.gif"></td>
            <td align="center" bgcolor="#121212">
                <font color='pink'>Đăng ký : <?php echo $rank_ear['time_reg']; ?> </font><br />
                <?php echo $rank_ear['info']; ?>
            </td>
            <td align="center" bgcolor="#121212">
                <font color='yellow'>Hoàn thành : <?php echo $rank_ear['time_finish']; ?> </font><br />
                <?php echo $rank_ear['infoend']; ?>
            </td>
        </tr>
        <?php 
                    if($trname_bgcolor == $trname_bgcolor1) $trname_bgcolor = $trname_bgcolor2;
                    else $trname_bgcolor = $trname_bgcolor1;
                }
            }
        ?>
    </table>
    
    <br /><br />
    <table class="table table-blue table-border-2 table-text-center item_form">
        <thead>
        <tr bgcolor="#FFFF00">
            <th align="center" colspan="2"><b>Xếp hạng theo số lượng Item Ép Thành Công</b></th>
        </tr>
        <tr bgcolor="#FFFF00">
            <th align="center"><b>Nhân Vật</b></th>
            <th align="center"><b>Số lượng Item Ép thành công</b></th>
        </tr>
        </thead>
        <?php 
            $tr_bgcolor1 = "#FFFFFF";
            $tr_bgcolor2 = "#FFCCFF";
            $tr_bgcolor = $tr_bgcolor1;
            if(isset($list_rank_slg_arr) && is_array($list_rank_slg_arr)) {
                foreach($list_rank_slg_arr as $rank_slg) { 
        ?>
        <tr bgcolor="<?php echo $tr_bgcolor; ?>">
            <td align="center"><strong><?php echo $rank_slg['name']; ?></strong></td>
            <td align="center"><?php echo $rank_slg['count']; ?></td>
        </tr>
        <?php 
                if($tr_bgcolor == $tr_bgcolor1) $tr_bgcolor = $tr_bgcolor2;
                else $tr_bgcolor = $tr_bgcolor1;
                }
            }
        ?>
    </table>
    <br />
    
        
    </div>
</div>