<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<html lang="en">
<head>
<meta name="Content-Type" content="text/html;charset=utf-8">
<meta name="keywords" content="Genesis,论坛,社区,程序员">
<title>Travel Forum - 问答</title>
<link href="/travelForum/skins/skin/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/travelForum/skins/skin/css/font-awesome.min.css"
	rel="stylesheet">
<script src="/travelForum/skins/js/jquery-3.2.1.js"></script>
<script src="/travelForum/skins/js/bootstrap.min.js"></script>
<style>
li {
	list-style-type: none;
}

html, body {
	height: 100%;
	font-size: 14px;
	color: #525252;
	font-family: NotoSansHans-Regular, AvenirNext-Regular, arial,
		Hiragino Sans GB, "Microsoft Yahei", "Hiragino Sans GB",
		"WenQuanYi Micro Hei", sans-serif;
	background: #f0f2f5;
}

.footer {
	background-color: #333;
	margin-top: 62px;
	width: 100%;
	padding-top: 15px;
	color: #8A8A8A;
	display: block;
	height: 50px;
	border: 1px;
	clear: both;
	bottom: 0;
	position: absolute;
	font-size: 16px;
}

a {
	color: #777;
	text-decoration: none;
	cursor: pointer;
}

a:hover {
	text-decoration: none;
}

