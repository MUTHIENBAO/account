	<style> 
	.play {
		display: block;
		left: 20%;
		height: 470px;
		padding: 0;
		position: relative;
		width: 470px;
	}
	.mm {
		display: block;
		height: 115px;
		width: 115px;
		background-image: url("images/border.png");
		background-size: 115px 115px;
		background-repeat: no-repeat;
		transition: all 0.5s ease 0s;
		text-align: center;
		line-height: 30px;
		font-size: 25px;
	}
	.mm.active {
		background-image: url("images/border-active.png");
		transition: all 0s ease 0s;
		font-size: 28px;
	}
	.mm img {
		max-width:90px;
		max-height:90px;
	}
	.mm.m1 {
		left: 5px;
		position: absolute;
		top: 5px;
	}
	.mm.m2 {
		left: 125px;
		position: absolute;
		top: 5px;
	}
	.mm.m3 {
		left: 245px;
		position: absolute;
		top: 5px;
	}
	.mm.m4 {
		left: 365px;
		position: absolute;
		top: 5px;
	}
	.mm.m5 {
		left: 365px;
		position: absolute;
		top: 125px;
	}
	.mm.m6 {
		left: 365px;
		position: absolute;
		top: 245px;
	}
	.mm.m7 {
		left: 365px;
		position: absolute;
		top: 365px;
	}
	.mm.m8 {
		left: 245px;
		position: absolute;
		top: 365px;
	}
	.mm.m9 {
		left: 125px;
		position: absolute;
		top: 365px;
	}
	.mm.m10 {
		left: 5px;
		position: absolute;
		top: 365px;
	}
	.mm.m11 {
		left: 5px;
		position: absolute;
		top: 245px;
	}
	.mm.m12 {
		left: 5px;
		position: absolute;
		top: 125px;
	}
	.result {
		position: absolute;
		left: 38%;
		top: 900px;
		width: 150px;
		height: 150px;
		text-align: center;
		font-size: 30px;
		background-size: 150px 150px;
		background-repeat: no-repeat;
		color: #0000FF;
	}
	.totaltxt {
		position: absolute;
		left: 350px;
		top: 910px;
	}
	#SL_LanQuayItem{
		font-size: 25px;
	}
	.tooltipdata {
		background-color: #121212;
		font-size: 12px;
		padding:5px 5px 5px 5px;
		-moz-border-radius:5px 5px 5px 5px;
		-webkit-border-radius:5px 5px 5px 5px;
	}
	.spinlist_tooltip {
		height: 115px;
		width: 115px;
		display: table-cell;
		vertical-align: middle;
	}
	</style>
	<script>
	var currentbox = 0;
	var currentbox2 = 0;
	var spinready = false;
	
	$(document).ready(function() {
		$('.spinlist_tooltip').tooltip();
		$.ajax({
			type: "GET",
			url: "ajax_action.php?ajax=event_luckyspin&action=spin_number",
			cache: false,
			beforeSend: function() {
				$("#SL_LanQuayItem").html("<img src='images/loading1.gif' border='0' />");
			},
			success: function(html) {
				$("#SL_LanQuayItem").html(html);
				spinready = true;
			}
		});
	});
	
	function wheel(speed, result, stringtxt){
		speed = speed+1;
		var spin = 12*3 + result;
		setTimeout(function() {
			$('ul.play li:eq(' + currentbox + ')').addClass('active').siblings().removeClass('active');
			currentbox++;
			currentbox2++;
			if (currentbox == 12) currentbox = 0;
			if (currentbox2 < spin) wheel(speed, result, stringtxt);
			else {
				currentbox=0;
				currentbox2=0;
				spinready = true;
				$("#result").html("<img src='images/startspin.png'>");
				alert("Bạn nhận được phần thưởng: " + stringtxt);
			}
		}, speed);
	}

	function getspin(){
		var lanquay =  parseInt(document.getElementById("SL_LanQuayItem").innerHTML);
		if(parseInt(<?=$accept;?>) == 1){
			if(spinready == true && lanquay >0 ){
				spinready = false;
				$.ajax({
					type: "GET",
					url: "ajax_action.php?ajax=event_luckyspin&action=spin_receive",
					cache: false,
					beforeSend: function() {
						$("#result").html("<img src='images/loading-spin.gif' border='0' />");
					},
					success: function(html) {
						if(html.indexOf('OK') > -1) {
							var DataSplit = html.split("|");
							$("#SL_LanQuayItem").html(DataSplit[3]);
							wheel(50, parseInt(DataSplit[1]), DataSplit[2]);
						}
						else {
							alert(html);
							spinready = true;
						}
				   }
				});
			}
		} else alert("Hãy đổi nhân vật và thoát game khi thực hiện chức năng này!.");
	}
	
	function spinHistory(){
                
        $.ajax({
            type: "GET",
            url: "ajax_action.php?ajax=event_luckyspin&action=spin_history",
            cache: false,
            beforeSend: function() {
                 $("#spin_history").html("<img src='images/loading1.gif' border='0' />");
            },
            complete: function() {
                
            },
            success: function(html) {
                $("#spin_history").html("<div class='info_noimg'>"+ html +"</div>");
            }
         });
        
        return false;
    }
	</script>
	<div class="primary-block">

		<div class="main-content">

			<h1 class="title-content">Event Vòng Quay May Mắn</h1>

		</div>

	</div>
	
