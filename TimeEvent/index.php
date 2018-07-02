<?php include('config.php');?>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<META HTTP-EQUIV="Refresh" CONTENT="900; URL=#">
<link rel="Shortcut Icon" href="favicon.ico" type="image/x-icon">
	<title>Thời gian Sự Kiện</title>
	<!-- CSS -->
	<link href="css/jquery-ui-1.8.6.custom.css" rel="stylesheet" type="text/css">
	<link href="css/reset.css" rel="stylesheet" type="text/css">
	<link href="css/layout.css" rel="stylesheet" type="text/css">
	<link href="css/ie.css" rel="stylesheet" type="text/css">
<link href="css/style.css" type="text/css" rel="stylesheet" />
	<!-- JS -->
	<script src="js/jquery-1.11.3.js"></script>
	<script src="js/jquery.countdown.js"></script>
	<script src="js/event.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    <?if($Blood_Event){?>$.get("ajax.php?event=blood", function(data){Blood(data);});<?}?>
	<?if($Devil_Event){?>$.get("ajax.php?event=devil", function(data){Devil(data);});<?}?>
	<?if($Chaos_Event){?>$.get("ajax.php?event=chaos", function(data){Chaos(data);});<?}?>
	<?if($RedDragon_Event){?>$.get("ajax.php?event=reddragon", function(data){RedDragon(data);});<?}?>
	<?if($PhuThuyTrang_Event){?>$.get("ajax.php?event=phuthuytrang", function(data){PhuThuyTrang(data);});<?}?>
	<?if($Blue_Event_Enable){?>$.get("ajax.php?event=blue", function(data){Blue(data);});<?}?>
	<?if($Sky_Event_Enable){?>$.get("ajax.php?event=sky", function(data){Sky(data);});<?}?>
	<?if($Raklion_Event_Enable){?>$.get("ajax.php?event=raklion", function(data){Raklion(data);});<?}?>
	<?if($Swamp_Event_Enable){?>$.get("ajax.php?event=swamp", function(data){Swamp(data);});<?}?>
	<?if($Summer_Event_Enable){?>$.get("ajax.php?event=summer", function(data){Summer(data);});<?}?>
	<?if($HideAndSeek_Event_Enable){?>$.get("ajax.php?event=hideandseek", function(data){HideAndSeek(data);});<?}?>
	<?if($RongVang_Event_Enable){?>$.get("ajax.php?event=rongvang", function(data){RongVang(data);});<?}?>	
	<?if($daichienkundun){?>$.get("ajax.php?event=daichienkundun", function(data){daichienkundun(data);});<?}?>		
	<?if($santa){?>$.get("ajax.php?event=santa", function(data){santa(data);});<?}?>		
	<?if($PvP_Event_Enable){?>$.get("ajax.php?event=pvpevent", function(data){PvP_Event(data);});<?}?>		
	<?if($CastleDeep_Event_Enable){?>$.get("ajax.php?event=castledeep", function(data){CastleDeep_Event(data);});<?}?>		
});
</script>
<body>
<div id="wrapper">
	<div class="wrapperIn">
		<div id="header"> <a class="logo"">Trang chủ</a>
			<div class="TopLink">
				<ul><li>
					<a href="http://mungoalong.net" target="_blank">Trang chủ</a> | 
					<a href="http://taikhoan.mungoalong.net" target="_blank">Tài khoản</a> | 
					<a href="http://forum.mungoalong.net" target="_blank">Diễn đàn</a>
				</li></ul>
		</div>
	</div>

	<div id="static">
	<div class="StaticOuter">
    	<div class="StaticInner">
        	<div id="main">
        	  <div class="StaticMain">
        	    <div class="ContentBlock">
	<!-- Test -->
	<!-- # -->	
        <div class="title">		
	<div class="importantMessage">
	<li><b><font color="Crimson">- Hướng dẫn bán hàng rời mạng không cần treo máy trong game</font></b></li>
	<li><b>Bước 1:</b> Di chuyển nhân vật sang Sub-1 map họp chợ là Loren-Market trước khi sử dụng lệnh</li>
	<li><b>Bước 2:</b> Đặt các món đồ cần bán lên cửa hàng và đặt giá bán sau đó để nguyên không cần nhập tên cửa hàng</li>
	<li><b>Bước 3:</b> Gõ lệnh <font color="Green">/offtrade + tên tiền tệ</font> là lập tức nhân vật của bạn bị mất kết nối và đang ở trong trạng thái treo bán hàng (nhớ phải đặt giá trước khi dùng lệnh)</li>
	<li><b><font color="Orange">Danh sách lệnh:</font></b> bless, soul, life, cre, wcoin, vipmonney (muốn bán item với loại tiền nào thì gõ /offtrade + ..., ví dụ <font color="Green">/offtrade bless, /offtrade soul)</font></li>
	<li><b>Bước 4:</b> Đăng nhập lại vào Sub-1 để vào game bình thường</li>
	<li><b><font color=bLUE>ĐỌC KĨ CHÚ Ý TRƯỚC KHI BÁN HÀNG:</font></b></li>
	<li>- Phí khi dùng lệnh là 500.000 zen, khi gõ lệnh sẽ trừ Zen, nếu thiếu sẽ không sử dụng được.</li>
	<li>- KHÔNG được vừa Online vừa bán hàng vì rất dễ bán nhầm đồ thành Zen</li>
	<li>- Vì vậy để an toàn khi bán đồ các bạn nên dứt khoát khi bán là phải dùng lệnh để out ngay, hoặc dùng tài khoản phụ bán đồ, khi đặt giá nhớ dùng nhân vật khác kiểm tra lại cửa hàng một lần nữa trước khi rời mạng hoàn toàn. Mọi nhầm lẫn các bạn phải tự chịu trách nhiệm!</li>
	<br>
	
	</div>
        </div>
		<!-- Test -->
	</div>
  <div class="price-box">		