.feed_new_tit .line {
	display: block;
	float: left;
	width: 3px;
	height: 15px;
	background: #cf2730;
	overflow: hidden;
	margin: 0 5px 0 15px;
}
</style>
</head>
<body>
	<!-- 引入header文件 -->
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="panel panel-default col-xs-8" id="main"
				style="float: left;">
				<div class="panel-heading" style="background-color: white">
					<a style="margin-right: 2%">按阅读量</a> <a style="margin-right: 2%">按评论数</a>
				</div>

				<ul class="list-group" style="width: 100%">
					<li class="list-group-item" style="height: 90px;">
						<div style="margin: 15px 10px">
							<div style="float: left; clear: both;">
								<h4 style="margin-top: -10px; margin-bottom: 10px;">
									<a href="/travelForum/questions/${questions.id}">打算去长沙转一圈，有没有景点推荐</a><br />
								</h4>
							</div>
							<div style="float: left; clear: both; margin-left: -15px;"
								class="col-xs-10">
								<a href="/travelForum/user/member/${topic.user.username}"><img
									src="/travelForum/skins/skin/${topic.user.avatar}"
									style="float: left; width: 25px; height: 25px; border-radius: 50%"></a>
								<div style="float: left;">
									&nbsp;&nbsp;&nbsp; <a
										href="/travelForum/user/member/${questions.user.username}"><span><strong>lisi</strong></span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<small class="text-muted">2018-4-14 21:32:02</small>&nbsp;&nbsp;&nbsp;
									<span class="text-muted">评论数：2</span>
								</div>
							</div>
							<div style="float: right; text-align: center" class="col-xs-2">
								<span class="badge" style="height: 25px; padding: 6px;">阅读量：23</span>
							</div>
						</div>
					</li>
					<li class="list-group-item" style="height: 90px;">
						<div style="margin: 15px 10px">
							<div style="float: left; clear: both;">
								<h4 style="margin-top: -10px; margin-bottom: 10px;">
									<a href="/travelForum/questions/${questions.id}">想要去云南大理，什么季节去比较好？</a><br />
								</h4>
							</div>
							<div style="float: left; clear: both; margin-left: -15px;"
								class="col-xs-10">
								<a href="/travelForum/user/member/${topic.user.username}"><img
									src="/travelForum/skins/skin/${topic.user.avatar}"
									style="float: left; width: 25px; height: 25px; border-radius: 50%"></a>
								<div style="float: left;">
									&nbsp;&nbsp;&nbsp; <a
										href="/travelForum/user/member/${questions.user.username}"><span><strong>张三</strong></span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<small class="text-muted">2018-4-14 21:32:02</small>&nbsp;&nbsp;&nbsp;
									<span class="text-muted">评论数：12</span>
								</div>
							</div>
							<div style="float: right; text-align: center" class="col-xs-2">
								<span class="badge" style="height: 25px; padding: 6px;">阅读量：21</span>
							</div>
						</div>
					</li>


					<%-- <c:forEach items="${questions}" var="questions">
						<li class="list-group-item" style="height: 90px;">
							<div style="margin: 15px 10px">
								<div style="float: left; clear: both;">
									<h4 style="margin-top: -10px; margin-bottom: 10px;">
										<a href="/travelForum/questions/${questions.id}">${questions.content}</a><br />
										<a href="/travelForum/questions/">${questions.content}</a><br />
									</h4>
								</div>
								<div style="float: left; clear: both; margin-left: -15px;"
									class="col-xs-10">
									<a href="/travelForum/user/member/${questions.user.username}"><img
										src="/travelForum/skins/skin/${questions.user.avatar}"
										style="float: left; width: 25px; height: 25px; border-radius: 50%"></a>
									<div style="float: left;">
										&nbsp;&nbsp;&nbsp; <a
											href="/travelForum/user/member/${questions.user.username}"><span><strong>${questions.user.username}</strong></span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<small class="text-muted">${questions.localCreateTime}</small>&nbsp;&nbsp;&nbsp;
										<span class="text-muted">评论数：${questions.countReplies}</span>
									</div>
								</div>
								<div style="float: right; text-align: center" class="col-xs-2">
									<span class="badge" style="height: 25px; padding: 6px;">阅读量：${questions.click}</span>
								</div>
							</div>
						</li>
					</c:forEach> --%>

				</ul>

			</div>

			<div class="row">
				<div class="panel-body col-xs-3"
					style="float: right; background-color: white">
					<form action="/travelForum/questions/add" method="post"
						id="replyForm">
						<!-- <div class="form-group">
							<label for="title"></label> <input type="text"
								class="form-control" id="title" name="title"
								placeholder="请输入主题标题，如果标题能够表达完整内容，则正文可以为空" required="required">
						</div> -->
						<div class="form-group">
							<label for="content"></label>
							<textarea class="form-control" rows="5" id="content"
								name="content" placeholder="输入你想要提问的内容"></textarea>
							<input type="submit" class="btn btn-default btn-sm" value="提问"
								style="float: right; margin-top: 5px;">
						</div>

					</form>
				</div>
				<%-- <div class="panel panel-default col-xs-3" id="sidebar1"
					style="float: right">
					<h4 class="feed_new_tit">
						<span class="line"></span><span class="txt">推荐</span>
					</h4>
					<ul class="list-group" style="width: 100%">
						<c:forEach items="${hotestTopics}" var="hotestTopics">
							<li class="list-group-item"><a
								href="/travelForum/topic/${hotestTopics.id}">${hotestTopics.title}</a></li>
						</c:forEach>
					</ul>
				</div> --%>
				<c:if test="${!empty userId}">
					<div class="panel panel-default col-xs-3" id="sidebar1"
						style="float: right">
						<h4 class="feed_new_tit">
							<span class="line"></span><span class="txt">我的问答</span>
						</h4>
						<ul class="list-group" style="width: 100%">
							<%-- <li class="list-group-item"><a
								href="/travelForum/questions/${userPersonalQuestions.id}">${userPersonalQuestions.name}</a></li> --%>
								<li class="list-group-item"><a
								href="/travelForum/questions/">${userPersonalQuestions.name}</a></li>
							<c:if test="${!empty userPersonalQuestions}">
								<c:forEach items="${userPersonalQuestions}"
									var="userPersonalQuestions">
									<li class="list-group-item"><a
										href="/travelForum/topic/${userPersonalQuestions.id}">${userPersonalQuestions}</a></li>
								</c:forEach>
							</c:if>
							<%-- <c:if test="${empty userPersonalQuestions}">
								<div style="margin: 15px;">
									您还未提问过，快去提问吧</a>
								</div>
							</c:if> --%>
						</ul>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>