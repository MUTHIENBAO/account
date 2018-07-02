<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content"><?php echo $tilte; ?></h1>
        <ul class="tabs-content">
            <?php if(isset($Use_ThueTapHoa) && $Use_ThueTapHoa == 1) { ?>
            <li <? if($_GET['act']=='thue_taphoa') echo 'class="active"'; ?>><a href="#reward&act=thue_taphoa" rel="ajax">Cho Thuê tạp hoá</a></li>
            <?php } ?>
            
            <?php if($Use_ThueKiem == 1 || $Use_ThueGay == 1 || $Use_ThueCung == 1 || $Use_ThueVuKhiKhac == 1 || $Use_ThueKhien == 1) { ?>
            <li <?php if($_GET['act']=='thue_kiem' || $_GET['act']=='thue_gay' || $_GET['act']=='thue_cung' || $_GET['act']=='thue_vukhikhac' || $_GET['act']=='thue_khien') echo 'class="active"'; ?>>
                <a href="#" rel="ajax">Cho thuê Vũ khí</a>
                <div class="submenu">
                    <?php if(isset($Use_ThueKiem) && $Use_ThueKiem == 1) { ?>
                    <p <?php if($_GET['act']=='thue_kiem') echo 'class="active"'; ?>><a href="#reward&act=thue_kiem" rel="ajax" >Thuê Kiếm</a></p>
                    <?php } ?>
                    
                    <?php if(isset($Use_ThueGay) && $Use_ThueGay == 1) { ?>
                    <p <?php if($_GET['act']=='thue_gay') echo 'class="active"'; ?>><a href="#reward&act=thue_gay" rel="ajax" >Thuê Gậy Phép Thuật</a></p>
                    <?php } ?>
                    
                    <?php if(isset($Use_ThueCung) && $Use_ThueCung == 1) { ?>
                    <p <?php if($_GET['act']=='thue_cung') echo 'class="active"'; ?>><a href="#reward&act=thue_cung" rel="ajax" >Thuê Cung - Nỏ</a></p>
                    <?php } ?>
                    
                    <?php if(isset($Use_ThueVuKhiKhac) && $Use_ThueVuKhiKhac == 1) { ?>
                    <p <?php if($_GET['act']=='thue_vukhikhac') echo 'class="active"'; ?>><a href="#reward&act=thue_vukhikhac" rel="ajax" >Thuê Vũ khí khác</a></p>
                    <?php } ?>
                    
                    <?php if(isset($Use_ThueKhien) && $Use_ThueKhien == 1) { ?>
                    <p <?php if($_GET['act']=='thue_khien') echo 'class="active"'; ?>><a href="#reward&act=thue_khien" rel="ajax" >Thuê Khiên</a></p>
                    <?php } ?>
                </div>
            </li>
            <?php } ?>
            
            <?php if($Use_ThueMu == 1 || $Use_ThueAo == 1 || $Use_ThueQuan == 1 || $Use_ThueTay == 1 || $Use_ThueChan == 1) { ?>
            <li <?php if($_GET['act']=='thue_mu' || $_GET['act']=='thue_ao' || $_GET['act']=='thue_quan' || $_GET['act']=='thue_tay' || $_GET['act']=='thue_chan') echo 'class="active"'; ?>>
                <a href="#" rel="ajax">Cho thuê SET đồ</a>
                <div class="submenu">
                    <?php if(isset($Use_ThueMu) && $Use_ThueMu == 1) { ?>
                    <p <?php if($_GET['act']=='thue_mu') echo 'class="active"'; ?>><a href="#reward&act=thue_mu" rel="ajax" >Thuê Mũ</a></p>
                    <?php } ?>
                    
                    <?php if(isset($Use_ThueAo) && $Use_ThueAo == 1) { ?>
                    <p <?php if($_GET['act']=='thue_ao') echo 'class="active"'; ?>><a href="#reward&act=thue_ao" rel="ajax" >Thuê Áo</a></p>
                    <?php } ?>
                    
                    <?php if(isset($Use_ThueQuan) && $Use_ThueQuan == 1) { ?>
                    <p <?php if($_GET['act']=='thue_quan') echo 'class="active"'; ?>><a href="#reward&act=thue_quan" rel="ajax" >Thuê Quần</a></p>
                    <?php } ?>
                    
                    <?php if(isset($Use_ThueTay) && $Use_ThueTay == 1) { ?>
                    <p <?php if($_GET['act']=='thue_tay') echo 'class="active"'; ?>><a href="#reward&act=thue_tay" rel="ajax" >Thuê Găng Tay</a></p>
                    <?php } ?>
                    
                    <?php if(isset($Use_ThueChan) && $Use_ThueChan == 1) { ?>
                    <p <?php if($_GET['act']=='thue_chan') echo 'class="active"'; ?>><a href="#reward&act=thue_chan" rel="ajax" >Thuê Giày</a></p>
                    <?php } ?>
                </div>
            </li>
            <?php } ?>
            
            <?php if(isset($Use_ThueTrangSuc) && $Use_ThueTrangSuc == 1) { ?>
            <li <? if($_GET['act']=='thue_trangsuc') echo 'class="active"'; ?>><a href="#reward&act=thue_trangsuc" rel="ajax">Thuê Trang Sức</a></li>
            <?php } ?>
            
            <?php if(isset($Use_ThueCanh) && $Use_ThueCanh == 1) { ?>
            <li <? if($_GET['act']=='thue_canh') echo 'class="active"'; ?>><a href="#reward&act=thue_canh" rel="ajax">Thuê Cánh</a></li>
            <?php } ?>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">
        <input type="hidden" id="reward_type" value="<?php echo $reward_type; ?>" />
        <ul class="list-shop">
