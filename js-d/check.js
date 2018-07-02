/*begin*/
msg_focus_user = "<p style='color: red; font-size: 10px;'>Chỉ sử dụng chữ thường và số trong khoảng 4-10 ký tự</p>";
msg_focus_pass = "<p style='color: red; font-size: 10px;'>Chỉ sử dụng chữ và số trong khoảng 4-32 ký tự</p>";
msg_focus_mail = "<p style='color: red; font-size: 10px;'>Email hợp lệ dạng muonline@muthienbao.net</p>";
msg_focus_quest = "<p style='color: red; font-size: 10px;'>Chưa chọn câu hỏi</p>";
msg_focus_answer = "<p style='color: red; font-size: 10px;'>Chưa nhập câu trả lời</p>";
msg_focus_sno = "<p style='color: red; font-size: 10px;'>7 số bí mật dùng để thoát Guild</p>";
msg_focus_phone = "<p style='color: red; font-size: 10px;'>Số điện thoại dùng để xác minh tài khoản</p>";
msg_focus_vimage = "<p style='color: red; font-size: 10px;'>Nhập 6 ký tự xác nhận</p>";
error_style = "border: 1px solid #EBA4A4; background: #FACDCD;";
normal_style = "border: 1px solid #bbbbbb; background-color: #f5f5f5;";
/*end*/


msg_focus_so = "<font color='gray'>Chỉ được nhập số 0-9.</font>";
msg_focus_chuso_4_10 = "<font color='gray'>Phải từ 4-10 ký tự, có thể sử dụng chữ cái, chữ số, gạch dưới.</font>";
msg_focus_chuso = "<font color='gray'>Có thể sử dụng chữ cái, chữ số, gạch dưới.</font>";


msg_focus_tel = "<font color='gray'>Nhập đúng SĐT di động đang sử dụng để nhận được hỗ trợ về tài khoản, mật khẩu khi cần.</font>";
msg_focus_verify = "<font color='gray'>Nhập lại 6 kí tự trong hình trên.</font>";

msg_check_so_error = "<font color='red'>Chỉ được sử dụng số 0-9.</font>";
msg_check_chuso_error = "<font color='red'>Chỉ được sử dụng chữ cái, chữ số, dấu gạch dưới.</font>";
msg_check_chuso_4_10_error = "<font color='red'>Phải từ 4-10 ký tự. Chỉ được sử dụng chữ cái, chữ số, dấu gạch dưới.</font>";
msg_check_chuso_4_20_error = "<font color='red'>Phải từ 4-20 ký tự. Chỉ được sử dụng chữ cái, chữ số, dấu gạch dưới.</font>";

filter_so = /^[0-9]+$/;
filter_chuso = /^[a-zA-Z0-9_]+$/;
filter_chuso2 = /^[a-z0-9_]+$/;
filter_email = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
filter_tel = /^0[0-9]{9,10}$/;

function onSubmit_register() {
	var check = true;
	if(onBlur_check_user('user', 'msg_username')) {
		check = false;
	}
	if(onBlur_check_pass('passgame', 'msg_passgame')) {
		check = false;
	}
	if(onBlur_check_pass('passweb1', 'msg_pass1')) {
		check = false;
	}
	if(onBlur_check_pass('passweb2', 'msg_pass2')) {
		check = false;
	}
	if(onBlur_check_mail('email', 'msg_email')) {
		check = false;
	}
	if(onBlur_check_quest()) {
		check = false;		
	}
	if(onBlur_check_sno('sno_numb', 'msg_sno_numb')) {
		check = false;
	}
	if(onBlur_check_phone('phone', 'msg_tel')) {
		check = false;
	}
	if(onBlur_check_vimage()) {
		check = false;
	}
	console.log(check);
	return check;
}

function onBlur_check_user(id_input, id_msg) {
	var username = document.getElementById(id_input).value;
	if(!filter_chuso2.test(username) || username.length < 4 || username.length > 10) {
		document.getElementById(id_msg).innerHTML = msg_focus_user;
		document.getElementById(id_input).style = error_style;
		return 1;
	}
	else {
		document.getElementById(id_msg).innerHTML = "";
		document.getElementById(id_input).style = normal_style;
		return 0;
	}
}

