<div class="primary-block out-top-20">
    <div class="main-content">
        <ul class="tabs-content">
            <li <?php if(!$_GET['act'] || ($_GET['act']=='rankrs2' && $_GET['action']=='daily' && $_GET['type']=='all')) echo 'class="active"'; ?>>
                <a href="#rank&act=rankrs2&action=daily&type=all" rel="ajax">Reset ngày</a>
            </li>
            <li <?php if($_GET['act']=='rankrs2' && $_GET['action']=='week' && $_GET['type']=='all') echo 'class="active"'; ?>>
                <a href="#rank&act=rankrs2&action=week&type=all" rel="ajax">Reset tuần</a>
            </li>
            <li <?php if($_GET['act']=='rankrs2' && $_GET['action']=='month' && $_GET['type']=='all') echo 'class="active"'; ?>>
                <a href="#rank&act=rankrs2&action=month&type=all" rel="ajax">Reset tháng</a>
            </li>
            <li <?php if($_GET['act']=='rank50') echo 'class="active"'; ?>>
                <a href="#rank&act=rank50" rel="ajax">TOP 0h</a>
            </li>
            <li <?php if($_GET['act']=='ranking') echo 'class="active"'; ?>>
                <a href="#rank&act=ranking&type=all" rel="ajax">TOP tất cả</a>
                <div class="submenu">
                    <p <?php if($_GET['act']=='ranking' && $_GET['type'] == 'all') echo 'class="active"'; ?>><a href="#rank&act=ranking&type=all" rel="ajax" >TOP ALL</a></p>
                    <p <?php if($_GET['act']=='ranking' && $_GET['type'] == 'DW') echo 'class="active"'; ?>><a href="#rank&act=ranking&type=DW" rel="ajax" >DW</a></p>
                    <p <?php if($_GET['act']=='ranking' && $_GET['type'] == 'DK') echo 'class="active"'; ?>><a href="#rank&act=ranking&type=DK" rel="ajax" >DK</a></p>
                    <p <?php if($_GET['act']=='ranking' && $_GET['type'] == 'ELF') echo 'class="active"'; ?>><a href="#rank&act=ranking&type=ELF" rel="ajax" >ELF</a></p>
                    <?php if(!isset($mg_use) || $mg_use == 1) { ?>
                    <p <?php if($_GET['act']=='ranking' && $_GET['type'] == 'MG') echo 'class="active"'; ?>><a href="#rank&act=ranking&type=MG" rel="ajax" >MG</a></p>
                    <?php } ?>
                    <?php if(!isset($dl_use) || $dl_use == 1) { ?>
                    <p <?php if($_GET['act']=='ranking' && $_GET['type'] == 'DL') echo 'class="active"'; ?>><a href="#rank&act=ranking&type=DL" rel="ajax" >DL</a></p>
                    <?php } ?>
                    <?php if(!isset($sum_use) || $sum_use == 1) { ?>
                    <p <?php if($_GET['act']=='ranking' && $_GET['type'] == 'SuM') echo 'class="active"'; ?>><a href="#rank&act=ranking&type=SuM" rel="ajax" >SUM</a></p>
                    <?php } ?>
                    <?php if(!isset($rf_use) || $rf_use == 1) { ?>
                    <p <?php if($_GET['act']=='ranking' && $_GET['type'] == 'RF') echo 'class="active"'; ?>><a href="#rank&act=ranking&type=RF" rel="ajax" >RF</a></p>
                    <?php } ?>
                </div>
            </li>
            
            <li <?php if($_GET['type']=='rank_other') echo 'class="active"'; ?>>
                <a href="#" rel="ajax">TOP khác</a>
                <div class="submenu">
                    <p <?php if($_GET['act']=='rank_pmaster' && $_GET['type'] == 'rank_other') echo 'class="active"'; ?>><a href="#rank&act=rank_pmaster&type=rank_other" rel="ajax" >TOP Master</a></p>
                </div>
            </li>
        </ul>
    </div>

<div>
    <?php if(isset($err)) echo "<center><font color='red'><b>$err</b></font></center>"; ?>
</div>

</div>

<?php
if(!isset($_GET['action'])) $_GET['action'] = 'daily';
if(!isset($_GET['type'])) $_GET['type'] = 'all';

$thehe_count = count($thehe_choise);
if ($thehe_choise && $thehe_count > 2)
{
    $thehe_check = 0;
    for($i=0; $i<$thehe_count; $i++) {
        if(strlen($thehe_choise[$i]) > 0) $thehe_check++;
    }
}
    
if($thehe_check > 1) {
    echo "<br /><br /><table align='center' width='90%' border='0'> <tr>";
    for($i=$thehe_count-1;$i>0;$i--)
    {
        if(strlen($thehe_choise[$i]) > 0) {
            echo "<td align='center'>";
            if($_SESSION['thehe'] == $i ) echo '<a class="btn btn-green btn-lg" href="javascript:;" disabled="disabled"><b>';
            else echo '<a class="btn btn-green btn-lg" href="#rank&act='. $_GET['act'] .'&action='. $_GET['action'] .'&type='. $_GET['type'] .'&thehe='.$i.'" rel="ajax">';
            
            echo $thehe_choise[$i];
            
            if($_SESSION['thehe'] == $i ) echo "</b></a>";
            else echo '</a>';
            
            echo "</td>";
        }
    }
        echo "</tr> </table>";
}
    
    $style_active_begin = "<b><font color='red'>";
            $style_active_end = "</font></b>";

?>