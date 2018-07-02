<div class="ModuleManage">
    <h3 class="TitleModule">Nạp thẻ</h3>
    
    <div class="content">
        

	<div class="menulist">
        <a href="#napthe&act=listcard" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Danh sách thẻ nạp
    		<span>Xem thẻ đã nạp</span></p>
    	</a>
    </div>
		
		
<?php if ($Use_CardGATE == 1) { ?>	
    <div class="menulist">
        <a href="#napthe&act=gate" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Nạp thẻ GATE
    		<span><?php if($khuyenmai_gate>0) echo "(Được thêm $khuyenmai_gate % Gcent)"; ?></span></p>
    	</a>
    </div>
<?php } ?>


		
<?php if ($Use_CardVTCOnline == 1) { ?>	
    <div class="menulist">
        <a href="#napthe&act=vtc" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Nạp thẻ VTC
    		<span><?php if($khuyenmai_vtc>0) echo "(Được thêm $khuyenmai_vtc % Gcent)"; ?></span></p>
    	</a>
    </div>
<?php } ?>


		
<?php if ($Use_CardViettel == 1) { ?>	
    <div class="menulist">
        <a href="#napthe&act=viettel" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Nạp thẻ Viettel
    		<span>Thẻ điện thoại Viettel</span></p>
    	</a>
    </div>
<?php } ?>


		
<?php if ($Use_CardVina == 1) { ?>	
    <div class="menulist">
        <a href="#napthe&act=vina" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Nạp thẻ VinaPhone
    		<span>Thẻ điện thoại Vinaphone</span></p>
    	</a>
    </div>
<?php } ?>


		
<?php if ($Use_CardMobi == 1) { ?>	
    <div class="menulist">
        <a href="#napthe&act=mobi" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Nạp thẻ MobiFone
    		<span>Thẻ điện thoại MobiFone</span></p>
    	</a>
    </div>
<?php } ?>

    </div>
</div>