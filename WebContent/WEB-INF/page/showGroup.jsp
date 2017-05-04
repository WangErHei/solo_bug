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
<div class="modal fade myProjectBugTest in"
			id="myProjectTestGroupModal" tabindex="-1" role="dialog"
			style="padding-left: 17px;">
			<div class="modal-dialog" role="document" style="z-index: 999999">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"><i class="fa fa-remove"></i></span>
						</button>
						<h4>
							<i class="fa fa-folder-o"></i> 管理测试组
						</h4>
					</div>
					<div class="modal-body">
						<div class="bugInfoHistories">
							<c:forEach items="${groupList}" var="groList">
								<p class="sub">
									<span> <i class="fa fa-folder-open-o"
										style="display: block; color: #4A4A4A; float: left; position: relative; margin-top: 8px; margin-right: 5px;"></i>
										${groList.group_name}
									</span> <i class="fa fa-edit noption"
										data-target="#myProjectTestGroupEdit" alt="修改"
										title="修改" data-toggle="modal" onclick="editGroup(${groList.group_id})"></i> <i
										class="fa fa-trash-o noption" alt="删除" title="删除"
										data-toggle="modal" onclick="deleteGroup(${groList.group_id})"></i>
								</p>
							</c:forEach>
						</div>
						<div class="optionBtns">
							<span id="addTestCaseGroupBtn" data-toggle="modal"
								onclick="addGroup()" alt="添加" title="添加"><i
								class="fa fa-plus-circle"></i></span>

						</div>
					</div>
				</div>
			</div>
		</div> 
</body>
</html>