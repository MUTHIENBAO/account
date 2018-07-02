function Blood(time){
	document.getElementById("next_blood").innerHTML = time.substr(time.length - 8);
	$('#blood').countdown(time).on('update.countdown', function(event) {$(this).html(event.strftime('<font color="#ff0000"><b>%H:%M:%S</b></font>'));})
	.on('finish.countdown', function(event) {
		$(this).html('<font color="#ff3399"><center>Event đang diễn ra</center></font>');
		setTimeout(function(){$.get("ajax.php?event=blood", function(data){Blood(data);});}, 1000000);
	});
}
function Devil(time){
	document.getElementById("next_devil").innerHTML = time.substr(time.length - 8);
	$('#devil').countdown(time).on('update.countdown', function(event) {$(this).html(event.strftime('<font color="#ff0000"><b>%H:%M:%S</b></font>'));})
	.on('finish.countdown', function(event) {
		$(this).html('<font color="#ff3399"><center>Event đang diễn ra</center></font>');
		setTimeout(function(){$.get("ajax.php?event=devil", function(data){Devil(data);});}, 1000000);
	});
}
function Chaos(time){
	document.getElementById("next_chaos").innerHTML = time.substr(time.length - 8);
	$('#chaos').countdown(time).on('update.countdown', function(event) {$(this).html(event.strftime('<font color="#ff0000"><b>%H:%M:%S</b></font>'));})
	.on('finish.countdown', function(event) {
		$(this).html('<font color="#ff3399"><center>Event đang diễn ra</center></font>');
		setTimeout(function(){$.get("ajax.php?event=chaos", function(data){Chaos(data);});}, 1000000);
	});
}
function RedDragon(time){
	document.getElementById("next_reddragon").innerHTML = time.substr(time.length - 8);
	$('#reddragon').countdown(time).on('update.countdown', function(event) {$(this).html(event.strftime('<font color="#ff0000"><b>%H:%M:%S</b></font>'));})
	.on('finish.countdown', function(event) {
		$(this).html('<font color="#ff3399"><center>Event đang diễn ra</center></font>');
		setTimeout(function(){$.get("ajax.php?event=reddragon", function(data){RedDragon(data);});}, 1000000);
	});
}
function PhuThuyTrang(time){
	document.getElementById("next_phuthuytrang").innerHTML = time.substr(time.length - 8);
	$('#phuthuytrang').countdown(time).on('update.countdown', function(event) {$(this).html(event.strftime('<font color="#ff0000"><b>%H:%M:%S</b></font>'));})
	.on('finish.countdown', function(event) {
		$(this).html('<font color="#ff3399"><center>Event đang diễn ra</center></font>');
		setTimeout(function(){$.get("ajax.php?event=phuthuytrang", function(data){PhuThuyTrang(data);});}, 1000000);
	});
}
function Blue(time){
	document.getElementById("next_blue").innerHTML = time.substr(time.length - 8);
	$('#blue').countdown(time).on('update.countdown', function(event) {$(this).html(event.strftime('<font color="#ff0000"><b>%H:%M:%S</b></font>'));})
	.on('finish.countdown', function(event) {
		$(this).html('<font color="#ff3399"><center>Event đang diễn ra</center></font>');
		setTimeout(function(){$.get("ajax.php?event=blue", function(data){Blue(data);});}, 1000000);
	});
}
function Sky(time){
	document.getElementById("next_sky").innerHTML = time.substr(time.length - 8);
	$('#sky').countdown(time).on('update.countdown', function(event) {$(this).html(event.strftime('<font color="#ff0000"><b>%H:%M:%S</b></font>'));})
	.on('finish.countdown', function(event) {
		$(this).html('<font color="#ff3399"><center>Event đang diễn ra</center></font>');
		setTimeout(function(){$.get("ajax.php?event=sky", function(data){Sky(data);});}, 1000000);
	});
}
function Raklion(time){
	document.getElementById("next_raklion").innerHTML = time.substr(time.length - 8);
	$('#raklion').countdown(time).on('update.countdown', function(event) {$(this).html(event.strftime('<font color="#ff0000"><b>%H:%M:%S</b></font>'));})
	.on('finish.countdown', function(event) {
		$(this).html('<font color="#ff3399"><center>Event đang diễn ra</center></font>');
		setTimeout(function(){$.get("ajax.php?event=raklion", function(data){Raklion(data);});}, 1000000);
	});
}
function Swamp(time){
	document.getElementById("next_swamp").innerHTML = time.substr(time.length - 8);
	$('#swamp').countdown(time).on('update.countdown', function(event) {$(this).html(event.strftime('<font color="#ff0000"><b>%H:%M:%S</b></font>'));})
	.on('finish.countdown', function(event) {
		$(this).html('<font color="#ff3399"><center>Event đang diễn ra</center></font>');
		setTimeout(function(){$.get("ajax.php?event=swamp", function(data){Swamp(data);});}, 1000000);
	});
}
function Summer(time){
	document.getElementById("next_summer").innerHTML = time.substr(time.length - 8);
	$('#summer').countdown(time).on('update.countdown', function(event) {$(this).html(event.strftime('<font color="#ff0000"><b>%H:%M:%S</b></font>'));})
	.on('finish.countdown', function(event) {
		$(this).html('<font color="#ff3399"><center>Event đang diễn ra</center></font>');
		setTimeout(function(){$.get("ajax.php?event=summer", function(data){Summer(data);});}, 1000000);
	});
}
function HideAndSeek(time){
	document.getElementById("next_hideandseek").innerHTML = time.substr(time.length - 8);
	$('#hideandseek').countdown(time).on('update.countdown', function(event) {$(this).html(event.strftime('<font color="#ff0000"><b>%H:%M:%S</b></font>'));})
	.on('finish.countdown', function(event) {
		$(this).html('<font color="#ff3399"><center>Event đang diễn ra</center></font>');
		setTimeout(function(){$.get("ajax.php?event=hideandseek", function(data){HideAndSeek(data);});}, 1000000);
	});
}
function RongVang(time){
	document.getElementById("next_rongvang").innerHTML = time.substr(time.length - 8);
	$('#rongvang').countdown(time).on('update.countdown', function(event) {$(this).html(event.strftime('<font color="#ff0000"><b>%H:%M:%S</b></font>'));})
	.on('finish.countdown', function(event) {
		$(this).html('<font color="#ff3399"><center>Event đang diễn ra</center></font>');
		setTimeout(function(){$.get("ajax.php?event=rongvang", function(data){RongVang(data);});}, 1000000);
	});
}

