<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html class=" dk_fouc">

<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>工作台</title>
<link type="image/x-icon" rel="icon" href="<%=path%>/img/favic.ico"/>
<link rel="stylesheet"
	href="<%=path%>/css/bootstrap-3.3.7-dist/css/bootstrap.css"
	type="text/css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/font-awesome-4.4.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=path%>/css/bootstrap-datepicker.min.css"
	type="text/css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/jquery.minicolors.css">
<link rel="stylesheet" href="<%=path%>/css/animate.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/css/public.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/css/bugClose.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/css/project.css" type="text/css">
<script type="text/javascript" src="<%=path%>/js/utils.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<link rel="stylesheet" href="<%=path%>/css/layer.css"
	id="layui_layer_skinlayercss">
<script type="text/javascript" charset="utf-8" async
	data-requirecontext="_" data-requiremodule="xml"
	src="<%=path%>/js/xml.js"></script>
<script type="text/javascript" charset="utf-8" async
	data-requirecontext="_" data-requiremodule="dropkick"
	src="<%=path%>/js/jquery.dropkick-1.0.0.js"></script>
<script type="text/javascript" charset="utf-8" async
	data-requirecontext="_" data-requiremodule="slimScroll"
	src="<%=path%>/js/jquery.slimscroll.min.1.3.8.js"></script>
<script type="text/javascript" charset="utf-8" async
	data-requirecontext="_" data-requiremodule="utils"
	src="<%=path%>/js/utils.js"></script>
<script type="text/javascript" charset="utf-8" async
	data-requirecontext="_" data-requiremodule="qrcode"
	src="<%=path%>/js/jquery.qrcode.min.js"></script>
<script src="<%=path%>/js/ajaxfileupload.js" type="text/javascript"></script>
<link rel="stylesheet" href="<%=path%>/layer/skin/default/layer.css" type="text/css">
<script src="<%=path%>/layer/layer.js" type="text/javascript"></script>

<script type="text/javascript">

window.onload = function(){
	$("#showByGroup").val("${groupFilter}");
	$("#showByProp").val("${propFilter}");
	$("#showByManager").val("${managerFilter}");
	$("#showByState").val("${stateFilter}");
	$("#showByProduce").val("${produceFilter}");
	var a = ${groupSize};
	var ab = ${groupFilter};
	if(a==0 || !ab.equals("全部")){
		$(".oneGroupName").css("display","none");
		$(".twoGroupName").css("display","inline");
	}
	if(a==1){
		$(".twoGroupName").css("display","none");
	}
	var bb = ${managerFilter};
	var b = ${managerSize};
	if(b==0 || !bb.equals("全部")){
		$(".oneManagerName").css("display","none");
		$(".twoManagerName").css("display","inline");
	}
	if(b==1){
		$(".twoManagerName").css("display","none");
	}
	var cc = ${produceFilter};
	var c = ${produceSize};
	if(c==0 || !cc.equals("全部")){
		$(".oneProduceName").css("display","none");
		$(".twoProduceName").css("display","inline");
	}
	if(c==1){
		$(".twoProduceName").css("display","none");
	}
}
function changePage(a){
	var p = "${pid}";
	var showByGroup = $("#showByGroup").val();
	var showByProp = $("#showByProp").val();
	var showByManager = $("#showByManager").val();
	var showByState = $("#showByState").val();
	var showByProduce = $("#showByProduce").val();
	$.post("<%=path%>/showFilterTestCase",{
		group:showByGroup,
		prop:showByProp,
		manager:showByManager,
		state:showByState,
		produce:showByProduce,
		 pid:p,
		 currpage:a
		},function(){	
			window.location.href="<%=path%>/common/testCase";
	});
}

