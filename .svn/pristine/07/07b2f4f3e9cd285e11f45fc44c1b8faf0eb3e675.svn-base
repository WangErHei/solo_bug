function $(id) {
	return document.getElementById(id);
}

function check() {
	var email = $("lg_email").value;
	var password = $("lg_password").value;
}

function checkEmail() { //校验Email  
	$('emailinfo').innerHTML = "";
	var email = $('lg_email').value;
	if(email == "") {
		$('emailinfo').innerHTML = "邮箱不能为空";
		return false;
	}

	var reg = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
	if(!reg.test(email)) {
		$('emailinfo').innerHTML = "邮箱格式不正确";
		return false;
	}

}

function checkPassword() { //校验密码  
	$('passwordinfo').innerHTML = "";
	var password = $('lg_password').value;
	if(password == "" || password == null) {
		$("passwordinfo").innerHTML = "密码不能为空";
		return false;
	}

	if(!(password.length >= 6 && password.length <= 20)) {
		$("passwordinfo").innerHTML = "密码长度为6~20";
		return false;
	}
}