<table style="width: 85%" align="center" cellspacing="0" cellpadding="0">
	<thead>
		<tr style="background-color: #65564F; color:#fff; text-shadow:1px 1px 1px #000000">
			<td colspan="7" class="center">HỆ THỐNG NGUYÊN LIỆU</td>
		</tr>
		
		<tr style="background-color: #65564F">
			<td rowspan="1" class="center" style="width: 10%">Hình ảnh</td>
			<td rowspan="1" class="center" style="width: 30%">Tên nguyên liệu</td>
			<td colspan="1" class="center" style="width: 10%">Sub rơi</td>
			<td colspan="1" class="center" style="width: 10%">Tỷ lệ</td>
			<td colspan="1" class="center" style="width: 15%">Bản đồ</td>
			<td colspan="1" class="center" style="width: 30%">Quái vật</td>
		</tr>
	</thead>

	<tbody>
		<tr>
			<td class="center"><img src="images/nguyenlieu/longvu.jpg" width="40"></td>
			<td class="center"><b>Lông vũ</b><br><font color=Green size=2><a href="http://i.imgur.com/iTjBB0J.png" target="_blank">(Ghi "Long Vu" vào Auto để tự nhặt, click để xem chi tiết hơn)</a></font></td>
			<td class="center">2-3</td>
			<td class="center">1%</td>
			<td class="center">Icarus</td>
			<td class="center">Quái vật cấp 100 trở lên<br>Rồng đỏ, Phượng hoàng lửa</td>
		</tr>		
	</tbody>

	<tbody>
		<tr>
			<td class="center"><img src="images/nguyenlieu/hhht.jpg" width="40"></td>
			<td class="center"><b>Huy Hiệu Hoàng Tộc</b><br><font color=Green size=2><a href="http://i.imgur.com/iTjBB0J.png" target="_blank">(Ghi "u Ho" vào auto để tự nhặt, click để xem chi tiết hơn)</a></font></td>
			<td class="center">2-3</td>
			<td class="center">1%</td>
			<td class="center">Icarus</td>
			<td class="center">Quái vật cấp 96<br>Hắc thiên ma</td>
		</tr>		
	</tbody>

	<tbody>
		<tr>
			<td class="center"><img src="images/nguyenlieu/chienma.jpg" width="40"></td>
			<td class="center"><b>Linh hồn chiến mã, quạ tinh</b></td>
			<td class="center">2-3-4-5</td>
			<td class="center">1%</td>
			<td class="center">Toàn bộ bản đồ</td>
			<td class="center">Quái vật cấp 100 trở lên</td>
		</tr>		
	</tbody>	

	<tbody>
		<tr>
			<td class="center"><img src="images/nguyenlieu/condor.jpg" width="40"></td>
			<td class="center"><b>Linh hồn Condor</b><br><font color=Green size=2>(Ghi Condor vào Auto để tự nhặt)</font><br><font color="red">Chưa áp dụng</font></td>
			<td class="center">2-3</td>
			<td class="center">1%</td>
			<td class="center">Tháp tinh luyện</td>
			<td class="center">Diệt vong quỷ</td>
		</tr>		
	</tbody>

	<tbody>
		<tr>
			<td class="center"><img src="images/nguyenlieu/moonstone.jpg" width="40"></td>
			<td class="center"><b>Nhẫn Moonstone</b><br><font size=2>(độ bền thấp)</font></td>
			<td class="center">2-3-4-5</td>
			<td class="center">1%</td>
			<td class="center">Tháp tinh luyện</td>
			<td class="center">Toàn bộ quái</td>
		</tr>		
	</tbody>

	<tbody>
		<tr>
			<td class="center"><img src="images/nguyenlieu/danguyenthuy.jpg" width="40"></td>
			<td class="center"><b>Đá nguyên thủy</b></td>
			<td class="center">2-3-4-5</td>
			<td class="center">1%</td>
			<td class="center">Tháp tinh luyện</td>
			<td class="center">Toàn bộ quái</td>
		</tr>		
	</tbody>

	<tbody>
		<tr>
			<td class="center"><img src="images/nguyenlieu/chaos.jpg" width="40"></td>
			<td class="center"><b><font color="#daa520">Ngọc Hỗn Nguyên</font></b></td>
			<td class="center">Toàn bộ</td>
			<td class="center">1%</td>
			<td class="center">Toàn bộ</td>
			<td class="center">Quái vật cấp trên 30</td>
		</tr>		
	</tbody>

	<tbody>
		<tr>
			<td class="center"><img src="images/nguyenlieu/life.jpg" width="40"></td>
			<td class="center"><b><font color="#cc6600">Ngọc Sinh Mệnh</font></b></td>
			<td class="center">Toàn bộ</td>
			<td class="center">1%</td>
			<td class="center">Toàn bộ</td>
			<td class="center">Quái vật cấp trên 50</td>
		</tr>		
	</tbody>

	<tbody>
		<tr>
			<td class="center"><img src="images/nguyenlieu/bless.jpg" width="40"></td>
			<td class="center"><b><font color="#6633cc">Ngọc Ước Nguyện</font></b></td>
			<td class="center">Toàn bộ</td>
			<td class="center">1%</td>
			<td class="center">Toàn bộ</td>
			<td class="center">Quái vật cấp trên 75</td>
		</tr>		
	</tbody>

	<tbody>
		<tr>
			<td class="center"><img src="images/nguyenlieu/soul.jpg" width="40"></td>
			<td class="center"><b><font color="#ff3399">Ngọc Tâm Linh</font></b></td>
			<td class="center">Toàn bộ</td>
			<td class="center">1%</td>
			<td class="center">Toàn bộ</td>
			<td class="center">Quái vật cấp trên 85</td>
		</tr>		
	</tbody>

	<tbody>
		<tr>
			<td class="center"><img src="images/nguyenlieu/book.gif" width="40"></td>
			<td class="center"><b>Các loại skill cấp 220</b><br><font size=2>(Ngọc chém băng, Ngọc ngũ tiễn, Ngọc phục hồi SD, Ngọc kiếm lửa, Sách bóng ma, Sách tăng ma lực)</font></td>
			<td class="center">Toàn bộ</td>
			<td class="center">1%</td>
			<td class="center">Toàn bộ</td>
			<td class="center">Quái vật cấp trên 100</td>
		</tr>		
	</tbody>
