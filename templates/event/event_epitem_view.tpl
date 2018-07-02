<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content"><?php echo $event_epitem_name; ?></h1>
    </div>
</div>

<?php include('templates/event/event_epitem_head.tpl'); ?>

<div class="primary-block">
    <div class="in-20">
<center><b>Giới thiệu Event <?php echo $event_epitem_name; ?></b></center>
<br /><br />
    
<p><span class="tag tag-red">Cách thức tham gia:</strong></span></p>
<ul class="noted in-left-10">
  <li>Mỗi nhân vật có thể đăng ký nhiều Item</li>
  <li>Khi đăng ký, Item phải để trong hòm đồ chung</li>
  <li> Sử dụng chức năng <a href="#event&act=event_epitem&page=event_epitem_regnew" rel="ajax" ><strong>Đăng ký Item tham gia Event</strong></a> trên web để đăng ký item</li>
  <li> Item đăng ký phải có từ <strong><?php echo $event_epitem_exlmin_begin; ?> - <?php echo $event_epitem_exlmax_begin; ?> dòng hoàn hảo</strong> </li>
  <li> Item đăng ký phải có <strong>cấp độ tối từ <?php echo $event_epitem_lvlmin_begin; ?> - <?php echo $event_epitem_lvlmax_begin; ?></strong> </li>
  <li> Item đã đăng ký không được chuyển sang tài khoản khác cho tới khi kết thúc Event.</li>
  <li> Khi ép thành công Item đã đăng kí, các bạn hãy Xác nhận hoàn thành trong phần <a href="#event&act=event_epitem&page=event_epitem_reged" rel="ajax" ><strong>Item đã đăng ký</strong></a>.</li>
  <li><a href="#event&act=event_epitem&page=event_epitem_rank" rel="ajax" ><strong>Bảng xếp hạng</strong></a> sẽ dựa vào thời gian Hoàn thành cấp sớm nhất và Nhân vật Hoàn thành nhiều nhất để xếp hạng.</li>
</ul>
<br /><br />

<p><span class="tag tag-red"><strong>Điều kiện hoàn thành:</strong></span></p>
<ul class="noted in-left-10">
  <li>Item đã đăng ký có từ <strong><?php echo $event_epitem_exlmin_end; ?> - <?php echo $event_epitem_exlmax_end; ?> dòng hoàn hảo</strong></li>
  <li>Item đã đăng ký có <strong>cấp đồ từ <?php echo $event_epitem_lvlmin_end; ?> - <?php echo $event_epitem_lvlmax_end; ?></strong></li>
  <li>Item đã đăng ký nằm trong hòm đồ chung</li>
</ul>
<br /><br />

<p><span class="tag tag-red"><strong>Thời gian tham gia Event</strong>:</span> <b><font color='red'>0h00 <?php echo date('d/m/Y',strtotime($event_epitem_begin)); ?> - 24h00 <?php echo date('d/m/Y',strtotime($event_epitem_end)); ?> </font></b></p>
    
        
    </div>
</div>