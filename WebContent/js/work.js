function $(id) {
	return document.getElementById(id);
}

function check() {
	var email = $("new_email").value;
	var password = $("password").value;
	var name = $("username").value;
	var oldpwd = $("old_password").value;
	var newpwd = $("new_password").value;
	var newagain = $("newAgain").value;
	var addemail = $("add_email").value;
	var add_email = $("addemail").value;
}

function checkEmail() { //校验Email  
	$('emailinfo').innerHTML = "";
	var email = $('new_email').value;
	if(email == "") {
		$('emailinfo').innerHTML = "邮箱不能为空";
		return false;
	}

	var reg = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
	if(!reg.test(email)) {
		$('emailinfo').innerHTML = "邮箱格式不正确";
		return false;
	}

	if(email.length > 50) {
		$("emailinfo").innerHTML = '最多输入50个字符';
		return false;
	}

}

function checkPassword() { //校验密码  
	$('passwordinfo').innerHTML = "";
	var password = $('password').value;
	if(password == "" || password == null) {
		$("passwordinfo").innerHTML = "密码不能为空";
		return false;
	}

	if(!(password.length >= 6 && password.length <= 20)) {
		$("passwordinfo").innerHTML = "密码长度为6~20";
		return false;
	}
}

function checkName() { //校验姓名  
	$('nameinfo').innerHTML = "";
	var name = $('username').value;
	if(name == "") {
		$("nameinfo").innerHTML = "姓名不能为空";
		return false;
	}

	if(name.length > 50) {
		$("nameinfo").innerHTML = '最多输入50个字符';
		return false;
	}

}

function checkOldPassword() { //校验旧密码  
	$('oldpasswordinfo').innerHTML = "";
	var oldpwd = $("old_password").value;
	if(oldpwd == "" || oldpwd == null) {
		$("oldpasswordinfo").innerHTML = "密码不能为空";
		return false;
	}

	if(!(oldpwd.length >= 6 && oldpwd.length <= 20)) {
		$("oldpasswordinfo").innerHTML = "密码长度为6~20";
		return false;
	}
}

function checkNewPassword() { //校验新密码  
	$('newpasswordinfo').innerHTML = "";
	var newpwd = $("new_password").value;
	if(newpwd == "" || newpwd == null) {
		$("newpasswordinfo").innerHTML = "密码不能为空";
		return false;
	}

	if(!(newpwd.length >= 6 && newpwd.length <= 20)) {
		$("newpasswordinfo").innerHTML = "密码长度为6~20";
		return false;
	}
}

function checkConfirmPassword() { //校验确认密码  
	$('newAgaininfo').innerHTML = "";
	var newagain = $("newAgain").value;
	if(newagain == "" || newagain == null) {
		$("newAgaininfo").innerHTML = "密码不能为空";
		return false;
	}

	if(!(newagain.length >= 6 && newagain.length <= 20)) {
		$("newAgaininfo").innerHTML = "密码长度为6~20";
		return false;
	}
	if(document.getElementById("newAgain").value != document.getElementById("new_password").value) {
		$("newAgaininfo").innerHTML = "两次密码不一致，请重新输入";
		return false;
	}
}

function checkaddEmail(){ //校验添加成员邮箱1
	$('addemailinfo').innerHTML = "";
	var addemail = $("add_email").value;
	if(addemail == "") {
		$('addemailinfo').innerHTML = "邮箱不能为空";
		return false;
	}

	var reg = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
	if(!reg.test(addemail)) {
		$('addemailinfo').innerHTML = "邮箱格式不正确";
		return false;
	}
}

function checkadd_Email(){ //校验添加成员邮箱2
	$('add_emailinfo').innerHTML = "";
	var add_email = $("addemail").value;
	if(add_email == "") {
		$('add_emailinfo').innerHTML = "邮箱不能为空";
		return false;
	}

	var reg = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
	if(!reg.test(add_email)) {
		$('add_emailinfo').innerHTML = "邮箱格式不正确";
		return false;
	}
}
