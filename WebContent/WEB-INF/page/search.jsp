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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
	href="<%=path%>/css/fullcalendar-1.6.1/fullcalendar/fullcalendar.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/fullcalendar-1.6.1/fullcalendar/fullcalendar.print.css">
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
<script src="<%=path%>/js/ajaxfileupload.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8" async
	data-requirecontext="_" data-requiremodule="xml"
	src="<%=path%>/js/xml.js"></script>
<script type="text/javascript" charset="utf-8" async
	data-requirecontext="_" data-requiremodule="validate"
	src="<%=path%>/js/validate.js"></script>
<script type="text/javascript" charset="utf-8" async
	data-requirecontext="_" data-requiremodule="session"
	src="<%=path%>/js/session.js"></script>
<script type="text/javascript" charset="utf-8" async
	data-requirecontext="_" data-requiremodule="services"
	src="<%=path%>/js/services.js"></script>
<script type="text/javascript" charset="utf-8" async
	data-requirecontext="_" data-requiremodule="dropkick"
	src="<%=path%>/js/jquery.dropkick-1.0.0.js"></script>
<script type="text/javascript" charset="utf-8" async
	data-requirecontext="_" data-requiremodule="slimScroll"
	src="<%=path%>/js/jquery.slimscroll.min.1.3.8.js"></script>
<script type="text/javascript" charset="utf-8" async
	data-requirecontext="_" data-requiremodule="metisMenu"
	src="<%=path%>/js/jquery.metisMenu.js"></script>
<script type="text/javascript" charset="utf-8" async
	data-requirecontext="_" data-requiremodule="bug"
	src="<%=path%>/js/bug.js"></script>
<script type="text/javascript" charset="utf-8" async
	data-requirecontext="_" data-requiremodule="logout"
	src="<%=path%>/js/logout.js"></script>
<script type="text/javascript" charset="utf-8" async
	data-requirecontext="_" data-requiremodule="utils"
	src="<%=path%>/js/utils.js"></script>
<script type="text/javascript" charset="utf-8" async
	data-requirecontext="_" data-requiremodule="bugTestData"
	src="<%=path%>/js/bugTestData.js"></script>
<script type="text/javascript" charset="utf-8" async
	data-requirecontext="_" data-requiremodule="TimeObjectUtil"
	src="<%=path%>/js/TimeObjectUtil.js"></script>
<script type="text/javascript" charset="utf-8" async
	data-requirecontext="_" data-requiremodule="setting"
	src="<%=path%>/js/setting.js"></script>
<script type="text/javascript" charset="utf-8" async
	data-requirecontext="_" data-requiremodule="upload"
	src="<%=path%>/js/upload.js"></script>
<script type="text/javascript" charset="utf-8" async
	data-requirecontext="_" data-requiremodule="gridly"
	src="<%=path%>/js/jquery.gridly.js"></script>
<script type="text/javascript" charset="utf-8" async
	data-requirecontext="_" data-requiremodule="qrcode"
	src="<%=path%>/js/jquery.qrcode.min.js"></script>
<link rel="stylesheet" href="<%=path%>/css/layer.ext.css"
	id="layui_layer_skinlayerextcss">
<script src="<%=path%>/js/ajaxfileupload.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8" async
	data-requirecontext="_" data-requiremodule="echarts"
	src="<%=path%>/js/echarts.common.min.js"></script>



<script type="text/javascript">

function tobug(a){

	 $.post("<%=path%>/tobug",{
		"pid":"${pid}",
		"bug_id":a,
		 "bid":"${id}"
			},function(map){	
				window.location.href="<%=path%>/common/bugDetails";
		});
}

function produce() {
	 
	 $.post("<%=path%>/selectProduce",{
		"produce_id":"${pid}"
			},function(listpro){
				var option="";
				var jsonlist = eval(listpro);
				for(var i  in jsonlist){					
					option = option + "<option value='"+jsonlist[i].produce_name+"'>"+jsonlist[i].produce_name+"</option>";
				}
				$("#bugProduct").html(option);
	}); 
}


function meber() {

	 $.post("<%=path%>/toMember", {
			"pid" : "${pid}"
		}, function(listmember) {
			var jsonlist = eval(listmember);
			var option = "";
			for ( var i in jsonlist) {
				option = option + "<option value='"+jsonlist[i].buser_name+"'>"
						+ jsonlist[i].buser_name + "</option>";
			}
			$("#bugFixToSelect").html(option);
		});
	}

function updateName() {
	var fastKeyword = $("#fastKeyword").val();
	 $.post("<%=path%>/search",{
		"pid":"${pid}",
		"currpage":"1",
		"content":fastKeyword
			},function(map){	
			//	alert(map.result);
				window.location.href="<%=path%>/common/search";
		});
}




	function ajaxFileUpload() {
		$.ajaxFileUpload({
			url : 'pic/upload', //需要链接到服务器地址
			secureuri : false,
			fileElementId : 'uploadFile', //文件选择框的id属性
			dataType : 'json', //服务器返回的格式，可以是json, xml
			success : function(result) //相当于java中try语句块的用法
			{
				var a = $('#result').val(result.result);
			},
			error : function(data, status, e) //相当于java中catch语句块的用法
			{
				$('#result').html('添加失败');
			}
		}

		);

	}
</script>
<script>
	$(function() {
		produce();
		meber();

	});
</script>
</head>

