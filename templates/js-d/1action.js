var reg_chu_so = /^[a-zA-Z0-9_]+$/;
var reg_chu_so_ = /^[a-zA-Z0-9_]+$/;
var reg_so = /^[0-9]+$/;
var reg_email = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,6})$/;

var loading_interval;
$.ajax({cache: true});

$("*").ajaxSend(function(r,s)
	{
		
		clearInterval(loading_interval);
		loading_interval = setInterval('batdau()',1);
		$("#loading").fadeIn("fast");
		
	});   
$("*").ajaxStop(function(r,s)
	{ 	
	try {
	var pageTracker = _gat._getTracker("UA-6645168-1");
	pageTracker._initData();
	url_no_hash = window.location.href;
	url_no_hash = url_no_hash.split('#');
	url_no_hash = url_no_hash[1];
	pageTracker._trackPageview(url_no_hash);
	}
	catch(Err) {
	}					  
	$("#loading").fadeOut("fast");
	clearInterval(loading_interval);

	//refeshimg();
	
	});

function centerView(layer/*no display:none*/, doNotAddOffsets){
if(typeof layer=="string"){layer=document.getElementById(layer);};
if(layer){
var parent=layer.parentNode;/*unless body tag, must have position to relative or absolute*/
parent.style.overflow="auto";
layer.style.position="absolute";/*much better if top and left are specified in style, with 'px'*/
layer.style.top=layer.style.top||layer.offsetTop+'px';
layer.style.left=layer.style.left||layer.offsetLeft+'px';
var clientH=0, clientW=0, offsetT=0, offsetL=0, top=0, left=0;
	if(parent && parent.nodeType==1/*a tag*/){
		if(parent.nodeName=="BODY"){
			if(typeof window.innerHeight!="undefined"){clientH=window.innerHeight; clientW=window.innerWidth;}
			else if(document.documentElement && document.documentElement.clientHeight){clientH=document.documentElement.clientHeight; clientW=document.documentElement.clientWidth;}
			else if(document.body.clientHeight){clientH=document.body.clientHeight; clientW=document.body.clientWidth;}
			else{clientH=parent.clientHeight; clientW=parent.clientWidth;};
			//
			if(typeof pageYOffset!="undefined"){offsetT=pageYOffset; offsetL=pageXOffset;}
			else if(document.documentElement && document.documentElement.scrollTop){offsetT=document.documentElement.scrollTop; offsetL=document.documentElement.scrollLeft;}
			else if(document.body && typeof document.body.scrollTop!="undefined"){offsetT=document.body.scrollTop; offsetL=document.body.scrollLeft;}
			else{offsetT=0; offsetL=0;};
		top=Math.abs(parent.offsetTop + ((clientH/2) - (layer.offsetHeight/2)));
		left=Math.abs(parent.offsetLeft + ((clientW/2) - (layer.offsetWidth/2)));
		}
		else{
		clientH=parent.offsetHeight; clientW=parent.offsetWidth;
		offsetT=parent.scrollTop; offsetL=parent.scrollLeft;
		top=Math.abs(((clientH/2) - (layer.offsetHeight/2))); left=Math.abs(((clientW/2) - (layer.offsetWidth/2)));
		};
	if(!doNotAddOffsets){top+=offsetT; left+=offsetL;};
	layer.style.top=top+'px';//comment out to avoid positioning and allow returning only
	layer.style.left=left+'px';//comment out to avoid positioning and allow returning only
	return [top, left, top+'px', left+'px'];
	};
};
}

function browser()
{
	var br_s = navigator.userAgent.toLowerCase();
	if (br_s.indexOf('opera')!= -1)
		br='op';
	else if (br_s.indexOf('netscape')!= -1)
		br='ns';
	else if (br_s.indexOf('firefox')!= -1)
		br='ff';
	else
		br='ie';
	return br;
}

function batdau()
{
	centerView("loading");
}

function doc()
{
	var url = window.location.href;
	if(url.indexOf('#')!=-1) c_url = url.split('#');
	module = c_url?c_url[1]:'#';

	$("#Load_Content").load("Load_Content.php?Page="+module);

}  

function khoidong()
{
	var interval = setInterval('url()',100);
} 

var last_url="";

function url()
{
	if(window.location.hash!=last_url)
	{
		doc();
		url_no_hash = window.location.href;
		url_no_hash = url_no_hash.split('#');
		url_no_hash = url_no_hash[1];
//		if(browser()=="ie") document.getElementById("history").src="ajax.php?h="+url_no_hash;
		$(function(){
			select_menu("Account_Manager");
			select_menu("Character_Manager");
			select_menu("Bank_Manager");
			select_menu("Event");
			select_menu("Webshop");
			select_menu("NapThe");
			select_menu("ChoTroi");
			select_menu("GiaiTri");
			select_menu("Ranking");
			select_menu("IPProtect");
			select_menu("Register");
			select_menu("LostPass");
		});		
	}
	last_url=window.location.hash;
	
}

function select_menu(id)
{
	var url = window.location.href;
	if (url.indexOf("#")>-1) {
		url = url.split('#');
		url = url[1];
	}
	if (url.indexOf(id)>-1) {
	    $('#'+id+"_Menu").attr("class", "nav_current nav_icon");
	}
	else{
	    $('#'+id+"_Menu").attr("class", "nav_icon");		
	}	
}

$(function(){
	$("#nav li.nav_current div").css("background-image", "");
	
	select_menu("Account_Manager");
	select_menu("Character_Manager");
	select_menu("Bank_Manager");
	select_menu("Event");
	select_menu("Webshop");
	select_menu("NapThe");
	select_menu("ChoTroi");
	select_menu("GiaiTri");
	select_menu("Ranking");
	select_menu("IPProtect");
	select_menu("Register");
	select_menu("LostPass");
});		
				
function Dialog(Content)
{
	$.fx.speeds._default = 800;
	$("#dialog-content").empty().append(Content);	
	$(function() {
		$( '#dialog:ui-dialog' ).dialog( 'destroy' );
	
		$( '#dialog-message' ).dialog({
			show: 'explode',
			hide: 'explode',
			modal: true,
			buttons: {
				Ok: function() {
					$( this ).dialog( 'close' );
					//location.reload(true);
				}
			}
		});
	});
}

function Show_Dialog(Content){
	setTimeout("Dialog(\'"+Content+"\')",800);
}
	
function show_error(id,data)
{
	$("#"+id+"_error").css('display','none')
	$("#"+id+"_error").empty().append("<font color='red'>"+data+"</font>");
	$("#"+id+"_error").fadeIn(500); 
    $("#"+id+"_error").show();	
}

function error(id) {	
	$("#td_" + id + "_title").css('background','url(templates/images/error_bg.gif)');
	$("#td_" + id + "_input").css('background','url(templates/images/error_bg.gif)');
	$("#td_" + id + "_sugg").css('background','url(templates/images/error_bg.gif)');
	$("#td_" + id + "_title").attr('class','td_title_error');
	$("#td_" + id + "_input").attr('class','td_input_error');
	$("#td_" + id + "_sugg").attr('class','td_sugg_error');
	$("#" + id).css('color', 'red');
	$("#" + id).css('font-weight', 'bold');		
}
function hideError(id) {
	$("#"+id+"_error").empty();
	$("#td_" + id + "_title").css('background','');
	$("#td_" + id + "_input").css('background','');
	$("#td_" + id + "_sugg").css('background','');
	$("#td_" + id + "_title").attr('class','td_title_reset');
	$("#td_" + id + "_input").attr('class','');
	$("#td_" + id + "_sugg").attr('class','');
	$("#" + id).css('color', '#000000');
	$("#" + id).css('font-weight', '100');			
}

function hideErrorField(id)
{
	$("#"+id+"_error").fadeOut(1000);
}

function hideError2(id) {
	$("#"+id+"_error").empty();
	$("#td_" + id + "_title").css('background','');
	$("#td_" + id + "_input").css('background','');
	$("#td_" + id + "_sugg").css('background','');
	$("#td_" + id + "_title").attr('class','td_title_reset2');
	$("#td_" + id + "_input").attr('class','');
	$("#td_" + id + "_sugg").attr('class','');
	$("#" + id).css('color', '#000000');
	$("#" + id).css('font-weight', '100');			
}

function hideSuggestion(id) {
	if(id != undefined) {
		$("#"+id).fadeOut(1000);
		//$('div[id='+id+']').hide();	
	}
	else {
		$("#"+id).fadeOut(1000);
		//$('div[id$=_suggestion]').hide();		
	}
}
function showSuggestion(id) {
	if(id != undefined) {
		$("#"+id).fadeIn(1000);
		//$('div[id='+id+']').show();	
	}
	else {
		$("#"+id).fadeIn(1000);
		//$('div[id$=_suggestion]').show();		
	}
}

function checkAnswer()
{
	var par1=document.getElementsByName('securityquestion').value;
	if(par1.length==0){
		document.getElementsByName('securityanswer').disabled=true;	
	}
	else{
		document.getElementsByName('securityanswer').disabled=false;
	}
}

function checkemail(par1){

		if(par1.length>0)
		{
			if(!reg_email.test(par1)){
				return false;
			}
			return true;
		}
}

function checkphone(par1){
	if(par1.length>0)
	{
		var Dauso=par1.substr(0,2);
		var length=par1.length;
			
		if(!(Dauso=='01' && (length==11 || length==12)) && !(Dauso=='09' && length==10)){
			return false;
		}
		return true;
	}
}

function checkchuso(par1){
	if(par1.length>0)
	{
		if(!reg_chu_so.test(par1)){
			return false;
		}
		return true;
	}
}

function checkchuso_(par1){
	if(par1.length>0)
	{
		if(!reg_chu_so_.test(par1)){
			return false;
		}
		return true;
	}
}

function checkso(par1){
	if(par1.length>0)
	{
		if(!reg_so.test(par1)){
			return false;
		}
		return true;
	}
}

function refeshimg()
{
	document.getElementById('simg').src = 'includes/captcha/CaptchaSecurityImages.php?width=203&height=70&characters=5&sid=' + Math.random(); return false
}

function ChangePass_Game_AccInfo() {
	var UseType_ID="UseType"
	var new_passgame_ID="new_passgame"
	var renew_passgame_ID="renew_passgame"
	var security_code_ID="security_code"
	var passcap2_ID="passcap2"
		
	UseType=document.getElementById(UseType_ID).value;
	new_passgame=document.getElementById(new_passgame_ID).value;
	renew_passgame=document.getElementById(renew_passgame_ID).value;
	security_code=document.getElementById(security_code_ID).value;
	passcap2=document.getElementById(passcap2_ID).value;
	
  	var error_num=0
    	if(!checkchuso(new_passgame))
    	{
    		show_error(new_passgame_ID,"<li>Mật khẩu Game mới chỉ được dùng kí tự a-z,0-9");
    		error_num++
    	}
    	if(new_passgame.length<6 || new_passgame.length>16)
    	{
    		show_error(new_passgame_ID,"<li>Mật khẩu Game mới có độ dài từ 6-16 ký tự");
    		error_num++
    	}
    	if(new_passgame!=renew_passgame)
    	{
    		show_error(renew_passgame_ID,"<li>Mật khẩu Game mới và nhập lại không giống nhau.");
    		error_num++
    	}
    	if(!checkchuso(passcap2))
    	{
    		show_error(passcap2_ID,"<li>Mật khẩu cấp 2 chỉ được dùng kí tự a-z,0-9");
    		error_num++
    	}
 	if(error_num==0){   	
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
    	if(data.indexOf("Sai")>-1)
    	{
			show_error(security_code_ID,data);
			error_num++
    	}
    	else{
    		$("#"+security_code_ID+"_error").hide();
    	}
    	
    	if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=Account_Manager/PassGame&UseType="+UseType+"&new_passgame="+new_passgame+"&renew_passgame="+renew_passgame+"&security_code="+security_code+"&passcap2="+passcap2+"&Change=1");	
    	}
   	});

    }	
	return false;

}
function ChangePass_Game_PhoneService() {
	var UseType_ID="UseType"
	var new_passgame_ID="new_passgame"
	var renew_passgame_ID="renew_passgame"
	var security_code_ID="security_code"
	var OTP_ID="OTP"
		
	UseType=document.getElementById(UseType_ID).value;
	new_passgame=document.getElementById(new_passgame_ID).value;
	renew_passgame=document.getElementById(renew_passgame_ID).value;
	security_code=document.getElementById(security_code_ID).value;
	OTP=document.getElementById(OTP_ID).value;
	
  	var error_num=0;
 
     	if(!checkchuso(new_passgame))
    	{
    		show_error(new_passgame_ID,"<li>Mật khẩu Game mới chỉ được dùng kí tự a-z,0-9");
    		error_num++
    	}
    	if(new_passgame.length<6 || new_passgame.length>16)
    	{
    		show_error(new_passgame_ID,"<li>Mật khẩu Game mới có độ dài từ 6-16 ký tự");
    		error_num++
    	}
    	if(new_passgame!=renew_passgame)
    	{
    		show_error(renew_passgame_ID,"<li>Mật khẩu Game mới và nhập lại không giống nhau.");
    		error_num++
    	}
    	if(!checkchuso(OTP))
    	{
    		show_error(OTP_ID,"<li>Mã OTP chỉ được dùng kí tự a-z,0-9");
    		error_num++
    	}
 	if(error_num==0){   	
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
    	if(data.indexOf("Sai")>-1)
    	{
			show_error(security_code_ID,data);
			error_num++
    	}
    	if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=Account_Manager/PassGame&UseType="+UseType+"&new_passgame="+new_passgame+"&renew_passgame="+renew_passgame+"&security_code="+security_code+"&OTP="+OTP+"&Change=1");	
    	}
   	});

    }	
	return false;

}

function ChangePassCap1_AccInfo() {
	var UseType_ID="UseType"
	var new_passcap1_ID="new_passcap1"
	var renew_passcap1_ID="renew_passcap1"
	var security_code_ID="security_code"
	var passcap2_ID="passcap2"

	UseType=document.getElementById(UseType_ID).value;
	new_passcap1=document.getElementById(new_passcap1_ID).value;
	renew_passcap1=document.getElementById(renew_passcap1_ID).value;
	security_code=document.getElementById(security_code_ID).value;
	passcap2=document.getElementById(passcap2_ID).value;
	
  	var error_num=0;

    	if(!checkchuso(new_passcap1))
    	{
    		show_error(new_passcap1_ID,"<li>Mật khẩu Cấp 1 mới chỉ được dùng kí tự a-z,0-9");
    		error_num++
    	}
      	if(new_passcap1.length<6 || new_passcap1.length>16)
    	{
    		show_error(new_passcap1_ID,"<li>Mật khẩu Cấp 1 mới có độ dài từ 6-16 ký tự");
    		error_num++
    	}
    	if(new_passcap1!=renew_passcap1)
    	{
    		show_error(renew_passcap1_ID,"<li>Mật khẩu Cấp 1 mới và nhập lại không giống nhau.");
    		error_num++
    	}
    	if(!checkchuso(passcap2))
    	{
    		show_error(passcap2_ID,"<li>Mật khẩu cấp 2 chỉ được dùng kí tự a-z,0-9");
    		error_num++
    	}
	if(error_num==0){    	
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
    	if(data.indexOf("Sai")>-1)
    	{
			show_error(security_code_ID,data);
			error_num++
    	} 
    	if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=Account_Manager/PassCap1&UseType="+UseType+"&new_passcap1="+new_passcap1+"&renew_passcap1="+renew_passcap1+"&security_code="+security_code+"&passcap2="+passcap2+"&Change=1");
    	} 	
   	});
	
    }
	return false;

}

