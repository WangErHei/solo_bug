<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>

	<head lang="en">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>登录</title>
		<link type="image/x-icon" rel="icon" href="<%=path%>/img/favic.ico"/>
		<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
	   <script src="<%=path %>/layer/layer.js" charset="utf-8"></script>
	   	<link rel="stylesheet" href="<%=path %>/layer/skin/default/layer.css" type="text/css">
		<link rel="stylesheet" href="<%=path %>/css/bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css">
		<link rel="stylesheet" href="<%=path %>/css/font-awesome-4.4.0/css/font-awesome.min.css" type="text/css">
		<link rel="stylesheet" href="<%=path %>/css/public.css" type="text/css">
		<link rel="stylesheet" href="<%=path %>/css/main.css" type="text/css">
	   <script src="<%=path %>/js/login.js" type="text/javascript" charset="utf-8"></script>
	   <script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
		<script language="javascript">
		
		var  msg='<%=request.getAttribute("msg") %>';
		if(msg!="null"){
			layer.alert(msg, {
				  icon: 5,
				  skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
				})			
		}
		
		var time='<%=session.getAttribute("outTime")%>';
		if(time!="null"){
			layer.alert(time, {
				  icon: 0,
				  skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
				})			
			
		}
		
		
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
		</script>		
	</head>

	<body>
		<div class="login-top">
			<div class="title">
				<img src="<%=path %>/img/logozxi.png"  height="33"><br> 欢迎登录
			</div>
		</div>
		<div class="login-form">
			<div class="form-inner" id="loginInfo">
				<form class="form-horizontal" id="userLoginForm" name="userLoginForm" method="post" action="<%=path %>/login" autocomplete="off">
					<div class="form-group relative">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-envelope-o"></i></span>
							<input class="form-control input-lg" placeholder="邮箱" type="text" name="buser_email"id="lg_email" onblur="checkEmail();">
							<span  id="emailinfo" class="inputTips email_inputTips"></span>
						</div>
					</div>
					<div class="form-group relative">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-key"></i></span>
							<input class="form-control input-lg" placeholder="密码" type="password" name="buser_pass"id="lg_password"onblur="checkPassword();">
							<span id="passwordinfo" class="inputTips pwd_inputTips"></span>
						</div>
					</div>
					<div class="form-group"></div>
					<div class="form-group">
						<button class="button button-rounded button-royal" type="submit" id="loginBtn">登录</button>
					</div>
				</form>
				<div class="horizontal-line"></div>
				<div class="tb-auth">
					<a href="<%=path%>/register"  class="button button-glow button-border button-rounded " id="goToReg">还没有账号，去注册<i class="fa fa-arrow-circle-right"></i></a>
					<!--<a href="findPassword.html" class="button button-glow button-border button-rounded anim-grey">忘记密码，去找回<i class="glyphicon glyphicon-music"></i></a>-->
				</div>
			</div>
		</div>
	
	</body>

</html>