<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Quản lí hỗ trợ
    </div>
</div>

<?php if(count($supporttheodoi)>0) { ?>    
  <div class="primary-block out-top-20">

    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Danh sách đã trả lời / theo dõi
        </span></h1>
		
    </div>
	 <div class="in-20 font-14 text-semibold">
  
        <table class="table table-blue table-border-1">
            <thead>
            <tr>
				<th>Tiêu đề hỗ trợ</th>
				<th>Tài khoản</th>
				<th>Trạng thái</th>
				<th>Gửi lúc</th>
			</tr>
			</thead>
       <tbody>
<?php for($i=0;$i<count($supporttheodoi);$i++) { ?>
      <tr bgcolor="#FFFFFF">
        <td align="justify"><a href="#support&act=adm_readsupport&id=<?php echo $supporttheodoi[$i]['supid']; ?>" rel="ajax" ><?php echo $supporttheodoi[$i]['sup_title']; ?></a></td>
        <td align="center"><?php echo $supporttheodoi[$i]['AccountID']; ?></td>
		      <td align="center"><?php echo $support_status; ?></td>
        <td align="center"><?php echo $supporttheodoi[$i]['sup_time']; ?></td>
    
<?php } ?>
      </tr>
	  </tbody>
    </table>
        
	  </div></div>

<?php } ?>
<div class="primary-block out-top-20">

    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Danh sách chưa hỗ trợ
        </span></h1>
		
    </div>
	 <div class="in-20 font-14 text-semibold">
  
        <table class="table table-blue table-border-1">
            <thead>
            <tr>
				<th>Tiêu đề hỗ trợ</th>
				<th>Tài khoản</th>
				<th>Trạng thái</th>
				<th>Gửi lúc</th>
			</tr>
			</thead>
       <tbody>
<?php for($i=0;$i<count($supportlist);$i++) { ?>
      <tr bgcolor="#FFFFFF">
  <td align="justify"><a href="#support&act=adm_readsupport&id=<?php echo $supportlist[$i]['supid']; ?>" rel="ajax" ><?php echo $supportlist[$i]['sup_title']; ?></a></td>
        <td align="center"><?php echo $supportlist[$i]['AccountID']; ?></td>
		     <td align="center"><?php echo $support_status; ?></td>
        <td align="center"><?php echo $supportlist[$i]['sup_time']; ?></td>
    
<?php } ?>
      </tr>
	  </tbody>
    </table>
        
	  </div></div>
	  

   
        