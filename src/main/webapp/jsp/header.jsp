<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<link href="/travelForum/skins/skin/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/travelForum/skins/skin/css/font-awesome.min.css"
	rel="stylesheet">
<script src="/travelForum/skins/js/jquery.min.js"></script>
<script src="/travelForum/skins/js/bootstrap.min.js"></script>
<style type="text/css">
html, body {
	height: 100%;
	font-size: 14px;
	color: #525252;
	font-family: NotoSansHans-Regular, AvenirNext-Regular, arial,
		Hiragino Sans GB, "Microsoft Yahei", "Hiragino Sans GB",
		"WenQuanYi Micro Hei", sans-serif;
	background: #f0f2f5;
}
header {
	font-family: 'microsoft yahei';
} 

.navbar-right {
    float: right!important;
    margin-right: -15px;
}

.dropdown-menu {
	margin-top:45px;
	height: 150px;
	width: 40px;
}

#userinfo .dropdown-menu {
	margin-top:45px;
}

.nav>li {
    position: relative;
    display: block;
}

.navbar .navbar-nav > li > a {
    padding: 10px 15px;
    margin: 10px 3px;
    position: relative;
}

.dropdown-menu > li > a:hover, .dropdown-menu > li > a:focus {
    background-color: #F5F5F5;
    color: #333333;
    opacity: 1;
    text-decoration: none;
}

.navbar .nav > li .dropdown-menu {
	margin: 0;
}

.navbar-nav > li > .dropdown-menu {
    border-radius: 10px;
    margin-top: -5px;
}

.navbar .nav>li:hover .dropdown-menu {
	display: block;
}

.dropdown-menu > li > a {
    padding: 8px 16px;
    color: #333333;
}

.dropdown-menu>li>a {
    display: block;
    padding: 3px 20px;
    clear: both;
    font-weight: 400;
    line-height: 1.42857143;
    color: #333;
    white-space: nowrap;
}
 .exit {
	margin-top: 4px;
	background-color: #ffffff;
	height: 30px;
	text-align: center;
	line-height: 30px;
}

.exit:hover {
	background-color: #0099ff;
}

.exit:hover a {
	color: #ffffff;
} 

 .navbar-nav>li {
	float: left;
} 

#searchBtn:hover {
	color: #ffffff;
}

.search_bar {
	float: right;
	background: #fafafa;
	width: 230px;
	height: 35px;
	border: 1px solid #ddd;
	border-radius: 4px;
	margin: 10px 30px;
}

.search_bar .input_search {
	background-color: #fafafa;
	font-size: 15px;
	color: #778087;
	display: block;
	float: left;
	width: 205px;
	padding: 5px 10px;
	border: 0;
	height: 33px;
	border-radius: 10px;
	outline: none;
}

.fa-search {
	margin-top: 8px;
}

a:hover {
	text-decoration: none;
}

