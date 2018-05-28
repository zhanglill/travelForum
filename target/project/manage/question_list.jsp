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
	<div class="col-sm-10" style="display: inline; margin: 10px 20px;">
		<form method="post" action="/travelForum/user/userList"
			id="searchForm">

			<div class="form-group col-sm-8">
				<div style="float: left">
					<span>名称</span>
				</div>
				<div class="form-group col-sm-5" style="float: left">
					<input type="text" name="searchInput" class="form-control col-sm-5"
						placeholder="请输入问答标题">
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
				<th style="text-align: center">编辑时间</th>
				<th style="text-align: center">操作</th>
			</tr>
		</thead>
		<tbody>

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
		init_searchQuestionList();
	}

	function initPageEvent() {
		// 查询列表
		$(document).on("click", "#searchBtn", searchQuestionList);
		// 查看
		$(document).on("click", "#view", viewQuestion);
		// 删除
		$(document).on("click", "#delete", deleteQuestion);

	}

	function init_searchQuestionList() {
		searchQuestionList();
	}

	//  问答列表
	function searchQuestionList() {
		$.ajax({
					type : "GET",
					url : contextPath + "/question/questions/list",
					data : {
						"searchParam" : searchParam
					},
					async : false,
					dataType : "json",
					success : function(datas) {

						$('.table tbody').empty(""); // 清空数据

						if (datas.questions == null | datas.questions == "") {
							$('.table tbody').append("暂无相关数据");
						} else {

											var createTime = getdate(datas.questions.createTime);
											var updateTime = getdate(datas.questions.updateTime);

											$.each(datas.questions,function(i, result) {
												
												$.ajax({
													type : "GET",
													url : contextPath + "/user/getUserById/" + result.userId,
													dataType : "json",
													success : function(data) {
														var username = data.data.username;
																item = "<tr><td>"
																		+ (i + 1)
																		+ "</td><td>"
																		+ result.title
																		+ "</td><td>"
																		+ username
																		+ "</td><td>"
																		+ createTime
																		+ "</td><td>"
																		+ updateTime
																		+ "</td><td><a user=" + username + " id='view' data=" + result.id + " href='javascript:;'>查看</a><span class='gray'>&nbsp;|&nbsp;</span><span><a questionId=" + result.id + " id='delete' href='javascript:;'>删除</a></td></tr>";

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

	// 查看信息
	function viewQuestion() {
		var questionId = $(this).attr("data");
		var username = $(this).attr("user");
		window.top.frames['mainframe'].document.location = "/travelForum/manage/question_detail.jsp?questionId=" + questionId +"&username="+username;
	}

	// 删除
	function deleteQuestion() {

		var questionId = $(this).attr("questionId");

		$.ajax({
			type : "DELETE",
			url : contextPath + "/question/delete/" + questionId,
			success : function(datas) {
				alert(datas.message);
				searchQuestionList();
			}
		});
	}
</script>



</html>