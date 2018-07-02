<div class="primary-block">

<div class="primary-block out-top-20">

    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold"> Tải Game
        </span></h1>
    </div>

    <div class="in-20 font-14 text-semibold">
        <table class="table table-blue table-border-1">
            <thead>
            <tr>
                <th>#</th>
                <th>Server</th>
				<th>Dung Lượng (MB)</th>
                <th>Link Download</th>
            </tr>
            </thead>
            <tbody>
            <?php for($i=0;$i<count($download_link);$i++) {     
            ?>
            <tr>
                <td><?php echo $i+1; ?></td>
                <td><?php echo $link_name[$i]; ?></td>
                <td><?php echo $capacity[$i]; ?> MB</td>
				<td>
				<a href="<?php echo $download_link[$i]; ?>" target="_blank"><span class="color-orange"><strong>Download</strong></span></a>
				</td> 
            </tr>
            <?php } ?>
            </tbody>
        </table>
    </div>
</div>