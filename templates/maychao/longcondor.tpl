<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Máy Chao >> <a href="#maychao&act=longcondor" rel="ajax">Ép Lông Condor</a></h1>
    </div>
</div>
<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Đặt Item cần Ép Lông Vũ Condor vào 4 dòng trên cùng Hòm Đồ.</li>
            <li><strong>Danh Sách Item Ép Lông Vũ Condor</strong>:
                <ul class="in-left-20">
                    <li>1 Ngọc Hỗn Nguyên</li>
                    <li>1 Ngọc Sáng Tạo</li>
                    <li>1 Cụm Ngọc Tâm Linh +1 (10 viên Ngọc Tâm Linh nén)</li>
                    <li>Cánh Cấp 2 +9 +Tự động hồi phục HP+1% trở lên</li>
                    <li>Item Thần +4op +7 trở lên</li>
                </ul>
            </li>
            <li><strong>Lưu ý</strong> : Tỷ lệ thành công % càng cao thì khả năng ép thành công càng cao.</li>
            <li><strong>Cách tăng tỷ lệ % khả năng ép thành công</strong>:
                <ul class="in-left-20">
                    <li>Đồ thần + càng cao thì tỷ lệ thành công % càng cao</li>
                    <li>Có thể sử dụng nhiều đồ Thần để tăng % ép thành công</li>
                </ul>
            </li>
            <li>Tất cả Item không sử dụng ép Item không được đặt lên 4 hàng đầu.</li>
        </ul>
    </div>
</div>
<div class="primary-block out-top-20">
    
<?php 
    if(isset($error_module)) echo "<div class='form-error'>$error_module</div>";
?>
    <div class="in-20">
        <center>
            <b>Danh sách Item Ép Lông Vũ Condor</b>
        </center>
        <br />

        <div class="trader-block">
            <div class="traider-guide"></div>

            <div class="trader-condition tdr-col">
                <div class="tdr-content" style="margin-bottom: 10px;">
                    <p class="txt-tdr">Danh sách Item Ép <strong>Lông Vũ Condor</strong></p>
                    <ul class="tdr-list-item">
                        <?php
                        if(count($xoaylongcondor_info_arr['item_view']) > 0) {
                            foreach($xoaylongcondor_info_arr['item_view'] as $item){
                                
                                echo '<li class="tdr-item">';
                                echo '<div class="tdr-img"><img src="items/'. $item['img'] .'.gif" /></div>';
                                echo '<div class="tdr-item-info">';
                                echo '<p>'.$item['info'].'</p>';
                                echo '</div>';
                                echo '</li>';
                            }
                        }
                        
                        for($i=0; $i<=4; $i++) {
                            if($xoaylongcondor_info_arr['item'][$i]['check'] == 0) {
                                switch ($i){ 
                                	case 0:
                                        $item_name = "Ngọc Hỗn Nguyên";
                                        $img = "<img src='items/1201500.gif' />";
                                	break;
                                
                                	case 1:
                                        $item_name = "Ngọc Sáng Tạo";
                                        $img = "<img src='items/1402200.gif' />";
                                	break;
                                
                                	case 2:
                                        $item_name = "Cụm Ngọc Tâm Linh +1";
                                        $img = "<img src='items/1203100.gif' />";
                                	break;
                                    
                                    case 3:
                                        $item_name = "Cánh Cấp 2 +9 +Tự động hồi phục HP+1% trở lên";
                                        $img = "Wing 2";
                                	break;
                                    
                                    case 4:
                                        $item_name = "Item Thần +7 +4op trở lên";
                                        $img = "Item Thần";
                                	break;
                                }
                                echo '<li class="tdr-item disabled">';
                                echo '<div class="tdr-img">'. $img .'</div>';
                                echo '<div class="tdr-item-info">';
                                echo '<p>'. $item_name .'</p><p><font color="red">Chưa đủ điều kiện</font></p>';
                                echo '</div>';
                                echo '</li>';
                            }
                        }
                        ?>
                    </ul>

                </div>
                <!-- chu thichs -->
                <?php
                    if($xoaylongcondor_info_arr['accept'] == 0 || $_SESSION['nv_online'] == 1) {
                        echo "<div class='form-error'>";
                        if(strlen($xoaylongcondor_info_arr['err']) > 0) {
                            echo $xoaylongcondor_info_arr['err'] ."<br />";
                            
                        }
                        if($_SESSION['nv_online'] == 1) echo "Thoát Game : $online <br />";
                        echo "<input type='button' class='btn btn-green btn-lg' disabled='disabled' value='Tiến hành Quay Lông Vũ Condor' /></center>";
                        echo "</div><br />";
                    } else {
                        echo "<div class='form-success' id='xoay_longcondor_info'>";
                        echo "<center>Tỷ lệ quay thành công : <font size='6'>". $xoaylongcondor_info_arr['percent'] ."%</font><br /><br />";
                        echo "<input type='button' class='btn btn-green btn-lg' id='xoay_longcondor' value='Tiến hành Quay Lông Vũ Condor' /></center>";
                        echo "<div id='xoay_longcondor_msg'></div>";
                        echo "</div><br />";
                    }
                ?>


            </div>
            <div class="trader-result tdr-col">
                <div class="tdr-content">
                    <p class="txt-tdr">Item nhận được <strong>Lông vũ Condor</strong></p>
                    <ul class="tdr-list-item">
                        <?php if($xoaylongcondor_info_arr['accept'] == 0 || $_SESSION['nv_online'] == 1) $long_condor_disabled = 'disabled'; ?>
                        <li class="tdr-item <?php echo $long_condor_disabled; ?>">
                            <div class="tdr-img"><img src="items/1305300.gif" /></div>
                                <span class="tdr-item-count">1</span>
                                <div class="tdr-item-info">
                                <p>Lông vũ Condor</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>







    
        
    </div>
</div>
<?php } ?>