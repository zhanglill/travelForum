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
	<div style="width: 70%; margin: 1% 2% 1% 5%; float: left;">
		<div class="panel panel-default" id="main" style="">
			<div class="panel-heading" style="background-color: white">
				<a href="/travelForum/manage/systemNotice_list.jsp">系统公告</a> › 公告详情
			</div>

			<div class="panel-body" style="margin: 50px 100px;">

				<form class="form-horizontal">
				<!-- <form class="form-horizontal" id="saveOrUpdateForm"> -->

					<div class="form-group">
						<label for="username" class="col-sm-3 control-label">公告名称</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="noticeName"
								name="noticeName" value="" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-3 control-label">公告内容</label>
						<div class="col-sm-7">
							<textarea rows="4" class="form-control" id="noticeContent"
								name="noticeContent" value="" disabled></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-3 control-label">创建人</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="userName"
								name="userName" value="" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-3 control-label">创建时间</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="createTime"
								name="createTime" value="" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-3 control-label">最后更新时间</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="updateTime"
								name="updateTime" value="" disabled>
						</div>
					</div>
					<div class="form-group" style="margin: 50px 200px;">
						<button id="back" class="btn btn-default" type="button" style=" margin-left: 200px;">返回上一级</button>
					</div>
				</form>

			</div>

		</div>
	</div>
</body>
<script type="text/javascript">

	var contextPath = '<%=request.getContextPath()%>';
	
	var noticeTitle = '<%=request.getParameter("noticeTitle")%>';
	var noticeContent = '<%=request.getParameter("noticeContent")%>';
	var createTime = '<%=request.getParameter("createTime")%>';
	createTime = getdate(createTime);
	var updateTime = '<%=request.getParameter("updateTime")%>';
	updateTime = getdate(updateTime);

	$(function() {
		
		$("form .form-group:nth-child(1) input").attr("value", noticeTitle);
		$("form .form-group:nth-child(2) textarea").val(noticeContent);
		$("form .form-group:nth-child(4) input").attr("value", createTime);
		$("form .form-group:nth-child(5) input").attr("value", updateTime);
		
		initPageEvent();
	});

	
	function initPageDom() {
	}

	function initPageEvent() {
		// 返回上一级
		$(document).on("click", "#back", backToIndex);
		

	}

	function backToIndex() {
		window.top.frames['mainframe'].document.location = "/travelForum/manage/systemNotice_list.jsp";
	}
	
	// 时间戳格式转
	function getdate() {
        var now = new Date(),
            y = now.getFullYear(),
            m = now.getMonth() + 1,
            d = now.getDate();
        return y + "-" + (m < 10 ? "0" + m : m) + "-" + (d < 10 ? "0" + d : d) + " " + now.toTimeString().substr(0, 8);
    } 
	
</script>



</html>