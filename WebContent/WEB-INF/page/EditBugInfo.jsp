<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link type="image/x-icon" rel="icon" href="<%=path%>/img/favic.ico"/>
</head>
<body>
<!-- 编辑测试组 -->
<div class="modal fade myProjectBugTest in" id="myProjectTestGroupEdit"
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
</div>
</body>
</html>

