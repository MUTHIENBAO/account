<ul class="tabs-content">
    <?php if($Use_ShopTapHoa == 1 || $Use_ShopVeEvent == 1 || $Use_ShopBank == 1) { ?>
    <li <?php if(in_array($_GET['act'], array('shop_taphoa', 'shop_event', 'shop_bank'))) echo 'class="active"'; ?>>
        <a href="#webshop&act=shop_taphoa" rel="ajax">Shop Tạp Hóa</a>
        <div class="submenu">
            <?php if($Use_ShopVeEvent == 1) { ?>
            <p <?php if($_GET['act']=='shop_event') echo 'class="active"'; ?>><a href="#webshop&act=shop_event" rel="ajax" >Shop Vé Event</a></p>
            <?php } ?>
            
            <?php if($Use_ShopBank == 1) { ?>
            <p <?php if($_GET['act']=='shop_bank') echo 'class="active"'; ?>><a href="#webshop&act=shop_bank" rel="ajax" >Shop Item Ngân hàng</a></p>
            <?php } ?>
        </div>
    </li>
    <?php } ?>
    
    <?php if( (isset($Use_ShopKiem) && $Use_ShopKiem == 1) || (isset($Use_ShopGay) && $Use_ShopGay == 1) || (isset($Use_ShopCung) && $Use_ShopCung == 1) || (isset($Use_ShopVuKhiKhac) && $Use_ShopVuKhiKhac == 1) ) { ?>
    <li <?php if(in_array($_GET['act'], array('shop_kiem', 'shop_gay', 'shop_cung', 'shop_vukhikhac'))) echo 'class="active"'; ?>>
        <a href="javascript:void(0);">Shop Vũ Khí</a>
        <div class="submenu">
            <?php if (isset($Use_ShopKiem) && $Use_ShopKiem == 1) { ?>
            <p <?php if($_GET['act']=='shop_kiem') echo 'class="active"'; ?>><a href="#webshop&act=shop_kiem" rel="ajax" >Shop Kiếm</a></p>
            <?php } ?>
            
            <?php if (isset($Use_ShopGay) && $Use_ShopGay == 1) { ?>
            <p <?php if($_GET['act']=='shop_gay') echo 'class="active"'; ?>><a href="#webshop&act=shop_gay" rel="ajax" >Shop Gậy Phép thuật</a></p>
            <?php } ?>
                
            <?php if (isset($Use_ShopCung) && $Use_ShopCung == 1) { ?>
            <p <?php if($_GET['act']=='shop_cung') echo 'class="active"'; ?>><a href="#webshop&act=shop_cung" rel="ajax" >Shop Cung</a></p>
            <?php } ?>
                
            <?php if (isset($Use_ShopVuKhiKhac) && $Use_ShopVuKhiKhac == 1) { ?>
            <p <?php if($_GET['act']=='shop_vukhikhac') echo 'class="active"'; ?>><a href="#webshop&act=shop_vukhikhac" rel="ajax" >Shop Vũ khí khác</a></p>
            <?php } ?>
        </div>
    </li>
    <?php } ?>
    
    <?php if( (isset($Use_ShopMu) && $Use_ShopMu == 1) || (isset($Use_ShopAo) && $Use_ShopAo == 1) || (isset($Use_ShopQuan) && $Use_ShopQuan == 1) || (isset($Use_ShopTay) && $Use_ShopTay == 1) || (isset($Use_ShopChan) && $Use_ShopChan == 1) || (isset($Use_ShopKhien) && $Use_ShopKhien == 1) ) { ?>
    <li <?php if(in_array($_GET['act'], array('shop_mu', 'shop_ao', 'shop_quan', 'shop_tay', 'shop_chan', 'shop_khien'))) echo 'class="active"'; ?>>
        <a href="javascript:void(0);">Shop Giáp - Khiên</a>
        <div class="submenu">
            <?php if (isset($Use_ShopMu) && $Use_ShopMu == 1) { ?>
            <p <?php if($_GET['act']=='shop_mu') echo 'class="active"'; ?>><a href="#webshop&act=shop_mu" rel="ajax" >Shop Mũ</a></p>
            <?php } ?>
            
            <?php if (isset($Use_ShopAo) && $Use_ShopAo == 1) { ?>
            <p <?php if($_GET['act']=='shop_ao') echo 'class="active"'; ?>><a href="#webshop&act=shop_ao" rel="ajax" >Shop Áo</a></p>
            <?php } ?>
            
            <?php if (isset($Use_ShopQuan) && $Use_ShopQuan == 1) { ?>
            <p <?php if($_GET['act']=='shop_quan') echo 'class="active"'; ?>><a href="#webshop&act=shop_quan" rel="ajax" >Shop Quần</a></p>
            <?php } ?>
            
            <?php if (isset($Use_ShopTay) && $Use_ShopTay == 1) { ?>
            <p <?php if($_GET['act']=='shop_tay') echo 'class="active"'; ?>><a href="#webshop&act=shop_tay" rel="ajax" >Shop Găng tay</a></p>
            <?php } ?>
            
            <?php if (isset($Use_ShopChan) && $Use_ShopChan == 1) { ?>
            <p <?php if($_GET['act']=='shop_chan') echo 'class="active"'; ?>><a href="#webshop&act=shop_chan" rel="ajax" >Shop Giày</a></p>
            <?php } ?>
            
            <?php if (isset($Use_ShopKhien) && $Use_ShopKhien == 1) { ?>
            <p <?php if($_GET['act']=='shop_khien') echo 'class="active"'; ?>><a href="#webshop&act=shop_khien" rel="ajax" >Shop Khiên</a></p>
            <?php } ?>
        </div>
    </li>
    <?php } ?>
    
    <?php if($Use_ShopTrangSuc == 1) { ?>
    <li <?php if(in_array($_GET['act'], array('shop_trangsuc'))) echo 'class="active"'; ?>>
        <a href="#webshop&act=shop_trangsuc" rel="ajax">Shop Trang Sức</a>
    </li>
    <?php } ?>
    
    <?php if($Use_ShopCanh == 1) { ?>
    <li <?php if(in_array($_GET['act'], array('shop_canh'))) echo 'class="active"'; ?>>
        <a href="#webshop&act=shop_canh" rel="ajax">Shop Cánh</a>
    </li>
    <?php } ?>
    
    <?php if($Use_ShopTienZen == 1) { ?>
    <li <?php if(in_array($_GET['act'], array('shop_zen', 'bank2zen'))) echo 'class="active"'; ?>>
        <a href="#webshop&act=shop_zen" rel="ajax">Shop Zen</a>
        <?php if (isset($Use_Draw_Zen) && $Use_Draw_Zen == 1) { ?>
        <div class="submenu">
            <p <?php if($_GET['act']=='bank2zen') echo 'class="active"'; ?>><a href="#webshop&act=bank2zen" rel="ajax" >Rút Zen</a></p>
        </div>
        <?php } ?>
    </li>
    <?php } ?>
    
</ul>
