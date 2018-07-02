<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Hệ thống Song Tu</h1>
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li><strong>Song Tu</strong> : vợ chồng song tu, sức mạnh tuyệt thế.</li>
            <li><strong>Điều Kiện Song Tu</strong> : Đã kết hôn.</li>
            <li><strong>Cấp độ Song Tu</strong> càng cao, nhân vật càng mạnh.</li>
            <li><strong>Điểm PP, PP+</strong> có thể nhận được trong <strong><a href="#char_manager&act=questdaily" rel="ajax">Nhiệm Vụ Hàng Ngày</a></strong>.</li>
            <li>Cần <strong>10 Điểm PP hoặc PP+</strong> cho 1 lần tiến hành Song Tu</li>
        </ul>
    </div>
</div>

<?php
    if($songtu_arr['married'] != 1) {
?>
<div class="primary-block">
    <div class="form-error">
        Bạn chưa kết hôn, không thể tiến hành Song Tu.<br />
        Hướng dẫn cách Kết Hôn:
        <ul class="noted in-left-10">
            <li>Vào Game</li>
            <li>Đến <strong>Davias 2</strong></li>
            <li>Chồng đứng ở tọa độ : <strong>14, 25</strong></li>
            <li>Vợ đứng ở tọa độ : <strong>14, 26</strong></li>
            <li>Chỉ chuột vào đối phương rồi Đánh lệnh : <strong>/marry</strong> tên_vợ_hoặc_chồng</li>
            <li>Đồng ý kết hôn Đánh lệnh : <strong>/acceptmarry</strong></li>
        </ul>
    </div>
</div>
<?php
    } else {
?>
<div class="primary-block out-top-20">

    <div id="tang_stpoint" style="<?php echo $style_tang_ctpoint; ?>">
        <center>
            <strong>Tặng Bạn Đời <font color="blue"><?php echo $songtu_arr['vochong']; ?></font> Điểm Song Tu</strong><br />
            Chi phí tặng Điểm Song Tu : 1 Trái Tim.<br />
            Tặng <input type="text" id="gift_st_point" value="0" size="2" /> Điểm Song Tu
            <input type="button" id="btn_gift_st_point" value="Tiến hành Tặng" /> <span id="gift_stpoint_loading"></span>
        </center>
        <div id="gift_st_notice"></div>
    </div>

    <div class="info">
        <center>Điểm Song Tu hiện có : <font color="red"><strong><span id="st_point"><?php echo $songtu_arr['songtu_point']; ?></span></strong></font></center>
        <table width="100%" border="0" bgcolor="#9999FF">
            <tr bgcolor="#FFFFFF">
                <td align="center"><b>Cấp độ</b></td>
                <td align="center"><b>Thân Mật</b></td>
                <td align="center"><b>Point thưởng</b></td>
                <td align="center"><b>Song Tu</b></td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td align="center"><b><font color="blue"><span id="stlv"><?php echo $songtu_arr['songtu_lv']; ?></span></font></b></td>
                <td align="center"><b><span id="stexp"><?php echo $songtu_arr['songtu_exp']; ?></b></span> / <span id="stexpup"><?php echo $exp_songtu_sum; ?></span></td>
                <td align="center"><b><font color="red"><span id="st_percent_point"><?php echo $songtu_point_percent; ?></span> %</font></b></td>
                <td align="center"><span id="btn_st"><?php echo $form_input; ?></span> <span id="loading_st"></span></td>
            </tr>
        </table>
        <div id="stsuccess"></div>
        <div id="sterror"></div>
    </div>

</div>
<?php
    }
?>

<?php } else include('templates/char_manager.tpl'); ?>