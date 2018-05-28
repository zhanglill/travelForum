<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>后台管理系统</title>
<script src="/travelForum/skin/js/jquery-2.2.3.min.js"></script>
<script src="/travelForum/skin/js/bootstrap.js"></script>
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>


<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<link href="/travelForum/skin/css/bootstrap.css" type="text/css"
	rel="stylesheet" media="all">
<link href="/travelForum/skin/css/font-awesome.css" rel="stylesheet">
<link href="/travelForum/manage/public/css/home.css" rel="stylesheet">

</head>
<body>

	<div style="width: 70%; margin: 1% 2% 1% 10%;">
		<div class="panel panel-default" id="main" style="">
			<div class="panel-heading" style="background-color: white">
				<a href="/travelForum/manage/user_list.jsp">用户管理</a> > 用户信息
			</div>

			<div class="panel-body" style="margin: 20px 60px;">

				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label for="userName" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" value="" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="phone" class="col-sm-2 control-label">手机号</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" value="" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-sm-2 control-label">邮箱</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" value="" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="type" class="col-sm-2 control-label">用户类型</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" value="" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="type" class="col-sm-2 control-label">是否锁定</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" value="" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="createTime" class="col-sm-2 control-label">注册时间</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" value="" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="type" class="col-sm-2 control-label">最后登录时间</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" value="" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="type" class="col-sm-2 control-label">登录ip</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" value="" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="type" class="col-sm-2 control-label">登录设备</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" value="" disabled>
						</div>
					</div>
					<div class="form-group" style="margin: 20px 110px;">
						<button id="back" class="btn btn-default back" type="button"
							style="margin-left: 200px;">返回上一级</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">

var username = '<%=request.getParameter("username")%>';
var phoneNum = '<%=request.getParameter("phoneNum")%>';
var email = '<%=request.getParameter("email")%>';
var type = '<%=request.getParameter("type")%>';

if(type == '0') {
	type="普通用户";
}else if(type == '1') {
	type="管理员";
}


var isLocked = '<%=request.getParameter("isLocked")%>';
if(isLocked == '0') {
	isLocked="未锁定";
}else if(isLocked == '1') {
	isLocked="锁定";
}

var createTime = '<%=request.getParameter("createTime")%>';
var loginTime = '<%=request.getParameter("loginTime")%>';
var ip = '<%=request.getParameter("ip")%>';
var device = '<%=request.getParameter("device")%>';
	loginTime = getdate(loginTime);

	//时间戳格式转
	function getdate() {
		var now = new Date(), y = now.getFullYear(), m = now.getMonth() + 1, d = now
				.getDate();
		return y + "-" + (m < 10 ? "0" + m : m) + "-" + (d < 10 ? "0" + d : d)
				+ " " + now.toTimeString().substr(0, 8);
	}

	$(function() {
		$("form .form-group:nth-child(1) input").attr("value", username);
		$("form .form-group:nth-child(2) input").attr("value", phoneNum);
		$("form .form-group:nth-child(3) input").attr("value", email);
		$("form .form-group:nth-child(4) input").attr("value", type);
		$("form .form-group:nth-child(5) input").attr("value", isLocked);
		$("form .form-group:nth-child(6) input").attr("value", createTime);
		$("form .form-group:nth-child(7) input").attr("value", loginTime);
		$("form .form-group:nth-child(8) input").attr("value", ip);
		$("form .form-group:nth-child(9) input").attr("value", device);

	})

	$("#back")
			.on(
					"click",
					function() {
						window.top.frames['mainframe'].document.location = "/travelForum/manage/user_list.jsp"
					});
</script>
</html>