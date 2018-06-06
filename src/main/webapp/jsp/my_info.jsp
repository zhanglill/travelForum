<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<meta name="keywords" content="" />
<script type="application/x-javascript">
	
	
	
	
    
     addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 




</script>
<!-- Custom Theme files -->
<link href="/travelForum/skin/css/bootstrap.css" type="text/css"
	rel="stylesheet" media="all">
<link href="/travelForum/skin/css/style.css" type="text/css"
	rel="stylesheet" media="all">
<link rel="stylesheet" href="/travelForum/skin/css/flexslider.css"
	type="text/css" media="all" />
<link href="/travelForum/skin/css/font-awesome.css" rel="stylesheet">
<!-- font-awesome icons -->
<link href="/travelForum/skin/css/owl.carousel.css" rel="stylesheet"
	type="text/css" media="all">
<!-- //Custom Theme files -->
<!-- js -->
<script src="/travelForum/skin/js/jquery-2.2.3.min.js"></script>
<script src="/travelForum/skin/js/smoothscroll.min.js"></script>
<!-- //js -->
<!-- web-fonts -->
<link
	href="http://fonts.googleapis.com/css?family=Dancing+Script:400,700"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<!-- //web-fonts -->

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

	<!-- 引入header文件 -->
	<jsp:include page="header.jsp"></jsp:include>



	<div style="width: 70%; margin: 1% 2% 1% 15%; align: center;">
		<div class="panel panel-default" id="main" style="">
			<div class="panel-heading" style="background-color: white">
				<a href="/travelForum/">首页</a>> 个人信息
			</div>

			<div class="panel-body">

				<div class="row">
					<div class="col-sm-10" style="margin: 20px 150px;">
						<ul id="myTab" class="nav nav-tabs">
							<li class="active"><a href="#myInfo" data-toggle="tab">个人资料</a></li>
							<li><a href="#editInfo" data-toggle="tab">资料修改</a></li>
							<li><a href="#updateAvatar" data-toggle="tab">修改头像</a></li>
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

							<div class="tab-pane fade" id="updateAvatar">

								<form action="/travelForum/user/settings/avatar/update"
									enctype="multipart/form-data" method="post"
									class="form-horizontal" role="form">
									<div style="margin-left: 17%">
										<img width="60px" height="60px" src="" class="img-rounded">
										<input type="file" name="avatar"
											accept="image/png,image/jpeg,image/jpg"> <br /> <input
											class="btn btn-default" type="submit" value="上传头像">
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
	<div style="display: none" id="message">${"message"}</div>

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
		$(document).on("click", "#saveEdit", saveEdit);
	}

	function initMyInfo() {
		$
				.ajax({
					type : "GET",
					url : contextPath + "/user/getUserById/" + userId,
					dataType : "json",
					success : function(datas) {
						var type = datas.data.type;
						if (type == 0) {
							type = "普通用户";
						} else if (type == 1) {
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

						$("#updateAvatar img").attr("src",
								"/travelForum/skins/skin/" + datas.data.avatar);
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
			url : contextPath + "/user/updateMyInfo",
			dataType : "json",
			data : {
				"id" : id,
				"username" : username,
				"email" : email,
				"phone" : phone
			},
			success : function(datas) {
				var message = $("#message").val();
				alert(message);
			}
		});
	}

	// 登出 
	$("#logout").on("click", function() {
		$.ajax({
			url : contextPath + "/user/signout",
		/* success : function(data) {
		} */
		});
	});
</script>

<link rel="stylesheet" href="/travelForum/skin/css/jquery.desoslide.css">
<script src="/travelForum/skin/js/jquery.desoslide.js"></script>
<script>
	$('#demo1_thumbs').desoSlide({
		main : {
			container : '#demo1_main_image',
			cssClass : 'img-responsive'
		},
		effect : 'sideFade',
		caption : true
	});
</script>
<!-- //news -->
<!-- menu js -->
<script>
	$('.toggle').on('click', function() {
		$('.menu').toggleClass('open');
		$('.w3nav').toggleClass('show-w3nav');
		$('.w3nav a').toggleClass('show-w3nav-link');
		$('.toggle').toggleClass('close');
	});
</script>
<!-- //menu js -->
<script src="/travelForum/skin/js/owl.carousel.js"></script>
<!-- start-smooth-scrolling -->
<script type="text/javascript" src="/travelForum/skin/js/move-top.js"></script>
<script type="text/javascript" src="/travelForum/skin/js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();

			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<!-- //end-smooth-scrolling -->
<!-- smooth-scrolling-of-move-up -->
<script type="text/javascript">
	$(document).ready(function() {
		$().UItoTop({
			easingType : 'easeOutQuart'
		});

	});
</script>
<!-- //smooth-scrolling-of-move-up -->
<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/travelForum/skin/js/bootstrap.js"></script>

<!-- FlexSlider -->
<script defer src="/travelForum/skin/js/jquery.flexslider.js"></script>
<script type="text/javascript">
	$(window).load(function() {
		$('.flexslider').flexslider({
			animation : "slide",
			start : function(slider) {
				$('body').removeClass('loading');
			}
		});
	});
</script>
<!-- End-slider-script -->
</html>