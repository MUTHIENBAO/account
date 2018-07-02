<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Event >> <a href="#event&act=event2" rel="ajax"><?php echo $event2_name; ?></a></h1>
    </div>
</div>
<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Đặt Item cần đổi Event vào Hòm Đồ chung.</li>
        </ul>
    </div>
</div>
<div class="primary-block out-top-20">
    
<?php 
    if(isset($error_module)) echo "<div class='form-error'>$error_module</div>";
?>
    
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Đổi Event</span></h1>
    </div>
    <ul class="menu-main-tabs">
        <li class="main-tab active"><a href="javascript:;">Loại 1 <?php if($dadoi_arr['tylemax']['type1'] > 0) echo '<span class="badge" id="tab_event2_type1">'. $dadoi_arr['tylemax']['type1'] .'</span>'; ?></a></li>
        <li class="main-tab"><a href="javascript:;">Loại 2 <?php if($dadoi_arr['tylemax']['type2'] > 0) echo '<span class="badge" id="tab_event2_type2">'. $dadoi_arr['tylemax']['type2'] .'</span>'; ?></a></li>
        <li class="main-tab"><a href="javascript:;">Loại 3<?php if($dadoi_arr['tylemax']['type3'] > 0) echo '<span class="badge" id="tab_event2_type3">'. $dadoi_arr['tylemax']['type3'] .'</span>'; ?></a></li>
    </ul>
    
    <div class="in-20-xxx">
        <ul class="content-main-tabs">
            <?php
                for($tab_i=0; $tab_i<=2; $tab_i++) {
                    switch ($tab_i){ 
                    	case 0:
                            $type = 'type1';
                            $money_img = 'templates/images/icons/items/zen.png';
                            $money_des = 'ZEN trong hòm đồ chung';
                            $money_now = $zen;
                            $type_money = true;
                    	break;
                        
                        case 1:
                            $type = 'type2';
                            $money_img = '<img src="items/'. $event2_arr['item_source'][0]['img'] .'.gif" />';
                            $money_des = $event2_arr['item_source'][0]['name'];
                            $money_now = $item_source_arr[0]['slg_api'];
                            $type_money = false;
                    	break;
                    
                    	case 2:
                            $type = 'type3';
                            $money_img = array('templates/images/icons/g.png','templates/images/icons/g+.png');
                            $money_des = 'Gcent + Gcent Khuyến mãi';
                            $money_now = $_SESSION['acc_gcoin'] + $_SESSION['acc_gcoin_km'];
                            $type_money = true;
                    	break;
                    }
                    
                    $max_all = $event2_arr[$type]['all_slg'];
                    $max_daily = $event2_arr[$type]['daily_slg'];
                    
                    if($accept == 1) {
                        $btn_disable = "";
                        if($dadoi_arr['tylemax'][$type] <= 0) {
                            $btn_disable = "disabled='disabled'";
                        }
                    }
            ?>
            <li class="content-m-tab <?php if($tab_i == 0) echo 'active' ?>">
                <div class="form-2">
                    <div class="form-row">
                        <div class="form-col-1">
                            <span>Tổng đã đổi </span>
                        </div>
                        <div class="form-col-2">
                            <span class="tag tag-red"><b><span id="event2_dadoi_all_<?php echo $type; ?>"><?php echo number_format($dadoi_arr['all'][$type], 0, ',', '.'); ?></span></b> / <?php echo $max_all; ?></span>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-col-1">
                            <span>Đã đổi trong ngày </span>
                        </div>
                        <div class="form-col-2_extra">
                            <span class="tag tag-red"><b><span id="event2_dadoi_daily_all_<?php echo $type; ?>"><?php echo number_format($dadoi_arr['daily'][$type]['all'], 0, ',', '.'); ?></span> / <?php echo $max_daily; ?></b></span> (3 màu : <span class="tag tag-red"  id="event2_dadoi_daily_3_<?php echo $type; ?>"><?php echo number_format($dadoi_arr['daily'][$type][3], 0, ',', '.'); ?></span> - 2 màu : <span class="tag tag-red" id="event2_dadoi_daily_2_<?php echo $type; ?>"><?php echo number_format($dadoi_arr['daily'][$type][2], 0, ',', '.'); ?></span> - 1 màu : <span class="tag tag-red" id="event2_dadoi_daily_1_<?php echo $type; ?>"><?php echo number_format($dadoi_arr['daily'][$type][1], 0, ',', '.'); ?></span>)
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-col-1">
                            <span>Thoát Game </span>
                        </div>
                        <div class="form-col-2">
                            <?php echo $online; ?>
                        </div>
                    </div>
                </div>
                
                <div class="content-m-l">
                    <div class="block-striped">
                    <?php
                    for($phuongthuc_i = 3; $phuongthuc_i >= 1; $phuongthuc_i--) {
                            switch ($phuongthuc_i){
                                case 1:
                                    $item_source_view_arr = array(1);
                                    $type_k = 0;
                                    $money_require = $event2_arr[$type][$type_k]['money'];
                                break;

                                case 2:
                                    $item_source_view_arr = array(1,2);
                                    $type_k = 1;
                                    $money_require = $event2_arr[$type][$type_k]['money'];
                                break;

                                case 3:
                                    $item_source_view_arr = array(1,2,3);
                                    $type_k = 2;
                                    $money_require = $event2_arr[$type][$type_k]['money'];
                                break;
                            }
                            
                            $phuongthuc_disable_flag = 0;
                            if(strlen($btn_disable) == 0) {
                                foreach($item_source_view_arr as $v) {
                                    if($item_source_arr[$v]['slg_api'] <= 0) {
                                        $btn_disable = "disabled='disabled'";
                                        $phuongthuc_disable_flag = 1;
                                        break;
                                    }
                                }
                            }
                            if($phuongthuc_disable_flag == 0) {
                                if($money_now < $money_require) {
                                    $btn_disable = "disabled='disabled'";
                                    $phuongthuc_disable_flag = 1;
                                }
                            }
                    ?>
                        <div class="trader-block <?php if(in_array($phuongthuc_i, array(2))) echo 'row-strip'; ?>"
                        style="<?php
                        if( $phuongthuc_i==2 ) echo 'margin-top: 10px;';
                        if( $phuongthuc_i==2 ) echo 'margin-bottom: 10px;';
                        ?>">
                            <div class="traider-guide">
                                <button class="btn btn-green event2_doi btn_event2_doi_<?php echo $type; ?>" <?php echo $btn_disable; ?> id="btn_event2_doi_<?php echo $type .'_'. $phuongthuc_i; ?>" event_type="<?php echo $type; ?>" phuongthuc="<?php echo $phuongthuc_i; ?>">Đổi Event <span id="loading_btn_event2_doi_<?php echo $type .'_'. $phuongthuc_i; ?>"></span> </button>
                            </div>

                            <div class="trader-condition tdr-col">
                                <div class="tdr-content" style="margin-bottom: 10px;">
                                    <p class="txt-tdr">Danh sách Item đổi Event</p>
                                    <ul class="tdr-list-item">
                                        <?php
                                        foreach($item_source_view_arr as $i) {
                                            $class_disable = '';
                                            $des_disable = '';
                                            if($item_source_arr[$i]['slg_api'] == 0) {
                                                $class_disable = 'disabled';
                                                $des_disable = '<p><font color="red">Thiếu Nguyên Liệu</font></p>';
                                            } 
                                            
                                            echo '<li class="tdr-item '. $class_disable .' item_source_'. $i .'" style="background-image: url(items/'. $event2_arr['item_source'][$i]['img'] .'.gif)">';
                                            //echo '<div class="tdr-img"><img src="items/'. $event2_arr['item_source'][$i]['img'] .'.gif" /></div>';
                                            echo '<span class="tdr-item-count"><span class="item_source_'. $i .'_slg">'. $item_source_arr[$i]['slg_api'] .'</span>/1</span>';
                                            echo '<div class="tdr-item-info">';
                                            echo '<p>'.$event2_arr['item_source'][$i]['name'].'</p>';
                                            echo $des_disable;
                                            echo '</div>';
                                            echo '</li>';
                                        }
                                        
                                        $class_disable = '';
                                        $des_disable = '';
                                        if($money_now < $money_require) {
                                            $class_disable = 'disabled';
                                            $des_disable = '<p><font color="red">Thiếu Nguyên Liệu</font></p>';
                                        }
                                        if($type_money){
                                            echo '<li class="tdr-item tdr-item-z '. $class_disable .'">';
                                            if(gettype($money_img)=='array'){
                                                foreach($money_img as $img){
                                                    echo '<div class="tdr-img tdr-multi-img">';
                                                    echo '<img src="'.$img.'" />';
                                                    echo '</div>>';
                                                }
                                                $class_money_now = 'event2_gc';
                                            } else {
                                                echo '<div class="tdr-img" style="background-image: url('. $money_img.'); background-repeat: no-repeat; background-position: 50% 40%;"></div>';
                                                $class_money_now = 'event2_zen';
                                            }

                                            echo '<div class="tdr-item-z"><span class="'. $class_money_now .'">'. number_format($money_now, 0, ',', '.') .'</span> / '. number_format($money_require, 0, ',', '.') .'</div>';
                                            echo '<div class="tdr-item-info">';
                                            echo '<p>'. $money_des .'</p>';
                                            echo $des_disable;
                                            echo '</div>';
                                            echo '</li>';

                                        } else {
                                            echo '<li class="tdr-item '. $class_disable .' item_source_0">';
                                            echo '<div class="tdr-img">'. $money_img.'</div>';
                                            echo '<span class="tdr-item-count"><span class="item_source_0_slg">'. number_format($money_now, 0, ',', '.') .'</span> / '. number_format($money_require, 0, ',', '.') .'</span>';
                                            echo '<div class="tdr-item-info">';
                                            echo '<p>'. $money_des .'</p>';
                                            echo $des_disable;
                                            echo '</div>';
                                            echo '</li>';
                                        }

                                        ?>

                                    </ul>

                                </div>
                            </div>
                            <div class="trader-result tdr-col">
                                <div class="tdr-content">
                                    <p class="txt-tdr">Phần thưởng Event</p>
                                    <ul class="tdr-list-item">
                                        <?php
                                        foreach($event2_arr[$type][$type_k] as $k => $v) {
                                            if($k != 'money' && $v > 0) {
                                            switch ($k){
                                            case 'gc_extra':
                                            $img = 'templates/images/icons/g+.png';
                                            $item_des = 'Gcent Khuyến mại';
                                            break;
    
                                            case 'vc_extra':
                                            $img = 'templates/images/icons/v+.png';
                                            $item_des = 'Vcent Event';
                                            break;
    
                                            case 'pp':
                                            $img = 'templates/images/icons/p.png';
                                            $item_des = 'PPoint';
                                            break;
    
                                            case 'pp_extra':
                                            $img = 'templates/images/icons/p+.png';
                                            $item_des = 'PPoint+';
                                            break;
    
                                            case 'pcp':
                                            $img = 'templates/images/icons/pc-point.png';
                                            $item_des = 'PCPoint';
                                            break;
    
                                            case 'wc':
                                            $img = 'templates/images/icons/w.png';
                                            $item_des = 'WCoin';
                                            break;
    
                                            case 'chao':
                                            $img = 'templates/images/icons/items/chaos.png';
                                            $item_des = 'Ngọc Hỗn Nguyên ngân hàng';
                                            break;
    
                                            case 'cre':
                                            $img = 'templates/images/icons/items/creation.png';
                                            $item_des = 'Ngọc Sáng Tạo ngân hàng';
                                            break;
    
                                            case 'blue':
                                            $img = 'templates/images/icons/items/blue.png';
                                            $item_des = 'Lông Vũ ngân hàng';
                                            break;
    
                                            case 'exp':
                                            $img = 'templates/images/icons/exp.png';
                                            $item_des = 'Bùa Exp';
                                            break;
    
                                            case 'pmaster':
                                            $img = 'templates/images/icons/skill-master-point.png';
                                            $item_des = 'Skill Point Master';
                                            break;
                                            }
                                            echo '<li class="tdr-item">';
                                                echo '<div class="tdr-img"><img src="'. $img .'" /></div>';
                                                echo '<span class="tdr-item-count">'. $v .'</span>';
                                                echo '<div class="tdr-item-info">';
                                                    echo '<p>'. $item_des .'</p>';
                                                    echo '</div>';
                                                echo '</li>';
                                            }
                                        }

                                        ?>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <?php
                            if($phuongthuc_disable_flag == 1) $btn_disable = "";
                        }
                        ?>
                    </div><!-- /.block-striped -->
                </div>
                <div class="content-m-r">
                    <div class="stage-menu">
                        <ul class="priority-block" style="border: none;">
                            <li title="Menu điều hướng sự kiện" class="ui-tooltipster"><span class="glyphicon glyphicon-th-list"></span></li>
                            <li title="Loại <?php echo $tab_i+1; ?>. Đổi <?php echo "". $event2_arr['item_source'][1]['name'] ." + ". $event2_arr['item_source'][2]['name'] ." + ". $event2_arr['item_source'][3]['name'] .""; ?> " class="stage-m-i ui-tooltipster" data-tab="<? echo $tab_i; ?>">1</li>
                            <li title="Loại <?php echo $tab_i+1; ?>. Đổi <?php echo "". $event2_arr['item_source'][1]['name'] ." + ". $event2_arr['item_source'][2]['name'] .""; ?>" class="stage-m-i ui-tooltipster" data-tab="<? echo $tab_i; ?>">2</li>
                            <li title="Loại <?php echo $tab_i+1; ?>. Đổi <?php echo "". $event2_arr['item_source'][1]['name'] .""; ?>" class="stage-m-i ui-tooltipster" data-tab="<? echo $tab_i; ?>">3</li>
                            <!--
                            <li title="Loại <?php echo $tab_i; ?>. Đổi thưởng 4" class="stage-m-i strip ui-tooltipster" data-tab="<? echo $tab_i; ?>">4</li>
                            <li title="Loại <?php echo $tab_i; ?>. Đổi thưởng 5" class="stage-m-i strip ui-tooltipster" data-tab="<? echo $tab_i; ?>">5</li>
                            <li title="Loại <?php echo $tab_i; ?>. Đổi thưởng 6" class="stage-m-i strip ui-tooltipster" data-tab="<? echo $tab_i; ?>">6</li>
                            <li title="Loại <?php echo $tab_i; ?>. Đổi thưởng 7" class="stage-m-i ui-tooltipster" data-tab="<? echo $tab_i; ?>">7</li>
                            -->
                        </ul>
                    </div>
                </div>

            </li>
            <?php
            }
            ?>
            
        </ul>
<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

                


    
        
    
        
    </div>
</div>
<?php } else include('templates/char_manager.tpl'); ?>