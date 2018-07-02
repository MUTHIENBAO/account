<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Item đang bán</h1>
    </div>
</div>

<?php 
    include('templates/com/daugia_head.tpl'); 
    if(isset($error_module)) echo "<center><font color='red'><strong>$error_module</strong></font></center>";
?>


<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Danh sách Item đang bán</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
<?php
    $count_flag = 0;
    foreach($group_item as $group_key => $group_val) {
        if($group_key > 0) {
            if($group_key % 5 == 0) {
                echo "<br />";
            } else {
                echo " | ";
            }
        }
        
        if($group_val['group_type'] == $_GET['type']) {
            $style_group_begin = "<font color='red'><b>";
            $style_group_end = "</b></font>";
        } else {
            $style_group_begin = "";
            $style_group_end = "";
        }
?>
	<li><a href="#com&act=daugia&page=daugia_biding&type=<?php echo $group_val['group_type']; ?>" rel="ajax"><?php echo $style_group_begin.$group_val['group_name'].$style_group_end; ?> (<strong><font color='blue'><?php echo $group_val['group_count']; ?></font></strong>)</a></li>
        
<?php } ?>
        </ul>
    </div>
</div>


<div class="priority-block out-top-20">
    <div class="in-20">
    <table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#9999FF" class='table table-blue-white table-border-2 table-text-center'>
        <thead>
        <tr>
            <th align="center"><b>Hình Ảnh</b></th>
            <th align="center"><b>Thông tin</b></th>
        </tr>
        </thead>
        <tbody>
        
        <?php 
            if(count($item_arr) > 0) {
            foreach($item_arr as $item) { 
        ?>
        <tr>
            <td align="center">
                <img src="items/<?php echo $item['item_image']; ?>.gif" /><br />
                <strong><font color='cyan'><?php echo number_format($item['bid_vpoint'], 0, ',', '.'); ?> Vcent</font></strong><br />
                <strong><font color='orange'><?php echo $item['name']; ?></font></strong>
            </td>
            <td align="center"><?php echo $item['item_info']; ?></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <span id="itembid_unactive_<?php echo $item['bid_id']; ?>">
                <?php
                    if($item['acc_own'] == $_SESSION['mu_username']) {
                        echo "Item này của bạn. Không thể mua.";
                    } else if($item['acc'] == $_SESSION['mu_username']) {
                        echo "Bạn hiện đang trả giá cao nhất cho Item này.<br />Chỉ được tham gia khi có người trả giá cao hơn.";
                    } else {
                ?>
                    <a href="#" class="itembid_up" vitri="<?php echo $item['bid_id']; ?>">Tham gia mua Item</a>
                <?php } ?>
                </span>
                <span id="itembid_active_<?php echo $item['bid_id']; ?>" style="display: none;">
                <a href="#" class="itembid_down" vitri="<?php echo $item['bid_id']; ?>">Đóng lại</a><br /><br />
                Chủ sở hữu : <strong><font color='blue'><?php echo $item['char_own']; ?></font></strong><br />
                Giá Item đang bán : <strong><font color='red'><?php echo number_format($item['bid_vpoint'], 0, ',', '.'); ?> Vcent</font></strong> thuộc về <strong><font color='green'><?php echo $item['name']; ?></font></strong><br />
                Giá mua đứt : <strong><font color='brown'><?php echo number_format($item['price_max'], 0, ',', '.'); ?> Vcent</font></strong><br />
                Thời gian kết thúc : <strong><?php echo $item['bid_end']; ?></strong><br />
                <?php
                    if(isset($item['trade_safe']) && $item['trade_safe'] == 1) {
                        echo "Item đã xác nhận mật khẩu OPD. <strong><font color='blue'>Giao dịch an toàn</font></strong><br />";
                    } else {
                        echo "Item không xác nhận mật khẩu OPD. <strong><font color='red'>Giao dịch không an toàn.<br />Nếu có tranh chấp, Item sẽ trả lại cho người bán</font></strong>.<br />";
                    }
                ?>
                <br />
                <?php
                    if(isset($item['itempass']) && $item['itempass'] == 1) {
                        echo "Mật khẩu bảo vệ : <input type='password' id='itempass_". $item['bid_id'] ."' size='5' /><br />";
                    } else {
                        echo "<input type='hidden' id='itempass_". $item['bid_id'] ."' value='0' />";
                    }
                ?>
                Đặt giá mua : <input type="text" id="bid_<?php echo $item['bid_id']; ?>" size="5" /> Vcent <input type="button" class="bid_dg" bidid="<?php echo $item['bid_id']; ?>" bid_vpoint="<?php echo $item['bid_vpoint']; ?>" price_max="<?php echo $item['price_max']; ?>" value="Đặt Giá" /> <span id="loading_<?php echo $item['bid_id']; ?>"></span><br /><span id="notice_<?php echo $item['bid_id']; ?>"></span><br />
                <i>Đặt giá <strong><font color='brown'><?php echo number_format($item['price_max'], 0, ',', '.'); ?> Vcent</font></strong> để mua đứt Item</i><br />
                <i>(Chi phí cho 1 lần đặt giá : <?php echo number_format($Bid_Vpoint_Member, 0, ',', '.'); ?> Vcent)</i><br />
                <span id="notice_bidding_view_<?php echo $item['bid_id']; ?>"></span>
                </span>
                <br /><br /><br />
            </td>
        </tr>
        <?php } } else echo "<center><font color='red'><strong>Không có Item đang bán</strong></font></center>"; ?>
        </tbody>
    </table>
    
        
    </div>
</div>
<?php } else include('templates/char_manager.tpl'); ?>