function ChangePassCap1_PhoneService() {
	var UseType_ID="UseType"
	var new_passcap1_ID="new_passcap1"
	var renew_passcap1_ID="renew_passcap1"
	var security_code_ID="security_code"
	var OTP_ID="OTP"

	UseType=document.getElementById(UseType_ID).value;
	new_passcap1=document.getElementById(new_passcap1_ID).value;
	renew_passcap1=document.getElementById(renew_passcap1_ID).value;
	security_code=document.getElementById(security_code_ID).value;
	OTP=document.getElementById(OTP_ID).value;
	
  	var error_num=0
    	if(!checkchuso(new_passcap1))
    	{
    		show_error(new_passcap1_ID,"<li>Mật khẩu Cấp 1 mới chỉ được dùng kí tự a-z,0-9");
    		error_num++
    	}
      	if(new_passcap1.length<6 || new_passcap1.length>16)
    	{
    		show_error(new_passcap1_ID,"<li>Mật khẩu Cấp 1 mới có độ dài từ 6-16 ký tự");
    		error_num++
    	}
    	if(new_passcap1!=renew_passcap1)
    	{
    		show_error(renew_passcap1_ID,"<li>Mật khẩu Cấp 1 mới và nhập lại không giống nhau.");
    		error_num++
    	}
    	if(!checkchuso(OTP))
    	{
    		show_error(OTP_ID,"<li>Mã OTP chỉ được dùng kí tự a-z,0-9");
    		error_num++
    	}
 	if(error_num==0){   	
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
    	if(data.indexOf("Sai")>-1)
    	{
			show_error(security_code_ID,data);
			error_num++
    	} 
     	if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=Account_Manager/PassCap1&UseType="+UseType+"&new_passcap1="+new_passcap1+"&renew_passcap1="+renew_passcap1+"&security_code="+security_code+"&OTP="+OTP+"&Change=1");
    	}   	
   	});

    }	
	return false;

}

function ChangePassCap2_AccInfo() {
	var UseType_ID="UseType"
	var new_passcap2_ID="new_passcap2"
	var renew_passcap2_ID="renew_passcap2"
	var security_code_ID="security_code"
	var email_ID="email"
	var securityquestion_ID="securityquestion"
	var securityanswer_ID="securityanswer"

	UseType=document.getElementById(UseType_ID).value;
	new_passcap2=document.getElementById(new_passcap2_ID).value;
	renew_passcap2=document.getElementById(renew_passcap2_ID).value;
	security_code=document.getElementById(security_code_ID).value;
	email=document.getElementById(email_ID).value;
	securityquestion=document.getElementById(securityquestion_ID).value;
	securityanswer=document.getElementById(securityanswer_ID).value;
	
  	var error_num=0

    	if(!checkchuso(new_passcap2))
    	{
    		show_error(new_passcap2_ID,"<li>Mật khẩu Cấp 2 mới chỉ được dùng kí tự a-z,0-9");
    		error_num++
    	}
      	if(new_passcap2.length<6 || new_passcap2.length>16)
    	{
    		show_error(new_passcap2_ID,"<li>Mật khẩu Cấp 2 mới có độ dài từ 6-16 ký tự");
    		error_num++
    	}
    	if(new_passcap2!=renew_passcap2)
    	{
    		show_error(renew_passcap2_ID,"<li>Mật khẩu Cấp 2 mới và nhập lại không giống nhau.");
    		error_num++
    	}
    	if(!checkemail(email))
    	{
    		show_error(email_ID,"<li>Email không đúng định dạng");
    		error_num++
    	}
     	if(!checkso(securityquestion))
    	{
    		show_error(securityquestion_ID,"<li>Bạn hãy chọn câu hỏi bí mật");
    		error_num++
    	}
      	if(!checkchuso(securityanswer))
    	{
    		show_error(securityanswer_ID,"<li>Câu trả lời bí mật phải là chữ hoặc số 0-9,a-z");
    		error_num++
    	}
 	if(error_num==0){   	
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
    	if(data.indexOf("Sai")>-1)
    	{
			show_error(security_code_ID,data);
			error_num++
    	}
    	if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=Account_Manager/PassCap2&UseType="+UseType+"&new_passcap2="+new_passcap2+"&renew_passcap2="+renew_passcap2+"&security_code="+security_code+"&email="+email+"&securityquestion="+securityquestion+"&securityanswer="+securityanswer+"&Change=1");
    	}    	
   	});
	
    }
	return false;

}

function ChangePassCap2_PhoneService() {
	var UseType_ID="UseType"
	var new_passcap2_ID="new_passcap2"
	var renew_passcap2_ID="renew_passcap2"
	var security_code_ID="security_code"
	var OTP_ID="OTP"

	UseType=document.getElementById(UseType_ID).value;
	new_passcap2=document.getElementById(new_passcap2_ID).value;
	renew_passcap2=document.getElementById(renew_passcap2_ID).value;
	security_code=document.getElementById(security_code_ID).value;
	OTP=document.getElementById(OTP_ID).value;
	
  	var error_num=0
 
     	if(!checkchuso(new_passcap2))
    	{
    		show_error(new_passcap2_ID,"<li>Mật khẩu Cấp 2 mới chỉ được dùng kí tự a-z,0-9");
    		error_num++
    	}
      	if(new_passcap2.length<6 || new_passcap2.length>16)
    	{
    		show_error(new_passcap2_ID,"<li>Mật khẩu Cấp 2 mới có độ dài từ 6-16 ký tự");
    		error_num++
    	}
    	if(new_passcap2!=renew_passcap2)
    	{
    		show_error(renew_passcap2_ID,"<li>Mật khẩu Cấp 2 mới và nhập lại không giống nhau.");
    		error_num++
    	}
    	if(!checkchuso(OTP))
    	{
    		show_error(OTP_ID,"<li>Mã OTP phải là chữ hoặc số 0-9,a-z");
    		error_num++
    	}
	if(error_num==0){    	
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
    	if(data.indexOf("Sai")>-1)
    	{
			show_error(security_code_ID,data);
			error_num++
    	}
     	if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=Account_Manager/PassCap2&UseType="+UseType+"&new_passcap2="+new_passcap2+"&renew_passcap2="+renew_passcap2+"&security_code="+security_code+"&OTP="+OTP+"&Change=1");
    	}   	
   	});
	
    }
	return false;

}

function ChangePhone_PhoneService() {
	var UseType_ID="UseType"
	var new_phone_num_ID="new_phone_num"
	var security_code_ID="security_code"
	var OTP_ID="OTP"

	UseType=document.getElementById(UseType_ID).value;
	new_phone_num=document.getElementById(new_phone_num_ID).value;
	security_code=document.getElementById(security_code_ID).value;
	OTP=document.getElementById(OTP_ID).value;
	
  	var error_num=0
     	if(!checkphone(new_phone_num))
    	{
    		show_error(new_phone_num_ID,"<li>Số điện thoại không hợp lệ");
    		error_num++
    	}
    	if(!checkchuso(OTP))
    	{
    		show_error(OTP_ID,"<li>Mã OTP phải là chữ hoặc số 0-9,a-z");
    		error_num++
    	}
	if(error_num==0){    	
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
    	if(data.indexOf("Sai")>-1)
    	{
			show_error(security_code_ID,data);
			error_num++
    	}
    	if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=Account_Manager/PhoneNumber&UseType="+UseType+"&new_phone_num="+new_phone_num+"&security_code="+security_code+"&OTP="+OTP+"&Change=1");
    	}  	
   	});

    }	
	return false;

}

function ChangeEmail_AccInfo() {
	var UseType_ID="UseType"
	var new_email_ID="new_email"
	var renew_email_ID="renew_email"
	var security_code_ID="security_code"
	var passcap2_ID="passcap2"
	var securityquestion_ID="securityquestion"
	var securityanswer_ID="securityanswer"

	UseType=document.getElementById(UseType_ID).value;
	new_email=document.getElementById(new_email_ID).value;
	renew_email=document.getElementById(renew_email_ID).value;
	security_code=document.getElementById(security_code_ID).value;
	passcap2=document.getElementById(passcap2_ID).value;
	securityquestion=document.getElementById(securityquestion_ID).value;
	securityanswer=document.getElementById(securityanswer_ID).value;
	
  	var error_num=0
    	if(!checkemail(new_email))
    	{
    		show_error(new_email_ID,"<li>Email mới không hợp lệ");
    		error_num++
    	}
    	if(new_email!=renew_email)
    	{
    		show_error(renew_email_ID,"<li>Email mới và nhập lại không giống nhau.");
    		error_num++
    	}
    	if(!checkchuso(passcap2))
    	{
    		show_error(passcap2_ID,"<li>Mật khẩu Cấp 2 chỉ được dùng kí tự a-z,0-9");
    		error_num++
    	}
      	if(passcap2.length<6 || passcap2.length>16)
    	{
    		show_error(passcap2_ID,"<li>Mật khẩu Cấp 2 có độ dài từ 6-16 ký tự");
    		error_num++
    	}
     	if(!checkso(securityquestion))
    	{
    		show_error(securityquestion_ID,"<li>Bạn hãy chọn câu hỏi bí mật");
    		error_num++
    	}
      	if(!checkchuso(securityanswer))
    	{
    		show_error(securityanswer_ID,"<li>Câu trả lời bí mật phải là chữ hoặc số 0-9,a-z");
    		error_num++
    	}
 	if(error_num==0){   	
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
    	if(data.indexOf("Sai")>-1)
    	{
			show_error(security_code_ID,data);
			error_num++
    	}
    	if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=Account_Manager/Email&UseType="+UseType+"&new_email="+new_email+"&renew_email="+renew_email+"&security_code="+security_code+"&passcap2="+passcap2+"&securityquestion="+securityquestion+"&securityanswer="+securityanswer+"&Change=1");
    	} 	
   	});

    }	
	return false;

}

function ChangeEmail_PhoneService() {
	var UseType_ID="UseType"
	var new_email_ID="new_email"
	var renew_email_ID="renew_email"
	var security_code_ID="security_code"
	var OTP_ID="OTP"

	UseType=document.getElementById(UseType_ID).value;
	new_email=document.getElementById(new_email_ID).value;
	renew_email=document.getElementById(renew_email_ID).value;
	security_code=document.getElementById(security_code_ID).value;
	OTP=document.getElementById(OTP_ID).value;
	
  	var error_num=0
    	if(!checkemail(new_email))
    	{
    		show_error(new_email_ID,"<li>Email mới không hợp lệ");
    		error_num++
    	}
    	if(new_email!=renew_email)
    	{
    		show_error(renew_email_ID,"<li>Email mới và nhập lại không giống nhau.");
    		error_num++
    	}
    	if(!checkchuso(OTP))
    	{
    		show_error(OTP_ID,"<li>Mã OTP chỉ được dùng kí tự a-z,0-9");
    		error_num++
    	}
 	if(error_num==0){   	
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
    	if(data.indexOf("Sai")>-1)
    	{
			show_error(security_code_ID,data);
			error_num++
    	}
    	if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=Account_Manager/Email&UseType="+UseType+"&new_email="+new_email+"&renew_email="+renew_email+"&security_code="+security_code+"&OTP="+OTP+"&Change=1");
    	}    	
   	});
	
    }
	return false;

}

function ChangeAnsVSQuest_AccInfo() {
	var UseType_ID="UseType"
	var new_securityquestion_ID="new_securityquestion"
	var new_securityanswer_ID="new_securityanswer"
	var security_code_ID="security_code"
	var email_ID="email"
	var passcap2_ID="passcap2"

	UseType=document.getElementById(UseType_ID).value;
	new_securityquestion=document.getElementById(new_securityquestion_ID).value;
	new_securityanswer=document.getElementById(new_securityanswer_ID).value;
	security_code=document.getElementById(security_code_ID).value;
	email=document.getElementById(email_ID).value;
	passcap2=document.getElementById(passcap2_ID).value;
	
  	var error_num=0;

     	if(!checkso(new_securityquestion))
    	{
    		show_error(new_securityquestion_ID,"<li>Bạn hãy chọn câu hỏi bí mật mới");
    		error_num++
    	}
      	if(!checkchuso(new_securityanswer))
    	{
    		show_error(new_securityanswer_ID,"<li>Câu trả lời bí mật phải là chữ hoặc số 0-9,a-z");
    		error_num++
    	}
    	if(!checkemail(email))
    	{
    		show_error(email_ID,"<li>Email không đúng định dạng");
    		error_num++
    	}
    	if(!checkchuso(passcap2))
    	{
    		show_error(passcap2_ID,"<li>Mật khẩu Cấp 2 chỉ được dùng kí tự a-z,0-9");
    		error_num++
    	}
      	if(passcap2.length<6 || passcap2.length>16)
    	{
    		show_error(passcap2_ID,"<li>Mật khẩu Cấp 2 có độ dài từ 6-16 ký tự");
    		error_num++
    	}
 	if(error_num==0){   	
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
    	if(data.indexOf("Sai")>-1)
    	{
			show_error(security_code_ID,data);
			error_num++
    	}
    	if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=Account_Manager/AnsVSQuest&UseType="+UseType+"&new_securityquestion="+new_securityquestion+"&new_securityanswer="+new_securityanswer+"&security_code="+security_code+"&email="+email+"&passcap2="+passcap2+"&Change=1");
    	}    	   	
   	});
	
    }
	return false;

}

function ChangeAnsVSQuest_PhoneService() {
	var UseType_ID="UseType"
	var new_securityquestion_ID="new_securityquestion"
	var new_securityanswer_ID="new_securityanswer"
	var security_code_ID="security_code"
	var OTP_ID="OTP"

	UseType=document.getElementById(UseType_ID).value;
	new_securityquestion=document.getElementById(new_securityquestion_ID).value;
	new_securityanswer=document.getElementById(new_securityanswer_ID).value;
	security_code=document.getElementById(security_code_ID).value;
	OTP=document.getElementById(OTP_ID).value;
	
  	var error_num=0;

     	if(!checkso(new_securityquestion))
    	{
    		show_error(new_securityquestion_ID,"<li>Bạn hãy chọn câu hỏi bí mật mới");
    		error_num++
    	}
      	if(!checkchuso(new_securityanswer))
    	{
    		show_error(new_securityanswer_ID,"<li>Câu trả lời bí mật phải là chữ hoặc số 0-9,a-z");
    		error_num++
    	}
    	if(!checkchuso(OTP))
    	{
    		show_error(OTP_ID,"<li>Mã OTP chỉ được dùng ký tự a-z,o-9");
    		error_num++
    	}
	if(error_num==0){    	
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
    	if(data.indexOf("Sai")>-1)
    	{
			show_error(security_code_ID,data);
			error_num++
    	} 
    	if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=Account_Manager/AnsVSQuest&UseType="+UseType+"&new_securityquestion="+new_securityquestion+"&new_securityanswer="+new_securityanswer+"&security_code="+security_code+"&OTP="+OTP+"&Change=1");
    	}	
   	});

    }	
	return false;

}

