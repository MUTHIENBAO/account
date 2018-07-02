<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="ModuleManage">
    <h3 class="TitleModule">Thuê Item >> <?php echo $tilte; ?></h3>
    
    <div class="BlockTwoColumn">
        
    <input type="hidden" id="reward_type" value="<?php echo $reward_type; ?>" />
    <table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#9999FF" class='item_form'>
        <tr bgcolor="#FFFF00">
            <td align="center"><b>Hình Ảnh</b></td>
            <td align="center"><b>Thông tin</b></td>
        </tr>
        <?php 
            if(count($item_arr) > 0) {
            foreach($item_arr as $item_code => $item) { 
                if($item['stat'] == 1) {
        ?>
        <tr bgcolor="#FFFFFF">
            <td align="center" bgcolor="#121212">
                <img src="items/<?php echo $item['img']; ?>.gif" />
            </td>
            <td align="center" bgcolor="#EEEEEE">
                <?php echo $item['item_name']; ?><br />
                Giá cơ bản: <?php echo number_format($item['price'], 0, ',', '.'); ?> Gcent / ngày
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td align="center" colspan="2">
                <span id="itemreward_unactive_<?php echo $item_code; ?>">
                    <a href="#" class="itemreward_up" vitri="<?php echo $item_code; ?>">Thuê Item <strong><?php echo $item['item_name']; ?></strong></a>
                </span>
                <span id="itemreward_active_<?php echo $item_code; ?>" style="display: none;">
                <a href="#" class="itemreward_down" vitri="<?php echo $item_code; ?>" >Đóng lại</a><br /><br />
                
                <?php if($item['exl_type'] < 99) { ?>
                
                <?php if($item['exl_type'] != 6) { ?>
                May Mắn: <input type="checkbox" id="luck_<?php echo $item_code; ?>" vitri="<?php echo $item_code; ?>" class="reward_luck" /> &nbsp;&nbsp;&nbsp;
                <?php } ?>
                
                Cấp Độ :
                    <select id="level_<?php echo $item_code; ?>" vitri="<?php echo $item_code; ?>" class="reward_lvl">
                        <?php
                            for($i=0; $i<=15; $i++) {
                                echo "<option value='$i'>+ ". $i ."</option>";
                            }
                        ?>
                    </select>
                &nbsp;&nbsp;&nbsp;
                
                <?php echo $item['option_type']; ?> 
                    <select id="option_<?php echo $item_code; ?>" vitri="<?php echo $item_code; ?>" class="reward_op">
                        <?php
                            if(strlen($item['option_type']) > 0) {
                                for($i=0; $i<=7; $i++) {
                                    echo "<option value='$i'> ". $item['option_mul']*$i ." ". $item['option_bonus'] ."</option>";
                                }
                            }
                        ?>
                    </select>
                <br />
                <strong>Dòng Hoàn Hảo</strong> :<br />
                    <table align="center" border="0">
                        <?php
                            foreach($item['exl'] as $key => $val) {
                        ?>
                        <tr>
                            <td align="right"><?php echo $val; ?> </td>
                            <td><input type="checkbox" id="exl_<?php echo $item_code; ?>_<?php echo $key; ?>" vitri="<?php echo $item_code; ?>" class="reward_exl" /></td>
                        </tr>
                        <?php
                            }
                        ?>
                    </table>
                <?php } ?>
                <strong>Thời gian Thuê</strong> : 
                    <select id="rewardday_<?php echo $item_code; ?>" vitri="<?php echo $item_code; ?>" class="reward_day">
                        <option value='1'>1 Ngày</option>
                        <option value='3'>3 Ngày</option>
                        <option value='7'>7 Ngày</option>
                        <option value='30'>30 Ngày</option>
                    </select>
                    
                <div id="notice_reward_view_<?php echo $item_code; ?>" class="info_noimg">
                    <table width="100%" cellpadding="1" cellspacing="1">
                        <tr>
                            <td>
                                <center><strong>Thông tin Item thuê</strong></center><br />
                                <div id="notice_reward_info_<?php echo $item_code; ?>"></div>
                                <center>
                                <input type="button" class="btn_reward" id="btn_reward_<?php echo $item_code; ?>" vitri="<?php echo $item_code; ?>" value="Thuê <?php echo $item['item_name']; ?>" /> <span id="btn_reward_waiting_<?php echo $item_code; ?>"></span>
                                <div id="reward_success_<?php echo $item_code; ?>"></div>
                                </center>
                            </td>
                        </tr>
                        
                    </table>
                </div>
                </span>
                <br /><br /><br />
            </td>
        </tr>
        <?php } } } else echo "<center><font color='red'><strong>Không có Item cho Thuê</strong></font></center>"; ?>
    </table>
        
    </div>
</div>
<?php } else include('templates/char_manager.tpl'); ?>