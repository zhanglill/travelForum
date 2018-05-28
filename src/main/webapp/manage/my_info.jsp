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
<title>个人信息</title>
<style type="text/css">
a {
	color: #8A8A8A;
	cursor: pointer;
}

body {
	overflow-x: hidden;
	background: #f2f0f5;
	padding: 15px 0px 10px 5px;
}
</style>
</head>
<body>

	<div style="width: 70%; margin: 1% 2% 1% 10%; align: center;">
		<div class="panel panel-default" id="main" style="">
			<div class="panel-heading" style="background-color: white">
				<a href="/travelForum/">个人信息</a>
			</div>

			<div class="panel-body">

				<div class="row">
					<div class="col-sm-10" style="margin: 20px 150px;">
						<ul id="myTab" class="nav nav-tabs">
							<li class="active"><a href="#myInfo" data-toggle="tab">个人资料</a></li>
							<li><a href="#editInfo" data-toggle="tab">资料修改</a></li>
							<li><a href="#editPassword" data-toggle="tab">密码修改</a></li>
						</ul>

						<div id="myTabContent" class="tab-content"
							style="margin-top: 50px;">

							<div class="tab-pane fade in active" id="myInfo">

								<form class="form-horizontal" role="form">
									<div class="form-group">
										<label for="userName" class="col-sm-2 control-label">用户名</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="userName"
												value="" disabled>
										</div>
									</div>
									<div class="form-group">
										<label for="email" class="col-sm-2 control-label">邮箱</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="email" value=""
												disabled>
										</div>
									</div>
									<div class="form-group">
										<label for="phone" class="col-sm-2 control-label">手机号</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="phone" value=""
												disabled>
										</div>
									</div>
									<div class="form-group">
										<label for="createTime" class="col-sm-2 control-label">注册时间</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="createTime"
												value="" disabled>
										</div>
									</div>
									<div class="form-group">
										<label for="type" class="col-sm-2 control-label">用户类型</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="type" value=""
												disabled>
										</div>
									</div>
								</form>
							</div>


							<div class="tab-pane fade" id="editInfo">

								<form class="form-horizontal" method="post"
									action="/travelForum/user/updateUser">
									<!-- <form class="form-horizontal"> -->
									<div class="form-group" style="display: none">
										<label for="id" class="col-sm-2 control-label">用户id</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="id" name="id"
												placeholder="请输入用户名" value="${sessionScope.userId}"
												required="required">
										</div>
									</div>
									<div class="form-group">
										<label for="userName" class="col-sm-2 control-label">用户名</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="username"
												name="username" placeholder="请输入用户名" required="required"
												value="">
										</div>
									</div>
									<div class="form-group">
										<label for="email" class="col-sm-2 control-label">邮箱</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="e-email"
												name="email" placeholder="请输入邮箱" required="required"
												value="">
										</div>
									</div>
									<div class="form-group">
										<label for="phone" class="col-sm-2 control-label">手机号</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="phoneNum"
												name="phone" placeholder="请输入手机号" required="required"
												value="">
										</div>
									</div>
									<div class="form-group">
										<input type="submit" class="btn btn-success" id="saveEdit"
											style="margin-left: 270px;" value="保存"> <input
											type="reset" class="btn btn-default" id="reset"
											style="margin-left: 30px;" value="重置">
									</div>
								</form>

							</div>


							<div class="tab-pane fade" id="editPassword">

								<!-- <form class="form-horizontal" method="post"
									action="/travelForum/user/updatePassword"> -->
								<form class="form-horizontal">
									<div class="form-group">
										<label for="password" class="col-sm-2 control-label">原始密码</label>
										<div class="col-sm-6">
											<input type="password" class="form-control" id="oldPassword"
												name="password" placeholder="请输入原始密码" required="required">
										</div>
									</div>
									<div class="form-group">
										<label for="password" class="col-sm-2 control-label">新密码</label>
										<div class="col-sm-6">
											<input type="password" class="form-control" id="newPassword"
												name="password" placeholder="请输入新密码" required="required">
										</div>
									</div>
									<div class="form-group">
										<label for="password" class="col-sm-2 control-label">密码确认</label>
										<div class="col-sm-6">
											<input type="password" class="form-control"
												id="secondPassword" name="password" placeholder="请再次输入密码"
												required="required">
										</div>
									</div>
									<div class="form-group">
										<input type="submit" class="btn btn-success"
											id="updatePassword" style="margin-left: 270px;" value="保存">
										<input type="reset" class="btn btn-default" id="reset2"
											style="margin-left: 30px;" value="重置">
									</div>
								</form>

							</div>

						</div>

					</div>
				</div>
			</div>
		</div>

	</div>
	<div style="display: none" id="userId">${sessionScope.userId}</div>