function LostPass1() {
	var username_ID="username_lost"
	var new_passcap1_ID="new_passcap1"
	var renew_passcap1_ID="renew_passcap1"
	var security_code_ID="security_code"
	var OTP_ID="OTP"

	var username=document.getElementById(username_ID).value;
	var new_passcap1=document.getElementById(new_passcap1_ID).value;
	var renew_passcap1=document.getElementById(renew_passcap1_ID).value;
	var security_code=document.getElementById(security_code_ID).value;
	var OTP=document.getElementById(OTP_ID).value;
	
  	var error_num=0

    	if(!checkchuso(username))
    	{
    		show_error(username_ID,"<li>Tài khoản chỉ được dùng kí tự a-z,0-9");
    		error_num++
    	}
    	if(!checkchuso(new_passcap1))
    	{
    		show_error(new_passcap1_ID,"<li>Mật khẩu Cấp 1 mới chỉ được dùng kí tự a-z,0-9");
    		error_num++
    	}
      	if(new_passcap1.length<6 || new_passcap1.length>16)
    	{
    		show_error(new_passcap1_ID,"<li>Mật khẩu Cấp 1 mới có độ dài từ 6-16 ký tự");
    		error_num++
    	}
    	if(new_passcap1!=renew_passcap1)
    	{
    		show_error(renew_passcap1_ID,"<li>Mật khẩu Cấp 1 mới và nhập lại không giống nhau.");
    		error_num++
    	}
    	if(!checkchuso(OTP))
    	{
    		show_error(OTP_ID,"<li>Mã OTP chỉ được dùng kí tự a-z,0-9");
    		error_num++
    	}
	if(error_num==0){    	
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
    	if(data.indexOf("Sai")>-1)
    	{
			show_error(security_code_ID,data);
			error_num++
    	}
     	if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=Account_Manager/LostPass1&username_lost="+username+"&new_passcap1="+new_passcap1+"&renew_passcap1="+renew_passcap1+"&security_code="+security_code+"&OTP="+OTP+"&Change=1");
    	}	
   	});
   	
    }	
	return false;

}

function IPUpdate() {
	var username_ID="username_ip"
	var security_code_ID="security_code"
	var OTP_ID="OTP"

	var username=document.getElementById(username_ID).value;
	var security_code=document.getElementById(security_code_ID).value;
	var OTP=document.getElementById(OTP_ID).value;
	
  	var error_num=0
    	if(!checkchuso(username))
    	{
    		show_error(username_ID,"<li>Tài khoản chỉ được dùng kí tự a-z,0-9");
    		error_num++
    	}
    	if(!checkchuso(OTP))
    	{
    		show_error(OTP_ID,"<li>Mã OTP chỉ được dùng kí tự a-z,0-9");
    		error_num++
    	}
	if(error_num==0){
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
    	if(data.indexOf("Sai")>-1)
    	{
			show_error(security_code_ID,data);
			error_num++
    	} 
    	if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=IPUpdate&username="+username+"&security_code="+security_code+"&OTP="+OTP+"&IPUpdate=1");
    	}    	   	
   	});
   	
    }
	return false;

}

function IPProtect() {
	var security_code_ID="security_code"
	var OTP_ID="OTP"
	var security_code=document.getElementById(security_code_ID).value;
	var OTP=document.getElementById(OTP_ID).value;
	
  	var error_num=0

    	if(!checkchuso(OTP))
    	{
    		show_error(OTP_ID,"<li>Mã OTP chỉ được dùng kí tự a-z,0-9");
    		error_num++
    	}
	if(error_num==0){    	
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
    	if(data.indexOf("Sai")>-1)
    	{
			show_error(security_code_ID,data);
			error_num++
    	} 
   		if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=IPProtect&security_code="+security_code+"&OTP="+OTP+"&IPProtect=1");
    	}    	  	
   	});

 
   	}	
	return false;

}

function Login()
{
	username_ID="username"
	password_ID="password"
	report_ID="report"
	username=document.getElementById(username_ID).value;
	password=document.getElementById(password_ID).value;
	
    if(!checkchuso(username))
    {
    	show_error(username_ID,"Tên truy cập không hợp lệ");
   	}
   	else if(!checkchuso(password))
  	{
    	show_error(password_ID,"Mật khẩu không hợp lệ");
   	}
    else
   	{
   		$("#"+username_ID+"_error").hide();
   		
	  	$.get("Load_Content.php", { Page: "Login", username: username, password: password, login: 1 },
	   	function(data){
	   		if(data.indexOf('uccessfuly')>-1){
	   			//var Acc_Content='<div id="acc_cnt"><a href="#Account_Manager/List_Act">Thông tin tài khoản</a>  |  <a href="#Account_Manager/ActionHistory&Type=HisLogin">Lịch sử hoạt động</a> | <a href="?act=Logout">Thoát</a> <a href="?Page=Logout"><img src="./templates/images/out.png" alt="Thoát" border="0"/></a></div>'
	   			//var Loginto='<font size=2><b>Tài khoản</b></font> <b><font color=red>'+username+'</font></b>'
	   			//$("#acc_cn").html(Acc_Content);
	   			//$("#logintro").html(Loginto);
	   			//$("#Login_Content").load("Load_Content.php?Page=Right_Content");
	   			window.location="?Page=Account_Manager/List_Act";
	   			//Show_Dialog('<font color=red>Nếu dữ liệu nhân vật không đúng. Hãy click chọn lại nhân vật ở danh sách nhân vật bên phải để cập nhật...</font>');
	   		}
	   		else
	   			show_error(report_ID,data);
		});
   	}
   	return false;
}

function register()
{
	var user_ID="user"
	var passgame_ID="passgame"
	var passweb1_ID="passweb1"
	var passweb2_ID="passweb2"
	var email_ID="email"
	var quest_ID="quest"
	var answer_ID="answer"
	var phone_ID="phone"
	var security_code_ID="vImageCodP"


	user=document.getElementById(user_ID).value;
	passgame=document.getElementById(passgame_ID).value;
	passweb1=document.getElementById(passweb1_ID).value;
	passweb2=document.getElementById(passweb2_ID).value;
	email=document.getElementById(email_ID).value;
	quest=document.getElementById(quest_ID).value;
	answer=document.getElementById(answer_ID).value;
	phone=document.getElementById(phone_ID).value;
	security_code=document.getElementById(security_code_ID).value;
	
  	var error_num=0

    	if(user.length<6 || user.length>10)
    	{
    		show_error(user_ID,"<li>Tên đăng nhập có độ dài từ 6-10 kí tự");
    		error(user_ID);
    		error_num++   			
    	}
    	if(!checkchuso(user))
    	{
    		show_error(user_ID,"<li>Tên đăng nhập phải là kí tự a-z,0-9");
    		error(user_ID);
    		error_num++
    	}
    	if(passgame.length<6 || passgame.length>16)
    	{
    		show_error(passgame_ID,"<li>Mật khẩu Game có độ dài từ 6-16 kí tự");
    		error(passgame_ID);
    		error_num++    			
    	}
    	if(!checkchuso(passgame))
    	{
    		show_error(passgame_ID,"<li>Mật khẩu Game phải là kí tự a-z,0-9");
    		error(passgame_ID);
    		error_num++
    	}
    	if(passweb1.length<6 || passweb1.length>16)
    	{
    		show_error(passweb1_ID,"<li>Mật khẩu cấp 1 có độ dài từ 6-16 kí tự");
    		error(passweb1_ID);
    		error_num++    			
    	}
    	if(!checkchuso(passweb1))
    	{
    		show_error(passweb1_ID,"<li>Mật khẩu Cấp 1 phải là kí tự a-z,0-9");
    		error(passweb1_ID);
    		error_num++
    	}
    	if(passweb2.length<6 || passweb2.length>16)
    	{
    		show_error(passweb2_ID,"<li>Mật khẩu cấp 2 có độ dài từ 6-16 kí tự");
    		error(passweb2_ID);
    		error_num++    			
    	}
    	if(!checkchuso(passweb2))
    	{
    		show_error(passweb1_ID,"<li>Mật khẩu Cấp 2 phải là kí tự a-z,0-9");
    		error(passweb1_ID);
    		error_num++
    	}
    	if(!checkemail(email))
    	{
    		show_error(email_ID,"<li>Email không hợp lệ");
    		error(email_ID);
    		error_num++
    	}
     	if(!checkso(quest))
    	{
    		show_error(quest_ID,"<li>Bạn hãy chọn câu hỏi bí mật");
    		error(quest_ID);
    		error_num++
    	}
      	if(!checkchuso(answer))
    	{
    		show_error(answer_ID,"<li>Câu trả lời bí mật phải là chữ hoặc số 0-9,a-z");
    		error(answer_ID);
    		error_num++
    	}
      	if(!checkphone(phone))
    	{
    		show_error(phone_ID,"<li>Số điện thoại không hợp lệ");
    		error(phone_ID);
    		error_num++
    	}
      	if(passgame==passweb1 && passgame.length>0)
    	{
    		show_error(passgame_ID,"<li>Mật khẩu Game không được giống mật khẩu cấp 1");
    		error(passgame_ID);
    		error_num++
    	}
      	if(passweb1==passweb2 && passweb1.length>0)
    	{
    		show_error(passweb1_ID,"<li>Mật khẩu Cấp 1 không được giống mật khẩu cấp 2");
    		error(passweb1_ID);
    		error_num++
    	}
      	if(passgame==passweb2 && passweb2.length>0)
    	{
    		show_error(passweb2_ID,"<li>Mật khẩu Game không được giống mật khẩu cấp 2");
    		error(passweb2_ID);
    		error_num++
    	}
 	if(error_num==0){   	
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
    	if(data.indexOf("Sai")>-1)
    	{
			show_error(security_code_ID,data);
			error(security_code_ID);
			error_num++
    	}
    	if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=Register&user="+user+"&passgame="+passgame+"&passweb1="+passweb1+"&passweb2="+passweb2+"&email="+email+"&quest="+quest+"&answer="+answer+"&phone="+phone+"&security_code="+security_code+"&Register=1");
    	}    		
   	});

    }	
	return false;		
}

function KhoaItem()
{
	var passcap2_ID='passcap2'
	var security_code_ID='security_code'
	
	var passcap2=document.getElementById(passcap2_ID).value;
	var security_code=document.getElementById(security_code_ID).value;

  	var error_num=0
     	if(!checkchuso(passcap2))
    	{
    		show_error(passcap2_ID,"<li>Chỉ được dùng kí tự a-z,0-9");
    		error_num++
    	}
 	if(error_num==0){   	
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
    	if(data.indexOf("Sai")>-1)
    	{
			show_error(security_code_ID,data);
			error_num++
    	}
    	if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=Character_Manager/KhoaItem&passcap2="+passcap2+"&security_code="+security_code+"&KhoaItem=1");
    	}    		
   	});

	
}
	return false;			
	
}

function AddPoint()
{

	for(var i=0;i<document.getElementsByName('TypeAdd').length;i++)
	{
		if(document.getElementsByName('TypeAdd')[i].checked==true)
		{
			var TypeAdd=document.getElementsByName('TypeAdd')[i].value;
			break;	
		}	
	}
	
	var Total=document.getElementById('PointCurrent').value;
	var POINTStrength_ID='POINTStrength'
	var POINTDexterity_ID='POINTDexterity'
	var POINTVitality_ID='POINTVitality'
	var POINTEnergy_ID='POINTEnergy'
	var POINTLeadership_ID='POINTLeadership'
	var Total_ID='Total'
	var security_code_ID='security_code'
	
	var POINTStrength=document.getElementById(POINTStrength_ID).value;
	var POINTDexterity=document.getElementById(POINTDexterity_ID).value;
	var POINTVitality=document.getElementById(POINTVitality_ID).value;
	var POINTEnergy=document.getElementById(POINTEnergy_ID).value;
	var POINTLeadership=document.getElementById(POINTLeadership_ID).value;
	
	//var Total=document.getElementById(Total_ID).value;

	var security_code=document.getElementById(security_code_ID).value;


	var TotalPointAdd=parseInt(POINTStrength)+parseInt(POINTDexterity)+parseInt(POINTVitality)+parseInt(POINTEnergy)+parseInt(POINTLeadership);

  	var error_num=0
    	if(!checkso(POINTStrength))
    	{
    		show_error(POINTStrength_ID,"<li>Phải là kí tự 0-9");
    		error_num++
    	}
    	if(!checkso(POINTDexterity))
    	{
    		show_error(POINTDexterity_ID,"<li>Phải là kí tự 0-9");
    		error_num++
    	}
     	if(!checkso(POINTVitality))
    	{
    		show_error(POINTVitality_ID,"<li>Phải là kí tự 0-9");
    		error_num++
    	}
     	if(!checkso(POINTEnergy))
    	{
    		show_error(POINTEnergy_ID,"<li>Phải là kí tự 0-9");
    		error_num++
    	}
     	if(!checkso(POINTLeadership))
    	{
    		show_error(POINTLeadership_ID,"<li>Phải là kí tự 0-9");
    		error_num++
    	}
    	if(TotalPointAdd>Total)
    	{
    		show_error(Total_ID,"<li>Không đủ điểm để cộng");
    		error_num++
    	}
    
    if(error_num==0){
		$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
	   	function(data){
	   		
	    	if(data.indexOf("Sai")>-1)
	    	{
				show_error(security_code_ID,data);
				error_num++
	    	}
	    	if(error_num==0)
	    	{
	    		$("#Load_Content").load("Load_Content.php?Page=Character_Manager/AddPoint&POINTStrength="+POINTStrength+"&POINTDexterity="+POINTDexterity+"&POINTVitality="+POINTVitality+"&POINTEnergy="+POINTEnergy+"&POINTLeadership="+POINTLeadership+"&security_code="+security_code+"&TypeAdd="+TypeAdd+"&AddPoint=1");
	    	}		
	   	});
		}
	return false;			
	
}

function TinhToanPointDu(PointDu)
{
	var Total=parseInt($("#POINTStrength").val()) + parseInt($("#POINTDexterity").val()) + parseInt($("#POINTVitality").val()) + parseInt($("#POINTEnergy").val()) + parseInt($("#POINTLeadership").val());
	var PointDu_Temp=PointDu-Total;
	if(PointDu_Temp<0) {
		alert('Không đủ điểm cộng');
		return false;
	}
	else
	{		
		$("#Total").val(PointDu_Temp)
	}
}

