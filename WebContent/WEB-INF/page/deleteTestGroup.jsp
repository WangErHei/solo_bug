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
	<!-- 删除测试组 -->
	<div class="modal fade myProjectModel myBugcloseModel in"
	id="DeleteTestgroups" tabindex="-3" role="dialog"
	style="z-index: 9999; margin-top: 50px; margin-left: -200px; padding-right: 17px;">
	<div class="modal-dialog" role="document" style="z-index: 1060">
		<div class="layui-layer layui-anim layui-layer-dialog "
					id="layui-layer3" type="dialog" times="3" showtime="0"
					contype="string" style="z-index: 19891017;">
					<div class="layui-layer-title" style="">提示</div>
					<div class="layui-layer-content">确定要删除该测试组吗？</div>
					<span class="layui-layer-setwin">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"><i class="fa fa-remove"></i></span>
						</button>
					</span>
					<div class="layui-layer-btn">
						<a class="layui-layer-btn0" href="javascript:deleteGroupSure()" >确定</a> <a class="layui-layer-btn1"
							data-dismiss="modal">取消</a>
					</div>
				</div>
			</div>
		</div>
</body>
</html>