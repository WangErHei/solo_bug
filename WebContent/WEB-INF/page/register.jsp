<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>

	<head lang="en">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>注册</title>
		<link type="image/x-icon" rel="icon" href="<%=path%>/img/favic.ico"/>
		<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
	   <script src="<%=path %>/layer/layer.js" charset="utf-8"></script>
	   	<link rel="stylesheet" href="<%=path %>/layer/skin/default/layer.css" type="text/css">
		<link rel="stylesheet" href="<%=path %>/css/bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/font-awesome-4.4.0/css/font-awesome.min.css" />
		<link rel="stylesheet" href="<%=path%>/css/public.css" type="text/css">
		<link rel="stylesheet" href="<%=path%>/css/main.css" type="text/css">

	</head>
<script >

function ckUsername(){
	var buser_email=$("#reg_email").val();
	 $.post("<%=path%>/lookup",{			
			"buser_email":buser_email,
				},function(map){
					$("#emailinfo").html(map.result);
		}); 
}
	
	
	
function ck(){
	var buser_name=$("#reg_username").val();
	 $.post("<%=path%>/look",{			
			"buser_name":buser_name,
				},function(map){
					$("#usernameinfo").html(map.result);
		}); 
}

</script> 

<script type="text/javascript">
function checkPassword() { //校验密码  
	//$('#passwordinfo').html = "";
	var password = $('#reg_password').val();

	if(password == "" || password == null) {
		$("#passwordinfo").html("密码不能为空");
		return false;
	}
	if(!(password.length >= 6 && password.length <= 20)) {
		$("#passwordinfo").html( "密码长度为6~20");
		return false;
	}
}


function register(){
	var buser_name1=$("#reg_username").val();
	var buser_email1=$("#reg_email").val();
	var password1 = $('#reg_password').val();
	 $.post("<%=path%>/registerSub",{			
			buser_name:buser_name1,
			buser_email:buser_email1,
			password:password1
				},function(map){
					if(map.msg!=null){
						layer.alert(map.msg, {
							  icon:2,
							  skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
							})
					}
					else{window.location.href="<%=path%>/common/projects";
					}
		}); 
}
	

</script> 

	<body>
		<div class="reg-top">
			<div class="title">
				<a href="index.html">
					<img src="img/logozxi.png" height="33">
				</a><br>
				欢迎注册 
			</div>
		</div>
		<div class="reg-form">
			<div class="form-inner">
			<form class="form-horizontal" id="userRegForm" name="userRegForm" method="post" autocomplete="off"   >
					<input type="password" style="visibility: hidden;" />
					<div class="form-group relative">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-envelope-o"></i></span>
							<input class="form-control input-lg reg_email typeahead-email"  id="reg_email"   placeholder="邮箱,最多输入50个字符" type="text"  name="buser_email" onblur="ckUsername();" />
							<span id="emailinfo" class="inputTips email_inputTips"></span>
						</div>
					</div>
					<div class="form-group relative">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user"></i></span>
							<input class="form-control input-lg reg_username" id="reg_username"   placeholder="用户名，最多输入50个字符" type="text" name="buser_name"  autocomplete="off" onblur="ck();" />
							<span id="usernameinfo" class="user_inputTips"></span>
						</div>
					</div>
			<div class="form-group relative">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-key"></i></span>
							<input class="form-control input-lg reg_password" placeholder="密码，输入6到20个字符" type="password" name="buser_pass" id="reg_password" value="" autocomplete="off"  onblur="checkPassword();"/>
							<span id="passwordinfo" class="inputPwdTips"></span>
						</div>
					</div>
					<div class="form-group">
						<button class="button button-rounded button-royal" type="button" id="loginBtn"  onclick="register();">注册</button>
					</div>
				</form>
				<div class="horizontal-line"></div>
				<div class="tb-auth">
					<a href="<%=path%>/tologin1" class="button button-glow button-border button-rounded " id="goToLogin">已有账号，去登录<i class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
		</div>
		
	</body>

</html>