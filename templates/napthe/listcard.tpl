<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Nạp thẻ</h1>
        <ul class="tabs-content">
            <li><a href="#napthe" rel="ajax">Nạp thẻ</a></li>
            <li class="active"><a href="#napthe&act=listcard" rel="ajax">Danh sách thẻ đã nạp</a></li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Nạp thẻ</span></h1>
    </div>
    <div class="in-20">
            <form id="reset" name="reset" method="post" action="index.php?mod=napthe&act=listcard" style="text-align: center;">
                <input type="hidden" name="action" value="listcard" />
                    <center>
                        <button class="btn btn-green btn-lg" type="submit" name="Submit">Xem danh sách thẻ nạp</button>
                    </center>
            </form>

<?php if(isset($accept) && $accept == 1) { ?>
        <table class="table table-blue table-border-1 table-text-center">
		  <tr bgcolor="#FFFFFF">
		    <th scope="col" align="center">#</td>
			<th scope="col" align="center">Loại thẻ</td>
			<th scope="col" align="center">Mã thẻ</td>
			<th scope="col" align="center">Serial</td>
			<th scope="col" align="center">Ngày nạp</td>
			<th scope="col" align="center">Tình trạng</td>
		  </tr>
	<?php for($i=0;$i<$stt;$i++) { ?>		  
		  <tr bgcolor="#FFFFFF">
		    <td align="center"><?php echo $cardphone[$i]['stt']; ?></td>
			<td align="center"><?php echo $cardphone[$i]['card_type']; ?></td>
			<td align="center"><?php echo $cardphone[$i]['card_num']; ?></td>
			<td align="center"><?php echo $cardphone[$i]['card_serial']; ?></td>
			<td align="center"><?php echo $cardphone[$i]['card_time']; ?></td>
			<td align="center"><?php echo $cardphone[$i]['card_status']; ?></td>
		  </tr>
	<?php } ?>		  
	</table>
<?php } ?>
        
    </div>
</div>