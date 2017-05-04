<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head lang="en">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>首页</title>
		<link type="image/x-icon" rel="icon" href="<%=path%>/img/favic.ico"/>
		<link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="css/font-awesome-4.4.0/css/font-awesome.min.css" />
		<link rel="stylesheet" href="css/public.css" type="text/css">
		<link rel="stylesheet" href="css/main.css" type="text/css">
	</head>

	<body>
		<div id="wrapper">
			<!-- top start -->
			<div class="site-top" style="background-color: rgba(0, 0, 0, 0.298039);">
				<div class="bugclose-width">
					<div class="logo">
						<a href="<%=path %>/tologin1"><img src="img/logo.png"></a>
					</div>
				</div>
			</div>
			<!-- top end -->
			<!-- banner 开始 -->
			<div class="site-banner">
				<div class="bugclose-width">
					<div class="solgon">
						<a href="<%=path %>/tologin1" class="regNow"><b>登录</b></a>
						<a href="<%=path %>/register" class="Regnow"><b>注册</b></a>
					</div>
				</div>
			</div>
			<!-- banner 结束 -->
			<!-- container start -->
			<div class="container-fluid">
				<div class="cell bugclose-width">
					<p class="title">省事，简单，日志，并行</p>
					<div class="row">
						<div class="col-sm-3 col-xs-6">
							<i class="b1"style="background: url('img/shengshi@2x.png') top no-repeat;"></i>
							<dl>
								<dt><b>省事易用</b></dt>
								<dd>在线使用 云端部署</dd>
								<dd>无需专业的技术人进行布署</dd>
								<dd>省去硬件及人力的费用</dd>
							</dl>
						</div>
						<div class="col-sm-3 col-xs-6">
							<i class="b2"style="background: url('img/jiandan@2x.png') top no-repeat;"></i>
							<dl>
								<dt><b>简单快速</b></dt>
								<dd>简单注册，即时使用</dd>
								<dd>只需填写Email、昵称、密码即可完成注册</dd>
								<dd>添加成员只需其Email即可，默认密码:<b>123456</b></dd>
							</dl>
						</div>
						<div class="col-sm-3 col-xs-6">
							<i class="b3"style="background: url('img/anquan@2x.png') top no-repeat;"></i>
							<dl> 
								<dt><b>日志记录，权限分明</b></dt>
								<dd>用户对每个提交的bug拥有不同的操作权限</dd>
								<dd>每个bug的操作记录，也有相对应的用户信息记录</dd>
								
							</dl>
						</div>
						<div class="col-sm-3 col-xs-6">
							<i class="b4"style="background: url('img/kuaisu@2x.png') top no-repeat;"></i>
							<dl>
								<dt><b>快速切换</b></dt>
								<dd>支持多个项目同时进行</dd>
								<dd>通过项目通道对多个项目进行快速切换</dd>
								<dd>实现真正意义上的多项目并行</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
			<!-- container end -->
			<!-- footer start -->
			<footer class="site-footer" id="site-footer">
				<div class="copyright">
					<div class="footer-copy">
						<p class="text">Copyright &copy;2017</p>
					</div>
				</div>
			</footer>
		</div>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		
	</body>

</html>