
<div class="left-content">
    <ul class="navigation">
        <?php if(isset($_SESSION['mu_username'])){ ?>
        
        
        <li class="nav-item active" menu-parent="acc_manager">
            <?php if ( (isset($Use_WareHouse_Secure) && $Use_WareHouse_Secure == 1 && $_SESSION['acc_warehouse_secure_slot'] > $_SESSION['acc_warehouse_secure_item']) || ($Use_VIP == 1 && $_SESSION['nbb_vip'] == 0)  ) $acc_note_icon = 'note-evt'; ?>
            <a class="nav-item-link" href="#acc_manager" rel="ajax" data-title="Tài khoản"><span class="menu-icon icon-account"></span><span id="acc_note" class="<?php echo $acc_note_icon; ?>"></span>Tài khoản</a>
            <ul class="nav-sub">
                <?php
                if($Use_VIP == 1) {
                    if($_SESSION['nbb_vip'] == 1) {
                        $menu_vip_style = "color: #0000FF; font-weight: bold;";
                        $menu_vip_note = "Đã Hỗ Trợ";
                    } else {
                        $menu_vip_style = "color: #FF0000; font-weight: bold;";
                        $menu_vip_note = "Chưa Hỗ Trợ";
                    }
                
                ?>
                <li class="nav-sub-item"><a href="#acc_manager&act=super" rel="ajax">Hệ thống Hỗ Trợ<span id="acc_vip" class="badge" style="<?php echo $menu_vip_style; ?>"><?php echo $menu_vip_note; ?></span></a></li>
                <?php } ?>
                
                <?php 
                    if (isset($Use_WareHouse_Secure) && $Use_WareHouse_Secure == 1) { 
                        $menu_warehouse_secure_note = "<span id='menu_warehouse_secure_item'>". $_SESSION['acc_warehouse_secure_item'] ."</span> / ". $_SESSION['acc_warehouse_secure_slot'];
                        $menu_warehouse_secure_class = "badge";
                ?>
                <li class="nav-sub-item"><a href="#acc_manager&act=warehouse_secure" rel="ajax">Rương đồ an toàn<span id="warehouse_secure_slot" class="<?php echo $menu_warehouse_secure_class; ?>"><?php echo $menu_warehouse_secure_note; ?></span></a></li>
                <?php } ?>
                <li class="nav-sub-item"><a href="#acc_manager&act=ipbonus_list" rel="ajax">IP Bonus</a></li>
                <li class="nav-sub-item"><a href="#acc_manager&act=changepassgame_info" rel="ajax">Đổi mật khẩu Game</a></li>
                <li class="nav-sub-item"><a href="#acc_manager&act=changepass1_info" rel="ajax">Đổi mật khẩu Cấp 1</a></li>
                <li class="nav-sub-item"><a href="#acc_manager&act=changepass2_info" rel="ajax">Đổi mật khẩu Cấp 2</a></li>
                <li class="nav-sub-item"><a href="#acc_manager&act=changesdt_sms" rel="ajax">Đổi số điện thoại</a></li>
                <li class="nav-sub-item"><a href="#acc_manager&act=changeemail_info" rel="ajax">Đổi email</a></li>
                <li class="nav-sub-item"><a href="#acc_manager&act=changequest" rel="ajax">Đổi câu hỏi bí mật</a></li>
                <li class="nav-sub-item"><a href="#acc_manager&act=changeans" rel="ajax">Đổi câu trả lời bí mật</a></li>
				<li class="nav-sub-item"><a href="#acc_manager&act=changesnonumb" rel="ajax">Đổi 7 số bí mật</a></li>
			<?php if(isset($Use_KichKet) && $Use_KichKet == 1) { ?>
			    <li class="nav-sub-item"><a href="#kick_ket" rel="ajax">Kích Kẹt</a></li>
			<?php } ?>     	
            </ul>
        </li>
        
        
        <li class="nav-item" menu-parent="char_manager">
            <?php
                if(isset($_SESSION['quest_daily']) && $_SESSION['quest_daily']>0) $char_note_icon = 'note-evt';
            ?>
            <a class="nav-item-link" href="javascript:void(0);" data-title="Nhân vật"><span class="menu-icon icon-character"></span><span id="char_note" class="<?php echo $char_note_icon; ?>"></span>Nhân vật</a>
            <ul class="nav-sub">
                <?php if(isset($Use_ResetVIP) && $Use_ResetVIP == 1) { ?>
                <li class="nav-sub-item"><a href="#char_manager&act=resetvip" rel="ajax">Reset nhân vật</a></li>
                <?php } else { ?>
                <li class="nav-sub-item"><a href="#char_manager&act=reset" rel="ajax">Reset nhân vật</a></li>
                <?php } ?>
               <li class="nav-sub-item"><a href="#char_manager&act=rsmaster" rel="ajax">Reset điểm Master</a></li>
				
				 <li class="nav-sub-item"><a href="#char_manager&act=relife" rel="ajax">Relife</a></li>
				
				 <li class="nav-sub-item"><a href="#char_manager&act=addpoint" rel="ajax">Cộng điểm</a></li>
				 <li class="nav-sub-item"><a href="#char_manager&act=resetpoint" rel="ajax">Tẩy điểm</a></li>
				 <li class="nav-sub-item"><a href="#char_manager&act=pk" rel="ajax">Rửa tội</a></li>
				 <li class="nav-sub-item"><a href="#char_manager&act=taytuy" rel="ajax">Tẩy Tủy</a></li>
				 <?php if (isset($Use_UyThacOnline) && $Use_UyThacOnline == 1) { ?>
                <li class="nav-sub-item"><a href="#char_manager&act=uythaconline" rel="ajax">Ủy Thác Online</a></li>
                <?php } ?>
				 <?php if (isset($Use_UyThacOffline) && $Use_UyThacOffline == 1) { ?>
                <li class="nav-sub-item"><a href="#char_manager&act=uythacoffline" rel="ajax">Ủy Thác Offline</a></li>
                <?php } ?>
                
                
                <?php 
                    if (isset($Use_QuestDaily) && $Use_QuestDaily == 1) { 
                        if(isset($_SESSION['quest_daily']) && $_SESSION['quest_daily']>0) {
                            $menu_nvhn_note = $_SESSION['quest_daily'];
                            $menu_nvhn_class = "badge";
                        }
                ?>
                <li class="nav-sub-item"><a href="#char_manager&act=questdaily" rel="ajax">Nhiệm vụ Hàng ngày<span id="qdl_un" class="<?php echo $menu_nvhn_class; ?>"><?php echo $menu_nvhn_note; ?></span></a></li>
                <?php } ?>

                
                <?php if (isset($Use_DoiGioiTinh) && $Use_DoiGioiTinh == 1) { ?>
                <li class="nav-sub-item"><a href="#char_manager&act=doigioitinh" rel="ajax">Đổi Giới Tính</a></li>
                <?php } ?>
                
                <li class="nav-sub-item"><a href="#char_manager&act=emptychar" rel="ajax">Xóa Đồ Nhân Vật</a></li>
                <li class="nav-sub-item"><a href="#char_manager&act=reset_quest" rel="ajax">Làm lại Nhiệm Vụ</a></li>
                
                <?php if (isset($Use_LockItem) && $Use_LockItem == 1) { ?>
                <li class="nav-sub-item"><a href="#char_manager&act=lock_item" rel="ajax">Bảo vệ Item</a></li>
                <?php } ?>
                
                <?php if (isset($Use_TuLuyen) && $Use_TuLuyen == 1) { ?>
                <li class="nav-sub-item"><a href="#char_manager&act=tuluyen" rel="ajax">Tu Luyện</a></li>
                <?php } ?>
                
                <?php if (isset($Use_SongTu) && $Use_SongTu == 1) { ?>
                <li class="nav-sub-item"><a href="#char_manager&act=songtu" rel="ajax">Song Tu</a></li>
                <?php } ?>
				<li class="nav-sub-item"><a href="#char_manager&act=jewel2bank" rel="ajax">Gửi Jewel vào ngân hàng</a></li>
                
                <?php if (isset($Use_title) && $Use_title == 1) { ?>
                <li class="nav-sub-item"><a href="#char_manager&act=title" rel="ajax">Danh Hiệu</a></li>
                <?php } ?>
            </ul>
        </li>
        
        
        
        <li class="nav-item" menu-parent="event">
            <?php
                if(isset($_SESSION['award_unreceive_count']) && $_SESSION['award_unreceive_count']>0) $event_note_icon = 'note-evt';
            ?>
            <a class="nav-item-link" href="javascript:void(0);" data-title="Event"><span class="menu-icon icon-event"></span><span id="event_note" class="<?php echo $event_note_icon; ?>"></span>Event <img src="http://static.bongda.wap.vn/ltd.com.vn/images/iconnew.gif" width="23" height="12"></img></a>
            <ul class="nav-sub">
                <?php
                    if(isset($_SESSION['award_unreceive_count']) && $_SESSION['award_unreceive_count']>0) {
                        $menu_award_note = $_SESSION['award_unreceive_count'];
                        $menu_award_class = "badge";
                    }
                ?>
                <li class="nav-sub-item"><a href="#event&act=award" rel="ajax">Nhận Giải Thưởng<span id="award_un" class="<?php echo $menu_award_class; ?>"><?php echo $menu_award_note; ?></span></a></li>
                <?php if (isset($event_giftthangcap_on) && $event_giftthangcap_on == 1) { ?>
                <li class="nav-sub-item"><a href="#event&act=event_giftthangcap" rel="ajax"><?php echo $event_giftthangcap_name; ?></a></li>
                <?php } ?>
                
                <?php 
                    if ( (isset($Use_TopAuto_RS_Day) && $Use_TopAuto_RS_Day == 1) || (isset($Use_TopAuto_RS_Week) && $Use_TopAuto_RS_Week == 1) || (isset($Use_TopAuto_RS_Month) && $Use_TopAuto_RS_Month == 1) ) { 
                        if(isset($Use_TopAuto_RS_Day) && $Use_TopAuto_RS_Day == 1) $date_link = 'day';
                        elseif(isset($Use_TopAuto_RS_Week) && $Use_TopAuto_RS_Week == 1) $date_link = 'week';
                        elseif(isset($Use_TopAuto_RS_Month) && $Use_TopAuto_RS_Month == 1) $date_link = 'month';
                ?>
                <li class="nav-sub-item"><a href="#event&act=event_top_auto&type=rs&date=<?php echo $date_link; ?>" rel="ajax">TOP Bá Đạo</a></li>
                <?php } ?>
                <?php 
                    if ( (isset($Use_TopAuto_card_Day) && $Use_TopAuto_card_Day == 1) || (isset($Use_TopAuto_card_Week) && $Use_TopAuto_card_Week == 1) || (isset($Use_TopAuto_card_Month) && $Use_TopAuto_card_Month == 1) ) { 
                        if(isset($Use_TopAuto_card_Day) && $Use_TopAuto_card_Day == 1) $date_link = 'day';
                        elseif(isset($Use_TopAuto_card_Week) && $Use_TopAuto_card_Week == 1) $date_link = 'week';
                        elseif(isset($Use_TopAuto_card_Month) && $Use_TopAuto_card_Month == 1) $date_link = 'month';
                ?>
                <li class="nav-sub-item"><a href="#event&act=event_top_auto&type=card&date=<?php echo $date_link; ?>" rel="ajax">TOP Bá Giả</a></li>
                <?php } ?>
                
                <?php if ($event_santa_ticket == 1) { ?>
                <li class="nav-sub-item"><a href="#event&act=santa_ticket" rel="ajax">Đổi vé làng Santa</a></li>
                <?php } ?>
                <?php if ($event_epitem_on == 1) { ?>
                <li class="nav-sub-item"><a href="#event&act=event_epitem" rel="ajax"><?php echo $event_epitem_name; ?></a></li>
                <?php } ?>
                <?php if ($event_bongda_on == 1) { ?>
                <li class="nav-sub-item"><a href="#event&act=event_bongda" rel="ajax">Dự đoán Bóng Đá</a></li>
                <?php } ?>
				<!-- Spin Start-->
				<?php if ($Use_luckyspin == 1) { ?>
                <li class="nav-sub-item"><a href="#event&act=luckyspin" rel="ajax">Vòng quay may mắn</a></li>
                <?php } ?>
				<!-- Spin End -->
                <?php if ($event_toprs_on == 1) { ?>
                <li class="nav-sub-item"><a href="#event&act=event_toprs" rel="ajax"><?php echo $event_toprs_name; ?></a></li>
                <?php } ?>
                <?php 
                for($toprs_i=2; $toprs_i <= 5; $toprs_i++) {
                    if($event_toprs[$toprs_i]['on'] == 1 && (strtotime($event_toprs[$toprs_i]['end']) >= time() - 5*24*60*60) ) {
                        echo '<li class="nav-sub-item"><a href="#event&act=event_toprs&index='. $toprs_i .'" rel="ajax">'. $event_toprs[$toprs_i]['name'] .'</a></li>';
                    }
                }
                ?>
                <?php if ($event2_on == 1) { ?>
                <li class="nav-sub-item"><a href="#event&act=event2" rel="ajax"><?php echo $event2_name; ?></a></li>
                <?php } ?>
                <?php if ($event1_on == 1) { ?>
                <li class="nav-sub-item"><a href="#event&act=event1" rel="ajax"><?php echo $event1_name; ?></a></li>
                <?php } ?>
                <?php if ($event_toppoint_on == 1) { ?>
                <li class="nav-sub-item"><a href="#event&act=event_toppoint" rel="ajax"><?php echo $event_toppoint_name; ?></a></li>
                <?php } ?>
                <?php if ($event_goldbox_on == 1) { ?>
                <li class="nav-sub-item"><a href="#event&act=event_goldbox" rel="ajax"><?php echo $event_goldbox_name; ?></a></li>
                <?php } ?>
                <?php if ($event_top_goldbox_on == 1) { ?>
                <li class="nav-sub-item"><a href="#event&act=event_goldbox_top" rel="ajax"><?php echo $event_top_goldbox_name; ?></a></li>
                <?php } ?>
                <?php if ($event_topcard_on == 1) { ?>
                <li class="nav-sub-item"><a href="#event&act=event_topcard" rel="ajax"><?php echo $event_topcard_name; ?></a></li>
                <?php } ?>
                <?php 
                for($topcard_i=2; $topcard_i <= 5; $topcard_i++) {
                    if($event_topcard[$topcard_i]['on'] == 1 && (strtotime($event_topcard[$topcard_i]['end']) >= time() - 5*24*60*60) ) {
                        echo '<li class="nav-sub-item"><a href="#event&act=event_topcard&index='. $topcard_i .'" rel="ajax">'. $event_topcard[$topcard_i]['name'] .'</a></li>';
                    }
                }
                ?>
                
                <?php
                    // Read ItemFind Config
                    $itemfind_arr = _json_fileload('config/event_itemfind.txt');
                    // Read MayChao Config End
                    $itemfind_count = count($itemfind_arr);
                    for($itemfind_i = 0; $itemfind_i < $itemfind_count; $itemfind_i++) {
                        if($itemfind_arr[$itemfind_i]['itemfind_stat'] == 1) {
                            echo '<li class="nav-sub-item"><a href="#event&act=itemfind&item='. $itemfind_i .'" rel="ajax">'. $itemfind_arr[$itemfind_i]['name'] .'</a></li>';
                        }
                    }
                ?>
            </ul>
        </li>
		<?php if ( $user_support == 1 ) {  ?>	
         <li class="nav-item" menu-parent="maychao">
            <a class="nav-item-link" href="javascript:void(0);" data-title="maychao"><span class="menu-icon icon-chao"></span><span id="event_note"></span>Hỗ trợ</a>

		<ul class="nav-sub">	 
		    <li class="nav-sub-item"><a href="#command" rel="ajax">Lệnh trong game</a></li>			
			<?php if( in_array($_SESSION[mu_username], $quantri_arr )) { ?>
			    <li class="nav-sub-item"><a href="index.php?mod=support&act=adm_inbox" rel="ajax">Đơn hỗ trợ (ADMIN)</a></li>
			<?php } else { ?>     
				<li class="nav-sub-item"><a href="index.php?mod=support&act=writesupport&type=full" rel="ajax">Gởi đơn hỗ trợ cho BQT</a></li>
				<li class="nav-sub-item"><a href="#support" rel="ajax">Xem đơn hỗ trợ từ BQT</a></li>
			<?php } ?>     	
		 </ul>
        </li><?php } ?>
       
		
        <?php if(isset($Use_TienTe) && $Use_TienTe == 1) { ?>
        <li class="nav-item" menu-parent="tiente">
            <a class="nav-item-link" href="javascript:void(0);" data-title="Tiền tệ"><span class="menu-icon icon-money"></span>Tiền tệ</a>
            <ul class="nav-sub">
                <?php if (isset($Use_Gcoin2Vpoint) && $Use_Gcoin2Vpoint == 1) { ?>
                <li class="nav-sub-item"><a href="#tiente&act=gcoin2vpoint" rel="ajax">Đổi Gcent sang Vcent</a></li>
                <?php } ?>
                
                <?php if (isset($Use_Vpoint2Gcoin) && $Use_Vpoint2Gcoin == 1) { ?>
                <li class="nav-sub-item"><a href="#tiente&act=vpoint2gcoin" rel="ajax">Đổi Vcent sang Gcent</a></li>
                <?php } ?>
                
                <?php if (isset($Use_Gcoin2VipMoney) && $Use_Gcoin2VipMoney == 1) { ?>
                <li class="nav-sub-item"><a href="#tiente&act=gcoin2vipmoney" rel="ajax">Đổi Gcent sang VipMoney</a></li>
                <?php } ?>
                
                <?php if (isset($Use_Gcoin2WCoin) && $Use_Gcoin2WCoin == 1) { ?>
                <li class="nav-sub-item"><a href="#tiente&act=gcoin2wcoin" rel="ajax">Đổi Gcent sang WCoin</a></li>
                <?php } ?>
                
                <?php if (isset($Use_Gcoin2WCoinP) && $Use_Gcoin2WCoinP == 1) { ?>
                <li class="nav-sub-item"><a href="#tiente&act=gcoin2wcoinp" rel="ajax">Đổi Gcent sang WCoinP</a></li>
                <?php } ?>
                
                <?php if (isset($Use_Gcoin2GoblinCoin) && $Use_Gcoin2GoblinCoin == 1) { ?>
                <li class="nav-sub-item"><a href="#tiente&act=gcoin2goblincoin" rel="ajax">Đổi Gcent sang GoblinCoin</a></li>
                <?php } ?>
                
                <li class="nav-sub-item"><a href="#tiente&act=vpoint2item" rel="ajax">Mua Item Vcent</a></li>
                <li class="nav-sub-item"><a href="#tiente&act=item2vpoint" rel="ajax">Bán Item Vcent</a></li>
                
                <?php if (isset($Use_IPBonus2Vpoint) && $Use_IPBonus2Vpoint == 1) { ?>
                <li class="nav-sub-item"><a href="#tiente&act=ipbonuspoint2vpoint" rel="ajax">Đổi IP Bonus Point sang Vcent</a></li>
                <?php } ?>
                
                <?php if (isset($Use_IPBonus2PCPoint) && $Use_IPBonus2PCPoint == 1) { ?>
                <li class="nav-sub-item"><a href="#tiente&act=ipbonuspoint2pcpoint" rel="ajax">Đổi IP Bonus Point sang PC Point</a></li>
                <?php } ?>
				
				<?php 
					include_once('config/config_spin.php');
					if ($Use_costspin == 1) { ?>
					<li class="nav-sub-item"><a href="#tiente&act=costspin" rel="ajax">Mua vòng quay may mắn</a></li>
                <?php } ?>
				
            </ul>
        </li>
        <?php } ?>


        <?php if(isset($Use_NapThe) && $Use_NapThe == 1) { ?>
        <li class="nav-item" menu-parent="napthe">
            <a class="nav-item-link" href="javascript:void(0);" data-title="Nạp thẻ"><span class="menu-icon icon-card"></span>Nạp thẻ</a>
            <ul class="nav-sub">
                <li class="nav-sub-item"><a href="#napthe&act=gate" rel="ajax">Nạp thẻ</a></li>
                <li class="nav-sub-item"><a href="#napthe&act=listcard" rel="ajax">Danh sách thẻ nạp</a></li>
            </ul>
        </li>
        <?php } ?>
        
        <?php if(isset($Use_ChoTroi) && $Use_ChoTroi == 1) { ?>
        <li class="nav-item" menu-parent="chotroi">
            <a class="nav-item-link" href="#chotroi" rel="ajax" data-title="chotroi"><span class="menu-icon icon-shop"></span>Chợ Trời</a>
            <ul class="nav-sub">
                <li class="nav-sub-item"><a href="#chotroi&page=daugia_biding" rel="ajax">Item đang bán</a></li>
                <li class="nav-sub-item"><a href="#chotroi&page=daugia_end" rel="ajax">Item tham gia mua</a></li>
                <li class="nav-sub-item"><a href="#chotroi&page=daugia_bid" rel="ajax">Bán Item của bạn</a></li>
                <li class="nav-sub-item"><a href="#chotroi&page=daugia_own" rel="ajax">Item đã đưa lên bán</a></li>
                <li class="nav-sub-item"><a href="#chotroi" rel="ajax">Hướng dẫn</a></li>
            </ul>
        </li>
        <?php } ?>
        
        <?php if(isset($Use_WebShop) && $Use_WebShop == 1) { ?>
        <li class="nav-item" menu-parent="webshop">
            <a class="nav-item-link" href="javascript:void(0);" data-title="Webshop"><span class="menu-icon icon-shop"></span>Webshop</a>
            <ul class="nav-sub">
                <?php if (isset($Use_ShopTapHoa) && $Use_ShopTapHoa == 1) { ?>
                <li class="nav-sub-item"><a href="#webshop&act=shop_taphoa" rel="ajax">Cửa hàng Tạp Hóa</a></li>
                <?php } ?>
                
                <?php if (isset($Use_ShopVeEvent) && $Use_ShopVeEvent == 1) { ?>
                <li class="nav-sub-item"><a href="#webshop&act=shop_event" rel="ajax">Cửa hàng vé Event</a></li>
                <?php } ?>
                
                <?php if (isset($Use_ShopAcient) && $Use_ShopAcient == 1) { ?>
                <li class="nav-sub-item"><a href="#webshop&act=shop_acient" rel="ajax">Cửa hàng SET Thần</a></li>
                <?php } ?>
                
                <?php if ( (isset($Use_ShopKiem) && $Use_ShopKiem == 1) || (isset($Use_ShopGay) && $Use_ShopGay == 1) || (isset($Use_ShopCung) && $Use_ShopCung == 1) || (isset($Use_ShopVuKhiKhac) && $Use_ShopVuKhiKhac == 1) ) { ?>
                <li class="nav-sub-item"><a href="#webshop&act=shop_kiem" rel="ajax">Cửa hàng Vũ khí</a></li>
                <?php } ?>
                
                <?php if ( (isset($Use_ShopMu) && $Use_ShopMu == 1) || (isset($Use_ShopAo) && $Use_ShopAo == 1) || (isset($Use_ShopQuan) && $Use_ShopQuan == 1) || (isset($Use_ShopTay) && $Use_ShopTay == 1) || (isset($Use_ShopChan) && $Use_ShopChan == 1) || (isset($Use_ShopKhien) && $Use_ShopKhien == 1) ) { ?>
                <li class="nav-sub-item"><a href="#webshop&act=shop_mu" rel="ajax">Cửa hàng Giáp - Khiên</a></li>
                <?php } ?>
                
                <?php if (isset($Use_ShopTrangSuc) && $Use_ShopTrangSuc == 1) { ?>
                <li class="nav-sub-item"><a href="#webshop&act=shop_trangsuc" rel="ajax">Cửa hàng Trang Sức</a></li>
                <?php } ?>
                
                <?php if (isset($Use_ShopCanh) && $Use_ShopCanh == 1) { ?>
                <li class="nav-sub-item"><a href="#webshop&act=shop_canh" rel="ajax">Cửa hàng Cánh</a></li>
                <?php } ?>
                
                <?php if (isset($Use_ShopTienZen) && $Use_ShopTienZen == 1) { ?>
                <li class="nav-sub-item"><a href="#webshop&act=shop_zen" rel="ajax">Cửa hàng tiền Zen</a></li>
                <?php } ?>
                
                <?php if (isset($Use_Draw_Zen) && $Use_Draw_Zen == 1) { ?>
                <li class="nav-sub-item"><a href="#webshop&act=bank2zen" rel="ajax">Rút Zen ngân hàng</a></li>
                <?php } ?>
            </ul>
        </li>
        <?php } ?>
        
        <?php if(isset($Use_ThueItem) && $Use_ThueItem == 1) { ?>
        <li class="nav-item" menu-parent="reward">
            <a class="nav-item-link" href="javascript:void(0);" data-title="reward"><span class="menu-icon icon-shop"></span>Thuê Item</a>
            <ul class="nav-sub">
                <?php if (isset($Use_ThueTapHoa) && $Use_ThueTapHoa == 1) { ?>
                <li class="nav-sub-item"><a href="#reward&act=thue_taphoa" rel="ajax">Cho Thuê Tạp Hóa</a></li>
                <?php } ?>
                
                <?php if ( (isset($Use_ThueKiem) && $Use_ThueKiem == 1) || (isset($Use_ThueGay) && $Use_ThueGay == 1) || (isset($Use_ThueCung) && $Use_ThueCung == 1) || (isset($Use_ThueVuKhiKhac) && $Use_ThueVuKhiKhac == 1) ) { ?>
                <li class="nav-sub-item"><a href="#reward&act=thue_kiem" rel="ajax">Cho Thuê Vũ Khí</a></li>
                <?php } ?>
                
                <?php if ( (isset($Use_ThueMu) && $Use_ThueMu == 1) || (isset($Use_ThueAo) && $Use_ThueAo == 1) || (isset($Use_ThueQuan) && $Use_ThueQuan == 1) || (isset($Use_ThueTay) && $Use_ThueTay == 1) || (isset($Use_ThueChan) && $Use_ThueChan == 1) || (isset($Use_ThueKhien) && $Use_ThueKhien == 1) ) { ?>
                <li class="nav-sub-item"><a href="#reward&act=thue_mu" rel="ajax">Cho Thuê Giáp - Khiên</a></li>
                <?php } ?>
                
                <?php if (isset($Use_ThueTrangSuc) && $Use_ThueTrangSuc == 1) { ?>
                <li class="nav-sub-item"><a href="#reward&act=thue_trangsuc" rel="ajax">Cho Thuê Trang Sức</a></li>
                <?php } ?>
                
                <?php if (isset($Use_ThueCanh) && $Use_ThueCanh == 1) { ?>
                <li class="nav-sub-item"><a href="#reward&act=thue_canh" rel="ajax">Cho Thuê Cánh</a></li>
                <?php } ?>
            </ul>
        </li>
        <?php } ?>

        <?php if(isset($Use_MayChao) && $Use_MayChao == 1) { ?>
        <li class="nav-item" menu-parent="maychao">
            <a class="nav-item-link" href="javascript:void(0);" data-title="maychao"><span class="menu-icon icon-chao"></span>Máy Chao  <img src="http://static.bongda.wap.vn/ltd.com.vn/images/iconnew.gif" width="23" height="12"></a>
            <ul class="nav-sub">
                <?php if(isset($Use_CuongHoa) && $Use_CuongHoa == 1) { ?>
                <li class="nav-sub-item"><a href="#maychao&act=cuonghoa" rel="ajax">Cường Hóa</a></li>
                <?php } ?>
				
                <?php if(isset($Use_EpDoCong) && $Use_EpDoCong == 1) { ?>
                <li class="nav-sub-item"><a href="#maychao&act=epdocong" rel="ajax">Ép Đồ Cộng</a></li>
                <?php } ?>
				
				<?php if(isset($Use_EpWing3) && $Use_EpWing3 == 1) { ?>
                <li class="nav-sub-item"><a href="#maychao&act=epwing3" rel="ajax">Xoay Wing 3</a></li>
                <?php } ?>
				
				<?php if(isset($Use_EpWing4) && $Use_EpWing4 == 1) { ?>
                <li class="nav-sub-item"><a href="#maychao&act=epwing4" rel="ajax">Xoay Wing 4</a></li>
                <?php } ?>
				
				<?php if(isset($Use_EpWing5) && $Use_EpWing5 == 1) { ?>
                <li class="nav-sub-item"><a href="#maychao&act=epwing5" rel="ajax">Xoay Siêu Wing</a></li>
                <?php } ?>
				
                <?php if(isset($Use_MayChao_LongCondor) && $Use_MayChao_LongCondor == 1) { ?>
                <li class="nav-sub-item"><a href="#maychao&act=longcondor" rel="ajax">Ép Lông Vũ Condor</a></li>
                <?php } ?>
                
                <?php 
                if(isset($Use_trader_item) && $Use_trader_item == 1) {
                    // Read MayChao Config
                    $maychao_arr = _json_fileload('config/config_maychao.txt');
                    // Read MayChao Config End
                    $trader_arr = $maychao_arr['trader'];
                    $trader_count = count($trader_arr);
                    for($trader_i = 0; $trader_i < $trader_count; $trader_i++) {
                        if($trader_arr[$trader_i]['trader_stat'] == 1) {
                            echo '<li class="nav-sub-item"><a href="#maychao&act=trader_item" rel="ajax">Đổi ITEM</a></li>';
                            break;
                        }
                    }
                    
                } 
                ?>
                
            </ul>
        </li>
        <?php } ?>
        
        <li class="nav-item" menu-parent="relax">
            <a class="nav-item-link" href="javascript:void(0);" data-title="Giải trí"><span class="menu-icon icon-relax"></span>Giải trí</a>
            <ul class="nav-sub">
                <?php if(isset($Use_GiaiTri_Lo) && $Use_GiaiTri_Lo == 1) { ?>
                <li class="nav-sub-item"><a href="#relax&act=relax_lo" rel="ajax">Đánh Lô</a></li>
                <?php } ?>
                
                <?php if(isset($Use_GiaiTri_De) && $Use_GiaiTri_De == 1) { ?>
                <li class="nav-sub-item"><a href="#relax&act=relax_de" rel="ajax">Đánh Đề</a></li>
                <?php } ?>
            </ul>
        </li>
        
        
        <li class="nav-item" menu-parent="giftcode">
            <a class="nav-item-link" href="javascript:void(0);" data-title="Giftcode"><span class="menu-icon icon-gift"></span>Giftcode</a>
            <ul class="nav-sub">
                <li class="nav-sub-item"><a href="#giftcode&act=giftcode_change" rel="ajax">Đổi GiftCode</a></li>
                <?php 
                    include('config/config_giftcode_tanthu.php');
                    if ($giftcode_tanthu_use == 1) { 
                ?>
                <li class="nav-sub-item"><a href="#giftcode&act=giftcode_tanthu" rel="ajax">GiftCode tân thủ</a></li>
                <?php } ?>
                
                <?php 
                    include('config/config_giftcode_tanthu2.php');
                    if ($giftcode_tanthu2_use == 1) { 
                ?>
                <li class="nav-sub-item"><a href="#giftcode&act=giftcode_tanthu2" rel="ajax"><?php echo $giftcode_tanthu2_name; ?></a></li>
                <?php } ?>
                
                <?php 
                    include('config/config_giftcode_rs.php');
                    if ($giftcode_rs_use != 'none') { 
                ?>
                <li class="nav-sub-item"><a href="#giftcode&act=giftcode_rs" rel="ajax">GiftCode Reset</a></li>
                <?php } ?>
                
                <?php 
                    include('config/config_giftcode_week.php');
                    if ($giftcode_week_use != 'none') { 
                ?>
                <li class="nav-sub-item"><a href="#giftcode&act=giftcode_week" rel="ajax">GiftCode Tuần</a></li>
                <?php } ?>
                
                <?php 
                    include('config/config_giftcode_month.php');
                    if ($giftcode_month_use != 'none') { 
                ?>
                <li class="nav-sub-item"><a href="#giftcode&act=giftcode_month" rel="ajax">GiftCode Tháng</a></li>
                <?php } ?>
				
				<?php 
                    include('config/config_event.php');
                     if ($giftcode_nt_use > 0 && (strtotime($event_napthegc_end) >= time() - 5*24*60*60)) { 
                ?>
                <li class="nav-sub-item"><a href="#giftcode&act=giftcode_nt" rel="ajax">GiftCode Nạp Thẻ</a></li>
                <?php } ?>
                
                <li class="nav-sub-item"><a href="#giftcode&act=giftcode_history" rel="ajax">Lịch sử GiftCode</a></li>
            </ul>
        </li>
        
        
        <?php if(isset($Use_XepHang) && $Use_XepHang == 1) { ?>
        <li class="nav-item" menu-parent="rank">
            <a class="nav-item-link" href="javascript:void(0);" data-title="Xếp hạng"><span class="menu-icon icon-rank"></span>Xếp hạng</a>
            <ul class="nav-sub">
                <li class="nav-sub-item"><a href="#rank&act=rankrs2&action=daily&type=all" rel="ajax">BXH Nhân vật</a></li>
                <li class="nav-sub-item"><a href="#rank&act=ranking_guild" rel="ajax">BXH Bang Hội</a></li>
				<li class="nav-sub-item"><a href="#rank&act=rankpointrs&action=month&type=all" rel="ajax">BXH Danh Vọng</a></li>
            </ul>
        </li>
        <?php } ?>


        <? } else { ?>
        <li class="nav-item active">
            <a class="nav-item-link" href="<?php echo $_dir; ?>" data-title="Trang chủ"><span class="menu-icon icon-account"></span>Trang chủ</a>
        </li>
        <? } ?>
    </ul>
    <div class="menu-collap">
        <span class="collap-icon"></span>
        <span class="collap-text">Thu gọn</span>
    </div>
</div>
