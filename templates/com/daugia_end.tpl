<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Item đã tham gia mua</h1>
    </div>
</div>


<div class="priority-block out-top-20">
    <div class="in-20">
<?php 
    include('templates/com/daugia_head.tpl'); 
    if(isset($error_module)) echo "<center><font color='red'><strong>$error_module</strong></font></center>";
?>
    
<center><b>Danh sách Item bạn đã tham gia đặt giá</b></center><br />

    <table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#9999FF" class='table table-blue-white table-border-2 table-text-center'>
        <thead>
            <tr>
                <th align="center"><b>Hình Ảnh</b></th>
                <th align="center"><b>Thông tin</b></th>
            </tr>
        </thead>
        <tbody>
        <?php 
            if(count($listitem_arr) > 0) {
            foreach($listitem_arr as $item) { 
        ?>
        <tr>
            <td align="center"><img src="items/<?php echo $item['item_image']; ?>.gif" /></td>
            <td align="center"><?php echo $item['item_info']; ?></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                Chủ sở hữu : <strong><font color='blue'><?php echo $item['char_own']; ?></font></strong><br />
                Giá khởi điểm : <strong><?php echo number_format($item['price_min'], 0, ',', '.'); ?> Vcent</strong> - 
                Giá bán đứt : <strong><?php echo number_format($item['price_max'], 0, ',', '.'); ?> Vcent</strong><br />
                Thiết lập kết thúc lúc : <?php echo $item['bid_end']; ?>
                <br /><br />
                Giá Item kết thúc : <strong><font color='red'><?php echo number_format($item['bid_vpoint'], 0, ',', '.'); ?> Vcent</font></strong><br />
                Nhân vật thắng cuộc : <strong><font color='green'><?php echo $item['name']; ?></font></strong> <img src="images/win.gif" border="0" /> 
                <span id='reward_<?php echo $item['bid_id']; ?>'>
                <?php
                    if($item['acc'] == $_SESSION['mu_username']) {
                        if($item['reward_status'] == 0) {
                            echo '<a href="#" class="reward_dg" bidid="'. $item['bid_id'] .'">Nhận Giải</a> <span id="loading_reward_'. $item['bid_id'] .'"></span><br /> <span id="reward_err_'. $item['bid_id'] .'"></span>';
                        } else {
                            echo "Đã nhận: ". $item['reward_time'];
                        }
                    }
                ?>
                </span>
                <br />
                <?php 
                    if($item['bid_vpoint'] < $item['price_max'] ) {
                        $time_end = $item['bid_end'];
                        $bidend_type = "Hết phiên đấu giá";
                    } else {
                        $time_end = $item['bid_time'];
                        $bidend_type = "Mua đứt";
                    }
                     
                ?>
                Item bán lúc : <strong><?php echo $time_end; ?></strong><br />
                Kết thúc bán Item theo : <strong><?php echo $bidend_type; ?></strong>
                <span id="notice_bidding_view_<?php echo $item['bid_id']; ?>"></span>
                <br /><br /><br />
            </td>
        </tr>
        <?php } } else echo "<center><font color='red'><strong>Chưa tham gia mua Item</strong></font></center>"; ?>
        </tbody>
    </table>
    
        
    </div>
</div>
<?php } else include('templates/char_manager.tpl'); ?>