</table>
        </div>
		<!-- # --><br>
       <div class="event-countdown">
        <div class="price-box">		
<table style="width: 100%" align="center" cellspacing="0" cellpadding="0">
	<thead>
		<tr style="background-color: #65564F; color:#fff; text-shadow:1px 1px 1px #000000">
			<td colspan="7" class="center">ĐẾM NGƯỢC THỜI GIAN EVENT SẮP DIỄN RA TRONG GAME</td>
		</tr>
		
		<tr style="background-color: #65564F">
			<td rowspan="1" class="center" style="width: 13%">Server</td>
			<td rowspan="1" class="center" style="width: 50%">Thông tin sự kiện</td>
			<td colspan="1" class="center" style="width: 10%">Giờ kế tiếp</td>
			<td colspan="1" class="center" style="width: 11%">Đếm ngược</td>
		</tr>
	</thead>

	<tbody id="event-time">
<?
	if($Blood_Event_Enable){
		echo '
			<tr>
			<td align="center"><a class="tag tag-orange">All server</a></td>
			<td align="center"><b>Blood Castle</b><br><font size=2>Lâu Đài Máu có Exp gấp 3 lần bên ngoài</font><br><font color=#D28200 size=2>(2 tiếng một lần bắt đầu từ 0:30)</font></td>
			<td align="center"><center><strong id="next_blood" class="tag tag-green"></strong></center></td>
			<td align="center"><center><span id="blood"></span></center></td>
			</tr>';
		}
	if($Devil_Event_Enable){
		echo '
			<tr>
			<td align="center"><a class="tag tag-orange">All server</a></td>
			<td align="center"><b>Devil Square</b><br><font size=2>Quảng Trường Quỷ có Exp gấp 3 lần bên ngoài</font><br><font color=#D28200 size=2>(2 tiếng một lần bắt đầu từ 1:00)</font></td>
			<td align="center"><center><strong id="next_devil" class="tag tag-green"></strong></center></td>
			<td align="center"><center><span id="devil"></span></center></td>
			</tr>';
		}
	if($Chaos_Event_Enable){
		echo '
			<tr>
			<td align="center"><a class="tag tag-blue">Server: 2,3</a></td>
			<td align="center"><b>Chaos Castle</b><br><font size=2>Nếu bạn là người sống sót cuối cùng trong Hỗn Nguyên Lâu thì sẽ có cơ hội nhận Ngọc hoặc đồ Thần</font><br><font color=#D28200 size=2>(2 tiếng một lần bắt đầu từ 1:00)</font></td>
			<td align="center"><center><strong id="next_chaos" class="tag tag-green"></strong></center></td>
			<td align="center"><center><span id="chaos"></span></center></td>
		</tr>';
		}
	if($RedDragon_Event_Enable){
		echo '
			<tr>
			<td align="center"><a class="tag tag-orange">All server</a></td>
			<td align="center"><b>Red Dragon</b><br><font size=2>Săn rồng đỏ kiếm Ngọc ước nguyện</font><br><font color=#D28200 size=2>(2 tiếng một lần bắt đầu từ 2:00 giờ chẵn)</font></td>
			<td align="center"><center><strong id="next_reddragon" class="tag tag-green"></strong></center></td>
			<td align="center"><center><span id="reddragon"></span></center></td>
			</tr>';
		}
	if($PhuThuyTrang_Event_Enable){
		echo '
			<tr>
			<td align="center"><a class="tag tag-orange">All server</a></td>
			<td align="center"><b>Binh đoàn Phù Thủy Trắng</b><br><font size=2>Săn phù thủy trắng kiếm Ngọc ước nguyện và nhẫn phù thủy</font><br><font color=#D28200 size=2>(2 tiếng một lần bắt đầu từ 2:00 giờ chẵn)</font></td>
			<td align="center"><center><strong id="next_phuthuytrang" class="tag tag-green"></strong></center></td>
			<td align="center"><center><span id="phuthuytrang"></span></center></td>
			</tr>';
		}
	if($Blue_Event_Enable){
		echo '
			<tr>
			<td align="center"><a class="tag tag-orange">All server</a></td>
			<td align="center"><b>Blue Event</b><br><font size=2>Săn thỏ để kiếm Ngọc<br><b><font color=#007CDA>Tọa độ:</b> Lostower0 (202,42) - Tarkan1 (151,101)</font></font><br><font color=#D28200 size=2>(5:40, 20:40)</font></td>
			<td align="center"><center><strong id="next_blue" class="tag tag-green"></strong></center></td>
			<td align="center"><center><span id="blue"></span></center></td>
			</tr>';
		}
	if($Summer_Event_Enable){
		echo '
			<tr>
			<td align="center"><a class="tag tag-orange">All server</a></td>
			<td align="center"><b>Summer Event</b><br><font size=2>Săn Ô May Mắn để kiếm Ngọc<br><b><font color=#007CDA>Tọa độ:</b> Lorencia (213,141) và (119,66)</font><br><font color=#D28200 size=2>(0:40, 15:40)</font></td>
			<td align="center"><center><strong id="next_summer" class="tag tag-green"></strong></center></td>
			<td align="center"><center><span id="summer"></span></center></td>
			</tr>';
		}
	if($HideAndSeek_Event_Enable){
		echo '
			<tr>
			<td align="center"><a class="tag tag-blue">Server: 1</a></td>
			<td align="center"><b>Trốn tìm cùng NPC</b><br><font size=2>Truy tìm NPC để nhận Hộp Quà<br><b><font color=#007CDA>Bản dồ:</b> Ngẫu nhiên ở Lorencia<br><font color=#D28200 size=2>(19:30, 19:35, 19:40, 19:45, 19:50, 19:55)</font></td>
			<td align="center"><center><strong id="next_hideandseek" class="tag tag-green"></strong></center></td>
			<td align="center"><center><span id="hideandseek"></span></center></td>
		</tr>';
		}
	// if($santa){
		// echo '
			// <tr>
			// <td align="center"><a class="tag tag-blue">Server: 1</a></td>
			// <td align="center"><b>Santa Event</b><br><font size=2>Tiêu diệt binh đoàn người tuyết và ông già Noel để có cơ hội nhặt được Vé làng Santa, vé có thể quy đổi ra Vcent tại web quản lý tài khoản!<br><b><font color=#007CDA>Tham gia tại:</b> NPC Sự kiện đứng ở Lorencia<br><font color=#D28200 size=2>(20:30)</font></td>
			// <td align="center"><center><strong id="next_santa" class="tag tag-green"></strong></center></td>
			// <td align="center"><center><span id="santa"></span></center></td>
		// </tr>';
		// }
	if($RongVang_Event_Enable){
		echo '
			<tr>
			<td align="center"><a class="tag tag-blue">Server: 2, 3</a></td>
			<td align="center"><b>Boss Vàng</b><font color=red size=2> (Săn Boss)</font></font><br><font size=2>Săn Boss vàng xuất hiện ngẫu nhiên ở ở Lorencia, Devias4, Atlans2-3, Tarkan1-2<br>Server 2 ít Boss hơn Server 3<br><font color=#D28200 size=2>(2:00, 8:00, 14:00, 20:00)</font> </font></td>
			<td align="center"><center><strong id="next_rongvang" class="tag tag-green"></strong></center></td>
			<td align="center"><center><span id="rongvang"></span></center></td>
			</tr>';
		}
	if($Sky_Event_Enable){
		echo '
			<tr>
			<td align="center"><a class="tag tag-blue">Server: 3</a></td>
			<td align="center"><b>Sky Event</b><font color=red size=2> (Săn Boss)</font><br><font size=2>Thiên Giới săn Boss chúa tể Kundun kiếm đồ </font><br><font color=#D28200 size=2>(1:05, 13:05)</font></td>
			<td align="center"><center><strong id="next_sky" class="tag tag-green"></strong></center></td>
			<td align="center"><center><span id="sky"></span></center></td>
			</tr>';
		}
	if($Raklion_Event_Enable){
		echo '
			<tr>
			<td align="center"><a class="tag tag-blue">Server: 1</a></td>
			<td align="center"><b>Raklion Event</b><font color=red size=2> (Săn Boss)</font><br><font size=2>Vào hang nhện săn Boss Selupan kiếm đồ Socket cấp 2 (tối đa 3 lỗ socket chưa khảm, train quái bên ngoài chỉ có 2 lỗ socket)</font></font><br><font color=#D28200 size=2>(9:30, 15:30, 21:30)</td>
			<td align="center"><center><strong id="next_raklion" class="tag tag-green"></strong></center></td>
			<td align="center"><center><span id="raklion"></span></center></td>
			</tr>';
		}
	// if($Swamp_Event_Enable){
		// echo '
			// <tr>
			// <td align="center"><a class="tag tag-blue">Server: 20</a></td>
			// <td align="center"><b>Medusa Event</b><font color=red size=2> (Săn Boss)</font><br><font size=2>Đầm Lầy Chết săn Boss Medusa kiếm đồ (Tọa độ: ...)<br>(Xuất hiện khi mới bảo trì xong và hồi sinh lại sau 24 giờ tính từ lúc Boss chết)</font></font></td>
			// <td align="center"><center><strong id="next_swamp" class="tag tag-green"></strong></center></td>
			// <td align="center"><center><span id="swamp"></span></center></td>
			// </tr>';
		// }
	if($daichienkundun){
		echo '
			<tr>
			<td align="center"><a class="tag tag-blue">Server: 3</a></td>
			<td align="center"><b>Đại Chiến KunDun</b><font color=red size=2> (Săn Boss)</font><br><font size=2>Chiến đấu lại binh đoàn Kundun và Ảo ảnh Kundun để săn đồ cao cấp 4,5,6</font><br><font color=#D28200 size=2>(21:00)</font></td>
			<td align="center"><center><strong id="next_daichienkundun" class="tag tag-green"></strong></center></td>
			<td align="center"><center><span id="daichienkundun"></span></center></td>
			</tr>';
		}
	// if($PvP_Event_Enable){
		// echo '
			// <tr>
			// <td align="center"><a class="tag tag-blue">Server: 1</a></td>
			// <td align="center"><b>PvP Event - Đấu trường đẫm máu <a href="http://forum.muviet2015.net/showthread.php?9994" target="_blank"><font color=#ED00C5>(hướng dẫn chơi)</font></a></b><br><font size=2>Tới thời gian Event thì các bạn Đăng ký event tại NPC ở map Arkania, sau đó sẽ được di chuyển vào đấu trường để thi đấu, không thể Party và không thể buff cho nhau trong sự kiện này, đây là thể lọại đơn đấu tự do<br><b><font color=#007CDA>Bản dồ:</b> Arkania<br><font color=#D28200 size=2>(20:30)</font></td>
			// <td align="center"><center><strong id="next_pvpevent" class="tag tag-green"></strong></center></td>
			// <td align="center"><center><span id="pvpevent"></span></center></td>
		// </tr>';
		// }
	if($CastleDeep_Event_Enable){
		echo '
			<tr>
			<td align="center"><a class="tag tag-blue">Server: 20</a></td>
			<td align="center"><b>CastleDeep Event - Thung Lũng Thành Loren <font color=#ED00C5>(Chủ nhật)</font></a></b><br><font size=2>Tham gia theo nhóm để train quái có xác xuất rơi đồ Exl cấp 2, 3, sau 15 phút sẽ xuất hiện Boss Erohim, tiêu diệt sẽ có xác xuất rơi đồ Exl cấp 4, 5<br><b><font color=#007CDA>Bản dồ:</b> Công Thành Chiến - Sub:20<br><font color=#D28200 size=2>(21:00)</font></td>
			<td align="center"><center><strong id="next_castledeep" class="tag tag-green"></strong></center></td>
			<td align="center"><center><span id="castledeep"></span></center></td>
		</tr>';
		}
