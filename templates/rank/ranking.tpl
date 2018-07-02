<div class="primary-block">


    <div class="main-content">


        <h1 class="title-content">Xếp hạng Reset nhân vật</h1>


        <div class="intro-content">


            <div class="in-20">


                <span class="color-violet">Xếp hạng Theo Số lần Reset/Relife</span>


            </div>


        </div>


    </div>


</div>





<div class="primary-block out-top-20">


    <?php include('templates/rank/rankrs_top.tpl');
   
    ?>


    


    <div class="in-20 font-14 text-semibold">


        <p class="update-time"><span class="color-red">Cập nhập lúc:</span> <span class="color-brown"><?php echo $time_top; ?><span class="color-red"> <span class="color-red">( 5 phút cập nhập 1 lần )</span></p>





        <div class="out-top-20">


            <p class="in-10">


                <span class="color-blue"><?php echo $title_top; ?></span>


            </p>


            <table class="table table-blue table-border-1 table-text-center ">


                <thead>


                <tr>


                    <th width="2%">#</th>


                    <th width="15%">Nhân vật</th>


                    <th width="5%">Relife</font></th>


                    <th width="5%">Reset</font></th>


                    <th width="5%">Level</th>


                    <th width="8%">Point</th>


                    <th width="8%">P.Master</th>


                    <!--<th width="8%">P.UT</th>-->


                    <th width="8%">PC Point</th>


                    <th width="8%">Class</th>


                    <th width="15%">Reset Cuối</th>


                    <th width="15%">Đổi Class</th>


                </tr>


                </thead>


                <tbody>


                <?php for($i=0;$i<count($char);$i++) { 


                    $j=$i+1;


                    $vip_day_view = '';


                    if($char[$i]['vip_day'] > 0) $vip_day_view = "<span>". $char[$i]['vip_day'] ."d</span>";


                ?>


                <tr>


                    <td align="center"><?php echo $j; ?></td>


                    <td align="center"><?php echo $char[$i]['name']; ?> <?php if($char[$i]['vip'] > 0) echo "<span class='vip-box' title='VIP'><img src='images/super.gif' />$vip_day_view</span>"; ?></td>


                    <td align="center"><font color="red"><?php echo $char[$i]['relife']; ?></font></td>


                    <td><font color="blue"><?php echo $char[$i]['reset']; ?></font></td>


                    <td><?php echo $char[$i]['level']; ?></td>


                    <td align="center"><?php echo $char[$i]['point_total']; ?></td>


                    <td align="center"><?php echo $char[$i]['master_point']; ?></td>


                    <!--<td align="center"><?php echo $char[$i]['point_ut']; ?></td>-->


                    <td align="center"><?php echo $char[$i]['pc_point']; ?></td>


                    <td align="center"><?php echo $char[$i]['nvclass']; ?></td>


                    <td align="center"><?php echo $char[$i]['lastrs_time']; ?></td>


                    <td align="center"><?php $char[$i]['dgt_time']; ?></td>


                </tr>


                <?php } ?>


                </tbody>


            </table>


        </div>


    </div>


</div>