<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Event >> <a href="#event&act=event_itemfind&item=<?php echo $item; ?>" rel="ajax"><?php echo $itemfind_arr[$item]['name']; ?></a></h1>
    </div>
</div>
<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Đặt Item cần <?php echo $itemfind_arr[$item]['name']; ?> vào 4 dòng trên cùng Hòm Đồ.</li>
            
            <li>Tất cả Item khác không được đặt lên 4 hàng đầu.</li>
            <li><strong><font color="red">Nếu ép thất bại sẽ mất toàn bộ Nguyên Liệu</font></strong>.</li>
        </ul>
    </div>
</div>
<div class="primary-block out-top-20">
    
<?php 
    if(isset($error_module)) echo "<div class='form-error'>$error_module</div>";
?>
    <div class="in-20">

        <div class="trader-block">
            <div class="traider-guide"></div>

            <div class="trader-condition tdr-col">
                <div class="tdr-content" style="margin-bottom: 10px;">
                    <p class="txt-tdr">Danh sách Item <strong><?php echo $itemfind_arr[$item]['name']; ?></strong></p>
                    <ul class="tdr-list-item">
                        <?php
                            for($i=0; $i < $itemfind_arr[$item]['itemfind_item_source_slg']; $i++) {
                                if($itemfind_info_arr['item'][$i]['slg_api'] < $itemfind_arr[$item]['itemfind_item_source'][$i]['slg']) {
                                    $item_source_class_disable = "disabled";
                                    $item_source_accept = '<p><font color="red">Chưa đủ điều kiện</font></p>';
                                }
                                else {
                                    $item_source_class_disable = '';
                                    $item_source_accept = '<p><font color="cyan">Đủ điều kiện</font></p>';
                                }
                            echo '<li class="tdr-item '. $item_source_class_disable .'">';
                            echo '<div class="tdr-img"><img src="items/'. $itemfind_arr[$item]['itemfind_item_source'][$i]['img'] .'.gif" /></div>';
                            echo '<span class="tdr-item-count">'. $itemfind_info_arr['item'][$i]['slg_api'] .'/'. $itemfind_arr[$item]['itemfind_item_source'][$i]['slg'] .'</span>';
                            echo '<div class="tdr-item-info">';
                            echo '<p>'.$itemfind_arr[$item]['itemfind_item_source'][$i]['name'].'</p>';
                            echo $item_source_accept;
                            echo '</div>';
                            echo '</li>';
                        }
                        ?>
                    </ul>

                </div>
                <?php
                    if($itemfind_info_arr['accept'] == 0 || $_SESSION['nv_online'] == 1) {
                        if(strlen($itemfind_info_arr['err']) > 0) {
                            echo "<div class='form-error'>". $itemfind_info_arr['err'] ."<br />";
                            echo "<center>";
                            if($_SESSION['nv_online'] == 1) echo "Thoát Game : $online <br />";
                            echo "<input type='button' class='btn btn-green btn-lg' disabled='disabled' value='Tiến hành ". $itemfind_arr[$item]['name'] ."' />";
                            echo "</center></div><br />";
                        }
                    } else {
                        echo "<div class='form-success' id='trader_quay_info'>";
                        echo "Tỷ lệ quay thành công : ". $itemfind_info_arr['percent'] ."%<br />";
                        if($itemfind_info_arr['item'][0]['tyle'] > 1) {
                            echo "Số lượng Item nhận được gấp <strong>". $itemfind_info_arr['item'][0]['tyle'] ."</strong> lần<br />";
                        }
                        echo "<center><input type='button' class='btn btn-green btn-lg' id='trader_quay' item='". $item ."' tyle='". $itemfind_info_arr['item'][0]['tyle'] ."' value='Tiến hành ". $itemfind_arr[$item]['name'] ."' /></center>";
                        echo "<div id='trader_quay_msg'></div>";
                        echo "</div><br />";
                    }
                ?>
            </div>
            <div class="trader-result tdr-col">
                <div class="tdr-content">
                    <p class="txt-tdr">Phần thưởng nhận được</p>
                    <ul class="tdr-list-item">
                        <?php
                            if($itemfind_info_arr['accept'] == 1) $class_item_dis_disable = '';
                            else $class_item_dis_disable = 'disabled';
                            for($i=0; $i < count($itemfind_arr[$item]['itemfind_item_dis_info']); $i++) {

                            echo '<li class="tdr-item '. $class_item_dis_disable .'">';
                            echo '<div class="tdr-img"><img src="items/'. $itemfind_arr[$item]['itemfind_item_dis_info'][$i]['img'] .'.gif" /></div>';
                            echo '<span class="tdr-item-count">1</span>';
                            echo '<div class="tdr-item-info">';
                            echo '<p>'.$itemfind_arr[$item]['itemfind_item_dis_info'][$i]['name'].'</p>';
                            echo '</div>';
                            echo '</li>';
                        }
                        ?>
                    </ul>
                </div>
            </div>
        </div>


    
        
    
        
    </div>
</div>
<?php } else echo "Chưa chọn nhân vật"; ?>