</body>

<script type="text/javascript">
	var contextPath = '<%=request.getContextPath()%>';
	var userId = $("#userId").text();

	$(function() {
		initPageDom();
		initPageEvent();
	});

	function initPageDom() {
		initMyInfo();
	}

	function initPageEvent() {
		// 修改资料
		//$(document).on("click", "#edit", edit);
		$(document).on("click", "#saveEdit", saveEdit);
		// 修改密码
		$(document).on("click", "#updatePassword", updatePassword);
	}

	function initMyInfo() {
		$.ajax({
					type : "GET",
					url : contextPath + "/user/getUserById/" + userId,
					dataType : "json",
					success : function(datas) {
						var type = datas.data.type;
						if(type == 0){
							type = "普通用户";
						}else if (type == 1) {
							type = "管理员";
						} else if (type == 2) {
							type = "超级管理员";
						}

						$("#myInfo input[id=userName]").attr("value",
								datas.data.username);
						$("#myInfo input[id=email]").attr("value",
								datas.data.email);
						$("#myInfo input[id=phone]").attr("value",
								datas.data.phoneNum);
						$("#myInfo input[id=createTime]").attr("value",
								datas.data.createTime);
						$("#myInfo input[id=type]").attr("value", type);

						$("#editInfo input[name=id]").attr("value",
								datas.data.id);
						$("#editInfo input[name=username]").attr("value",
								datas.data.username);
						$("#editInfo input[name=email]").attr("value",
								datas.data.email);
						$("#editInfo input[name=phone]").attr("value",
								datas.data.phoneNum);
					}
				});
	}

	function edit() {
		$.ajax({
			type : "GET",
			url : contextPath + "/user/getUserById/" + userId,
			dataType : "json",
			success : function(datas) {
				var username = datas.data.username;
				var email = datas.data.email;
				var phoneNum = datas.data.phoneNum;
				var createTime = datas.data.createTime;
				var type = datas.data.type;
				window.top.frames['mainframe'].document.location = contextPath
						+ "/manage/edit_info.jsp?username=" + username
						+ "&phoneNum=" + phoneNum + "&email=" + email
						+ "&type=" + type + "&createTime=" + createTime;
			}
		});
	}

	function saveEdit() {
		var id = $("#editInfo input[name=id]").val();
		var username = $("#editInfo input[name=username]").val();
		var email = $("#editInfo input[name=email]").val();
		var phone = $("#editInfo input[name=phone]").val();

		$.ajax({
			type : "POST",
			url : contextPath + "/user/updateUser",
			dataType : "json",
			data : {
				"id" : id,
				"username" : username,
				"email" : email,
				"phone" : phone
			},
			success : function(datas) {
				if (datas.message == "success") {
					//window.top.frames['mainframe'].document.location = contextPath + "/manage/user_list.jsp";
					alert("更新成功！");
				} else {
					alert("更新失败！");
				}
			}
		});
	}

	function updatePassword() {

		var oldPassword = $("#oldPassword").val();
		var newPassword = $("#newPassword").val();
		var secondPassword = $("#secondPassword").val();

		if (newPassword == secondPassword) {
			$.ajax({
				type : "POST",
				url : contextPath + "/user/updatePassword",
				dataType : "json",
				data : {
					"oldPassword" : oldPassword,
					"newPassword" : newPassword,
					"secondPassword" : secondPassword
				},
				success : function(datas) {
					if (datas.message == "no") {
						alert("输入的原始密码不正确！");
					} else if (datas.message == "success") {
						alert("密码修改成功！");
					} else {
						alert("密码修改失败！");
					}
				}
			});
		} else {
			alert("两次密码不一致！");
		}

	}
</script>

</html>