function daichienkundun(time){
	document.getElementById("next_daichienkundun").innerHTML = time.substr(time.length - 8);
	$('#daichienkundun').countdown(time).on('update.countdown', function(event) {$(this).html(event.strftime('<font color="#ff0000"><b>%H:%M:%S</b></font>'));})
	.on('finish.countdown', function(event) {
		$(this).html ('<font color="#ff0000"> <font color="#ff3399"><center>Event đang diễn ra</center></font></font> ');
		setTimeout(function(){$.get("ajax.php?event=daichienkundun", function(data){daichienkundun(data);});}, 1000000);
	});
}

function santa(time){
	document.getElementById("next_santa").innerHTML = time.substr(time.length - 8);
	$('#santa').countdown(time).on('update.countdown', function(event) {$(this).html(event.strftime('<font color="#ff0000"><b>%H:%M:%S</b></font>'));})
	.on('finish.countdown', function(event) {
		$(this).html ('<font color="#ff0000"> <font color="#ff3399"><center>Event đang diễn ra</center></font></font> ');
		setTimeout(function(){$.get("ajax.php?event=santa", function(data){santa(data);});}, 1000000);
	});
}

function PvP_Event(time){
	document.getElementById("next_pvpevent").innerHTML = time.substr(time.length - 8);
	$('#pvpevent').countdown(time).on('update.countdown', function(event) {$(this).html(event.strftime('<font color="#ff0000"><b>%H:%M:%S</b></font>'));})
	.on('finish.countdown', function(event) {
		$(this).html ('<font color="#ff0000"> <font color="#ff3399"><center>Event đang diễn ra</center></font></font> ');
		setTimeout(function(){$.get("ajax.php?event=pvpevent", function(data){PvP_Event(data);});}, 1000000);
	});
}

function CastleDeep_Event(time){
	document.getElementById("next_castledeep").innerHTML = time.substr(time.length - 8);
	$('#castledeep').countdown(time).on('update.countdown', function(event) {$(this).html(event.strftime('<font color="#ff0000"><b>%H:%M:%S</b></font>'));})
	.on('finish.countdown', function(event) {
		$(this).html ('<font color="#ff0000"> <font color="#ff3399"><center>Event đang diễn ra</center></font></font> ');
		setTimeout(function(){$.get("ajax.php?event=castledeep", function(data){CastleDeep_Event(data);});}, 1000000);
	});
}