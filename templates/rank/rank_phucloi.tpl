<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Xếp hạng Phúc Lợi</h1>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">
<?php if(isset($err)) echo "<center><font color='red'><b>$err</b></font></center>"; ?>

<?php 
if(!isset($_GET['action'])) $_GET['action'] = 'daily';

if ($thehe_choise)
{
    echo "<table align='center' width='90%' border='0'> <tr>";
    for($i=count($thehe_choise)-1;$i>0;$i--)
    {
        if(strlen($thehe_choise[$i]) > 0) {
            echo "<td align='center'>";
            if($_SESSION['thehe'] == $i ) echo "<b><font color='red'>";
                else echo '<a href="#rank&act=rank_phucloi&action='. $action .'&thehe='.$i.'" rel="ajax">';
            echo $thehe_choise[$i];
            if($_SESSION['thehe'] == $i ) echo "</font></b>";
                else echo "</a>";
            echo "</td>";
        }
    }
    echo "</tr> </table>";
}

$style_active_begin = "<b><font color='red'>";
$style_active_end = "</font></b>";
?>
<center>
	<hr />
	<a href="#rank&act=rank_phucloi&action=daily" rel="ajax" ><?php if($_GET['action']=='daily') echo $style_active_begin; ?>Ngày<?php if($_GET['action']=='daily') echo $style_active_end; ?></a> - 
    <a href="#rank&act=rank_phucloi&action=week" rel="ajax" ><?php if($_GET['action']=='week') echo $style_active_begin; ?>Tuần<?php if($_GET['action']=='week') echo $style_active_end; ?></a> - 
    <a href="#rank&act=rank_phucloi&action=month" rel="ajax" ><?php if($_GET['action']=='month') echo $style_active_begin; ?>Tháng<?php if($_GET['action']=='month') echo $style_active_end; ?></a>
	
		<br />
	<hr /><br />
 </center>
 
<center>Cập nhập lúc: <?php echo $time_top; ?> ( 1 giờ cập nhập 1 lần )</center><br />
    <?php 
        foreach($rank as $key => $val) {
    ?>
        <center><font color='blue'><?php echo $title_top[$key]; ?></font></center>	
        <table width="100%" border="0" bgcolor="#9999FF">
		  <tr bgcolor="#FFFFFF">
		    <th align="center" scope="col">#</th>
		    <th align="center" scope="col">Nhân vật</th>
		    <th align="center" scope="col">Điểm Phúc Lợi</th>
		  </tr>
<?php foreach($val as $key2 => $val2) { ?>
		  <tr bgcolor="#FFFFFF">
		    <td align="center"><?php echo $key2+1; ?></td>
		    <td align="center"><?php echo $val2['name']; ?></td>
		    <td align="center"><?php echo $val2['plpoint']; ?></td>
		  </tr>
<?php } ?>
		</table>
        <br /><br />
    <?php 
        }
    ?>
        
    </div>
</div>