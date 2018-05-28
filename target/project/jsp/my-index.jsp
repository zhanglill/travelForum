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
</style>

</head>

<body>
	<!-- 引入header文件 -->
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container" style="margin-top: 50px; margin-bottom: 50px;">

		<div class="row">

			<div class="panel panel-default col-xs-9" id="main"
				style="float: right;">

				<ul class="list-group" style="width: 100%">
					<c:forEach items="${userPersonalTopics}" var="userPersonalTopics">
						<li class="list-group-item" style="height: 90px;">
							<div style="margin: 15px 10px">
								<div style="float: left; clear: both;">
									<h4 style="margin-top: -10px; margin-bottom: 10px;">
										<a href="/travelForum/topic/${userPersonalTopics.id}">${userPersonalTopics.title}</a><br />
									</h4>
								</div>
								<div style="float: left; clear: both; margin-left: -15px;"
									class="col-xs-10">

									<div style="float: left;">
										<small class="text-muted" id="localCreateTime">${userPersonalTopics.localCreateTime}</small>&nbsp;&nbsp;&nbsp;
										<span class="text-muted"><i class="fa fa-comment-o"
											aria-hidden="true"></i>&nbsp;${userPersonalTopics.countReplies}</span>
									</div>
								</div>
								<div style="float: right; text-align: center" class="col-xs-2">
									<span class="badge" style="height: 25px; padding: 6px;">阅读量：${userPersonalTopics.click}</span>
								</div>
							</div>
						</li>
					</c:forEach>

				</ul>

			</div>

			<div class="row">
				<c:if test="${!empty userId}">
					<div class="panel panel-default col-xs-3" id="sidebar2"
						style="float: left">
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
						style="float: left">
						<h4 class="feed_new_tit" style="margin: 15px 0px;">
							<span class="line"></span><span class="txt">我的问答</span>
						</h4>
						<ul class="list-group" style="width: 100%">
							<c:if test="${!empty myQuestions}">
								<c:forEach items="${myQuestions}"
									var="myQuestions">
									<li class="list-group-item"><a
										href="/travelForum/topic/${myQuestions.id}">${myQuestions.title}</a></li>
								</c:forEach>
							</c:if>
							<c:if test="${empty myQuestions}">
								<div style="margin: 15px;">
									还未发帖，<a href="/travelForum/main/new">去提问</a>
								</div>
							</c:if>
						</ul>
					</div>
				</c:if>
				<c:if test="${!empty userId}">
					<div class="panel panel-default col-xs-3" id="sidebar2"
						style="float: left; clear:left">
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
						style="float: left; clear:left">
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
						style="float: left; clear:left">
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

	<!-- ===================================================================== -->
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
		function signout_confirm() {
			var r = confirm("确定退出?")
			if (r == true) {
				$.ajax({
					url : contextPath + "/user/signout",
					success : function(data) {
					}
				});

			} else {

			}
		}
		
		// 登出 
        $("#logout").on("click",function() {
                $.ajax({
                    url : contextPath + "/user/signout",
                    /* success : function(data) {
                    } */
                });
        });
	</script>



	<script src="/travelForum/skin/js/bootstrap.js"></script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var trigger = $('.hamburger'), overlay = $('.overlay'), isClosed = false;
							trigger.click(function() {
								hamburger_cross();
							});
							function hamburger_cross() {
								if (isClosed == true) {
									overlay.hide();
									trigger.removeClass('is-open');
									trigger.addClass('is-closed');
									isClosed = false;
								} else {
									overlay.show();
									trigger.removeClass('is-closed');
									trigger.addClass('is-open');
									isClosed = true;
								}
							}
							$('[data-toggle="offcanvas"]').click(function() {
								$('#wrapper').toggleClass('toggled');
							});
						});
	</script>
	
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