<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>登录</title>

<style>
html, body {
	height: 100%;
	font-size: 14px;
	color: #525252;
	font-family: NotoSansHans-Regular, AvenirNext-Regular, arial,
		Hiragino Sans GB, "Microsoft Yahei", "Hiragino Sans GB",
		"WenQuanYi Micro Hei", sans-serif;
	background: #f0f2f5;
}

.login-content {
	width: 100%;
	height: 100%;
}

.box {
	width: 400px;
	height: 360px;
	padding: 40px;
	background-color: #fff;
	margin: 60px auto;
}

/*用户名密码框样式 */
.input-group-addon {
	height: 40px;
	padding: 6px 20px;
	background-position: center;
	background-size: 50%;
}

.input-group-addon .fa {
	font-size: 18px;
}

.password .fa-lock {
	font-size: 22px;
}

.form-control {
	background-color: #f8f8f8;
	border-left: 0px;
	box-shadow: none;
	border-radius: 4px;
	padding-left: 0px;
}

.input-group {
	width: 320px;
}

#loginForm {
	margin-top: 30px;
}

#loginForm .input-group {
	border-radius: 4px;
}

#registerForm {
	margin-top: 20px;
}

#registerForm .ue-form {
	width: 320px;
	border: 1px solid #8c8a88;
	border-radius: 4px;
}

.input-group .ue-form {
	height: 43px;
	padding-left: 10px;
}

.checkbox {
	margin-top: 25px;
	margin-bottom: 25px;
}

/* .form-checkbox {
	line-height: 20px;
	color: #999;
	font-size: 12px;
}

.form-checkbox input {
	margin-top: 0px;
	cursor: pointer;
}

.form-checkbox span {
	margin-left: 10px;
} */

#register .form-control {
	border-radius: 4px;
}

#password {
	border-bottom-right-radius: 4px;
	border-top-right-radius: 4px;
}

#forgetPass {
	color: #ff0000d9;
	float: left;
	text-decoration: none;
}

/* 登录按钮样式 */
.btn {
	display: inline-block;
	width: 40%;
	height: 36px;
	border-radius: 4px;
	font-size: 14px;
	color: #fff;
	background-color: #0099ff;
	margin-left: 20px;
}

.btn:hover, .btn:focus {
	color: #fff;
	background-color: #48a3f8;
}

#buttonDiv {
	width: 320px;
	margin-top: 20px;
}

/* 错误提示样式 */
.avatar {
	margin-top: 45px;
	height: 20px;
	margin-bottom: 10px;
}

.avatar span {
	font-size: 18px;
	padding-bottom: 8px;
	font-family: 微软雅黑;
	border-bottom: 2px solid #009eff;
}

/*用户名和密码错误提示信息样式 */
.error-hints {
	height: 30px;
	line-height: 30px;
	font-size: 14px;
	color: #f52941;
	padding-left: 10px;
	margin-bottom: 5px;
	background-color: #fff2f2;
	border-radius: 10px;
}

.error-hints>p {
	display: inline;
	margin-left: 5px;
}

.avatar>div {
	margin-top: 8px;
}

a {
	color: #8A8A8A;
	cursor: pointer;
}
</style>



<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- 引入css文件 -->
<link href="/travelForum/skin/css/bootstrap.css" type="text/css"
	rel="stylesheet" media="all">
<link href="/travelForum/skin/css/bootstrap.min.css" rel="stylesheet">
<link href="/travelForum/skin/css/style.css" type="text/css"
	rel="stylesheet" media="all">
<link href="/travelForum/skin/css/font-awesome.css" rel="stylesheet">
<link href="/travelForum/skin/css/font-awesome.min.css" rel="stylesheet">
<!-- 引入js文件 -->
<!-- jQuery文件,务必在bootstrap.min.js 之前引入 -->
<script src="/travelForum/skin/js/jquery-2.2.3.min.js"></script>
<script src="/travelForum/skin/js/jquery.min.js"></script>
<script src="/travelForum/skin/js/bootstrap.min.js"></script>
<script src="/travelForum/skin/js/js.cookie.js"></script>
<script src="/travelForum/skin/js/smoothscroll.min.js"></script>
<!-- web-fonts -->
<link
	href="http://fonts.googleapis.com/css?family=Dancing+Script:400,700"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<!-- //web-fonts -->

