<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Hệ thống Hỗ Trợ </h1>
    </div>
</div>
<div class="primary-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Thông tin hỗ trợ</span></h1>
    </div>
<div class="in-20">	
 <div class="Container100">
                    <div class="ContainerIndent BorBotDottedGray PadBot10">
                        <div class="Container20 Responsive FontBold"><span class="PadLeft20">Ngày tạo</span>
                        </div>
                       <span class="PadLeft40"><?php echo $support_read[0]['timepost']; ?></span>
                        
                    </div>            
                    <div class="ContainerIndent BorBotDottedGray PadBot10">
                        <div class="Container20 Responsive FontBold"><span class="PadLeft20">Trạng thái</span>
                        </div>
                        <span class="PadLeft40"><?php echo $status; ?></span>
                        
                    </div>
                        <div class="ContainerIndent BorBotDottedGray PadBot10">
                            <div class="Container20 Responsive FontBold"><span class="PadLeft20">Người xử lý</span>
                            </div>
                            <span class="PadLeft40">Kỹ thuật viên</span>
                            
                        </div> 
	</div>	
<p>&nbsp;</p>
 </div>
 </div>    
<div class="primary-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Nội Dung Trao Đổi</span></h1>
    </div>
<div class="sup-20">	
 <div class="Container100">
		<form id="sendsupport" name="sendsupport" method="POST" action="index.php?mod=support&act=readsupport&id=<?php echo $subid; ?>">
			<input type="hidden" name="action" value="sendsupport" />					
				<div class="ContainerIndent PadBot10">
                        <div class="Container100 Responsive FontBold"><div id="formSendNote" class="ui-panel ui-widget ui-widget-content ui-corner-all" data-widget="widget_formSendNote" style="position: relative;"><div id="formSendNote_content" class="ui-panel-content ui-widget-content">
                            <?php for($i=0; $i<count($support_read); $i++) { ?>				   
							   <div class="divChat floatL">
                                                <div class="Wid100">
                                                    <div class="floatL divImageChat Container10 Responsive"><img id="j_idt143" src="templates/imgs/customer.png" alt="">
                                                    </div>
                                                    <div class="floatL divChatItem Container90 Responsive">
                                                        <div class="Wid100"><span class="txtCustChat"><?php if($support_read[$i]['account']) echo $support_read[$i]['account']; ?></span><span style="color: #B2B2B2"> - <?php echo $support_read[$i]['timepost']; ?></span>
                                                        </div>
                                                        <div class="divContentChat"  style='word-wrap:break-word;'><p><?php echo $support_read[$i]['content']; ?></p>
                                                        </div>
                                                        <div style="clear: both;"></div>
                                                    </div>
                                                </div>
                                                <div style="clear: both;"></div>
                                </div><br />
							<?php } ?> 
					<?php if($support_status !=9) { ?>							
                                <div class="Container100 MarTop5">
                                    <div class="Container90 Responsive"><textarea id="supportcontent" name="supportcontent" cols="20" rows="3" style="width: 92%" class="ui-inputfield ui-inputtextarea ui-widget ui-state-default ui-corner-all" role="textbox" aria-disabled="false" aria-readonly="false" aria-multiline="true"></textarea>
                                    </div>
                                    <input class="Accept" type="submit" name="Submit" value="Gửi" /></button>
                                    </div>
                                </div>
					<?php } ?>			
                        </div>
                    </div>
		</form>			
	</div>	
</div>   
<p>&nbsp;</p>
 </div>   
</div>
<script src="js-d/mudim-0.8-r153.js"></script>