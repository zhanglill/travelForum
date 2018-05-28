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

	<div class="container">
		<div class="row">

			<div class="panel panel-default" id="main"
				style="width: 850px; margin: 20px 10px; float: left">
				<ul class="clearfix">
					<c:forEach items="${questions}" var="questions">

						<li style="list-style: none; margin-top: 18px;">
							<div class="wrapBox">
								<h3 style="margin-left: 15px;">
									<a href="/travelForum/question/questions/${questions.id}"
										title="${questions.title}">${questions.title}</a>
								</h3>
								<div class="desc" style="margin-left: 15px; margin-top: 10px;">${questions.content}</div>
								<div class="extra">
									<ul class="clearfix"
										style="list-style: none; margin-top: 10px;">
										<li class="author" style="float: left"><a
											href="/travelForum/user/member/${questions.user.username}"><img
												src="/travelForum/skins/skin/${questions.user.avatar}"
												style="float: left; width: 25px; height: 25px; border-radius: 50%"></a>
											<i class="fa fa-user-o"
											aria-hidden="true"></i>&nbsp;
											${questions.user.username}&nbsp; &nbsp;</li>
										<li class="publish" style="float: left"><i
											class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;${questions.localCreateTime}&nbsp;
											&nbsp;</li>
										<%-- <li class="view" style="float: left"><i class="fa fa-eye"
											aria-hidden="true"></i>&nbsp;${questions.click}&nbsp; &nbsp;</li> --%>
										<li class="ding" style="float: left"><i
											class="fa fa-comment-o" aria-hidden="true"></i>&nbsp;${questions.countReplies}</li>
										<div style="float: right; text-align: center;" class="col-xs-2">
											<span class="badge" style="height: 25px; padding: 6px;">阅读量：${questions.click}</span>
										</div>
									</ul>
								</div>
							</div>
						</li>

<hr/>
					</c:forEach>

				</ul>

			</div>
			<%-- <div class="panel panel-default col-xs-8" id="main"
				style="float: left; margin-top: 20px;">

				<ul class="list-group" style="width: 100%">

					<c:forEach items="${questions}" var="questions">
						<li class="list-group-item" style="height: 110px;">
							<div style="margin: 15px 10px">
								<div style="float: left; clear: both;">
									<h4 style="margin-top: -10px; margin-bottom: 10px;">
										<a href="/travelForum/question/questions/${questions.id}">${questions.title}</a><br />
									</h4>
									<div class="desc" style="margin-top: 10px;">${questions.content}</div>
									<div style="float: left; clear: both; margin-left: -15px;"
										class="col-xs-10">
										<a href="/travelForum/user/member/${questions.user.username}"><img
											src="/travelForum/skins/skin/${questions.user.avatar}"
											style="float: left; width: 25px; height: 25px; border-radius: 50%"></a>
										<div style="float: left;">
											&nbsp;&nbsp;&nbsp; <a
												href="/travelForum/user/member/${questions.user.username}"><span><strong>${questions.user.username}</strong></span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<small class="text-muted">${questions.localCreateTime}</small>&nbsp;&nbsp;&nbsp;
											<span class="text-muted"><i class="fa fa-comment-o"
												aria-hidden="true"></i>&nbsp;${questions.countReplies}</span>
										</div>
										<div style="float: right; text-align: center" class="col-xs-2">
											<span class="badge" style="height: 25px; padding: 6px;">阅读量：${questions.click}</span>
										</div>
									</div>

								</div>
							</div>
						</li>
					</c:forEach>

				</ul>

			</div> --%>

			<div class="row">
				<div class="panel panel-default col-xs-3" id="sidebar1"
					style="float: right; margin-top: 20px;">

					<form action="/travelForum/question/questions/add" method="post"
						id="replyForm">
						<div class="form-group" style="margin-top: 20px;">
							<div style="margin-bottom: 10px;">
								<input name="title" class="form-control" id="title"
									placeholder="输入问答标题">
							</div>
							<div>
								<textarea class="form-control" rows="7" id="content"
									name="content" placeholder="输入你想要提问的内容"></textarea>
							</div>
							<input type="submit" class="btn btn-success" value="发表提问"
								style="float: right; margin: 10px 0px;">
						</div>
					</form>
				</div>


				<c:if test="${!empty userId}">
					<div class="panel panel-default col-xs-3" id="sidebar1"
						style="float: right; clear: right;">
						<div>
							<h4 class="feed_new_tit" style="margin: 15px 0px;">
								<span class="line"></span><span class="txt">我的问答</span>
							</h4>
						</div>
						<ul class="list-group" style="width: 100%">
							<c:if test="${!empty userPersonalQuestions}">
								<c:forEach items="${userPersonalQuestions}"
									var="userPersonalQuestions">
									<li class="list-group-item"><a
										href="/travelForum/question/questions/${userPersonalQuestions.id}">${userPersonalQuestions.title}</a></li>
								</c:forEach>
							</c:if>
						</ul>
					</div>
				</c:if>
			</div>
		</div>
	</div>
		<div style="display: none" id="message">${message}</div>
	<!-- ===================================================================== -->

<script type="text/javascript">
	var contextPath = '<%=request.getContextPath()%>';

		$(function() {
			initPageDom();
			initPageEvent();
		});

		function initPageDom() {
			/* var message = $("#message").text();
			if(message.trim() != null | message.trim() != "") {
				alert(message);
			}	 */
		}
		
		function initPageEvent() {
			// 删除
			//$(document).on("click", "#delete", delete_question);
		}

	</script>
	
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
</body>

</html>