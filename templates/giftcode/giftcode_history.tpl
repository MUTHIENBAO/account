<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Lịch sử GiftCode</h1>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">
<?php
    if(count($giftcode_history_arr['sms']) > 0) {
?>
		<center>
			<strong>Kích hoạt GiftCode</strong><br>
    	</center>
    		
    	<table class="table table-blue table-text-center table-border-2">
		  <tr bgcolor="#FFFFFF">
		    <th align="center" scope="col">Loại GiftCode</th>
            <th align="center" scope="col">Tạo lúc</th>
            <th align="center" scope="col">Hạn kích hoạt</th>
            <th align="center" scope="col">Tình trạng</th>
		  </tr>
<?php for($i=0;$i<count($giftcode_history_arr['sms']);$i++) { ?>
		  <tr bgcolor="#FFFFFF">
		    <td align="center"><?php echo $giftcode_history_arr['sms'][$i]['type_name']; ?></td>
		    <td align="center"><?php echo $giftcode_history_arr['sms'][$i]['time_create']; ?></td>
            <td align="center"><?php echo $giftcode_history_arr['sms'][$i]['time_exp']; ?></td>
            <td align="center"><?php echo $giftcode_history_arr['sms'][$i]['sms_cuphap']; ?></td>
		  </tr>
<?php } ?>
		</table>
        <br /><br />
<?php } ?>
        <center>
			<strong>Lịch sử GiftCode</strong><br>
    	</center>
    	<table class="table table-blue table-text-center table-border-2">
		  <tr bgcolor="#FFFFFF">
		    <th align="center" scope="col">#</th>
		    <th align="center" scope="col">GiftCode</th>
		    <th align="center" scope="col">Loại GiftCode</th>
            <th align="center" scope="col">Thời gian tạo GiftCode</th>
            <th align="center" scope="col">Tình trạng</th>
		  </tr>
<?php for($i=0;$i<count($giftcode_history_arr['giftcode']);$i++) { ?>
		  <tr bgcolor="#FFFFFF">
		    <td align="center"><?php echo $i+1; ?></td>
		    <td align="center"><?php echo $giftcode_history_arr['giftcode'][$i]['gift_code']; ?></td>
		    <td align="center"><?php echo $giftcode_history_arr['giftcode'][$i]['type_name']; ?></td>
            <td align="center"><?php echo $giftcode_history_arr['giftcode'][$i]['time_create']; ?></td>
            <td align="center"><?php echo $giftcode_history_arr['giftcode'][$i]['status_info']; ?></td>
		  </tr>
<?php } ?>
		</table>
        
    </div>
</div>