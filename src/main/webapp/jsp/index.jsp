<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<title>首页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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

/* ------------- */
.bigtitlebox {
	margin-top: 20px;
	margin-left: 98px;
	height: 46px;
	border-bottom: #999999 solid 1px;
	margin-bottom: 5px;
	width: 1125px;
}

.bigtitlebox .bigtitle {
	font-size: 26px;
	color: #333;
	border-bottom: #508eff solid 4px;
	float: left;
	padding: 0px 0px 5px 0px;
	margin: 0px 0px -1px 0px;
}

.bigtitlebox .taglist {
	float: left;
	padding: 15px 0px 0px 13px;
	font-size: 0px;
}

.morelink {
	color: #666666;
	font-size: 14px;
	float: right;
	background:
		url(http://static.8264.com/static/images/moban/indexnew/images/morelinkicon.jpg)
		right center no-repeat;
	padding: 0px 14px 0px 0px;
	/* margin: 15px 10px 0px 0px; */
}

/* 热门旅游地 */
.w300 {
	width: 300px;
	float: right;
	margin-bottom: 20px;
}

.mt27 {
	margin-top: 27px;
}

.righttitle {
	font-size: 20px;
	color: #333333;
	line-height: 1;
	font-weight: bold;
}

.righttitle a.alllink {
	background:
		url(http://static.8264.com/static/images/moban/indexnew/images/allicon.png)
		15px center no-repeat #ecf1f7;
	line-height: 1;
	font-size: 14px;
	color: #333333;
	border-radius: 20px;
	height: 28px;
	line-height: 28px;
	padding: 0px 17px 0px 27px;
	font-weight: normal;
	display: inline-block;
	margin: 0px 0px 0px 10px;
}

.hotmudidibox {
	/* border: #e0e7eb solid 1px; */
	border-bottom: 0px;
	border-right: 0px;
	margin-top: 15px;
	width: 298px;
}

ol, ul {
	list-style: none;
}

li {
	margin: 0px;
}

.hotmudidibox li {
	width: 98px;
	border: #e0e7eb solid 1px;
	/* border-bottom: #e0e7eb solid 1px;
    border-right: #e0e7eb solid 1px; */
	height: 70px;
	float: left;
	margin: 0px;
}

.hotmudidibox li a {
	display: block;
	height: 72px;
	width: 99px;
	text-align: center;
	overflow: hidden;
}

.hotmudidibox li a:hover {
	background-color: #508eff;
}

.hotmudidibox li span {
	font-size: 16px;
	color: #31424e;
	display: block;
	width: 100%;
	padding: 13px 0px 0px 0px;
}

.hotmudidibox li em {
	font-size: 12px;
	color: #93a4b0;
	display: block;
	width: 100%;
}

em {
	font-style: normal;
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

.extra li {
	margin: 5px 5px;
}
</style>

<body>

	<!-- 引入header文件 -->
	<jsp:include page="header.jsp"></jsp:include>

	<div class="lineSearch">
		<div class="container"></div>
	</div>


	<!-- 热门话题 -->
	<div class="bigtitlebox clear_b">
		<b class="bigtitle">热门游记</b>
		<div class="taglist" style="width: 685px;">
			<a href="http://bbs.8264.com/forum-post-action-newthread-fid-52.html"
				target="_blank" style="float: right; border-left: none 0;">发布游记</a>
		</div>
		<a href="/travelForum/topic/Index" target="_blank" class="morelink">更多</a>
	</div>

	<!-- <div class="hotTravels" style="margin-top: 5px;">
		<div class="hd"
			style="border: 1px solid #EAEAEA; border-width: 1px 0; height: 42px; line-height: 42px; padding: 15px 0;">
			<a href="http://www.b2b2c.tourex.net.cn/travels/list.html"
				class="moreLink" style="margin-right: 125px;">查看更多游记</a>
			<b
				style="color: #333; font-weight: 700; font-size: 16px; margin: 30px 100px;">热门游记</b>
		</div> -->
	<div class="ol-xs-10">
		<div class="panel col-xs-7" id="main"
			style="margin: 20px 10px 20px 100px;">
			<ul class="clearfix">

				<c:forEach items="${hotestTopics}" var="topic">

					<li style="list-style: none; margin-top: 18px;">
						<dl class="clearfix">
							<dt class="col-xs-3">
								<a href="/travelForum/topic/${topic.id}" target="_blank"
									title="${topic.title}"><img
									src="/travelForum/skin/images/i2.jpg" alt="${topic.title}"
									height="164" style="display: inline; width: 100%;"></a>
							</dt>
							<dd class="col-xs-9" style="float: left">
								<div class="wrapBox">
									<h3>
										<a href="/travelForum/topic/${topic.id}"
											title="${topic.title}">${topic.title}</a>
									</h3>
									<div class="desc">${topic.content}</div>
									<div class="extra">
										<ul class="clearfix"
											style="list-style: none; margin-left: -18px;">
											<li class="author" style="float: left">
												<%-- <img href="/travelForum/user/member/${topic.user.username}"
													width="16" height="16"> --%> <i class="fa fa-user-o"
												aria-hidden="true"></i>&nbsp; ${topic.user.username}&nbsp;
											</li>
											<%-- <li class="author" style="float: left"><span
												class="badge"> ${topic.tab.tabName}&nbsp; </span></li> --%>
											<li class="author" style="float: left"><span
												class="rg-tags"><a
													href="/travelForum/topic/tab/${topic.tabId}">${topic.tab.tabName}</a></span></li>
											<li class="author" style="float: left"><i
												class="fa fa-map-marker"></i>&nbsp;${topic.province},${topic.city}&nbsp;
												&nbsp;</li>
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
					<hr />
				</c:forEach>
				<li style="margin-top: -20px;"><a
					href="/travelForum/topic/Index" class="morelink">更多</a></li>
			</ul>

		</div>

		<div class="panel col-xs-3" style="margin-top: 20px">
			<div class="w300">
				<div class="righttitle mt27">
					热门玩法<a href="/travelForum/topic/Index" target="_blank"
						class="alllink">全部</a>
				</div>
				<div class="hotmudidibox clear_b">
					<ul>
						<c:forEach items="${tabs}" var="tab">
							<li><a href="/travelForum/topic/tab/${tab.id}"
								target="_blank"> <span>${tab.tabName}</span> <em>${tab.count}&nbsp;条</em>
							</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>

		<div class="panel col-xs-3" style="margin-top: 20px">
			<div class="w300">
				<div class="righttitle mt27">
					热门旅行地<a href="/travelForum/topic/Index" target="_blank"
						class="alllink">全部</a>
				</div>
				<div class="hotmudidibox clear_b">
					<ul>
						<li><a
							href="http://www.8264.com/youji/list-370775452393120-5-1.html"
							target="_blank"> <span>四姑娘山</span> <em>291篇</em>
						</a></li>
						<li><a
							href="http://www.8264.com/youji/list-371297712338848-5-1.html"
							target="_blank"> <span>武功山</span> <em>159篇</em>
						</a></li>
						<li><a
							href="http://www.8264.com/youji/list-370743119419296-5-1.html"
							target="_blank"> <span>五台山</span> <em>120篇</em>
						</a></li>
						<li><a
							href="http://www.8264.com/youji/list-370635911841440-4-1.html"
							target="_blank"> <span>贡嘎</span> <em>125篇</em>
						</a></li>
						<li><a
							href="http://www.8264.com/youji/list-370669440188320-3-1.html"
							target="_blank"> <span>拉萨</span> <em>273篇</em>
						</a></li>
						<li><a
							href="http://www.8264.com/youji/list-370837927745440-1-1.html"
							target="_blank"> <span>亚丁</span> <em>197篇</em>
						</a></li>
						<li><a
							href="http://www.8264.com/youji/list-371158297599648-5-1.html"
							target="_blank"> <span>鳌太</span> <em>168篇</em>
						</a></li>
						<li><a
							href="http://www.8264.com/youji/list-371053226722976-5-1.html"
							target="_blank"> <span>雨崩</span> <em>89篇</em>
						</a></li>
						<li><a
							href="http://www.8264.com/youji/list-370753206206112-3-1.html"
							target="_blank"> <span>阿里</span> <em>138篇</em>
						</a></li>
						<li><a
							href="http://www.8264.com/youji/list-370780086972320-3-1.html"
							target="_blank"> <span>丽江</span> <em>240篇</em>
						</a></li>
						<li><a
							href="http://www.8264.com/youji/list-370845392287392-3-1.html"
							target="_blank"> <span>甘南</span> <em>101篇</em>
						</a></li>
						<li><a
							href="http://www.8264.com/youji/list-371012740695968-5-1.html"
							target="_blank"> <span>年保玉则</span> <em>73篇</em>
						</a></li>
					</ul>
				</div>
			</div>
		</div>



	</div>




	<div class="lineSearch">
		<div class="container"></div>
	</div>

	<div class="bigtitlebox clear_b">
		<b class="bigtitle">热门问答</b>
		<div class="taglist" style="width: 685px;">
			<a href="http://bbs.8264.com/forum-post-action-newthread-fid-52.html"
				target="_blank" style="float: right; border-left: none 0;">发布游记</a>
		</div>
		<a href="/travelForum/question/questions/Index" target="_blank"
			class="morelink">更多</a>
	</div>

	<div class="panel col-xs-7" id="main"
		style="margin: 20px 10px 20px 100px;">
		<ul class="clearfix">

			<c:forEach items="${questions}" var="hotestQuestions">

				<li style="list-style: none; margin-top: 18px;">
					<div class="wrapBox">
						<h3 style="margin-left: 15px;">
							<a href="/travelForum/question/questions/${hotestQuestions.id}"
								title="${hotestQuestions.title}">${hotestQuestions.title}</a>
						</h3>
						<div class="desc" style="margin-left: 15px; margin-top: 10px;">${hotestQuestions.content}</div>
						<div class="extra">
							<ul class="clearfix" style="list-style: none; margin-top: 10px;">
								<li class="author" style="float: left"><a
									href="/travelForum/user/member/${hotestQuestions.user.username}"><img
										src="/travelForum/skins/skin/${hotestQuestions.user.avatar}"
										style="float: left; width: 25px; height: 25px; border-radius: 50%"></a>
									<i class="fa fa-user-o" aria-hidden="true"></i>&nbsp;
									${hotestQuestions.user.username}&nbsp; &nbsp;</li>

								<div class="ques-labels"
									style="margin-left: 50px; margin-top: 5px;">
									<a class="tagiconone"
										href="/travelForum/question/tab/${hotestQuestions.tabId}"
										target="_blank">${hotestQuestions.tab.tabName}</a>
								</div>

								<li class="publish" style="float: left"><i
									class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;${hotestQuestions.localCreateTime}&nbsp;
									&nbsp;</li>
								<%-- <li class="view" style="float: left"><i class="fa fa-eye"
											aria-hidden="true"></i>&nbsp;${questions.click}&nbsp; &nbsp;</li> --%>
								<li class="ding" style="float: left"><i
									class="fa fa-comment-o" aria-hidden="true"></i>&nbsp;${hotestQuestions.countReplies}</li>
								<div style="float: right; text-align: center;" class="col-xs-2">
									<span class="badge" style="height: 25px; padding: 6px;">阅读量：${hotestQuestions.click}</span>
								</div>
							</ul>
						</div>
					</div>
				</li>

				<hr />
			</c:forEach>
			<li style="margin-top: -20px;"><a
				href="/travelForum/question/questions/Index" class="morelink">更多</a></li>
		</ul>

	</div>

	<div class="panel col-xs-3" style="margin-top: 20px">
		<div class="w300">
			<div class="righttitle mt27">
				热门玩法<a href="http://www.8264.com/youji/" target="_blank"
					class="alllink">全部</a>
			</div>
			<div class="hotmudidibox clear_b">
				<ul>
					<c:forEach items="${tab}" var="tab">
						<li><a href="/travelForum/question/tab/${tab.id}"> <span>${tab.tabName}</span>
								<em>${tab.count}&nbsp;条</em>
						</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	<link rel="stylesheet"
		href="/travelForum/skin/css/jquery.desoslide.css">
	<script src="/travelForum/skin/js/jquery.desoslide.js"></script>
	<!-- <script>
				$('#demo1_thumbs').desoSlide({
					main : {
						container : '#demo1_main_image',
						cssClass : 'img-responsive'
					},
					effect : 'sideFade',
					caption : true
				});
			</script> -->
	<!-- //news -->
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

	<script>
	var contextPath = '<%=request.getContextPath()%>
		';

		$(function() {

			// 鼠标滑过用户名
			$(document).on("mouseenter", "#userinfo", userMouseenter);
			// 鼠标滑出用户名
			$(document).on("mouseleave", "#userinfo", userMouseleave);
		});

		// 鼠标滑过用户名
		function userMouseenter() {
			$(this).children("div").show();
		}

		// 鼠标滑出用户名
		function userMouseleave() {
			$(this).children("div").hide();
		}

		// 登出 
		$("#logout").on("click", function() {
			$.ajax({
				url : contextPath + "/user/signout",
			/* success : function(data) {
			} */
			});
		});
	</script>
	<!-- //smooth-scrolling-of-move-up -->
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="/travelForum/skin/js/bootstrap.js"></script>

	<!-- FlexSlider -->
	<script defer src="/travelForum/skin/js/jquery.flexslider.js"></script>
	<script type="text/javascript">
		$(window).load(function() {
			$('.flexslider').flexslider({
				animation : "slide",
				start : function(slider) {
					$('body').removeClass('loading');
				}
			});
		});
	</script>
	<!-- End-slider-script -->
</body>
</html>