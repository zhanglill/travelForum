<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<link href="/travelForum/skins/skin/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/travelForum/skins/skin/css/font-awesome.min.css"
	rel="stylesheet">
<script src="/travelForum/skins/js/jquery-3.2.1.js"></script>
<script src="/travelForum/skins/js/bootstrap.min.js"></script>
<title>个人信息 › 修改个人资料</title>
<style type="text/css">
a {
	color: #8A8A8A;
	cursor: pointer;
}
</style>
</head>
<body>
	<div style="width: 70%; margin: 1% 2% 1% 5%; float: left;">
		<div class="panel panel-default" id="main" style="">
			<div class="panel-heading" style="background-color: white">
				<a href="/travelForum/">个人信息 </a> › 修改个人资料
			</div>

			<div class="panel-body">

				<form class="form-horizontal" method="post" action="/travelForum/user/updateUser">
					<div class="form-group" style="display:none">
						<label for="userId" class="col-sm-2 control-label">用户id</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="userId"
								name="id" placeholder="请输入用户名" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="userName" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="userName"
								name="username" placeholder="请输入用户名" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="请输入密码" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-sm-2 control-label">邮箱</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="email"
								name="email" placeholder="请输入邮箱" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="phone" class="col-sm-2 control-label">手机号</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="phone"
								name="phone" placeholder="请输入手机号" required="required">
						</div>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-success"
							id="save" style="margin-left: 430px;" value="保存">
					</div>

				</form>

			</div>

		</div>

	</div>
	<div style="display: none" id="userId">${sessionScope.userId}</div>
	<script type="text/javascript">
	var contextPath = '<%=request.getContextPath()%>';
		var userId = $("#userId").text();
		var userName = '<%=request.getParameter("username")%>';
		var phone = '<%=request.getParameter("phoneNum")%>';
		var createTime = '<%=request.getParameter("createTime")%>';
		var email = '<%=request.getParameter("email")%>';
		var type = '<%=request.getParameter("type")%>';
		
		$(function() {
			initPageDom();
			initPageEvent();
		});

		function initPageDom() {
			$("input[id=userId]").attr("value", userId);
			$("input[id=userName]").attr("value", userName);
			$("input[id=email]").attr("value", email); 
			$("input[id=phone]").attr("value", phone); 
			$("input[id=createTime]").attr("value", createTime); 
			$("input[id=type]").attr("value", type); 
		}

		function initPageEvent() {
			// 修改资料
			//$(document).on("click", "#save", save);
		}

	</script>


</body>
</html>