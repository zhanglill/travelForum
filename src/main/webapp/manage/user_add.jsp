<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>添加管理员</title>
<script src="/travelForum/skin/js/jquery-2.2.3.min.js"></script>
<script src="/travelForum/skin/js/bootstrap.js"></script>

<link href="/travelForum/skin/css/bootstrap.css" type="text/css"
	rel="stylesheet" media="all">
<link href="/travelForum/skin/css/font-awesome.css" rel="stylesheet">
<link href="/travelForum/manage/public/css/home.css" rel="stylesheet">
</head>
<body>

	<div style="width: 70%; margin: 1% 2% 1% 5%; float: left;">
		<div class="panel panel-default" id="main" style="">
			<div class="panel-heading" style="background-color: white">
				<a href="/travelForum/manage/user_list.jsp">用户管理</a> › 新增管理员
			</div>

			<div class="panel-body" style="margin: 50px 200px;">

				<!-- <form class="form-horizontal" method="post" id="saveOrUpdateForm" action="/travelForum/user/register"> -->
				<form class="form-horizontal" id="saveOrUpdateForm">

					<div class="form-group">
						<label for="username" class="col-sm-3 control-label">用户名</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="username"
								name="username" placeholder="请输入用户名" value=""
								required="required">
						</div>
					</div>

					<div class="form-group">
						<label for="password" class="col-sm-3 control-label">密码</label>
						<div class="col-sm-7">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="请输入密码" value="" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-sm-3 control-label">邮箱</label>
						<div class="col-sm-7">
							<input type="email" class="form-control" id="email" name="email"
								placeholder="请输入邮箱" value="" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="phoneNum" class="col-sm-3 control-label">手机号</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="phoneNum"
								name="phoneNum" placeholder="请输入手机号" value=""
								required="required">
						</div>
					</div>
					<div class="form-group" style="margin: 50px 60px;">
						<input type="submit" class="btn btn-success" id="save" value="保存">
						<input type="reset" class="btn btn-default" id="reset" value="重置">
						<button id="back" class="btn btn-default" type="button">返回上一级</button>
					</div>
				</form>

			</div>

		</div>
	</div>

	<script type="text/javascript">
	var contextPath = '<%=request.getContextPath()%>';
	
	$(function() {
		initPageEvent();
	});

	function initPageEvent() {
		// 返回上一级
		$(document).on("click", "#back", backToIndex);
		// 保存新增用户
		$(document).on("click", "#save", saveUser);

	}
	
	function backToIndex() {
		window.top.frames['mainframe'].document.location = "/travelForum/manage/user_list.jsp";
	}
	
	function saveUser() {
		var username = $("input[name=username]").val();
		var password = $("input[name=password]").val();
		var email = $("input[name=email]").val();
		var phoneNum = $("input[name=phoneNum]").val();
		
		$.ajax({
			type : "POST",
			url : contextPath + "/user/register",
			async : false,
			data : {
				"username" : username,
				"password" : password,
				"email" : email,
				"tel" : phoneNum
			},
			dataType : "json",
			success : function(datas) {
				if(datas.message == "success") {
					window.top.frames['mainframe'].document.location = contextPath + "/manage/user_list.jsp";
					alert("保存成功！");
				}else{
					alert("保存失败！");
				}
			}
		});
	}
	
	</script>
</body>
</html>