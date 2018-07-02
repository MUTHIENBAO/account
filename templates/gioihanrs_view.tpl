<div class="ModuleManage">
    <h3 class="TitleModule">Giới hạn Reset</h3>
    
	<div class="BlockTwoColumn">
<?php
    foreach($use_gioihanrs as $key => $val) {
        if($val == 1) {
?>
            <table width="100%" border="0" bgcolor="#9999FF">
    		  <tr bgcolor="#FFFFFF">
    		    <td colspan="4" align="center">
    		    	Giới hạn Reset trong ngày thế hệ <b><?php echo $thehe_choise[$key]; ?></b>
    	    	</td>
    		  </tr>
    		  <tr bgcolor="#FFFFFF">
    		    <td align="center" rowspan="2"><b>TOP</b></td>
    		    <td align="center" colspan="3"><b>Reset tối đa / ngày</b></td>
    		  </tr>
              <tr bgcolor="#FFFFFF">
    		    <td align="center"><b>Thứ 2 - Thứ 6</b></td>
    		    <td align="center"><b>Thứ 7</b></td>
                <td align="center"><b>Chủ Nhật</b></td>
    		  </tr>
    		  <tr bgcolor="#FFFFFF">
    		    <td align="center">TOP 1</td>
    		    <td align="center"><?php echo $gioihanrs_top1[$key]; ?> lần / ngày</td>
                <td align="center"><?php echo $gioihanrs_top1[$key] + floor($gioihanrs_top1[$key]*$overrs_sat_extra[$key]/100); ?> lần / ngày</td>
                <td align="center"><?php echo $gioihanrs_top1[$key] + floor($gioihanrs_top1[$key]*$overrs_sun_extra[$key]/100); ?> lần / ngày</td>
    		  </tr>
              <tr bgcolor="#FFFFFF">
    		    <td align="center">TOP 2</td>
    		    <td align="center"><?php echo $gioihanrs_top2[$key]; ?> lần / ngày</td>
                <td align="center"><?php echo $gioihanrs_top2[$key] + floor($gioihanrs_top2[$key]*$overrs_sat_extra[$key]/100); ?> lần / ngày</td>
                <td align="center"><?php echo $gioihanrs_top2[$key] + floor($gioihanrs_top2[$key]*$overrs_sun_extra[$key]/100); ?> lần / ngày</td>
    		  </tr>
              <tr bgcolor="#FFFFFF">
    		    <td align="center">TOP 3</td>
    		    <td align="center"><?php echo $gioihanrs_top3[$key]; ?> lần / ngày</td>
                <td align="center"><?php echo $gioihanrs_top3[$key] + floor($gioihanrs_top3[$key]*$overrs_sat_extra[$key]/100); ?> lần / ngày</td>
                <td align="center"><?php echo $gioihanrs_top3[$key] + floor($gioihanrs_top3[$key]*$overrs_sun_extra[$key]/100); ?> lần / ngày</td>
    		  </tr>
              <tr bgcolor="#FFFFFF">
    		    <td align="center">TOP 4</td>
    		    <td align="center"><?php echo $gioihanrs_top4[$key]; ?> lần / ngày</td>
                <td align="center"><?php echo $gioihanrs_top4[$key] + floor($gioihanrs_top4[$key]*$overrs_sat_extra[$key]/100); ?> lần / ngày</td>
                <td align="center"><?php echo $gioihanrs_top4[$key] + floor($gioihanrs_top4[$key]*$overrs_sun_extra[$key]/100); ?> lần / ngày</td>
    		  </tr>
              <tr bgcolor="#FFFFFF">
    		    <td align="center">TOP 5-10</td>
    		    <td align="center"><?php echo $gioihanrs_top10[$key]; ?> lần / ngày</td>
                <td align="center"><?php echo $gioihanrs_top10[$key] + floor($gioihanrs_top10[$key]*$overrs_sat_extra[$key]/100); ?> lần / ngày</td>
                <td align="center"><?php echo $gioihanrs_top10[$key] + floor($gioihanrs_top10[$key]*$overrs_sun_extra[$key]/100); ?> lần / ngày</td>
    		  </tr>
    		  <tr bgcolor="#FFFFFF">
    		    <td align="center">TOP 11-20</td>
    		    <td align="center"><?php echo $gioihanrs_top20[$key]; ?> lần / ngày</td>
                <td align="center"><?php echo $gioihanrs_top20[$key] + floor($gioihanrs_top20[$key]*$overrs_sat_extra[$key]/100); ?> lần / ngày</td>
                <td align="center"><?php echo $gioihanrs_top20[$key] + floor($gioihanrs_top20[$key]*$overrs_sun_extra[$key]/100); ?> lần / ngày</td>
    		  </tr>
    		  <tr bgcolor="#FFFFFF">
    		    <td align="center">TOP 21-30</td>
    		    <td align="center"><?php echo $gioihanrs_top30[$key]; ?> lần / ngày</td>
                <td align="center"><?php echo $gioihanrs_top30[$key] + floor($gioihanrs_top30[$key]*$overrs_sat_extra[$key]/100); ?> lần / ngày</td>
                <td align="center"><?php echo $gioihanrs_top30[$key] + floor($gioihanrs_top30[$key]*$overrs_sun_extra[$key]/100); ?> lần / ngày</td>
    		  </tr>
    		  <tr bgcolor="#FFFFFF">
    		    <td align="center">TOP 31-40</td>
    		    <td align="center"><?php echo $gioihanrs_top40[$key]; ?> lần / ngày</td>
                <td align="center"><?php echo $gioihanrs_top40[$key] + floor($gioihanrs_top40[$key]*$overrs_sat_extra[$key]/100); ?> lần / ngày</td>
                <td align="center"><?php echo $gioihanrs_top40[$key] + floor($gioihanrs_top40[$key]*$overrs_sun_extra[$key]/100); ?> lần / ngày</td>
    		  </tr>
    		  <tr bgcolor="#FFFFFF">
    		    <td align="center">TOP 41-50</td>
    		    <td align="center"><?php echo $gioihanrs_top50[$key]; ?> lần / ngày</td>
                <td align="center"><?php echo $gioihanrs_top50[$key] + floor($gioihanrs_top50[$key]*$overrs_sat_extra[$key]/100); ?> lần / ngày</td>
                <td align="center"><?php echo $gioihanrs_top50[$key] + floor($gioihanrs_top50[$key]*$overrs_sun_extra[$key]/100); ?> lần / ngày</td>
    		  </tr>
    		  <tr bgcolor="#FFFFFF">
    		    <td align="center">TOP > 50</td>
    		    <td align="center"><?php echo $gioihanrs_other[$key]; ?> lần / ngày</td>
                <td align="center"><?php echo $gioihanrs_other[$key] + floor($gioihanrs_other[$key]*$overrs_sat_extra[$key]/100); ?> lần / ngày</td>
                <td align="center"><?php echo $gioihanrs_other[$key] + floor($gioihanrs_other[$key]*$overrs_sun_extra[$key]/100); ?> lần / ngày</td>
    		  </tr>
    		</table>
<?php
        } elseif($val == 2) {
?>
            <table width="100%" border="0" bgcolor="#9999FF">
    		  <tr bgcolor="#FFFFFF">
    		    <td colspan="4" align="center">
    		    	Giới hạn Reset trong ngày thế hệ <b><?php echo $thehe_choise[$key]; ?></b>
    	    	</td>
    		  </tr>
    		  <tr bgcolor="#FFFFFF">
    		    <td align="center" rowspan="2"><b>TOP</b></td>
    		    <td align="center" colspan="3"><b>Reset tối đa / ngày</b></td>
    		  </tr>
              <tr bgcolor="#FFFFFF">
    		    <td align="center"><b>Thứ 2 - Thứ 6</b></td>
    		    <td align="center"><b>Thứ 7</b></td>
                <td align="center"><b>Chủ Nhật</b></td>
    		  </tr>
    		  <tr bgcolor="#FFFFFF">
    		    <td align="center">TOP 1</td>
    		    <td align="center"><?php echo $gioihanrs2_top1[$key]; ?> lần / ngày</td>
                <td align="center"><?php echo $gioihanrs2_top1[$key] + floor($gioihanrs2_top1[$key]*$overrs_sat_extra[$key]/100); ?> lần / ngày</td>
                <td align="center"><?php echo $gioihanrs2_top1[$key] + floor($gioihanrs2_top1[$key]*$overrs_sun_extra[$key]/100); ?> lần / ngày</td>
    		  </tr>
              <tr bgcolor="#FFFFFF">
    		    <td align="center">TOP 2-5</td>
    		    <td align="center" colspan="3">Reset không giới hạn đến cách TOP 1 Reset MAX ngày <strong><?php echo $gioihanrs2_top2[$key]; ?></strong> Reset</td>
    		  </tr>
              <tr bgcolor="#FFFFFF">
    		    <td align="center">TOP 6-10</td>
    		    <td align="center" colspan="3">Reset không giới hạn đến cách TOP 1 Reset MAX ngày <strong><?php echo $gioihanrs2_top3[$key]; ?></strong> Reset</td>
    		  </tr>
              <tr bgcolor="#FFFFFF">
    		    <td align="center">TOP 11-15</td>
    		    <td align="center" colspan="3">Reset không giới hạn đến cách TOP 1 Reset MAX ngày <strong><?php echo $gioihanrs2_top4[$key]; ?></strong> Reset</td>
    		  </tr>
              <tr bgcolor="#FFFFFF">
    		    <td align="center">TOP 16-20</td>
    		    <td align="center" colspan="3">Reset không giới hạn đến cách TOP 1 Reset MAX ngày <strong><?php echo $gioihanrs2_top5[$key]; ?></strong> Reset</td>
    		  </tr>
    		  <tr bgcolor="#FFFFFF">
    		    <td align="center">TOP 21-25</td>
    		    <td align="center" colspan="3">Reset không giới hạn đến cách TOP 1 Reset MAX ngày <strong><?php echo $gioihanrs2_top6[$key]; ?></strong> Reset</td>
    		  </tr>
    		  <tr bgcolor="#FFFFFF">
    		    <td align="center">TOP 26-30</td>
    		    <td align="center" colspan="3">Reset không giới hạn đến cách TOP 1 Reset MAX ngày <strong><?php echo $gioihanrs2_top7[$key]; ?></strong> Reset</td>
    		  </tr>
    		  <tr bgcolor="#FFFFFF">
    		    <td align="center">TOP 31-40</td>
    		    <td align="center" colspan="3">Reset không giới hạn đến cách TOP 1 Reset MAX ngày <strong><?php echo $gioihanrs2_top8[$key]; ?></strong> Reset</td>
    		  </tr>
    		  <tr bgcolor="#FFFFFF">
    		    <td align="center">TOP 41-50</td>
    		    <td align="center" colspan="3">Reset không giới hạn đến cách TOP 1 Reset MAX ngày <strong><?php echo $gioihanrs2_top9[$key]; ?></strong> Reset</td>
    		  </tr>
    		  <tr bgcolor="#FFFFFF">
    		    <td align="center">TOP > 50</td>
    		    <td align="center" colspan="3">Reset không giới hạn đến cách TOP 1 Reset MAX ngày <strong><?php echo $gioihanrs2_top10[$key]; ?></strong> Reset</td>
    		  </tr>
    		</table>
<?php
        }
    }
?>
    
    </div>
</div>