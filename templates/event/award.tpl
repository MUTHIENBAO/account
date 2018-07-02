<?php if (isset($_SESSION[mu_nvchon])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Nhận Giải Thưởng Event</h1>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">
<?php 
    if(isset($error_module)) echo "<center><font color='red'><strong>$error_module</strong></font></center>";
?>


<center><b>Item đạt giải thưởng</b></center>


        <ul class="box-award">
            <?php
                if(count($listitem_arr) > 0) {
                foreach($listitem_arr as $item) {

            ?>

            <li class="award-item <?php if($item['status'] == 0) echo 'award-received'  ?>" id="li_award_<?php echo $item['award_id']; ?>">
                <div class="award-info">
                    <div class="info-line">
                        <div class="info-head">
                            <div class="image-head"><img src="items/<?php echo $item['item_image']; ?>.gif" /></div>
                            <div class="info-text">
                                <p class="name-item">Giải: <span><?php echo $item['award_info']; ?></span></p>
                                <?php if($item['hsd'] == 0) { ?>
                                    <span class="soluong">Số lượng: <span><?php echo $item['item_slg']; ?></span></span>
                                <?php } else { ?>
                                    <span class="soluong">Cách nhận: <span>Giao dịch với NPC <font color='yellow'><strong>ReWard</strong></font> ở SV 1-Lorencia(143,138)</span></span>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="line"></div>
                        <?php echo $item['item_info']; ?>
                    </div>
                    <div class="award-button">
                        <?php if($item['status'] == 0) { ?>
                            <span id="award_receive_<?php echo $item['award_id']; ?>">
                                <button class="btn btn-green award_receive" type="button" <? if($accept == 0) echo "disabled='disabled'"; ?> award_id="<?php echo $item['award_id']; ?>"> <?php if($accept == 0) echo "Chưa thoát Game"; else echo "Nhận Item"; ?></button>
                                <span id="loading_<?php echo $item['award_id']; ?>"></span>
                                <span id="err_<?php echo $item['award_id']; ?>"  style="color:#FF0000"></span>
                            </span>
                        <?php } else { ?>
                            <?php if($item['hsd'] == 0) { ?>
                                <span class="received">Đã nhận lúc<br /><?php echo $item['receive_time']; ?></span>
                            <?php } else { ?>
                                <span class="received">Item có thời hạn<br /><?php echo $item['hsd']; ?> ngày</span>
                            <?php } ?>
                        <?php } ?>
                    </div>
                    <div class="award-image" style="background-image: url(items/<?php echo $item['item_image']; ?>.gif)"></div>
                </div>
            </li>

            <?php } } else echo "<center><font color='red'><strong>Không có Item đạt giải Event</strong></font></center>"; ?>
        </ul>
    </div>
</div>
<?php } else include('templates/char_manager.tpl'); ?>