function ClearPk()
{
	var security_code=document.getElementById('security_code').value;
	
	for(var i=0;i<document.getElementsByName('ClearPKType').length;i++)
	{
		if(document.getElementsByName('ClearPKType')[i].checked==true)
		{
			var PKType=document.getElementsByName('ClearPKType')[i].value;
			break;	
		}	
	}
  	var error_num=0
 		if(PKType==undefined)
		{
	    	show_error("TypeMoney","<li>Bạn hãy chọn loại tiền trước.");
	    	error_num++
		}
	if(error_num==0){		
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
     	if(data.indexOf("Sai")>-1)
    	{
			show_error("security_code",data);
			error_num++
    	}
		if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=Character_Manager/ClearPk&ClearPKType="+PKType+"&security_code="+security_code+"&ClearPk=1");
    		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
    	}	    		
   	});	

    }
	return false;
}

function MapMove()
{
	var security_code=document.getElementById('security_code').value;
	
	for(var i=0;i<document.getElementsByName('MapName').length;i++)
	{
		if(document.getElementsByName('MapName')[i].checked==true)
		{
			var MapName=document.getElementsByName('MapName')[i].value;
			break;	
		}	
	}
  	var error_num=0
 		if(MapName==undefined)
		{
	    	show_error("MapName","<li>Bạn hãy chọn khu vực cần di chuyển trước.");
	    	error_num++
		}
	if(error_num==0){		
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
     	if(data.indexOf("Sai")>-1)
    	{
			show_error("security_code",data);
			error_num++
    	}
 		if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=Character_Manager/MapMove&MapName="+MapName+"&security_code="+security_code+"&MapMove=1");
    	}   		
   	});	

}
	return false;
}


function RecycleBin()
{
	var security_code=document.getElementById('security_code').value;
	
	for(var i=0;i<document.getElementsByName('DelWhere').length;i++)
	{
		if(document.getElementsByName('DelWhere')[i].checked==true)
		{
			var DelWhere=document.getElementsByName('DelWhere')[i].value;
			break;	
		}	
	}
	
  	var error_num=0

		if(DelWhere==undefined)
		{
	    	show_error("DelWhere","<li>Bạn hãy chọn vị trí muốn xóa.");
	    	error_num++
		}
	if(error_num==0){		
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
     	if(data.indexOf("Sai")>-1)
    	{
			show_error("security_code",data);
			error_num++
    	}
		if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=Character_Manager/RecycleBin&DelWhere="+DelWhere+"&security_code="+security_code+"&RecycleBin=1");
    	}	    		
   	});	


}
	return false;
}

function ResetCharacter()
{
	var security_code=document.getElementById('security_code').value;
	
	for(var i=0;i<document.getElementsByName('blnResetType').length;i++)
	{
		if(document.getElementsByName('blnResetType')[i].checked==true)
		{
			var ResetType=document.getElementsByName('blnResetType')[i].value;
			break;	
		}	
	}
var error_num=0
	
		if(ResetType==undefined)
		{
	    	alert('Bạn hãy chọn hình thức Reset.');
	    	error_num++
		}
		
	if(error_num==0){ 	
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
     	if(data.indexOf("Sai")>-1)
    	{
			show_error("security_code",data);
			error_num++
    	}
		if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=Character_Manager/Reset&ResetType="+ResetType+"&security_code="+security_code+"&Reset=1");
    		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
    	}    		
   	});	

    }
	return false;
}

function RelifeCharacter()
{
	var security_code=document.getElementById('security_code').value;

  	var error_num=0
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
     	if(data.indexOf("Sai")>-1)
    	{
			show_error("security_code",data);
			error_num++
    	} 
		if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=Character_Manager/Relife&security_code="+security_code+"&Relife=1");
    		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
    	}    	   		
   	});
   	
	
	return false;
}

function ClearPoint()
{
	$.get("Load_Content.php", { Page: "Character_Manager/ClearPoint" },
	   	function(data){
	   		if(data.indexOf("Logout")>-1){
	   			window.location='?Page=Logout'
	   		}else
		   	{
		   		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
		   		//$("#Load_Content").load("Load_Content.php?Page=Character_Manager/List_Act");
		   		window.location.href='#Character_Manager/AddPoint'
		   		alert(data);
			}
	   	});
}

function Learn_FullSkill()
{
	$.get("Load_Content.php", { Page: "Character_Manager/Learn_FullSkill" },
	   	function(data){
	   		if(data.indexOf("Logout")>-1){
	   			window.location='?Page=Logout'
	   		}else
		   	{
		   		alert(data);
			}
	   	});
}

function UyThacOffline()
{
	if(document.getElementsByName('AgreeUT').checked==false)
	{
		alert('Bạn chưa đồng ý với điều kiện ủy thác hiện tại');
		return false;
	}
	else
	{
		var security_code=document.getElementById('security_code').value;
	  	var error_num=0
	if(error_num==0){
	  	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
	   	function(data){
	     	if(data.indexOf("Sai")>-1)
	    	{
				show_error("security_code",data);
				error_num++
	    	}	
			if(error_num==0)
	    	{
	    		$("#Load_Content").load("Load_Content.php?Page=Character_Manager/UyThac_Offline&security_code="+security_code+"&UyThac=1");
	    		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
	    	}	    	    		
	   	});


	   	}	
	}
	return false;
}

function ChangeClass()
{
	if(document.getElementsByName('AgreeCL').checked==false)
	{
		alert('Bạn chưa đồng ý với điều kiện đổi giới tính hiện tại');
		return false;
	}
	else
	{
		var security_code=document.getElementById('security_code').value;
		var ClassType=document.getElementById('ClassType').value;
		var passcap2=document.getElementById('passcap2').value;
	  	var error_num=0

	     	if(ClassType=='')
	    	{
				show_error("ClassType","<li>Chưa chọn giới tính mới");
				error_num++
	    	}
	    	if(!checkchuso(passcap2))
	    	{
	    		show_error("passcap2","<li>Chỉ được dùng kí tự a-z,0-9");
	    		error_num++
	    	}
		if(error_num==0){	    	
	  	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
	   	function(data){
	     	if(data.indexOf("Sai")>-1)
	    	{
				show_error("security_code",data);
				error_num++
	    	}
			if(error_num==0)
	    	{
	    		$("#Load_Content").load("Load_Content.php?Page=Character_Manager/ChangeClass&security_code="+security_code+"&ClassType="+ClassType+"&passcap2="+passcap2+"&ChangeClass=1");
	    		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
	    	}
	  	});	


	    	}	
	}
	return false;
}

function ResetMasterPoint()
{
	var security_code=document.getElementById('security_code').value;
	var passcap2=document.getElementById('passcap2').value;
	var error_num=0

	   	if(!checkchuso(passcap2))
	   	{
	   		show_error("passcap2","<li>Chỉ được dùng kí tự a-z,0-9");
	   		error_num++
	   	}
		if(error_num==0){	   	
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
	function(data){
		if(data.indexOf("Sai")>-1)
	    {
			show_error("security_code",data);
			error_num++
	    }
		if(error_num==0)
	   	{
	   		$("#Load_Content").load("Load_Content.php?Page=Character_Manager/ResetMasterPoint&security_code="+security_code+"&passcap2="+passcap2+"&ResetMasterPoint=1");
	   		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
	   	}
	   		
	   });

	
	}
	return false;
}

function TrainLevelMaster()
{
	var security_code=document.getElementById('security_code').value;
	var passcap2=document.getElementById('passcap2').value;
	var error_num=0

	   	if(!checkchuso(passcap2))
	   	{
	   		show_error("passcap2","<li>Chỉ được dùng kí tự a-z,0-9");
	   		error_num++
	   	}
	if(error_num==0){	   	
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
	function(data){
		if(data.indexOf("Sai")>-1)
	    {
			show_error("security_code",data);
			error_num++
	    }
		if(error_num==0)
	   	{
	   		$("#Load_Content").load("Load_Content.php?Page=Character_Manager/TrainLevelMaster&security_code="+security_code+"&passcap2="+passcap2+"&TrainLevelMaster=1");
	   		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
	   	}	   		
	   });
	   

	}
	   			
	return false;
}

function DoQuest3()
{
	if(document.getElementsByName('AgreeQ3').checked==false)
	{
		alert('Bạn chưa đồng ý với điều kiện làm nhiệm vụ cấp 3');
		return false;
	}
	else
	{
		var security_code=document.getElementById('security_code').value;
		var passcap2=document.getElementById('passcap2').value;
		var error_num=0
		   	if(!checkchuso(passcap2))
		   	{
		   		show_error("passcap2","<li>Chỉ được dùng kí tự a-z,0-9");
		   		error_num++
		   	}
		if(error_num==0){		   	
		$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
		function(data){
			if(data.indexOf("Sai")>-1)
		    {
				show_error("security_code",data);
				error_num++
		    }
			if(error_num==0)
		   	{
		   		$("#Load_Content").load("Load_Content.php?Page=Character_Manager/DoQuest3&security_code="+security_code+"&passcap2="+passcap2+"&DoQuest3=1");
		   		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
		   	}			   		
		   });
		   

		}
	}	
	return false;
}

function BackFrom3To2()
{
	if(document.getElementsByName('Agree').checked==false)
	{
		alert('Bạn chưa đồng ý với điều kiện');
		return false;
	}
	else
	{
		for(var i=0;i<document.getElementsByName('BackFrom3To2Type').length;i++)
		{
			if(document.getElementsByName('BackFrom3To2Type')[i].checked==true)
			{
				var Type=document.getElementsByName('BackFrom3To2Type')[i].value;
				break;	
			}	
		}
		
		var security_code=document.getElementById('security_code').value;
		var passcap2=document.getElementById('passcap2').value;
		var error_num=0
		   	if(!checkchuso(passcap2))
		   	{
		   		show_error("passcap2","<li>Chỉ được dùng kí tự a-z,0-9");
		   		error_num++
		   	}
		if(error_num==0){		   	
		$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
		function(data){
			if(data.indexOf("Sai")>-1)
		    {
				show_error("security_code",data);
				error_num++
		    }
			if(error_num==0)
		   	{
		   		$("#Load_Content").load("Load_Content.php?Page=Character_Manager/BackFrom3To2&security_code="+security_code+"&passcap2="+passcap2+"&Type="+Type+"&BackFrom3To2=1");
		   		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
		   	}			   		
		   });
		   

		}
	}	
	return false;
}


function ReName()
{
	if(document.getElementsByName('AgreeRN').checked==false)
	{
		alert('Bạn chưa đồng ý với điều kiện đổi tên nhân vật');
		return false;
	}
	else
	{
		var security_code=document.getElementById('security_code').value;
		var passcap2=document.getElementById('passcap2').value;
		var newname=document.getElementById('newname').value;
		var renewname=document.getElementById('renewname').value;
		var oldname=document.getElementById('oldname').value;
		var error_num=0

		   	if(!checkchuso(passcap2))
		   	{
		   		show_error("passcap2","<li>Chỉ được dùng kí tự a-z,0-9");
		   		error_num++
		   	}
		   	if(!checkchuso(newname))
		   	{
		   		show_error("newname","<li>Chỉ được dùng kí tự a-z,0-9");
		   		error_num++
		   	}
	    	if(newname.length<4 || newname.length>10)
	    	{
	    		show_error("newname","<li>Tên mới có độ dài từ 4-10 kí tự");
	    		error_num++    			
	    	}
		   	if(renewname!=newname)
		   	{
		   		show_error("renewname","<li>Nhập lại tên mới không đúng");
		   		error_num++
		   	}
		   	if(oldname==newname)
		   	{
		   		show_error("newname","<li>Tên mới không được giống tên cũ");
		   		error_num++
		   	}
		if(error_num==0){		   	
		$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
		function(data){
			if(data.indexOf("Sai")>-1)
		    {
				show_error("security_code",data);
				error_num++
		    }
			if(error_num==0)
		   	{
		   		$("#Load_Content").load("Load_Content.php?Page=Character_Manager/ReName&security_code="+security_code+"&passcap2="+passcap2+"&newname="+newname+"&renewname="+renewname+"&oldname="+oldname+"&ReName=1");
		   		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
		   	}	
		   });
		   

		}		
	}	
	return false;
}

function NewbieReward()
{
	var security_code=document.getElementById('security_code').value;

  	var error_num=0
  
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
     	if(data.indexOf("Sai")>-1)
    	{
			show_error("security_code",data);
			error_num++
    	}
		if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=Character_Manager/NewbieReward&security_code="+security_code+"&NewbieReward=1");
    	}	

    		
   	});	

	return false;
}

function SendJewel()
{
	if(document.getElementsByName('AgreeSJ').checked==false)
	{
		alert('Bạn chưa đồng ý với điều kiện gửi jewel');
		return false;
	}
	else
	{
		var security_code=document.getElementById('security_code').value;
		var passcap2=document.getElementById('passcap2').value;
		var JewelType=document.getElementById('JewelType').value;
		var number=document.getElementById('number').value;
		var error_num=0
		   	if(!checkchuso(passcap2))
		   	{
		   		show_error("passcap2","<li>Chỉ được dùng kí tự a-z,0-9");
		   		error_num++
		   	}
		   	if(!checkso(number))
		   	{
		   		show_error("number","<li>Chỉ được dùng kí tự 0-9");
		   		error_num++
		   	}
		   	if(!checkchuso(JewelType))
		   	{
		   		show_error("JewelType","<li>Chỉ được dùng kí tự a-z,0-9");
		   		error_num++
		   	}
		   	if(JewelType=='')
		   	{
		   		show_error("JewelType","<li>Chưa chọn Jewel");
		   		error_num++
		   	}
		if(error_num==0){		   	
		$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
		function(data){
			if(data.indexOf("Sai")>-1)
		    {
				show_error("security_code",data);
				error_num++
		    }
			if(error_num==0)
		   	{
		   		$("#Load_Content").load("Load_Content.php?Page=Bank_Manager/SendJewel&security_code="+security_code+"&passcap2="+passcap2+"&number="+number+"&JewelType="+JewelType+"&SendJewel=1");
		   		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
		   	}		   		
		   });


		}
	}	
	return false;
}

