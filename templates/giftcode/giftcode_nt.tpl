<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content"><?php echo $giftcode_nt_name; ?></h1>
    </div>
<div class="primary-block out-top-20">
    <div class="in-20">
    	<table class="table table-blue table-text-center table-border-2">
				<tr bgcolor="#FFFFFF" >
					<td align="center"><strong>STT</strong></td>
					<td align="center"><strong>Thông tin phần thưởng GiftCode Nạp Thẻ</strong></td>
				</tr>
				<?php for($i=0; $i<count($item_read); $i++) { ?>
                <tr bgcolor="#FFFFFF" >
                    <td align="center"><?php echo $i+1; ?></td>
					<td align="center"><strong><?php echo $gift_name; ?></strong></td>
				</tr>
                <?php } ?>
                <tr bgcolor="#FFFFFF" >
					<td align="justify" colspan="3">
					<center><strong>Lưu Ý</strong></center><br />
                    <strong>Điều kiện nhận được GiftCode</strong>:<br />
					
                    - <strong><font color="red"><?php if($giftcode_nt_type == 0) echo "Mỗi tài khoản chỉ được nhận GiftCode một lần duy nhất ứng với mệnh giá nạp thẻ đó"; else echo "Không giới hạn nhận GiftCode đối với mỗi mệnh giá thẻ";?></font></strong>.<br />
                    - Phần thưởng nhận được là ngẫu nhiên trong danh sách bên trên.<br />
                    - Mỗi nhân vật có thể nhận và sử dụng GiftCode Nạp Thẻ không giới hạn.<br />
                    - Không thể sử dụng GiftCode Nạp Thẻ của tài khoản này cho tài khoản khác.<br />
                    - Phần thưởng GiftCode Nạp Thẻ <strong>
                    <?php 
                        if($trade == 1) echo "Có thể giao dịch, ";
                        else echo "Không thể giao dịch, ";
                     ?>
                     <?php 
                        if($sell == 1) echo "Có thể bán SHOP, ";
                        else echo "Không thể bán SHOP, ";
                     ?>
                     <?php 
                        if($repair == 1) echo "Có thể Sửa.";
                        else echo "Không thể Sửa.";
                     ?>
                     </strong>
                     
					</td>
				</tr>
			</table>
				<br />
    	<table class="table table-blue table-text-center table-border-2">
            <tr bgcolor="#FFFFFF">
                <td colspan="2" align="center">
                	<strong>Bảng Phần Thưởng GiftCode Nạp Thẻ </strong>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td align="center"><strong>Mệnh Giá</strong></td>
                <td align="center"><strong>Phần Thưởng</strong></td>
            </tr>
			<tr bgcolor="#FFFFFF">
                <td align="center"><b>10000 VNĐ</b></td>
                <td align="center"><b><? echo $GiftCodeThe10000;?> GiftCode</b></td>
            </tr>
			<tr bgcolor="#FFFFFF">
                <td align="center"><b>20000 VNĐ</b></td>
                <td align="center"><b><? echo $GiftCodeThe20000;?> GiftCode</b></td>
            </tr>
			<tr bgcolor="#FFFFFF">
                <td align="center"><b>30000 VNĐ</b></td>
                <td align="center"><b><? echo $GiftCodeThe30000;?> GiftCode</b></td>
            </tr>
			<tr bgcolor="#FFFFFF">
                <td align="center"><b>50000 VNĐ</b></td>
                <td align="center"><b><? echo $GiftCodeThe50000;?> GiftCode</b></td>
            </tr>
			<tr bgcolor="#FFFFFF">
                <td align="center"><b>100000 VNĐ</b></td>
                <td align="center"><b><? echo $GiftCodeThe100000;?> GiftCode</b></td>
            </tr>
			<tr bgcolor="#FFFFFF">
                <td align="center"><b>200000 VNĐ</b></td>
                <td align="center"><b><? echo $GiftCodeThe200000;?> GiftCode</b></td>
            </tr>
			<tr bgcolor="#FFFFFF">
                <td align="center"><b>300000 VNĐ</b></td>
                <td align="center"><b><? echo $GiftCodeThe300000;?> GiftCode</b></td>
            </tr>
			<tr bgcolor="#FFFFFF">
                <td align="center"><b>500000 VNĐ</b></td>
                <td align="center"><b><? echo $GiftCodeThe500000;?> GiftCode</b></td>
            </tr>
			    
        </table>
</div>