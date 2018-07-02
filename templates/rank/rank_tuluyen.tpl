<div class="ModuleManage">
    <h3 class="TitleModule">Xếp hạng Tu Luyện</h3>
    
    <div class="BlockTwoColumn">
        
<?php
if ($thehe_choise)
{
    echo "<table align='center' width='90%' border='0'> <tr>";
    for($i=count($thehe_choise)-1;$i>0;$i--)
    {
        if(strlen($thehe_choise[$i]) > 0) {
            echo "<td align='center'>";
            if($_SESSION['thehe'] == $i ) echo "<b><font color='red'>";
                else echo '<a href="#rank&act=rank_tuluyen&thehe='.$i.'" rel="ajax">';
            echo $thehe_choise[$i];
            if($_SESSION['thehe'] == $i ) echo "</font></b>";
                else echo "</a>";
            echo "</td>";
        }
    }
    echo "</tr> </table><hr />";
}
?>
        <center>Cập nhập lúc: <?php echo $time_top; ?> ( 1h cập nhập 1 lần )</center>
    	<center><b><font color="red">Danh sách Đỉnh Cấp Tu Luyện</font></b></center>
		<table width="100%" border="0" bgcolor="#9999FF">
		  <tr bgcolor="#FFFFFF">
		    <td align="center" scope="col">#</td>
		    <td align="center" scope="col"><b>Nhân vật</b></td>
		    <td align="center" scope="col"><b>Tổng</b></td>
		    <td align="center" scope="col"><b>SM</b></td>
		    <td align="center" scope="col"><b>NN</b></td>
		    <td align="center" scope="col"><b>TL</b></td>
            <td align="center" scope="col"><b>NL</b></td>
		  </tr>
<?php 
    if(isset($toptuluyen_arr[$theheid]) && is_array($toptuluyen_arr[$theheid])) {
        foreach($toptuluyen_arr[$theheid] as $tl_k => $tl_v) {
?>
		  <tr bgcolor="#FFFFFF">
		    <td align="center"><?php echo $tl_k+1; ?></td>
		    <td align="center"><strong><?php echo $tl_v['name']; ?></strong></td>
            <td align="center"><?php echo number_format($tl_v['all'], 0, ',', '.'); ?></td>
            <td align="center"><?php echo number_format($tl_v['str'], 0, ',', '.'); ?></td>
            <td align="center"><?php echo number_format($tl_v['agi'], 0, ',', '.'); ?></td>
            <td align="center"><?php echo number_format($tl_v['vit'], 0, ',', '.'); ?></td>
            <td align="center"><?php echo number_format($tl_v['ene'], 0, ',', '.'); ?></td>
		  </tr>
<?php   } } ?>
		</table>
        
    </div>
</div>