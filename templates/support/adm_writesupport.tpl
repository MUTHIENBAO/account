<div class="ModuleManage">
    <h3 class="TitleModule">Gửi tin nhắn đến người chơi</h3>
    
    <div class="BlockTwoColumn">
        
<div class="text_red">
    <?php if($_GET['type'] == 'full') { ?>
    <a href="#support&act=adm_writesupport" rel="ajax" >Chuyển sang dạng đơn giản</a> : Không có tích hợp bộ soạn thảo (Thích hợp yêu cầu hỗ trợ đơn giản - <b>Truy Cập Nhanh</b>)
    <?php } else { ?>
    <a href="index.php?mod=support&act=adm_writesupport&type=full">Chuyển sang dạng đầy đủ</a> : Có tích hợp bộ soạn thảo (Thích hợp chèn thêm liên kết, hình ảnh - <b>Truy Cập Chậm</b>)
    <?php } ?>
</div>
<form id="sendsupport" name="sendsupport" method="POST" action="index.php?mod=support&act=adm_writesupport">
	<input type="hidden" name="action" value="sendsupport" />
    	<table width="100%" border="0" cellpadding="1" cellspacing="1">
		<tr>
			<td align="right">Tiêu đề tin nhắn</td>
			<td><input type="text" name="supporttitle" value="<?php echo $_POST['supporttitle']; ?>" size="70" maxlength="250"/></td>
		</tr>
        <tr>
			<td align="right" valign="top" >Nội dung tin nhắn</td>
			<td>
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
            </td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><input class="Accept" type="submit" name="Submit" value="Gửi tin nhắn đến người chơi" /></td>
		</tr>
	  </table>
</form>
        
    </div>
</div>
<script src="js/mudim-0.8-r153.js"></script>
<!-- End Content -->