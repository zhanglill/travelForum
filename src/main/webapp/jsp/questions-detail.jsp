<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
<title>我的主页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />

<script type="text/javascript" charset="utf-8"
	src="/travelForum/utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/travelForum/utf8-jsp/ueditor.all.min.js">
	
</script>
<script type="text/javascript" charset="utf-8"
	src="/travelForum/utf8-jsp/lang/zh-cn/zh-cn.js"></script>

<script type="application/x-javascript">
	
	
	
	
		
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 




</script>
<!-- Custom Theme files -->
<link href="/travelForum/skin/css/bootstrap.css" type="text/css"
	rel="stylesheet" media="all">
<link href="/travelForum/skin/css/style.css" type="text/css"
	rel="stylesheet" media="all">
<link rel="stylesheet" href="/travelForum/skin/css/flexslider.css"
	type="text/css" media="all" />
<link href="/travelForum/skin/css/font-awesome.css" rel="stylesheet">
<!-- font-awesome icons -->
<link href="/travelForum/skin/css/owl.carousel.css" rel="stylesheet"
	type="text/css" media="all">
<!-- //Custom Theme files -->
<!-- js -->
<script src="/travelForum/skin/js/jquery-2.2.3.min.js"></script>
<script src="/travelForum/skin/js/smoothscroll.min.js"></script>

<script src="http://www.jq22.com/jquery/jquery-migrate-1.2.1.min.js"></script>

<!-- //js -->
<!-- web-fonts -->
<link
	href="http://fonts.googleapis.com/css?family=Dancing+Script:400,700"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<!-- //web-fonts -->

