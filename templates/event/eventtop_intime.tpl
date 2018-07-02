<div class="primary-block">

    <div class="main-content">
        <h1 class="title-content"><?php echo $name; ?></h1>
        <? if($action == "view_toprs") {
            if(isset($_GET['class']) && strlen($_GET['class']) > 0) $class = $_GET['class'];
            else $class = 'all';
        ?>
        <div class="intro-content">
            <div class="in-20">
                <span class="color-violet">Event tính từ :</span><br />
                    <span class="tag tag-red">Reset</span>
                    <span class="tag tag-red">Reset VIP</span>
                    <?php if(isset($event_toprs_rstype) && $event_toprs_rstype > 0) { ?>
                    <span class="tag tag-red">Reset OVER</span>
                    <span class="tag tag-red">Reset OVER VIP</span>
                    <?php } ?>
                    <?php if(isset($event_toprs_rstype) && $event_toprs_rstype != 1 && $type == 'rs') { ?>
                    <span class="tag tag-red">Reset Ủy Thác</span>
                    <span class="tag tag-red">Reset Ủy Thác VIP</span>
                    <?php } ?>
            </div>

        </div>
        <div class="line"></div>
        <ul class="tabs-content">
            <?
                //DATA
                $array_data = array(
                    array(
                        'name'      => 'TOP Reset',
                        'type'      => 'rs',
                        'sub'       => array('dw','dk','elf','mg','dl','sum','rf')
                    ),
                    //array(
                        //'name'      => 'TOP Danh vọng',
                        //'type'      => 'danhvong',
                        //'sub'       => array('dw','dk','elf','mg','dl','sum','rf')
                    //)
                );
            ?>



            <?
                //PRINT DATA
                foreach($array_data as $data){
                    $active = $type==$data['type'] ? 'class="active"' : '';
                    if(isset($_GET['index']) && $_GET['index'] == abs(intval($_GET['index']))) $para_index = "&index=". $_GET['index'];
            ?>
                    <li <? echo $active; ?>>
                        <a href='#event&act=event_toprs<?php echo $para_index; ?>&thehe=<?php echo $thehe; ?>&type=<? echo $data['type']; ?>&class=all' rel='ajax'><? echo $data['name']; ?></a>
                        <div class="submenu">
                        <?
                            foreach($data['sub'] as $sub){
                            $sub_active = $class==$sub && $type==$data['type'] ? 'class="active"' : "";
                            $sub_name = strtoupper($sub);
                        ?>
                           <p <? echo $sub_active; ?>><a href="#event&act=event_toprs<?php echo $para_index; ?>&thehe=<?php echo $thehe; ?>&type=<? echo $data['type']; ?>&class=<? echo $sub; ?>" rel="ajax"><? echo $sub_name; ?></a></p>
                        <? } ?>
                        </div>
                    </li>

            <? }//end foreach ?>

        </ul>
        <? } ?>
    </div>
</div>

<div class="primary-block out-top-20">

    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">
<?php
if ($thehe_choise)
{
    for($i=count($thehe_choise)-1;$i>0;$i--)
    {
        if(strlen($thehe_choise[$i]) > 0) {

                    if($_SESSION['thehe'] == $i ) echo "<b><font color='red'>";
                    else echo ' <a href="#event&act='. $_GET['act'] .'&thehe='.$i.'&type='.$type.'&class='.$class.'" rel="ajax" >';

                    echo $thehe_choise[$i];

                    if($_SESSION['thehe'] == $i ) echo "</font></b>";
                    else echo "</a> ";

        }
    }
}

