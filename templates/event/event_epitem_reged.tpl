<?php if (isset($_SESSION[mu_nvchon])) { ?>
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
<center><b>Item đã đăng ký</b></center>
    
    <table class="table table-blue table-border-2 table-text-center item_form" >
        <thead>
        <tr bgcolor="#FFFF00">
            <th align="center"><b>Hình Ảnh</b></th>
            <th align="center"><b>Thông tin</b></th>
            <th align="center"></th>
        </tr>
        </thead>
        <?php 
            if(count($listitem_arr) > 0) {
            foreach($listitem_arr as $item) { 
                
        ?>
        <tr bgcolor="#FFFFFF">
            <td align="center" bgcolor="#121212"><img src="items/<?php echo $item['image']; ?>.gif"></td>
            <td align="center" bgcolor="#121212">
                <font color='pink'>Đăng ký : <?php echo $item['time_reg']; ?> </font><br />
                <?php echo $item['info']; ?>
            </td>
            <?php if($item['status'] == 0) { ?>
            <td align="center" id="td_<?php echo $item['seri']; ?>">
                <a href="#" serial='<?php echo $item['seri']; ?>' class="epitem_update" >Xác nhận hoàn thành Event</a> <span id="loading_<?php echo $item['seri']; ?>"></span><br /> <span id="err_<?php echo $item['seri']; ?>"  style="color:#FF0000"></span>
            </td>
            <?php } else { ?> 
            <td align="center" bgcolor="#121212">
                <font color='yellow'>Hoàn thành : <?php echo $item['time_finish']; ?> </font><br />
                <?php 
                    echo $item['infoend']; 
                ?>
            </td>
            <?php } ?>
            
        </tr>
        <?php } } else echo "<center><font color='red'><strong>Không có Item đăng ký</strong></font></center>"; ?>
    </table>
    
        
    </div>
</div>
<?php } else include('templates/char_manager.tpl'); ?>