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
</style>

</head>
<body>

<!-- 引入header文件 -->
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="container">

		<div class="row">

			<div class="panel panel-default" id="main"
				style="width:850px; margin: 20px 10px; float:left">
				<ul class="clearfix">
					<c:forEach items="${topics}" var="topic">

						<li style="list-style: none; margin-top: 18px;">
							<dl class="clearfix summary oneline">
								<dt class="col-xs-3">
									<a href="http://www.b2b2c.tourex.net.cn/travels/31/"
										title="${topic.title}"><img
										src="/travelForum/skin/images/i2.jpg" alt="${topic.title}"
										height="164" style="display: inline; width: 100%;"></a>
								</dt>
								<dd class="col-xs-9" style="float: left">
									<div class="wrapBox">
										<h3>
											<a href="/travelForum/topic/${topic.id}" target="_blank"
												title="${topic.title}">${topic.title}</a>
										</h3>
										<div class="desc" style="margin-top: 10px;">${topic.content}</div>
										<div class="extra">
											<ul class="clearfix"
												style="list-style: none; margin-top: 10px;">
												<li class="author" style="float: left"><span
												class="badge"> ${topic.tab.tabName}&nbsp; </span></li>
												<li class="author" style="float: left">
													<%-- <img
													href="/travelForum/user/member/${topic.user.username}"
													width="16" height="16"> --%> <i class="fa fa-user-o"
													aria-hidden="true"></i>&nbsp; ${topic.user.username}&nbsp;
													&nbsp;
												</li>
												<li class="publish" style="float: left"><i
													class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;${topic.localCreateTime}&nbsp;
													&nbsp;</li>
												<li class="view" style="float: left"><i
													class="fa fa-eye" aria-hidden="true"></i>&nbsp;${topic.click}&nbsp;
													&nbsp;</li>
												<li class="ding" style="float: left"><i
													class="fa fa-comment-o" aria-hidden="true"></i>&nbsp;${topic.countReplies}</li>
											</ul>
										</div>
									</div>
								</dd>
							</dl>
						</li>
<hr/>
					</c:forEach>

				</ul>

			</div>

			<div class="row">
				<div class="panel panel-default col-xs-3" id="sidebar1"
					style="float: right; margin-top: 20px; clear:right">
					<div>
						<h4 class="feed_new_tit" style="margin: 15px 0px;">
							<span class="line"></span><span class="txt">推荐</span>
						</h4>
					</div>
					<ul class="list-group" style="width: 100%">
						<c:forEach items="${hotestTopics}" var="hotestTopics">
							<li class="list-group-item"><a
								href="/travelForum/topic/${hotestTopics.id}">${hotestTopics.title}</a></li>
						</c:forEach>
					</ul>
				</div>
				<c:if test="${!empty userId}">
					<div class="panel panel-default col-xs-3" id="sidebar2"
						style="float: right; clear:right">
						<h4 class="feed_new_tit" style="margin: 15px 0px;">
							<span class="line"></span><span class="txt">我的文章</span>
						</h4>
						<ul class="list-group" style="width: 100%">
							<c:if test="${!empty userPersonalTopics}">
								<c:forEach items="${userPersonalTopics}"
									var="userPersonalTopics">
									<li class="list-group-item"><a
										href="/travelForum/topic/${userPersonalTopics.id}">${userPersonalTopics.title}</a></li>
								</c:forEach>
							</c:if>
							<c:if test="${empty userPersonalTopics}">
								<div style="margin: 15px;">
									还未发帖，<a href="/travelForum/main/new">去发帖</a>
								</div>
							</c:if>
						</ul>
					</div>
				</c:if>
				<c:if test="${!empty userId}">
					<div class="panel panel-default col-xs-3" id="sidebar2"
						style="float: right; clear:right">
						<h4 class="feed_new_tit" style="margin: 15px 0px;">
							<span class="line"></span><span class="txt">我的转发</span>
						</h4>
						<ul class="list-group" style="width: 100%">
							<c:if test="${!empty userTransmitTopics}">
								<c:forEach items="${userTransmitTopics}"
									var="userTransmitTopics">
									<li class="list-group-item"><a
										href="/travelForum/topic/${userTransmitTopics.id}">${userTransmitTopics.title}</a></li>
								</c:forEach>
							</c:if>
							<c:if test="${empty userTransmitTopics}">
								<div style="margin: 15px;">
									未有转发，<a href="/travelForum/topic/Index">去转发</a>
								</div>
							</c:if>
						</ul>
					</div>
				</c:if>
				<c:if test="${!empty userId}">
					<div class="panel panel-default col-xs-3" id="sidebar2"
						style="float: right; clear:right">
						<h4 class="feed_new_tit" style="margin: 15px 0px;">
							<span class="line"></span><span class="txt">我的收藏</span>
						</h4>
						<ul class="list-group" style="width: 100%">
							<c:if test="${!empty userCollectTopics}">
								<c:forEach items="${userCollectTopics}" var="userCollectTopics">
									<li class="list-group-item"><a
										href="/travelForum/topic/${userCollectTopics.id}">${userCollectTopics.title}</a></li>
								</c:forEach>
							</c:if>
							<c:if test="${empty userCollectTopics}">
								<div style="margin: 15px;">
									未有收藏，<a href="/travelForum/topic/Index">去收藏</a>
								</div>
							</c:if>
						</ul>
					</div>
				</c:if>
				<c:if test="${!empty userId}">
					<div class="panel panel-default col-xs-3" id="sidebar3"
						style="float: right; clear:right">
						<h4 class="feed_new_tit" style="margin: 15px 0px;">
							<span class="line"></span><span class="txt">我的草稿</span>
						</h4>
						<ul class="list-group" style="width: 100%">
							<c:if test="${!empty userPersonalDraftTopics}">
								<c:forEach items="${userPersonalDraftTopics}"
									var="userPersonalDraftTopics">
									<li class="list-group-item"><a
										href="/travelForum/topic/${userPersonalDraftTopics.id}">${userPersonalDraftTopics.title}</a></li>
								</c:forEach>
							</c:if>
							<c:if test="${empty userPersonalDraftTopics}">
								<div style="margin: 15px;">
									草稿箱空空的...，<a href="/travelForum/main/new">去发帖</a>
								</div>
							</c:if>
						</ul>
					</div>
				</c:if>
			</div>
		</div>
	</div>

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

		$(function() {
			initPageDom();
			initPageEvent();
		});

		function initPageDom() {
			$.ajax({
				url : contextPath + "/topic/Index"
			});
		}
		
		function initPageEvent() {

		}


	</script>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="/travelForum/skin/js/bootstrap.js"></script>
</body>
</html>