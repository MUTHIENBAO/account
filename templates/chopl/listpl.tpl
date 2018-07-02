<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Danh sách cửa hàng PP đang bán</h1>
        <ul class="tabs-content">
            <li class="active"><a href="#chopl" rel="ajax">Mua Điểm PP</a></li>
            <li><a href="#chopl&act=banpl" rel="ajax">Bán Điểm PP</a></li>
        </ul>
    </div>
</div>

<div class="primary-block">
    <div class="in-20">
        <?php
    if(isset($error_module)) echo "<div class='error'>$error_module</div>";
    ?>
    <ul class="noted in-left-10">
        <li><strong>Điểm PP</strong> nhận được từ <strong><a href="#char_manager&act=questdaily" rel="ajax">Nhiệm Vụ Hàng Ngày</a></strong> và Event.</li>
    </ul>

    <center>
        <b>Danh sách cửa hàng PP rẻ nhất đang bán</b>
    </center>
    <br />

    <table class="table table-blue table-text-center table-border-2">
        <thead>
        <tr>
            <th align="center">#</th>
            <th align="center"><b>Người bán</b></th>
            <th align="center"><b>Điểm PL</b></th>
            <th align="center"><b>Giá</b> (Vcent)</th>
            <th align="center"><b>Tỷ Giá</b> Vcent / 1 PP</th>
            <th align="center"><b>Mua</b></th>
        </tr>
        </thead>
        <?php
if(isset($listpl_arr) && is_array($listpl_arr)) {
    foreach($listpl_arr as $pl_k => $pl_v) {
        ?>
        <tr>
            <td align="center"><?php echo $pl_k+1; ?></td>
            <td align="center"><strong><?php echo $pl_v['name']; ?></strong></td>
            <td align="center"><?php echo number_format($pl_v['plpoint'], 0, ',', '.'); ?></td>
            <td align="center"><?php echo number_format($pl_v['price'], 0, ',', '.'); ?></td>
            <td align="center"><?php echo number_format($pl_v['tygia'], 2, ',', '.'); ?></td>
            <td align="center"><?php if($pl_v['mystore'] == 1) { echo "Cửa hàng của bạn."; } else { ?><input type="button" class="btn_plmua" id="btn_plmua_<?php echo $pl_v['id']; ?>" value="Mua" store_id="<?php echo $pl_v['id']; ?>" /><br /><span id="muapl_view_<?php echo $pl_v['id']; ?>"></span><?php } ?></td>
        </tr>
        <?php   } } ?>
    </table>


</div>
</div>