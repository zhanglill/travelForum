<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>模块编辑</title>
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
				<a href="/travelForum/manage/tab_list.jsp">模块管理</a> › 模块编辑
			</div>

			<div class="panel-body" style="margin: 50px 200px;">

				<form class="form-horizontal" method="post" id="updateForm" action="/travelForum/tab/update">
					<div class="form-group" style="display: none">
						<label for="password" class="col-sm-4 control-label">模块id</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="id" name="tabId"
								placeholder="请输入模块id" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-4 control-label">模块名称</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="name" name="tabName"
								placeholder="请输入模块名称" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-4 control-label">模块英文名称</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="nameEn" name="tabNameEn"
								placeholder="请输入模块英文名称" required="required">
						</div>
					</div>
					<div class="form-group" style="margin: 50px 60px;">
						<input type="submit" class="btn btn-success" id="save" value="保存"> <input
							type="reset" class="btn btn-default" id="reset" value="重置">
						<button id="back" class="btn btn-default back" type="button">返回上一级</button>
					</div>
				</form>

			</div>

		</div>
	</div>
	
</body>

<script type="text/javascript">
	var contextPath = '<%=request.getContextPath()%>';
	var tabId2 = '<%=request.getParameter("tabId1")%>';
	var tabName2 = '<%=request.getParameter("tabName1")%>';
	var tabNameEn2 = '<%=request.getParameter("tabNameEn1")%>';

	$(function() {
		$("input[id=id]").attr("value", tabId2);
		$("input[id=name]").attr("value", tabName2);
		$("input[id=nameEn]").attr("value", tabNameEn2);

		initPageEvent();
	});

	function initPageEvent() {
		// 保存更新
		//$(document).on("click", "#save", updateTab);
		// 返回上一级
		$(document).on("click", "#back", backToIndex);

	}

	// 更新
	/* function updateTab() {

		var id = $("#id").val();
		var name = $("#name").val();
		var nameEn = $("#nameEn").val();

		$.ajax({
					type : "POST",
					url : contextPath + "/tab/add",
					data : {
						"tabId" : id,
						"tabName" : name,
						"tabNameEn" : nameEn
					},
					dataType : "json",
					success : function(datas) {
						alert(datas.message);
						window.top.frames['mainframe'].document.location = "/travelForum/manage/tab_list.jsp"
					}
				});
	} */

	function backToIndex() {
		window.top.frames['mainframe'].document.location = "/travelForum/manage/tab_list.jsp"
	}
</script>

</html>