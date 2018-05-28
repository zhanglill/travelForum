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

<link href="/travelForum/skin/css/bootstrap.css" type="text/css"
	rel="stylesheet" media="all">
<link href="/travelForum/skin/css/font-awesome.css" rel="stylesheet">
<link href="/travelForum/manage/public/css/home.css" rel="stylesheet">


<style>
body {
	overflow-x: hidden;
	background: #f2f0f5;
	padding: 15px 0px 10px 5px;
}
</style>
</head>
<body>

	<div style="width: 85%; margin: 1% 2% 1% 5%; align: center;">
		<div class="panel panel-default" id="main" style="">
			<div class="panel-heading" style="background-color: white">
				<a href="/travelForum/manage/topic_list.jsp">帖子管理</a> > 帖子信息
			</div>

			<div class="panel-body" style="margin: 20px 60px;">

				<div style="margin-bottom: 15px;">
					<h3 id="title"></h3>
				</div>
				<span class="text-muted"> <a id="username"
					href="/travelForum/user/member/"> <strong></strong></a></span>&nbsp;&nbsp;&nbsp;

				<span style="display: none" id="tabId">${topic.tabId}</span> <span
					class="badge" style="height: 25px; padding: 6px;"></span>
				&nbsp;&nbsp; <span class="text-muted" id="localCreateTime"></span>&nbsp;&nbsp;&nbsp;
				<span class="text-muted">阅读量：<span id="click"></span></span>
				<!-- <textarea rows="20" class="form-control" id="content" name="content"
					value="" placeholder="请输入公告内容" required="required"></textarea> -->
				<ul class="list-group" style="width: 100%; margin: 20px auto;">
					<li class="list-group-item" id="content"></li>
					
				</ul>
			</div>
			<div class="form-group" style="margin: 20px 775px;">
				<button id="back" class="btn btn-default back" type="button">返回上一级</button>
			</div>
		</div>
	</div>


</body>
<script type="text/javascript">

	var contextPath = '<%=request.getContextPath()%>';
	
	var questionId = '<%=request.getParameter("questionId")%>';
	var username = '<%=request.getParameter("username")%>';

	$(function() {
		initPageDom();
		initPageEvent();
	});

	function initPageDom() {

		$.ajax({
			type : "GET",
			url : contextPath + "/question/selectById/" + questionId,
			success : function(datas) {
				$("#title").text(datas.questions.title);
				$("#username").text(username);
				$("#click").text(datas.questions.click);
				$("#content").text(datas.questions.content);
				$("#localCreateTime").text(datas.questions.localCreateTime);

				/* $.ajax({
					type : "GET",
					url : contextPath + "/tab/getTabById/" + datas.question.questionId,
					success : function(datas) {
						$(".badge").text(datas.data.tabName);
					}
				}); */
			}
		});

	}

	function initPageEvent() {
		// 返回上一级
		$(document).on("click", "#back", backToIndex);

	}

	function backToIndex() {
		window.top.frames['mainframe'].document.location = "/travelForum/manage/question_list.jsp";
	}
</script>



</html>