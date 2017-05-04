<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html class=" dk_fouc">

	<head lang="en">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>我的项目</title>
		<link type="image/x-icon" rel="icon" href="<%=path%>/img/favic.ico"/>
		<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
	   <script src="<%=path %>/layer/layer.js" charset="utf-8"></script>
	   	<link rel="stylesheet" href="<%=path %>/layer/skin/default/layer.css" type="text/css">
		<link rel="stylesheet" href="<%=path %>/css/bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/font-awesome-4.4.0/css/font-awesome.min.css" />
		<link rel="stylesheet" href="<%=path %>/css/public.css" type="text/css">
		<link rel="stylesheet" href="<%=path %>/css/bugClose.css" type="text/css">
		<link rel="stylesheet" href="<%=path %>/css/project.css" type="text/css">
		 <link rel="stylesheet" href="<%=path %>/css/amazeui.min.css">
        <link rel="stylesheet" href="<%=path %>/css/amazeui.cropper.css">
        <link rel="stylesheet" href="<%=path %>/css/custom_up_img.css">
		  <script src="<%=path %>/js/amazeui.min.js" charset="utf-8"></script>
        <script src="<%=path %>/js/cropper.min.js" charset="utf-8"></script>
        <script src="<%=path %>/js/custom_up_img.js" charset="utf-8"></script>
		 <script src="<%=path %>/js/ajaxfileupload.js" type="text/javascript"></script>
	</head>