function CharacterChoice(CharacterID,CharacterName)
{
	var url = window.location.href;
		$.get("Load_Content.php", { Page: "Character_Manager/CharacterChoice", CharacterID: CharacterID },
		   	function(data){
		   		if(data.length>0)
		   		{	
		   			var url_get='';
					if (url.indexOf("#")>-1) {
						url_get = url.split("#");
					}
					//else if (url.indexOf("?Page=")>-1) {
					//	url_get = url.split("?Page=");
					//}
					else {
						window.location='#Character_Manager/List_Act';
					}
					
					if(data.indexOf('CurrentChar')>-1){
					}
					else if(data.indexOf('NewChar')>-1){
						$("#ShowInfoChar").css('display','block')
					   	Show_Dialog("Đã chọn nhân vật <font color=green><b>"+CharacterName+"</b></font> thành công. <font color=red>Để cập nhật dữ liệu mới hãy chọn lại nhân vật...</font>")
					}
					else if(data.indexOf('Logout')>-1){
						window.location='?Page=Logout';
					}
					else{
						alert(data)	
					}

					if(url_get.length>0){
						$("#Load_Content").load("Load_Content.php?Page="+url_get[1]);
					}
					$("#Account_Content").load("Load_Content.php?Page=Right_Content");
					$("#header").load("Load_Content.php?Page=Header_Load");
				}
				else{
					alert('Có lỗi xảy ra. Xin vui lòng đăng nhập lại hoặc thoát trình duyệt...')
				}
		   	});
}


function CharacterPage(Page)
{
	var url = window.location.href;
	$.get("Load_Content.php", { Page: Page },
	   	function(data){
	   		if(data.indexOf('NoSelectChar')>-1)
	   			alert('Vui lòng chọn một nhân vật trước.')
	   		else{
				window.location="#"+Page
			}
	   	});		
}

function RecvJewel()
{
	if(document.getElementsByName('AgreeRJ').checked==false)
	{
		alert('Bạn chưa đồng ý với điều kiện rút jewel');
		return false;
	}
	else
	{
		var security_code=document.getElementById('security_code').value;
		var passcap2=document.getElementById('passcap2').value;
		var JewelType=document.getElementById('JewelType').value;
		var number=document.getElementById('number').value;
		var error_num=0

		   	if(!checkchuso(passcap2))
		   	{
		   		show_error("passcap2","<li>Chỉ được dùng kí tự a-z,0-9");
		   		error_num++
		   	}
		   	if(!checkso(number))
		   	{
		   		show_error("number","<li>Chỉ được dùng kí tự 0-9");
		   		error_num++
		   	}
		   	if(!checkchuso(JewelType))
		   	{
		   		show_error("JewelType","<li>Chỉ được dùng kí tự a-z,0-9");
		   		error_num++
		   	}
		   	if(JewelType=='')
		   	{
		   		show_error("JewelType","<li>Chưa chọn Jewel");
		   		error_num++
		   	}
		if(error_num==0){		   	
		$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
		function(data){
			if(data.indexOf("Sai")>-1)
		    {
				show_error("security_code",data);
				error_num++
		    }
			if(error_num==0)
		   	{
		   		$("#Load_Content").load("Load_Content.php?Page=Bank_Manager/RecvJewel&security_code="+security_code+"&passcap2="+passcap2+"&number="+number+"&JewelType="+JewelType+"&RecvJewel=1");
		   		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
		   	}		   		
		   });


		}
	}	
	return false;
}

function SendZen()
{
	if(document.getElementsByName('AgreeSZ').checked==false)
	{
		alert('Bạn chưa đồng ý với điều kiện gửi Zen');
		return false;
	}
	else
	{
		var security_code=document.getElementById('security_code').value;
		var passcap2=document.getElementById('passcap2').value;
		var number=document.getElementById('number').value;
		var error_num=0

		   	if(!checkchuso(passcap2))
		   	{
		   		show_error("passcap2","<li>Chỉ được dùng kí tự a-z,0-9");
		   		error_num++
		   	}
		   	if(!checkso(number))
		   	{
		   		show_error("number","<li>Chỉ được dùng kí tự 0-9");
		   		error_num++
		   	}
		if(error_num==0){		   	
		$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
		function(data){
			if(data.indexOf("Sai")>-1)
		    {
				show_error("security_code",data);
				error_num++
		    }
			if(error_num==0)
		   	{
		   		$("#Load_Content").load("Load_Content.php?Page=Bank_Manager/SendZen&security_code="+security_code+"&passcap2="+passcap2+"&number="+number+"&SendZen=1");
		   		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
		   	}		   		
		   });

		}
		   	
	}	
	return false;
}

function RecvZen()
{
	if(document.getElementsByName('AgreeRZ').checked==false)
	{
		alert('Bạn chưa đồng ý với điều kiện rút Zen');
		return false;
	}
	else
	{
		
		var security_code=document.getElementById('security_code').value;
		var passcap2=document.getElementById('passcap2').value;
		var number=document.getElementById('number').value;
		
		var error_num=0

		   	if(!checkchuso(passcap2))
		   	{
		   		show_error("passcap2","<li>Chỉ được dùng kí tự a-z,0-9");
		   		error_num++
		   	}
		   	if(!checkso(number))
		   	{
		   		show_error("number","<li>Chỉ được dùng kí tự 0-9");
		   		error_num++
		   	}
		if(error_num==0){		   	
		$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
		function(data){
			if(data.indexOf("Sai")>-1)
		    {
				show_error("security_code",data);
				error_num++
		    }

			if(error_num==0)
		   	{
		   		$("#Load_Content").load("Load_Content.php?Page=Bank_Manager/RecvZen&security_code="+security_code+"&passcap2="+passcap2+"&number="+number+"&SendZen=1");
		   		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
		   	}		   		
		   });
		}
		   	
	}	
	return false;
}

function Transfer()
{
	if(document.getElementsByName('AgreeTS').checked==false)
	{
		alert('Bạn chưa đồng ý với điều kiện chuyển khoản');
		return false;
	}
	else
	{
		var security_code=document.getElementById('security_code').value;
		var passcap2=document.getElementById('passcap2').value;
		var number=document.getElementById('number').value;
		var AssetType=document.getElementById('AssetType').value;
		var AccRecv=document.getElementById('AccRecv').value;
		var OTP=document.getElementById('OTP').value;
			
		var error_num=0

	    	if(!checkchuso(AccRecv))
	    	{
	    		show_error("AccRecv","<li>Chỉ được dùng kí tự a-z,0-9");
	    		error_num++
	    	}
		   	if(!checkchuso(passcap2))
		   	{
		   		show_error("passcap2","<li>Chỉ được dùng kí tự a-z,0-9");
		   		error_num++
		   	}
		   	if(!checkso(number))
		   	{
		   		show_error("number","<li>Chỉ được dùng kí tự 0-9");
		   		error_num++
		   	}
		   	if(!checkchuso(AssetType))
		   	{
		   		show_error("AssetType","<li>Chỉ được dùng kí tự a-z,0-9");
		   		error_num++
		   	}
		   	if(AssetType=='')
		   	{
		   		show_error("AssetType","<li>Chưa chọn tài sản");
		   		error_num++
		   	}
	    	if(!checkchuso(OTP))
	    	{
	    		show_error("OTP","<li>Mã OTP chỉ được dùng kí tự a-z,0-9");
	    		error_num++
	    	}
		if(error_num==0){		   	
		$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
		function(data){
			if(data.indexOf("Sai")>-1)
		    {
				show_error("security_code",data);
				error_num++
		    }
			if(error_num==0)
		   	{
		   		$("#Load_Content").load("Load_Content.php?Page=Bank_Manager/BankTransfer&security_code="+security_code+"&passcap2="+passcap2+"&number="+number+"&AssetType="+AssetType+"&AccRecv="+AccRecv+"&OTP="+OTP+"&Transfer=1");
		   		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
		   	}			   		
		   });
		}
	}	
	return false;
}

function MoneyExChange()
{
	if(document.getElementsByName('AgreeME').checked==false)
	{
		alert('Bạn chưa đồng ý với điều kiện đổi tiền tệ');
		return false;
	}
	else
	{

		var security_code=document.getElementById('security_code').value;
		var passcap2=document.getElementById('passcap2').value;
		var money1=document.getElementById('money1').value;
		var TypeDoi=document.getElementById('TypeDoi').value;
		var error_num=0

		   	if(!checkchuso(passcap2))
		   	{
		   		show_error("passcap2","<li>Chỉ được dùng kí tự a-z,0-9");
		   		error_num++
		   	}
		   	if(!checkso(money1))
		   	{
		   		show_error("money1","<li>Chỉ được dùng kí tự 0-9");
		   		error_num++
		   	}
		if(error_num==0){		   	
		$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
		function(data){
			if(data.indexOf("Sai")>-1)
		    {
				show_error("security_code",data);
				error_num++
		    }
			if(error_num==0)
		   	{
		   		$("#Load_Content").load("Load_Content.php?Page=Bank_Manager/MoneyExChange&security_code="+security_code+"&passcap2="+passcap2+"&money1="+money1+"&TypeDoi="+TypeDoi+"&MoneyExChange=1");
		   		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
		   	} 	
		   });

	
		}
	}	
	return false;
}

function ExChangePointDV()
{
	if(document.getElementsByName('AgreeME').checked==false)
	{
		alert('Bạn chưa đồng ý với điều kiện đổi điểm danh vọng');
		return false;
	}
	else
	{

		var security_code=document.getElementById('security_code').value;
		var passcap2=document.getElementById('passcap2').value;
		var Point=document.getElementById('Point').value;
		var TypeDoi=document.getElementById('TypeDoi').value;
		var error_num=0

		   	if(!checkchuso(passcap2))
		   	{
		   		show_error("passcap2","<li>Chỉ được dùng kí tự a-z,0-9");
		   		error_num++
		   	}
		   	if(!checkso(Point))
		   	{
		   		show_error("Point","<li>Chỉ được dùng kí tự 0-9");
		   		error_num++
		   	}
		if(error_num==0){		   	
		$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
		function(data){
			if(data.indexOf("Sai")>-1)
		    {
				show_error("security_code",data);
				error_num++
		    }
			if(error_num==0)
		   	{
		   		$("#Load_Content").load("Load_Content.php?Page=Character_Manager/ExChangePointDV&security_code="+security_code+"&passcap2="+passcap2+"&Point="+Point+"&TypeDoi="+TypeDoi+"&ExChangePointDV=1");
		   		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
		   	} 	
		   });

	
		}
	}	
	return false;
}

function ItemExChange()
{
	if(document.getElementsByName('AgreeIE').checked==false)
	{
		alert('Bạn chưa đồng ý với điều kiện đổi item');
		return false;
	}
	else
	{
		for(var i=0;i<document.getElementsByName("ItemType").length;i++)
		{
			if(document.getElementsByName("ItemType")[i].checked==true)
			{
				var ItemType=document.getElementsByName("ItemType")[i].value;
				break;	
			}	
		}
		
		var security_code=document.getElementById('security_code').value;
		var passcap2=document.getElementById('passcap2').value;
		var number=document.getElementById('number').value;
		var error_num=0

		   	if(!checkchuso(passcap2))
		   	{
		   		show_error("passcap2","<li>Chỉ được dùng kí tự a-z,0-9");
		   		error_num++
		   	}
		   	if(!checkso(number))
		   	{
		   		show_error("number","<li>Chỉ được dùng kí tự 0-9");
		   		error_num++
		   	}
		if(error_num==0){		   	
		$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
		function(data){
			if(data.indexOf("Sai")>-1)
		    {
				show_error("security_code",data);
				error_num++
		    }
			if(error_num==0)
		   	{
		   		$("#Load_Content").load("Load_Content.php?Page=Bank_Manager/ItemExChange&security_code="+security_code+"&passcap2="+passcap2+"&ItemType="+ItemType+"&number="+number+"&ItemExChange=1");
		   		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
		   	}	
		   });


		}
	}	
	return false;
}
function ItemBuy()
{
	if(document.getElementsByName('AgreeIB').checked==false)
	{
		alert('Bạn chưa đồng ý với điều kiện mua item');
		return false;
	}
	else
	{
		for(var i=0;i<document.getElementsByName("ItemType").length;i++)
		{
			if(document.getElementsByName("ItemType")[i].checked==true)
			{
				var ItemType=document.getElementsByName("ItemType")[i].value;
				break;	
			}	
		}
		
		var security_code=document.getElementById('security_code').value;
		var passcap2=document.getElementById('passcap2').value;
		var number=document.getElementById('number').value;
		var error_num=0
			
		   	if(!checkchuso(passcap2))
		   	{
		   		show_error("passcap2","<li>Chỉ được dùng kí tự a-z,0-9");
		   		error_num++
		   	}
		   	if(!checkso(number))
		   	{
		   		show_error("number","<li>Chỉ được dùng kí tự 0-9");
		   		error_num++
		   	}
		if(error_num==0){		   	
		$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
		function(data){
			if(data.indexOf("Sai")>-1)
		    {
				show_error("security_code",data);
				error_num++
		    }
			if(error_num==0)
		   	{
		   		$("#Load_Content").load("Load_Content.php?Page=Bank_Manager/ItemBuy&security_code="+security_code+"&passcap2="+passcap2+"&ItemType="+ItemType+"&number="+number+"&ItemBuy=1");
		   		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
		   	}			   		
		   });



		}
	}	
	return false;
}

function choi_type_play(type)
{
	switch(type)
	{
		case 'lo':
			document.getElementById('type_play').innerHTML = "<input type='text' onfocus=hideErrorField('Num_Bet') name='num_bet1' id='num_bet1' size='3' maxlength='2' style='width:25px' class='inputstyle'/>";	
			break;
		case 'de':
			document.getElementById('type_play').innerHTML = "<input type='text' onfocus=hideErrorField('Num_Bet') name='num_bet1' id='num_bet1' size='3' maxlength='2' style='width:25px' class='inputstyle'/>";	
			break;
		case 'loxien2':
			document.getElementById('type_play').innerHTML = "<input type='text' onfocus=hideErrorField('Num_Bet') name='num_bet1' id='num_bet1' size='3' maxlength='2' style='width:25px' class='inputstyle'/> - <input onfocus=hideErrorField('Num_Bet') type='text' name='num_bet2' id='num_bet2' size='3' maxlength='2' style='width:25px' class='inputstyle'/>";	
			break;
		case 'loxien3':
			document.getElementById('type_play').innerHTML = "<input type='text' onfocus=hideErrorField('Num_Bet') name='num_bet1' id='num_bet1' size='3' maxlength='2' style='width:25px' class='inputstyle'/> - <input onfocus=hideErrorField('Num_Bet') type='text' name='num_bet2' id='num_bet2' size='3' maxlength='2' style='width:25px' class='inputstyle'/> - <input onfocus=hideErrorField('Num_Bet') type='text' name='num_bet3' id='num_bet3' size='3' maxlength='2' style='width:25px' class='inputstyle'/>";	
			break;
		case 'loxien4':
			document.getElementById('type_play').innerHTML = "<input type='text' onfocus=hideErrorField('Num_Bet') name='num_bet1' id='num_bet1' size='3' maxlength='2' style='width:25px' class='inputstyle'/> - <input onfocus=hideErrorField('Num_Bet') type='text' name='num_bet2' id='num_bet2' size='3' maxlength='2' style='width:25px' class='inputstyle'/> - <input onfocus=hideErrorField('Num_Bet') type='text' name='num_bet3' id='num_bet3' size='3' maxlength='2' style='width:25px' class='inputstyle'/> - <input onfocus=hideErrorField('Num_Bet') type='text' name='num_bet4' id='num_bet4' size='3' maxlength='2' style='width:25px' class='inputstyle'/>";	
			break;
	}

}

