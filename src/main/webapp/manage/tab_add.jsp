<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>新增模块</title>
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
				<a href="/travelForum/manage/tab_list.jsp">模块管理</a> › 新增模块
			</div>

			<div class="panel-body" style="margin: 50px 200px;">

				<!-- <form class="form-horizontal" id="saveOrUpdateForm" action="/travelForum/tab/add"> -->
				<form class="form-horizontal" id="saveForm">
					<div class="form-group">
						<label for="password" class="col-sm-4 control-label">模块名称</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="name" name="tabName"
								placeholder="请输入模块名称" required="required" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-4 control-label">模块英文名称</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="nameEn"
								name="tabNameEn" placeholder="请输入模块英文名称" required="required"
								value="">
						</div>
					</div>
					<div class="form-group" style="margin: 50px 60px;">
						<input type="submit" class="btn btn-success" id="save" value="保存">
						<input type="reset" class="btn btn-default" id="reset" value="重置">
						<button id="back" class="btn btn-default back" type="button">返回上一级</button>
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
		// 保存新增tab
		$(document).on("click", "#save", saveTab);
		// 返回上一级
		$(document).on("click", "#back", backToIndex);

	}

	// 保存、更新
	function saveTab() {

		var name = $("#name").val();
		var nameEn = $("#nameEn").val();

		$.ajax({
					type : "POST",
					url : contextPath + "/tab/add",
					async : false,
					data : {
						"tabName" : name,
						"tabNameEn" : nameEn
					},
					dataType : "json",
					success : function(datas) {
						if(datas.message == "success") {
							window.top.frames['mainframe'].document.location = contextPath + "/manage/tab_list.jsp";
							alert("保存成功！");
						}else{
							alert("保存失败！");
						}
					}
				});
	}

	function backToIndex() {
		window.top.frames['mainframe'].document.location = contextPath + "/manage/tab_list.jsp";
	}
</script>

</body>


</html>