<body class="apps done fixed-sidebar modal-open-v">
	<header class="site-header">
		<div class="wrapper-header-left-bg"></div>
		<div class="wrapper-header">
			<span class="name"> <img src="<%=path%>/img/logozxi.png"height="33px"></span>
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
									class="input-group-btn"><button class="btn btn-default"  onclick="javascript:updateName();"
										type="button">
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
									<span class="username-txt textOverHiden" >${a.BUSER_NAME}</span>
								</c:forEach>
							</div>
							<div class="user-setting">
								<div class="userSetFace">
									<span class="face"> <img class="face" src="<%=path %>/img/null.png"
										data-src="<%=path%>/img/head_default.png"
										style="background: url(<%=path%>/img/head_default.png) 50% 50% / cover no-repeat;">
										<span class="changeBj"></span> <span class="changeTxt"
										data-toggle="modal" data-target="#myProfileHeadImageModal">修改头像</span>
									</span> <span class="email textOverHiden" alt="2934885386@qq.com"
										title="2934885386@qq.com">${flag.buser_email}</span>

								</div>
						</span>
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
							style="background: url(img/app-default.jpg) center center/contain no-repeat;">
							<img src="<%=path %>/img/app-default.jpg" id="projectImg" border="0">
							<span class="bg"></span><a href=""><span class="btn"><i
									class="fa fa-refresh"></i><br>刷新项目</span></a>
						</p>
					</div>
					<div class="sidebar-menus-icon">
						<span class="fa fa-navicon" title="展开" alt="展开"></span>
					</div>
										<ul class="nav side-menu" id="side-menu">
								<li class="divider"></li>
								<li class="li-projectInfo" data-url="" for="main" alt="项目概况" title="项目概况" id="projectInfoMenu">
									<a href="<%=path%>/bugInfo?bid=${id}&pid=${pid}"><i class="fa fa-sitemap"></i> <span class="nav-label">项目概况</span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
								</li>
								
								<li data-url="" for="main" alt="活动BUG" title="活动BUG" id="bugActiveMenu">
									<a href="<%=path%>/Programactive?bid=${id}&pid=${pid}&currpage=1"><i class="fa fa-clock-o"></i> <span class="nav-label">活动BUG <sup class="badge bgDefault" id="bugsActive">${num}</sup></span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
								</li>
								
								<li data-url="" for="main" alt="所有BUG" title="所有BUG" class="li-bugAll active" id="bugAllMenu">
									<a href="<%=path%>/allBug?bid=${id}&pid=${pid}&currpage=1"><i 	class="fa fa-bug"></i> <span class="nav-label">所有BUG</span></a>
									<span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span></li>
								<li data-url="" for="main" alt="BUG统计" title="BUG统计" id="bugStatMenu" class="li-countAll" style="display: none;">
									<a href="countAll.html"><i class="fa fa-pie-chart"></i> <span class="nav-label">BUG统计</span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
								</li>
								<li class="divider"></li>
								<li data-url="bugAssignToMe.html" for="main" alt="我的待办" title="我的待办" class="li-bugAssignToMe" id="bugAssignToMeMenu">
									<a href="<%=path%>/needToDo?bid=${id}&pid=${pid}&currpage=1"><i class="fa fa-flask"></i> <span class="nav-label">我的待办 <sup class="badge bgYellow" id="bugsAssignToMe">${countNeedToDo }</sup></span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
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
				<div class="slimScrollBar"
					style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; left: 1px; height: 704px; background: rgb(0, 0, 0);"></div>
				<div class="slimScrollRail"
					style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; left: 1px; background: rgb(51, 51, 51);"></div>
			</div>
		</nav>
		<!-- nav end -->
		<!-- main start -->
		<div class="bug-content">
			<div class="slimScrollDiv"
				style="position: relative; overflow: hidden; width: auto; height: 100%;">
				<div class="bug-main" id="main"
					style="overflow: hidden; width: auto; height: 100%;">
					<div class="bugAll animated fadeInRight">
						<h4>所有BUG</h4>
						<div class="btn-bug-submit btn-canSubmitBug"
							style="display: inline-block;">
							<span class="btn btn-primary w100" data-toggle="modal"
								data-target="#myProjectBugModal" id="submitBugBtn"><i
								class="fa fa-plus-circle"></i> 提交BUG</span>
						</div>
						<div class="pd12" id="bugFilter">
							<ul class="nav nav-pills">
								<li role="presentation" class="dropdown"><a
									class="dropdown-toggle" data-toggle="dropdown"
									href="bugAll.html#" role="button" aria-haspopup="true"
									aria-expanded="false">BUG类型：全部 <span class="caret"></span></a>
									<ul class="dropdown-menu bugType-dropdown-menu">
										<li><a href="javascript:void(0)" data-value="">全部</a></li>
										<li><a href="javascript:void(0)" data-value="Bug">缺陷</a>
										</li>
										<li><a href="javascript:void(0)" data-value="Task">任务</a>
										</li>
										<li><a href="javascript:void(0)" data-value="Require">需求</a>
										</li>
									</ul></li>
								<li role="presentation" class="dropdown"><a
									class="dropdown-toggle" data-toggle="dropdown"
									href="bugAll.html#" role="button" aria-haspopup="true"
									aria-expanded="false">状态：全部 <span class="caret"></span></a>
									<ul class="dropdown-menu states-dropdown-menu">
										<li><a href="javascript:void(0)" data-value="">全部</a></li>
										<li><a href="javascript:void(0)" data-value="Active">全部活动</a>
										</li>
										<li><a href="javascript:void(0)" data-value="Open">未解决</a>
										</li>
										<li><a href="javascript:void(0)" data-value="Fixed">待审核</a>
										</li>
										<li><a href="javascript:void(0)" data-value="Rejected">已拒绝</a>
										</li>
										<li><a href="javascript:void(0)" data-value="Resolved">已解决</a>
										</li>
										<li><a href="javascript:void(0)" data-value="Closed">已关闭</a>
										</li>
										<li><a href="javascript:void(0)" data-value="Postponed">已延期</a>
										</li>
									</ul></li>
								<li role="presentation" class="dropdown"><a
									class="dropdown-toggle" data-toggle="dropdown"
									href="bugAll.html#" role="button" aria-haspopup="true"
									aria-expanded="false">优先级：全部 <span class="caret"></span></a>
									<ul class="dropdown-menu priorities-dropdown-menu">
										<li><a href="javascript:void(0)" data-value="">全部</a></li>
										<li><a href="javascript:void(0)" data-value="Urgent">急</a>
										</li>
										<li><a href="javascript:void(0)" data-value="High">高</a>
										</li>
										<li><a href="javascript:void(0)" data-value="Medium">中</a>
										</li>
										<li><a href="javascript:void(0)" data-value="Low">低</a></li>
									</ul></li>
								<li role="presentation" class="dropdown"><a
									class="dropdown-toggle textOverHiden" data-toggle="dropdown"
									href="bugAll.html#" role="button" aria-haspopup="true"
									aria-expanded="false">处理人：全部 <span class="caret"></span></a>
									<ul class="dropdown-menu fixed-dropdown-menu">
										<li><a href="javascript:void(0)" data-value="">全部</a></li>
										<li data-id="0"><a href="javascript:void(0)"
											data-value="0">[未指定]</a></li>
										<li data-id="46604"><span>ww</span> <a
											href="javascript:void(0)" data-value="46604">呜呜</a></li>
									</ul></li>
								<li role="presentation" class="dropdown"><a
									class="dropdown-toggle textOverHiden" data-toggle="dropdown"
									href="bugAll.html#" role="button" aria-haspopup="true"
									aria-expanded="false">分配人：全部 <span class="caret"></span></a>
									<ul class="dropdown-menu assignedBy-dropdown-menu">
										<li><a href="javascript:void(0)" data-value="">全部</a></li>
										<li data-id="46604"><span>ww</span> <a
											href="javascript:void(0)" data-value="46604">呜呜</a></li>
									</ul></li>
								<li role="presentation" class="dropdown"><a
									class="dropdown-toggle textOverHiden" data-toggle="dropdown"
									href="bugAll.html#" role="button" aria-haspopup="true"
									aria-expanded="false">创建人：全部 <span class="caret"></span></a>
									<ul class="dropdown-menu createdById-dropdown-menu">
										<li><a href="javascript:void(0)" data-value="">全部</a></li>
										<li data-id="46604"><span>ww</span> <a
											href="javascript:void(0)" data-value="46604">呜呜</a></li>
									</ul></li>
								<li role="presentation" class="dropdown bugFilter-li-tags"
									style="display: none"><a
									class="dropdown-toggle textOverHiden" data-toggle="dropdown"
									href="bugAll.html#" role="button" aria-haspopup="true"
									aria-expanded="false">标签：全部 <span class="caret"></span></a>
									<ul class="dropdown-menu tags-dropdown-menu">
										<li><a href="javascript:void(0)" data-value="">全部</a></li>
									</ul></li>
							
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
											<table class="table table-hover bugTable dataTable no-footer"
												id="dataTables">
												<thead>
													<tr role="row">
														<th style="width: 1px" class="sorting_disabled"
															rowspan="1" colspan="1" aria-label=""></th>
														<th style="width: 50px" class="" tabindex="0"
															aria-controls="dataTables" rowspan="1" colspan="1"
															aria-label="编号：激活排序列升序">编号</th>
														<th style="width: 50px" class="sorting" tabindex="0"
															aria-controls="dataTables" rowspan="1" colspan="1"
															aria-label="类型：激活排序列升序">类型</th>
														<th class="sorting_disabled" rowspan="1" colspan="1"
															aria-label="标题 共2条记录">标题 <span id="allCount">共${allnum }条记录</span></th>
														<th style="width: 85px" class="sorting" tabindex="0"
															aria-controls="dataTables" rowspan="1" colspan="1"
															aria-label="状态：激活排序列升序">状态</th>
														<th style="width: 60px" class="sorting" tabindex="0"
															aria-controls="dataTables" rowspan="1" colspan="1"
															aria-label="优先级：激活排序列升序">优先级</th>
														<th style="width: 120px" class="sorting_disabled"
															rowspan="1" colspan="1" aria-label="处理人">处理人</th>
														<th style="width: 80px" class="sorting_disabled"
															rowspan="1" colspan="1" aria-label="分配人">分配人</th>
														<th style="width: 125px;" class="center sorting"
															tabindex="0" aria-controls="dataTables" rowspan="1"
															colspan="1" aria-label="创建时间：激活排序列升序">创建时间</th>
														<th style="width: 125px;" class="center sorting_desc"
															tabindex="0" aria-controls="dataTables" rowspan="1"
															colspan="1" aria-sort="descending"
															aria-label="修改时间：激活排序列升序">修改时间</th>
													</tr>
												</thead>

												<tbody>
													<c:forEach items="${allbug}" var="a" varStatus="status">
														<tr class="odd"  onclick="tobug(${a.bug_id});">
															<td class=" "><span class="fa"></span></td>
															<td class=" ">${status.index+1 }</td>
															<td class=" "><span class="label"
																style="padding: .3em .6em .3em; color: #fff; background: #d9534f">${a.bug_type }</span></td>
															<td class=" "><span class="defaultColor" alt="产品"
																title="产品"> </span> ${a.bug_title}</td>
															<td class=" "><span class="label label-danger">${a.bug_state }</span></td>
															<td class=" "><span class="label label-primary">${a.bug_prop }</span></td>
															<td class=" ">${a.bug_maker }</td>
															<td class=" ">${a.bug_signer}</td>
															<td class=" center">${fn:substring(a.bug_create_date,0,16)}</td>
															<td class="center ">${fn:substring(a.bug_repair_date,0,16)}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<ul class="pager">
									<li><a
										href="<%=path%>/search?bid=${id}&pid=${pid}&currpage=1&content=${content}">首页</a></li>
									<li><a
										href="<%=path%>/search?bid=${id}&pid=${pid}&currpage=${currpage-1}&content=${content}">上一页</a></li>
									<li><a
										href="<%=path%>/search?bid=${id}&pid=${pid}&currpage=${currpage+1}&content=${content}">下一页</a></li>
									<li><a
										href="<%=path%>/search?bid=${id}&pid=${pid}&currpage=${pagecount}&content=${content}">尾页</a></li>
									<li>共有${allnum}条记录，当前第${currpage}页/共${pagecount}页</li>
								</ul>
							</div>
						</div>
					</div>

					<script type="text/javascript">
						requirejs([ 'bug' ], function(bug) {
							bug.bugAll();
						});
					</script>

				</div>
				<div class="slimScrollBar"
					style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 669px; background: rgb(0, 0, 0);"></div>
				<div class="slimScrollRail"
					style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
			</div>
		</div>
		<!-- main end -->
	</div>
	<!-- bugModel start -->
	<div class="bugModelDiv" id="bugModelDiv">
		<!--                        提交bug                        -->
		<div class="modal fade myProjectBugModal" id="myProjectBugModal"
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
							<i class="fa fa-plus-circle"></i> 新建BUG
						</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="bugModelForm"
							name="bugModelForm"
							action="<%=path%>/toAddBug?bid=${id}&pid=${pid}"
							enctype="multipart/form-data" method="post">
							<div class="tabBug">
								<ul class="nav nav-tabs" role="tablist">
									<li role="presentation" class="active" style="width: 50%;">
										<a href="work.html#tabBugInfo" aria-controls="tabBugInfo"
										role="tab" data-toggle="tab">信息与描述</a>
									</li>
									<li role="presentation" style="width: 50%;"><a
										href="work.html#tabBugPlan" aria-controls="tabBugPlan"
										role="tab" data-toggle="tab">人员与计划</a></li>
								</ul>
								<div class="tab-content">
									<div role="tabpanel" class="tab-pane active" id="tabBugInfo">
										<div class="form-group">
											<div class="col-sm-7 pd0">
												<label class="col-sm-3 control-label pdProduct">模块</label>
												<div class="col-sm-9 pdSelect">
													<select
														style="cursor: pointer; border-radius: 4px; height: 30px; border: 1px solid #CCCCCC; color: #9A9A9A;"
														class="col-sm-12" tabindex="4" id="bugProduct"
														name="module">

													</select>
												</div>
											</div>
											<div class="col-sm-5 pd0">
												<label class="col-sm-5 control-label">BUG类型</label>

												<div class="col-sm-7">
													<select
														style="cursor: pointer; border-radius: 4px; height: 30px; border: 1px solid #CCCCCC; color: #9A9A9A;"
														class="col-sm-12" tabindex="4" class="bugType"
														id="bugType" name="type">
														<option value="缺陷">缺陷</option>
														<option value="任务">任务</option>
														<option value="需求">需求</option>
													</select>
												</div>
											</div>
										</div>
										<!--  									<div class="form-group" id="bugModuleDiv">
												<label class="col-sm-2 control-label">模块</label>
												<div class="col-sm-10 relative bvs productModuleSelectDiv">
													<div class="customDropkick" style="width: 100%">
														<select class="col-sm-12" style="cursor:pointer; border-radius: 4px;height: 30px;border:1px solid #CCCCCC;color: #9A9A9A;" tabindex="2" id="bugModuleSelect">
															<option value="addModule">[添加模块]</option>
															<option value="addModule">呜呜</option>
														</select>
													</div>
												</div>
											</div>
	-->
										<div class="form-group">
											<label class="col-sm-2 control-label">标题</label>
											<div class="col-sm-10">
												<input type="text" class="form-control"
													placeholder="最多输入200个字符" name="title"
													onfocus="checkStrNum(this,200)"
													oninput="checkStrNum(this,200)"
													onpropertychange="checkStrNum(this,200)" name="bug_title">
											</div>
										</div>
										<!--  										<div id="bugSubmitVersionDiv">
												<div class="form-group" id="bugVersionDiv">
													<label class="col-sm-2 control-label">影响版本</label>
													<div class="col-sm-10 relative bvs">
														<select class="col-sm-12" style="cursor:pointer; border-radius: 4px;height: 30px;border:1px solid #CCCCCC;color: #9A9A9A;" tabindex="2" id="bugModuleSelect">
															<option value="addModule">[暂无版本]</option>
														</select>
													</div>
												</div>
											</div>
		-->

										<div class="form-group" id="bugEnvironmentDiv">
											<label class="col-sm-2 control-label">环境</label>
											<div class="col-sm-10">
												<input type="text" class="form-control"
													placeholder="最多输入100个字符" name="environment"
													onfocus="checkStrNum(this,100)"
													oninput="checkStrNum(this,100)"
													onpropertychange="checkStrNum(this,100)" name="environment">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">描述<br></label>
											<div class="col-sm-10 relative">
												<textarea class="form-control textarea" rows="5"
													name="bug_describe" placeholder="最多输入2000个字符"
													onfocus="checkStrNum(this,2000)"
													oninput="checkStrNum(this,2000)"
													onpropertychange="checkStrNum(this,2000)"></textarea>
												<div class="dragDescriptionDiv"></div>

											</div>
										</div>
									</div>
									<div role="tabpanel" class="tab-pane" id="tabBugPlan">
										<div class="form-group">
											<div class="col-sm-6 pd0">
												<label class="col-sm-4 control-label">指派给</label>
												<div class="col-sm-8">
													<select class="col-sm-12" tabindex="4" id="bugFixToSelect"
														style="cursor: pointer; border-radius: 4px; height: 30px; border: 1px solid #CCCCCC; color: #9A9A9A;"
														name="handler">
														<option value="0" selected="">[未指定]</option>
														<option value="46604">呜呜</option>
													</select>
												</div>
											</div>
											<div class="col-sm-6 pd0">
												<label class="col-sm-3 control-label pd20">优先级</label>
												<div class="col-sm-9">
													<input type="radio" name="priority" value="急"
														style="cursor: pointer; width: 24px; height: 18px;" /> 急
													<input type="radio" name="priority" value="高"
														style="cursor: pointer; width: 24px; height: 18px;" /> 高
													<input type="radio" checked="" name="priority" value="中"
														style="cursor: pointer; width: 24px; height: 18px;" /> 中
													<input type="radio" name="priority" value="低"
														style="cursor: pointer; width: 24px; height: 18px;" /> 低
												</div>
											</div>
										</div>
										<div class="form-group" id="bugPlanDateDiv">
											<label class="col-sm-2 control-label">计划日期</label>
											<div class="col-sm-10 planDate">
												<div class="input-daterange input-group col-sm-9">
													<input
														style="border-radius: 4px; cursor: pointer; border: 1px solid #CCCCCC;"
														name="plan" class="col-sm-5" type="date" value="" /> <span
														class="col-sm-1">到</span> <input
														style="border-radius: 4px; cursor: pointer; border: 1px solid #CCCCCC;"
														name=" last" class="col-sm-5" type="date" value="" />
												</div>
											</div>

											<div role=" tabpanel" class="tab-pane" id="tabBugTags">
												<div class="bugTagsList"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer noborder">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
								<button type="submit" class="btn btn-info noborder">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 可修改bug -->
		<div class="modal fade myProjectBugModal" id="myProjectBugEditModal"
			tabindex="-3" role="dialog" data-backdrop="static"
			data-keyboard="false">
			<div class="modal-dialog" role="document" style="z-index: 1040">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"><i class="fa fa-remove"></i></span>
						</button>
						<button type="button" class="close modalExpand">
							<span><i class="fa fa-expand"></i></span>
						</button>
						<h4>
							<i class="fa fa-edit"></i> 修改BUG
						</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="bugEditModelForm"
							name="bugEditModelForm">
							<div class="editTabBug">
								<ul class="nav nav-tabs" role="tablist">
									<li role="presentation" id="tabs-li-editBugInfo" class="active"
										style="width: 50%;"><a href="bugAll.html#tabEditBugInfo"
										aria-controls="tabEditBugInfo" role="tab" data-toggle="tab">信息与描述</a>
									</li>
									<li role="presentation" style="width: 50%;"><a
										href="bugAll.html#tabEditBugPlan"
										aria-controls="tabEditBugPlan" role="tab" data-toggle="tab">人员与计划</a>
									</li>
									<li role="presentation" id="tabs-li-editTags"
										style="display: none; width: 50%;"><a
										href="bugAll.html#tabEditBugTags"
										aria-controls="tabEditBugTags" role="tab" data-toggle="tab">标签</a>
									</li>
								</ul>
								<div class="tab-content">
									<div role="tabpanel" class="tab-pane active"
										id="tabEditBugInfo">
										<div class="form-group">
											<div class="col-sm-7 pd0">
												<label class="col-sm-3 control-label pdProduct">产品</label>
												<div class="col-sm-9 pdSelect">
													<div class="customDropkick" style="width: 100%">
														<div class="dk_container  dk_shown dk_theme_default"
															id="dk_container_bugEditProduct" tabindex="4">
															<a class="dk_toggle"><span class="dk_label">[未指定]</span><span
																class="select-icon"><i class="fa fa-caret-down"></i></span></a>
															<div class="dk_options">
																<div class="slimScrollDiv"
																	style="position: relative; overflow: hidden; width: auto; height: 100%;">
																	<ul class="dk_options_inner"
																		style="overflow: hidden; width: auto; height: 100%;">
																		<li class="dk_option_current"><a
																			data-dk-dropdown-value="0">[未指定]</a></li>
																	</ul>
																	<div class="slimScrollBar"
																		style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; background: rgb(0, 0, 0);"></div>
																	<div class="slimScrollRail"
																		style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
																</div>
															</div>
														</div>
														<select style="visibility: hidden; display: none;"
															tabindex="4" id="bugEditProduct">
															<option value="0" selected="">[未指定]</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-sm-5 pd0">
												<label class="col-sm-5 control-label">BUG类型</label>
												<div class="col-sm-7">
													<div class="customDropkick" style="width: 100%">
														<select style="visibility: hidden" tabindex="4"
															class="bugType" id="editBugType">
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="form-group" id="editBugModuleDiv">
											<label class="col-sm-2 control-label">模块</label>
											<div class="col-sm-10 relative bvs">
												<div class="inputModule">
													<input type="text" class="form-control"
														placeholder="最多输入50个字符" name="module" id="bugEditModule"
														onfocus="checkStrNum(this,50)"
														oninput="checkStrNum(this,50)"
														onpropertychange="checkStrNum(this,50)">
												</div>
												<div class="customDropkick" style="width: 100%">
													<div class="dk_container  dk_shown dk_theme_default"
														id="dk_container_bugEditModuleSelect" tabindex="2">
														<a class="dk_toggle"><span class="dk_label">[添加模块]</span><span
															class="select-icon"><i class="fa fa-caret-down"></i></span></a>
														<div class="dk_options">
															<div class="slimScrollDiv"
																style="position: relative; overflow: hidden; width: auto; height: 100%;">
																<ul class="dk_options_inner"
																	style="overflow: hidden; width: auto; height: 100%;">
																	<li class="dk_option_current"><a
																		data-dk-dropdown-value="addModule">[添加模块]</a></li>
																</ul>
																<div class="slimScrollBar"
																	style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; background: rgb(0, 0, 0);"></div>
																<div class="slimScrollRail"
																	style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
															</div>
														</div>
													</div>
													<select style="visibility: hidden; display: none;"
														tabindex="2" id="bugEditModuleSelect">
														<option value="addModule">[添加模块]</option>
														<option value="">[暂无模块]</option>
													</select>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">标题</label>
											<div class="col-sm-10">
												<input type="text" class="form-control"
													placeholder="最多输入200个字符" name="title"
													onfocus="checkStrNum(this,200)"
													oninput="checkStrNum(this,200)"
													onpropertychange="checkStrNum(this,200)">
											</div>
										</div>
										<div id="bugEditSubmitVersionDiv">
											<div class="form-group" id="editBugVersionDiv">
												<label class="col-sm-2 control-label">影响版本</label>
												<div class="col-sm-10 relative bvs">
													<div class="inputVersion">
														<input type="text" class="form-control"
															placeholder="最多输入50个字符" name="version"
															id="bugEditVersion" onfocus="checkStrNum(this,50)"
															oninput="checkStrNum(this,50)"
															onpropertychange="checkStrNum(this,50)">
													</div>
													<div class="customDropkick" style="width: 100%">
														<div class="dk_container  dk_shown dk_theme_default"
															id="dk_container_bugEditVersionSelect" tabindex="2">
															<a class="dk_toggle"><span class="dk_label">[暂无版本]</span><span
																class="select-icon"><i class="fa fa-caret-down"></i></span></a>
															<div class="dk_options">
																<div class="slimScrollDiv"
																	style="position: relative; overflow: hidden; width: auto; height: 100%;">
																	<ul class="dk_options_inner"
																		style="overflow: hidden; width: auto; height: 100%;">
																		<li class="dk_option_current"><a
																			data-dk-dropdown-value="">[暂无版本]</a></li>
																	</ul>
																	<div class="slimScrollBar"
																		style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; background: rgb(0, 0, 0);"></div>
																	<div class="slimScrollRail"
																		style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
																</div>
															</div>
														</div>
														<select style="visibility: hidden; display: none;"
															tabindex="2" id="bugEditVersionSelect">
															<option value="">[暂无版本]</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="form-group" id="editBugEnvironmentDiv">
											<label class="col-sm-2 control-label">环境</label>
											<div class="col-sm-10">
												<input type="text" class="form-control"
													placeholder="最多输入100个字符" name="environment"
													onfocus="checkStrNum(this,100)"
													oninput="checkStrNum(this,100)"
													onpropertychange="checkStrNum(this,100)">
											</div>
										</div>
										<div class="form-group editBugDesc">
											<label class="col-sm-2 control-label">描述<br></label>
											<div class="col-sm-10 relative">
												<textarea class="form-control textarea" rows="5"
													name="description" placeholder="最多输入2000个字符"
													onfocus="checkStrNum(this,2000)"
													oninput="checkStrNum(this,2000)"
													onpropertychange="checkStrNum(this,2000)"></textarea>
												<div class="dragEditDescriptionDiv"></div>
											</div>
										</div>
									</div>
									<div role="tabpanel" class="tab-pane" id="tabEditBugPlan">
										<div class="form-group">
											<div class="col-sm-6 pd0" id="editBugAssignDiv">
												<label class="col-sm-4 control-label">指派给</label>
												<div class="col-sm-8">
													<div class="customDropkick" style="width: 100%"
														id="bugEditFixTo"></div>
												</div>
											</div>
											<div class="col-sm-6 pd0" id="editBugPriorityDiv">
												<label class="col-sm-3 control-label pd20">优先级</label>
												<div class="col-sm-9 pd11 editBug">
													<label class="priority" data-value="Urgent"> <span
														class=""><i class="fa fa-circle-o"></i></span> 急
													</label> <label class="priority" data-value="High"> <span
														class=""><i class="fa fa-circle-o"></i></span> 高
													</label> <label class="priority" data-value="Medium"> <span
														class=""><i class="fa fa-circle-o"></i></span> 中
													</label> <label class="priority" data-value="Low"> <span
														class=""><i class="fa fa-circle-o"></i></span> 低
													</label>
												</div>
											</div>
										</div>
										<div class="form-group" id="editBugPlanDateDiv">
											<label class="col-sm-2 control-label">计划日期</label>
											<div class="col-sm-10 planDate">
												<div class="input-daterange input-group col-sm-9">
													<input type="text"
														class="input-sm form-control planDate_begin"
														id="editPlanDate_begin" value=""> <span
														class="input-group-addon">到</span> <input type="text"
														class="input-sm form-control planDate_end"
														id="editPlanDate_end" value="">
												</div>
											</div>
										</div>
										<div class="form-group" id="editBugEvaDiv"
											style="display: none;">
											<div class="col-sm-6 pd0">
												<label class="col-sm-4 control-label">工作量</label>
												<div class="col-sm-8 relative">
													<div class="input-group bugWorkloadDiv">
														<span class="input-group-addon subNumberValue"><i
															class="fa fa-minus"></i></span> <input type="number"
															class="form-control" name="workload" max="100" min="0"
															placeholder="输入0-100"> <span
															class="input-group-addon addNumberValue"><i
															class="fa fa-plus"></i></span>
													</div>
													<span class="bugEvaDivHour">小时</span>
												</div>
											</div>
											<div class="col-sm-6 pd0">
												<label class="col-sm-3 control-label pd20">价值</label>
												<div class="col-sm-9">
													<div class="input-group bugValueDiv">
														<span class="input-group-addon subNumberValue"><i
															class="fa fa-minus"></i></span> <input type="number"
															class="form-control" name="value" max="10" min="0"
															placeholder="输入0-10"> <span
															class="input-group-addon addNumberValue"><i
															class="fa fa-plus"></i></span>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div role="tabpanel" class="tab-pane" id="tabEditBugTags">
										<div class="editBugTagsList"></div>
									</div>
								</div>
							</div>
							<div class="form-group editBugComments" style="display: none">
								<label class="col-sm-2 control-label">备注</label>
								<div class="col-sm-10">
									<textarea class="form-control textarea" rows="5"
										name="comments" placeholder="最多输入500个字符"
										onfocus="checkStrNum(this,500)"
										oninput="checkStrNum(this,500)"
										onpropertychange="checkStrNum(this,500)"></textarea>
								</div>
							</div>
							<div class="modal-footer noborder">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
								<button type="submit" class="btn btn-info noborder">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- bug详情 -->
		<div class="bugInfoPage animated fadeInRightBig" id="bugInfoPage"
			style="display: none;">
			<div class="bugInfoTop">
				<em class="fa fa-angle-right bugInfoBack" alt="隐藏" title="隐藏"></em>
				<span class="btn0">
					<button class="btn btn-primary" type="button" data-action="Comment">评论</button>
					<button class="btn btn-primary" type="button" data-action="Assign">指派</button>
					<button class="btn btn-primary" type="button" data-action="Fix">修复</button>
					<button class="btn btn-primary" type="button" data-action="Reject">拒绝</button>
					<button class="btn btn-primary" type="button" data-action="Close">关闭</button>
					<button class="btn btn-primary" type="button"
						data-action="Postpone">延期</button>
				</span> <span class="btn1 right"> <i class="fa fa-edit"
					data-action="Modify" alt="修改" title="修改"></i> <i
					class="fa fa-trash-o" data-action="Delete" alt="删除" title="删除"></i>
				</span>
			</div>
			<div class="bugInfoContent bugInfoPageContent">
				<div class="slimScrollDiv"
					style="position: relative; overflow: hidden; width: auto; height: 100%;">
					<div class="bugInfoPageNr"
						style="overflow: hidden; width: auto; height: 100%;">
						<div class="panel-default bugInfo">
							<div class="row">
								<label class="col-sm-12 control-label bugInfoTitle">#2 <span
									class="label"
									style="padding: .3em .6em .3em; color: #fff; background: #d9534f">缺陷</span>
									啊啊啊啊啊
								</label>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<label class="col-sm-3 control-label pd0">项目</label>
									<div class="col-sm-9 bugInfoProject txt pd0">呜呜</div>
								</div>
								<div class="col-sm-6">
									<label class="col-sm-3 control-label pd0">产品</label>
									<div class="col-sm-9 bugInfoProduct txt pd0"></div>
								</div>
							</div>
							<div class="row" id="bugInfoModule" style="">
								<div class="col-sm-1 pd20">
									<label class="col-sm-12 control-label pd0">模块</label>
								</div>
								<div class="col-sm-11" style="padding-left: 5%">
									<div class="col-sm-11 bugInfoModuleName txt pd0"></div>
								</div>
							</div>
							<div class="row">
								<div id="bugInfoVersionDiv" class="col-sm-6">
									<div id="bugInfoVersionAndEnvironment">
										<label class="col-sm-3 control-label pd0">影响版本</label>
										<div class="col-sm-9 bugInfoVersion txt pd0"></div>
									</div>
								</div>
								<div class="col-sm-6" id="bugInfoEnvironmentDiv">
									<label class="col-sm-3 control-label pd0">环境</label>
									<div class="col-sm-9 bugInfoEnvironment txt pd0"></div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<label class="col-sm-3 control-label pd0">状态</label>
									<div class="col-sm-9 bugInfoState txt pd0">
										<span class="label label-danger">未解决</span>
									</div>
								</div>
								<div class="col-sm-6">
									<label class="col-sm-3 control-label pd0">优先级</label>
									<div class="col-sm-9 bugInfoPriority txt pd0">
										<span class="label label-primary">中</span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<label class="col-sm-3 control-label pd0">分配人</label>
									<div class="col-sm-9 bugInfoAssign txt pd0">呜呜</div>
								</div>
								<div class="col-sm-6">
									<label class="col-sm-3 control-label pd0">处理人</label>
									<div class="col-sm-9 bugInfoFixedTo txt pd0">呜呜</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<label class="col-sm-3 control-label pd0">计划日期</label>
									<div class="col-sm-9 txt bugInfoTreatment pd0"></div>
								</div>
								<div class="col-sm-6">
									<label class="col-sm-3 control-label pd0">截止日期</label>
									<div class="col-sm-9 txt bugInfoTreatment2 pd0"></div>
								</div>
							</div>
							<div class="row" id="bugInfoEva" style="display: none;">
								<div class="col-sm-6">
									<label class="col-sm-3 control-label pd0">工作量</label>
									<div class="col-sm-9 txt bugInfoWorkload pd0"></div>
								</div>
								<div class="col-sm-6">
									<label class="col-sm-3 control-label pd0">价值</label>
									<div class="col-sm-9 txt bugInfoValue pd0"></div>
								</div>
							</div>
							<div class="row" id="bugInfoTags" style="display: none;">
								<div class="col-sm-12 bugInfoTags" style="display: none;">
									<label class="col-sm-1 control-label pd0">标签</label>
									<div class="col-sm-11 bugInfoTagsList"></div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12 bugInfoDescription"></div>
							</div>
							<div class="row" id="bugInfoImages" style="display: none;">
								<div class="col-sm-12 bugInfoImages"></div>
							</div>
							<div class="row" id="bugInfoFujian" style="display: none;">
								<div class="col-sm-12 bugInfoFujian"></div>
							</div>
							<div class="renwuHr" style="margin: 0px -15px; display: none;">
								<hr>
							</div>
							<div class="row" id="relatedBugsList" style="display: none;">
								<div class="col-sm-12">
									<div class="relatedBugsDiv">
										<b>相关BUG</b>
										<div class="relatedBugsDivList"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="slimScrollBar"
						style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 244.086px;"></div>
					<div class="slimScrollRail"
						style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.9; z-index: 90; right: 1px;"></div>
				</div>
			</div>
			<div id="bugInfoDrag" class="bugInfoDrag"></div>
		</div>
		<!-- 重新打开bug -->
		<div class="modal fade myProjectBugModal" id="BugReopenModal"
			tabindex="-4" role="dialog" data-backdrop="static"
			data-keyboard="false">
			<div class="modal-dialog" role="document" style="z-index: 1040">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"><i class="fa fa-remove"></i></span>
						</button>
						<button type="button" class="close modalExpand">
							<span><i class="fa fa-expand"></i></span>
						</button>
						<h4>
							<i class="fa fa-cube"></i> 再打开
						</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="bugReopenModelForm">
							<div class="form-group" id="reopenVersion">
								<label class="col-sm-2 control-label">影响版本</label>
								<div class="col-sm-10 relative bvs">
									<div class="inputVersion">
										<input type="text" class="form-control"
											placeholder="最多输入50个字符" name="version"
											onfocus="checkStrNum(this,50)" oninput="checkStrNum(this,50)"
											onpropertychange="checkStrNum(this,50)">
									</div>
									<div class="customDropkick" style="width: 100%">
										<select style="visibility: hidden" tabindex="2"
											id="reOpenBugVersionSelect"></select>
									</div>
								</div>
							</div>
							<div class="form-group relative">
								<label class="col-sm-2 control-label">备注</label>
								<div class="col-sm-10 relative">
									<textarea class="form-control textarea comments"
										placeholder="最多输入500个字符" rows="4" name="comments"
										onfocus="checkStrNum(this,500)"
										oninput="checkStrNum(this,500)"
										onpropertychange="checkStrNum(this,500)"></textarea>
									<div class="dragReopenDescDiv"></div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">指派给</label>
								<div class="col-sm-10">
									<div class="customDropkick" id="BugReopenAssignTo"></div>
								</div>
							</div>
							<div class="modal-footer noborder">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
								<button type="submit" class="btn btn-info noborder">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 指派bug -->
		<div class="modal fade myProjectBugModal" id="BugAssignModal"
			tabindex="-5" role="dialog" data-backdrop="static"
			data-keyboard="false">
			<div class="modal-dialog" role="document" style="z-index: 1040">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"><i class="fa fa-remove"></i></span>
						</button>
						<button type="button" class="close modalExpand">
							<span><i class="fa fa-expand"></i></span>
						</button>
						<h4>
							<i class="fa fa-cube"></i> 指派
						</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="bugAssignModelForm">
							<div class="form-group">
								<label class="col-sm-2 control-label">指派给</label>
								<div class="col-sm-10">
									<div class="customDropkick" id="bugAssignTo" data-uid="0">
										<div class="dk_container  dk_shown dk_theme_default"
											id="dk_container_bugAssignToSelect" tabindex="4">
											<a class="dk_toggle"><span class="dk_label">[未指定]</span><span
												class="select-icon"><i class="fa fa-caret-down"></i></span></a>
											<div class="dk_options">
												<div class="userNameSearch">
													<input type="text" class="form-control" placeholder="快速搜索"><i
														class="fa fa-times-circle"></i>
												</div>
												<div class="slimScrollDiv"
													style="position: relative; overflow: hidden; width: auto; height: 100%;">
													<ul class="dk_options_inner"
														style="overflow: hidden; width: auto; height: 100%;">
														<li class="dk_option_current"><a
															data-dk-dropdown-value="0">[未指定]</a></li>
														<li class=""><a data-dk-dropdown-value="46604">呜呜</a>
														</li>
													</ul>
													<div class="slimScrollBar"
														style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; background: rgb(0, 0, 0);"></div>
													<div class="slimScrollRail"
														style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
												</div>
											</div>
										</div>
										<select tabindex="4" id="bugAssignToSelect"
											style="display: none;">
											<option value="0" selected="">[未指定]</option>
											<option value="46604">呜呜</option>
										</select>
									</div>
								</div>
							</div>
							<div class="form-group relative">
								<label class="col-sm-2 control-label">备注</label>
								<div class="col-sm-10 relative">
									<textarea class="form-control textarea comments"
										placeholder="最多输入500个字符" rows="4" name="comments"
										onfocus="checkStrNum(this,500)"
										oninput="checkStrNum(this,500)"
										onpropertychange="checkStrNum(this,500)"></textarea>
									<div class="dragAssignToDescDiv"></div>
								</div>
							</div>
							<div class="modal-footer noborder">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
								<button type="submit" class="btn btn-info noborder">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 审核不通过 -->
		<div class="modal fade myProjectBugModal" id="BugDisapproveModal"
			tabindex="-6" role="dialog" data-backdrop="static"
			data-keyboard="false">
			<div class="modal-dialog" role="document" style="z-index: 1040">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"><i class="fa fa-remove"></i></span>
						</button>
						<button type="button" class="close modalExpand">
							<span><i class="fa fa-expand"></i></span>
						</button>
						<h4>
							<i class="fa fa-cube"></i> 审核不通过
						</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="bugDisapproveModelForm">
							<div class="form-group" id="bugDisapproveVersion">
								<label class="col-sm-2 control-label">验证版本</label>

								<div class="col-sm-10 relative bvs">
									<div class="inputVersion">
										<input type="text" class="form-control"
											placeholder="最多输入50个字符" name="verifyVersion"
											onfocus="checkStrNum(this,50)" oninput="checkStrNum(this,50)"
											onpropertychange="checkStrNum(this,50)">
									</div>
									<div class="customDropkick" style="width: 100%">
										<select style="visibility: hidden" tabindex="2"
											id="DisapproveBugVersionSelect"></select>
									</div>
								</div>
							</div>
							<div class="form-group relative">
								<label class="col-sm-2 control-label">备注</label>
								<div class="col-sm-10 relative">
									<textarea class="form-control textarea comments"
										placeholder="最多输入500个字符" rows="4" name="comments"
										onfocus="checkStrNum(this,500)"
										oninput="checkStrNum(this,500)"
										onpropertychange="checkStrNum(this,500)"></textarea>
									<div class="dragDisapproveDescDiv"></div>
								</div>
							</div>
							<div class="modal-footer noborder">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
								<button type="submit" class="btn btn-info noborder">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 审核通过 -->
		<div class="modal fade myProjectBugModal" id="BugApproveModal"
			tabindex="-7" role="dialog" data-backdrop="static"
			data-keyboard="false">
			<div class="modal-dialog" role="document" style="z-index: 1040">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"><i class="fa fa-remove"></i></span>
						</button>
						<button type="button" class="close modalExpand">
							<span><i class="fa fa-expand"></i></span>
						</button>
						<h4>
							<i class="fa fa-cube"></i> 审核通过
						</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="bugApproveModelForm">
							<div class="form-group">
								<label class="col-sm-2 control-label">验证版本</label>

								<div class="col-sm-10 relative bvs">
									<div class="inputVersion">
										<input type="text" class="form-control"
											placeholder="最多输入50个字符" name="verifyVersion"
											onfocus="checkStrNum(this,50)" oninput="checkStrNum(this,50)"
											onpropertychange="checkStrNum(this,50)">
									</div>
									<div class="customDropkick" style="width: 100%">
										<select style="visibility: hidden" tabindex="2"
											id="ApproveBugVersionSelect"></select>
									</div>
								</div>
							</div>
							<div class="form-group relative">
								<label class="col-sm-2 control-label">备注</label>
								<div class="col-sm-10 relative">
									<textarea class="form-control textarea comments"
										placeholder="最多输入500个字符" rows="4" name="comments"
										onfocus="checkStrNum(this,500)"
										oninput="checkStrNum(this,500)"
										onpropertychange="checkStrNum(this,500)"></textarea>
									<div class="dragApproveDescDiv"></div>
								</div>
							</div>
							<div class="modal-footer noborder">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
								<button type="submit" class="btn btn-info noborder">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 决绝bug -->
		<div class="modal fade myProjectBugModal" id="BugRejectModal"
			tabindex="-8" role="dialog" data-backdrop="static"
			data-keyboard="false">
			<div class="modal-dialog" role="document" style="z-index: 1040">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"><i class="fa fa-remove"></i></span>
						</button>
						<button type="button" class="close modalExpand">
							<span><i class="fa fa-expand"></i></span>
						</button>
						<h4>
							<i class="fa fa-cube"></i> 拒绝
						</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="bugRejectModelForm">
							<div class="form-group">
								<label class="col-sm-2 control-label">拒绝原因</label>
								<div class="col-sm-10">
									<div class="customDropkick">
										<select style="visibility: hidden" tabindex="2" id="bugReject"></select>
									</div>
								</div>
							</div>
							<div class="form-group relative">
								<label class="col-sm-2 control-label">备注</label>
								<div class="col-sm-10 relative">
									<textarea class="form-control textarea comments"
										placeholder="最多输入500个字符" rows="4" name="comments"
										onfocus="checkStrNum(this,500)"
										oninput="checkStrNum(this,500)"
										onpropertychange="checkStrNum(this,500)"></textarea>
									<div class="dragRejectDescDiv"></div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">指派给</label>
								<div class="col-sm-10">
									<div class="customDropkick" id="BugRejectAssignTo"></div>
								</div>
							</div>
							<div class="modal-footer noborder">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
								<button type="submit" class="btn btn-info noborder">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 备注bug -->
		<div class="modal fade myProjectBugModal" id="BugCommentModal"
			tabindex="-9" role="dialog" data-backdrop="static"
			data-keyboard="false">
			<div class="modal-dialog" role="document" style="z-index: 1040">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"><i class="fa fa-remove"></i></span>
						</button>
						<button type="button" class="close modalExpand">
							<span><i class="fa fa-expand"></i></span>
						</button>
						<h4>
							<i class="fa fa-cube"></i> 备注
						</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="bugCommentModelForm">
							<div class="form-group relative">
								<label class="col-sm-2 control-label titleName">备注</label>
								<div class="col-sm-10 relative">
									<textarea class="form-control textarea comments"
										placeholder="最多输入500个字符" rows="4" name="comments"
										onfocus="checkStrNum(this,500)"
										oninput="checkStrNum(this,500)"
										onpropertychange="checkStrNum(this,500)"></textarea>
									<div class="dragCommentDescDiv"></div>
								</div>
							</div>
							<div class="fixAssignTo"></div>
							<div class="modal-footer noborder">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
								<button type="submit" class="btn btn-info noborder">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 编辑bug评论 -->
		<div class="modal fade myProjectBugModal" id="BugCommentEditModal"
			tabindex="-9" role="dialog" data-backdrop="static"
			data-keyboard="false">
			<div class="modal-dialog" role="document" style="z-index: 1040">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"><i class="fa fa-remove"></i></span>
						</button>
						<button type="button" class="close modalExpand">
							<span><i class="fa fa-expand"></i></span>
						</button>
						<h4>
							<i class="fa fa-cube"></i> 修改备注
						</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="bugCommentEditModelForm">
							<input type="hidden" name="id">
							<div class="form-group relative">
								<label class="col-sm-2 control-label titleName">备注</label>
								<div class="col-sm-10 relative">
									<textarea class="form-control textarea comments"
										placeholder="最多输入500个字符" rows="4" name="comments"
										onfocus="checkStrNum(this,500)"
										oninput="checkStrNum(this,500)"
										onpropertychange="checkStrNum(this,500)"></textarea>
									<div class="dragEditCommentDescDiv"></div>
								</div>
							</div>
							<div class="modal-footer noborder">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
								<button type="submit" class="btn btn-info noborder">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- 显示项目信息model -->
		<div class="modal fade myProjectModel" id="myProjectInfoModal"
			tabindex="-2" role="dialog" aria-labelledby="myProjectInfoBg">
			<div class="modal-dialog" role="document" style="z-index: 1050">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"><i class="fa fa-remove black"></i></span>
						</button>
						<h4 class="modal-title" id="myProjectInfoBg">
							<div id="projectInfoHeadImage" class="projectHeadImage">
								<div class="default">
									<img src="img/app-default.jpg" width="100%">
								</div>
							</div>
						</h4>
					</div>
					<div class="modal-body">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs noborder" role="tablist">
							<li role="presentation" class="active"
								style="width: 33.333333333%"><a
								href="bugAll.html#projectShowInfo"
								aria-controls="projectShowInfo" role="tab" data-toggle="tab">项目信息</a>
							</li>
							<li role="presentation" style="width: 33.333333333%"><a
								href="bugAll.html#projectShowUser"
								aria-controls="projectShowUser" role="tab" data-toggle="tab">成员列表</a>
							</li>
							<li role="presentation" style="width: 33.333333333%"><a
								href="bugAll.html#projectShowProduct"
								aria-controls="projectShowProduct" role="tab" data-toggle="tab">产品列表</a>
							</li>
						</ul>
						<!-- Tab panes -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="projectShowInfo">
								<div class="row">
									<form class="form-horizontal" id="showProjectForm"
										name="showProjectForm">
										<div class="form-group">
											<div class="col-sm-3 text-right">
												<b>项目名称</b>
											</div>
											<div class="col-sm-9 pName"></div>
										</div>
										<div class="form-group">
											<div class="col-sm-3 text-right">
												<b>项目描述</b>
											</div>
											<div class="col-sm-9 pDesc"></div>
										</div>
										<div class="form-group">
											<div class="col-sm-3 text-right">
												<b>拥有人</b>
											</div>
											<div class="col-sm-9 pUser"></div>
										</div>
										<div class="form-group">
											<div class="col-sm-3 text-right">
												<b>创建时间</b>
											</div>
											<div class="col-sm-9 pDate"></div>
										</div>
									</form>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane projectUser"
								id="projectShowUser">
								<div class="slimScrollDiv"
									style="position: relative; overflow: hidden; width: auto; height: 100%;">
									<div class="projectUserList md34" id="projectUserList"
										style="overflow: hidden; width: auto; height: 100%;">
										<ul class="list-group"></ul>
									</div>
									<div class="slimScrollBar"
										style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; background: rgb(0, 0, 0);"></div>
									<div class="slimScrollRail"
										style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
								</div>
								<p class="projectUserListTips"></p>
							</div>
							<div role="tabpanel" class="tab-pane projectProject"
								id="projectShowProduct">
								<div class="slimScrollDiv"
									style="position: relative; overflow: hidden; width: auto; height: 100%;">
									<div class="projectProductList md34" id="projectProductList"
										style="overflow: hidden; width: auto; height: 100%;">
										<ul class="list-group"></ul>
									</div>
									<div class="slimScrollBar"
										style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; background: rgb(0, 0, 0);"></div>
									<div class="slimScrollRail"
										style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
								</div>
								<p class="projectProjectListTips"></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 发布通知 -->
		<div class="modal fade myProjectBugModal" id="myProjectNoticeModal"
			tabindex="-12" role="dialog" data-backdrop="static"
			data-keyboard="false">
			<div class="modal-dialog" role="document" style="z-index: 1040">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"><i class="fa fa-remove"></i></span>
						</button>
						<button type="button" class="close modalExpand">
							<span><i class="fa fa-expand"></i></span>
						</button>
						<h4>
							<i class="fa fa-bullhorn"></i> 发布通知
						</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="noticeModelForm"
							name="noticeModelForm">
							<div class="form-group">
								<label class="col-sm-2 control-label">类型</label>
								<div class="col-sm-10">
									<div class="customDropkick" style="width: 100%">
										<div class="dk_container  dk_shown dk_theme_default"
											id="dk_container_noticeType" tabindex="4">
											<a class="dk_toggle"><span class="dk_label">信息公布</span><span
												class="select-icon"><i class="fa fa-caret-down"></i></span></a>
											<div class="dk_options">
												<div class="slimScrollDiv"
													style="position: relative; overflow: hidden; width: auto; height: 100%;">
													<ul class="dk_options_inner"
														style="overflow: hidden; width: auto; height: 100%;">
														<li class="dk_option_current"><a
															data-dk-dropdown-value="Information">信息公布</a></li>
														<li class=""><a
															data-dk-dropdown-value="MeetingMinutes">会议记要</a></li>
														<li class=""><a
															data-dk-dropdown-value="VersionRelease">版本发布</a></li>
														<li class=""><a
															data-dk-dropdown-value="MeetingNotice">会议通知</a></li>
														<li class=""><a data-dk-dropdown-value="WorkPlan">工作计划</a>
														</li>
													</ul>
													<div class="slimScrollBar"
														style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; background: rgb(0, 0, 0);"></div>
													<div class="slimScrollRail"
														style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
												</div>
											</div>
										</div>
										<select style="visibility: hidden; display: none;"
											tabindex="4" id="noticeType">
											<option value="Information">信息公布</option>
											<option value="MeetingMinutes">会议记要</option>
											<option value="VersionRelease">版本发布</option>
											<option value="MeetingNotice">会议通知</option>
											<option value="WorkPlan">工作计划</option>
										</select>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">标题</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										placeholder="最多输入200个字符" name="title"
										onfocus="checkStrNum(this,200)"
										oninput="checkStrNum(this,200)"
										onpropertychange="checkStrNum(this,200)">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">内容<br></label>
								<div class="col-sm-10 relative">
									<textarea class="form-control textarea" rows="6"
										name="description" placeholder="最多输入2000个字符"
										onfocus="checkStrNum(this,2000)"
										oninput="checkStrNum(this,2000)"
										onpropertychange="checkStrNum(this,2000)"></textarea>
									<div class="dragNoticeDescriptionDiv"></div>
								</div>
							</div>
							<div class="modal-footer noborder">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
								<button type="submit" class="btn btn-info noborder">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 修改通知 -->
		<div class="modal fade myProjectBugModal"
			id="myProjectNoticeEditModal" tabindex="-12" role="dialog"
			data-backdrop="static" data-keyboard="false">
			<div class="modal-dialog" role="document" style="z-index: 1040">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"><i class="fa fa-remove"></i></span>
						</button>
						<button type="button" class="close modalExpand">
							<span><i class="fa fa-expand"></i></span>
						</button>
						<h4>
							<i class="fa fa-bullhorn"></i> 修改通知
						</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="noticeEditModelForm"
							name="noticeEditModelForm">
							<div class="form-group">
								<label class="col-sm-2 control-label">类型</label>

								<div class="col-sm-10">
									<div class="customDropkick" style="width: 100%">
										<select style="visibility: hidden" tabindex="4"
											id="editNoticeType">
										</select>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">标题</label>

								<div class="col-sm-10">
									<input type="text" class="form-control"
										placeholder="最多输入200个字符" name="title"
										onfocus="checkStrNum(this,200)"
										oninput="checkStrNum(this,200)"
										onpropertychange="checkStrNum(this,200)">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">内容<br></label>

								<div class="col-sm-10 relative">
									<textarea class="form-control textarea" rows="6"
										name="description" placeholder="最多输入2000个字符"
										onfocus="checkStrNum(this,2000)"
										oninput="checkStrNum(this,2000)"
										onpropertychange="checkStrNum(this,2000)"></textarea>
									<div class="dragEditNoticeDescriptionDiv"></div>
								</div>
							</div>

							<div class="modal-footer noborder">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
								<button type="submit" class="btn btn-info noborder">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- bugModel end  -->
		<div class="floatBugInfo"></div>
		<!--  -->
		<script type="text/javascript"
			src="css/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>

</html>