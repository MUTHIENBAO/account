<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">SHOP Item ngân hàng</h1>
        <?php include('templates/webshop/shop_head.tpl'); ?>
    </div>
</div>
<div class="primary-block">
    <div class="in-20">
        <ul class="list-shop">
            <?php
            if(is_array($bank)) {
                foreach($bank as $k => $v) {
                    $item_status = 0;
                    $vc_status = 0;
                    $vc_plus_status = 0;
                    $gc_status = 0;
                    $gc_plus_status = 0;
                    $money_type_total = 0;
                    if($v['money'] > 0) {
                        if(is_array($v['moneytype'])) {
                            foreach($v['moneytype'] as $k2 => $v2) {
                                if($v2 == 1) {
                                    $money_type_total++;
                                    if($item_status == 0) $item_status = 1;
                                    switch ($k2){ 
                                    	case 1:
                                            $vc_status = 1;
                                    	break;
                                    
                                    	case 2:
                                            $vc_plus_status = 1;
                                    	break;
                                    
                                    	case 3:
                                            $gc_status = 1;
                                    	break;
                                    
                                    	case 4:
                                            $gc_plus_status = 1;
                                    	break;
                                    }
                                }
                            }
                        }
                    }
                    if($item_status == 1) {
                        switch ($k){ 
                        	case 0:    // Chao
                                $item_name = "Ngọc Hỗn Nguyên";
                                $item_img = "items/1201500.gif"; 
                        	break;
                        
                        	case 1:    // Cre
                                $item_name = "Ngọc Sáng Tạo";
                                $item_img = "items/1402200.gif"; 
                        	break;
                        
                        	case 2:    // Feather
                                $item_name = "Lông Vũ";
                                $item_img = "items/1301400.gif"; 
                        	break;
                        
                        	case 3:    // Heart
                                $item_name = "Trái Tim";
                                $item_img = "items/1401201.gif"; 
                        	break;
                        }
                    
                    
            ?>
            
            <li>
                <div class="shop-item">
                    <div class="image-item" title="ITEM: <?php echo $item_name; ?>">
                        <img src="<?php echo $item_img; ?>" />
                    </div>
                    <div class="info-item">
                        <p class="name" title="<?php echo $item_name; ?>"><?php echo $item_name; ?></p>
                        <div class="info-row-1">
                            <div class="block-show">
                                <div class="list-price">
                                    <?php
                                        if($vc_status == 1) echo "<span class='shop-bank-icon bank-icon bank-v' title='VCent'></span>";
                                        if($vc_plus_status == 1) echo "<span class='shop-bank-icon bank-icon bank-v2' title='VCent+'></span>";
                                        if($gc_status == 1) echo "<span class='shop-bank-icon bank-icon bank-g' title='GCent'></span>";
                                        if($gc_plus_status == 1) echo "<span class='shop-bank-icon bank-icon bank-g2' title='GCent+'></span>";
                                    ?>
                                </div>
                            </div>
                            <div class="block-hide">
                                <div class="buy">
                                    <div class="select-number">
                                        <div class="select-box">
                                            <select id="webshop_bank_slg_<?php echo $k; ?>">
                                                <?php
                                                    for($w_slg=1; $w_slg <=100; $w_slg++) {
                                                        echo "<option value='$w_slg'>$w_slg</option>";
                                                    }
                                                ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="button-buy">
                                        <button class="btn btn-green btn_webshop_bank" id="btn_webshop_bank_<?php echo $k; ?>" vitri="<?php echo $k; ?>">mua</button>
                                        <span id="btn_webshop_bank_waiting_<?php echo $k; ?>"></span>
                                    </div>
                                    <div id="webshop_bank_success_<?php echo $k; ?>"></div>
                                </div>
                            </div>
                        </div>
                        <div class="info-row-2">
                            <div class="price-ct">
                                <div class="num-price">&nbsp;<? echo number_format($v['money'], 0, ',', '.'); ?></div>
                                <?php if($money_type_total > 1) { ?>
                                <div class="select-money">
                                    <div class="select-box">
                                        <?php
                                        $icon_money = '';
                                        $select = "<select id='money_type_". $k ."' >";
                                        if($vc_status == 1) $select .= "<option value='1'>Vcent</option>";
                                        if($vc_plus_status == 1) $select .= "<option value='2'>Vcent+</option>";
                                        if($gc_status == 1) $select .= "<option value='3'>Gcent</option>";
                                        if($gc_plus_status == 1) $select .= "<option value='4'>Gcent+</option>";
                                        
                                        $select .= "</select>";

                                        echo $select;
                                        ?>
                                    </div>
                                </div>
                                <?php } else {
                                        if($vc_status == 1) echo "<input type='hidden' id='money_type_". $k ."' value='1' />";
                                        elseif($vc_plus_status == 1) echo "<input type='hidden' id='money_type_". $k ."' value='2' />";
                                        elseif($gc_status == 1) echo "<input type='hidden' id='money_type_". $k ."' value='3' />";
                                        elseif($gc_plus_status == 1) echo "<input type='hidden' id='money_type_". $k ."' value='4' />";
                                    } 
                                ?>

                            </div>
                        </div>
                    </div>
                </div>
            </li>
            <?php
                    }
                }
            }
            ?>
        </ul>
    </div>
</div>
<?php } else include('templates/char_manager.tpl'); ?>