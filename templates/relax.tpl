<div class="ModuleManage">
    <h3 class="TitleModule">Giải trí</h3>
    
    <div class="content">

<?php if(isset($Use_GiaiTri_Lo) && $Use_GiaiTri_Lo == 1) { ?>
    <div class="menulist">
        <a href="#relax&act=relax_lo" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Đánh Lô
    		<span>Vận may đang đỏ, chơi thôi...</span></p>
    	</a>
    </div>
<?php } ?>
<?php if(isset($Use_GiaiTri_De) && $Use_GiaiTri_De == 1) { ?>
    <div class="menulist">
        <a href="#relax&act=relax_de" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Đánh Đề
    		<span>Vận may đang đỏ, chơi thôi...</span></p>
    	</a>
    </div>
<?php } ?>

    </div>
</div>