<?php
    if(count($item_arr) > 0) {
        foreach($item_arr as $item_code => $item) {
            if($item['stat'] == 1) {
?>
            <li>
                <div class="shop-item">
                    <div class="image-item" title="ITEM: <?php echo $item['item_name']; ?>">
                        <img src="items/<?php echo $item['img']; ?>.gif?1" />
                        <p class="sale">0%</p>
                    </div>
                    <div class="info-item">
                        <p class="name" title="<?php echo $item['item_name']; ?>"><?php echo $item['item_name']; ?></p>
                        <div class="info-row-1">
                            <div class="block-show">
                                <div class="list-price">
                                    <?
                                    if(!isset($item['money_type']) || !is_array($item['money_type'])) echo "<span class='shop-bank-icon bank-icon bank-g' title='GCent'></span><span class='shop-bank-icon bank-icon bank-g2' title='GCent KM'></span>";
                                    else {
                                        if($item['money_type'][1] == 1) echo "<span class='shop-bank-icon bank-icon bank-v' title='VCent'></span>";
                                        if($item['money_type'][2] == 1) echo "<span class='shop-bank-icon bank-icon bank-v2' title='VCent Event'></span>";
                                        if($item['money_type'][3] == 1) echo "<span class='shop-bank-icon bank-icon bank-g' title='GCent'></span>";
                                        if($item['money_type'][4] == 1) echo "<span class='shop-bank-icon bank-icon bank-g2' title='GCent KM'></span>";
                                    }
                                    ?>
                                </div>
                            </div>
                            <div class="block-hide">
                                <div class="buy">
                                    <div class="select-number">
                                        
                                    </div>
                                    <div class="button-buy">
                                        <a href="#itemreward_active_<?php echo $item_code; ?>" class="btn btn-green itemreward_up" id="btn_itemreward_up_<?php echo $item_code; ?>" vitri="<?php echo $item_code; ?>">Thuê</a>
                                    </div>
                                    <div style="display:none">
                                        <div id="itemreward_active_<?php echo $item_code; ?>" style="width: 600px; height: 500px;">
                                            <?php if($item['exl_type'] < 99) { ?>
                                            
                                            <?php if($item['exl_type'] != 6) { ?>
                                            May Mắn: <input type="checkbox" id="luck_<?php echo $item_code; ?>" vitri="<?php echo $item_code; ?>" class="reward_luck" /> &nbsp;&nbsp;&nbsp;
                                            <?php } ?>
                                            
                                            Cấp Độ :
                                                <select id="level_<?php echo $item_code; ?>" vitri="<?php echo $item_code; ?>" class="reward_lvl">
                                                    <?php
                                                        if(!isset($item_lv_max)) $item_lv_max = 15;
                                                        for($i=0; $i<=$item_lv_max; $i++) {
                                                            echo "<option value='$i'>+ ". $i ."</option>";
                                                        }
                                                    ?>
                                                </select>
                                            &nbsp;&nbsp;&nbsp;
                                            
                                            <?php echo $item['option_type']; ?> 
                                                <select id="option_<?php echo $item_code; ?>" vitri="<?php echo $item_code; ?>" class="reward_op">
                                                    <?php
                                                        if(strlen($item['option_type']) > 0) {
                                                            for($i=0; $i<=7; $i++) {
                                                                echo "<option value='$i'> ". $item['option_mul']*$i ." ". $item['option_bonus'] ."</option>";
                                                            }
                                                        }
                                                    ?>
                                                </select>
                                            <br />
                                            <strong>Dòng Hoàn Hảo</strong> :<br />
                                                <table align="center" border="0">
                                                    <?php
                                                        foreach($item['exl'] as $key => $val) {
                                                            if($item['exl_use'][$key] == 1) {
                                                    ?>
                                                    <tr>
                                                        <td align="right"><?php echo $val; ?> </td>
                                                        <td><input type="checkbox" id="exl_<?php echo $item_code; ?>_<?php echo $key; ?>" vitri="<?php echo $item_code; ?>" class="reward_exl" /></td>
                                                    </tr>
                                                    <?php
                                                        } }
                                                    ?>
                                                </table>
                                            <?php } ?>
                                            <strong>Thời gian Thuê</strong> : 
                                                <select id="rewardday_<?php echo $item_code; ?>" vitri="<?php echo $item_code; ?>" class="reward_day">
                                                    <option value=''>- Chọn thời gian Thuê -</option>
                                                    <?php
                                                        if(is_array($use_day)) {
                                                            foreach($use_day as $use_day_k => $use_day_v) {
                                                                if($use_day_v == 1) {
                                                                    echo "<option value='$use_day_k'>$use_day_k Ngày</option>";
                                                                }
                                                            }
                                                        }
                                                    ?>
                                                </select>
                                            
                                            <div id="notice_reward_view_<?php echo $item_code; ?>" class="info_noimg">
                                                <table width="550" border="1" cellpadding="1" cellspacing="1">
                                                    <tr>
                                                        <td>
                                                            <center><strong>Thông tin Item thuê</strong>  <span id="btn_reward_waiting_<?php echo $item_code; ?>"></span> </center> <br />
                                                            <div id="notice_reward_info_<?php echo $item_code; ?>"></div>
                                                            <center>
                                                            <input type="button" class="btn_reward" id="btn_reward_<?php echo $item_code; ?>" vitri="<?php echo $item_code; ?>" value="Thuê <?php echo $item['item_name']; ?>" /> <span id="btn_reward_waiting_<?php echo $item_code; ?>"></span>
                                                            <div id="reward_success_<?php echo $item_code; ?>"></div>
                                                            </center>
                                                        </td>
                                                    </tr>
                                                    
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="webshop_success_<?php echo $item_code; ?>"></div>
                                </div>
                            </div>
                        </div>
                        <div class="info-row-2">
                            <div class="price-ct">
                                <div class="num-price">&nbsp;<? echo number_format($item['price'], 0, ',', '.'); ?></div>
                                <?php if(count($item['money_type']) > 1) { ?>
                                <div class="select-money">
                                    <div class="select-box">
                                        <?php
                                        $icon_money = '';
                                        $select = "<select id='money_type_". $item_code ."' >";
                                        foreach($item['money_type'] as $k => $v) {
                                            if($v == 1) {
                                                switch ($k){
                                                    case 2:
                                                        $money_type_name = 'Vcent Event';
                                                    break;

                                                    case 3:
                                                        $money_type_name = 'Gcent';
                                                    break;

                                                    case 4:
                                                        $money_type_name = 'Gcent KM';
                                                    break;

                                                    default :
                                                        $money_type_name = 'Vcent';
                                                }
                                                $select .= "<option value='$k'>$money_type_name</option>";
                                            }
                                        }
                                        $select .= "</select>";

                                        echo $select;
                                        ?>
                                    </div>
                                </div>
                                <?php } else {
                                        if($item['money_type'][1] == 1) echo "<input type='hidden' id='money_type_". $item_code ."' value='1' />";
                                        elseif($item['money_type'][2] == 1) echo "<input type='hidden' id='money_type_". $item_code ."' value='2' />";
                                        elseif($item['money_type'][3] == 1) echo "<input type='hidden' id='money_type_". $item_code ."' value='3' />";
                                        elseif($item['money_type'][4] == 1) echo "<input type='hidden' id='money_type_". $item_code ."' value='4' />";
                                    } 
                                ?>

                            </div>
                        </div>
                    </div>
                </div>
            </li>
<?php } } } else echo "<center><font color='red'><strong>Không có Item trong cửa hàng</strong></font></center>"; ?>
        </ul>
    </div>
</div>

<?php } else include('templates/char_manager.tpl'); ?>