<script type="text/javascript">
          var a;
		  var m;
		function updateName(){
			var _from = document.getElementById("settingUserNameForm");
			_from.submit();
		}		
		
		
		
		function check() {
			var program_name = $("#program_name").val();
			var program_describe = $("#program_describe").val();
			   $.post("<%=path%>/createProgram",{
				   "program_name":program_name,
				   "program_describe":program_describe,
				   "bid":"${id}",
				   "name":  "${flag.buser_email}"
			    },function(map){
			    	if(map.msg2!=null){
			    		layer.alert(map.msg2, {
							  icon:2,
							  skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
							})
			    	}else{
			    	a=map.pid;
			    	var b = $("#pro_name").val();
			    	b=program_name;
			    	//alert(b);
			    	//项目名称
			    	}
			    });	        
	  }
	   
		
		function add() {
			var buser_email = $("#buser_email").val();
		    $.post("<%=path%>/addMember",{
		    	"buser_email":buser_email,
		    	"pid":a
		    },function(list){
		     	var option="";	    
		    	var jsonlist = eval(list);
				for(var i  in jsonlist){		
					if(jsonlist[i].msg!=null){
						layer.alert(jsonlist[i].msg, {
							  icon:2,
							  skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
							})
					}
					else{
					option = option+ "<li class='user' style='width:100%' >" +jsonlist[i].buser_email +"</li>";			    
				}
				$(".list-group").html(option);
				}		
  });
		}


		function produce() {
 var produce_name = $("#produce_name").val();		
 $.post("<%=path%>/addProduce",{
	"produce_name":produce_name,	
     "pid":a					
		},function(list){
			var option="<option>[未指定]</option>";
			var jsonlist = eval(list);
			for(var i  in jsonlist){
				if(jsonlist[i].pmsg!=null){
					layer.alert(jsonlist[i].pmsg, {
						  icon:2,
						  skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
						})
				}else{
				option = option +"<li class='produce' style='width:100%'>"+jsonlist[i].produce_name+"</li>";			   
			}
			$(".list-group1").html(option);
			}
			}); 
		}

	
		

		function produce1() {
 var produce_name = $("#produce").val();		
 $.post("<%=path%>/addProduce",{
	"produce_name":produce_name,	
     "pid":m				
		},function(list){
			var option="";
			var jsonlist = eval(list);
			for(var i  in jsonlist){
					if(jsonlist[i].pmsg!=null){
						layer.alert(jsonlist[i].pmsg, {
							  icon:2,
							  skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
							})
					}else{
				 b =jsonlist[i].produce_name;
				option = option +"<li class='produce1' style='width:100%'>"+jsonlist[i].produce_name+"<i class='fa fa-trash-o p10058'  alt='删除'    onclick=\"deleteP('"+b+"')\">"+"</i>"+"</li>";
			}
			$(".list-group2").html(option);
			}
			}); 
		}
	
		
		
		function showproduce() {
 $.post("<%=path%>/select",{
     "pid":m	,
		},function(list){
			var option="";
			var jsonlist = eval(list);
			for(var i  in jsonlist){
				 b =jsonlist[i].produce_name;
				option = option +"<li class='produce1' style='width:100%'>"+jsonlist[i].produce_name+"<i class='fa fa-trash-o p10058'  alt='删除'   onclick=\"deleteP('"+b+"')\">"+"</i>"+"</li>";
			}
			$(".list-group2").html(option);
			}); 
		}
		
		function  deleteP(a){
			$.post("<%=path%>/deletep",{
			 "pid":m	,
			 "name":a
		},function(list){
			var option="";
			var jsonlist = eval(list);			
			for(var i  in jsonlist){	
				if(jsonlist[i].produce_name!=null) 
				{b =jsonlist[i].produce_name;
				/*转义 
				*/
				layer.msg("模块已删除!")
					
				option = option +"<li class='produce1' style='width:100%'>"+jsonlist[i].produce_name+"<i class='fa fa-trash-o p10058'  alt='删除'  onclick=\"deleteP('"+b+"')\">"+"</i>"+"</li>";		
				$(".list-group2").html(option);}
				else{
					layer.alert(jsonlist[i].msg, {
						  icon:4,
						  skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
						})
				}
		}
			}); 
		}

		function meber(b) { 	
              m=b;
          	showproduce() ;
			 $.post("<%=path%>/toMember",{
				"pid":b
					},function(listmember){				
						var jsonlist = eval(listmember);
						var option="";
						for(var i  in jsonlist){		
							mm=jsonlist[i].buser_email;
							option = option+ "<li class='user1' style='width:100%' >" +jsonlist[i].buser_email +"</li>"; 
						}
						$(".list-group3").html(option);
						}); 
		}

	
		
		
		function  add1() {
			var buser_email = $("#name").val();
			 $.post("<%=path%>/addMember",{
					"buser_email":buser_email,
			    	"pid":m
		},function(list){
			var option="";
			var jsonlist = eval(list);
			for(var i  in jsonlist){
				if(jsonlist[i].msg!=null){
					layer.alert(jsonlist[i].msg, {
						  icon:2,
						  skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
						})
				}else{
				mm=jsonlist[i].buser_email;
				option = option+ "<li class='user1' style='width:100%' >" +jsonlist[i].buser_email +"</li>"; 
			}
			$(".list-group3").html(option);
			}
			}); 
		}	
	    
		
		
		function  deleteM(a){
		//	alert(a);
			$.post("<%=path%>/deletem",{
			 "pid":m	,
			 "name":a
		},function(listmember){
			var option="";
			var jsonlist = eval(listmember);
			for(var i  in jsonlist){
				mm=jsonlist[i].buser_email;
				option = option +"<li class='user1' style='width:100%' >"+jsonlist[i].buser_email +"</li>"; 
			}
			$(".list-group3").html(option);
			}); 
		}
		
		
		function checkOldPassword() { //校验旧密码 
			$('oldpasswordinfo').style.display = "block";
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
			$('newpasswordinfo').style.display = "block";
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
			$('newAgaininfo').style.display = "block";
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
		
// 		function checkEmail() { //校验Email  
// 			var email =$("#buser_email").val();
<%-- 			 $.post("<%=path%>/lookup",{			 --%>
// 					"buser_email":email,
// 						},function(map){
// 							$("#addemailinfo").html(map.result);
// 				}); 
// 		}
			
	
// 		function checkEmail2() { //校验Email  
// 			var email1=$("#name").val();
<%-- 			 $.post("<%=path%>/lookup",{			 --%>
// 					"buser_email":email1,
// 						},function(map){
// 							$("#add_emailinfo").html(map.result);
// 				}); 
// 		}
	</script>
			<script language="javascript">
		var  msg='<%=request.getAttribute("msg") %>';
		if(msg!="null"){
			layer.msg(msg, function(){
				//关闭后的操作
				});
		}	
		
		var emsg='<%=request.getAttribute("emsg") %>';
		if(emsg!="null"){
			layer.msg(emsg, function(){
				//关闭后的操作
				});
		}	
		
		var bmsg='<%=request.getAttribute("bmsg") %>';
		if(bmsg!="null"){
			layer.msg(bmsg, function(){
				//关闭后的操作
				});
		}	
		
		</script>
<script>
	$(document).ready(function(){
				$("#addProjectFormBtn").click(function(){
					$("#xiangmuxinxi").removeClass("active");
					$("#chengyuanguanli").addClass("active");
					$("#projectInfo").removeClass("active");
					$("#projectUser").addClass("active");
				})
			})
			
</script>

		
<script>
	$(document).ready(function(){
				$("#addProjectFormBtn").click(function(){
					$("#xiangmuxinxi").removeClass("active");
					$("#chengyuanguanli").addClass("active");
					$("#projectInfo").removeClass("active");
					$("#projectUser").addClass("active");
				})
			})
			
</script>



	<body class="app done modal-open-v">
		<!-- header start -->
		<header class="site-header">
			<div class="wrapper-header-left-bg"></div>
			<div class="wrapper-header">
				<span class="name">
		        	<img src="<%=path%>/img/logozxi.png" height="33px">
		        </span>
				<div class="wrapper-header-right">
					<div style="display: inline-block;">
						<span class="menus"><a href="<%=path%>/toprogram?id=${id}">我的项目</a></span>
						 
						<span class="menus">
						   <form action="<%=path%>/tologin" method="post">
		                                  <button type="submit"   onclick="javascript:produce();"class="btn btn-info noborder" for="addProjectForm" id="ProjectFormBtn">退出</button>
		                         </form>      
						</span>						
					</div>			
					<div class="right">		
						<div class="setting">						
							<span class="username" tabindex="2">
                        <div class="username-warp">
                            <i class="fa fa-user"></i>
                                
		                            <c:forEach  items="${list}" var="a">
		                            <span class="username-txt textOverHiden" alt="呜呜" >${a.BUSER_NAME}</span>
		                            </c:forEach>
		                            <i class="fa fa-caret-down"></i>
		                        </div>
		                        <div class="user-setting">
		                            <div class="userSetFace">
		                                <span class="face">
		                                   <div class="up-img-cover"  id="up-img-touch" data-toggle="modal" data-target="#myProfileHeadImageModal" >
										    		<img class="am-circle"   id="headpic"  alt="点击图片上传" src="${head}" data-am-popover="{content: '点击上传', trigger: 'hover focus'}" >
										    	</div>
		                                </span>
		                                <span class="email textOverHiden" >${flag.buser_email}</span>
		                                <div class="userProProjectProfessional" style="display: none;"></div>
		                            </div>
		                            <div style="float: left;">
		                                <ul class="userSetUl">
		                                    <li data-toggle="modal" data-target="#myProfileEmailModal"><i class="fa fa-envelope-o"></i>修改邮箱</li>
		                                    <li data-toggle="modal" data-target="#myProfileUserNameModal"><i class="fa fa-user"></i>修改用户名</li>
		                                    <li data-toggle="modal" data-target="#myProfilePwdModal"><i class="fa fa-key"></i>修改密码</li>
		                                </ul>
		    
		                            </div>
		                       
		                        </div>
		                             
		                    </span>
		                </div>
		            </div>
		        </div>
		    </div>
		</header>
		
		<!-- 创建个人设置model -->
		<div id="profile"><!-- 修改用户名model -->
			<div class="modal fade myProfileUserNameModal myBugcloseModel" id="myProfileUserNameModal" tabindex="-1" role="dialog" aria-labelledby="myUserNameSetting" >
			    <div class="modal-dialog" role="document" style="z-index: 1040">
			        <div class="modal-content">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
			                <h4 class="modal-title" id="myUserNameSetting">修改用户名</h4>
			            </div>
			            <div class="modal-body">
			                <div class="row">
			                    <form  action="<%=path %>/updateName?id=${id}" class="form-horizontal pd210 pd410" id="settingUserNameForm" name="settingUserNameForm" method="post">
			                        <div class="form-group">
			                            <label class="col-sm-3 control-label">用户名</label>
			                            <div class="col-sm-9">
			                                <input type="text" class="form-control"  name="name" id="username" placeholder="最多输入50个字符">
			                            </div>
			                        </div>
			                        <div class="modal-footer noborder">
			                            <button type="submit" onclick="javascript:updateName();" class="btn btn-info noborder" for="settingUserNameForm">保存</button>
			                        </div>
			                    </form>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
			<!-- 修改密码 -->
			<div class="modal fade myProfilePwdModal myBugcloseModel" id="myProfilePwdModal" tabindex="-1" role="dialog" aria-labelledby="myPwdSetting">
			    <div class="modal-dialog" role="document" style="z-index: 1040">
			        <div class="modal-content">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
			                <h4 class="modal-title" id="myPwdSetting">修改密码</h4>
			            </div>
			            <div class="modal-body">
			                <form action="<%=path %>/updatePass?id=${id}" class="form-horizontal pd210 pd410" id="settingPwdForm" name="settingPwdForm" method="post">
			                    <div class="form-group">
			                        <label class="col-sm-3 control-label">旧密码</label>
			                        <div class="col-sm-9">
			                            <input type="password" class="form-control" name="old" id="old_password"placeholder="输入当前密码" onblur="checkOldPassword();"autofocus="">
			                        </div>
			                    </div>
			                    <div class="form-group">
			                        <label class="col-sm-3 control-label">新密码</label>
			                        <div class="col-sm-9">
			                            <input type="password" class="form-control"name="new" id="new_password" placeholder="输入6到20个字符" onblur="checkNewPassword();" autofocus="">
			                        </div>
			                    </div>
			                    <div class="form-group">
			                        <label class="col-sm-3 control-label">确认密码</label>
			                        <div class="col-sm-9">
			                            <input type="password" class="form-control"  name="newAgain" id="newAgain" placeholder="输入6到20个字符"onblur="checkConfirmPassword();" autofocus="">
			                        </div>
			                    </div>
			                    <div class="modal-footer noborder">
			                        <button type="submit" onclick="" class="btn btn-info noborder" for="settingPwdForm">保存</button>
			                    </div>
			                </form>
			            </div>
			        </div>
			    </div>
			</div>
			<!-- 修改邮箱 -->
			<div class="modal fade myProfilePwdModal myBugcloseModel" id="myProfileEmailModal" tabindex="-1" role="dialog" aria-labelledby="myEmailEdit">
			    <div class="modal-dialog" role="document" style="z-index: 1040">
			        <div class="modal-content">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
			                <h4 class="modal-title" id="myEmailEdit">修改邮箱</h4>
			            </div>
			            <div class="modal-body">
			                <form action="<%=path %>/updateMail?id=${id}" class="form-horizontal pd210 pd410" id="settingEmailForm" name="settingEmailForm" method="post">
			                    <input type="password" class="form-control" style="display: none">
			                    <div class="form-group">
			                        <label class="col-sm-3 control-label">新邮箱</label>
			                        <div class="col-sm-9">
			                            <input type="text"  name="new_email" id="new_email" class="form-control" placeholder="输入新邮箱，最多50个字符"  autofocus="">
			                        </div>
			                    </div>
			                    <div class="form-group">
			                        <label class="col-sm-3 control-label">密码</label>
			                        <div class="col-sm-9">
			                            <input type="password" id="password" name="password" class="form-control" placeholder="请输入当前密码进行验证"autofocus="">
			                        </div>
			                    </div>
			                    <div class="modal-footer noborder">
			                        <button type="submit" onclick="" class="btn btn-info noborder">保存</button>
			                    </div>
			                </form>
			            </div>
			        </div>
			    </div>
			</div>
			<!-- 修改头像 -->
			<div class="am-modal am-modal-no-btn up-modal-frame am-modal-active" id="myProfileHeadImageModal" tabindex="-1" role="dialog" aria-labelledby="myHeadImageSetting">
		  <div class="am-modal-dialog up-frame-parent up-frame-radius">
		     <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
			                <h4 class="modal-title" id="myHeadImageSetting">更换头像</h4>
			            </div>
		    <div class="am-modal-bd  up-frame-body">
		      <div class="am-g am-fl">
		      	
		      	<div class="am-form-group am-form-file">
			      <div class="am-fl">
			        <button type="button" class="am-btn am-btn-default am-btn-sm">
			          <i class="am-icon-cloud-upload"></i> 选择要上传的文件</button>
			      </div>
	
			      <input type="file" class="up-img-file" >
			 
			   	</div>
		      </div>
		      <div class="am-g am-fl">
		      	<div class="up-pre-before up-frame-radius">
		      		<img alt="" src="" class="up-img-show" id="up-img-show">
		      	</div>
		      	<div class="up-pre-after up-frame-radius">
		      	</div>
		      </div>
		      <div class="am-g am-fl">
   				<div class="up-control-btns">
    				<span class="am-icon-rotate-left" id="up-btn-left"></span>
    				<span class="am-icon-rotate-right" id="up-btn-right"></span>
    				<span class="am-icon-check up-btn-ok" url="headupload?bid=${id}"data-toggle="modal" data-target="#up-modal-alert"></span>
   				</div>
	    	  </div>
		      
		    </div>
		  </div>
		</div>
			
	
	
		</div> 
		
	    <div class="wrapper" id="wrapper">
	        <div class="project-list">
	            <div class="row">
	                <div class="changeBtnGroup">
	                    <div class="addProjectBtn">
	                        <span type="button" class="btn btn-default btn-primary" data-toggle="modal" data-target="#myProjectModal"><i class="fa fa-plus-circle"></i> 添加项目</span>
	                    </div>
	                </div>
				         	<!-- 获取的项目 -->
						<c:forEach items="${list1}" var="a">
						<div class="col-sm-6 col-md-3 default-col-add" style="margin-top:50px">
							<div class="thumbnail Join">	
							<br />
								<h4 class="textOverHiden  data-pencil">
							项目名称：${a.pname}
								</h4>
								<img src="<%=path%>/img/app-default.jpg">
								<div class="pd12">
									<ul class="bug" id="stateCount">
										<li data-state="All">
											<a href="<%=path%>/toMyProgram?pid=${a.pid}&pname=${a.pname}&bid=${id}&email=${flag.buser_email}"style="color: #fff;">
											<div class="addProjectBtn" >
													<span type="button" class="btn btn-default btn-primary"   >
							                        	项目详情
							                        </span>
												</div>
											</a>
										</li>
											
										<!--项目设置  -->
										<li data-state="All"style="margin-right:30px ;">
											<div class="addProjectBtn">
											<span type="button" class="btn btn-default btn-primary" data-toggle="modal" data-target="#myProjectDetails"   onclick="meber(${a.pid});">
						                        	项目设置
						                        </span>
											</div>
										</li>
								
									</ul>
								</div>
							</div>
						</div>
					
					</c:forEach>
					
					</div>
				</div>
			</div>
		<!-- 创建项目 -->
		<div class="modal fade myProjectModel" id="myProjectModal" tabindex="-1" role="dialog" aria-labelledby="myProjectBg">
			<div class="modal-dialog" role="document" style="z-index: 1040">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    	<span aria-hidden="true"><i class="fa fa-remove black"></i></span>
	                    </button>
						<h4 class="modal-title" id="myProjectBg">
	                        <div id="projectHeadImage" class="projectHeadImage">
	                            <div class="default">
	                                <img src="<%=path%>/img/app-default.jpg" width="100%">
	                            </div>
	                        </div>
	                    </h4>
					</div>
					<div class="modal-body">
						<ul class="nav nav-tabs noborder" role="tablist">
							<li role="presentation" class="active" id="xiangmuxinxi">
								<a href="projects.html#projectInfo" aria-controls="projectInfo" role="tab" data-toggle="tab">项目信息</a>
							</li>
							<li role="presentation" id="chengyuanguanli">
								<a href="projects.html#projectUser" aria-controls="projectUser" role="tab" data-toggle="tab" >成员管理</a>
							</li>
							<li role="presentation" id="chanpinguanli">
								<a href="projects.html#projectProduct" aria-controls="projectProduct" role="tab" data-toggle="tab" >模块管理</a>
							</li>
						</ul>
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="projectInfo">
								<div class="row">
									<form class="form-horizontal" id="addProjectForm" name="projectForm" >
										<div class="form-group">
											<label class="col-sm-3 control-label">项目名称</label>
											<div class="col-sm-9">
												<input type="text" class="form-control"  id="program_name"  name="program_name" placeholder="最多输入50个字符" autofocus="" onfocus="checkStrNum(this,50)" oninput="checkStrNum(this,50)" onpropertychange="checkStrNum(this,50)"   value=""   requried>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label">项目描述</label>
											<div class="col-sm-9">
												<textarea id="program_describe"  class="form-control" name="program_describe" rows="4" placeholder="最多输入500个字符" onfocus="checkStrNum(this,500)" oninput="checkStrNum(this,500)" onpropertychange="checkStrNum(this,500)"   value=""></textarea>
											</div>
										</div>
										<div class="modal-footer noborder">
									<button type="button"   onclick="javascript:check();"class="btn btn-info noborder" for="addProjectForm" id="addProjectFormBtn">下一步</button>
								</div>
									</form>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane projectUser" id="projectUser">
								<h5>添加成员</h5>
								<div class="pd32 relative">
									<form class="form-horizontal" id="addProjectUserForm" name="projectUserForm">
										<div class="input-group">
											<span class="twitter-typeahead" style="position: relative; display: inline-block; direction: ltr;">
	                                        	<input type="text" class="form-control typeahead-email tt-hint" readonly="" autocomplete="off" spellcheck="false" tabindex="-1" style="position: absolute; top: 0px; left: 0px; border-color: transparent; box-shadow: none; opacity: 1; background: none 0% 0% / auto repeat scroll padding-box border-box rgb(255, 255, 255);">
	                                        	<input type="text"    id="buser_email" class="form-control typeahead-email tt-input" placeholder="输入邮箱地址" name="buser_email"  onmouseleave="checkEmail();"autocomplete="off" spellcheck="false" dir="auto" style="position: relative; vertical-align: top; background-color: transparent;">
	                                        	<pre aria-hidden="true" style="position: absolute; visibility: hidden; white-space: pre; font-family: &#39;Helvetica Neue&#39;, &#39;Hiragino Sans GB&#39;, &#39;WenQuanYi Micro Hei&#39;, &#39;Microsoft Yahei&#39;, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; word-spacing: 0px; letter-spacing: 0px; text-indent: 0px; text-rendering: auto; text-transform: none;"></pre>
	                                        	<span class="tt-dropdown-menu" style="position: absolute; top: 100%; left: 0px; z-index: 100; display: none; right: auto;">
	                                        		<div class="tt-dataset-EmailSuggestion"></div>
	                                        	</span>
											</span>
											<span class="input-group-btn">
	                                        	<button type="button"   onclick="javascript:add();"class="btn btn-info noborder" for="addProjectForm" id="ProjectFormBtn">添加</button>
	                                        </span>
	                                      
										</div>  <span style="display:block;" id="addemailinfo" class="inputTs"></span>
									</form>
								</div>
								<h5>成员列表</h5>
								<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;">
								
									<div class="projectUserList md34" style="overflow: hidden; width: auto; height: 100%;">
										<ul class="list-group">
								<li   class="user"  style="width: 100%;">
									
											</li>				
										</ul>
									</div>
									<div class="slimScrollBar" style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px; background: rgb(0, 0, 0);"></div>
									<div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane projectProject" id="projectProduct">
								<h5>添加模块</h5>
								<form class="form-horizontal" id="addProjectProductForm" name="projectProductForm">
									<div class="input-group pd32">
										<input type="text"  id ="produce_name" class="form-control" name="produce_name" placeholder="输入模块名称，最多输入50个字符" onfocus="checkStrNum(this,50)" oninput="checkStrNum(this,50)" onpropertychange="checkStrNum(this,50)">
										<span class="input-group-btn">
	                                     <button type="button"   onclick="javascript:produce();"class="btn btn-info noborder" for="addProjectForm" id="dProjectFormBtn">添加</button>
	                                    </span>
									</div>
								</form>
								<h5>模块列表</h5>
								<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;">
									<div class="projectProductList md34" style="overflow: hidden; width: auto; height: 100%;">
										<ul class="list-group1">
								<li   class="produce"  style="width: 100%;">
									
											</li>				
										</ul>
									</div>
									<div class="slimScrollBar" style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px; background: rgb(0, 0, 0);"></div>
									<div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
								</div>
											<div class="modal-footer noborder">
											<form action="<%=path %>/addProgram?bid=${id}" method="post">
									<button type="submit"   onclick=""class="btn btn-info noborder" for="addProjectForm" id="ProjectFormBtn">完成</button>
								           </form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	  <!--图片上传框-->
    	<!-- <div class="am-modal am-modal-no-btn up-modal-frame" id="myProfileHeadImageModal" tabindex="-1" role="dialog" aria-labelledby="myHeadImageSetting">
		  <div class="am-modal-dialog up-frame-parent up-frame-radius" role="document" style="z-index: 99899;">
		    <div class="am-modal-hd up-frame-header">
		       <label>修改头像</label>
		      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
		    </div>
		    <div class="am-modal-bd  up-frame-body">
		      <div class="am-g am-fl">
		      	
		      	<div class="am-form-group am-form-file">
			      <div class="am-fl">
			        <button type="button" class="am-btn am-btn-default am-btn-sm">
			          <i class="am-icon-cloud-upload"></i> 选择要上传的文件</button>
			      </div>
			      <input type="file" class="up-img-file">
			   	</div>
		      </div>
		      <div class="am-g am-fl" >
		      	<div class="up-pre-before up-frame-radius">
		      		<img alt="" src="" class="up-img-show" id="up-img-show" >
		      	</div>
		      	<div class="up-pre-after up-frame-radius">
		      	</div>
		      </div>
		      <div class="am-g am-fl">
   				<div class="up-control-btns">
    				<span class="am-icon-rotate-left"   id="up-btn-left"></span>
    				<span class="am-icon-rotate-right"  id="up-btn-right"></span>
    				<span class="am-icon-check up-btn-ok" url="/admin/user/upload.action" ></span>
   				</div>
	    	  </div>
		      
		    </div>
		  </div>
		</div> -->
    	
    	<!--加载框-->
    	<div class="am-modal am-modal-loading am-modal-no-btn"tabindex="-1" role="dialog"id="up-modal-loading">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">正在上传...</div>
		    <div class="am-modal-bd">
		      <span class="am-icon-spinner am-icon-spin"></span>
		    </div>
		  </div>
		</div>
		
		<!--警告框-->
		<div class="am-modal am-modal-alert" id="up-modal-alert"tabindex="-1" role="dialog" data-dismiss="modal">
		  <div class="am-modal-dialog"style="z-index: 998999999999999999;">
		    <div class="am-modal-hd">信息  
		    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
		    </div>  
		    <div class="am-modal-bd"  id="alert_content">
		              成功了
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn">确定</span>
		    </div>
		  </div>
		</div>
		
		
	<!-- 项目设置 -->
		<div class="modal fade myProjectDetails" id="myProjectDetails" tabindex="-1" role="dialog" aria-labelledby="myProjectBg">
			<div class="modal-dialog" role="document" style="z-index: 1040">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    	<span aria-hidden="true"><i class="fa fa-remove black"></i></span>
	                    </button>
						<h4 class="modal-title" id="myProjectBg">
	                        <div id="projectHeadImage" class="projectHeadImage">
	                            <div class="default">
	                                <img src="img/app-default.jpg" width="100%">
	                            </div>
	                        </div>
	                    </h4>
					</div>
					<div class="modal-body">
						<ul class="nav nav-tabs noborder" role="tablist">
							<li role="presentation" class="active">
								<a href="projects.html#projectUser1" aria-controls="projectUser" role="tab" data-toggle="tab">成员管理</a>
							</li>
							<li role="presentation">
								<a href="projects.html#projectProduct1" aria-controls="projectProduct" role="tab" data-toggle="tab"  >模块管理</a>
							</li>
						</ul>
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane projectUser1 active" id="projectUser1">
								<h5>添加成员</h5>
								<div class="pd32 relative">
									<form class="form-horizontal" id="addProjectUserForm" name="projectUserForm">
										<div class="input-group">
											<span class="twitter-typeahead" style="position: relative; display: inline-block; direction: ltr;">
	                                        	<input type="text" class="form-control typeahead-email tt-hint" readonly="" autocomplete="off" spellcheck="false" tabindex="-1" style="position: absolute; top: 0px; left: 0px; border-color: transparent; box-shadow: none; opacity: 1; background: none 0% 0% / auto repeat scroll padding-box border-box rgb(255, 255, 255);">
	                                        	<input type="text"   id="name" class="form-control typeahead-email tt-input" placeholder="输入邮箱地址"name="buser_email"  onmouseleave="checkEmail2();" autocomplete="off" spellcheck="false" dir="auto" style="position: relative; vertical-align: top; background-color: transparent;">
	                                        	<pre aria-hidden="true" style="position: absolute; visibility: hidden; white-space: pre; font-family: &#39;Helvetica Neue&#39;, &#39;Hiragino Sans GB&#39;, &#39;WenQuanYi Micro Hei&#39;, &#39;Microsoft Yahei&#39;, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; word-spacing: 0px; letter-spacing: 0px; text-indent: 0px; text-rendering: auto; text-transform: none;"></pre>
	                                        	<span class="tt-dropdown-menu" style="position: absolute; top: 100%; left: 0px; z-index: 100; display: none; right: auto;">
	                                        		<div class="tt-dataset-EmailSuggestion"></div>
	                                        	</span>
											</span>
											<span class="input-group-btn">
	                                              <button type="button"   onclick="javascript:add1();"class="btn btn-info noborder" for="addProjectForm" id="dProjectFormBtn">添加</button>
	                                        </span>
										</div>
										<span id="add_emailinfo" class="inputTs"></span>
									</form>
								</div>
								<h5>成员列表</h5>
								<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;">
									<div class="projectUserList md34" style="overflow: hidden; width: auto; height: 100%;">
										<ul class="list-group3">
												<li   class="user1"  style="width: 100%;">
										</ul>
									</div>
									<div class="slimScrollBar" style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px; background: rgb(0, 0, 0);"></div>
									<div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane projectProject1" id="projectProduct1">
								<h5>添加模块</h5>
								<form class="form-horizontal" id="addProjectProductForm" name="projectProductForm">
									<div class="input-group pd32">
										<input type="text" class="form-control" id="produce"  name="name" placeholder="输入模块名称，最多输入50个字符" onfocus="checkStrNum(this,50)" oninput="checkStrNum(this,50)" onpropertychange="checkStrNum(this,50)">
										<span class="input-group-btn">
	                                      <button type="button"   onclick="javascript:produce1();"class="btn btn-info noborder" for="addProjectForm" id="dProjectFormBtn">添加</button>
	                                    </span>
									</div>
								</form>
								<h5>模块列表</h5>
								<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;">
									<div class="projectProductList md34" style="overflow: hidden; width: auto; height: 100%;">
										<ul class="list-group2">
											<li   class="produce1"  style="width: 100%;">
										</ul>
									</div>
									<div class="slimScrollBar" style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px; background: rgb(0, 0, 0);"></div>
									<div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
								</div>
								<p class="projectProjectListTips"></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
			<!-- 删除模块 -->
<!-- 				<div class="modal fade myProjectModel myBugcloseModel in" id="DeleteProduct" tabindex="-3" role="dialog" style="display:block; margin-left:450px;z-index: 9999;"> -->
<!-- 					<div class="modal-dialog" role="document" style="z-index: 1060"> -->
<!-- 						<div class="layui-layer layui-anim layui-layer-dialog " id="layui-layer3" type="dialog" times="3" showtime="0" contype="string" style="z-index: 19891017;"> -->
<!-- 							<div class="layui-layer-title" style="">提示</div> -->
<!-- 							<div class="layui-layer-content">确定删除该该模块？</div> -->
<!-- 							<span class="layui-layer-setwin"> -->
<!-- 								<button type="button"  class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button> -->
<!-- 							</span> -->
<!-- 							<div class="layui-layer-btn"> -->
<!-- 								<a class="layui-layer-btn0"  onclick="DeleteBug();">确定</a> -->
<!-- 								<a class="layui-layer-btn1" data-dismiss="modal">取消</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
		<script type="text/javascript" src="<%=path %>/css/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<script>
		
		</script>
	</body>

</html>