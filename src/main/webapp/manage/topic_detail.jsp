<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

	<div style="width: 85%; margin: 1% 2% 1% 5%; align: center;">
		<div class="panel panel-default" id="main" style="">
			<div class="panel-heading" style="background-color: white">
				<a href="/travelForum/manage/topic_list.jsp">帖子管理</a> > 帖子信息
			</div>

			<div class="panel-body" style="margin: 20px 60px;">

				<div style="margin-bottom: 15px;">
					<h3 id="title">${topic.title}</h3>
				</div>
				<span class="text-muted"> <a id="username"
					href="/travelForum/user/member/${topic.user.username}"> <strong>${topic.user.username}</strong></a></span>&nbsp;&nbsp;&nbsp;

				<span style="display: none" id="tabId">${topic.tabId}</span> <span
					class="badge" style="height: 25px; padding: 6px;"></span>
				&nbsp;&nbsp; <span class="text-muted" id="localCreateTime">${topic.localCreateTime}</span>&nbsp;&nbsp;&nbsp;
				<span class="text-muted">阅读量：<span id="click">${topic.click}</span></span>

				<ul class="list-group" style="width: 100%; margin: 20px auto;">
					<li class="list-group-item" id="content">${topic.content}</li>
				</ul>
			</div>
			<div class="form-group" style="margin: 20px 775px;">
				<button id="back" class="btn btn-default back" type="button">返回上一级</button>
			</div>
		</div>
		<c:if test="${!empty replies}">
			<div class="panel panel-default" id="main" style="">
				<div class="panel-heading" style="background-color: white">
					<span> ${fn:length(replies)} 回复 | 直到 <c:forEach
							items="${replies}" var="reply" varStatus="status">

							<c:if test="${status.last}">
    ${reply.localCreateTime}
    </c:if>
						</c:forEach>
					</span>
				</div>

				<ul class="list-group" style="width: 100%">
					<!-- 遍历评论 -->
					<li class="list-group-item">
						<div>
							<div style="float: left; width: 6%; margin-bottom: 5px">
								<%-- <a href="/travelForum/user/member/${topic.user.username}"><img
										width="50px" height="50px"
										src="/travelForum/skins/skin/${reply.user.avatar}"
										class="img-rounded"></a> --%>
							</div>
							<div style="width: 89%; margin: 2px 65px;" id="replyUser">
								<a href="/travelForum/user/member/${reply.user.username}"><strong>${reply.user.username}</strong></a>
								<div id="replyContent">
									<p style="word-wrap: break-word;">${reply.content}</p>
								</div>
								<small class="text-muted" style="float: right" id="replyTime">时间：${reply.localCreateTime}</small>
								<br />
							</div>

						</div>
					</li>

				</ul>
			</div>
		</c:if>
	</div>

</body>

<script type="text/javascript">
var contextPath = '<%=request.getContextPath()%>';

var topicId = '<%=request.getParameter("topicId")%>';
var username = '<%=request.getParameter("username")%>';

	//时间戳格式转
	function getdate() {
		var now = new Date(), y = now.getFullYear(), m = now.getMonth() + 1, d = now
				.getDate();
		return y + "-" + (m < 10 ? "0" + m : m) + "-" + (d < 10 ? "0" + d : d)
				+ " " + now.toTimeString().substr(0, 8);
	}

	$(function() {
		initPageDom();
	});

	function initPageDom() {
		$.ajax({
			type : "GET",
			url : contextPath + "/topicInfo/" + topicId,
			success : function(datas) {

				$("#title").text(datas.topic.title);
				$("#username").text(username);
				$("#click").text(datas.topic.click);
				$("#content").text(datas.topic.content);
				$("#localCreateTime").text(datas.topic.localCreateTime);

				$.ajax({
					type : "GET",
					url : contextPath + "/tab/getTabById/" + datas.topic.tabId,
					success : function(datas) {
						$(".badge").text(datas.data.tabName);
					}
				});

				/* $.ajax({
				    type : "GET",
				    url : contextPath + "/getReplyById/" + datas.topic.id,
				    success : function(datas) {
				    	$.each(datas.data, function(i, result) {
				    		$("#replyContent").text(result.content);
				    		$("#replyTime").text(result.create_time);
				    		
				    		$.ajax({
				                type : "GET",
				                url : contextPath + "/user/getUserById/" + result.reply_user_id,
				                dataType : "json",
				                success : function(datas) {
				                	$("#replyUser").text(datas.data.username);
				                }
				                	
				             });
				    		
				    		
				    	});
				    	}
				    }); */

			}
		});
	}

	$("#back").on(
					"click",
					function() {
						window.top.frames['mainframe'].document.location = "/travelForum/manage/topic_list.jsp"
					});
</script>
</html>