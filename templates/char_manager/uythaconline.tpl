<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Ủy thác Online</h1>
    </div>
</div>


<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Điều kiện Ủy Thác và nhận điểm Ủy Thác Online</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Phải ủy thác ở <b><?php echo $uythacon_server; ?></b>.</li>
            <li>Phải đứng trong làng <b>Lorencia</b> ( 95 < Tọa độ X < 175 === 90 < Tọa độ Y < 165 ).</li>
            <li>Hoặc làng <b>Noria</b> ( 165 < Tọa độ X < 205 === 85 < Tọa độ Y < 130 ).</li>
            <li>Nhân vật phải đang trong Game.</li>
            <li>Trong quá trình Ủy thác có thể tùy ý di chuyển giữa 2 làng Lorencia, Noria.</li>
        </ul>
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Mất Ủy Thác nếu</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Đi ra khỏi khu vực Ủy thác.</li>
            <li>Đổi Server.</li>
            <li>Khi mất Ủy thác có thể kích hoạt lại Ủy thác Trên Web.</li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">

        <fieldset class="notify-red">
            <legend>Lưu ý</legend>
            <div class="in-20">
                <b>Điểm Ủy Thác: 1 phút Ủy Thác Online = 1 điểm Ủy Thác</b><br>
                <br><b>Lưu ý</b>: Để tránh tình trạng tích lũy, Điểm Ủy Thác sẽ <b>suy giảm 10%</b> vào 24h hàng ngày. Các bạn lưu ý sử dụng hết trước 24h hàng ngày.<br />
                <strong>Số điểm Uỷ Thác tối đa là : 1.440 điểm</strong> ( Tổng điểm Uỷ Thác Online và Offline )
            </div>

        </fieldset>
        <br /><br />

        <form id="UyThacOnline" name="UyThacOnline" method="post" action="index.php?mod=char_manager&act=uythaconline">
            <input type="hidden" name="action" value="UyThacOnline" />
            <input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />
            <div class="form-2">
                <div class="form-row">
                    <div class="form-col-1"><span>Nhân vật Ủy thác Online</span></div>
                    <div class="form-col-2">
                        <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
                    </div>
                </div>

                <div class="form-submit">

                        <button class="btn btn-green btn-block btn-lg" type="submit" name="Submit" <?php if($accept == 0) { ?> disabled="disabled" <?php } ?> >Ủy Thác Online</button>

                </div>
            </div>
        </form>
    </div>
</div>