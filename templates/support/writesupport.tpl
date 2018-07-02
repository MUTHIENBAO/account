<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Gửi yêu cầu hỗ trợ
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Để đơn hỗ trợ được giải quyết nhanh nhất các bạn vui lòng liệt kê đủ các thông tin sau : Tên tài khoản , tên nhân vật , cụm máy chủ , thời gian lỗi , nội dung</li>
			<li>Sau khi nêu đủ thông tin các bạn vui lòng đợi từ 10 - 2 giờ để BQT giải quyết . Nhanh hay chậm tùy theo mức độ phức tạp của vấn đề bạn gởi </li>
			<li>BQT sẽ không giải quyết vấn đề xin xỏ</li>
        </ul>
    </div>
</div> 
<form id="sendsupport" name="sendsupport" method="POST" action="index.php?mod=support&act=writesupport">
	<input type="hidden" name="action" value="sendsupport" />
<div class="primary-block out-top-20">

    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Tiêu đề hỗ trợ
        </span></h1>
		
    </div>
	
  <div class="in-20 font-14 text-semibold">
  

			<input type="text" name="supporttitle" value="<?php echo $_POST['supporttitle']; ?>" size="70" maxlength="250"/>
		
		</div></div>
<div class="primary-block out-top-20">

    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Nội dung cần hỗ trợ
        </span></h1>
		
    </div>
	
  <div class="in-20 font-14 text-semibold">
			
                <textarea name="supportcontent" cols="50" rows="7" id="supportcontent"><?php echo stripcslashes($_POST['supportcontent']); ?></textarea>
			  <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
              <script type="text/javascript" src="ckeditor/config.js" ></script>
              <script type="text/javascript">
    			//<![CDATA[
    
    				CKEDITOR.replace( 'supportcontent',
    					{
    						skin : 'kama'
    					});
    
    			//]]>
    			</script>
				</div></div>
		<br><br>
			<center>
			<input class="btn btn-green btn-lg" type="submit" name="Submit" value="Gửi yêu cầu Hỗ trợ" />
			</center>
		
	  
</form>
        
<script src="js/mudim-0.8-r153.js"></script>