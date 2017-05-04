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
	<link rel="stylesheet" href="<%=path%>/css/bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=path%>/css/font-awesome-4.4.0/css/font-awesome.min.css" />
		<link rel="stylesheet" href="<%=path%>/css/bootstrap-datepicker.min.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=path%>/css/jquery.minicolors.css">
		<link rel="stylesheet" href="<%=path%>/css/animate.css" type="text/css">
		<link rel="stylesheet" href="<%=path%>/css/public.css" type="text/css">
		<link rel="stylesheet" href="<%=path%>/css/bugClose.css" type="text/css">
		<link rel="stylesheet" href="<%=path%>/css/project.css" type="text/css">
		<script type="text/javascript" src="<%=path%>/js/utils.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
		<link rel="stylesheet" href="<%=path%>/css/layer.css" id="layui_layer_skinlayercss">
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="xml" src="<%=path%>/js/xml.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="dropkick" src="<%=path%>/js/jquery.dropkick-1.0.0.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="slimScroll" src="<%=path%>/js/jquery.slimscroll.min.1.3.8.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="utils" src="<%=path%>/js/utils.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="qrcode" src="<%=path%>/js/jquery.qrcode.min.js"></script>
		<script src="<%=path %>/js/ajaxfileupload.js" type="text/javascript"></script>
		
		<script type="text/javascript">
		window.onload = function(){
			$("#showByType").val("${typeSelect}");
			$("#showByCreater").val("${createrSelect}");
			
			var f = ${nameSize};
			
			if(f==0){
				$(".oneName").css("display","none");
				$(".twoName").css("display","inline");
			}
			if(f==1){
				$(".twoName").css("display","none");
			}
		}
		
		function showOneNotify(a){
			var showByType = $("#showByType").val();
			var showByCreater = $("#showByCreater").val();
			var toOneNotify = $("#toOneNotify").val();
			 $.post("<%=path%>/showNoticeInfo",{
				 "typeInfo":showByType,
				"creater":showByCreater,
				 "notyId":a,
				 "bid":"${id}",
				 "pid":"${pid}"		 	
					},function(){	
						window.location.href="<%=path%>/common/informDetails";
				});
			}
		
		
	
		function updateName() {
			var fastKeyword = $("#fastKeyword").val();
			 $.post("<%=path%>/search",{
			"pid":"${pid}",
			"currpage":"1",
			"content":fastKeyword
			},function(map){	
		//		alert(map.result);
				window.location.href="<%=path%>/common/search";
			});
		}
		
	
		
	function showByFilter(){
			
			var showByType = $("#showByType").val();
			var showByCreater = $("#showByCreater").val();
		
			$.post("<%=path%>/showNotyByFilter",{
				"typeInfo":showByType,
				"creater":showByCreater,
				 "pid":"${pid}",
				 "currpage":"1"
				},function(){	
					window.location.href="<%=path%>/common/noticeAll";
				});
		} 
		function changePage(a){
			var showByType = $("#showByType").val();
			var showByCreater = $("#showByCreater").val();
			$.post("<%=path%>/showNotyByFilter",{
				"typeInfo":showByType,
				"creater":showByCreater,
				 "pid":"${pid}",
				 "currpage":a
				},function(){	
					window.location.href="<%=path%>/common/noticeAll";
			});
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
		
		
		function ajaxFileUpload(){
			
		    $.ajaxFileUpload(
		        {
		     url:'pic/upload',                 //需要链接到服务器地址
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
								<li data-url="noticeAll.html" for="main" alt="项目通知" title="项目通知" class="li-noticeAll active" id="noticeAllMenu">
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
								<div class="bugAll animated fadeInRight">
									<h4>项目通知</h4>
									<div class="btn-bug-submit btn-canAddNotice" id="projectNotice" style="display: inline-block;">
										<span id="projectNotice">
											<a href="javascript:void(0)" class="btn btn-block btn-primary w100" data-toggle="modal" data-target="#myProjectNoticeModal" id="submitNoticeBtn">
												<i class="fa fa-bullhorn"></i> 发布通知
											</a>
										</span>
									</div>
									<div class="pd12" id="bugFilter">
										<ul class="nav nav-pills">
											<li role="presentation" class="dropdown">
												<a class="dropdown-toggle">通知类型：
													<select class="select" onchange="showByFilter()" id="showByType">
														<option data-value="全部">全部</option>
														<option data-value="信息公布">信息公布</option>
														<option data-value="会议记要">会议记要</option>
														<option data-value="版本发布">版本发布</option>
														<option data-value="会议通知">会议通知</option>
														<option data-value="工作计划">工作计划</option>
													</select>
												</a>
											</li>
											<li role="presentation" class="dropdown">
												<a class="dropdown-toggle">发布人：
													<select class="select"onchange="showByFilter()" id="showByCreater">
														<option data-value="全部">全部</option>
														<c:forEach  items="${nameList}" var="nalist">
														<option class="oneName" data-value="${nalist.buser_name }">${nalist.buser_name }</option>
														</c:forEach>
														<option style="display:none;" class="twoName" data-value="${createrSelect}">${createrSelect }</option>
													</select>
												</a>
											</li>
											<!--  <div class="input-group bugSearchDiv"><input type="text" class="form-control" name="noticeSearch" id="noticeTitleKeyword" placeholder="标题、内容" value=""><span class="input-group-btn"><button class="btn btn-info searchNoticeBtn" onclick="showByFilter()" type="button"><i class="fa fa-search"></i></button></span></div>-->
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
														<table class="table table-hover noticeTable no-footer dataTable" id="dataTables">
															<thead>
																<tr role="row">
																	<th class="sorting_disabled"  rowspan="1" colspan="1" aria-label="标题 共1条记录">标题 <span id="allCount">共${numNotice}条记录</span></th>
																	<th style="width:80px" class="sorting_disabled" rowspan="1" colspan="1" aria-label="通知类型">通知类型</th>
																	<th style="width:120px;" class="sorting_disabled" rowspan="1" colspan="1" aria-label="发布人">发布人</th>
																	<th style="width:125px;" class="center sorting_disabled" rowspan="1" colspan="1" aria-label="发布时间">发布时间</th>
																</tr>
															</thead>
															<tbody>
															
															<c:forEach  items="${noticeList}" var="notylist">
																
																<tr class="odd" onclick="showOneNotify(${notylist.notify_id})">
																	<td class=" ">${notylist.notify_title }</td>
																	<td class=" "><span class="label label-info">${notylist.notify_type }</span></td>
																	<td class=" ">${notylist.buser_name}</td>
																	<td class=" center">${fn:substring(notylist.notify_date,0,16)}</td>
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
		<li>共有${numNotice}条记录，当前第${currpage}页/共${pagecount}页</li>
	</ul>				
										</div>
									</div>
								</div>
								
							</div>
							<div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 587px;"></div>
							<div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.9; z-index: 90; right: 1px;"></div>
						</div>
					</div>
					<!-- main end -->

					<!-- 发布通知 -->
			<div class="modal fade myProjectBugModal" id="myProjectNoticeModal" tabindex="-12" role="dialog" data-backdrop="static" data-keyboard="false" style="display: none;">
				<div class="modal-dialog" role="document" style="z-index: 1040">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
							<h4><i class="fa fa-bullhorn"></i> 发布通知</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal" id="noticeModelForm" name="noticeModelForm" action="<%=path%>/addNotify" method="post">
								<input name="pid" type="hidden" value="${pid}">
								<input name="bid" type="hidden" value="${id}">
								<input name="currpage" type="hidden" value="1">
								
								<div class="form-group">
									<label class="col-sm-2 control-label">类型</label>
									<div class="col-sm-10">
										<select style="cursor:pointer; border-radius: 4px;height: 34px;border:1px solid #CCCCCC;color: #9A9A9A" class="col-sm-12" tabindex="4" id="noticeType"name="noticeType">
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
										<input type="text" class="form-control" placeholder="最多输入200个字符" name="title" onfocus="checkStrNum(this,200)" oninput="checkStrNum(this,200)" onpropertychange="checkStrNum(this,200)">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">内容</label>
									<div class="col-sm-10 relative">
										<textarea name="content" class="form-control textarea" rows="6" name="description" placeholder="最多输入2000个字符" onfocus="checkStrNum(this,2000)" oninput="checkStrNum(this,2000)" onpropertychange="checkStrNum(this,2000)"></textarea>
										<div class="dragNoticeDescriptionDiv"></div>
									</div>
								</div>
								<div class="showAndHideImageFujianDiv" style="">
									<div class="form-group">
										<label class="col-sm-2 control-label">图片</label>
										<div class="col-sm-10 text-right relative">
											<input type="file" id="uploadFile" name="file"  accept=".png,.jpg" /> 
											<input type="button" id="btnUpload" value="确定" onclick="ajaxFileUpload();"style="float:left;margin-top:5px;" />                                       
                                             <input type="text" id="result"  name="result1"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">附件</label>

										<div class="col-sm-10">
											<input name="file" type="file" id="imgfile"  accept=".doc,doxc,txt" />
											<input type="button" id="btnUpload" value="确定" onclick="FileUpload()"style="float:left;margin-top:5px;" />                                       
                                             <input type="text" id="results"  name="results1"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
                                             <input type="text" id="resultss"  name="resultss1"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
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
			

					<script type="text/javascript" src="<%=path%>/css/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		</body>

</html>