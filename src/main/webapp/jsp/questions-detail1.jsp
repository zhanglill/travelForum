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
			<div style="width: 60%; margin: 1% 2% 1% 15%; float: left;">
				<div class="panel panel-default" id="main">
					<div class="panel-heading"
						style="background-color: white; margin: 10px;">
						<a href="/travelForum/question/questions/Index">问答首页</a> &nbsp;›&nbsp;
						${questions.title}
					</div>
					<div class="panel-body">
						<div class="panel-heading"
							style="background-color: white; margin: 10px;">
							<h3 id="title">${questions.title}</h3>
							<div style="margin-top: 10px;">
								<span class="text-muted"> <a
									href="/travelForum/user/member/${questions.user.username}">
										<strong>${questions.user.username}</strong>
								</a></span>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <span class="text-muted"
									id="localCreateTime">${questions.localCreateTime}</span>&nbsp;&nbsp;&nbsp;
								<span class="text-muted">阅读量：<span id="click">${questions.click}</span></span>

								<c:if test="${!empty user}">
									<ul class="nav navbar-nav navbar-right"
										style="list-style-type: none; margin-right: 15px">
										<li><span class="text-muted"><a href="#"
												id="transmit"><i class="fa fa-share" aria-hidden="true"></i>&nbsp;转发&nbsp;&nbsp;&nbsp;&nbsp;</a></span></li>
										<li><span class="text-muted"><a href="#"
												id="collect"><i class="fa fa-heart-o" aria-hidden="true"></i>&nbsp;收藏</a></span></li>
									</ul>
								</c:if>
							</div>
						</div>
						<ul class="list-group" style="width: 100%; margin: 20px auto;">
							<li class="list-group-item" id="content">${questions.content}</li>
						</ul>
					</div>
				</div>
				<c:if test="${!empty replies}">
					<div class="panel panel-default" id="main" style="">
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

				<c:if test="${!empty user}">

					<div class="panel panel-default" id="main" style="">
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
	<!-- //smooth-scrolling-of-move-up -->
	<script type="text/javascript">
	var contextPath = '<%=request.getContextPath()%>';

		var userId = $("#userId").text();
		var title = $("#title").text();
		var localCreateTime = $("#localCreateTime").text();
		var click = $("#click").text();
		var content = $("#content").text();

		$(function() {
			initPageEvent();
		});

		function initPageEvent() {
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
					"userId" : userId,
					"title" : title,
					"createTime" : localCreateTime,
					"click" : click,
					"content" : content
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
					"userId" : userId,
					"title" : title,
					"createTime" : localCreateTime,
					"click" : click,
					"content" : content
				},
				success : function(data) {
					alert(data.message);
				}
			});
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
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="/travelForum/skin/js/bootstrap.js"></script>
</body>
</html>