function PlayLoDe()
{
	if(document.getElementsByName('AgreeLD').checked==false)
	{
		alert('Bạn chưa đồng ý với điều kiện chơi lô đề');
		return false;
	}
	else
	{
		for(var i=0;i<document.getElementsByName('type_moneybet').length;i++)
		{
			if(document.getElementsByName('type_moneybet')[i].checked==true)
			{
				var type_moneybet=document.getElementsByName('type_moneybet')[i].value;
				break;	
			}	
		}
		
		var security_code=document.getElementById('security_code').value;
		var Play_Type=document.getElementById('Play_Type').value;
		var num_bet1=document.getElementById('num_bet1').value;
		var num_point=document.getElementById('num_point').value;
		var num_bet2=''
		var num_bet3=''
		var num_bet4=''
		var error_num=0
			
		if(!checkso(num_bet1))
		{
		   	show_error("Num_Bet","<li>Chỉ được dùng kí tự 0-9");
		   	error_num++
		}
		if(num_bet1.length!=2)
		{
		   show_error("Num_Bet","<li>Phải là 2 kí tự");
		   error_num++
		}
		
		if(Play_Type=='loxien2' || Play_Type=='loxien3' || Play_Type=='loxien4'){
			var num_bet2=document.getElementById('num_bet2').value;
		   	if(!checkso(num_bet2))
		   	{
		   		show_error("Num_Bet","<li>Chỉ được dùng kí tự 0-9");
		   		error_num++
		   	}
		   	if(num_bet2.length!=2)
		   	{
		   		show_error("Num_Bet","<li>Phải là 2 kí tự");
		   		error_num++
		   	}
		}
		if(Play_Type=='loxien3' || Play_Type=='loxien4'){
			var num_bet3=document.getElementById('num_bet3').value;
		   	if(!checkso(num_bet3))
		   	{
		   		show_error("Num_Bet","<li>Chỉ được dùng kí tự 0-9");
		   		error_num++
		   	}
		   	if(num_bet3.length!=2)
		   	{
		   		show_error("Num_Bet","<li>Phải là 2 kí tự");
		   		error_num++
		   	}
		}
		if(Play_Type=='loxien4'){
			var num_bet4=document.getElementById('num_bet4').value;
		   	if(!checkso(num_bet4))
		   	{
		   		show_error("Num_Bet","<li>Chỉ được dùng kí tự 0-9");
		   		error_num++
		   	}
		   	if(num_bet4.length!=2)
		   	{
		   		show_error("Num_Bet","<li>Phải là 2 kí tự");
		   		error_num++
		   	}
		}

		   	if(!checkso(num_point))
		   	{
		   		show_error("num_point","<li>Chỉ được dùng kí tự 0-9");
		   		error_num++
		   	}
		if(error_num==0){		   	
		$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
		function(data){
			if(data.indexOf("Sai")>-1)
		    {
				show_error("security_code",data);
				error_num++
		    }	
			if(error_num==0)
		   	{
		   		$("#Load_Content").load("Load_Content.php?Page=GiaiTri/LoDe_GhiSo&security_code="+security_code+"&type_moneybet="+type_moneybet+"&Play_Type="+Play_Type+"&num_bet1="+num_bet1+"&num_bet2="+num_bet2+"&num_bet3="+num_bet3+"&num_bet4="+num_bet4+"&num_point="+num_point+"&LoDe_GhiSo=1");
		   		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
		   	}	   		
		   });
		}
	}	
	return false;
}

function bet_date_submit(date)
{
	$("#Load_Content").load("Load_Content.php?Page=GiaiTri/LoDe_KetQua&date_bet="+date);
	return false;
}

function LoDe_Reward(string)
{
	$("#Load_Content").load("Load_Content.php?Page=GiaiTri/LoDe_KetQua&id="+string+"&CheckThuong=1");
	$("#Account_Content").load("Load_Content.php?Page=Right_Content");
	return false;
}

function ShopBuy(id,Cat)
{
	$.get("Load_Content.php", { Page: "Webshop/ShopItem", id: id, Cat: Cat },
   	function(data){
		$.fx.speeds._default = 1000;

			$( "#ShopTbl" ).dialog({
				autoOpen: false,
				show: "blind",
				hide: "explode"
			});

		$( "#ShopTbl" ).dialog( "open" );
		$("#ShopCont").empty().append(data);
	});
		
}

function ShopMTBuy(id,Cat)
{
	$.get("Load_Content.php", { Page: "Webshop/ShopMT", id: id, Cat: Cat },
   	function(data){
		$.fx.speeds._default = 1000;

			$( "#ShopTbl" ).dialog({
				autoOpen: false,
				show: "blind",
				hide: "explode"
			});

		$( "#ShopTbl" ).dialog( "open" );
		$("#ShopCont").empty().append(data);
	});
		
}

function ShopSetBuy(id)
{
	$.get("Load_Content.php", { Page: "Webshop/ShopSet", id: id },
   	function(data){
		$.fx.speeds._default = 1000;

			$( "#ShopTbl" ).dialog({
				autoOpen: false,
				show: "blind",
				hide: "explode"
			});

		$( "#ShopTbl" ).dialog( "open" );
		$("#ShopCont").empty().append(data);
	});
		
}

function SearchItem(Page)
{
	var Cat=document.getElementById('ShopLoad').value;
	$("#Load_Content").load("Load_Content.php?Page=Webshop/"+Page+"&Cat="+Cat);
}

function BuyItem(id,Cat)
{
		var security_code=document.getElementById('security_code').value;
		var number=document.getElementById('number').value;
		var passcap2=document.getElementById('passcap2').value;
		var error_num=0
		
		var Optvalue = '';
		if(Cat != 'shop_taphoa' && Cat != 'shop_event' && Cat != 'shop_trangsuc'){
			for (i = 0; i < document.getElementsByName("Opt[]").length; i++) {
			       if (document.getElementsByName("Opt[]")[i].checked){
			       	Optvalue += i;
			    }
			}
		}	
		   	if(!checkso(number) || number == 0)
		   	{
		   		error("number");
		   		error_num++
		   	}
		   	if(!checkchuso(passcap2))
		   	{
		   		error("passcap2");
		   		error_num++
		   	}
		if(error_num==0)
		{		   	
			$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
			function(data){
				if(data.indexOf("Sai")>-1)
			    {
					error("security_code");
			    }
				else
				{
					$.get("Load_Content.php", { Page: "Webshop/BuyItem", security_code: security_code, id: id, Cat: Cat, number: number, passcap2: passcap2, Optvalue: Optvalue, BuyItem: '1' },
					function(data)
					{
						if(data.indexOf('UYOK')==-1){
							alert(data)	
						}
						else{
							var info=data.split('|');
							//alert(info[2])
							//$.fx.speeds._default = 1000;
							//$( "#ShopTbl" ).dialog({
							//	autoOpen: false,
							//	show: "blind",
							//	hide: "explode"
							//});

							//$(function() {
							//	$( "#ShopTbl" ).dialog( 'close' );
							//});
							$("#ShopCont").empty().append('<img src="./templates/images/li_1.gif"> '+info[2]);
							//Show_Dialog(info[2])
							
							$("#Account_Content").load("Load_Content.php?Page=Right_Content");
						}
					});			
				}
			 });
			 
	}	

	//return false;
}

function BuyMTItem(id,Cat)
{
		var security_code=document.getElementById('security_code').value;
		var number=document.getElementById('number').value;
		var passcap2=document.getElementById('passcap2').value;
		var error_num=0;
		
		
		var Optvalue = '';
		if(Cat != 'ShopMT_TapHoa'){
		    for (i = 0; i < document.getElementsByName("Opt[]").length; i++) {
		        if (document.getElementsByName("Opt[]")[i].checked){
		        	Optvalue += i;
		    	}
		    }
		}
		
		if(!checkso(number) || number == 0)
		{
		  	error("number");
		   	error_num++
		}
		if(!checkchuso(passcap2))
		{
		 	error("passcap2");
		  	error_num++
		}
		if(error_num==0){		   	
		$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
		function(data){
		if(data.indexOf("Sai")>-1)
		 {
			error("security_code");
			error_num++
		  }
		   		
		 });
		 
			if(error_num==0)
		   	{
		   		$.get("Load_Content.php", { Page: "Webshop/BuyMTItem", security_code: security_code, id: id, Cat: Cat, number: number, passcap2: passcap2, Optvalue: Optvalue, BuyItem: '1' },
				function(data){
					if(data.indexOf('UYOK')==-1){
						alert(data)	
					}
					else{
						var info=data.split('|');
						//alert(info[2])
						//$.fx.speeds._default = 1000;
						//$( "#ShopTbl" ).dialog({
						//	autoOpen: false,
						//	show: "blind",
						//	hide: "explode"
						//});

						//$(function() {
						//	$( "#ShopTbl" ).dialog( 'close' );
						//});
						$("#ShopCont").empty().append('<img src="./templates/images/li_1.gif"> '+info[2]);
						//Show_Dialog(info[2])
							
						$("#Account_Content").load("Load_Content.php?Page=Right_Content");
					}
				});
			}
	}	

	//return false;
}

function BuySetItem(id)
{
		var security_code=document.getElementById('security_code').value;
		var passcap2=document.getElementById('passcap2').value;
		var error_num=0
		Optvalue = '';
		for (i = 0; i < document.getElementsByName("Opt[]").length; i++) {
		  if (document.getElementsByName("Opt[]")[i].checked){
		      	Optvalue += i;
		    }
		}

		if(!checkchuso(passcap2))
		{
		 	error("passcap2");
		 	error_num++
		}
		   	
		$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
		function(data){
			if(data.indexOf("Sai")>-1)
		    {
				error("security_code");
				error_num++
		    }		   		
		 });

			if(error_num==0)
		   	{
		   		$.get("Load_Content.php", { Page: "Webshop/BuySetItem", security_code: security_code, id: id, passcap2: passcap2, Optvalue: Optvalue, BuyItem: '1' },
				function(data){
					if(data.indexOf('UYOK')==-1){
						alert(data)	
					}
					else{
						var info=data.split('|');
						//alert(info[2])
						//$.fx.speeds._default = 1000;
						//$( "#ShopTbl" ).dialog({
						//	autoOpen: false,
						//	show: "blind",
						//	hide: "explode"
						//});

						//$(function() {
						//	$( "#ShopTbl" ).dialog( 'close' );
						//});
						$("#ShopCont").empty().append('<img src="./templates/images/li_1.gif"> '+info[2]);
						//Show_Dialog(info[2])
							
						$("#Account_Content").load("Load_Content.php?Page=Right_Content");
					}
				});
		   	}
	//return false;
}

function tinhtoan_bankitem(sl,name)
{
	var Money2=$("#Money2").val();
	for(var i=0;i<document.getElementsByName('ItemType').length;i++)
	{
		if(document.getElementsByName('ItemType')[i].checked==true)
		{
			var Typeitem=document.getElementsByName('ItemType')[i].value;
			break;	
		}	
	}

	switch(Typeitem){
		case 'Gold':
			var gia=$("#PriceGold").val();
			break;
		case 'Xu':
			var gia=$("#PriceXu").val();
			break;
		case 'GoldXu':
			var gia=$("#PriceGoldXu").val();
			break;
	}
	
	if(!checkso(sl) && sl!='')
	{
		alert('Dữ liệu phải là số');
		document.getElementsByName('number').value=1;
		sl=1;
		//document.getElementById('money2').innerHTML = ''
	}
	
	var money=parseInt(gia*sl);
	if(Money2!='undefined' && money>Money2){
		alert('Bạn không có đủ tiền để trả.');
		document.getElementsByName('number').value=sl.substring(0,sl.length-1);
	}
	else{
		document.getElementById('money2').innerHTML = '&nbsp;<font color=red>'+formatCurrency(money)+'</font> '+name;
	}
	
}

function tinhtoan_eventmoney2(sl,name)
{
	for(var i=0;i<document.getElementsByName('ItemType').length;i++)
	{
		if(document.getElementsByName('ItemType')[i].checked==true)
		{
			var Typeitem=document.getElementsByName('ItemType')[i].value;
			break;	
		}	
	}

	if(!checkso(sl) && sl!='')
	{
		alert('Dữ liệu phải là số');
		document.getElementById('money2').innerHTML = ''
	}
	else{
		if(Typeitem=='Item1'){
			var gia=$("#Price").val();
			var money=parseInt(gia*sl);
			document.getElementById('money2').innerHTML = 'Nhận được <font color=red>'+formatCurrency(money)+'</font> '+name;
		}
		else if(Typeitem=='Item2'){
			var ItemNhan=$("#ItemNhan").val();
			var SoLuong2=$("#SoLuong2").val();
			var nhanduoc=parseInt(Math.floor(sl/SoLuong2));
			document.getElementById('money2').innerHTML = "Nhận được <b><font color=red>"+nhanduoc+"</font></b> "+ItemNhan;
		}
	}	
}

function ItemExChangeEventMoney2()
{
	if(document.getElementsByName('AgreeEVM2').checked==false)
	{
		alert('Bạn chưa đồng ý với điều kiện đổi item');
		return false;
	}
	else
	{

		for(var i=0;i<document.getElementsByName('ItemType').length;i++)
		{
			if(document.getElementsByName('ItemType')[i].checked==true)
			{
				var Typeitem=document.getElementsByName('ItemType')[i].value;
				break;	
			}	
		}
			
		var security_code=document.getElementById('security_code').value;
		var passcap2=document.getElementById('passcap2').value;
		var number=document.getElementById('number').value;

		var error_num=0
			
		   	if(!checkchuso(passcap2))
		   	{
		   		show_error("passcap2","<li>Chỉ được dùng kí tự a-z,0-9");
		   		error_num++
		   	}
		   	if(!checkso(number))
		   	{
		   		show_error("number","<li>Chỉ được dùng kí tự 0-9");
		   		error_num++
		   	}
		if(error_num==0){		   	
			$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
			function(data){
				if(data.indexOf("Sai")>-1)
			    {
					show_error("security_code",data);
					error_num++
			    }
				if(error_num==0)
			   	{
			   		$("#Load_Content").load("Load_Content.php?Page=Bank_Manager/ItemMoney2&security_code="+security_code+"&passcap2="+passcap2+"&number="+number+"&ItemType="+Typeitem+"&ItemMoney2=1");
			   		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
			   	}		   		
			   });
		}
	}	
	return false;
}

