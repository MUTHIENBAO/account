<div class="ModuleManage">
    <h3 class="TitleModule">Event - Sự kiện</h3>
    
    <div class="content">
    
    <div class="menulist">
        <a href="#event&act=award" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Nhận Giải Thưởng
    		<span>Nhận Item trao thưởng</span></p>
    	</a>
    </div>

<?php if ($hotroitem_on == 1) { ?>
    <div class="menulist">
        <a href="#event&act=itemfull" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Nhận Item FULL +15
    		<span>Nhận Item hỗ trợ FULL +15</span></p>
    	</a>
    </div>
<?php } ?>
    
<?php if ($event_epitem_on == 1) { ?>
    <div class="menulist">
        <a href="#event&act=event_epitem" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p><?php echo $event_epitem_name; ?>
    		<span></span></p>
    	</a>
    </div>
<?php } ?>


<?php 
    include('config/config_giftcode_rs.php');
    if ($giftcode_rs_use != 'none') { 
?>
    <div class="menulist">
        <a href="#event&act=giftcode_rs" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>GiftCode Reset
    		<span>GiftCode nhận khi RS</span></p>
    	</a>
    </div>
<?php } ?>


<?php 
    include('config/config_giftcode_week.php');
    if ($giftcode_week_use != 'none') { 
?>
    <div class="menulist">
        <a href="#event&act=giftcode_week" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>GiftCode Tuần
    		<span>GiftCode hàng tuần</span></p>
    	</a>
    </div>
<?php } ?>


<?php 
    include('config/config_giftcode_month.php');
    if ($giftcode_month_use != 'none') { 
?>
    <div class="menulist">
        <a href="#event&act=giftcode_month" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>GiftCode Tháng
    		<span>GiftCode hàng tháng</span></p>
    	</a>
    </div>
<?php } ?>


<?php 
    include('config/config_giftcode_tanthu.php');
    if ($giftcode_tanthu_use == 1) { 
?>
    <div class="menulist">
        <a href="#event&act=giftcode_tanthu" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>GiftCode Tân Thủ
    		<span>GiftCode 1 lần</span></p>
    	</a>
    </div>
<?php } ?>


<?php 
    if ($giftcode_rs_use != 'none' || $giftcode_week_use != 'none' || $giftcode_month_use != 'none' || $giftcode_tanthu_use == 1) { 
?>
    <div class="menulist">
        <a href="#event&act=giftcode_change" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Đổi GiftCode
    		<span>Đổi GiftCode ra Item</span></p>
    	</a>
    </div>
<?php } ?>

<?php 
    if ($giftcode_rs_use != 'none' || $giftcode_week_use != 'none' || $giftcode_month_use != 'none' || $giftcode_tanthu_use == 1) { 
?>
    <div class="menulist">
        <a href="#event&act=giftcode_history" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Lịch sử GiftCode
    		<span>Danh sách GiftCode</span></p>
    	</a>
    </div>
<?php } ?>
	
<?php if ($event_santa_ticket == 1) { ?>
    <div class="menulist">
        <a href="#event&act=santa_ticket" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Đổi vé làng Santa
    		<span>Nhận Vcent</span></p>
    	</a>
    </div>
<?php } ?>


<?php if ($event_bongda_on == 1) { ?>
    <div class="menulist">
        <a href="#event&act=event_bongda" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Dự đoán Bóng Đá
    		<span>Dự đoán kết quả trận bóng</span></p>
    	</a>
    </div>
<?php } ?>

<?php if ($event_toprs_on == 1) { ?>
    <div class="menulist">
        <a href="#event&act=event_toprs" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p><?php echo $event_toprs_name; ?>
    		<span></span></p>
    	</a>
    </div>
<?php } ?>

<?php if ($event1_on == 1) { ?>
    <div class="menulist">
        <a href="#event&act=event1" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p><?php echo $event1_name; ?>
    		<span>Event Đổi Point</span></p>
    	</a>
    </div>
<?php } ?>

<?php if ($event_toppoint_on == 1) { ?>
    <div class="menulist">
        <a href="#event&act=event_toppoint" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p><?php echo $event_toppoint_name; ?>
    		<span></span></p>
    	</a>
    </div>
<?php } ?>

<?php if ($event_goldbox_on == 1) { ?>
    <div class="menulist">
        <a href="#event&act=event_goldbox" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p><?php echo $event_goldbox_name; ?>
    		<span>Event Đổi Phúc Lợi</span></p>
    	</a>
    </div>
<?php } ?>

<?php if ($event_top_goldbox_on == 1) { ?>
    <div class="menulist">
        <a href="#event&act=event_goldbox_top" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p><?php echo $event_top_goldbox_name; ?>
    		<span>Event Đổi Phúc Lợi</span></p>
    	</a>
    </div>
<?php } ?>

<?php if ($event_topcard_on == 1) { ?>
    <div class="menulist">
        <a href="#event&act=event_topcard" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p><?php echo $event_topcard_name; ?>
    		<span></span></p>
    	</a>
    </div>
<?php } ?>
<?php     if ($Use_luckyspin == 1) { ?>    <a href="#event&act=luckyspin" rel="ajax" class="cont03">		<p><img src="images/dot.png" alt="" />Vòng quay may mắn		<span style="line-height:18px"></span></p>	</a><?php } ?>
    </div>
</div>