<div class="ModuleManage">
    <h3 class="TitleModule">Tiền tệ</h3>
    
    <div class="content">
    
    <div class="menulist">
        <a href="#tiente&act=gcoin2vpoint" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Đổi Gcent sang Vcent
    		<span></span></p>
    	</a>
    </div>
    
<?php if (isset($Use_Vpoint2Gcoin) && $Use_Vpoint2Gcoin == 1) { ?>
    <div class="menulist">
        <a href="#tiente&act=vpoint2gcoin" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Đổi Vcent sang Gcent
    		<span></span></p>
    	</a>
    </div>
<?php } ?>

<?php if (isset($Use_Gcoin2VipMoney) && $Use_Gcoin2VipMoney == 1) { ?>
    <div class="menulist">
        <a href="#tiente&act=gcoin2vipmoney" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Đổi Gcent sang VipMoney
    		<span></span></p>
    	</a>
    </div>
<?php } ?>
    
<?php if (isset($Use_Gcoin2WCoin) && $Use_Gcoin2WCoin == 1) { ?>
    <div class="menulist">
        <a href="#tiente&act=gcoin2wcoin" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Đổi Gcent sang WCoin
    		<span></span></p>
    	</a>
    </div>
<?php } ?>

<?php if (isset($Use_Gcoin2WCoinP) && $Use_Gcoin2WCoinP == 1) { ?>
    <div class="menulist">
        <a href="#tiente&act=gcoin2wcoinp" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Đổi Gcent sang WCoinP
    		<span></span></p>
    	</a>
    </div>
<?php } ?>

<?php if (isset($Use_Gcoin2GoblinCoin) && $Use_Gcoin2GoblinCoin == 1) { ?>
    <div class="menulist">
        <a href="#tiente&act=gcoin2goblincoin" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Đổi Gcent sang GoblinCoin
    		<span></span></p>
    	</a>
    </div>
<?php } ?>

<?php if (isset($Use_Vpoint2Cash) && $Use_Vpoint2Cash == 1) { ?>
    <div class="menulist">
        <a href="#tiente&act=vpoint2cash" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Đổi Vcent sang Cash
    		<span></span></p>
    	</a>
    </div>
<?php } ?>
		
<?php if (isset($Use_Cash2Vpoint) && $Use_Cash2Vpoint == 1) { ?>
    <div class="menulist">
        <a href="#tiente&act=cash2vpoint" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Đổi Cash sang Vcent
    		<span></span></p>
    	</a>
    </div>
<?php } ?>
		
		
    <div class="menulist">
        <a href="#tiente&act=vpoint2item" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Mua Item Vcent
    		<span>Giao dịch trong Game</span></p>
    	</a>
    </div>
    
    
    <div class="menulist">
        <a href="#tiente&act=item2vpoint" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Bán Item Vcent
    		<span>Lấy Vcent sử dụng trên Web</span></p>
    	</a>
    </div>
    
<?php if (isset($Use_IPBonus2Vpoint) && $Use_IPBonus2Vpoint == 1) { ?>
    <div class="menulist">
        <a href="#tiente&act=ipbonuspoint2vpoint" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Đổi IP Bonus Point sang Vcent
    		<span>Dành cho quán NET đăng ký IP Bonus</span></p>
    	</a>
    </div>
<?php } ?>

<?php if (isset($Use_IPBonus2PCPoint) && $Use_IPBonus2PCPoint == 1) { ?>
    <div class="menulist">
        <a href="#tiente&act=ipbonuspoint2pcpoint" rel="ajax" class="button">
    		<img src="templates/images/icons/button/icon.png" />
    		<p>Đổi IP Bonus Point sang PC Point
    		<span>Dành cho quán NET đăng ký IP Bonus</span></p>
    	</a>
    </div>
<?php } ?>
<?php include_once('config/config_spin.php');	if ($Use_costspin == 1) { ?>    <a href="#tiente&act=costspin" rel="ajax" class="cont03">		<p><img src="images/dot.png" alt="" />Mua lần quay may mắn		<span style="line-height:18px">Dùng Gcoin hoặc Vpoint</span></p>	</a><?php } ?>    
    </div>
</div>