function onBlur_check_pass(id_input, id_msg) {
	var pass = document.getElementById(id_input).value;
	if(!filter_chuso.test(pass) || pass.length < 4 || pass.length > 32) {
		document.getElementById(id_msg).innerHTML = msg_focus_pass;
		document.getElementById(id_input).style = error_style;
		return 1;
	}
	else {
		document.getElementById(id_msg).innerHTML = "";
		document.getElementById(id_input).style = normal_style;
		return 0;
	}
}

function onBlur_check_mail(id_input, id_msg) {
	var mail = document.getElementById(id_input).value;
	if(!filter_email.test(mail) || mail.length < 6 || mail.length > 45) {
		document.getElementById(id_msg).innerHTML = msg_focus_mail;
		document.getElementById(id_input).style = error_style;
		return 1;
	}
	else {
		document.getElementById(id_msg).innerHTML = "";
		document.getElementById(id_input).style = normal_style;
		return 0;
	}
}

function onBlur_check_quest() {
	var quest = document.getElementById("quest").value;
	var answer = document.getElementById("answer").value;
	console.log(quest);
	console.log(answer);
	if(quest == 0) {
		document.getElementById("msg_quest").innerHTML = msg_focus_quest;
		document.getElementById("quest").style = error_style;
		return 1;
	}
	else if(!answer.length) {
		document.getElementById("msg_quest").innerHTML = "";
		document.getElementById("quest").style = normal_style;
		document.getElementById("msg_ans").innerHTML = msg_focus_answer;
		document.getElementById("answer").style = error_style;
		return 1;		
	}
	else {
		document.getElementById("msg_ans").innerHTML = "";
		document.getElementById("answer").style = normal_style;
		return 0;
	}
}

function onBlur_check_sno(id_input, id_msg) {
	var sno = document.getElementById(id_input).value;
	if(!filter_so.test(sno) || sno.length !== 7) {
		document.getElementById(id_msg).innerHTML = msg_focus_sno;
		document.getElementById(id_input).style = error_style;
		return 1;
	}
	else {
		document.getElementById(id_msg).innerHTML = "";
		document.getElementById(id_input).style = normal_style;
		return 0;
	}
}

function onBlur_check_phone(id_input, id_msg) {
	var phone = document.getElementById(id_input).value;
	if(!filter_so.test(phone) || phone.length == 10 || phone.length == 11) {
		document.getElementById(id_msg).innerHTML = msg_focus_phone;
		document.getElementById(id_input).style = error_style;
		return 1;
	}
	else {
		document.getElementById(id_msg).innerHTML = "";
		document.getElementById(id_input).style = normal_style;
		return 0;
	}
}

function onBlur_check_vimage() {
	var vimage = document.getElementById("vImageCodP").value;
	if(vimage.length !== 6) {
		document.getElementById("security_code_error").innerHTML = msg_focus_vimage;
		document.getElementById("vImageCodP").style = error_style;
		return 1;
	}
	else {
		document.getElementById("security_code_error").innerHTML = "";
		document.getElementById("vImageCodP").style = normal_style;
		return 0;
	}
}

function focus_so(value,id_msg)
{
    var s = document.getElementById(id_msg);
	var error = 0;
	if(value.length == 0)
		{
			s.innerHTML = msg_focus_so;
			error = 1;
		}
	return error;
}

function focus_chuso_4_10(value,id_msg)
{
    var s = document.getElementById(id_msg);
	var error = 0;
	if(value.length == 0)
		{ 
			s.innerHTML = msg_focus_chuso_4_10;
			error = 1;
		}
	return error;
}

function focus_chuso(value,id_msg)
{
    var s = document.getElementById(id_msg);
	var error = 0;
	if(value.length == 0)
		{
			s.innerHTML = msg_focus_chuso;
			error = 1;
		}
	return error;
}

function focus_tel(value,id_msg)
{
    var s = document.getElementById(id_msg);
	var error = 0;
	if(value.length == 0)
		{
			s.innerHTML = msg_focus_tel;
			error = 1;
		}
	return error;
}

function focus_codeverify(value,id_msg)
{
    var s = document.getElementById(id_msg);
	var error = 0;
	if(value.length == 0)
		{
			s.innerHTML = msg_focus_verify;
			error = 1;
		}
	return error;
}




function onblur_check_repass(value1,value2,id_msg)
{
	var s = document.getElementById(id_msg);
	var error = 0;
	if(value1 != value2)
		{
			s.innerHTML = "<font color='red'>Xác minh mật khẩu không đúng.</font>";
			error = 1;
		}
	else s.innerHTML = '';
	return error;
}


