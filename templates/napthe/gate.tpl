<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Nạp thẻ</h1>
        <ul class="tabs-content">
            <li class="active"><a href="#napthe" rel="ajax">Nạp thẻ</a></li>
            <li><a href="#napthe&act=listcard" rel="ajax">Danh sách thẻ đã nạp</a></li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Nạp thẻ</span></h1>
    </div>
    <div class="in-20">
        <form id="vpoint_gate" name="vpoint_gate" method="post" action="index.php?mod=napthe&act=gate">
        <input type="hidden" name="action" value="vpoint_gate" />
        <table class="table table-blue table-border-1 table-text-center">
            <thead>
            <tr>
                <th>Loại thẻ</th>
                <th>10k</th>
                <th>20k</th>
                <th>50k</th>
                <th>100k</th>
                <th>200k</th>
                <th>500k</th>
                <th>1.000k</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><?php if($viettel_baotri != 1) echo '<input type="radio" name="card" value="Viettel" checked="checked" id="card-viettel" />'; else echo '<font color="red"><strong>Bảo trì</strong></font>'; ?>&nbsp;&nbsp; <label for="card-viettel"><span class="icon-viettel"></span></label></td>
                <td><strong><?php echo number_format($menhgia10000, 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia20000, 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia50000, 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia100000, 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia200000, 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia500000, 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia1000000, 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
            </tr>
            <tr>
                <td><?php if($vina_baotri != 1) echo '<input type="radio" name="card" value="VinaPhone" id="card-vinaphone" />'; else echo '<font color="red"><strong>Bảo trì</strong></font>'; ?>&nbsp;&nbsp; <label for="card-vinaphone"><span class="icon-vinaphone"></span></label></td>
                <td><strong><?php echo number_format($menhgia10000, 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia20000, 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia50000, 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia100000, 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia200000, 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia500000, 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia1000000, 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
            </tr>
            <tr>
                <td><?php if($mobi_baotri != 1) echo '<input type="radio" name="card" value="MobiPhone" id="card-mobifone" />'; else echo '<font color="red"><strong>Bảo trì</strong></font>'; ?>&nbsp;&nbsp; <label for="card-mobifone"><span class="icon-mobifone"></span></label></td>
                <td><strong><?php echo number_format($menhgia10000, 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia20000, 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia50000, 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia100000, 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia200000, 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia500000, 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia1000000, 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
            </tr>
            <tr>
                <td><input type="radio" name="card" value="GATE" id="card-gate" <?php if($viettel_baotri == 1) echo 'checked="checked"'; ?> /> <label for="card-gate"><span class="icon-gate"></span></label></td>
                <td><strong><?php echo number_format($menhgia10000*(1+($khuyenmai_gate/100)), 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia20000*(1+($khuyenmai_gate/100)), 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia50000*(1+($khuyenmai_gate/100)), 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia100000*(1+($khuyenmai_gate/100)), 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia200000*(1+($khuyenmai_gate/100)), 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia500000*(1+($khuyenmai_gate/100)), 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
                <td><strong><?php echo number_format($menhgia1000000*(1+($khuyenmai_gate/100)), 0, ',', '.'); ?></strong> <span class="icon-g"></span></td>
            </tr>
            </tbody>
        </table>

        <div class="in-top-30 out-bottom-40 form-card">
            <div class="line"></div>
            <div class="card-form-col">

                    <input type="hidden" name="action" value="vpoint_gate" />
                    <ul class="card-center">
                        <li>
                            <div class="form-card-title">Số GCent hiện có</div>
                            <div class="form-card-text"> 
                                <div class='item-box' title='GCent'><img src='templates/images/icons/g.png' /><span>x<?php echo number_format($_SESSION['acc_gcoin'], 0, ',', '.'); ?></span></div> 
                                <div class='item-box' title='GCent Khuyến Mãi'><img src='templates/images/icons/g+.png' /><span>x<?php echo number_format($_SESSION['acc_gcoin_km'], 0, ',', '.'); ?></span></div> 
                            </div><br /><br />
                        </li>
                        <li>
                            <div class="form-card-title">Nhập mã thẻ</div>
                            <div class="form-card-text">
                                <input class="form-style" type="text" name="card_num" id="card_num" />
                                <label id="msg_card_num" class="msg"></label>
                            </div>
                        </li>
                        <li>
                            <div class="form-card-title">Nhập serial</div>
                            <div class="form-card-text">
                                <input class="form-style" type="text" name="card_serial" id="card_serial" />
                                <label id="msg_card_serial" class="msg"></label>
                            </div>
                        </li>
                        <li>
                            <div class="form-card-title">&nbsp;</div>
                            <div class="form-card-text"><img src="img.php?size=6&v=<?php echo time(); ?>" /></div>
                        </li>
                        <li>
                            <div class="form-card-title">Nhập mã xác nhận</div>
                            <div class="form-card-text"><input name="vImageCodP" id="vImageCodP" class="form-style inputstyle" type="text" /></div>
                        </li>
                        <li>
                            <div class="form-card-title">&nbsp;</div>
                            <div class="form-card-text"><button class="btn btn-block btn-green" type="submit" name="submit">Nạp thẻ</button></div>
                        </li>
                    </ul>

            </div>
            <div class="card-form-col">
                <div class="card-center">
                    <div class="current-card">
                        <span class="title-card">Bạn muốn nạp thẻ :</span>
                        <span class="image-card <?php if($viettel_baotri != 1) echo 'card-viettel'; else echo 'card-gate'; ?>" id="image-card"></span>
                    </div>
                    <?php if($khuyenmai == 1) { ?>
                    <div class="promotion in-10 priority-block">
                        <p>Khuyến mại nạp thẻ<br />
                        <?php if($khuyenmai_week == 0) { ?>
                        từ <span class="color-orange"><strong><?php echo $khuyenmai_begin_date; ?></strong></span> đến <span class="color-orange"><strong><?php echo $khuyenmai_end_date; ?></strong></span></p>
                        <?php } else { ?>
                        <span class="color-orange"><strong>trong ngày</strong></span>
                        <?php } ?>
                        <span class="promotion-number"><?php echo $khuyenmai_phantram; ?>%</span>
                    </div>
                    <?php } ?>
                    <?php if( isset($use_ipbonus) && $use_ipbonus == 1 ) { 
                        if($_SESSION['ipbonus_active'] == 1) {    
                    ?>
                    <div class="promotion in-10 priority-block">
                        <p>Chơi tại <a href="#acc_manager&act=ipbonus_list" rel="ajax"><span class="color-orange"><strong>IP Bonus</strong></span></a> được nhận thêm</p>
                        <span class="promotion-number"><?php echo $ipbonus_kmcard; ?>%</span>
                    </div>
                    <?php } else { ?>
                        <p>Không chơi tại <a href="#acc_manager&act=ipbonus_list" rel="ajax"><span class="color-orange"><strong>IP Bonus</strong></span></a> không được nhận thêm</p>
                        <span class="promotion-number"><?php echo $ipbonus_kmcard; ?>%</span>
                    <?php } } ?>
                </div>
            </div>
        </div>

        <div class="in-top-20">
            <fieldset class="notify-red">
                <legend>Lưu ý:</legend>
                <div class="in-10">
                    - Sau khi nạp thẻ phải giữ thẻ cẩn thận không cho một ai biết cho đến khi nào <a href="#napthe&act=listcard" rel="ajax" >TÌNH TRẠNG THẺ</a> đó là Thẻ đúng/hoàn tất.<br />
                    - Nếu không thẻ của bạn bị người khác lấy và nạp mất thì chúng tôi hoàn toàn không chịu trách nhiệm.
                </div>
            </fieldset>
        </div>
        <div class="in-top-20">
            <table class="table table-blue table-border-1 table-text-center">
                <thead>
                <tr>
                    <th colspan="2">Số thẻ tối đa cho phép nạp trong ngày</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td width="50%">Reset < <?php echo $reset_1; ?> lần</td><td><?php echo $slg_card_1; ?>  thẻ / ngày</td>
                </tr>
                <tr>
                    <td><?php echo $reset_1; ?> < Reset < <?php echo $reset_2; ?> lần</td><td><?php echo $slg_card_2; ?> thẻ / ngày</td>
                </tr>
                <tr>
                    <td><?php echo $reset_2; ?> < Reset < <?php echo $reset_3; ?> lần</td><td><?php echo $slg_card_3; ?> thẻ / ngày</td>
                </tr>
                <tr>
                    <td><?php echo $reset_3; ?> < Reset < <?php echo $reset_4; ?> lần</td><td><?php echo $slg_card_4; ?> thẻ / ngày</td>
                </tr>
                <tr>
                    <td><?php echo $reset_4; ?> < Reset hoặc đã ReLife</td><td><?php echo $slg_card_max; ?> thẻ / ngày</td>
                </tr>
                </tbody>
            </table>
        </div>
        </form>
    </div>
</div>