

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html class=" dk_fouc">
<!-- 我的分配 -->
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
		<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
		<link rel="stylesheet" href="css/layer.css" id="layui_layer_skinlayercss">
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="xml" src="<%=path %>/js/xml.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="dropkick" src="<%=path %>/js/jquery.dropkick-1.0.0.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="slimScroll" src="<%=path %>/js/jquery.slimscroll.min.1.3.8.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="utils" src="<%=path %>/js/utils.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="qrcode" src="<%=path %>/js/jquery.qrcode.min.js"></script>
		<script src="<%=path %>/js/ajaxfileupload.js" type="text/javascript"></script>
			<script> 
		$(function(){
			produce();
			meber() ;
		
		});
		
</script> 
		<script type="text/javascript">
	
		window.onload = function(){
			$("#aoBugTypeSelect").val("${aoTypeSelect}");
			$("#aoBugStateSelect").val("${aoStateSelect}");
			$("#aoBugPropSelect").val("${aoPropSelect}");
			$("#aoBugMakerSelect").val("${aoMakerSelect}");		
			var f = ${aoNameSize};
			var ff = ${aoMakerSelect};
			if(f==0 || !ff.equals("全部")){
				$(".oneName").css("display","none");
				$(".twoName").css("display","inline");
			}
			if(f==1){
				$(".twoName").css("display","none");
			}
		}
		function showByFilter(){
			var aoBugTypeSelect = $("#aoBugTypeSelect").val();
			var aoBugStateSelect = $("#aoBugStateSelect").val();
			var aoBugPropSelect = $("#aoBugPropSelect").val();
			var aoBugMakerSelect = $("#aoBugMakerSelect").val();
			$.post("<%=path%>/filterAssignOthers",{
				"type":aoBugTypeSelect,
				"state":aoBugStateSelect,
				"prop":aoBugPropSelect,
				"maker":aoBugMakerSelect,
				"bid":"${id}",
				"pid":"${pid}",
				"currpage":"1"
				},function(){	
					window.location.href="<%=path%>/common/bugAssignByMe";
				});
		} 
		function changePage(a){
			
			var aoBugTypeSelect = $("#aoBugTypeSelect").val();
			var aoBugStateSelect = $("#aoBugStateSelect").val();
			var aoBugPropSelect = $("#aoBugPropSelect").val();
			var aoBugMakerSelect = $("#aoBugMakerSelect").val();
			$.post("<%=path%>/filterAssignOthers",{
				"type":aoBugTypeSelect,
				"state":aoBugStateSelect,
				"prop":aoBugPropSelect,
				"maker":aoBugMakerSelect,
				"bid":"${id}",
				"pid":"${pid}",
				"currpage":a
				},function(){	
					window.location.href="<%=path%>/common/bugAssignByMe";
			});
		} 
		</script>
		<script type="text/javascript">
		function produce() {
			 
			 $.post("<%=path%>/selectProduce",{
				"produce_id":"${pid}"
					},function(listpro){
						var option="<option>[未指定]</option>";
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
					var option="<option>[未指定]</option>";
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
						//alert(map.result);
						window.location.href="<%=path%>/common/search";
				});
		}

		
		</script>	
		<script type="text/javascript">
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
		      
		
		function tobug(a){
			 $.post("<%=path%>/tobug",{
				"pid":"${pid}",
				"bug_id":a,
				"bid":${id}
					},function(map){	
						window.location.href="<%=path%>/common/bugDetails";
				});
		}
			</script>	
		
	
	
	</head>

	<body class="apps done fixed-sidebar modal-open-v">
		<!-- header start -->
		<header class="site-header">
			<div class="wrapper-header-left-bg"></div>
			<div class="wrapper-header">
				<span class="name">
		        	<img src="<%=path %>/img/logozxi.png" height="33px">
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
					<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;">
						<div class="sidebar-collapse" style="overflow: hidden; width: auto; height: 100%;">
							<div class="project-img relative" id="project-img">
								<p style="background: url(img/app-default.jpg) 50% 50% / contain no-repeat;">
									<img src="<%=path %>/img/app-default.jpg" id="projectImg" border="0">
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
								<li data-url="bugAssignByMe.html" for="main" alt="我的分配" title="我的分配" class="li-bugAssignByMe active" id="bugAssignByMeMenu" style="">
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
				<div class="bug-content">
					<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;">
						<div class="bug-main" id="main" style="overflow: hidden; width: auto; height: 100%;">
							<div class="bugAssignByMe animated fadeInRight">
								<h4>我的分配</h4>
								<div class="btn-bug-submit btn-canSubmitBug" style="display: inline-block;">
									<span class="btn btn-primary w100" data-toggle="modal" data-target="#myProjectBugModal" id="submitBugBtn"><i class="fa fa-plus-circle"></i> 提交BUG</span>
								</div>
								<div class="pd12" id="bugFilter">
									<ul class="nav nav-pills">
										<li role="presentation" class="dropdown">
											<a class="dropdown-toggle">BUG类型：
												<select class="select" id="aoBugTypeSelect" onchange="showByFilter()">
													<option data-value="">全部</option>
													<option data-value="Bug">缺陷</option>
													<option data-value="Task">任务</option>
													<option data-value="Require">需求</option>
												</select>
											</a>
										</li>
										<li role="presentation" class="dropdown">
											<a class="dropdown-toggle">状态：
												<select class="select" id="aoBugStateSelect" onchange="showByFilter()">
													<option data-value="">全部</option>
													<option data-value="Open">未解决</option>
													<option data-value="Fixed">待审核</option>
													<option data-value="Rejected">已拒绝</option>
													<option data-value="Resolved">已解决</option>
													<option data-value="Closed">已关闭</option>
													<option data-value="Postponed">已延期</option>
												</select>
											</a>
										</li>
										<li role="presentation" class="dropdown">
											<a class="dropdown-toggle">优先级：
												<select class="select" id="aoBugPropSelect" onchange="showByFilter()">
													<option data-value="">全部</option>
													<option data-value="Urgent">急</option>
													<option data-value="High">高</option>
													<option data-value="Medium">中</option>
													<option data-value="Low">低</option>
												</select>
											</a>
										</li>
										<li role="presentation" class="dropdown">
											<a class="dropdown-toggle">处理人：
												<select class="select"  id="aoBugMakerSelect" onchange="showByFilter()">
													<option data-value="全部">全部</option>
													<option data-value="[未指定]">[未指定]</option>
													<c:forEach  items="${assignOthersMaker}" var="asgMakerList">
													<option class="oneName" data-value="${asgMakerList.bug_toman}">${asgMakerList.bug_toman}</option>
													</c:forEach>
													<option style="display:none;" class="twoName" data-value="${aoMakerSelect}">${aoMakerSelect }</option>
												</select>
											</a>
										</li>
									</ul>
								</div>
								<div class="pd23 pd43">
									<div class="row">
										<div class="pTable">
											<div class="pTable-content customTable">
												<div id="dataTables_wrapper" class="dataTables_wrapper form-inline" role="grid">
													<div class="row">
														<div class="col-sm-6"></div>
														<div class="col-sm-6"></div>
													</div>
													<table class="table table-hover bugTable dataTable no-footer" id="dataTables">
														<thead>
															<tr role="row">
																<th style="width:1px" class="sorting_disabled" rowspan="1" colspan="1" aria-label=""></th>
																<th style="width:80px" class="" tabindex="0" aria-controls="dataTables" rowspan="1" colspan="1" aria-label="编号：激活排序列升序">编号</th>
																<th style="width:50px" class="sorting" tabindex="0" aria-controls="dataTables" rowspan="1" colspan="1" aria-label="类型：激活排序列升序">类型</th>
																<th class="sorting_disabled"  rowspan="1" colspan="1" aria-label="标题 共2条记录">标题 <span id="allCount">共${numAssignOthers}条记录</span></th>
																<th style="width:50px" class="sorting" tabindex="0" aria-controls="dataTables" rowspan="1" colspan="1" aria-label="状态：激活排序列升序">状态</th>
																<th style="width:60px" class="sorting" tabindex="0" aria-controls="dataTables" rowspan="1" colspan="1" aria-label="优先级：激活排序列升序">优先级</th>
																<th style="width:120px" class="sorting_disabled" rowspan="1" colspan="1" aria-label="处理人">处理人</th>
																<th style="width:85px" class="sorting_disabled" rowspan="1" colspan="1" aria-label="分配人">分配人</th>
																<th style="width:125px;" class="center sorting" tabindex="0" aria-controls="dataTables" rowspan="1" colspan="1" aria-label="创建时间：激活排序列升序">创建时间</th>
																<th style="width:125px;" class="center sorting_desc" tabindex="0" aria-controls="dataTables" rowspan="1" colspan="1" aria-sort="descending" aria-label="修改时间：激活排序列升序">修改时间</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach  items="${listAssignOthers}" var="assignothers" varStatus="status">
													     	<tr class="odd"  onclick="tobug(${assignothers.bug_id});">
																<td class=" "><span class="fa"></span></td>
																<td class=" ">${status.index+1 }</td>
																<td class=" "><span class="label" style="padding:.3em .6em .3em;color:#fff;background:#d9534f">${assignothers.bug_type}</span></td>
																<td class=" "><span class="defaultColor" alt="产品" title="产品"> </span> ${assignothers.bug_title } </td>
																<td class=" "><span class="label label-danger">${assignothers.bug_state }</span></td>
																<td class=" "><span class="label label-primary">${assignothers.bug_prop }</span></td>
																<td class=" ">${assignothers.bug_maker }</td>
																<td class=" ">${assignothers.bug_signer }</td>															
																<td class=" center">${fn:substring(assignothers.bug_create_date ,0,16)}</td>
																<td class=" center">${fn:substring(assignothers.bug_repair_date ,0,16)}</td>
															</tr>
															</c:forEach>
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
		<li>共有${numAssignOthers}条记录，当前第${currpage}页/共${pagecount}页</li>
	</ul>			
									</div>
								</div>
							</div>

						</div>
						<div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 538px;"></div>
						<div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.9; z-index: 90; right: 1px;"></div>
					</div>
				</div>
				<!-- main end -->
				<!-- bugModel start -->
				<div class="bugModelDiv" id="bugModelDiv">
				<!-- 提交bug -->
				<div class="modal fade myProjectBugModal" id="myProjectBugModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog" role="document" style="z-index: 1040">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
							<h4><i class="fa fa-plus-circle"></i> 新建BUG</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal" id="bugModelForm" name="bugModelForm"action="<%=path%>/toAddBug?bid=${id}&pid=${pid}"   enctype="multipart/form-data"  method="post" >
								<div class="tabBug">
									<ul class="nav nav-tabs" role="tablist">
										<li role="presentation" class="active" style="width: 50%;">
											<a href="work.html#tabBugInfo" aria-controls="tabBugInfo" role="tab" data-toggle="tab">信息与描述</a>
										</li>
										<li role="presentation" style="width: 50%;">
											<a href="work.html#tabBugPlan" aria-controls="tabBugPlan" role="tab" data-toggle="tab">人员与计划</a>
										</li>
									</ul>
									<div class="tab-content">
										<div role="tabpanel" class="tab-pane active" id="tabBugInfo">
											<div class="form-group">
												<div class="col-sm-7 pd0">
													<label class="col-sm-3 control-label pdProduct">模块</label>
													<div class="col-sm-9 pdSelect">
														<select style="cursor:pointer; border-radius: 4px;height: 30px;border:1px solid #CCCCCC;color: #9A9A9A;" class="col-sm-12" tabindex="4" id="bugProduct"  name="module">
															
														</select>
													</div>
												</div>
												<div class="col-sm-5 pd0">
													<label class="col-sm-5 control-label">BUG类型</label>

													<div class="col-sm-7">
														<select style="cursor:pointer; border-radius: 4px;height: 30px;border:1px solid #CCCCCC;color: #9A9A9A;" class="col-sm-12" tabindex="4" class="bugType" id="bugType"  name="type">
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
													<input type="text" class="form-control" placeholder="最多输入200个字符"  onfocus="checkStrNum(this,200)" oninput="checkStrNum(this,200)" onpropertychange="checkStrNum(this,200)" name="bug_title">
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
													<input type="text" class="form-control" placeholder="最多输入100个字符" name="environment" onfocus="checkStrNum(this,100)" oninput="checkStrNum(this,100)" onpropertychange="checkStrNum(this,100)" name="environment">
												</div>
											</div>
							<div class="form-group">
												<label class="col-sm-2 control-label">描述<br></label>
												<div class="col-sm-10 relative">
													<textarea class="form-control textarea" rows="5" name="bug_describe" placeholder="最多输入2000个字符" onfocus="checkStrNum(this,2000)" oninput="checkStrNum(this,2000)" onpropertychange="checkStrNum(this,2000)"></textarea>
													<div class="dragDescriptionDiv"></div>
																 
												</div>
											</div>
											<div class="showAndHideImageFujianDiv" style="">
								<div class="form-group">
										<label class="col-sm-2 control-label">图片</label>
										<div class="col-sm-10 text-right relative">
											<input type="file" id="uploadFile" name="file"  accept=".png,.jpg" /> 
											<input type="button" id="btnUpload" value="确定" onclick="ajaxFileUpload()" style="float:left;margin-top:5px;"/>                                       
                                             <input type="text" id="result"  name="result"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">附件</label>

										<div class="col-sm-10">
											<input name="file" type="file" id="imgfile"  accept=".doc,doxc,txt" />
											<input type="button" id="btnUpload" value="确定" onclick="FileUpload()"style="float:left;margin-top:5px;" />                                       
                                             <input type="text" id="results"  name="results"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
                                               <input type="text" id="resultss"  name="resultss"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
										</div>
									</div>
								</div>
										</div>
										<div role="tabpanel" class="tab-pane" id="tabBugPlan">
											<div class="form-group">
												<div class="col-sm-6 pd0">
													<label class="col-sm-4 control-label">指派给</label>
													<div class="col-sm-8">
														<select class="col-sm-12" tabindex="4" id="bugFixToSelect" style="cursor:pointer; border-radius: 4px;height: 30px;border:1px solid #CCCCCC;color: #9A9A9A;"  name="handler">
															<option value="0" selected="">[未指定]</option>
															<option value="46604">呜呜</option>
														</select>
													</div>
												</div>
												<div class="col-sm-6 pd0">
													<label class="col-sm-3 control-label pd20">优先级</label>
													<div class="col-sm-9">
														<input type="radio" name="priority" value="急" style="cursor:pointer; width: 24px;height: 18px;" /> 急
														<input type="radio" name="priority" value="高" style="cursor:pointer; width: 24px;height: 18px;" /> 高
														<input type="radio" checked="" name="priority" value="中" style="cursor:pointer; width: 24px;height: 18px;" /> 中
														<input type="radio" name="priority" value="低" style="cursor:pointer; width: 24px;height: 18px;" /> 低
													</div>
												</div>
											</div>
											<div class="form-group" id="bugPlanDateDiv">
												<label class="col-sm-2 control-label">计划日期</label>
												<div class="col-sm-10 planDate">
													<div class="input-daterange input-group col-sm-9">
														<input style="border-radius: 4px; cursor:pointer; border: 1px solid #CCCCCC;" name="plan"  class="col-sm-5" type="date" value="" />
														<span class="col-sm-1">到</span>
														<input style="border-radius: 4px; cursor:pointer; border: 1px solid #CCCCCC;" name=" last" class="col-sm-5" type="date" value="" />
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
									<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
									<button type="submit" class="btn btn-info noborder">提交</button>
								</div>
							</form>
						</div>
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