function check_so(value,id_msg)
{
	var s = document.getElementById(id_msg);
	var error = 0;
	
	if(!filter_so.test(value))
		{ 
			s.innerHTML = msg_check_so_error; 
			error = 1;
		}
	else s.innerHTML = '';
	
	return error;
}

function check_chuso(value,id_msg)
{
	var s = document.getElementById(id_msg);
	var error = 0;
	
	if(!filter_chuso.test(value))
		{ 
			s.innerHTML = msg_check_chuso_error; 
			error = 1;
		}
	else s.innerHTML = '';
	
	return error;
}

function check_chuso_4_10(value,id_msg)
{
	var s = document.getElementById(id_msg);
	var error = 0;

	if(!filter_chuso.test(value) || (value.length<4 || value.length>10) )
		{ 
			s.innerHTML = msg_check_chuso_4_10_error; 
			error = 1;
		}
	else s.innerHTML = '';
	
	return error;
}

function check_chuso_4_20(value,id_msg)
{
	var s = document.getElementById(id_msg);
	var error = 0;
	
	if(!filter_chuso.test(value) || (value.length<4 || value.length>20) )
		{ 
			s.innerHTML = msg_check_chuso_4_20_error; 
			error = 1;
		}
	else s.innerHTML = '';
	return error;
}

function check_select(value,max_select_value,id_msg)
{
	var s = document.getElementById(id_msg);
	var error = 0;

	if(value < 1 || value > max_select_value)
		{
			s.innerHTML = "<font color='red'>Chưa chọn.</font>";
			error = 1;
		}
	else s.innerHTML = '';
	return error;
}

function check_email(value,id_msg)
{
	var s = document.getElementById(id_msg);
	var error = 0;
	
	if(!filter_email.test(value))
		{
			s.innerHTML = "<font color='red'>Không đúng dạng Email</font>";
			error = 1;
		}
	else s.innerHTML = '';
	return error;
}

function check_tel(value,id_msg)
{
	var s = document.getElementById(id_msg);
	var error = 0;
	
	if(!filter_tel.test(value))
		{
			s.innerHTML = "<font color='red'>Phải điền đúng số điện thoại di động.</font>";
			error = 1;
		}
	else s.innerHTML = '';
	return error;
}

function check_codeverify(value,id_msg)
{
	var s = document.getElementById(id_msg);
	var error = 0;
	
	if(!filter_chuso.test(value) || value.length != 6 )
		{ 
			s.innerHTML = "<font color='red'>Mã kiểm tra phải có 6 kí tự</font>"; 
			error = 1;
		}
	else s.innerHTML = '';
	return error;
}

function btn_check_verify(value,id_msg)
{
	if (check_codeverify(value,id_msg) == 1) {
		alert("Có lỗi. Vui lòng kiểm tra lại thông tin đăng kí !!!");
		return false;
	}
	else return true;
}

function btn_check_register()
{
	var s = document.register;
	var check_error = 0;

	
	if (check_chuso_4_10(s.username.value,'msg_username') == 1)
		{
			check_error++;
			if(check_error == 1) s.username.focus();
		}
		
	
	if (check_chuso_4_10(s.passgame.value,'msg_passgame') == 1)
		{
			check_error++;
			if(check_error == 1) s.passgame.focus();
		}
		
	
	if (check_chuso_4_20(s.pass1.value,'msg_pass1') == 1)
		{
			check_error++;
			if(check_error == 1) s.pass1.focus();
		}
		
	
	if (check_chuso_4_20(s.pass2.value,'msg_pass2') == 1)
		{
			check_error++;
			if(check_error == 1) s.pass2.focus();
		}
	
	
	if (check_email(s.email.value,'msg_email') == 1)
		{
			check_error++;
			if(check_error == 1) s.email.focus();
		}
	
	
	if (check_select(s.quest.value,8,'msg_quest') == 1)
		{
			check_error++;
			if(check_error == 1) s.quest.focus();
		}
				
	
	if (check_chuso_4_10(s.ans.value,'msg_ans') == 1)
		{
			check_error++;
			if(check_error == 1) s.ans.focus();
		}
	
    
	if (check_so(s.sno_numb.value,'msg_sno_numb') == 1)
		{
			check_error++;
			if(check_error == 1) s.sno_numb.focus();
		}
        
	
	if (check_tel(s.tel.value,'msg_tel') == 1)
		{
			check_error++;
			if(check_error == 1) s.tel.focus();
		}

	
	if(check_error > 0) {
		alert("Có lỗi. Vui lòng kiểm tra lại thông tin đăng kí !!!");
		return false;
	}
	else return true;
}