function tinhtoan_eventUT(sl,name)
{

	var PointUT=$("#PointUT").val();
	var money_recv=$("#money_recv").val();
	var PointUT2=$("#PointUT2").val();
	var money_recv2=$("#money_recv2").val();
		
	for(var i=0;i<=document.getElementsByName('Type').length;i++)
	{
		if(document.getElementsByName('Type')[i].checked==true)
		{
			var Type=document.getElementsByName('Type')[i].value;
			break;	
		}	
	}
	if(Type=='PointUT'){
		var NameRecv='Điểm ủy thác';
		var RecvFrom=PointUT;
		var RecvTo=PointUT2;
	}
	else if (Type=='Money'){
		var NameRecv=name;
		var RecvFrom=money_recv;
		var RecvTo=money_recv2;
	}

	if(Type!='Item')
	{
		if(!checkso(sl) && sl!='')
		{
			alert('Dữ liệu phải là số');
			document.getElementById('show_tinhtoan').innerHTML = ''
		}else{
			document.getElementById('show_tinhtoan').innerHTML = 'Nhận được <font color=red>'+formatCurrency(parseInt(RecvFrom*sl))+' ~ '+formatCurrency(parseInt(RecvTo*sl))+'</font> '+NameRecv;
		}	
	}
	else{
		document.getElementById('show_tinhtoan').innerHTML='';	
	}
}	
function formatCurrency(num)
{
    num = num.toString().replace(/\$|\,/g,'');
    if(isNaN(num))
    num = "0";
    sign = (num == (num = Math.abs(num)));
    num = Math.floor(num*100+0.50000000001);
    num = Math.floor(num/100).toString();
    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
    num = num.substring(0,num.length-(4*i+3))+','+
    num.substring(num.length-(4*i+3));
    return (((sign)?'':'-') + num);
}

function EventPointUT()
{
	if(document.getElementsByName('AgreeEVM2').checked==false)
	{
		alert('Bạn chưa đồng ý với điều kiện đổi item');
		return false;
	}
	else
	{

		for(var i=0;i<document.getElementsByName('Type').length;i++)
		{
			if(document.getElementsByName('Type')[i].checked==true)
			{
				var Type=document.getElementsByName('Type')[i].value;
				break;	
			}	
		}
			
		var security_code=document.getElementById('security_code').value;
		var passcap2=document.getElementById('passcap2').value;
		var number=document.getElementById('number').value;
		var error_num=0

		   	if(!checkchuso(passcap2))
		   	{
		   		show_error("passcap2","<li>Chỉ được dùng kí tự a-z,0-9");
		   		error_num++
		   	}
		   	if(!checkso(number))
		   	{
		   		show_error("number","<li>Chỉ được dùng kí tự 0-9");
		   		error_num++
		   	}
		if(error_num==0){		   	
			$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
			function(data){
				if(data.indexOf("Sai")>-1)
			    {
					show_error("security_code",data);
					error_num++
			    }
				if(error_num==0)
			   	{
			   		$("#Load_Content").load("Load_Content.php?Page=Event/ItemPointUT&security_code="+security_code+"&passcap2="+passcap2+"&number="+number+"&Type="+Type+"&ItemMoney2=1");
			   		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
			   	}	
			});
			

		}
	}	
	return false;
}

function tinhtoan_jewel(sl,name)
{
	var Typeitem=document.getElementsByName('JewelType').value;
	switch(Typeitem){
		case 'Chaos':
			var sljewel=$("#num_chaos").val();	
			break;
		case 'Cre':
			var sljewel=$("#num_cre").val();		
			break;
		case 'Blue':
			var sljewel=$("#num_blue").val();
			break;
	}
	
	
	if(!checkso(sl) && sl.length>0)
	{
		alert('Dữ liệu phải là số');
		document.getElementsByName('number').value=1;
		sl=1;
		//document.getElementById('money2').innerHTML = ''
	}
	
	if(parseInt(sl)>parseInt(sljewel)){
		alert('Không có đủ '+Typeitem+' để rút.');
		document.getElementsByName('number').value=sl.substring(0,sl.length-1);
	}	
}

function tinhtoan_rutzen(num){
	var bankzen=$("#bankzen").val();
	
	if(parseInt(num)>parseInt(bankzen)){
		alert('Không có đủ Zen để rút.');
		document.frm.number.value=document.frm.number.value.substring(0,document.frm.number.value.length-1);
	}
}

function NapThe()
{
	if(document.getElementsByName('AgreeNT').checked==false)
	{
		alert('Bạn chưa đọc hướng dẫn nạp thẻ');
		return false;
	}
	else
	{
		
		var security_code=document.getElementById('security_code').value;
		var Card_Seri=document.getElementById('Card_Seri').value;
		var Card_Code=document.getElementById('Card_Code').value;
		var Card_Type=document.getElementById('Card_Type').value;
		var Card_Amount=document.getElementById('Card_Amount').value;
		var error_num=0

			if(!checkso(Card_Amount))
			{
			  	show_error("Card_Amount","<li>Chỉ được dùng kí tự 0-9");
			 	error_num++
			}
			if(!checkchuso(Card_Seri))
			{
			 	show_error("Card_Seri","<li>Chỉ được dùng kí tự a-z,0-9");
			 	error_num++
			}
			if(!checkchuso(Card_Code))
			{
			   	show_error("Card_Code","<li>Chỉ được dùng kí tự a-z,0-9");
			   	error_num++
		    }
		    
		if(error_num==0){		   	
			$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
			function(data){
			if(data.indexOf("Sai")>-1)
		    {
				show_error("security_code",data);
				error_num++
			}
			if(error_num==0)
		   	{
		   		$("#Load_Content").load("Load_Content.php?Page=NapThe/NapThe&security_code="+security_code+"&Card_Seri="+Card_Seri+"&Card_Code="+Card_Code+"&Card_Type="+Card_Type+"&Card_Amount="+Card_Amount+"&NapThe=1");
		   		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
		   	}				
		});


		}
		   	
	}	
	return false;
}

function DateNapThe()
{
		var DateFrom=document.getElementById('datepickerfrom').value;
		var DateTo=document.getElementById('datepickerto').value;
		$("#Load_Content").load("Load_Content.php?Page=NapThe/XemThe&DateFrom="+DateFrom+"&DateTo="+DateTo+"&DateNapThe=1");
		return false;
}

function HisTK(Type)
{
		var DateFrom=document.getElementById('datepickerfrom').value;
		var DateTo=document.getElementById('datepickerto').value;
		$("#Load_Content").load("Load_Content.php?Page=Account_Manager/ActionHistory&DateFrom="+DateFrom+"&DateTo="+DateTo+"&Type="+Type+"&ActionHistory=1");
		return false;
}

function ItemPointEvent()
{
	if(document.getElementsByName('Agree').checked==false)
	{
		alert('Bạn chưa đọc hướng dẫn');
		return false;
	}
	else
	{
		for(var i=0;i<document.getElementsByName('ItemType').length;i++)
		{
			if(document.getElementsByName('ItemType')[i].checked==true)
			{
				var Typeitem=document.getElementsByName('ItemType')[i].value;
				break;	
			}	
		}
		for(var i=0;i<document.getElementsByName('congthuc').length;i++)
		{
			if(document.getElementsByName('congthuc')[i].checked==true)
			{
				var CongThuc=document.getElementsByName('congthuc')[i].value;
				break;	
			}	
		}
		
		var security_code=document.getElementById('security_code').value;
		var passcap2=document.getElementById('passcap2').value;
		var number=document.getElementById('number').value;		
		var error_num=0

		   	if(!checkchuso(passcap2))
		   	{
		   		show_error("passcap2","<li>Chỉ được dùng kí tự a-z,0-9");
		   		error_num++
		   	}
		   	if(!checkso(number))
		   	{
		   		show_error("number","<li>Chỉ được dùng kí tự 0-9");
		   		error_num++
		   	}
		   	
		if(error_num==0){
			$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
			function(data){
				if(data.indexOf("Sai")>-1)
			    {
					show_error("security_code",data);
					error_num++
			    }
				if(error_num==0)
			   	{
			   		$("#Load_Content").load("Load_Content.php?Page=Event/ItemPoint&security_code="+security_code+"&passcap2="+passcap2+"&number="+number+"&Typeitem="+Typeitem+"&CongThuc="+CongThuc+"&ItemPoint=1");
			   		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
			   	}	
			   });


		}
	}
	
	return false;
}

function ItemEventGame2Point()
{
	if(document.getElementsByName('Agree').checked==false)
	{
		alert('Bạn chưa đọc hướng dẫn');
		return false;
	}
	else
	{	
		var security_code=document.getElementById('security_code').value;
		var passcap2=document.getElementById('passcap2').value;
		var number=document.getElementById('number').value;		
		var error_num=0

		   	if(!checkchuso(passcap2))
		   	{
		   		show_error("passcap2","<li>Chỉ được dùng kí tự a-z,0-9");
		   		error_num++
		   	}
		   	if(!checkso(number))
		   	{
		   		show_error("number","<li>Chỉ được dùng kí tự 0-9");
		   		error_num++
		   	}
		   	
		if(error_num==0){
			$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
			function(data){
				if(data.indexOf("Sai")>-1)
			    {
					show_error("security_code",data);
					error_num++
			    }
				if(error_num==0)
			   	{
			   		$("#Load_Content").load("Load_Content.php?Page=Event/ItemGame2PointEvent&security_code="+security_code+"&passcap2="+passcap2+"&number="+number+"&ItemGame2Point=1");
			   		$("#Account_Content").load("Load_Content.php?Page=Right_Content");
			   	}	
			   });
		}
	}
	
	return false;
}


function confirm_clearpoint(money,name_money)
{
	var answer = confirm ("Tẩy điểm sẽ tốn "+money+" "+name_money+". Bạn có muốn tiếp tục không?")
	if (answer)
		ClearPoint();
	else
		return false;
}


function Goblin_ItemReg(ItemCode)
{
	$.get("Load_Content.php", { Page: "Event/Goblin", do: "RegItem", ItemCode: ItemCode },
	function(data){
		if(data.indexOf("ip_other")>-1){
			alert('IP hiện tại không được phép truy cập tài khoản này');
			window.location='?Page=Logout'
		}
		else if(data.indexOf("session_other")>-1){
			alert('Tài khoản của bạn đang được truy cập tại một trình duyệt khác.');
			window.location='?Page=Logout'
		}
		else if(data.indexOf("OKMEN")>-1){
			parent.$.fn.colorbox.close();
		}
		else{
			alert(data);
		}
	});
	return false;
}

function GoblinUpItem(ItemCode,Accept)
{
	if(Accept==0){
		alert('Bạn không thể Up cấp cho Item này');
	}
	else{
		$.get("Load_Content.php", { Page: "Event/Goblin", do: "UpItem", ItemCode: ItemCode },
		function(data){
			if(data.indexOf("ip_other")>-1){
				alert('IP hiện tại không được phép truy cập tài khoản này');
				window.location='?Page=Logout'
			}
			else if(data.indexOf("session_other")>-1){
				alert('Tài khoản của bạn đang được truy cập tại một trình duyệt khác.');
				window.location='?Page=Logout'
			}
			else if(data.indexOf("OKMEN")>-1){
				Show_Dialog("<font color=green>Up cấp cho Item thành công.</font>");
				$("#Load_Content").load("Load_Content.php?Page=Event/Goblin");
			}
			else{
				alert(data);
			}
		});
	}
	return false;
}

function PassGameLoad()
{
	$.get("Load_Content.php", { Page: "IPProtect", PassGameLoad: 1 },
	   	function(data){
	   		if(data.length==5){
	   			alert('Mật khẩu của bạn là: '+data);
	   		}else
		   	{
		   		alert(data);
			}
	   	});
	   	return false;
}

function validateIP(what) {
	if (what.search(/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/) != -1) {
		var myArray = what.split(/\./);
		if (myArray[0] > 255 || myArray[1] > 255 || myArray[2] > 255 || myArray[3] > 255) return false;
		if (myArray[0] == 0 && myArray[1] == 0 && myArray[2] == 0 && myArray[3] == 0) return false;
		return true;
	}
	else
	return false;
}

function AddIP()
{
var list = new Array();
var u=0
var error_num=0
var security_code=document.getElementById('security_code').value;
var ip_list = document.frm.elements['ip[]'];
var OTP_ID="OTP"
var OTP=document.getElementById(OTP_ID).value;

for (var i=0; i<ip_list.length; ++i){
	if(ip_list[i].value.length>0){
		if(validateIP(ip_list[i].value)){
			list[u]=ip_list[i].value;
			u++
		}
		else {
		   	show_error("ip_"+i,"<li>IP này không hợp lệ");
		   	error_num++	
		}
	}
}
var new_list=list.join(',');

    	if(!checkchuso(OTP))
    	{
    		show_error(OTP_ID,"<li>Mã OTP chỉ được dùng kí tự a-z,0-9");
    		error_num++
    	}
    	
		if(error_num==0){
			$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
			function(data){
				if(data.indexOf("Sai")>-1)
			    {
					show_error("security_code",data);
					error_num++
			    }
				if(error_num==0)
			   	{
			   		$("#Load_Content").load("Load_Content.php?Page=IPProtect_AddIP&security_code="+security_code+"&ListIP="+new_list+"&OTP="+OTP+"&IPProtect_Add=1");
			   	}	  	
			   });
		}
		
		return false;		
}

function checkUrlImg(url){
	if(/^http:\/\/.+\.(gif|png|jpg|jpeg)$/i.test(url)) return true;
	else return false;
}

function ChangePassDaiLy() {
	var new_pass_ID="new_pass"
	var renew_pass_ID="renew_pass"
	var security_code_ID="security_code"
	var OTP_ID="OTP"

	new_pass=document.getElementById(new_pass_ID).value;
	renew_pass=document.getElementById(renew_pass_ID).value;
	security_code=document.getElementById(security_code_ID).value;
	OTP=document.getElementById(OTP_ID).value;
	
  	var error_num=0
 
     	if(!checkchuso(new_pass))
    	{
    		show_error(new_pass_ID,"<li>Mật khẩu mới chỉ được dùng kí tự a-z,0-9");
    		error_num++
    	}
      	if(new_pass.length<6 || new_pass.length>16)
    	{
    		show_error(new_pass_ID,"<li>Mật khẩu mới có độ dài từ 6-16 ký tự");
    		error_num++
    	}
    	if(new_pass!=renew_pass)
    	{
    		show_error(renew_pass_ID,"<li>Mật khẩu mới và nhập lại không giống nhau.");
    		error_num++
    	}
    	if(!checkchuso(OTP))
    	{
    		show_error(OTP_ID,"<li>Mã OTP phải là chữ hoặc số 0-9,a-z");
    		error_num++
    	}
    	
	if(error_num==0){    	
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
    	if(data.indexOf("Sai")>-1)
    	{
			show_error(security_code_ID,data);
			error_num++
    	}
     	if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=DaiLy/ChangePass&new_pass="+new_pass+"&renew_pass="+renew_pass+"&security_code="+security_code+"&OTP="+OTP+"&Change=1");
    	}   	
   	});
	
    }
	return false;

}


