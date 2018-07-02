<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Bán Điểm PP</h1>
        <ul class="tabs-content">
            <li><a href="#chopl" rel="ajax">Mua Điểm PP</a></li>
            <li class="active"><a href="#chopl&act=banpl" rel="ajax">Bán Điểm PP</a></li>
        </ul>
    </div>
</div>

<div class="primary-block">
    <div class="in-20">
        <?php
    if(isset($error_module)) echo "<div class='error'>$error_module</div>";
    ?>

    <center>
        <div class="info"><strong>Điểm PP hiện có : <font color="red"><span id="plpoint" class="tag tag-blue"><?php echo number_format($mypl, 0, ',', '.'); ?></span></font></strong></div>

        <br />
        Bán <input type="text" id="plpoint_ban" size="2" maxlength="3" /> Điểm PP giá <input type="text" id="plpoint_vpoint" size="5" maxlength="6" /> Vcent <input type="button" id="btn_pl_ban" value="Bán PP" /> <span id="banpl_loading"></span>
    </center>
    <div id="banpl_view"></div>

    <?php if(count($mystore_arr) > 0) { ?>
    <br /><br />
    <center><strong>Cửa hàng PP của bạn</strong></center>
    <table class="table table-blue table-text-center table-border-2">
        <thead>
        <tr>
            <th align="center" scope="col">#</th>
            <th align="center" scope="col"><b>Điểm PL</b></th>
            <th align="center" scope="col"><b>Giá</b> (Vcent)</th>
            <th align="center" scope="col"><b>Mua</b></th>
        </tr>
        </thead>
        <?php
    foreach($mystore_arr as $store_k => $store_v) {
        ?>
        <tr>
            <td align="center"><?php echo $store_k+1; ?></td>
            <td align="center"><?php echo number_format($store_v['plpoint'], 0, ',', '.'); ?></td>
            <td align="center"><?php echo number_format($store_v['price'], 0, ',', '.'); ?></td>
            <td align="center" id="td_huyban_<?php echo $store_v['id']; ?>"><?php echo $store_v['info'] . $store_v['huyban']; ?></td>
        </tr>
        <?php   } ?>
    </table>
    <?php } ?>


</div>
</div>