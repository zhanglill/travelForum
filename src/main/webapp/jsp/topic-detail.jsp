<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="keywords" content="" />
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
<!-- //js -->
<!-- web-fonts -->
<link
	href="http://fonts.googleapis.com/css?family=Dancing+Script:400,700"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<!-- //web-fonts -->
</head>

<style type="text/css">
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
	margin: -10px -30px;
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

/* --- */
.rg-tags a {
	color: #585858;
	outline: 0 none;
}

.rg-tags {
	display: inline-block;
	border: 1px solid #e0e0e0;
	height: 24px;
	line-height: 24px;
	padding: 0 10px;
	-webkit-border-radius: 12px;
	-moz-border-radius: 12px;
	border-radius: 12px;
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

.rtitle {
	font-size: 16px;
	color: #585858;
	border-bottom: #e6e6e6 solid 1px;
	padding-bottom: 8px;
	margin: 0px 15px;
}

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
</style>
<body>

	<!-- 引入header文件 -->
	<jsp:include page="header.jsp"></jsp:include>

	<div class="header">
		<div class="layout">
			<div class="icoHill">&nbsp;</div>
			<div class="headerL">
				<div class="site">
					当前位置： <a href="/travelForum/">首页</a> &gt; <a
						href="/travelForum/topic/Index">游记</a> &gt;<span>游记详情</span>
				</div>
			</div>
		</div>
	</div>

	<!-- 热门话题 -->
	<div class="container">
		<div class="row">

			<div class="col-xs-8" style="float: left; margin-top: 20px;">
				<div class="panel panel-default" id="main" style="width: 870px;">

					<div class="panel-heading" style="background-color: white">
						<span style="font-size: 16px;">游记详情</span>
					</div>


					<div class="panel-body" style="margin-top: -15px;">
						<div style="margin-bottom: 15px; margin-left: 15px;">
							<h3 id="title">${topic.title}</h3>

							<c:if test="${!empty user}">

						<c:if
							test="${sessionScope.userId == topic.userId && topic.type == '0'}">
							<div style="float: left; margin-top: -30px; margin-left: 350px;">
								<span class="text-muted"><a
									href="/travelForum/getOneById/${topic.id}" id="edit"><i
										class="fa fa-edit" aria-hidden="true"></i>&nbsp;编辑&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span>
								<span class="text-muted"><a
									href="/travelForum/delete/${topic.id}" id="delete"><i
										class="fa fa-trash-o" aria-hidden="true"></i>&nbsp;删除&nbsp;&nbsp;</a></span>
							</div>
						</c:if>
					</c:if>

						</div>
						<div>
							<span class="text-muted" style="margin-left: 15px;"> <a
								href="/travelForum/user/member/${topic.user.username}"> <strong>${topic.user.username}</strong></a></span>&nbsp;&nbsp;&nbsp;
							<span class="author"><i class="fa fa-map-marker"></i>&nbsp;${topic.province},${topic.city}&nbsp;&nbsp;&nbsp;</span>
							<span class="rg-tags"><a
								href="/travelForum/topic/tab/${topic.tabId}">${topic.tab.tabName}</a></span>
							<span class="badge" style="height: 25px; padding: 6px;"> <c:if
									test="${topic.type == '0'}">原创</c:if> <c:if
									test="${topic.type == '1'}">转发</c:if> <c:if
									test="${topic.type == '2'}">收藏</c:if></span> &nbsp;&nbsp; <span
								class="text-muted" id="localCreateTime">${topic.localCreateTime}</span>&nbsp;&nbsp;&nbsp;
							<span class="text-muted">阅读量：<span id="click">${topic.click}</span></span>

							<c:if test="${!empty user}">
								<ul class="nav navbar-nav navbar-right"
									style="list-style-type: none; margin-right: 15px">

									<li><span class="text-muted"><a href="#"
											id="transmit"><i class="fa fa-share" aria-hidden="true"></i>&nbsp;转发&nbsp;&nbsp;</a></span></li>
									<li><span class="text-muted"><a href="#"
											id="collect"><i class="fa fa-heart-o" aria-hidden="true"></i>&nbsp;收藏</a></span></li>
								</ul>
							</c:if>

							<ul class="list-group" style="width: 100%; margin: 20px auto;">
								<li class="list-group-item" id="content">${topic.content}</li>
							</ul>
						</div>
					</div>
				</div>
				<c:if test="${!empty replies}">
					<div class="panel panel-default" id="main" style="width: 870px">
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
											<a href="/travelForum/user/member/${topic.user.username}"><img
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

				<%-- <c:if test="${!empty user}"> --%>

				<div class="panel panel-default" id="main" style="width: 870px;">
					<div class="panel-heading" style="background-color: white">
						发表评论</div>
					<div class="panel-body">
						<div class="form-group">
							<form action="/travelForum/reply/add" method="post">
								<input type="hidden" name="topicId" value="${topic.id}">
								<input type="hidden" name="replyUserId" value="${user.id}">
								<textarea class="form-control" rows="3" name="content"
									required="required"></textarea>
								<br /> <input type="submit" class="btn btn-success btn-sm"
									value="发表评论" style="float: right">
							</form>
						</div>

					</div>
				</div>

			</div>


			<div class="col-xs-3" style="float: left">
				<div class="wyfbbox" id="sidebar1"
					style="float: left; margin: 20px 120px 100px;">
					<div class="rtitle">
						<a href="/travelForum/question/questions/IndexByCount">热门游记</a>
					</div>
					<div class="xgwtbox">
						<ul>
							<c:forEach items="${hotestTopics}" var="hotestTopics">
									<li><a
										href="/travelForum/topic/${hotestTopics.id}">
											<div class="wds">
												<b>${hotestTopics.countReplies}</b> 评论
											</div> <span>${hotestTopics.title}</span>
									</a></li>

								</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="display: none" id="userId">${topic.userId}</div>
	<div style="display: none" id="topicId">${topic.id}</div>
	<div style="display: none" id="tabId">${topic.tabId}</div>
	<div style="display: none" id="province">${topic.province}</div>
	<div style="display: none" id="city">${topic.city}</div>

	<!-- menu js -->
	<script>
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

		var userId = $("#userId").text();
		var title = $("#title").text();
		var localCreateTime = $("#localCreateTime").text();
		var click = $("#click").text();
		var content = $("#content").text();
		var tabId = $("#tabId").text();
		var topicId = $("#topicId").text();
		
		var province = $("#province").text();
		var city = $("#city").text();

		$(function() {
			initPageEvent();
		});

		function initPageEvent() {

			// 编辑
			//$(document).on("click", "#edit", edit_topic);

			// 删除
			$(document).on("click", "#delete", delete_topic);

			// 转发
			$(document).on("click", "#transmit", transmit_topic);

			// 收藏
			$(document).on("click", "#collect", collect_topic);
		}

		// 转发
		function transmit_topic() {
			$.ajax({
				type : "POST",
				url : contextPath + "/topic/transmit",
				dataType : "json",
				async : false,
				data : {
					"topicId" : topicId,
					"userId" : userId,
					"title" : title,
					"createTime" : localCreateTime,
					"click" : click,
					"content" : content,
					"tabId" : tabId,
					"province" : province,
 					"city" : city
				},
				success : function(data) {
					alert(data.message);
				}
			});
		}

		// 收藏
		function collect_topic() {
			$.ajax({
				type : "POST",
				url : contextPath + "/topic/collect",
				dataType : "json",
				async : false,
				data : {
					"topicId" : topicId,
					"userId" : userId,
					"title" : title,
					"createTime" : localCreateTime,
					"click" : click,
					"content" : content,
					"tabId" : tabId,
					"province" : province,
 					"city" : city
				},
				success : function(data) {
					alert(data.message);

				}
			});
		}

		// 删除
		function delete_topic() {
			$.ajax({
				url : contextPath + "/delete/" + topicId,
			//window.location.href = "/travelForum/jsp/index.jsp";
			//window.location.href = "/travelForum/jsp/index.jsp";
			/* $.ajax({
				url : contextPath + "/topic/Index",
			}); */
			});
		}

		// 编辑
		/* function edit_topic() {
			//window.location.href = contextPath + "/jsp/topic-update.jsp?topicId=" + topicId;
			
			$.ajax({
				type : "GET",
				url : contextPath + "/getOneById/" + topicId
			});
		} */
	</script>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="/travelForum/skin/js/bootstrap.js"></script>
</body>
</html>