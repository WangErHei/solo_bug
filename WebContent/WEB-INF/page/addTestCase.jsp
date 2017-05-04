<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="modal fade myProjectBugTest in" id="myProjectTestModal"
			tabindex="-1" role="dialog" data-backdrop="static"
			data-keyboard="false" style="padding-left: 17px;">
			<div class="modal-dialog" role="document" style="z-index: 1040">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"><i class="fa fa-remove"></i></span>
						</button>
						<h4>
							<i class="fa fa-plus-circle"></i> 新建测试用例
						</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="testCaseModelForm"
							name="testCaseModelForm" action="javascript:postAddTestCase($('#caseGroup').val(),
							$('#caseProduce').val(),$('#caseTitle').val(),$('#caseState').val(),$('#caseProp').val(),
							$('#caseManager').val(),$('#caseContent').val(),$('#result').val(),$('#results').val(),
							$('#resultss').val())" method="post">
							<div class="tabTest tabBug">
								<ul class="nav nav-tabs" role="tablist" style="display: none">
									<li role="presentation" class="active"
										style="width: 50%; display: none;"><a href="#tabTestInfo"
										aria-controls="tabTestInfo" role="tab" data-toggle="tab">信息与描述</a>
									</li>
									<li role="presentation" id="tabs-li-tags"
										style="display: none; width: 50%;"><a href="#tabTestTags"
										aria-controls="tabTestTags" role="tab" data-toggle="tab">标签</a>
									</li>
								</ul>
								<div class="tab-content">
									<div role="tabpanel" class="tab-pane active" id="tabTestInfo">
										<div class="form-group">
											<div class="col-sm-6 pd0">
												<label class="col-sm-4 control-label">测试组</label>
												<div class="col-sm-8">
													<select
														style="cursor: pointer; border-radius: 4px; height: 34px; border: 1px solid #CCCCCC; color: #9A9A9A"
														class="col-sm-12" tabindex="4" id="caseGroup"
														name="caseGroup">
														<option value="0">[无]</option>
														<c:forEach items="${groupList}" var="groupList">
															<option value="${groupList.group_id }">${groupList.group_name }</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="col-sm-6 pd0">
												<label class="col-sm-4 control-label">模块</label>
												<div class="col-sm-8">
													<select
														style="cursor: pointer; border-radius: 4px; height: 30px; border: 1px solid #CCCCCC; color: #9A9A9A;"
														class="col-sm-12" tabindex="4" id="caseProduce"
														name="caseProduce">
														<option value="0">[未指定]</option>
														<c:forEach items="${produceList}" var="prodList">
															<option value="${prodList.produce_id }">${prodList.produce_name }</option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">名称</label>
											<div class="col-sm-10 onFocus">
												<input type="text" class="form-control"
													placeholder="最多输入200个字符" name="caseTitle"
													id="caseTitle"
													onfocus="checkStrNum(this,200)"
													oninput="checkStrNum(this,200)"
													onpropertychange="checkStrNum(this,200)"
													data-value="123456">
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-6 pd0">
												<label class="col-sm-4 control-label">状态</label>
												<div class="col-sm-8">
													<select
														style="cursor: pointer; border-radius: 4px; height: 34px; border: 1px solid #CCCCCC; color: #9A9A9A"
														class="col-sm-12" tabindex="4" id="caseState"
														name="caseState">
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
													<select
														style="cursor: pointer; border-radius: 4px; height: 34px; border: 1px solid #CCCCCC; color: #9A9A9A"
														class="col-sm-12" tabindex="4" id="caseProp"
														name="caseProp">
														<option value="高">高</option>
														<option value="中">中</option>
														<option value="低">低</option>
													</select>
												</div>
											</div>
											<div class="col-sm-6 pd0">
												<label class="col-sm-4 control-label">管理人</label>
												<div class="col-sm-8">
													<select
														style="cursor: pointer; border-radius: 4px; height: 30px; border: 1px solid #CCCCCC; color: #9A9A9A;"
														class="col-sm-12" tabindex="4" id="caseManager"
														name="caseManager">
														<c:forEach items="${memberList}" var="merList">
															<option value="${merList.buser_id}">${merList.buser_name}</option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">描述<br/>(输入,期望输出)</label>
											<div class="col-sm-10 relative onFocus">
												<textarea class="form-control textarea" rows="5"
													name="caseContent"
													id="caseContent"
													placeholder="最多输入2000个字符"
													onfocus="checkStrNum(this,2000)"
													oninput="checkStrNum(this,2000)"
													onpropertychange="checkStrNum(this,2000)"
													data-value="123456"></textarea>
												<div class="dragTestCaseDiv"></div>
											</div>
										</div>
										<div class="showAndHideImageFujianDiv" style="">
											<div class="form-group">
												<label class="col-sm-2 control-label">图片</label>
												<div class="col-sm-10 text-right relative">
													<input type="file" id="uploadFile" name="file"
														accept=".png,.jpg" /> <input type="button" id="btnUpload"
														value="确定" onclick="ajaxFileUpload()" style="float:left;margin-top:5px;"/>
														 <input type="text" id="result" name="result" value=""readonly="readonly"style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">附件</label>
												<div class="col-sm-10">
													<input name="file" type="file" id="imgfile"
														accept=".doc,doxc,txt" /> <input type="button"
														id="btnUpload" value="确定" onclick="FileUpload()" style="float:left;margin-top:5px;"/> <input
														type="text" id="results" name="results" value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/> <input
														type="text" id="resultss" name="resultss" value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
												</div>
											</div>
										</div>
									</div>
									<div role="tabpanel" class="tab-pane" id="tabTestTags">
										<div class="bugTestTagsList"></div>
									</div>
								</div>
							</div>
							<div class="modal-footer noborder">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
								<button type="submit"
									class="btn btn-info noborder saveTestCaseBtn">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>