?>
		<tr>
			<td align="center"><a class="tag tag-blue">Server: 2,3</a></td>
			<td align="center"><b>Tháp Tinh Luyện</b><font color=red size=2> (Săn Boss)</font><br><font size=2>Chiến đấu với bàn tay MayA và Boss NightMare để săn đồ<br> Xuất hiện khi mới bảo trì xong và có lại sau 24 giờ tính từ lúc kết thúc sự kiện</font></td>
			<td align="center"></td>
			<td align="center"></td>
		</tr>
		<tr>
			<td align="center"><font size=2>(Tạm ngừng)</font></td>
			<td align="center"><b>Chúa tể Kundun (Kalima 7)</b><font color=red size=2> (bỏ và thay thế bằng Đại chiến Kundun)</font><br><font size=2>Sự kiện này sẽ gây mất cân bằng vì sẽ thiên về Team mạnh, vì vậy sẽ thay thế vào sự kiện Đại chiến Kundun mỗi tối để các Guild cạnh tranh hấp dẫn hơn</font></td>
			<td align="center"></td>
			<td align="center"></td>
		</tr>
		<tr>
			<td align="center"><font size=2>(Đang hoàn thiện)</font></td>
			<td align="center"><b>Medusa Event</b><font color=red size=2> (Săn Boss)</font><br><font size=2>Đầm Lầy Chết săn Boss Medusa kiếm đồ (Tọa độ: ...)<br>(Xuất hiện khi mới bảo trì xong và hồi sinh lại sau 24 giờ tính từ lúc Boss chết)</font></td>
			<td align="center"></td>
			<td align="center"></td>
		</tr>
		<tr>
			<td align="center"><font size=2>(Đang hoàn thiện)</font></td>
			<td align="center"><b>Skeromikon Chủ Nhật</b><font color=red size=2> (Săn Boss)</font><br><font size=2>Tham gia Skeromikon vào Chủ Nhật để săn đồ<br></td>
			<td align="center"></td>
			<td align="center"></td>
		</tr>
	</tbody>
</table>
        </div>	
        </div>
		</br>
		
    <div class="BlockSign"><p class="Author">Giao diện được thiết kế bởi Team - Mu Ngọa Long</p></div>
   </div>
  </div>
 </div>
</div>	
<!-- End module event -->
		  </div>
          </div>
		<div id="Footer"></div>
     </div>
</div>

</body>

<script type="text/javascript">
	$(document).ready(function(){
		$(".demo").colorbox({iframe:true, width:"1100", height:"600"});
	});
</script>
	