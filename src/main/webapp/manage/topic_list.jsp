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


<style>
body {
	overflow-x: hidden;
	background: #f2f0f5;
	padding: 15px 0px 10px 5px;
}
</style>
</head>
<body>
	<div class="col-sm-10" style="display: inline; margin: 10px 20px;">
		<form method="post" action="/travelForum/user/userList"
			id="searchForm">

			<div class="form-group col-sm-8">
				<div style="float: left">
					<span>标题</span>
				</div>
				<div class="form-group col-sm-5" style="float: left">
					<input type="text" name="searchInput" class="form-control col-sm-5"
						placeholder="请输入帖子标题">
				</div>
				<button id="searchBtn" type="button" class="btn btn-primary"
					style="float: left;">查询</button>
			</div>

		</form>
	</div>

	<table class="table table-bordered table-striped table-hover"
		style="margin-left: 50px; width: 90%; border: 0; text-align: center"
		id="main-tab">
		<thead style="border-top: 2px solid #e2e1e1;">
			<tr>
				<th style="text-align: center">序号</th>
				<th style="text-align: center">标题</th>
				<th style="text-align: center">作者</th>
				<th style="text-align: center">创建时间</th>
				<th style="text-align: center">阅读量</th>
				<!-- <th style="text-align: center">评论数</th> -->
				<th style="text-align: center">操作</th>
			</tr>
		</thead>
		<tbody>
			<%-- <c:forEach items="${topics}" var="topics">
				<tr>
					<td>${topics.title}</td>
					<td>${topics.userId}</td>
					<td>${topics.createTime}</td>
					<td>${topics.click}</td>
					<td>${topics.countReplies}</td>
					<td>${topics.user.username}</td>
					<td>${topics.title}</td>
				</tr>
			</c:forEach> --%>
		</tbody>
	</table>

</body>
<script type="text/javascript">

	var contextPath = '<%=request.getContextPath()%>';
	var searchParam = $("input[name=searchInput]").val();

	$(function() {
		initPageDom();
		initPageEvent();
	});

	function initPageDom() {
		init_searchTopicList();
	}

	function initPageEvent() {
		// 查询用户列表
		$(document).on("click", "#searchBtn", searchTopicList);
		// 查看用户
		$(document).on("click", "#view", viewTopic);
		// 删除用户
		$(document).on("click", "#delete", deleteTopic);
		
	}

	function init_searchTopicList() {
		searchTopicList();
	}

	function searchTopicList() {
		$.ajax({
					type : "GET",
					url : contextPath + "/topic/list",
					async: false,
					/* data : {
						"searchParam" : searchParam
					}, */
					dataType : "json",
					 success : function(datas) {
						 $('.table tbody').empty(""); // 清空数据

						if (datas.topics == null | datas.topics == "") {
							$('.table tbody').append("暂无相关数据");
						} else {

							$.each(datas.topics, function(i, result) {
								
								$.ajax({
				                    type : "GET",
				                    url : contextPath + "/user/getUserById/" +result.userId,
				                    dataType : "json",
				                    success : function(datas) {
				                    	var username = datas.data.username;
												var item;
												item = "<tr><td>"
														+ (i + 1)
														+ "</td><td>"
														+ result.title
														+ "</td><td>"
														+ username
                                                        + "</td><td>"
														+ result.localCreateTime
														+ "</td><td data='" +result.click + "' id='lockStatus'>"
														+ result.click
														+ "</td><td><a user="+ username +" data='" +result.id + "' id='view' href='javascript:;'>查看</a><span class='gray'>&nbsp;|&nbsp;</span><a data='" +result.id + "' id='delete' href='javascript:;'>删除</a></td></tr>";
												$('.table tbody').append(item);
				                    }
				                });
							});
						}
					} 
				});
	}

	// 时间戳格式转
	function getdate() {
		var now = new Date(), y = now.getFullYear(), m = now.getMonth() + 1, d = now
				.getDate();
		return y + "-" + (m < 10 ? "0" + m : m) + "-" + (d < 10 ? "0" + d : d)
				+ " " + now.toTimeString().substr(0, 8);
	}

	// 查看帖子信息
	function viewTopic() {
		var topicId = $(this).attr("data");
		var username = $(this).attr("user");
		window.top.frames['mainframe'].document.location = "/travelForum/manage/topic_detail.jsp?topicId=" + topicId +"&username="+username;
		/* $.ajax({
					type : "GET",
					url : contextPath + "/topicInfo/" + topicId,
					success : function(datas) {
						window.top.frames['mainframe'].document.location = "/travelForum/manage/topic_detail.jsp";
					}
				}); */
	}

	// 删除用户
	function deleteTopic() {

		var topicId = $(this).attr("data");

		$.ajax({
			type : "DELETE",
			url : contextPath + "/topic/delete/" + topicId,
			success : function(datas) {
				alert(datas.message);
				searchTopicList();
			}
		});
	}
</script>



</html>