<style>
li {
	list-style-type: none;
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

/* ---- */
.header {
	position: relative;
	padding-top: 10px;
	border-bottom: 1px solid #ebebeb;
	background: #fbfbfb;
	z-index: 100;
	margin-top: -24px;
	height: 50px;
}

.header .layout {
	position: relative;
	height: 60px;
}

.headerNav .layout, .header .layout, .bottomNav .layout {
	width: 980px;
	margin: 0 auto;
}

.header .headerL {
	float: left;
	margin: -10px -80px;
}

.headerL h1 {
	overflow: hidden;
	width: 200px;
	height: 35px;
}

.headerL h1 .country {
	float: left;
	font: 22px/32px "Microsoft Yahei";
	color: #1a2b38;
}

.headerL .site {
	float: left;
}

.header .headerR {
	display: inline;
	position: absolute;
	right: 0px;
	top: 0px;
}

/* ---- */
.wyfbbox {
	border: #eee solid 1px;
	background: #fbfbfb;
	padding: 17px 0;
	margin-bottom: 35px;
	width: 300px;
}

.wyfbbox .wytw {
	background: url(../../../tps/i1/fbicon.png) 52px 15px no-repeat #4f7195;
	width: 180px;
	height: 40px;
	text-align: center;
	border-radius: 30px;
	font-size: 14px;
	color: #fff;
	display: block;
	margin: 0 auto;
	line-height: 40px;
	text-indent: 16px;
}

.smallfonttitle {
	font-size: 14px;
	color: #666;
	text-align: center;
}

.numbox.peoplenum {
	padding: 10px 0 10px 0;
}

.numbox {
	text-align: center;
	font-size: 0;
	padding: 10px 0 0 0;
}

.numbox span {
	width: 27px;
	height: 35px;
	line-height: 33px;
	background: url(../../../tps/i1/numbg.png);
	display: inline-block;
	font-size: 28px;
	color: #627d99;
	font-weight: 700;
}

.smallfonttitle {
	font-size: 12px;
	color: #666;
	text-align: center;
}

.rtitle {
	font-size: 16px;
	color: #585858;
	border-bottom: #e6e6e6 solid 1px;
	padding-bottom: 8px;
	margin: 0px 15px;
}

.gxblist {
	padding-top: 22px;
	margin-bottom: -10px;
}

.gxblist ul {
	margin-left: 20px;
}

.gxblist li {
	overflow: hidden;
	padding: 0 0 20px 0;
}

.gxblist li {
	overflow: hidden;
	padding: 0 0 20px 0;
}

.gxblist img {
	border-radius: 50%;
	float: left;
	height: 48px;
	width: 48px;
}

.gxblist span {
	font-size: 14px;
	color: #333;
	float: left;
	padding: 15px 6px 0 15px;
}

/* ---- */
.xgwtbox {
	padding-top: 22px;
	margin-left: 15px;
}

.xgwtbox li {
	padding-bottom: 20px;
	overflow: hidden;
}

.xgwtbox .wds {
	width: 46px;
	height: 46px;
	border: #c6d1d7 solid 1px;
	border-radius: 3px;
	float: left;
	color: #8197a5;
	font-size: 12px;
	text-align: center;
	margin-right: 12px;
	display: inline;
	overflow: hidden;
}

.xgwtbox .wds b {
	font-size: 14px;
	display: block;
	line-height: 1;
	padding: 9px 0 0 0;
}

.xgwtbox span {
	display: table-cell;
	height: 48px;
	vertical-align: middle;
	font-size: 14px;
	color: #333;
	overflow: hidden;
	width: 200px;
	line-height: 20px;
}

.wyfbbox .wytw+.wyhd {
	margin-top: 10px;
}

.wyfbbox .wyhd {
	margin: 0 auto 0 auto;
	border: 1px solid #4f7195;
	color: #4f7195;
	border-radius: 30px;
	text-align: center;
	font-size: 14px;
	width: 178px;
	height: 36px;
	display: block;
	line-height: 36px;
}

mt45 {
	margin-top: 30px;
}

.rtitle {
	font-size: 16px;
	color: #585858;
	border-bottom: #e6e6e6 solid 1px;
	padding-bottom: 8px;
}

.taglistfl {
	padding-top: 22px;
	margin-left: 20px;
}

.taglistfl a {
	background: #f0f0f0;
	border-radius: 3px;
	color: #888;
	font-size: 14px;
	padding: 4px 10px 5px 10px;
	float: left;
	display: inline;
	white-space: nowrap;
	margin: 0 8px 7px 0;
}

.taglistfl a:hover {
	background: #888;
}

/* --- */
.tagiconone {
	background: #e7f5ff;
	color: #41a1e1;
	font-size: 14px;
	float: left;
	padding: 5px 15px 7px 15px;
	border-radius: 20px;
	line-height: 1;
	margin-right: 5px;
}

/* --- */
.col-xs-8 li {
	font-size: 1em;
	color: #000;
	line-height: 1.8em;
}

.list-group-item p {
	font-size: 1em;
	color: #000;
	line-height: 1.8em;
}
</style>

</head>
<body>

	<!-- 引入header文件 -->
	<jsp:include page="header.jsp"></jsp:include>

	<div class="header">
		<div class="layout">
			<div class="icoHill">&nbsp;</div>
			<div class="headerL">
				<div class="site">
					当前位置： <a href="/travelForum/">首页</a> &gt; <a
						href="/travelForum/question/questions/IndexByCount">问答</a> &gt;<span>问答详情</span>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">

			<div class="col-xs-8" style="float: left; margin-top: 20px;">
				<div class="panel panel-default" id="main" style="width: 770px;">
					<div class="panel-heading" style="background-color: white">
						<span style="font-size: 16px;">问答详情</span>
					</div>

					<div class="panel-body" style="margin-top: -15px;">
						<div style="margin-bottom: 15px; margin-left: 15px;">
							<h3 id="title">${questions.title}</h3>
							<%-- <c:if test="${!empty user}">

								<c:if test="${sessionScope.userId == questions.userId}">
									<div
										style="float: left; margin-top: -30px; margin-left: 750px;">
										<span class="text-muted"><a
											href="/travelForum/question/questions/update/${questions.id}"
											id="edit"><i class="fa fa-edit" aria-hidden="true"></i>&nbsp;编辑&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span>
										<span class="text-muted"><a
											href="/travelForum/question/deleteQuestion/${questions.id}"
											id="delete"><i class="fa fa-trash-o" aria-hidden="true"></i>&nbsp;删除&nbsp;&nbsp;</a></span>
									</div>
								</c:if>
							</c:if> --%>

						</div>
						<div>
							<span class="text-muted" style="margin-left: 15px;"> <a
								href="/travelForum/user/member/${questions.user.username}">
									<strong>${questions.user.username}</strong>
							</a></span>&nbsp;&nbsp;&nbsp;

							<div class="ques-labels"
								style="margin-left: 100px; margin-top: -20px;">
								<a class="tagiconone"
									href="/travelForum/question/tab/${questions.tabId}">${questions.tab.tabName}</a>
							</div>

							<span class="text-muted" id="localCreateTime">${questions.localCreateTime}</span>&nbsp;&nbsp;&nbsp;
							<span class="text-muted">阅读量：<span id="click">${questions.click}</span></span>
						</div>
						<%-- <c:if test="${!empty user}">
							<ul class="nav navbar-nav navbar-right"
								style="list-style-type: none; margin-right: 15px">
								<li><span class="text-muted"><a href="#"
										id="transmit"><i class="fa fa-share" aria-hidden="true"></i>&nbsp;转发&nbsp;&nbsp;</a></span></li>
								<li><span class="text-muted"><a href="#"
										id="collect"><i class="fa fa-heart-o" aria-hidden="true"></i>&nbsp;收藏</a></span></li>
							</ul>
						</c:if> --%>

						<ul class="list-group" style="width: 100%; margin: 20px auto;">
							<li class="list-group-item" id="content">${questions.content}</li>
						</ul>
					</div>
				</div>
				<c:if test="${!empty replies}">
					<div class="panel panel-default" id="main" style="width: 770px;">
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
							<c:forEach items="${replies}" var="reply">
								<li class="list-group-item">
									<div>
										<div style="float: left; width: 6%; margin-bottom: 5px">
											<a href="/travelForum/user/member/${questions.user.username}"><img
												width="50px" height="50px"
												src="/travelForum/skins/skin/${reply.user.avatar}"
												class="img-rounded"></a>
										</div>
										<div style="width: 89%; margin: 2px 65px;">
											<a href="/travelForum/user/member/${reply.user.username}"><strong>${reply.user.username}</strong></a>
											<div>
												<p style="word-wrap: break-word;">${reply.content}</p>
											</div>
											<small class="text-muted" style="float: right">时间：${reply.localCreateTime}</small>
											<br />
										</div>
									</div>
								</li>
							</c:forEach>

						</ul>
					</div>
				</c:if>

				<div class="panel panel-default" id="reply" style="width: 770px;">
					<div class="panel-heading" style="background-color: white">
						发表评论</div>
					<div class="panel-body">
						<div class="panel-body">
							<div class="form-group">
								<form action="/travelForum/questionReply/add" method="post">
									<input type="hidden" name="questionId" value="${questions.id}">
									<input type="hidden" name="replyUserId"
										value="${sessionScope.userId}">
									<textarea class="form-control" rows="3" name="content"
										required="required"></textarea>
									<br /> <input type="submit" class="btn btn-success btn-sm"
										value="发表评论" style="float: right">
								</form>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-3" style="float: left">

				<div class="wyfbbox" style="margin: 20px 50px 10px;">
					<a href="/travelForum/question/new" class="wytw"><i
						class="fa fa-plus" style="margin-left: -15px;"></i>&nbsp;&nbsp;我要提问</a>
					<a href="#reply" class="wyhd">我来回答</a>
				</div>
				<!-- <div class="wyfbbox" id="sidebar1"
					style="float: left; margin: 5px 50px;">
					<div class="smallfonttitle">贡献人数</div>
					<div class="numbox peoplenum">
						<span>7</span><span>9</span><span>3</span><span>2</span>
					</div>
				</div> -->

				<div class="wyfbbox" id="sidebar1"
					style="float: left; margin: 5px 50px;">
					<div class="mt45">
						<div class="rtitle">相关分类</div>
						<div class="taglistfl clear_b">
							<a href="wenda/list-0-10000020-1.html" target="_blank">滑雪</a><a
								href="wenda/list-0-10000025-1.html" target="_blank">滑雪装备</a><a
								href="wenda/list-0-10000029-1.html" target="_blank">滑雪技术</a><a
								href="wenda/list-0-10000041-1.html" target="_blank">滑雪场地</a><a
								href="wenda/list-0-10000007-1.html" target="_blank">户外安全</a><a
								href="wenda/list-0-10000031-1.html" target="_blank">户外装备</a><a
								href="wenda/list-0-10000062-1.html" target="_blank">户外运动</a><a
								href="wenda/list-0-10000127-1.html" target="_blank">户外经验</a><a
								href="wenda/list-0-10000128-1.html" target="_blank">领队专业知识</a><a
								href="wenda/list-0-10000129-1.html" target="_blank">户外线路</a>
						</div>
					</div>
				</div>

				<div class="wyfbbox" id="sidebar1"
					style="float: left; margin: 5px 50px 100px;">
					<div class="rtitle">热门问答</div>
					<div class="xgwtbox">
						<ul>
							<c:forEach items="${hotestQuestions}" var="noReply">
								<li><a href="/travelForum/question/questions/${noReply.id}"
									target="_blank">
										<div class="wds">
											<b>${noReply.countReplies}</b> 问答
										</div> <span>${noReply.title}</span>
								</a></li>

							</c:forEach>
						</ul>
					</div>
				</div>

				<%-- <div class="wyfbbox" id="sidebar1"
					style="float: left; margin: 5px 50px 100px;">
					<div class="rtitle">相关问题</div>
					<div class="xgwtbox">
						<ul>

							<c:forEach items="${noReplyQuestion}" var="noReplyQuestion">
								<li><a
									href="/travelForum/question/questions/${noReplyQuestion.id}"
									target="_blank">
										<div class="wds">
											<b>0</b> 问答
										</div> <span>${noReplyQuestion.title}</span>
								</a></li>

							</c:forEach>
						</ul>
					</div>
				</div> --%>

			</div>

		</div>
	</div>
	<div style="display: none" id="questionId">${questions.id}</div>
	<div style="display: none" id="questionTabName">${questionTabName}</div>



	<!-- menu js -->
	<script type="text/javascript">
		$('.toggle').on('click', function() {
			$('.menu').toggleClass('open');
			$('.w3nav').toggleClass('show-w3nav');
			$('.w3nav a').toggleClass('show-w3nav-link');
			$('.toggle').toggleClass('close');
		});
	</script>
	<!-- //menu js -->
	<script src="/travelForum/skin/js/owl.carousel.js"></script>
	<!-- start-smooth-scrolling -->
	<script type="text/javascript" src="/travelForum/skin/js/move-top.js"></script>
	<script type="text/javascript" src="/travelForum/skin/js/easing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();

				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- //end-smooth-scrolling -->
	<!-- smooth-scrolling-of-move-up -->
	<script type="text/javascript">
		$(document).ready(function() {
			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<!-- //smooth-scrolling-of-move-up -->
	<script type="text/javascript">
	var contextPath = '<%=request.getContextPath()%>';

		$(function() {
			initPageDom();
			initPageEvent();
		});

		function initPageDom() {
			if (message != null || message != "") {
				alert(message);
			}

			var questionTabName = $("#questionTabName").text();
			String
			searchParam = questionTabName.substring(0, 1);

			$
					.ajax({
						type : "GET",
						url : contextPath + "/question/getTab",
						data : {
							"searchParam" : searchParam
						},
						success : function(datas) {
							window.top.frames['mainframe'].document.location = "/travelForum/manage/tab_edit.jsp?tabId1="
									+ datas.data.id
									+ "&tabName1="
									+ datas.data.tabName
									+ "&tabNameEn1="
									+ datas.data.tabNameEn;
						}
					});

		}

		function initPageEvent() {

			// 删除
			//$(document).on("click", "#delete", delete_question);
		}
	</script>
	<script src="/travelForum/skin/js/bootstrap.js"></script>
</body>
</html>