</head>
<body style="background-color: #1b17171a;">

<!-- 引入header文件 -->
	<jsp:include page="header.jsp"></jsp:include>
	<div class="login-content">
		<div class="box">
			<div class="box-body">

				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#login" data-toggle="tab">登录</a></li>
					<li><a href="#register" data-toggle="tab">注册</a></li>
				</ul>

				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade in active" id="login">
						<form id="loginForm" method="post">
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon user">
										<i class="fa fa-user" aria-hidden="true"></i>
									</div>
									<input type="text" class="form-control ue-form"
										id="loginUserName" name="Username" tabindex="1"
										placeholder="请输入用户名" required="required">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon password">
										<i class="fa fa-lock" aria-hidden="true"></i>
									</div>
									<input type="password" class="form-control ue-form"
										id="loginPassword" name="password" tabindex="2"
										placeholder="请输入密码" required="required">
								</div>
							</div>
							<div class="checkbox">
								<a id="forgetPass" href="forgetPass.jsp" tabindex="4">忘记密码？</a>
								<label class="form-checkbox" style="float:right"><span><a href="/travelForum/manage/login.jsp">管理员登录</a></span></label> 
							</div>
							<div class="avatar">
								<div id="hints" class="error-hints" style="display: none;">
									<i class="fa fa-exclamation-circle"></i>
									<p id="info">
								</div>
							</div>
							<div id="buttonDiv">
								<button class="btn btn-info" id="loginButton" tabindex="5"
									type="button">登录</button>
								<button class="btn btn-default back" tabindex="4" type="reset">返回首页</button>
							</div>
						</form>
					</div>

					<div class="tab-pane fade" id="register">
						<form id="registerForm" method="post" action="/travelForum/user/register">
							<!-- <form id="registerForm" method="post" action="/user/add/do"> -->
							<div class="form-group">
								<div class="input-group">
									<label for="userName">用户名：</label> <input type="text"
										class="form-control ue-form" id="registerUserName"
										name="username" tabindex="1" placeholder="请输入用户名"
										required="required">
									
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<label for="userName">密码：</label> <input type="password"
										class="form-control ue-form" id="registerPassword"
										name="password" tabindex="2" placeholder="请输入密码"
										required="required">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<label for="userName">电子邮件：</label> <input type="email"
										class="form-control ue-form" id="email" name="email"
										tabindex="2" placeholder="请输入邮箱" required="required">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<label for="userName">手机号：</label> <input type="text"
										class="form-control ue-form" id="registerPhoneNum" name="tel"
										tabindex="3" placeholder="请输入手机号" required="required">
								</div>
							</div>
							<div id="buttonDiv">
								<button class="btn btn-info" id="registerButtons" tabindex="4"
									type="submit">注册</button>
								<button class="btn btn-default back" tabindex="5" type="button">返回首页</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
	<div style="display: none" id="clickTypeVal">${clickType}</div>

	<!-- start-smooth-scrolling -->
	<script type="text/javascript" src="/travelForum/skin/js/move-top.js"></script>
	<script type="text/javascript" src="/travelForum/skin/js/easing.js"></script>
	<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
			
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
	</script>
	<!-- //end-smooth-scrolling -->

</body>

<script type="text/javascript">

