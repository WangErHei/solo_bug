<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html class=" dk_fouc">

	<head lang="en">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>工作台</title>
		<link type="image/x-icon" rel="icon" href="<%=path%>/img/favic.ico"/>
	<link rel="stylesheet" href="<%=path %>/css/bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/font-awesome-4.4.0/css/font-awesome.min.css" />
		<link rel="stylesheet" href="<%=path %>/css/bootstrap-datepicker.min.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/jquery.minicolors.css">
		<link rel="stylesheet" href="<%=path %>/css/animate.css" type="text/css">
		<link rel="stylesheet" href="<%=path %>/css/public.css" type="text/css">
		<link rel="stylesheet" href="<%=path %>/css/bugClose.css" type="text/css">
		<link rel="stylesheet" href="<%=path %>/css/project.css" type="text/css">
		<script type="text/javascript" src="<%=path %>/js/utils.js"></script>
		
		<link rel="stylesheet" href="<%=path %>/css/layer.css" id="layui_layer_skinlayercss">
		<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="xml" src="<%=path %>/js/xml.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="dropkick" src="<%=path %>/js/jquery.dropkick-1.0.0.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="slimScroll" src="<%=path %>/js/jquery.slimscroll.min.1.3.8.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="utils" src="<%=path %>/js/utils.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="qrcode" src="<%=path %>/js/jquery.qrcode.min.js"></script>
	<script src="<%=path %>/js/ajaxfileupload.js" type="text/javascript"></script>
	