li {
	margin: 5px 10px;
}
</style>
<header>
	<nav class="navbar navbar-default" role="navigation"
		style="background-color: white; height: 60px; font-size: 16px;">
		<div class="container-fluid" style="margin-left: 5%">
			<div class="row">
				<!--向左对齐-->
				<ul class="nav navbar-nav navbar-left">
					<li><a class="navbar-brand" href="/travelForum/">旅游论坛</a></li>
					<li><a href="/travelForum/">首页</a></li>
					<li><a href="/travelForum/topic/Index">论坛</a></li>
					<li><a href="/travelForum/question/questions/IndexByCount">问答</a></li>
					<li><a href="/travelForum/jsp/footer.jsp">足迹</a></li>

					<li><a href="/travelForum/manage/login.jsp" id="manage">后台管理</a></li>
					<li>
						<div class="search_bar">
							<input type="text" class="input_search" name="search_input"
								id="toolber-keyword" placeholder="搜索"> <i
								class="fa fa-search" aria-hidden="true"></i>
						</div>
					</li>
				</ul>

				<c:if test="${empty userId}">
					<!--未登陆-->
					<ul class="nav navbar-nav navbar-right" style="margin-right: auto;">
						<li>
							<p class="navbar-text">
								<i class="fa fa-plus-square"
									aria-hidden="true"></i>
								<a href="/travelForum/main/new">写游记</a>
							</p>
						</li>
						<li>
							<p class="navbar-text">
								<a href="/travelForum/main/signin">登录</a>
							</p>
						</li>
						<li>
							<p class="navbar-text">
								<a href="/travelForum/main/signup">注册</a>
							</p>
						</li>
					</ul>
				</c:if>
				<c:if test="${!empty userId}">
					<!--已登陆-->
					<ul class="nav navbar-nav navbar-right">
                        <li>
							<p class="navbar-text">
								<a href="/travelForum/main/new"><i class="fa fa-plus-square"
									aria-hidden="true"></i>&nbsp;写游记</a>
							</p>
						</li>
						<li>
							<p class="navbar-text">
								<a href="#"><i class="fa fa-bell-o" aria-hidden="true"></i>&nbsp;消息</a>
							</p>
						</li>
                        <li class="dropdown">
                              <a href="/travelForum/topic/myIndex" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                    <span>${sessionScope.username}</span>
                                    <b class="caret"></b>
                              </a>
                              <ul class="dropdown-menu" style="margin-top: -13px;">
                                <li><a href="/travelForum/topic/myIndex">我的主页</a></li>
                                <li><a href="/travelForum/user/getUserInfoById/${sessionScope.userId}">我的资料</a></li>
                                <li><a href="/travelForum/jsp/my_editPassword.jsp">修改密码</a></li>
                                <li class="divider"></li>
                                <li><a href="/travelForum/user/signout">安全退出</a></li>
                              </ul>
                        </li>
                    </ul>
					<%-- <ul class="nav navbar-nav navbar-right">

						<li>
							<p class="navbar-text">
								<a href="/travelForum/main/new"><i class="fa fa-plus-square"
									aria-hidden="true"></i>&nbsp;发帖</a>
							</p>
						</li>
						<li>
							<p class="navbar-text">
								<a href="#"><i class="fa fa-bell-o" aria-hidden="true"></i>&nbsp;消息</a>
							</p>
						</li>
						<li>
							<div id="userinfo" class="dropdown">
							<span>${sessionScope.username}</span>
								<img class="pull-left"
									src="/travelForum/skins/skin/${user.avatar}"
									style="width: 40px; height: 40px; border-radius: 50%; margin: 5px 10px;">
								<div class="dropdown-menu">
									<div class="card-inner">
										<div class="clearfix" style="margin-top: 4px;">
											<div class="clearfix text-center">
												<a href="/travelForum/topic/myIndex"
													style="margin: 5px auto;"><span>${sessionScope.username}</span></a>
											</div>
											<div class="clearfix exit">
												<a href="/travelForum/topic/myIndex">我的主页</a>
											</div>
											<div class="clearfix exit">
												<a href="/travelForum/user/getUserInfoById/${sessionScope.userId}">我的资料</a>
											</div>
											<div class="clearfix exit">
												<a href="/travelForum/jsp/my_editPassword.jsp">修改密码</a>
											</div>
											<div class="clearfix exit">
												<a href="javasrcript:signout_confirm()">安全退出</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</li>

					</ul> --%>
				</c:if>
			</div>
		</div>
	</nav>


</header>
<script>
var contextPath = '<%=request.getContextPath()%>';

	$(function() {

		// 中间搜索框回车搜索事件
		$(document).on("keydown", "#toolber-keyword", searchDocumentKeydown);
		// 搜索事件
		$(document).on("click", ".fa-search", searchDocumentClick);
		// 鼠标滑过用户名
		$(document).on("mouseenter", "#userinfo", userMouseenter);
		// 鼠标滑出用户名
		$(document).on("mouseleave", "#userinfo", userMouseleave);
		// 鼠标滑出用户名
		$(document).on("click", "#manage", manage);
	});

	/* function manage() {
		$.ajax({
			url : contextPath + "/userLoginCheck",
			data:{
				userName
			}
			dataType: "json"
			success : function(data) {
			}
		}); 
	}*/
	
	//中间搜索框鼠标点击事件
	function searchDocumentClick() {
		var val = $("#toolber-keyword").val();
		window.location.href = contextPath + "/jsp/search.jsp?keyword=" + val;
	}

	// 中间搜索框回车搜索事件
	function searchDocumentKeydown(e) {
		if (e.keyCode == 13) {
			searchDocumentClick();
		}
	}

	// 鼠标滑过用户名
	function userMouseenter() {
		$(this).children("div").show();
	}

	// 鼠标滑出用户名
	function userMouseleave() {
		$(this).children("div").hide();
	}

	// 登出 
	function signout_confirm() {
		$.ajax({
			url : contextPath + "/user/signout",
			success : function(data) {
			}
		});
		/* var r = confirm("确定退出?")
		if (r == true) {
			$.ajax({
				url : contextPath + "/user/signout",
				success : function(data) {
				}
			});

		} else {

		} */
	}
</script>