?>
        - <? echo strtoupper($class); ?>
        </span></h1>
    </div>

    <div class="in-20 font-14 text-semibold">

		<center>
			Thời gian diễn ra Event : <b>0h00 <?php echo date('d/m/Y', strtotime($time_begin)); ?></b> đến <b>24h00 <?php echo date('d/m/Y', strtotime($time_end)); ?></b><br>
    		Cập nhập lúc: <?php echo $time_top; ?> ( 5 phút cập nhập 1 lần )
    	</center><br />


        <table class="table table-blue table-border-2 table-text-center">
            <thead>
            <tr>
                <th>#</th>
                <th><?php echo $info1_name; ?></th>
                <th><?php echo $info2_name; ?></th>
                <?php if($action == "view_toprs") { ?>
                <th><?php echo $info3_name; ?></th>
                <th><?php echo $info4_name; ?></th>
                <?php } ?>
            </tr>
            </thead>
            <tbody>
            <?php if($action == "view_toprs") {
            if(isset($event_toprs_array[$type][$thehe][$class]) && is_array($event_toprs_array[$type][$thehe][$class])) {
                foreach($event_toprs_array[$type][$thehe][$class] as $key => $val) {
                    $vip_day_view = '';
                    if($val['vip_day'] > 0) $vip_day_view = "<span>". $val['vip_day'] ."d</span>";
            ?>
            <tr>
                <td><?php echo $key+1; ?></td>
                <td><?php echo $val['name']; ?> <?php if($val['vip'] > 0) echo "<span class='vip-box' title='VIP'><img src='images/super.gif' />$vip_day_view</span>"; ?></td>
                <td><?php echo $val['datatop']; ?> / <font color = "red"><?php echo $val['clevel']; ?></font> / <font color = "green"><?php echo $val['resets_all']; ?></font> / <font color = "blue"><?php echo $val['relifes']; ?></font></td>
                <?php if($action == "view_toprs") { ?>
                <td>
                <?php 
                    switch($val['class'])
                      {
                        case 0:  $Class ='Dark Wizark'; break;
            			case 1:  $Class ='Soul Master'; break;
            			case 2:
                        case 3:  $Class ='Grand Master'; break;
            			
            			case 16:  $Class ='Dark Knight'; break;
            			case 17:  $Class ='Blade Knight'; break;
            			case 18:
                        case 19:  $Class ='Blade Master'; break;
            			
            			case 32:  $Class ='Elf'; break;
            			case 33:  $Class ='Muse Elf'; break;
            			case 34:
                        case 35:  $Class ='Hight Elf';  break;
            			
            			case 48:  $Class ='Magic Gladiator'; break;
            			case 49:
                        case 50:  $Class ='Duel Master'; break;
            			
            			case 64:  $Class ='DarkLord'; break;
            			case 65:
                        case 66:  $Class ='Lord Emperor'; break;
            			
            			case 80:  $Class ='Sumonner'; break;
            			case 81:  $Class ='Bloody Summoner'; break;
            			case 82:
                        case 83:  $Class ='Dimension Master'; break;
            			
            			case 96:  $Class ='Rage Fighter'; break;
            			case 97:
                        case 98:  $Class ='First Master'; break;
                      }
                    echo $Class; 
                ?>
                </td>
                <td><?php echo date('d/m/Y H:i:s', $val['lastrs_time']); ?></td>
                <?php } ?>
            </tr>

            <?php } } } else {
                    for($i=0;$i<count($event_topcard_array);$i++) {
                        $vip_day_view = '';
                        if($event_topcard_array[$i]['vip_day'] > 0) $vip_day_view = "<span>". $event_topcard_array[$i]['vip_day'] ."d</span>";
            ?>
            <tr>
                <td><?php echo $i+1; ?></td>
                <td><?php echo $event_topcard_array[$i]['name']; ?>  <?php if($event_topcard_array[$i]['vip'] > 0) echo "<span class='vip-box' title='VIP'><img src='images/super.gif' />$vip_day_view</span>"; ?></td>
                <td><?php echo number_format($event_topcard_array[$i]['datatop'], 0, ',', '.'); ?></td>
            </tr>
            <?php } } ?>
            </tbody>
        </table>







        
    </div>
</div>