<script> 
		window.onload = function(){
			$("#noticeType").val("${oneNotyType}");
			
		}
			function viewmypic(mypic, imgfile) {
				if(imgfile.value) {
					mypic.src = imgfile.value;
					mypic.style.display = "";
					mypic.border = 1;
				}
			}
		</script>
		
		
	<script type="text/javascript">
	//定义全局变量，供其使用
	var mmm;
	 var nnn;
	
	   function update(){	   	
				 $.post("<%=path%>/tosubmit",{
				 "notify_id":"${noticeId}"
					},function(map){							
						$("#noticeType").val(map.notify_type);
						$("#fu_name").html(map.notify_fu_name);
						$("#notify_describe").val(map.notify_content);	
						$("#notify_title").val(map.notify_title);	
						notify_describe
						if(map.notify_photo==""||map.notify_photo==null){
							$("#image").hide();
						}
						$("#image").attr("src","/"+map.notify_photo);
						$("#result8").val(map.notify_photo);
						$("#results8").val(map.notify_fu);	
						$("#resultss8").val(map.notify_fu_name);	
				});
				 
		}		
	   
	   
	   function ajaxFileUpload8(){
		    $.ajaxFileUpload(  		 
		        {     
		     url:'<%=path%>/pic/upload',           
		     secureuri:false,
		     fileElementId:'uploadFile9',                        //文件选择框的id属性
		     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
		     success: function (jsonStr)            //相当于java中try语句块的用法
		     {      
		        var a= $('#result8').val(jsonStr.result);
		     },
		     error: function (data, status, e)            //相当于java中catch语句块的用法
		     {
		         $('#result').html('添加失败');
		     }
		        }
		               
		           );
		          
		      }
		   
		function FileUpload8(){

		    $.ajaxFileUpload(
		        {
		     url:'<%=path%>/uploadfu',          
		     secureuri:false,
		     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
		     fileElementId:'imgfile9',                        //文件选择框的id属性
		     success: function (result)            //相当于java中try语句块的用法
		     {    
		        var a= $('#results8').val(result.result);
		        var b= $('#resultss8').val(result.oname);
		     },
		     error: function (data, status, e)            //相当于java中catch语句块的用法
		     {
		         $('#result').html('添加失败');
		     }
		        }
		               
		           );
		          
		      }
	   function deleteOneNotice(){
			var p = "${pid}";
			var notyId ="${noticeId}";
			var typeInfo ="${typeInfo}";
			var creater = "${creater}";
			$.post("<%=path%>/deleteOneNotify",{
				notyId:notyId,
				typeInfo:typeInfo,
				creater:creater,
				pid:p,
				currpage:1
				},function(){	
					window.location.href="<%=path%>/common/noticeAll";
			});
		}
	   
		function updatecom(a){
	      mmm=a;
			}
		
		
		function updatecomm(){
			var comments = $("#comments").val();
			 $.post("<%=path%>/com",{
					comm:comments,
					comm_id:mmm,
					 notyId:"${noticeId }"
						},function(){				
window.location.href="<%=path%>/common/informDetails";
					});
			}
		
		
		function delComment(d){
		     nnn=d;
				}
		
		
		function deleteCom(){
		 $.post("<%=path%>/comDelete",{
				comm_id:nnn,
				 notyId:"${noticeId }"
					},function(){				
						window.location.href="<%=path%>/common/informDetails";
				});
		}
		
	   </script>
	
		
	</head>

	<body>

		<body class="apps done fixed-sidebar modal-open-v">
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
            		<i class="fa fa-angle-right"></i></span>
						<div class="sidebar-select" id="console-sidebar-select" alt="切换项目" title="切换项目">
							<div class="dk_container  dk_shown dk_theme_default" id="dk_container_projectSelectList" tabindex="1">
								<a class="dk_toggle"><span class="dk_label">${pname}</span>
									<span class="select-icon"><i class="fa fa-caret-down"></i></span>
								</a>
								<div class="dk_options">
									<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;">
										<ul class="dk_options_inner" style="overflow: hidden; width: auto; height: 100%;">
									    <c:forEach  items="${list1}" var="b">
											<li class="dk_option_current">						   				
												<a data-dk-dropdown-value="27221"  href="<%=path %>/change?pid=${b.pid }&pname=${b.pname}&bid=${id}">
												<img src="<%=path %>/img/app-default.jpg">${b.pname}
												<label class="badge bgBlue">${b.pnum}</label>								
												</a>						
											</li>
											</c:forEach>
										</ul>
										<div class="slimScrollBar" style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; background: rgb(0, 0, 0);"></div>
										<div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
									</div>
								</div>
							</div>
							<select style="visibility: hidden; display: none;" tabindex="1" id="projectSelectList">
								<option value="27221" selected="">呜呜</option>
							</select>
						</div>
						<div class="sidebar-search">
							<form name="fastSearchByNumberForm" id="fastSearchByNumberForm">
								<div class="input-group">
									<input type="text" class="form-control" id="fastKeyword" placeholder="BUG标题、模块" autocomplete="off">
									<span class="input-group-btn"><button class="btn btn-default"    onclick="javascript:updateName();"   type="button"  ><i class="fa fa-search"></i></button></span></div>
							</form>
						</div>
					</div>
            <div class="right">
                <div class="setting">
                    <span class="username" tabindex="2">
                        <div class="username-warp">
                            <i class="fa fa-user"></i>
                            <c:forEach  items="${list}" var="a">
		                            <span class="username-txt textOverHiden">${a.BUSER_NAME}</span>
		                            </c:forEach>
                        </div>
                        <div class="user-setting">
                   
                       
                             
                        </div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
				</div>
			</header>
			<!-- 创建个人设置model -->
			<div id="profile">
				
				<!-- header end -->
				<div class="wrapper" id="wrapper">
					<!-- nav start -->
					<nav class="navbar-default navbar-static-side">
						<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;">
							<div class="sidebar-collapse" style="overflow: hidden; width: auto; height: 100%;">
								<div class="project-img relative" id="project-img">
									<p style="background: url(img/app-default.jpg) 50% 50% / contain no-repeat;">
										<img src="<%=path%>/img/app-default.jpg" id="projectImg" border="0">
										<span class="bg"></span>
										<a href=""><span class="btn"><i class="fa fa-refresh"></i><br>刷新项目</span></a>
									</p>
								</div>
								<div class="sidebar-menus-icon"><span class="fa fa-navicon" title="展开" alt="展开"></span></div>
							<ul class="nav side-menu" id="side-menu">
								<li class="divider"></li>
								<li class="li-projectInfo" data-url="" for="main" alt="项目概况" title="项目概况" id="projectInfoMenu">
									<a href="<%=path%>/bugInfo?bid=${id}&pid=${pid}"><i class="fa fa-database"></i> <span class="nav-label">项目概况</span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
								</li>
								
								<li data-url="" for="main" alt="活动BUG" title="活动BUG" id="bugActiveMenu">
									<a href="<%=path%>/Programactive?bid=${id}&pid=${pid}&currpage=1"><i class="fa fa-clock-o"></i> <span class="nav-label">活动BUG <sup class="badge bgDefault" id="bugsActive">${num}</sup></span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
								</li>
								
								<li data-url="" for="main" alt="所有BUG" title="所有BUG" class="li-bugAll" id="bugAllMenu">
									<a href="<%=path%>/allBug?bid=${id}&pid=${pid}&currpage=1"><i class="fa fa-bug"></i> <span class="nav-label">所有BUG</span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
								</li>
								<li data-url="" for="main" alt="BUG统计" title="BUG统计" id="bugStatMenu" class="li-countAll" style="display: none;">
									<a href="countAll.html"><i class="fa fa-pie-chart"></i> <span class="nav-label">BUG统计</span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
								</li>
								<li class="divider"></li>
								<li data-url="bugAssignToMe.html" for="main" alt="我的待办" title="我的待办" class="li-bugAssignToMe" id="bugAssignToMeMenu">
									<a href="<%=path%>/needToDo?bid=${id}&pid=${pid}&currpage=1"><i class="fa fa-hourglass-end"></i> <span class="nav-label">我的待办 <sup class="badge bgYellow" id="bugsAssignToMe">${countNeedToDo }</sup></span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
								</li>
								<li data-url="bugFixByMe.html" for="main" alt="我的任务" title="我的任务" class="li-bugFixByMe" id="bugFixByMeMenu" style="">
									<a href="<%=path%>/myAllTask?bid=${id}&pid=${pid}&currpage=1"><i class="fa fa-sign-in"></i> <span class="nav-label">我的任务</span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
								</li>
								<li data-url="bugAssignByMe.html" for="main" alt="我的分配" title="我的分配" class="li-bugAssignByMe" id="bugAssignByMeMenu" style="">
									<a href="<%=path%>/assignOthers?bid=${id}&pid=${pid}&currpage=1"><i class="fa fa-sign-out"></i> <span class="nav-label">我的分配</span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
								</li>
								<li class="divider"></li>
								<li data-url="noticeAll.html" for="main" alt="项目通知" title="项目通知" class="li-noticeAll" id="noticeAllMenu">
									<a href="<%=path%>/showNotice?bid=${id }&pid=${pid}&currpage=1"><i class="fa fa-bullhorn"></i> <span class="nav-label">项目通知</span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
								</li>
									<li data-url="testCase.html" for="main" alt="测试用例" title="测试用例" class="li-testCase" id="testCaseMenu">
		                        	<a href="<%=path%>/showTestCase?bid=${id }&pid=${pid}&currpage=1"><i class="fa fa-leanpub"></i> <span class="nav-label">测试用例</span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
		                   		</li>
							</ul>
							</div>
							<div class="slimScrollBar" style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; left: 1px; height: 590px; background: rgb(0, 0, 0);"></div>
							<div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; left: 1px; background: rgb(51, 51, 51);"></div>
						</div>
					</nav>
					<!-- nav end -->
					<!-- main start -->

					<!-- main end -->

				</div>
				<!-- 通知详情 -->
				<div class="bugInfoPage1" id="bugInfoPage" style="display: block;">
					<div class="bugInfoTop1">
						<span class="btn0">
							<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#NoticeCommentModal" data-action="Comment">评论</button> 
						</span>
						<span class="btn1 right">
						<c:if test="${check=='1' ||right=='1' }">
							<i class="fa fa-edit" data-action="Modify" data-toggle="modal"  data-target="#myProjectNoticeEditModal" alt="修改" title="修改"onclick="update();"></i> 
						</c:if>
							<c:if test="${right=='1' }">
							<i class="fa fa-trash-o" data-action="Delete" data-toggle="modal"  data-target="#DeleteNotification" alt="删除" title="删除"   ></i> 
							</c:if>
						</span>
							
					</div>
					<div class="bugInfoContent bugPageContent">
						<div class="slimScrollDiv" style="margin-top: 5px;position: relative; overflow: hidden; width: auto; height: 100%;">
							<div class="bugInfoPageNr" style="overflow: hidden; width: auto; height: 100%;">
								
								<div class="panel-default noticeInfo">
								<c:forEach items="${oneNotify}" var="oneNoty">
									<div class="row">
										<label class="col-sm-12 control-label noticeInfoTitle"> 
											<span style="margin-top: 6px;" class="label label-primary">${oneNoty.notify_type }</span> 
											${oneNoty.notify_title }
										</label>
									</div>
									<div class="row">
										<div class="col-sm-4">
											<label class="col-sm-3 control-label pd0">项目</label>
											<div class="col-sm-9 bugInfoProject txt pd0">${pname}</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-4">
											<label class="col-sm-3 control-label pd0">发布人</label>
											<div class="col-sm-9 bugInfoProduct txt pd0">${oneNoty.buser_name}</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-4">
											<label class="col-sm-3 control-label pd0">发布时间</label>
											<div class="col-sm-9 bugInfoProduct txt pd0">${fn:substring(oneNoty.notify_date,0,19)}</div>
										</div>
									</div>
									<div class="row" style="margin-top: 5px; border-top: solid 1px #e9e9e9;">
										<div class="col-sm-12 noticeInfoDescription">${oneNoty.notify_content}</div>
									</div>
									<div class="row" id="noticeInfoImages">
									<c:if  test="${!empty oneNoty.notify_photo}">
										<div class="col-sm-12 noticeInfoImages">
											<img src="${ oneNoty.notify_photo}" class="noticeinfoimg-2564739203" width="400" alt="paris" title="paris">
										</div>
										</c:if>
									</div>
									<div class="row">
										<c:if  test="${!empty oneNoty.notify_fu}">
										<div class="col-sm-12 noticeInfoFujian">
											<p class="title">附件</p>
											<p class="noticeInfoPageFile">
												<a href="<%=path %>/down/fudownload?fu=${oneNoty.notify_fu}" target="_blank"><i class="fa fa-paperclip"></i> ${oneNoty.notify_fu_name } </a>
											</p>
										
										</div>	</c:if>
									</div>
									
									</c:forEach>
									<div class="row log">
       									<p class="title">评论</p>
										<div class="col-sm-12 bugInfoHistories">
										<c:forEach items="${notyCommList}" var="notyCommList">
										<p>
										<span class="name">
										<img src="${notyCommList.head1}" style="background:url(<%=path %>/img/head_default.png) center no-repeat;background-size:cover">
										<b>${notyCommList.buser_name }</b>
										</span> ${notyCommList.comment_content }
										<c:if  test="${notyCommList.buser_id == id  || right=='1'}">														
									 <i class="fa fa-edit noption" alt="修改" title="修改" data-toggle="modal" data-target="#NoticeCommentEditModal" data-noption="modify" data-nid="165" data-content=""  onclick="updatecom(${notyCommList.comment_id});">
											<span style="display:none">没事没事没事没事</span>
										</i>																																				
										</c:if>
										<c:if  test="${right=='1'}">
						         	<i class="fa fa-trash-o noption" alt="删除" title="删除" data-toggle="modal" data-target="#DeleteRemarks" data-noption="delete" data-nid="165"  onclick="delComment(${notyCommList.comment_id});"></i>
										<span class="right">${fn:substring(notyCommList.comment_date,0,16) }</span>
										</c:if>
										</p>
										
										</c:forEach>
							
									
									</div>
								</div>
								</div>
							</div>
							
							<div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 68.7807px;"></div>
							<div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.9; z-index: 90; right: 1px;"></div>
						</div>
					</div>
					
					
				</div>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				<!-- 修改通知 -->
				<div class="modal fade myProjectBugModal in" id="myProjectNoticeEditModal" tabindex="-12" role="dialog" data-backdrop="static" data-keyboard="false">
					<div class="modal-dialog" role="document" style="z-index: 1040">
						<c:forEach items="${oneNotify}" var="oneNoty">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
								<h4><i class="fa fa-bullhorn"></i> 修改通知</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" id="noticeEditModelForm" name="noticeEditModelForm" action="<%=path%>/updateNotify?notify_id=${oneNoty.notify_id}" method="post">
									<div class="form-group">
									
									<input name="bid" type="hidden" value="${id}">
									<input name="pid" type="hidden" value="${pid}">
									<input name="notifyId" type="hidden" value="${oneNoty.notify_id}">
										<label class="col-sm-2 control-label">类型</label>
										<div class="col-sm-10">
											<select style="cursor:pointer; border-radius: 4px;height: 34px;border:1px solid #CCCCCC;color: #9A9A9A" class="col-sm-12" tabindex="4" id="noticeType" name="noticeType">
												<option value="信息公布">信息公布</option>
												<option value="会议记要">会议记要</option>
												<option value="版本发布">版本发布</option>
												<option value="会议通知">会议通知</option>
												<option value="工作计划">工作计划</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">标题</label>
										<div class="col-sm-10">
											<input type="text"  class="form-control" placeholder=""  id="notify_title" name="title" onfocus="checkStrNum(this,200)" oninput="checkStrNum(this,200)" onpropertychange="checkStrNum(this,200)" >
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">内容</label>
										<div class="col-sm-10 relative">
											<textarea class="form-control textarea" rows="6" name="description" id="notify_describe" placeholder="" onfocus="checkStrNum(this,2000)" oninput="checkStrNum(this,2000)" onpropertychange="checkStrNum(this,2000)" ></textarea>
											<div class="dragEditNoticeDescriptionDiv"></div>
										</div>
									</div>
								<div class="showAndHideImageFujianDiv" style="">
													<div class="form-group">
														<label class="col-sm-2 control-label">图片</label>
						
														<div class="col-sm-10 text-right relative">
															<div class="ui-image">
																<img   id="image" src="">
															</div>
					
														<input type="file" id="uploadFile9" name="file"  accept=".png,.jpg" /> 
											        <input type="button" id="btnUpload" value="确定" onclick="ajaxFileUpload8()" style="float:left;margin-top:5px;"/>                                       
                                                    <input type="text" id="result8"  name="result8"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label">附件</label>
														<div class="col-sm-10">
															<div id="editBugFuJian" class="fujian">
																<p class="">
																	<i class="fa fa-paperclip"></i> <span class="fj-name"  id="fu_name" >scsdvsdvsdvsdvcsd</span>
																	
																</p>
															</div>
																<input name="file" type="file" id="imgfile9"  accept=".doc,doxc,txt" />
										               	<input type="button" id="btnUpload1" value="确定" onclick="FileUpload8()" style="float:left;margin-top:5px;"/>                                       
                                                     <input type="text" id="results8"  name="results8"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
                                                     <input type="text" id="resultss8"  name="resultss8"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
														</div>
													</div>
												</div>
											</div>
									<div class="modal-footer noborder">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="submit" class="btn btn-info noborder">提交</button>
									</div>
								</form>
							</div>
						</div>
						</c:forEach>
					</div>
				</div>
		
		
				<!-- 评论通知 -->
				<div class="modal fade myProjectBugModal in" id="NoticeCommentModal" tabindex="-13" role="dialog" data-backdrop="static" data-keyboard="false">
					<div class="modal-dialog" role="document" style="z-index: 1040">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
								<h4><i class="fa fa-cube"></i> 评论</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" id="NoticeCommentModelForm" action="<%=path %>/addCommNotify">
									<input type="hidden" name="bid" value="${id }">
									<input type="hidden" name="pid" value="${pid }">
									<input type="hidden" name="notyId" value="${noticeId }">
									<input type="hidden" name="creater" value="${creater }">
									<input type="hidden" name="typeInfo" value="${typeInfo }">
									<div class="form-group">
										<label class="col-sm-2 control-label titleName">内容</label>
										<div class="col-sm-10 relative onFocus">
											<textarea class="form-control textarea comments" name="commContent" placeholder="最多输入500个字符" rows="4" name="comments" onfocus="checkStrNum(this,500)" oninput="checkStrNum(this,500)" onpropertychange="checkStrNum(this,500)" data-value=""></textarea>
											<div class="dragNoticeCommentDiv"></div>
										</div>
									</div>
									<div class="modal-footer noborder">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="submit" class="btn btn-info noborder">提交</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- 删除通知 -->
				<div class="modal fade myProjectModel myBugcloseModel in" id="DeleteNotification" tabindex="-3" role="dialog" style="z-index: 9999;">
					<div class="modal-dialog" role="document" style="z-index: 1060">
						<c:forEach items="${oneNotify}" var="oneNoty">
						<div class="layui-layer layui-anim layui-layer-dialog " id="layui-layer3" type="dialog" times="3" showtime="0" contype="string" style="z-index: 19891017;">
							<div class="layui-layer-title" style="">提示</div>
							<div class="layui-layer-content">确定删除该通知？</div>
							<span class="layui-layer-setwin">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"  onclick="deleteCom();"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
							</span>
							<div class="layui-layer-btn">
							
								<a class="layui-layer-btn0" href="javascript:deleteOneNotice();">确定</a>
								<a class="layui-layer-btn1" data-dismiss="modal">取消</a>
								
						
							</div>
						</div>
						</c:forEach>
					</div>
				</div>
				<!-- 编辑评论通知 -->
		<div class="modal fade myProjectBugModal in" id="NoticeCommentEditModal" tabindex="-13" role="dialog" data-backdrop="static" data-keyboard="false">
			<div class="modal-dialog" role="document" style="z-index: 1040">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
						<h4><i class="fa fa-cube"></i> 编辑评论</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="NoticeCommentEditModelForm" action="updateCommNotify" method="post">
							<input type="hidden" name="id" value="165">
							<div class="form-group">
								<label class="col-sm-2 control-label titleName">内容</label>
								<div class="col-sm-10 relative onFocus">
								
									<textarea class="form-control textarea comments"  id="comments"  placeholder="最多输入500个字符" rows="4" name="comments" onfocus="checkStrNum(this,500)" oninput="checkStrNum(this,500)" onpropertychange="checkStrNum(this,500)" data-value=""></textarea>
									
									<div class="dragEditNoticeCommentDiv"></div>
								</div>
							</div>
							<div class="modal-footer noborder">
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								<button type="button" class="btn btn-info noborder"   onclick="updatecomm();">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
				<!-- 删除备注 -->
		<div class="modal fade myProjectModel myBugcloseModel in" id="DeleteRemarks" tabindex="-3" role="dialog" style="z-index: 9999; margin-top: 50px; margin-left: -200px;">
			<div class="modal-dialog" role="document" style="z-index: 1060">
				<div class="layui-layer layui-anim layui-layer-dialog " id="layui-layer3" type="dialog" times="3" showtime="0" contype="string" style="z-index: 19891017;">
					<div class="layui-layer-title" style="">提示</div>
					<div class="layui-layer-content">确定删除评论？</div>
					<span class="layui-layer-setwin">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
					</span>
					<div class="layui-layer-btn">
						<a class="layui-layer-btn0"   onclick="deleteCom();">确定</a>
						<a class="layui-layer-btn1" data-dismiss="modal">取消</a>
					</div>
				</div>
			</div>
		</div>
				<!-- bugModel end  -->

			</div>
			<!-- bugTestModel end -->
			<div class="floatBugInfo"></div>
			<!--  -->
			<script type="text/javascript" src="<%=path %>/css/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
			
		</body>

</html>