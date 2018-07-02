<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Mở tickets hỗ trợ
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Đây là hình thức hỗ trợ được <?php echo $title; ?> khuyến khích sử dụng trong tất cả các trường hợp. Nhân viên hỗ trợ có thể dễ dàng theo dõi và trả lời chi tiết cho quý khách hàng. Yêu cầu hỗ trợ của quý khách sẽ được xử lý trong vòng 10 phút đến 2 giờ tùy theo mức độ phức tạp của công việc.</li>
			<li>Vui lòng nhấn vào nút <font color="green">"Gởi hỗ trợ"</font> để tiến hành gởi đơn hỗ trợ cho bộ phận BQT </li>
			<li>Lưu ý : nếu người chơi cố tình SPAM !!! BQT sẽ <font color="red"><strong>khóa tài khoản</strong></font> mà không thông báo trước </li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">

    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold"> Đơn hỗ trợ đã gởi
        </span></h1>
		
    </div><br><br>
	<center><a rel="ajax" href="index.php?mod=support&act=writesupport&type=full" class="btn btn-green btn-lg">Gởi hỗ trợ</a></center>
  <div class="in-20 font-14 text-semibold">
  
        <table class="table table-blue table-border-1">
            <thead>
            <tr>
				<th>Tiêu đề hỗ trợ</th>
				<th>Trạng thái</th>
				<th>Gửi lúc</th>
			</tr>
			</thead>
       <tbody>
<?php for($i=0;$i<count($supportlist);$i++) { ?>
      <tr bgcolor="#FFFFFF">
        <td align="justify"><a href="index.php?mod=support&act=readsupport&type=full&id=<?php echo $supportlist[$i]['supid']; ?>" rel="ajax" ><?php echo $supportlist[$i]['sup_title']; ?></a></td>
        <td align="center"><?php echo $supportlist[$i]['sup_status']; ?></td>
        <td align="center"><?php echo $supportlist[$i]['sup_time']; ?></td>
      </tr>
<?php } ?>
	</tbody>
    </table>
        
    </div>
</div>