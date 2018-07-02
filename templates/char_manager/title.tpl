<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Danh Hiệu</h1>
    </div>
</div>

<div class=" out-top-20">
<?php
    if(is_array($title_arr)) {
        foreach($title_arr as $k1 => $v1) {
            if($k1 == 'rs') $danhieu_text = "Reset";
            elseif($k1 == 'card') $danhieu_text = "Nạp Thẻ";
            elseif($k1 == 'event') $danhieu_text = "Event";
			elseif($k1 == 'vip2') $danhieu_text = "VIP";
			elseif($k1 == 'buy') $danhieu_text = "Mua";
?>
    <table class="table table-blue table-text-center table-border-2">
        <thead>
            <tr>
                <th align="center" scope="col" colspan="5">Danh Hiệu <?php echo $danhieu_text; ?></th>
            </tr>
            <tr>
                <th align="center" scope="col">Tình Trạng</th>
                <th align="center" scope="col">Danh Hiệu</th>
				<th align="center" scope="col">Hình Ảnh</th>
                <th align="center" scope="col">Cấp Danh Hiệu</th>
               <?php if($k1 != 'vip2') { ?> <th align="center" scope="col">Điều kiện</th><? } ?>
            </tr>
        </thead>
        <tbody>
        <?php
                    if(is_array($title_arr[$k1])) {
                        foreach($v1 as $k2 => $v2) {
        ?>
            <tr>
                <td align="center" id="danhhieu_col_<?php echo $k1."_".$k2; ?>"><?php echo $v2[3]; ?></td>
                <td align="center"><?php echo $v2[2]; ?></td>
				<td align="center"><img src='templates/images/icondanhhieu/<?php echo $v2[1]; ?>.jpg' /><span></td>
                <td align="center">
                    <?php 
                        if($v2[5] == 2) echo "Cấp 2"; 
                        elseif($v2[5] == 3) echo "Cấp 3";
                        else echo "Cấp 1";
                    
                    ?>
                </td>
                <?php if($k1 != 'vip2') { ?><td align="center"><?php echo number_format($v2[0], 0, ',', '.') . $v2[4]; ?></td><? } ?>
            </tr>
        <?php
                        }
                    }
        ?>
        </tbody>
    </table>
    <br /><br />
<?php
        }
    }
?>
</div>