function btn_check_changepass1()
{
	var s = document.changepass1;
	var check_error = 0;
	
	if (check_chuso_4_20(s.pass1new.value,'msg_pass1new') == 1)
		{
			check_error++;
			if(check_error == 1) s.pass1new.focus();
		}
	if (onblur_check_repass(s.pass1new.value,s.pass1new_verify.value,'msg_pass1new_verify') == 1)
		{
			check_error++;
			if(check_error == 1) s.pass1new_verify.focus();
		}

	if(check_error > 0) {
		alert("Có lỗi. Vui lòng kiểm tra lại thông tin !!!");
		return false;
	}
	else return true;
}

function btn_check_changepass2()
{
	var s = document.changepass2;
	var check_error = 0;
	
	if (check_chuso_4_20(s.pass2new.value,'msg_pass2new') == 1)
		{
			check_error++;
			if(check_error == 1) s.pass2new.focus();
		}
	if (onblur_check_repass(s.pass2new.value,s.pass2new_verify.value,'msg_pass2new_verify') == 1)
		{
			check_error++;
			if(check_error == 1) s.pass2new_verify.focus();
		}

	if(check_error > 0) {
		alert("Có lỗi. Vui lòng kiểm tra lại thông tin !!!");
		return false;
	}
	else return true;
}

function btn_check_changepassgame()
{
	var s = document.changepassgame;
	var check_error = 0;
	
	if (check_chuso_4_20(s.passgamenew.value,'msg_passgamenew') == 1)
		{
			check_error++;
			if(check_error == 1) s.passgamenew.focus();
		}
	if (onblur_check_repass(s.passgamenew.value,s.passgamenew_verify.value,'msg_passgamenew_verify') == 1)
		{
			check_error++;
			if(check_error == 1) s.passgamenew_verify.focus();
		}

	if(check_error > 0) {
		alert("Có lỗi. Vui lòng kiểm tra lại thông tin !!!");
		return false;
	}
	else return true;
}

function btn_check_quest()
{
	var s = document.changequest;
	var check_error = 0;
	if (check_select(s.quest.value,'msg_quest') == 1)
		{
			check_error++;
			if(check_error == 1) s.quest.focus();
		}
		
	if(check_error > 0) {
		alert("Có lỗi. Vui lòng kiểm tra lại thông tin !!!");
		return false;
	}
	else return true;
}

function btn_check_ans()
{
	var s = document.changeans;
	var check_error = 0;
	
	if (check_chuso_4_10(s.ans.value,'msg_ans') == 1)
		{
			check_error++;
			if(check_error == 1) s.ans.focus();
		}
	if (onblur_check_repass(s.ans.value,s.ans_verify.value,'msg_ans_verify') == 1)
		{
			check_error++;
			if(check_error == 1) s.ans_verify.focus();
		}

	if(check_error > 0) {
		alert("Có lỗi. Vui lòng kiểm tra lại thông tin !!!");
		return false;
	}
	else return true;
}

function btn_check_email()
{
	var s = document.changeemail;
	var check_error = 0;
	
	if (check_email(s.email.value,'msg_email') == 1)
		{
			check_error++;
			if(check_error == 1) s.email.focus();
		}

	if(check_error > 0) {
		alert("Có lỗi. Vui lòng kiểm tra lại thông tin !!!");
		return false;
	}
	else return true;
}

function btn_check_sdtsms()
{
	var s = document.changesdt_sms;
	var check_error = 0;
	
	if (check_tel(s.tel.value,'msg_tel') == 1)
		{
			check_error++;
			if(check_error == 1) s.tel.focus();
		}

	if(check_error > 0) {
		alert("Có lỗi. Vui lòng kiểm tra lại thông tin !!!");
		return false;
	}
	else return true;
}

