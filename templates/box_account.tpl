<div class="priority-block out-top-20 out-top-20 character-wrap-block">
    <div class="character-block">
        <div class="select-button-character">
            Chọn nhân vật
        </div>

        <div id="char_view">
            <?php if (isset($_SESSION['mu_nvchon'])) { ?>

            <div class="selected-character" id="reload_char">
                <div class="image-character character-<?php echo $_SESSION['nv_class']; ?>"></div>
                <div class="info-character">
                    <p class="character-name"><?php echo $_SESSION['mu_nvchon']; ?></p>
                    <div class="level">
                        Level: <?php echo $_SESSION['nv_level']; ?><br />
                        Reset: <?php echo $_SESSION['nv_reset']; ?><br />
                        Relife: <?php echo $_SESSION['nv_relife']; ?>
                    </div>
                </div>
            </div>

            <?php } else $_SESSION['mu_nvchon'] = null; ?>
        </div>

        <div class="dropdown-select">
            <div class="in-10 priority-block">
                <ul class="chars" id="character_choise">
                    <?php if ($_SESSION['nv_slg']>0) { ?><li data-id="<?php echo $_SESSION['char1'] ?>" <?php if(isset($_SESSION['mu_nvchon']) && $_SESSION['mu_nvchon']==$_SESSION['char1']) { ?> class='active' <?php } ?> > <?php echo $_SESSION['char1']; ?></li><?php } ?>
                    <?php if ($_SESSION['nv_slg']>1) { ?><li data-id="<?php echo $_SESSION['char2'] ?>" <?php if(isset($_SESSION['mu_nvchon']) && $_SESSION['mu_nvchon']==$_SESSION['char2']) { ?> class='active' <?php } ?> > <?php echo $_SESSION['char2']; ?></li><?php } ?>
                    <?php if ($_SESSION['nv_slg']>2) { ?><li data-id="<?php echo $_SESSION['char3'] ?>" <?php if(isset($_SESSION['mu_nvchon']) && $_SESSION['mu_nvchon']==$_SESSION['char3']) { ?> class='active' <?php } ?> > <?php echo $_SESSION['char3']; ?></li><?php } ?>
                    <?php if ($_SESSION['nv_slg']>3) { ?><li data-id="<?php echo $_SESSION['char4'] ?>" <?php if(isset($_SESSION['mu_nvchon']) && $_SESSION['mu_nvchon']==$_SESSION['char4']) { ?> class='active' <?php } ?> > <?php echo $_SESSION['char4']; ?></li><?php } ?>
                    <?php if ($_SESSION['nv_slg']>4) { ?><li data-id="<?php echo $_SESSION['char5'] ?>" <?php if(isset($_SESSION['mu_nvchon']) && $_SESSION['mu_nvchon']==$_SESSION['char5']) { ?> class='active' <?php } ?> > <?php echo $_SESSION['char5']; ?></li><?php } ?>
                </ul>
            </div>
        </div>

    </div>
</div>
<div class="primary-block out-top-20 out-top-20 bank-wrap-block">
    <div class="head-block">
        <h1 class="title-head">Ngân hàng</h1>
        <div class="button-head">
            <a rel="ajax" href="#char_manager&act=jewel2bank" class="btn btn-green">Gủi jewel</a> 
            <?php if(isset($Use_ShopBank) && $Use_ShopBank == 1) { ?>
            <a rel="ajax" href="#webshop&act=shop_bank" class="btn btn-green">Mua</a>
            <?php } ?>
        </div>
    </div>
    <div class="bank-right">
        <ul>
            
            <li><span class="bank-icon bank-heart" title="Trái tim"></span><span class="bank-store" id="box_acc_bank_heart"><?php echo isset($_SESSION['acc_heart']) ? $_SESSION['acc_heart'] : 0; ?></span></li>
            <li><span class="bank-icon bank-chaos" title="Chaos"></span><span class="bank-store" id="box_acc_bank_chao"><?php echo isset($_SESSION['acc_chao']) ? $_SESSION['acc_chao'] : 0; ?></span></li>
            <li><span class="bank-icon bank-creation" title="Creation"></span><span class="bank-store" id="box_acc_bank_cre"><?php echo isset($_SESSION['acc_cre']) ? $_SESSION['acc_cre'] : 0; ?></span></li>
            <li><span class="bank-icon bank-blue" title="Lông chim"></span><span class="bank-store" id="box_acc_bank_blue"><?php echo isset($_SESSION['acc_blue']) ? $_SESSION['acc_blue'] : 0; ?></span></li>
            <li><span class="bank-icon bank-zen" title="Zen"></span><span class="bank-store" id="box_acc_bank_zen"><?php echo isset($_SESSION['acc_zen']) ? number_format($_SESSION['acc_zen'], 0, ',', '.') : 0; ?></span></li>
        </ul>
    </div>
</div>
<script>
	$(document).ready(function() {
		$('[data-countdown]').each(function() {
			var $this = $(this), finalDate = $(this).data('countdown');
			$this.countdown(finalDate, function(event) {
             $this.html(event.strftime('%H:%M:%S'));
         });
		});
	});
</script>
<div class="event-countdown">
    <fieldset>
        <legend>Sự kiện trong game sắp diễn ra</legend>
        <table>
            <tbody id="event-time">
                <?php
                foreach($eventgame_show_arr as $eventgame_k => $eventgame_v) { 
                foreach($eventgame_v as $eventgame_k2 => $eventgame_v2) { 
                ?>
                <tr><td width="75" align="center"><strong><?php echo $eventgame_v2['timer_show']; ?></strong></td>
                    <td align="center"><?php echo $eventgame_v2['name']; ?></td>
                    <td width="80" align="center"><span data-countdown="<?php echo $eventgame_v2['timer']; ?>">&nbsp;</span></td></tr>                  
                    <?php } } ?>
                </tbody>
            </table>                            
        </fieldset><br />
        <fieldset>
            <legend>Kundun cập nhập <?php echo date('H:i', $data_arr['kudnun']['timecheck']); ?> (5 phút cập nhập 1 lần)</legend>
            <table>
                <tbody id="event-time">
                 <?php
                 if(is_array($data_arr['kudnun']['data'])) {
                 foreach($data_arr['kudnun']['data'] as $kundun_k => $kundun_v) { 
                 if($kundun_v['stat'] == 1) {
                 $kundun_stat = "Đang có";
             } else {
             $kundun_stat = $kundun_v['next'];
         }
         ?>
         <tr><td width="75" align="center"><strong><?php echo $kundun_v['server']; ?></strong></td>
            <td align="center"><span class="tag tag-orange"><?php echo $kundun_stat; ?></span></td>
            <?php if($kundun_v['stat'] == 0) { ?> 
            <td width="80" align="center"><span class="tag tag-red" data-countdown="<?php echo $kundun_v['date_next']; ?>">&nbsp;</span></td></tr>                  
            <?php } ?>
            <?php } } ?>
        </tbody>
    </table>
</fieldset>
</div>