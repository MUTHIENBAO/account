<div class="primary-block">
    <div class="main-content">

        <h1 class="title-content">Xếp hạng Reset | <?php echo $title_top_class; ?></h1>
        <div class="intro-content">
            <div class="in-20">
                <span class="color-violet">Xếp hạng Theo Số lần thực hiện Reset 1</span><br />
                <p>BXH Thực hiện Reset 1 tính từ :
                    <span class="tag tag-red">Reset</span>
                    <span class="tag tag-red">Reset VIP</span>
                    <span class="tag tag-red">Reset OVER</span>
                    <span class="tag tag-red">Reset OVER VIP</span>
                    <span class="tag tag-red">Reset Ủy Thác</span></p>
                    <span class="tag tag-red">Reset Ủy Thác VIP</span></p>
            </div>

        </div>
    </div>
</div>

<div class="primary-block out-top-20">
    <?php include('templates/rank/rankrs_top.tpl'); ?>

    <div class="in-20 font-14 text-semibold">
        <p class="update-time"><span class="color-red">Cập nhập lúc:</span> <span class="color-brown"><?php echo $time_top; ?><span class="color-red"> <span class="color-red">( 5 phút cập nhập 1 lần )</span></p>


        <?php
        foreach($rank as $key => $val) {
        ?>
        <div class="out-top-20">
            <p class="in-10">
                <span class="color-blue"><?php echo $title_top[$key]; ?></span>
            </p>
            <table class="table table-blue-white table-border-2 table-text-center table-sort">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Nhân vật</th>
                    <th>Reset</th>
                    <th>Lớp nhân vật</th>
                    <th>Thế hệ</th>
                </tr>
                </thead>
                <tbody>
                <?php foreach($val as $key2 => $val2) { ?>
                <tr>
                    <td align="center"><?php echo $key2+1; ?></td>
                    <td align="center"><?php echo $val2['name']; ?></td>
                    <td align="center"><?php echo $val2['reset']; ?></td>
                    <td align="center"><?php echo $val2['class']; ?></td>
                    <td align="center"><?php echo $val2['thehe']; ?></td>
                </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
        <?php
        }
        ?>
    </div>
</div>