<div class="priority-block out-top-20">

    <div class="head-block">

        <h1 class="title-head"><span class="text-semibold">Hướng dẫn nhận Spin</span></h1>

    </div>

    <div class="in-20">

        <ul class="noted in-left-10">

            <li>Vào mục Tiền tệ <strong>Mua lần quay may mắn</strong> để mua lần quay.</li>
			<li><?php if($Use_maxrsgetspin == 1){ ?>Reset chạm mốc giới hạn. Để nhận <?php echo $maxrs_spin; ?> lần quay<? } ?></li>

            <li><strong>Nạp thẻ để nhận được số lần quay</strong></li> 

            <li>Với mệnh giá<strong> 20.000</strong> : nhận được <strong><?php echo $card20_spin; ?> lần quay</strong></li>
			<li>Với mệnh giá<strong> 50.000</strong> : nhận được <strong><?php echo $card50_spin; ?> lần quay</strong></li>
			<li>Với mệnh giá<strong> 100.000</strong> : nhận được <strong><?php echo $card100_spin; ?> lần quay</strong></li>
			<li>Với mệnh giá<strong> 200.000</strong> : nhận được <strong><?php echo $card200_spin; ?> lần quay</strong></li>
			<li>Với mệnh giá<strong> 500.000</strong> : nhận được <strong><?php echo $card500_spin; ?> lần quay</strong></li>

           
        </ul>

    </div>

</div>	

<div class="primary-block out-top-20">

    <div class="head-block">

        <h1 class="title-head"><span class="text-semibold">Thông tin nhân vật</span></h1>

    </div>

    <div class="in-20">

        <div class="form-2" id="rs_content">

            <div class="form-row">

                <div class="form-col-1"><span>Đổi nhân vật</span></div>

                <div class="form-col-2"><?php echo $doinv; ?></div>

                <div class="form-col-3">&nbsp;</div>

            </div>

            <div class="form-row">

                <div class="form-col-1"><span>Thoát Game</span></div>

                <div class="form-col-2"><?php echo $online; ?></div>

                <div class="form-col-3">&nbsp;</div>

            </div>
			
			<div class="form-row">

                <div class="form-col-1"><span>Số lần quay đang có</span></div>

                <div class="form-col-2"> <span id="SL_LanQuayItem"></span></div>

                <div class="form-col-3">&nbsp;</div>

            </div>

        </div>

    </div>

</div>
<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Tiến Hành Quay</span></h1>
    </div>
    <div class="in-20">

<ul class="play">
	<? for($p=0;$p<12;$p++){?>
	<li class="mm m<?=$p+1;?>">
		<a href="#" id="spinlist_tooltip_<?=$p+1;?>" class="spinlist_tooltip"><img src="items/<?=$spinlist[$p][img];?>.gif"></a>
		<div id="data_spinlist_tooltip_<?=$p+1;?>" style="display:none;">
		<div style="background-color: #121212; font-size: 12px;"><?=$spinlist[$p][des];?></div>
		</div>
	</li>
	<?}?>
</ul>

	<div class="result">
		<a href="javascript:void(0);" OnClick="getspin();" id="result"><img src="images/startspin.png"></a>
	</div>
    </div>
	
	<br /><br />

	<center>
        <input type="button" OnClick="spinHistory();" id="btn_spin_history" value="Xem lịch Quay" />
	</center>
	
	<div id="spin_history">


        &nbsp;


    </div>
</div>

	

	