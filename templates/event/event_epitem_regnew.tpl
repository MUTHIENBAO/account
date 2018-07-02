<?php if (isset($_SESSION['mu_nvchon'])) { ?>
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
<center><b>Đăng ký Item tham gia Event</b></center>
    
    <table class="table table-blue table-border-2 table-text-center item_form" >
        <thead>
        <tr>
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
            <td align="center" bgcolor="#121212"><?php echo $item['info']; ?></td>
            <td align="center" id="td_<?php echo $item['serial']; ?>">
                <?php 
                    if($item['reged'] == 0) {
                        if($item['item_spec'] == 1 || $item['item_spec'] == 3) {
                            echo "<s>Item đặc biệt không thể tham gia</s>";
                        } else if($item['item_spec'] == 2) {
                            echo "<s>Item đã bảo vệ không được tham gia</s>";
                        } else {
                            
                        
                ?>
                            <a href="#" serial='<?php echo $item['serial']; ?>' class="epitem_reg" >Đăng ký</a> <span id="loading_<?php echo $item['serial']; ?>"></span><br /> <span id="err_<?php echo $item['serial']; ?>"  style="color:#FF0000"></span>
                <?php } } else { echo "<s>Item đã đăng ký</s>"; } ?>
            </td>
        </tr>
        <?php } } else echo "<center><font color='red'><strong>Không có Item hợp lệ</strong></font></center>"; ?>
    </table>
        
    </div>
</div>
<?php } else include('templates/char_manager.tpl'); ?>