var contextPath = '<%=request.getContextPath()%>';
	var clickType = $("#clickTypeVal").text();
	$(function() {
		initPageDom();
		initPageEvent();
	});

	function initPageDom() {
		if (clickType == "2") {
			$("#myTab li:first-child").removeClass("active");
			$("#login").removeClass("active");
			$("#myTab li:nth-child(2)").addClass("active");
			$("#register").addClass("active in");
			TabClick();
		}
	}

	function initPageEvent() {
		/* 点击注册Tab,更改box样式 */
		$(document).on("click", "#myTab li", TabClick);

		/* 返回首页事件 */
		$(document).on("click", ".back", backToIndex);

		/* 登录按钮点击事件 */
		$(document).on("click", "#loginButton", loginButtonClick);

		/* 注册按钮点击事件 */
		//$(document).on("click", "#registerButton", registerButtonClick);

	}

	/* 点击注册Tab,更改box样式 */
	function TabClick() {
		var registerTab = $("#myTab li:nth-child(2)").attr("class");
		if (registerTab == "active") {
			$(".login-content .box").css("height", "500px");
		} else {
			$(".login-content .box").css("height", "360px");
		}
	}

	function backToIndex() {
		window.location.href = contextPath + "/";
	}

	/* -------------------------登录 ------------------------------*/
	/* 登录按钮点击事件 */
	function loginButtonClick() {
		var id = $("#loginUserName").val();
		var password = $("#loginPassword").val();
		var remember = $("#remember").prop('checked');
		if (id == '' && password == '') {
			$("#hints").css('display', 'block');
			$("#info").text("提示:账号和密码不能为空");
		} else if (id == '') {
			$("#hints").css('display', 'block');
			$("#info").text("提示:账号不能为空");
		} else if (password == '') {
			$("#hints").css('display', 'block');
			$("#info").text("提示:密码不能为空");
		} else {
			$.ajax({
				type : "POST",
				url : contextPath + "/user/loginCheck",
				data : {
					username : id,
					password : password
				},
				dataType : "json",
				success : function(data) {
					if (data.stateCode == "0") {
						$("#hints").css('display', 'block');
						$("#info").text("提示:用户名不存在!");
					} else if (data.stateCode == "1") {
						$("#hints").css('display', 'block');
						$("#info").text("提示:密码错误!");
					} else if (data.stateCode == "2") {
						if (remember) {
							rememberLogin(id, passwd, remember);
						} else {
							Cookies.remove('loginStatus');
						}
						$("#hints").css('display', 'block');
						$("#info").text("提示:登陆成功，跳转中...");
						window.location.href = contextPath + "/";
					}
				}
			});
		}
	}

	/* 回车登录事件 */
	$("input").keydown(function() {
		if (event.keyCode == 13) //回车键的键值为13
			loginButtonClick();
	});

	/* -------------------------注册 ------------------------------*/
	/* 注册方法 */
	/* function submitValidate(flag) {
		return flag;
	}
	function registerButtonClick() {
		if ($("#registerUserName").val() == ''
				|| $("#registerPassword").val() == ''
				|| $("#email").val() == ''
				|| $("#registerPhoneNum").val() == '') {
			alert("请将注册信息填写完整！");
			return submitValidate(false);
		} else {
			var id = $("#registerUserName").val();
			var password = $("#registerPassword").val();
			var email = $("#email").val();
			var areaCode = $("#areaCode").val();
			var tel = $("#registerPhoneNum").val();
			$.ajax({
				type : "POST",
				url : contextPath + "/user/register",
				data : {
					username : id,
					password : password,
					email : email,
					tel : tel
				},
				dataType : "json",
				success : function(data) {
					window.location.href = contextPath + "/";
				}
			});
		}
	}
 */
	/* 验证用户名是否已存在  ----- 此方法存在问题（待解决） */
	/* function checkUserName() {
		var userName = $("#registerUserName").val();
		$.ajax({
			url : contextPath
					+ "/service/userController/getUserByUserName?userName="
					+ userName,
			dataType : "json",
			type : "POST",
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				if (data.data == false) {
					$("#register #hints").text("用户名已存在");
					alert("用户名已存在");
				} else {
					$("#register #hints").text("此用户名通过验证");
					alert("此用户名通过验证");
				}
			}
		});
	} */
</script>

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
		/*
		var defaults = {
			containerID: 'toTop', // fading element id
			containerHoverID: 'toTopHover', // fading element hover id
			scrollSpeed: 1200,
			easingType: 'linear' 
		};
		 */

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
</body>
</html>





</html>