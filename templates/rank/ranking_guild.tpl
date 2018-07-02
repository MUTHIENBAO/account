<div class="primary-block">
	<div class="main-content">
		<h1 class="title-content">Xếp hạng Bang Hội</h1>
		<ul class="tabs-content">
			<li <?php if(!isset($_GET['type']) || $_GET['type'] == 'point') echo 'class="active"'; ?> ><a href="#rank&act=ranking_guild&type=point" rel="ajax">BXH BH Point</a></li>
			<li <?php if($_GET['type'] == 'rs') echo 'class="active"'; ?> ><a href="#rank&act=ranking_guild&type=rs" rel="ajax">BXH BH Reset</a></li>
		</ul>
	</div>
</div>
<div class="primary-block out-top-20">

	<div class="in-20 font-14 text-semibold">
        <center>Cập nhập lúc: <?php echo date('H:i d/m/Y', $time_host); ?></center>
        
        <?php if(!isset($_GET['type']) || $_GET['type'] == 'point') { ?>
		<p class="update-time in-10">
			<center><b><font color="red">Danh sách Bang Hội nhiều Point nhất</font></b></center><br>
		</p>
		<table class="table table-blue table-border-1 table-text-center table-sort">
			<thead>
				<tr>
					<th align="center" scope="col">#</th>
					<th align="center" scope="col"><b>Bang Hội</b></th>
					<th align="center" scope="col"><b>Chủ Hội</b></th>
					<th align="center" scope="col"><b>Thành Viên</b></th>
					<th align="center" scope="col"><b>Reset Tổng</b></th>
					<th align="center" scope="col"><b>Point Tổng</b></th>
					<th align="center" scope="col"><b>Logo</b></th>
                    <th align="center" scope="col"><b>Liên Minh</b></th>
                    <th align="center" scope="col"><b>Đối Địch</b></th>
				</tr>
			</thead>
			<tbody>
			<?php for($i=0;$i<$slg_GPoint;$i++) { ?>
			<tr>
				<td align="center"><?php echo $i+1; ?></td>
				<td align="center"><?php echo $gtop['Point'][$i]['GName']; ?></td>
				<td align="center"><?php echo $gtop['Point'][$i]['GMaster']; ?></td>
				<td align="center"><?php echo $gtop['Point'][$i]['SlgMem']; ?></td>
				<td align="center"><?php echo $gtop['Point'][$i]['RSTotal']; ?></td>
				<td align="center"><?php echo $gtop['Point'][$i]['PointTotal']; ?></td>
				<td align="center"><img src="./includes/guild_logo.php?decode=<?php echo $gtop['Point'][$i]['Logo']; ?>" width="30" height="30" /></td>
                <td align="center"><?php echo $gtop['Point'][$i]['LM']; ?></td>
                <td align="center"><?php echo $gtop['Point'][$i]['DD']; ?></td>
			</tr>
			<?php } ?>
			</tbody>
		</table>
        
        <?php } else { ?>
		<p class="in-10">
			<center><b><font color="red">Danh sách Bang Hội Reset nhiều nhất</font></b></center><br>
		</p>
		<table class="table table-blue table-border-1 table-text-center table-sort">
			<thead>
				<tr>
					<th align="center">#</th>
					<th align="center"><b>Bang Hội</b></th>
					<th align="center"><b>Chủ Hội</b></th>
					<th align="center"><b>Thành Viên</b></th>
					<th align="center"><b>Reset Tổng</b></th>
					<th align="center"><b>Point Tổng</b></th>
					<th align="center"><b>Logo</b></th>
                    <th align="center"><b>Liên Minh</b></th>
                    <th align="center"><b>Đối Địch</b></th>
				</tr>
			</thead>
			<tbody>
				<?php for($i=0;$i<$slg_GReset;$i++) { ?>
				<tr>
					<td align="center"><?php echo $i+1; ?></td>
					<td align="center"><?php echo $gtop['RS'][$i]['GName']; ?></td>
					<td align="center"><?php echo $gtop['RS'][$i]['GMaster']; ?></td>
					<td align="center"><?php echo $gtop['RS'][$i]['SlgMem']; ?></td>
					<td align="center"><?php echo $gtop['RS'][$i]['RSTotal']; ?></td>
					<td align="center"><?php echo $gtop['RS'][$i]['PointTotal']; ?></td>
					<td align="center"><img src="./includes/guild_logo.php?decode=<?php echo $gtop['RS'][$i]['Logo']; ?>" width="30" height="30" /></td>
                    <td align="center"><?php echo $gtop['RS'][$i]['LM']; ?></td>
                    <td align="center"><?php echo $gtop['RS'][$i]['DD']; ?></td>
				</tr>
				<?php } ?>
			</tbody>

		</table>
        <?php } ?>


	</div>

</div>












