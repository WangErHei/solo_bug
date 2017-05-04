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
		<link rel="stylesheet"  href="<%=path %>/css/bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/font-awesome-4.4.0/css/font-awesome.min.css" />
		<link rel="stylesheet" href="<%=path %>/css/bootstrap-datepicker.min.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/jquery.minicolors.css">
		<link rel="stylesheet" href="<%=path %>/css/animate.css" type="text/css">
		<link rel="stylesheet" href="<%=path %>/css/public.css" type="text/css">
		<link rel="stylesheet" href="<%=path %>/css/bugClose.css" type="text/css">
		<link rel="stylesheet" href="<%=path %>/css/project.css" type="text/css">
		<script type="text/javascript" src="<%=path %>/js/utils.js"></script>
		<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
		<link rel="stylesheet" href="<%=path %>/css/layer.css" id="layui_layer_skinlayercss">
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="xml" src="<%=path %>/js/xml.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="dropkick" src="<%=path %>/js/jquery.dropkick-1.0.0.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="slimScroll" src="<%=path %>/js/jquery.slimscroll.min.1.3.8.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="utils" src="<%=path %>/js/utils.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="qrcode" src="<%=path %>/js/jquery.qrcode.min.js"></script>
	  	<script src="<%=path %>/js/ajaxfileupload.js" type="text/javascript"></script>
		<script>
		
		window.onload = function(){
			$("#caseGroupSelect").val("${caseGroupSelectVal}");
			$("#caseProduceSelect").val("${caseProduceSelectVal}");
			$("#caseManagerSelect").val("${caseManagerSelectVal}");
			$("#caseStateSelect").val("${caseStateSelectVal}");
			$("#casePropSelect").val("${casePropSelectVal}");
			
		}
		
		function viewmypic(mypic, imgfile) {
			if(imgfile.value) {
				mypic.src = imgfile.value;
				mypic.style.display = "";
				mypic.border = 1;
			}
		}
		
	 	function deleteTestCase(){	   
			$.post("<%=path%>/deleteTestCase",{
				"caseId":"${testCaseId}",
				"pid":"${pid}",
				"currpage":"1"
				},function(){				
					window.location.href="<%=path%>/common/testCase";
				});
		}
	 	
	function caseupdate(){		
		 $.post("<%=path%>/Toshowcase",{
			 "caseId":"${testCaseId}",
				},function(map){			
					$("#fu_name").html(map.case_fu_name);
					if(map.notify_photo==""||map.case_photo==null){
						$("#image").hide();
					}
					$("#image").attr("src","/"+map.case_photo);	
					$("#result8").val(map.case_photo);
					$("#results8").val(map.case_fu);
					$("#resultss8").val(map.case_fu_name);
			});
			 
	}		
		
	 	function tobug(a){
			var p = "${pid}";
			var b = "${id}";
	 		 $.post("<%=path%>/tobug",{
	 			pid:p,
	 			bug_id:a,
	 	        bid:b
	 				},function(map){	
	 					window.location.href="<%=path%>/common/bugDetails";
	 			});
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
	   
	   function FileUpload(){

		    $.ajaxFileUpload(
		        {
		     url:'<%=path%>/uploadfu',          
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
			     url:'<%=path%>/pic/upload',           
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

			 $.post("<%=path%>/toMember",{
				"pid":"${pid}"
					},function(listmember){				
						var jsonlist = eval(listmember);
						var option="<option>[未指定]</option>";
						for(var i  in jsonlist){		
							option = option + "<option value='"+jsonlist[i].buser_name+"'>"+jsonlist[i].buser_name+"</option>";
						}
						$("#bugFixToSelect").html(option);
						}); 
		}
		</script>
			<script> 
		$(function(){
			produce();
			meber();

		});
	
		
		
</script> 
	</head>

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
                
                           
                                
                             
                        </div>
							</div>
						</div>
					
					</div>
				</div>
			</div>
			</div>
		</header>

		<div id="profile">
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
								<li data-url="bugAssignByMe.html" for="main" alt="我的分配" title="我的分配" class="li-bugAssignByMe" id="bugAssignByMeMenu" style="">
									<a href="<%=path%>/assignOthers?bid=${id}&pid=${pid}&currpage=1"><i class="fa fa-sign-out"></i> <span class="nav-label">我的分配</span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
								</li>
								<li class="divider"></li>
								<li data-url="noticeAll.html" for="main" alt="项目通知" title="项目通知" class="li-noticeAll" id="noticeAllMenu">
									<a href="<%=path%>/showNotice?bid=${id }&pid=${pid}&currpage=1"><i class="fa fa-bullhorn"></i> <span class="nav-label">项目通知</span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
								</li>
								<li data-url="testCase.html" for="main" alt="测试用例" title="测试用例" class="li-testCase active" id="testCaseMenu">
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
		<!-- 用例详情 -->
		<div class="bugInfoPage1" id="bugInfoPage" style="display: block;">
			<div class="bugInfoTop1">
				<span class="btn0">
					<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#myProjectBugModal" data-action="Comment">提交BUG</button> 
				</span>
				<span class="btn1 right">
					<i class="fa fa-edit" data-action="Modify" data-toggle="modal"  data-target="#myProjectTestEditModal" alt="修改"   onclick="caseupdate();"></i> 
					<i class="fa fa-trash-o" data-action="Delete" data-toggle="modal"  data-target="#DeleteDetails" alt="删除"></i> 
				</span>
			</div>
			<div class="bugInfoContent bugPageContent">
				<div class="slimScrollDiv" style="margin-top: 5px; width: auto; height: 100%;">
					<div class="bugTestInfoPageNr" style="width: auto; height: 100%;">
						<div class="panel-default bugTestInfo">
						<c:forEach  items="${oneTestCase}" var="oneCase">
							<div class="row">
								<label class="col-sm-12 control-label bugTestInfoTitle">#${oneCase.case_id } ${oneCase.case_title }</label>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<label class="col-sm-3 control-label pd0">项目</label>
									<div class="col-sm-9 bugTestInfoProject txt pd0">${pname }</div>
								</div>
								<div class="col-sm-6">
									<label class="col-sm-3 control-label pd0">模块</label>
									<div class="col-sm-9 bugTestInfoProduct txt pd0">${oneCase.produce_name }</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<label class="col-sm-1 control-label pd0">测试组</label>
									<div class="col-sm-11 bugTestInfoTestGroup txt pd44">${oneCase.group_name }</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<label class="col-sm-3 control-label pd0">状态</label>
									<div class="col-sm-9 bugTestInfoState txt pd0"><span class="label label-success">${oneCase.case_state }</span></div>
								</div>
								<div class="col-sm-6">
									<label class="col-sm-3 control-label pd0">重要性</label>
									<div class="col-sm-9 bugTestInfoImportance txt pd0"><span class="label label-warning">${oneCase.prop_name }</span></div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<label class="col-sm-3 control-label pd0">创建人</label>
									<div class="col-sm-9 bugTestInfoCreate txt pd0">${oneCase.creater_name }</div>
								</div>
								<div class="col-sm-6">
									<label class="col-sm-3 control-label pd0">管理人</label>
									<div class="col-sm-9 bugTestInfoManager txt pd0">${oneCase.manager_name }</div>
								</div>
							</div>
							<div class="row" style="border-top: 1px solid #E9E9E9;">
								<div class="col-sm-12 bugTestInfoDescription">${oneCase.case_content }</div>
							</div>
							<div class="row">
							<c:if  test="${!empty oneCase.case_photo}">
								<div class="col-sm-12 bugTestInfoImages">
									<img layer-src="${oneCase.case_photo}" src="${oneCase.case_photo}" class="testcaseinfoimg-9772350009" width="400">
								</div>
							</c:if>
							</div>
							<div class="row">
							<c:if  test="${!empty oneCase.case_fu}">
								<div class="col-sm-12 bugTestInfoFujian">
									<p class="title">附件</p>
									<p class="testCaseInfoPageFile">
										<a href="<%=path %>/down/fudownload?fu=${oneCase.case_fu}" target="_blank" download=""><i class="fa fa-paperclip"></i>${oneCase.case_fu_name } </a>
									</p>
								</div>
							</c:if>
							</div>
							</c:forEach>
							<div class="row">
								<div class="col-sm-12 bugTestInfoBugCount" style="display: block;"><b>相关BUG</b><br>
									<ul>
										<c:forEach  items="${caseBugList}" var="caseBugList" varStatus="status">
										<li data-projectid="27221" data-bugid="157770" onclick="tobug(${caseBugList.bug_id})">
											<span class="tBugTitle">
												<strong>#${status.index + 1}</strong> 
												<span class="label" style="padding:.3em .6em .3em;color:#fff;background:#d9534f">${caseBugList.bug_type}</span> 
												<span class="defaultColor" alt="产品" title="产品"></span> 
												<span class="testCaseTestGroup" alt="模块" title="模块"></span> ${caseBugList.bug_title }
											</span> 
											<span class="tBugState right">
												<span class="label label-danger">${caseBugList.bug_state}</span>
											</span> 
											<span class="tBugUser textOverHiden right"></span> 
										</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 88.9047px;"></div>
					<div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.9; z-index: 90; right: 1px;"></div>
				</div>
			</div>
		</div>

	   <!--                        提交bug                        -->
			<div class="modal fade myProjectBugModal" id="myProjectBugModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog" role="document" style="z-index: 1040">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
							<h4><i class="fa fa-plus-circle"></i> 新建BUG</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal" id="bugModelForm" name="bugModelForm"action="<%=path%>/tocaseAddBug?bid=${id}&pid=${pid}&caseId=${testCaseId}"   enctype="multipart/form-data"  method="post" >
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
											
											<div class="form-group">
												<label class="col-sm-2 control-label">标题</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" placeholder="最多输入200个字符"  onfocus="checkStrNum(this,200)" oninput="checkStrNum(this,200)" onpropertychange="checkStrNum(this,200)" name="bug_title">
												</div>
											</div>
				
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
											<input type="button" id="btnUpload" value="确定" onclick="FileUpload()"  style="float:left;margin-top:5px;"/>                                       
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
		<!-- 修改测试用例 -->
		<div class="modal fade myProjectBugTest in" id="myProjectTestEditModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" style="padding-left: 17px;">
			<div class="modal-dialog" role="document" style="z-index: 1040">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
						<h4><i class="fa fa-edit"></i> 修改测试用例</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="testCaseEditModelForm" name="testCaseEditModelForm" action="<%=path %>/updateTestCase" method="post">
							<input type="hidden" name="bid" value="${id }">
							<input type="hidden" name="pid" value="${pid }">
							<input type="hidden" name="caseId" value="${testCaseId }">
							
							<div class="tabTest tabBug">
								<ul class="nav nav-tabs" role="tablist" style="display:none">
									<li role="presentation" class="active" style="width: 50%; display: none;">
										<a href="#tabTestEditInfo" aria-controls="tabTestInfo" role="tab" data-toggle="tab">信息与描述</a>
									</li>
									<li role="presentation" id="tabs-li-tags" style="display: none; width: 50%;">
										<a href="#tabTestEditTags" aria-controls="tabTestTags" role="tab" data-toggle="tab">标签</a>
									</li>
								</ul>
								
								<div class="tab-content">
								<c:forEach  items="${oneTestCase}" var="caseList">
									<div role="tabpanel" class="tab-pane active" id="tabTestEditInfo">
										<div class="form-group">
											<div class="col-sm-6 pd0">
												<label class="col-sm-4 control-label">测试组</label>
												<div class="col-sm-8">
													<select style="cursor:pointer; border-radius: 4px;height: 34px;border:1px solid #CCCCCC;color: #9A9A9A" class="col-sm-12" tabindex="4" id="caseGroupSelect" name="caseGroupSelect">
														<option value="0">[无]</option>
														<c:forEach  items="${groupList}" var="groupList">
														<option value="${groupList.group_id}">${groupList.group_name}</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="col-sm-6 pd0">
												<label class="col-sm-4 control-label">产品</label>
												<div class="col-sm-8">
													<select style="cursor:pointer; border-radius: 4px;height: 30px;border:1px solid #CCCCCC;color: #9A9A9A;" class="col-sm-12" tabindex="4" id="caseProduceSelect" name="caseProduceSelect">
														<option value="0">[未指定]</option>
														<c:forEach  items="${produceList}" var="prodList">
														<option value="${prodList.produce_id}">${prodList.produce_name}</option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">标题</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" placeholder="最多输入200个字符" id="caseTitleSelect" name="caseTitleSelect" onfocus="checkStrNum(this,200)" oninput="checkStrNum(this,200)" onpropertychange="checkStrNum(this,200)" value="${caseList.case_title}">
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-6 pd0">
												<label class="col-sm-4 control-label">状态</label>
												<div class="col-sm-8">
													<select style="cursor:pointer; border-radius: 4px;height: 34px;border:1px solid #CCCCCC;color: #9A9A9A" class="col-sm-12" tabindex="4" id="caseStateSelect" name="caseStateSelect">
														<option value="正常">正常</option>
														<option value="草稿">草稿</option>
														<option value="关闭">关闭</option>
													</select>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-6 pd0">
												<label class="col-sm-4 control-label">重要性</label>
												<div class="col-sm-8">
													<select style="cursor:pointer; border-radius: 4px;height: 34px;border:1px solid #CCCCCC;color: #9A9A9A" class="col-sm-12" tabindex="4" id="casePropSelect" name="casePropSelect">
														<option value="高">高</option>
														<option value="中">中</option>
														<option value="低">低</option>
													</select>
												</div>
											</div>
											<div class="col-sm-6 pd0">
												<label class="col-sm-4 control-label">管理人</label>
												<div class="col-sm-8">
													<select style="cursor:pointer; border-radius: 4px;height: 30px;border:1px solid #CCCCCC;color: #9A9A9A;" class="col-sm-12" tabindex="4" id="caseManagerSelect" name="caseManagerSelect">
														<c:forEach  items="${memberList}" var="merList">
														<option value="${merList.buser_id}">${merList.buser_name}</option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">描述</label>
											<div class="col-sm-10 relative">
												<textarea class="form-control textarea" rows="5" id="caseContentSelect" name="caseContentSelect" placeholder="最多输入2000个字符" onfocus="checkStrNum(this,2000)" oninput="checkStrNum(this,2000)" onpropertychange="checkStrNum(this,2000)">${caseList.case_content}</textarea>
												<div class="dragEditTestCaseDiv"></div>
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
											        <input type="button" id="btnUpload" value="确定" onclick="ajaxFileUpload8();" style="float:left;margin-top:5px;"/>                                       
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
									<div role="tabpanel" class="tab-pane" id="tabTestEditTags">
										<div class="bugTestTagsEditList"></div>
									</div>
									</c:forEach>
								</div>
								
							</div>
							
							<div class="modal-footer noborder">
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								<button type="submit" class="btn btn-info noborder saveTestCaseEditBtn">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 删除用例 -->
		<div class="modal fade myProjectModel myBugcloseModel in" id="DeleteDetails" tabindex="-3" role="dialog" style="z-index: 9999; margin-top: 50px; margin-left: -200px; padding-right: 17px;">
			<div class="modal-dialog" role="document" style="z-index: 1060">
				<div class="layui-layer layui-anim layui-layer-dialog " id="layui-layer3" type="dialog" times="3" showtime="0" contype="string" style="z-index: 19891017;">
					<div class="layui-layer-title" style="">提示</div>
					<div class="layui-layer-content">确定删除该用例？</div>
					<span class="layui-layer-setwin">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"><i class="fa fa-remove"></i></span>
						</button>
					</span>
					<div class="layui-layer-btn">
						<a class="layui-layer-btn0" onclick="deleteTestCase()">确定</a>
						<a class="layui-layer-btn1" data-dismiss="modal">取消</a>
					</div>
				</div>
			</div>
		</div>
	
		<!-- bugModel end  -->
		<!-- bugTestModel end -->
		<div class="floatBugInfo"></div>
		<!--  -->
		<script type="text/javascript" src="<%=path%>/css/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

	</body>

</html>