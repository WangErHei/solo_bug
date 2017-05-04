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
<div class="modal fade myProjectBugTest" id="myProjectTestGroupAdd"
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
							<i class="fa fa-plus-circle"></i> 添加测试组
						</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="testGroupAddForm"
							name="testGroupAddForm" action="javascript:addTestGroup($('#groupName').val())" method="post">
							<div class="form-group">
								<label class="control-label"style="float: left; width: 90px;">测试组名称</label>
								<div class="col-sm-10 onFocus">
									<input type="text" id="groupName" name="groupName" class="form-control"
										placeholder="最多输入200个字符" name="title"
										onfocus="checkStrNum(this,200)"
										oninput="checkStrNum(this,200)"
										onpropertychange="checkStrNum(this,200)" data-value="123456">
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
</body>
</html>