function btn_check_sdtinfo()
{
	var s = document.changesdt_info;
	var check_error = 0;
	
	if (check_tel(s.tel.value,'msg_tel') == 1)
		{
			check_error++;
			if(check_error == 1) s.tel.focus();
		}
	if (check_chuso_4_20(s.pass2.value,'msg_pass2') == 1)
		{
			check_error++;
			if(check_error == 1) s.pass2.focus();
		}
	if (check_email(s.email.value,'msg_email') == 1)
		{
			check_error++;
			if(check_error == 1) s.email.focus();
		}
	if (check_select(s.quest.value,'msg_quest') == 1)
		{
			check_error++;
			if(check_error == 1) s.quest.focus();
		}
	if (check_chuso_4_10(s.ans.value,'msg_ans') == 1)
		{
			check_error++;
			if(check_error == 1) s.ans.focus();
		}
	if (check_tel(s.tel_old.value,'msg_tel_old') == 1)
		{
			check_error++;
			if(check_error == 1) s.tel_old.focus();
		}

	if(check_error > 0) {
		alert("Có lỗi. Vui lòng kiểm tra lại thông tin !!!");
		return false;
	}
	else return true;
}

function btn_check_chonNV()
{
	var s = document.ChonNV;
	var check_error = 0;
	if (check_nv(s.nhanvat.value,'msg_nhanvat') == 1)
		{
			check_error++;
			if(check_error == 1) s.nhanvat.focus();
		}
		
	if(check_error > 0) {
		alert("Có lỗi. Vui lòng kiểm tra lại thông tin !!!");
		return false;
	}
	else return true;
}

function check_nv(value,id_msg)
{
	var s = document.getElementById(id_msg);
	var error = 0;

	if(value == 0)
		{
			s.innerHTML = "<font color='red'>Chưa chọn.</font>";
			error = 1;
		}
	else s.innerHTML = '';
	return error;
}

function btn_check_rutpoint()
{
	var s = document.rutpoint;
	var check_error = 0;
	if ( (check_so(s.point.value,'msg_point') == 1) )
		{
			check_error++;
			if(check_error == 1) s.point.focus();
		}

	if(check_error > 0) {
		alert("Có lỗi. Vui lòng kiểm tra lại thông tin !!!");
		return false;
	}
	else return true;
}

function btn_check_addpoint()
{
	var s = document.addpoint;
	var check_error = 0;
	if ( (check_so(s.str.value,'msg_str') == 1) )
		{
			check_error++;
			if(check_error == 1) s.str.focus();
		}
	if ( (check_so(s.dex.value,'msg_dex') == 1) )
		{
			check_error++;
			if(check_error == 1) s.dex.focus();
		}
	if ( (check_so(s.vit.value,'msg_vit') == 1) )
		{
			check_error++;
			if(check_error == 1) s.vit.focus();
		}
	if ( (check_so(s.ene.value,'msg_ene') == 1) )
		{
			check_error++;
			if(check_error == 1) s.ene.focus();
		}

	if(check_error > 0) {
		alert("Có lỗi. Vui lòng kiểm tra lại thông tin !!!");
		return false;
	}
	else return true;
}

function btn_check_thevtc()
{
	var s = document.vpoint_vtc;
	var check_error = 0;
	if ( (check_so(s.card_num.value,'msg_card_num') == 1) )
		{
			check_error++;
			if(check_error == 1) s.card_num.focus();
		}
	else if (s.card_num.value.length != 12)
		{
			check_error++;
			document.getElementById('msg_card_num').innerHTML = "<font color='red'>Mã thẻ phải có 12 chữ số.</font>";
			if(check_error == 1) s.card_num.focus();
		}
	if (s.card_serial.value.length != 12)
		{
			check_error++;
			document.getElementById('msg_card_serial').innerHTML = "<font color='red'>Serial phải có 12 kí tự.</font>";
			if(check_error == 1) s.card_serial.focus();
		}

	if(check_error > 0) {
		alert("Có lỗi. Vui lòng kiểm tra lại thông tin !!!");
		return false;
	}
	else return true;
}

function btn_check_thegate()
{
	var s = document.vpoint_gate;
	var check_error = 0;
	if ( (check_so(s.card_num.value,'msg_card_num') == 1) )
		{
			check_error++;
			if(check_error == 1) s.card_num.focus();
		}
	else if (s.card_num.value.length != 10)
		{
			check_error++;
			document.getElementById('msg_card_num').innerHTML = "<font color='red'>Mã thẻ phải có 10 chữ số.</font>";
			if(check_error == 1) s.card_num.focus();
		}
	if (s.card_serial.value.length != 10)
		{
			check_error++;
			document.getElementById('msg_card_serial').innerHTML = "<font color='red'>Serial phải có 10 kí tự.</font>";
			if(check_error == 1) s.card_serial.focus();
		}

	if(check_error > 0) {
		alert("Có lỗi. Vui lòng kiểm tra lại thông tin !!!");
		return false;
	}
	else return true;
}
