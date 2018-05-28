<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>搜索</title>

<link href="/travelForum/skins/skin/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/travelForum/skins/skin/css/font-awesome.min.css"
	rel="stylesheet">
<script src="/travelForum/skins/js/jquery-3.2.1.js"></script>
<script src="/travelForum/skins/js/bootstrap.min.js"></script>

<style>

/* .container:nth-child(2) {
	padding-top: 50px;
}

.container.input-group {
	margin-top: 22px;
	margin-bottom: 23px;
} */

/* .searchInput {
	margin-top: 22px;
	margin-bottom: 23px;
	display: flex;
} */

/* .input-remove {
	line-height: 20px;
	display: none;
} */
/* #searchInput {
	width: 550px;
	height: 40px;
	padding-left: 20px;
	border-radius: 3px 0px 0px 3px;
} */
.xline {
	border-bottom: solid 1px #ddd;
}

.xline-second {
	border-bottom: solid 1px #ddd;
}

.search-result {
	margin-top: 16px;
	margin-bottom: 8px;
	font-size: 18px;
	font-family: Microsoft YaHei;
}

/*.search-count {
	height: 40px;
	font-size: 12px;
	font-family: Microsoft YaHei;
	line-height: 40px;
	color: #999;
}

.empty {
	color: #999;
}

.search-title {
	margin-top: 14px;
	font-size: 16px;
	color: #0099ff;
}*/
.search_div {
	width: 750px;
	height: 41px;
	border: 1px solid #ddd;
	border-radius: 4px;
	margin: 15px 10px 20px 1px;
}

.search_div .input_search {
	font-size: 15px;
	color: #778087;
	display: block;
	/* float: left; */
	width: 710px;
	padding: 5px 10px;
	border: 0;
	height: 38px;
	border-radius: 4px;
	outline: none;
}

#search_button {
	float: right;
	margin-top: -37.6px;
	border-radius: 0px 4px 4px 0px;
	background: #3385ff;
	color: #fff;
}
</style>

</head>
<body>
	<!--引入head.jsp-->
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="search_div">
			<input type="text" class="input_search" name="search_input"
				id="search_input">
			<button type="button" class="btn" id="search_button">
				<i class="fa fa-search"></i> 搜索
			</button>
		</div>

	</div>
	<div class="xline"></div>
	<div class="container">
		<div id="total" style="margin: 20px auto;"></div>
		<div class="panel panel-default col-xs-9" id="main"
			style="float: left;">
			<ul id="myTab" class="nav nav-tabs">
				<li class="active"><a href="#topic" data-toggle="tab">论坛</a></li>
				<li><a href="#questions" data-toggle="tab">问答</a></li>
			</ul>
			<div id="topic">
				<ul class="list-group" style="width: 100%" id="topic-list">
				</ul>
			</div>
			<div id="questions">
				<ul class="list-group" style="width: 100%" id="search-list">
				</ul>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	
   var contextPath = "<%=request.getContextPath()%>";
		var keyword = "${param.keyword}";

		$(function() {
			// 初始化页面元素
			initPageDom();

			// 初始化页面事件
			initPageEvent();
		});

		function initPageDom() {
			initInputVal();
			initSearchList();

		}

		function initPageEvent() {
			// 回车搜索
			$(document).on("keydown", "#search_input", searchDocumentKeydown);
			// 点击搜索按钮
			$(document).on("click", "#search_button", initSearchList);
		}

		function initInputVal() {
			if (keyword != null || keyword != "") {
				$("#search_input").val(keyword);
			}
		}

		// 搜索框回车搜索事件
		function searchDocumentKeydown(e) {
			if (e.keyCode == 13) {
				initSearchList();
			}
		}

		function initSearchLists() {
			initSearchList();
		}

		// 搜索事件
		function initSearchList() {
			var searchKeyword = $("#search_input").val() || keyword;
			$
					.ajax({
						dataType : "json",
						url : contextPath + "/search/" + searchKeyword,
						async : false,
						success : function(dataSet) {
							var data = dataSet.data;

							$("#total").html("为您找到相关结果" + dataSet.total + "个");

							$.each(
											data,
											function(i, result) {

												item = "<li class='list-group-item' style='height:150px;'>"
														+ "<div style='margin: 15px 10px'>"
														+ "<div style='float: left; clear: both;' class='search-title'>"
														+ "<h4 style='margin-top: -10px; margin-bottom: 10px;'>"
														+ "<a href='/travelForum/topic/" + result['id'] +"'>"
														+ result['title']
														+ "</a><br/>"
														+ "</h4>"
														+ "</div>"
														+ "<div style='margin: 20px 0px; height: 40px;'>"
														+ "<div style='float: left; clear: both; margin-left: -15px;' class='col-xs-10' >"
														+ "<a href='/travelForum/user/member/${topic.user.username}'>"
														+ "<img src='/travelForum/skins/skin/${topic.user.avatar}' style='float: left; width: 25px; height: 25px; border-radius: 50%'></a>"
														+ "<div style='float: left;'>&nbsp;&nbsp;&nbsp; "
														+
														/* "<a href='/travelForum/user/member/" + result['user.id'] + "'><span><strong>" + result['user.username'] + "</strong></span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +  */
														"<small class='text-muted' id='localCreateTime'>"
														+ result['localCreateTime']
														+ "</small>&nbsp;&nbsp;&nbsp;"
														+ "<span class='text-muted'><i class='fa fa-comment-o' aria-hidden='true'></i>&nbsp;"
														+ result['countReplies']
														+ "</span>"
														+ "</div>"
														+ "</div>"
														+ "<div style='float: right; text-align: center' class='col-xs-2'>"
														+ "<span class='badge' style='height: 25px; padding: 6px;'>阅读量：&nbsp;"
														+ result['click']
														+ "</span>"
														+ "</div>"
														+ "</div>"
														+ "<div class='search-note' style='width:580px;text-overflow:ellipsis;overflow:hidden;" +
								"text-align: center;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;'>"
														+ result['content']
														+ "</div>" + "</div>"

												$('#topic-list').append(item);
											});
						}
					});
		}
	</script>
</body>

</html>

