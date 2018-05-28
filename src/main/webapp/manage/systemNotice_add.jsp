<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>添加管理员</title>
<script src="/travelForum/skin/js/jquery-2.2.3.min.js"></script>
<script src="/travelForum/skin/js/bootstrap.js"></script>

<link href="/travelForum/skin/css/bootstrap.css" type="text/css"
	rel="stylesheet" media="all">
<link href="/travelForum/skin/css/font-awesome.css" rel="stylesheet">
<link href="/travelForum/manage/public/css/home.css" rel="stylesheet">
</head>
<body>

	<div style="width: 70%; margin: 1% 2% 1% 5%; float: left;">
		<div class="panel panel-default" id="main" style="">
			<div class="panel-heading" style="background-color: white">
				<a href="/travelForum/manage/systemNotice_list.jsp">系统公告</a> › 新增公告
			</div>

			<div class="panel-body" style="margin: 50px 100px;">

				<!-- <form class="form-horizontal" method="post" id="addNoticeForm" action="/travelForum/notice/add"> -->
				<form class="form-horizontal">

					<div class="form-group">
						<label for="username" class="col-sm-3 control-label">公告名称</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="noticeName"
								name="noticeName" placeholder="请输入公告名称" value=""
								required="required">
						</div>
					</div>

					<div class="form-group">
						<label for="password" class="col-sm-3 control-label">公告内容</label>
						<div class="col-sm-7">
							<textarea rows="4" class="form-control" id="noticeContent"
								name="noticeContent" required="required" placeholder="请输入公告内容"></textarea>
						</div>
					</div>
					<div class="form-group" style="margin: 50px 150px;">
						<input type="submit" class="btn btn-success" id="save" value="保存">
						<input type="reset" class="btn btn-default" id="reset" value="重置">
						<button id="back" class="btn btn-default" type="button">返回上一级</button>
					</div>
				</form>

			</div>

		</div>
	</div>

	<script type="text/javascript">
	var contextPath = '<%=request.getContextPath()%>';
	
	$(function() {
		initPageEvent();
	});

	function initPageEvent() {
		// 返回上一级
		$(document).on("click", "#back", backToIndex);
		// 保存新增公告
		$(document).on("click", "#save", saveUser);

	}
	
	function backToIndex() {
		window.top.frames['mainframe'].document.location = "/travelForum/manage/systemNotice_list.jsp";
	}
	
	function saveUser() {
		var noticeName = $("#noticeName").val();
		var noticeContent = $("#noticeContent").val();
		
		$.ajax({
			type : "POST",
			url : contextPath + "/notice/add",
			async : false,
			data : {
				"noticeName" : noticeName,
				"noticeContent" : noticeContent
			},
			dataType : "json",
			success : function(datas) {
				if(datas.message == "success") {
					window.top.frames['mainframe'].document.location = contextPath + "/manage/systemNotice_list.jsp";
					alert("保存成功！");
				}else{
					alert("保存失败！");
				}
			}
		});
	} 
	
	</script>
</body>
</html>