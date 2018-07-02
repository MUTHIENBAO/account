<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Event Đua TOP <?php echo $type_name ." ". $title_top_date; ?></h1>
        <?php if($type == 'rs') { ?>
        <div class="intro-content">
            <div class="in-20">
                <span class="color-violet">Xếp hạng Theo Số lần thực hiện Reset :</span><br />
                    <span class="tag tag-red">Reset</span>
                    <span class="tag tag-red">Reset VIP</span>
                    <span class="tag tag-red">Reset OVER</span>
                    <span class="tag tag-red">Reset OVER VIP</span>
                    <span class="tag tag-red">Reset Ủy Thác</span>
                    <span class="tag tag-red">Reset Ủy Thác VIP</span>
            </div>
        </div>
        <?php } ?>
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <?php if($type == 'rs') { ?><li>Không giới hạn Reset tính TOP</li><?php } ?>
            <li><strong>Ngọc Hỗn Nguyên, Ngọc Sáng Tạo, Lông Vũ</strong> nhận được sẽ nằm trong ngân hàng.</li>
            <li><strong>Bùa EXP</strong> : Nếu nhân vật đang sử dụng bùa sẽ được cộng thêm thời hạn sử dụng.<br />Nếu nhân vật chưa có bùa hoặc đã hết hạn sẽ được tặng <strong>Bùa Thiên Sứ</strong></li>
            <li><strong>Item không thời hạn</strong> : Sau khi nhận sẽ được chuyển vào Rương đồ chung</li>
            <li><strong><font color='red'>Item có thời hạn</font></strong> : Đến <strong>Server 1, Lorencia</strong>, giao dịch với NPC <strong>ReWard (143, 138)</strong> để rút Item.<br /> 
                <strong>Lưu ý</strong> : Phải rút ngay Item có thời hạn sau khi nhận thưởng, nếu để qua ngày không rút phần thưởng sẽ mất.
            </li>
            <li>
                <strong>Thời hạn nhận giải thưởng</strong> : trong <strong><font color='red'>1 <?php echo $title_top_date; ?></font></strong> khi đoạt giải thưởng.<br />
                Nếu không nhận trong thời hạn này, giải thưởng bị mất, BQT hoàn toàn không chịu trách nhiệm.
            </li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="primary-block out-top-20">
        <div class="main-content">
            <ul class="tabs-content">
                <?php if($_GET['type']=='rs') { ?>
                    <?php if(isset($Use_TopAuto_RS_Day) && $Use_TopAuto_RS_Day == 1) { ?>
                    <li <?php if($_GET['type']=='rs' && $_GET['date']=='day') echo 'class="active"'; ?>>
                        <a href="#event&act=event_top_auto&type=rs&date=day" rel="ajax">Bá Đạo ngày</a>
                    </li>
                    <?php } ?>
                    
                    <?php if(isset($Use_TopAuto_RS_Week) && $Use_TopAuto_RS_Week == 1) { ?>
                    <li <?php if($_GET['type']=='rs' && $_GET['date']=='week') echo 'class="active"'; ?>>
                        <a href="#event&act=event_top_auto&type=rs&date=week" rel="ajax">Bá Đạo tuần</a>
                    </li>
                    <?php } ?>
                    
                    <?php if(isset($Use_TopAuto_RS_Month) && $Use_TopAuto_RS_Month == 1) { ?>
                    <li <?php if($_GET['type']=='rs' && $_GET['date']=='month') echo 'class="active"'; ?>>
                        <a href="#event&act=event_top_auto&type=rs&date=month" rel="ajax">Bá Đạo tháng</a>
                    </li>
                    <?php } ?>
                <?php } ?>
                
                <?php if($_GET['type']=='card') { ?>
                    <?php if(isset($Use_TopAuto_card_Day) && $Use_TopAuto_card_Day == 1) { ?>
                    <li <?php if($_GET['type']=='card' && $_GET['date']=='day') echo 'class="active"'; ?>>
                        <a href="#event&act=event_top_auto&type=card&date=day" rel="ajax">Bá Giả ngày</a>
                    </li>
                    <?php } ?>
                    
                    <?php if(isset($Use_TopAuto_card_Week) && $Use_TopAuto_card_Week == 1) { ?>
                    <li <?php if($_GET['type']=='card' && $_GET['date']=='week') echo 'class="active"'; ?>>
                        <a href="#event&act=event_top_auto&type=card&date=week" rel="ajax">Bá Giả tuần</a>
                    </li>
                    <?php } ?>
                    
                    <?php if(isset($Use_TopAuto_card_Month) && $Use_TopAuto_card_Month == 1) { ?>
                    <li <?php if($_GET['type']=='card' && $_GET['date']=='month') echo 'class="active"'; ?>>
                        <a href="#event&act=event_top_auto&type=card&date=month" rel="ajax">Bá Giả tháng</a>
                    </li>
                    <?php } ?>
                <?php } ?>
            </ul>
        </div>
    </div>
    
    <div class="in-20 font-14 text-semibold">
        <p class="update-time"><span class="color-red">Cập nhập lúc:</span> <span class="color-brown"><?php echo $time_top; ?><span class="color-red"> <span class="color-red">( 5 phút cập nhập 1 lần )</span></p>


        <?php
        if(is_array($rank)) {
            foreach($rank as $key => $val) {
        
        
        ?>
        <div class="out-top-20">
            <p class="in-10">
                <span class="color-blue"><?php echo $title_top[$key]; ?></span>
            </p>
            <table class="table table-blue table-border-2 table-text-center">
                <thead>
                <tr>
                    <th>#</th>
                    <th width="15%">Nhân vật</th>
                    <th width="10%"><?php echo ($type == 'rs') ? 'Reset' : 'Gcent'; ?></th>
                    <th width="10%">Class</th>
                    <?php if($type == 'rs') { echo '<th width="15%">Reset Cuối</th>'; } ?>
                    <th>Phần Thưởng</th>
                </tr>
                </thead>
                <tbody>
                <?php 
                    if(is_array($val)) {
                        foreach($val as $key2 => $val2) { 
                            $vip_day_view = '';
                            if($val2['vip_day'] > 0) $vip_day_view = "<span>". $val2['vip_day'] ."d</span>";
                            $btn_nhangiai = "";
                            $string_key = "event_top_auto_". $type ."_". $date;
                            if($allow_nhangiai === true && $key > 0 && $val2['name'] == $_SESSION['mu_nvchon']) {
                                if($_SESSION[$string_key] == 0) {
                                    $btn_nhangiai = '<button class="btn btn-green btn-block btn-lg btn_event_top_auto" type="button" id="btn_event_top_auto_'. $_SESSION['mu_nvchon'] .'" event_type="'. $type .'" nv_name="'. $_SESSION['mu_nvchon'] .'" event_date="'. $date .'" >Nhận thưởng</button><div id="btn_info_'. $_SESSION['mu_nvchon'] .'"></div>';
                                } else {
                                    $time_receive = date('d/m H:i', $_SESSION[$string_key]);
                                    $btn_nhangiai = '<button class="btn btn-green btn-block btn-lg" type="button" disabled="disabled" >Đã nhận : '. $time_receive .'</button>';
                                }
                                
                            }
                            $top_index = $key2+1;
                ?>
                <tr>
                    <td align="center"><?php echo $top_index; ?></td>
                    <td align="center"><?php echo $val2['name']; ?> <?php if($val2['vip'] > 0) echo "<br /><span class='vip-box' title='VIP'><img src='images/super.gif' />$vip_day_view</span>"; ?></td>
                    <td align="center"><?php echo ($type == 'rs') ? $val2['reset'] : number_format($val2['card'], 0, ',', '.'); ?></td>
                    <td align="center"><?php echo $val2['class']; ?></td>
                    <?php if($type == 'rs') { ?>
                    <td align="center"><?php echo $val2['lastrs_time']; ?></td>
                    <?php } ?>
                    <td align="center"><?php echo $gift_arr[$key][$top_index]['msg'] ."<br />". $btn_nhangiai; ?></td>
                </tr>
                <?php 
                            if($key2 >= ($top_slg_view - 1)) break;
                        }
                    } 
                ?>
                </tbody>
            </table>
        </div>
        <?php
            }
        }
        ?>
    </div>
</div>