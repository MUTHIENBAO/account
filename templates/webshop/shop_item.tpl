<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content"><?php echo $tilte; ?></h1>
        <?php include('templates/webshop/shop_head.tpl'); ?>
    </div>
</div>
<div class="primary-block">
    <div class="in-20">
        <input type="hidden" id="webshop_type" value="<?php echo $webshop_type; ?>" />
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
                                    <?php 
                                    if($webshop_type == 1 || $webshop_type == 15) { 
                                        if($item['money_type'][1] == 1) echo "<span class='shop-bank-icon bank-icon bank-v' title='VCent'></span>";
                                        if($item['money_type'][2] == 1) echo "<span class='shop-bank-icon bank-icon bank-v2' title='VCent+'></span>";
                                        if($item['money_type'][3] == 1) echo "<span class='shop-bank-icon bank-icon bank-g' title='GCent'></span>";
                                        if($item['money_type'][4] == 1) echo "<span class='shop-bank-icon bank-icon bank-g2' title='GCent+'></span>";
                                     } else { 
                                     ?>
                                    <span class='shop-bank-icon bank-icon bank-g' title='GCent'></span>
                                    <span class='shop-bank-icon bank-icon bank-g2' title='GCent+'></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="block-hide">
                                <div class="buy">
                                    <div class="select-number">
                                        <?php if($webshop_type == 1 || $webshop_type == 15) { ?>
                                        <div class="select-box">
                                            <select id="webshop_slg_<?php echo $item_code; ?>">
                                                <?php
                                                    for($w_slg=1; $w_slg <=10; $w_slg++) {
                                                        echo "<option value='$w_slg'>$w_slg</option>";
                                                    }
                                                ?>
                                            </select>
                                        </div>
                                        <?php } else { echo "<input type='hidden' id='webshop_slg_$item_code' value='1' />"; } ?>
                                    </div>
                                    <div class="button-buy">
                                        <?php if(in_array($webshop_type, array(1,14,15,99))) { ?>
                                        <button class="btn btn-green btn_webshop" id="btn_webshop_<?php echo $item_code; ?>" vitri="<?php echo $item_code; ?>">mua</button>
                                        <span id="btn_webshop_waiting_<?php echo $item_code; ?>"></span>
                                        <?php } else { ?>
                                        <a href="#webshop_active_<?php echo $item_code; ?>" class="btn btn-green btn_webshop_exl_up">mua</a>
                                        <?php } ?>
                                    </div>
                                    <div style="display:none">
                                        <div id="webshop_active_<?php echo $item_code; ?>" style="width: 600px; height: 500px;">
                                            <?php if($item['exl_type'] < 99) { ?>
                                            
                                            <?php if($item['exl_type'] != 6) { ?>
                                            May Mắn: <input type="checkbox" id="luck_<?php echo $item_code; ?>" vitri="<?php echo $item_code; ?>" class="webshop_exl_luck" /> &nbsp;&nbsp;&nbsp;
                                            <?php } ?>
                                            
                                            Cấp Độ :
                                                <select id="level_<?php echo $item_code; ?>" vitri="<?php echo $item_code; ?>" class="webshop_exl_lvl">
                                                    <?php
                                                        if(!isset($item_lv_max)) $item_lv_max = 15;
                                                        for($i=0; $i <= $item_lv_max; $i++) {
                                                            echo "<option value='$i'>+ ". $i ."</option>";
                                                        }
                                                    ?>
                                                </select>
                                            &nbsp;&nbsp;&nbsp;
                                            
                                            <?php echo $item['option_type']; ?> 
                                                <select id="option_<?php echo $item_code; ?>" vitri="<?php echo $item_code; ?>" class="webshop_exl_op">
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
                                                    ?>
                                                    <tr>
                                                        <td align="right"><?php echo $val; ?> </td>
                                                        <td><input type="checkbox" id="exl_<?php echo $item_code; ?>_<?php echo $key; ?>" vitri="<?php echo $item_code; ?>" class="webshop_exl_exl" /></td>
                                                    </tr>
                                                    <?php
                                                        }
                                                    ?>
                                                </table>
                                            <?php } ?>
                                            
                                            <div id="notice_webshop_exl_view_<?php echo $item_code; ?>" class="info_noimg">
                                                <table width="550" border="1" cellpadding="1" cellspacing="1">
                                                    <tr>
                                                        <td>
                                                            <center><strong>Thông tin Item mua</strong>  <span id="btn_webshop_exl_waiting_<?php echo $item_code; ?>"></span> </center> <br />
                                                            <div id="notice_webshop_exl_info_<?php echo $item_code; ?>"></div>
                                                            <center>
                                                            <input type="button" class="btn_webshop_exl" id="btn_webshop_exl_<?php echo $item_code; ?>" vitri="<?php echo $item_code; ?>" value="Mua <?php echo $item['item_name']; ?>" /> <span id="btn_webshop_exl_waiting_<?php echo $item_code; ?>"></span>
                                                            <div id="webshop_exl_success_<?php echo $item_code; ?>"></div>
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
                                
                                <?php if($webshop_type == 1 || $webshop_type == 15) { ?>
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
                                <?php } ?>
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