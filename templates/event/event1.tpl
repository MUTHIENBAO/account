<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content"><?php echo $event1_name; ?></h1>
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Số Point nhận được là ngẫu nhiên trong khoảng theo bảng trên</li>
            <li> Số Point nhận được là vĩnh viễn ( Nghĩa là cho dù Reset hay Relife cũng không bị mất đi )</li>
            <li> Số Point nhân vật nhận được = Số Point Relife + Point Reset + Point Event</li>
            <li>Khi đổi phần thưởng phải bỏ hết đồ trong người vào hòm đồ. Đồ trên người, trong túi đồ, cửa hàng cá nhân (như hình cảnh báo bên dưới) sẽ bị xoá hoàn toàn khi đổi phần thưởng.</li>
            <li> Nhân vật đổi Event không được đang trong Game và không được là nhân vật thoát sau cùng</li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">
        <form id="event1" name="event1" method="post" action="index.php?mod=event&act=event1">
            <input type="hidden" name="action" value="event1" />
            <input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />
                <table class="table table-blue table-text-center table-border-2">
                  <thead>
                  <tr>
                    <th colspan="3" align="center">
                        <b>Vật phẩm Event</b>
                    </th>
                  </tr>
                  <tr>
                    <th align="center"><b>Tên vật phẩm</b></th>
                    <th align="center"><b>Hình Ảnh</b></th>
                    <th align="center"><b>Ghi chú</b></th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td align="center"><?php echo $event1_itemshop_name; ?></td>
                    <td align="center"><img src="img_item/heart.gif"></td>
                    <td align="center"><b>Cách Nhận</b> : Đánh quái khi tham gia sự kiện <strong>Lâu Đài Máu</strong>, <strong>Quảng Trưởng Quỷ</strong> hoặc mua tại <strong><a href="#webshop&act=shop_taphoa" rel="ajax" >Shop Tạp Hóa</a></strong><br>
        <b>Chức Năng</b> : Sử dụng để ghép với Huy Chương nhận phần thưởng</td>
                  </tr>
                  <tr>
                    <td align="center"><?php echo $event1_itemdrop1_name; ?></td>
                    <td align="center"><img src="img_item/silver_medal.jpg"></td>
                    <td align="center"><b>Cách Nhận</b> : Đánh quái khi tham gia sự kiện <strong>Lâu Đài Máu</strong>, <strong>Quảng Trưởng Quỷ</strong> hoặc mua tại <strong><a href="#webshop&act=shop_taphoa" rel="ajax" >Shop Tạp Hóa</a></strong><br>
        <b>Chức Năng</b> : Sử dụng để ghép với Heart , Zen và Gcent nhận phần thưởng</td>
                  </tr>
                  <tr>
                    <td align="center"><?php echo $event1_itemdrop2_name; ?></td>
                    <td align="center"><img src="img_item/gold_medal.jpg"></td>
                    <td align="center"><b>Cách Nhận</b> : Đánh quái khi tham gia sự kiện <strong>Lâu Đài Máu</strong>, <strong>Quảng Trưởng Quỷ</strong> hoặc mua tại <strong><a href="#webshop&act=shop_taphoa" rel="ajax" >Shop Tạp Hóa</a></strong><br>
        <b>Chức Năng</b> : Sử dụng để ghép với Heart , Zen và Gcent nhận phần thưởng</td>
                  </tr>
                  </tbody>
                </table>
                <br />
                
                <div class="priority-block out-top-20">
                    <div class="head-block">
                        <h1 class="title-head"><span class="text-semibold">Công Thức Ghép Đổi Phần Thưởng Loại 1</span></h1>
                    </div>
                    <div class="in-20">
                        <ul class="noted in-left-10">
                            <li> 1 <?php echo $event1_itemdrop1_name; ?>   +  <?php echo number_format($event1_loai1_zen1, 0, ',', '.'); ?> Zen = <?php echo $event1_loai1_point1_min; ?> - <?php echo $event1_loai1_point1_max; ?> Point    		      </li>
                            <li>1 <?php echo $event1_itemdrop2_name; ?> + <?php echo number_format($event1_loai1_zen2, 0, ',', '.'); ?> Zen = <?php echo $event1_loai1_point2_min; ?> - <?php echo $event1_loai1_point2_max; ?> Point </li>
                            <li>Đổi tối đa trong ngày : <b><?php echo $event1_loai1_daily_slg; ?></b> Phần thưởng loại 1 / ngày</li>
                            <li>Đổi tối đa : <b><?php echo $event1_loai1_slg; ?></b> Phần thưởng loại 1 / nhân vật</li>
                        </ul>
                    </div>
                </div>
                
                <div class="priority-block out-top-20">
                    <div class="head-block">
                        <h1 class="title-head"><span class="text-semibold">Công Thức Ghép Đổi Phần Thưởng Loại 2</span></h1>
                    </div>
                    <div class="in-20">
                        <ul class="noted in-left-10">
                            <li>1 <?php echo $event1_itemdrop1_name; ?>  + <?php echo $event1_loai2_itemshop_slg1; ?> <?php echo $event1_itemshop_name; ?> = <?php echo $event1_loai2_point1_min; ?> - <?php echo $event1_loai2_point1_max; ?> Point    		      </li>
                        <li>1 <?php echo $event1_itemdrop2_name; ?>   + <?php echo $event1_loai2_itemshop_slg2; ?> <?php echo $event1_itemshop_name; ?> = <?php echo $event1_loai2_point2_min; ?> - <?php echo $event1_loai2_point2_max; ?> Point </li>
                            <li>Đổi tối đa trong ngày : <b><?php echo $event1_loai2_daily_slg; ?></b> Phần thưởng loại 2 / ngày</li>
                            <li>Đổi tối đa : <b><?php echo $event1_loai2_slg; ?></b> Phần thưởng loại 2 / nhân vật</li>
                        </ul>
                    </div>
                </div>
                
                <div class="priority-block out-top-20">
                    <div class="head-block">
                        <h1 class="title-head"><span class="text-semibold">Công Thức Ghép Đổi Phần Thưởng Loại 3</span></h1>
                    </div>
                    <div class="in-20">
                        <ul class="noted in-left-10">
                            <li>1 <?php echo $event1_itemdrop1_name; ?> + <?php echo $event1_loai3_gcoin1; ?> Gcent = <?php echo $event1_loai3_point1_min; ?> - <?php echo $event1_loai3_point1_max; ?> Point    		      </li>
                        <li>1 <?php echo $event1_itemdrop2_name; ?> + <?php echo $event1_loai3_gcoin2; ?> Gcent = <?php echo $event1_loai3_point2_min; ?> - <?php echo $event1_loai3_point2_max; ?> Point </li>
                            <li>Đổi tối đa trong ngày : <b><?php echo $event1_loai3_daily_slg; ?></b> Phần thưởng loại 2 / ngày</li>
                            <li>Đổi tối đa : <b><?php echo $event1_loai3_slg; ?></b> Phần thưởng loại 2 / nhân vật</li>
                        </ul>
                    </div>
                </div>
                <br /><br />
                <div class="form-3">
                    <div class="form-row">
                        <div class="form-col-1">Nhân vật đổi Event </div>
                        <div class="form-col-2">
                            <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
                        </div>
                    </div>
            
                    <div class="form-row">
                        <div class="form-col-1">Chọn loại phần thưởng</div>
                        <div class="form-col-2">
            					<select name="event1_type" class="form-style">
            						<option value="1" selected="selected">Loại 1</option>
            						<option value="2">Loại 2</option>
            						<option value="3">Loại 3</option>
            					</select>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-col-1">Đổi nhân vật</div>
                        <div class="form-col-2">
                            <?php echo $doinv; ?>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-col-1">Thoát Game</div>
                        <div class="form-col-2">
                            <?php echo $online; ?>
                        </div>
                    </div>
            
                    <div class="form-submit">
                        <button class="btn btn-green btn-lg btn-block" type="submit" name="Submit" <?php if($accept=='0') { echo 'disabled="disabled" class="NotAccept"'; } else { echo 'class="Accept"'; } ?> >Đổi Event</button>
                    </div>
                </div>
                
        </form>
    </div>
</div>
<?php } else include('templates/char_manager.tpl'); ?>