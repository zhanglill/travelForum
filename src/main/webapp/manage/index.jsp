<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>后台管理系统</title>
<script src="/travelForum/skin/js/jquery-2.2.3.min.js"></script>
<script src="/travelForum/skin/js/bootstrap.js"></script>

<link href="/travelForum/skin/css/bootstrap.css" type="text/css"
	rel="stylesheet" media="all">
<link href="/travelForum/skin/css/font-awesome.css" rel="stylesheet">
<link href="/travelForum/manage/public/css/home.css" rel="stylesheet">
<%-- <link rel="stylesheet" type="text/css" href="<l:asset path='css/form.css'/>" />
<link rel="stylesheet" type="text/css" href="<l:asset path='css/datatables.css'/>" /> --%>
</head>
<body>
	<div id="wrapper" class="toggled">
		<div id="sidebar-wrapper">
			<div class="sidebar-brand">
				<a href="<%=request.getContextPath()%>/manage/index.jsp"
					target="mainframe"> <span>旅游论坛后台管理系统</span>
				</a>
			</div>
			<div class="sidebar-toggle">
				<a href="#"> <i class="fa fa-list"></i> <span>收起</span>
				</a>
			</div>
			<ul id="top-menu" class="sidebar-nav">
				<li><a id="jupyter-url"
					href="<%=request.getContextPath()%>/manage/systemNotice_list.jsp"
					target="mainframe"> <i class="fa fa-flag" aria-hidden="true"></i>
						<span>系统公告</span>
				</a></li>
				<li><a
					href="<%=request.getContextPath()%>/manage/user_list.jsp"
					target="mainframe"> <i class="fa fa-user-plus" aria-hidden="true"></i>
						<span>用户管理</span>
				</a></li>
				<li><a
					href="<%=request.getContextPath()%>/manage/tab_list.jsp"
					target="mainframe"> <i class="fa fa-tags"
						aria-hidden="true"></i> <span>模块管理</span>
				</a></li>
				<li><a
					href="<%=request.getContextPath()%>/manage/topic_list.jsp"
					target="mainframe"> <i class="fa fa-sticky-note-o" aria-hidden="true"></i>
						<span>帖子维护</span>
				</a></li>
				<li><a
					href="<%=request.getContextPath()%>/manage/question_list.jsp"
					target="mainframe"> <i class="fa fa-question-circle-o"
						aria-hidden="true"></i> <span>问答管理</span>
				</a></li>
				<li><a
					href="<%=request.getContextPath()%>/manage/my_info.jsp"
					target="mainframe"> <i class="fa fa-user"
						aria-hidden="true"></i> <span>个人信息</span>
				</a></li>
			</ul>
		</div>
		<div id="page-content-wrapper">
			<ul class="list-inline top-bar">
				<li id="topbar"></li>
				<li style="float: right"><span id="logout" class="logout"><a href="/travelForum/user/signout">退出</a></span></li>
				<li style="float: right">
				<i class="fa fa-user-o" aria-hidden="true"></i>
							<a><span>${sessionScope.username}</span></a>
					<%-- <c:if test="${empty userId}">
							<i class="fa fa-user" aria-hidden="true"></i>
							<span>${sessionScope.username}</span>
					</c:if> --%>
				</li>
				<li style="float: right"><span id="index"><a href="/travelForum/">系统首页</a></span></li>
			</ul>
			<div class="main-content">
				<iframe id="mainframe" name="mainframe"  frameborder="0" width="100%" height="100%" style="scrolling:yes;overflow-x:scroll; overflow-y:hidden;display:block"></iframe>
			</div>
		</div>
	</div>
</body>
<script src="/travelForum/skin/js/jquery-2.2.3.min.js"></script>
<script src="/travelForum/skin/js/bootstrap.js"></script>
<script type="text/javascript">
var ifm= document.getElementById("mainframe");
ifm.height=document.documentElement.clientHeight;

var context = '<%=request.getContextPath()%>';

	$("#logout").on("click", function() {
		$.ajax({
			url : context + "/user/signout",
		});
	});
</script>
</html>