function DaiLy_Register()
{
	var DaiLy_Name_ID="DaiLy_Name"
	var DaiLy_GPKD_ID="DaiLy_GPKD"
	var DaiLy_PhoneNum_ID="DaiLy_PhoneNum"
	var DaiLy_Yahoo_ID="DaiLy_Yahoo"
	var DaiLy_Password_ID="DaiLy_Password"
	var security_code_ID="security_code"


	DaiLy_Name = document.getElementById(DaiLy_Name_ID).value;
	DaiLy_GPKD = document.getElementById(DaiLy_GPKD_ID).value;
	DaiLy_PhoneNum = document.getElementById(DaiLy_PhoneNum_ID).value;
	DaiLy_Yahoo = document.getElementById(DaiLy_Yahoo_ID).value;
	DaiLy_Password = document.getElementById(DaiLy_Password_ID).value;
	security_code = document.getElementById(security_code_ID).value;
	
  	var error_num=0
  		
    	if(!checkUrlImg(DaiLy_GPKD))
    	{
    		show_error(DaiLy_GPKD_ID,"<li>Đường dẫn hình ảnh không đúng.");
    		error(DaiLy_GPKD_ID);
    		error_num++   			
    	}
      	if(!checkphone(DaiLy_PhoneNum))
    	{
    		show_error(DaiLy_PhoneNum_ID,"<li>Số điện thoại không hợp lệ");
    		error(DaiLy_PhoneNum_ID);
    		error_num++
    	}
  		if(!checkchuso(DaiLy_Name))
    	{
    		show_error(DaiLy_Name_ID,"<li>Tên Đại Lý phải là kí tự a-z,0-9");
    		error(DaiLy_Name_ID);
    		error_num++
    	}
    	if(!checkchuso_(DaiLy_Yahoo))
    	{
    		show_error(DaiLy_Yahoo_ID,"<li>Nick Yahoo phải là kí tự _,a-z,0-9");
    		error(DaiLy_Yahoo_ID);
    		error_num++
    	}
    	if(!checkchuso(DaiLy_Password))
    	{
    		show_error(DaiLy_Password_ID,"<li>Mật khẩu Đại Lý phải là kí tự a-z,0-9");
    		error(DaiLy_Password_ID);
    		error_num++
    	}
 
 	if(error_num==0){   	
	$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
   	function(data){
    	if(data.indexOf("Sai")>-1)
    	{
			show_error(security_code_ID,data);
			error(security_code_ID);
			error_num++
    	}
    	if(error_num==0)
    	{
    		$("#Load_Content").load("Load_Content.php?Page=DaiLy/Register&DaiLy_GPKD="+DaiLy_GPKD+"&DaiLy_PhoneNum="+DaiLy_PhoneNum+"&DaiLy_Yahoo="+DaiLy_Yahoo+"&DaiLy_Password="+DaiLy_Password+"&DaiLy_Name="+DaiLy_Name+"&security_code="+security_code+"&Register=1");
    	}    		
   	});

    }	
	return false;		
}
function RefreshInfoDaiLy(){
	$("#Load_Content").load("Load_Content.php?Page=DaiLy/WaitActivate");
}

function UpdateInfoDaiLy()
{
	var DaiLy_GPKD_ID="DaiLy_GPKD"
	var DaiLy_PhoneNum_ID="DaiLy_PhoneNum"
	var DaiLy_Yahoo_ID="DaiLy_Yahoo"

	DaiLy_GPKD = document.getElementById(DaiLy_GPKD_ID).value;
	DaiLy_PhoneNum = document.getElementById(DaiLy_PhoneNum_ID).value;
	DaiLy_Yahoo = document.getElementById(DaiLy_Yahoo_ID).value;
	
  	var error_num=0
  		
    	if(!checkUrlImg(DaiLy_GPKD))
    	{
    		alert('Đường dẫn hình ảnh không đúng.');
    		error_num++   			
    	}
      	else if(!checkphone(DaiLy_PhoneNum))
    	{
    		alert('Số điện thoại không hợp lệ');
    		error_num++
    	}
    	else if(!checkchuso_(DaiLy_Yahoo))
    	{
    		alert('Nick Yahoo phải là kí tự _,a-z,0-9');
    		error_num++
    	}
    	
    	if(error_num == 0) $("#Load_Content").load("Load_Content.php?Page=DaiLy/WaitActivate&DaiLy_GPKD="+DaiLy_GPKD+"&DaiLy_PhoneNum="+DaiLy_PhoneNum+"&DaiLy_Yahoo="+DaiLy_Yahoo+"&Update=1");    		
    		
	return false;		
}

function DaiLyTransfer()
{
	if(document.getElementsByName('AgreeTS').checked==false)
	{
		alert('Bạn chưa đọc thông tin chuyển khoản');
		return false;
	}
	else
	{
		
		var security_code=document.getElementById('security_code').value;
		var password=document.getElementById('password').value;
		var number=document.getElementById('number').value;
		var AccRecv=document.getElementById('AccRecv').value;
			
		var error_num=0

	    	if(!checkchuso(AccRecv))
	    	{
	    		show_error("AccRecv","<li>Chỉ được dùng kí tự a-z,0-9");
	    		error_num++
	    	}
		   	if(!checkchuso(password))
		   	{
		   		show_error("password","<li>Chỉ được dùng kí tự a-z,0-9");
		   		error_num++
		   	}
		   	if(!checkso(number))
		   	{
		   		show_error("number","<li>Chỉ được dùng kí tự 0-9");
		   		error_num++
		   	}
	    	
		if(error_num==0){		   	
		$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
		function(data){
			if(data.indexOf("Sai")>-1)
		    {
				show_error("security_code",data);
				error_num++
		    }
			if(error_num==0)
		   	{
		   		$("#Load_Content").load("Load_Content.php?Page=DaiLy/Transfer&security_code="+security_code+"&password="+password+"&number="+number+"&AccRecv="+AccRecv+"&number="+number+"&Transfer=1");
		   	}			   		
		   });
		}
	}	
	return false;
}

function DateDaiLyCK()
{
		var DateFrom=document.getElementById('datepickerfrom').value;
		var DateTo=document.getElementById('datepickerto').value;
		$("#Load_Content").load("Load_Content.php?Page=DaiLy/LichSu&DateFrom="+DateFrom+"&DateTo="+DateTo);
		return false;
}

function DaiLyOrder()
{
	if(document.getElementsByName('AgreeNT').checked==false)
	{
		alert('Bạn chưa đọc hướng dẫn đặt hàng');
		return false;
	}
	else
	{
		var Bank_Type_ID = "Bank_Type"
		var Amount_ID = "Amount"
		var security_code_ID = "security_code";
		
		Bank_Type = document.getElementById(Bank_Type_ID).value;
		Amount = document.getElementById(Amount_ID).value;
		security_code = document.getElementById(security_code_ID).value;
		
	  	var error_num=0
	  		
	    	if(!checkchuso(Bank_Type))
	    	{
	    		show_error(Bank_Type_ID,'<li>Ngân hàng chỉ được phép dùng kí tự a-z,0-9');
	    		error_num++
	    	}
	    	if(!checkso(Amount))
	    	{
	    		show_error(Amount_ID,'<li>Số tiền chỉ được dùng kí tự 0-9');
	    		error_num++
	    	}	    	
		if(error_num==0){		   	
		$.get("Load_Content.php", { Page: "Security_Code", security_code: security_code },
		function(data){
			if(data.indexOf("Sai")>-1)
		    {
				show_error("security_code",data);
				error_num++
		    }
			if(error_num==0)
		   	{
		   		$("#Load_Content").load("Load_Content.php?Page=DaiLy/NapTien&security_code="+security_code+"&Bank_Type="+Bank_Type+"&Amount="+Amount+"&NapTien=1");
		   	}			   		
		   });
		}
    }	
	return false;		
}


function ShopLineCheck() {
    var i, dLen = document.getElementsByName('Opt[]'), CountLine = 0, 
    MaxLine = parseInt(document.getElementById("MaxLine").value),
    PriceItem = parseInt(document.getElementById("PriceItem").value);

    PriceOpt = new Array();
    PriceOpt[0] = parseInt(document.getElementById("PriceOpt1").value);
   	PriceOpt[1] = parseInt(document.getElementById("PriceOpt2").value);
   	PriceOpt[2] = parseInt(document.getElementById("PriceOpt3").value);
   	PriceOpt[3] = parseInt(document.getElementById("PriceOpt4").value);
   	PriceOpt[4] = parseInt(document.getElementById("PriceOpt5").value);
   	PriceOpt[5] = parseInt(document.getElementById("PriceOpt6").value);
   	PriceOpt[6] = parseInt(document.getElementById("PriceOpt7").value);

    var CalPrice = 0;
    for (i = 0; i < dLen.length; i++) {
        if (dLen[i].checked && !isNaN(PriceOpt[i])){
        	CalPrice += PriceOpt[i];
        	if(i <= 5 )CountLine++;
    	}
    }

    if(CountLine > MaxLine){
    	alert('Bạn chỉ được chọn tối đa '+MaxLine+' dòng');
      	return false;
	}
	var Total = PriceItem+CalPrice;
	document.getElementById("TotalPrice").value = Total;
}

function ShopMTLineCheck() {
    var i, dLen = document.getElementsByName("Opt[]"), CountLine = 0, 
    MaxLine = parseInt(document.getElementById("MaxLine").value),
    SoLuong = parseInt(document.getElementById("number").value),
    PercentReduce = parseInt(document.getElementById("PercentReduce").value),
    PriceItem = parseInt(document.getElementById("PriceItem").value);

    if(isNaN(PercentReduce)) PercentReduce = 0;
    PriceOpt = new Array();
    PriceOpt[0] = parseInt(document.getElementById("PriceOpt1").value);
   	PriceOpt[1] = parseInt(document.getElementById("PriceOpt2").value);
   	PriceOpt[2] = parseInt(document.getElementById("PriceOpt3").value);
   	PriceOpt[3] = parseInt(document.getElementById("PriceOpt4").value);
   	PriceOpt[4] = parseInt(document.getElementById("PriceOpt5").value);
   	PriceOpt[5] = parseInt(document.getElementById("PriceOpt6").value);
   	PriceOpt[6] = parseInt(document.getElementById("PriceOpt7").value);
    
    var CalPrice = 0;
    for (i = 0; i < dLen.length; i++) {
        if (dLen[i].checked && !isNaN(PriceOpt[i])){
        	CalPrice += PriceOpt[i];
        	if(i <= 5) CountLine++;
    	}
    }
    if(CountLine > MaxLine){
    	alert('Bạn chỉ được chọn tối đa '+MaxLine+' dòng');
      	return false;
	}
	var Total = (PriceItem+CalPrice)*SoLuong;
	document.getElementById("TotalPrice").value = Total - ((Total*PercentReduce)/100);
}

function GetResultSpinItem(NameMoney1, NameMoney2, TotalItem)
{
	$.get("Load_Content.php", { Page: "Event/EventQuayItem", GetResult: 1 },
		   	function(data){
		   		if(data.length>0)
		   		{
					if(data.indexOf('|') > -1 && data.indexOf('OKMEN') > -1)
					{
						var DataSplit = data.split('<lanquay>');
						var info = DataSplit[0].split('|');
						var strReport = '';
						var LanQuayConLai = DataSplit[1];
							
						if(info[1] == 'PointUT'){strReport = 'Bạn đã nhận được ' + formatCurrency(info[2]) + ' điểm ủy thác. Số lần quay của bạn còn '+LanQuayConLai}
						else if(info[1] == 'Item'){strReport = 'Bạn đã nhận được ' + info[2] + '. Số lần quay của bạn còn '+LanQuayConLai}
						else{
							if(info[1] == 'MoneyC1') strReport = 'Bạn đã nhận được ' + formatCurrency(info[2]) + ' ' + NameMoney1 + '. Số lần quay của bạn còn '+LanQuayConLai;
							else strReport = 'Bạn đã nhận được ' + formatCurrency(info[2]) + ' ' + NameMoney2 + '. Số lần quay của bạn còn '+LanQuayConLai;
						}

						DoStartSpinItem(info[info.length-1], strReport, TotalItem);
						
					}else alert(data);
				}
				else{
					alert('Có lỗi xảy ra. Xin vui lòng đăng nhập lại hoặc thoát trình duyệt...')
				}
		   	});
}

function GetResultSpinItem2(NameMoney1, NameMoney2, Valid_Num, TotalItem)
{
	if(parseInt(Valid_Num) > 0){
		alert('Bạn không có đủ điều kiện để thực hiện quay Item.');
	}
	else
	{
		$.get("Load_Content.php", { Page: "Event/EventDoiResetQuayItem", GetResult: 1 },
			   	function(data){
			   		if(data.length>0)
			   		{
						if(data.indexOf('|') > -1 && data.indexOf('OKMEN') > -1)
						{
							var info = data.split('|');
							var strReport = '';
								
							if(info[1] == 'PointUT'){strReport = 'Bạn đã nhận được ' + formatCurrency(info[2]) + ' điểm ủy thác.'}
							else if(info[1] == 'Item'){strReport = 'Bạn đã nhận được ' + info[2]}
							else{
								if(info[1] == 'MoneyC1') strReport = 'Bạn đã nhận được ' + formatCurrency(info[2]) + ' ' + NameMoney1;
								else strReport = 'Bạn đã nhận được ' + formatCurrency(info[2]) + ' ' + NameMoney2;
							}

							DoStartSpinItem(info[3], strReport, TotalItem);
							
						}else alert(data);
					}
					else{
						alert('Có lỗi xảy ra. Xin vui lòng đăng nhập lại hoặc thoát trình duyệt...')
					}
			   	});
	}
}

function DoStartSpinItem(resultID, strReport, totalitem)
{
	resultID = parseInt(resultID) + 1;
	var sumloopstop = totalitem * 3 + resultID;
    var sumloop = 0;
    var quaysoID = 1;

    $(document).ready(function() {
        loopLi();
    });

    function loopLi() {
		sumloop++;
		
		if(sumloop < sumloopstop*6/10) speed = sumloop*5;
		else if(sumloop >= sumloopstop*6/10) speed = sumloop*15;
        if (sumloop < sumloopstop) 
		{	
			$("#quayso" + quaysoID).switchClass("","tdhover", "slow").queue(function(next){
		         $(this).removeClass('tdhover');
		         $(this).removeClass('tdhoverbor');
		         next();
	    	});
    
            setTimeout(loopLi, speed)
        }
		else if(sumloop == sumloopstop)
		{
			$(function() {
				$("#quayso" + resultID).addClass('tdhoverbor');
				Show_Dialog(strReport);
			});
		}
		
		quaysoID++;
		if(quaysoID > totalitem) quaysoID = 1;
    }
}


function HisQuayItem()
{
		var DateFrom=document.getElementById('datepickerfrom').value;
		var DateTo=document.getElementById('datepickerto').value;
		$("#Load_Content").load("Load_Content.php?Page=Event/HistoryQuayItem&DateFrom="+DateFrom+"&DateTo="+DateTo+"&ActionHistory=1");
		return false;
}