function showByFilter(){
	var p = "${pid}";
	var showByGroup = $("#showByGroup").val();
	var showByProp = $("#showByProp").val();
	var showByManager = $("#showByManager").val();
	var showByState = $("#showByState").val();
	var showByProduce = $("#showByProduce").val();
	$.post("<%=path%>/showFilterTestCase",{
		group:showByGroup,
		prop:showByProp,
		manager:showByManager,
		state:showByState,
		produce:showByProduce,
		 pid:p,
		 currpage:1
		},function(){	
			window.location.href="<%=path%>/common/testCase";
	});
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
				
				
			function showOneTestCase(cid){
				$.post("<%=path%>/showTestCaseInfo",{
					"pid":"${pid}",
					"bid":"${id}",
					"caseId":cid
				},function(){	
					window.location.href="<%=path%>/common/caseDetails";
				});
			  
			}
			function ajaxFileUpload(){
			    $.ajaxFileUpload(
			        {
			     url:'pic/upload',            //需要链接到服务器地址
			     secureuri:false,
			     fileElementId:'uploadFile',                        //文件选择框的id属性
			     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
			     success: function (jsonStr)            //相当于java中try语句块的用法
			     {      
			        var a= $('#result').val(jsonStr.result);
			     },
			     error: function (data, status, e)            //相当于java中catch语句块的用法
			     {
			         $('#result').html('添加失败');
			     }
			        }
			               
			           );
			          
			      }
			      </script>
				<script type="text/javascript">
				var deleteId;
				var caseID;
			function FileUpload(){
			    $.ajaxFileUpload(
			        {
			     url:'uploadfu',            //需要链接到服务器地址
			     secureuri:false,
			     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
			     fileElementId:'imgfile',                        //文件选择框的id属性
			     success: function (result)            //相当于java中try语句块的用法
			     {    
			        var a= $('#results').val(result.result);
			        var b= $('#resultss').val(result.oname);
			     },
			     error: function (data, status, e)            //相当于java中catch语句块的用法
			     {
			         $('#result').html('添加失败');
			     }
			        }
			               
			           );
			          
			      }
			//显示
			function showGroup(){
				
				$.get("<%=path%>/showGroup",{
					pid:"${pid}"
					},function(data){
					$("#showGroupInfo").append(data);
					$("#myProjectTestGroupModal").modal('show');
					
				});
				
				
			}
			
			
			//删除测试组
			var deleteId;
			var layerTips;
			function deleteGroup(cid){
				deleteId = cid; 
				layer.confirm('是否删除？',{anim:6}, function(){
					layerTips = layer.msg('正在删除-请稍后...', {icon: 16,shade: 0.01,time:0});
					$.post("<%=path%>/deleteGroup",{did:cid},function(result){
						layer.close(layerTips);
						if(result.result){
							layer.alert(result.mess,{icon:6},function(){
								location.reload();
							});
						}else{
							layer.alert(result.mess,{icon:5});
						}
					});
				});
			}
			
			//修改
			function editGroup(cid){			 
				$("#groupModalInfo").html("");
				$.post("<%=path%>/editGroupName",{
					"id":cid,
					"pid":"${pid}"
					},function(map,data){	
						caseID=map.editGroupId;
					$("#testgroup").val(map.editGroupName);
					$("#groupModalInfo").append(data);
					$('#myProjectTestGroupModal').modal('hide');
					$("#myProjectTestGroupEdit").modal('show');
					
				});
				
				
			}
			//提交修改
			function subCase(){
				var p ="${pid}";
				var groupTitle = $("#testgroup").val();
				var groupManager=$("#groupManager").val();
				$.post("<%=path%>/updateTestGroup",{
					grop:caseID,
					groupTitle:groupTitle,
					groupManager:groupManager,
					pid:p
					},function(){
						$("#showGroupInfo").html("");
						$.post("<%=path%>/showGroup",{
							pid:p
							},function(data){
							$("#showGroupInfo").append(data);
							$('#myProjectTestGroupEdit').modal('hide');
							$("#myProjectTestGroupModal").modal('show');
						
						});
					
					
				});
				
				
			}
			//添加
			function addGroup(){
				$("#groupAddModal").html("");
				$.post("<%=path%>/addGroup",{},function(data){
						$("#groupAddModal").append(data);
						$('#myProjectTestGroupModal').modal('hide');
						$("#myProjectTestGroupAdd").modal('show');	
				});
			}
			function addTestGroup(name){
				var p ="${pid}";
				var bid ="${id}";
				$('#myProjectTestGroupModal').modal('hide');
				$.post("<%=path%>/addTestGroup",{
					bid:bid,
					pid:p,
					groupName:name
					},function(){
						$("#showGroupInfo").html("");
						$.post("<%=path%>/showGroup",{
							pid:p
							},function(data){
							$("#showGroupInfo").append(data);
							$('#myProjectTestGroupAdd').modal('hide');
							$("#myProjectTestGroupModal").modal('show');
						
						});
					
					
				});
				
				
			}
			
			//添加测试用例
			function addTestCase(){
				$("#showAddTestCaseModal").html("");
				$.post("<%=path%>/addTestCaseOne",{},function(data){
						$("#showAddTestCaseModal").append(data);
						$("#myProjectTestModal").modal('show');	
				});
			}
			function postAddTestCase(caseGroup,caseProduce,caseTitle,caseState,caseProp,
					caseManager,caseContent,result,results,resultss){
				var p ="${pid}";
				var b = "${id}";
				$('#myProjectTestModal').modal('hide');
				$.post("<%=path%>/addTestCase",{
					
					pid:p,
					bid:b,
					currpage:1,
					caseGroup:caseGroup,
					caseProduce:caseProduce,
					caseTitle:caseTitle,
					caseState:caseState,
					caseProp:caseProp,
					caseManager:caseManager,
					caseContent:caseContent,
					result:result,
					results:results,
					resultss:resultss
					},function(){
						window.location.href="<%=path%>/common/testCase";
				});
				
				
			}
		</script>

</head>

<body class="apps done fixed-sidebar modal-open-v">
	<!-- header start -->
	<header class="site-header">
		<div class="wrapper-header-left-bg"></div>
		<div class="wrapper-header">
			<span class="name"> <img src="<%=path%>/img/logozxi.png"
				height="33px">
			</span>
			<div class="wrapper-header-right">
				<div style="display: inline-block;">
					<span class="menus"><a href="<%=path%>/toprogram?id=${id}">我的项目</a></span>
					<span class="menus"> <i class="fa fa-angle-right"></i></span>
					<div class="sidebar-select" id="console-sidebar-select" alt="切换项目"
						title="切换项目">
						<div class="dk_container  dk_shown dk_theme_default"
							id="dk_container_projectSelectList" tabindex="1">
							<a class="dk_toggle"><span class="dk_label">${pname}</span> <span
								class="select-icon"><i class="fa fa-caret-down"></i></span> </a>
							<div class="dk_options">
								<div class="slimScrollDiv"
									style="position: relative; overflow: hidden; width: auto; height: 100%;">
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
									<div class="slimScrollBar"
										style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; background: rgb(0, 0, 0);"></div>
									<div class="slimScrollRail"
										style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
								</div>
							</div>
						</div>
						<select style="visibility: hidden; display: none;" tabindex="1"
							id="projectSelectList">
							<option value="27221" selected="">呜呜</option>
						</select>
					</div>
					<div class="sidebar-search">
						<form name="fastSearchByNumberForm" id="fastSearchByNumberForm">
							<div class="input-group">
								<input type="text" class="form-control" id="fastKeyword"
									placeholder="BUG标题、模块" autocomplete="off"> <span
									class="input-group-btn"><button class="btn btn-default"
										onclick="javascript:updateName();" type="button">
										<i class="fa fa-search"></i>
									</button></span>
							</div>
						</form>
					</div>
				</div>
				<div class="right">
					<div class="setting">
						<span class="username" tabindex="2">
							<div class="username-warp">
								<i class="fa fa-user"></i>
								<c:forEach items="${list}" var="a">
									<span class="username-txt textOverHiden">${a.BUSER_NAME}</span>
								</c:forEach>
							</div>
					</div>
				</div>
			</div>

		</div>
		</div>
		</div>
		</div>
	</header>
		
		<!-- header end -->
		<div class="wrapper" id="wrapper">
			<!-- nav start -->
			<nav class="navbar-default navbar-static-side">
				<div class="slimScrollDiv"
					style="position: relative; overflow: hidden; width: auto; height: 100%;">
					<div class="sidebar-collapse"
						style="overflow: hidden; width: auto; height: 100%;">
						<div class="project-img relative" id="project-img">
							<p
								style="background: url(img/app-default.jpg) 50% 50%/contain no-repeat;">
								<img src="<%=path%>/img/app-default.jpg" id="projectImg"
									border="0"> <span class="bg"></span> <a href=""><span
									class="btn"><i class="fa fa-refresh"></i><br>刷新项目</span></a>
							</p>
						</div>
						<div class="sidebar-menus-icon">
							<span class="fa fa-navicon" title="展开" alt="展开"></span>
						</div>
						<ul class="nav side-menu" id="side-menu">
							<li class="divider"></li>
							<li class="li-projectInfo" data-url="" for="main" alt="项目概况"
								title="项目概况" id="projectInfoMenu"><a
								href="<%=path%>/bugInfo?bid=${id}&pid=${pid}"><i
									class="fa fa-database"></i> <span class="nav-label">项目概况</span></a><span
								class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span></li>

							<li data-url="" for="main" alt="活动BUG" title="活动BUG"
								id="bugActiveMenu"><a
								href="<%=path%>/Programactive?bid=${id}&pid=${pid}&currpage=1"><i
									class="fa fa-clock-o"></i> <span class="nav-label">活动BUG
										<sup class="badge bgDefault" id="bugsActive">${num}</sup>
								</span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
							</li>

							<li data-url="" for="main" alt="所有BUG" title="所有BUG"
								class="li-bugAll" id="bugAllMenu"><a
								href="<%=path%>/allBug?bid=${id}&pid=${pid}&currpage=1"><i
									class="fa fa-bug"></i> <span class="nav-label">所有BUG</span></a><span
								class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span></li>
							<li data-url="" for="main" alt="BUG统计" title="BUG统计"
								id="bugStatMenu" class="li-countAll" style="display: none;">
								<a href="countAll.html"><i class="fa fa-pie-chart"></i> <span
									class="nav-label">BUG统计</span></a><span
								class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
							</li>
							<li class="divider"></li>
							<li data-url="bugAssignToMe.html" for="main" alt="我的待办"
								title="我的待办" class="li-bugAssignToMe" id="bugAssignToMeMenu">
								<a href="<%=path%>/needToDo?bid=${id}&pid=${pid}&currpage=1"><i
									class="fa fa-hourglass-end"></i> <span class="nav-label">我的待办
										<sup class="badge bgYellow" id="bugsAssignToMe">${countNeedToDo }</sup>
								</span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
							</li>
							<li data-url="bugFixByMe.html" for="main" alt="我的任务" title="我的任务"
								class="li-bugFixByMe" id="bugFixByMeMenu" style=""><a
								href="<%=path%>/myAllTask?bid=${id}&pid=${pid}&currpage=1"><i
									class="fa fa-sign-in"></i> <span class="nav-label">我的任务</span></a><span
								class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span></li>
							<li data-url="bugAssignByMe.html" for="main" alt="我的分配"
								title="我的分配" class="li-bugAssignByMe" id="bugAssignByMeMenu"
								style=""><a
								href="<%=path%>/assignOthers?bid=${id}&pid=${pid}&currpage=1"><i
									class="fa fa-sign-out"></i> <span class="nav-label">我的分配</span></a><span
								class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span></li>
							<li class="divider"></li>
							<li data-url="noticeAll.html" for="main" alt="项目通知" title="项目通知"
								class="li-noticeAll" id="noticeAllMenu"><a
								href="<%=path%>/showNotice?bid=${id }&pid=${pid}&currpage=1"><i
									class="fa fa-bullhorn"></i> <span class="nav-label">项目通知</span></a><span
								class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span></li>
							<li data-url="testCase.html" for="main" alt="测试用例" title="测试用例"
								class="li-testCase active" id="testCaseMenu"><a
								href="<%=path%>/showTestCase?bid=${id }&pid=${pid}&currpage=1"><i
									class="fa fa-leanpub"></i> <span class="nav-label">测试用例</span></a><span
								class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span></li>
						</ul>
					</div>
					<div class="slimScrollBar"
						style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; left: 1px; height: 590px; background: rgb(0, 0, 0);"></div>
					<div class="slimScrollRail"
						style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; left: 1px; background: rgb(51, 51, 51);"></div>
				</div>
			</nav>
			<!-- nav end -->
			
			<!-- 编辑测试组 -->
<%-- <div class="modal fade myProjectBugTest in" id="myProjectTestGroupEdit"
	tabindex="-1" role="dialog" data-backdrop="static"
	data-keyboard="false">
	<div class="modal-dialog" role="document" style="z-index: 1040">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"><i class="fa fa-remove"></i></span>
				</button>
				<h4>
				
					<i class="fa fa-edit"></i> 编辑测试组
				</h4>
			</div>
			<form class="form-horizontal" id="testCaseModelForm"
							name="testCaseModelForm1" action="javascript:postEditGroup(${editGroupId},$('#groupTitle').val(),$('#groupManager').val())" method="post">
			<div class="modal-body">
						<input name="groupId" type="hidden" value="${editGroupId}">
						<div class="form-group">
							<label class="control-label"style="float: left; width: 90px;">测试组名称</label>
							<div class="col-sm-10">
								<input type="text" value="${editGroupName}" id="groupTitle"
									class="form-control" placeholder="${editGroupName}" name="groupTitle"
									onfocus="checkStrNum(this,200)" oninput="checkStrNum(this,200)"
									onpropertychange="checkStrNum(this,200)">
							</div>
						</div>
					<div class="form-group">
						<label class="control-label"style="float: left; width: 90px;">管理人</label>
						<div class="col-sm-10">
							<select style="cursor: pointer; border-radius: 4px; height: 34px; border: 1px solid #CCCCCC; color: #9A9A9A"class="col-sm-12" tabindex="4" id="groupManager" name="groupManager">
								<c:forEach  items="${memberList}" var="merList">
									<option value="${merList.buser_id}">${merList.buser_name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="modal-footer noborder">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-info noborder" >提交</button>
					</div>
			</div>
			</form>
		</div>
	</div>
</div> --%>
			<!-- main start -->

			<div class="bug-content">
				<div class="slimScrollDiv"
					style="position: relative; overflow: hidden; width: auto; height: 100%;">
					<div class="bug-main" id="main"
						style="overflow: hidden; width: auto; height: 100%;">
						<div class="bugTest animated fadeInRight">
							<h4>测试用例</h4>
							<div class="btn-bug-submit">
								<span class="btn btn-primary w100" data-toggle="modal"
									onclick="showGroup()"><i
									class="fa fa-folder-o"></i> 测试组</span> <span
									class="btn btn-primary w100 addTestCaseBtn" 
									 onclick="addTestCase()" ><i
									class="fa fa-plus-circle"></i> 新建用例</span>
							</div>
							<div class="pd12" id="bugTestFilter">
								<ul class="nav nav-pills">
								<li role="presentation" class="dropdown"><a class="dropdown-toggle">模块： 
										<select class="select" id="showByProduce" name="showByProduce" onchange="showByFilter()">
											<option data-value="全部">全部</option>
											<option data-value="[未指定]">[未指定]</option>
												<c:forEach  items="${produceFilterList}" var="proFilterList">
												<option class="oneProduceName" data-value="${proFilterList.produce_name }">${proFilterList.produce_name }</option>
												</c:forEach>
												<option style="display:none;" class="twoProduceName" data-value="${produceFilter}">${produceFilter }</option>
										</select>
									</a></li>
									<li role="presentation" class="dropdown"><a
										class="dropdown-toggle">测试组： 
										<select class="select" id="showByGroup" name="showByGroup" onchange="showByFilter()">
											<option data-value="全部">全部</option>
											<option data-value="[无]">[无]</option>
												<c:forEach  items="${groupFilterList}" var="groupFList">
												<option class="oneGroupName" data-value="${groupFList.group_name }">${groupFList.group_name }</option>
												</c:forEach>
												<option style="display:none;" class="twoGroupName" data-value="${groupFilter}">${groupFilter }</option>
										</select>
									</a></li>
									<li role="presentation" class="dropdown"><a
										class="dropdown-toggle">重要性： 
										<select class="select" id="showByProp" name="showByProp" onchange="showByFilter()">
												<option data-value="全部">全部</option>
												<option data-value="高">高</option>
												<option data-value="中">中</option>
												<option data-value="低">低</option>
										</select>
									</a></li>
									<li role="presentation" class="dropdown"><a
										class="dropdown-toggle">管理人：
										<select class="select" id="showByManager" name="showByManager" onchange="showByFilter()">
												<option data-value="全部">全部</option>
												<c:forEach  items="${managerFilterList}" var="managerFList">
												<option class="oneManagerName" data-value="${managerFList.manager_name }">${managerFList.manager_name }</option>
												</c:forEach>
												<option style="display:none;" class="twoManagerName" data-value="${managerFilter}">${managerFilter }</option>
										</select>
									</a></li>
									<li role="presentation" class="dropdown"><a class="dropdown-toggle">状态： 
										<select class="select" id="showByState" name="showByState" onchange="showByFilter()">
												<option data-value="全部">全部</option>
												<option data-value="正常">正常</option>
												<option data-value="草稿">草稿</option>
												<option data-value="关闭">关闭</option>
										</select>
									</a></li>
								</ul>
							</div>
							<div class="pd23 pd43">
								<div class="row">
									<div class="pTable">
										<div class="pTable-content customTable">
											<div id="dataTables_wrapper"
												class="dataTables_wrapper form-inline" role="grid">
												<div class="row">
													<div class="col-sm-6"></div>
													<div class="col-sm-6"></div>
												</div>
												<table
													class="table table-hover bugTestTable no-footer dataTable"
													id="dataTables">
													<thead>
														<tr role="row">
															<th style="width: 80px" class="" tabindex="0"
																aria-controls="dataTables" rowspan="1" colspan="1"
																aria-label="编号：激活排序列升序">编号</th>
															<th class="sorting_disabled" rowspan="1" colspan="1"
																aria-label="标题 共3条记录">标题 <span id="allCount">共${numTestCase}条记录</span></th>
															<th style="width: 60px" class="sorting"
																rowspan="1" colspan="1" aria-label="状态">状态</th>
															<th style="width: 60px" class="center sorting"
																tabindex="0" aria-controls="dataTables" rowspan="1"
																colspan="1" aria-label="重要性：激活排序列升序">重要性</th>
															<th style="width: 120px" class="sorting_disabled"
																rowspan="1" colspan="1" aria-label="管理人">管理人</th>
															<th style="width: 125px;" class="sorting" tabindex="0"
																aria-controls="dataTables" rowspan="1" colspan="1"
																aria-label="创建时间：激活排序列升序">创建时间</th>
															<th style="width: 125px;" class="sorting_desc"
																tabindex="0" aria-controls="dataTables" rowspan="1"
																colspan="1" aria-label="修改时间：激活排序列升序"
																aria-sort="descending">修改时间</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${testCaseList}" var="tcaseList" varStatus="status">
															<tr class="odd"
																onclick="showOneTestCase(${tcaseList.case_id})">
																<td class=" ">${status.index+1 }</td>
																<td class=" "><span class="testCaseTestGroup"
																	alt="测试组" title="测试组">${tcaseList.group_name }</span>${tcaseList.case_title }</a></td>
																<td class=" "><span class="label label-success">${tcaseList.case_state }</span></td>
																<td class=" center"><span
																	class="label label-warning">${tcaseList.prop_name }</span></td>
																<td class=" ">${tcaseList.manager_name }</td>
																<td class=" ">${fn:substring(tcaseList.case_create_date,0,16) }</td>
																<td class="sorting_1">${fn:substring(tcaseList.case_update_date,0,16) }</td>
															</tr>
														</c:forEach>
														<!-- <tr class="even">
															<td class=" ">5</td>
															<td class=" "><span class="testCaseTestGroup" alt="测试组" title="测试组">啪啪啪啪啪啪 </span>KKKKK</td>
															<td class=" "><span class="label label-success">正常</span></td>
															<td class=" center"><span class="label label-warning">高</span></td>
															<td class=" ">呜呜</td>
															<td class=" ">5分钟前</td>
															<td class="sorting_1">5分钟前</td>
														</tr>-->

													</tbody>
												</table>
											</div>
										</div>
									</div>
									<ul class="pager">
		<li><a href="javascript:changePage(1)">首页</a></li>
		<li> <a href="javascript:changePage(${currpage-1})">上一页</a></li>
		<li><a href="javascript:changePage(${currpage+1})">下一页</a></li>
		<li><a href="javascript:changePage(${pagecount})">尾页</a></li>
		<li>共有${numTestCase}条记录，当前第${currpage}页/共${pagecount}页</li>
	</ul>		
								</div>
							</div>
						</div>
					</div>
					<div class="slimScrollBar"
						style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px; height: 176.282px;"></div>
					<div class="slimScrollRail"
						style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.9; z-index: 90; right: 1px;"></div>
				</div>
			</div>
			<!-- main end -->
		</div>
		<!-- bugTestModel start -->
		<!-- 提交测试用例 -->
		<div id="showAddTestCaseModal"></div>
		<!-- 测试组 -->
		<div id="showGroupInfo"></div>
		<!-- 添加测试组 -->
		<div id="groupAddModal"></div>
		
		<!-- 修改测试组信息 -->
		<!-- <div id="groupModalInfo"></div> -->
		<div class="modal fade myProjectBugTest in" id="myProjectTestGroupEdit" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
			<div class="modal-dialog" role="document" style="z-index: 1040">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
						<h4><i class="fa fa-edit"></i> 编辑测试组</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="testGroupEditForm" name="testGroupEditForm">
							<div class="form-group">
								<label class="control-label"style="float: left; width: 90px;">测试组名称</label>
								<div class="col-sm-10">
									<input type="text"  id="testgroup"  style="cursor:pointer; border-radius: 4px;height: 34px;border:1px solid #CCCCCC;color: #9A9A9A" class="col-sm-12" tabindex="4">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label"style="float: left; width: 90px;">管理人</label>
								<div class="col-sm-10">
									<select style="cursor:pointer; border-radius: 4px;height: 34px;border:1px solid #CCCCCC;color: #9A9A9A" class="col-sm-12" tabindex="4" id="groupManager">
										<c:forEach  items="${memberList}" var="merList">
									<option value="${merList.buser_id}">${merList.buser_name}</option>
								</c:forEach>
									</select>
								</div>
							</div>
							<div class="modal-footer noborder">
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								<button type="button" class="btn btn-info noborder"   onclick="subCase();">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 删除测试组 -->
		<div id="groupDeleteModal"></div>
		<!-- bugTestModel end -->
		<div class="floatBugInfo"></div>
		<!--  -->

		<script type="text/javascript"	src="<%=path%>/css/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>

</html>