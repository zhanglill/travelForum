<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
<title>问答</title>
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

/* ------ */
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

/* --- */
.searchboxall {
	padding: 16px 0 0 0;
	height: 60px;
	background: url(../../../tps/i1/searchbg.jpg);
	margin: 10px -110px;
}

.searchboxall .searchcon {
	overflow: hidden;
	width: 627px;
	margin: 0 110px;
}

button, input, select, textarea {
	font-size: 100%;
}

.searchboxall .searchcon .searchinput {
	height: 44px;
	line-height: 44px;
	border: #d5d5d5 solid 1px;
	border-radius: 6px 0 0 6px;
	border-right: 0 none;
	width: 536px;
	float: left;
	background: url(../../../tps/i1/searchicon.png) 13px 13px no-repeat #fff;
	text-indent: 33px;
	font-size: 14px;
}

.searchboxall .searchcon .searchbutton {
	border-radius: 0px 5px 5px 0px;
	height: 44px;
	background-color: #3d82eb;
	width: 90px;
	color: #fff;
	font-size: 16px;
	float: right;
	border: 0 none;
	cursor: pointer;
}

/* ------ */
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

/* ---类型--- */
.assortmentbox {
	margin: 20px;
	padding: 0;
	/* position: absolute; */
	top: 11px;
	left: 0;
	width: 96%;
	background: #fff;
	z-index: 100;
	height: 160px;
}

.assortmentcon {
	height: 80px;
	white-space: nowrap;
	/* overflow: hidden; */
}

.assortmentcon a.hover, .assortmentcon a:hover {
	border: #43a6df solid 1px;
	background: #43a6df;
	color: #fff;
}

.assortmentcon a {
	font-size: 14px;
	color: #666;
	border: #e0e0e0 solid 1px;
	border-radius: 3px;
	height: 28px;
	line-height: 28px;
	float: left;
	padding: 0 10px;
	margin: 8px 8px 0 0;
}

.assortmentmore {
	background: url(../../../tps/i1/flmore.png) left center no-repeat;
	height: 30px;
	color: #666;
	font-size: 12px;
	text-align: center;
	cursor: pointer;
	margin: 15px 0 0 0;
}

.assortmentmore span {
	cursor: pointer;
	background: url(../../../tps/i1/assortmentdowngray_1.png) 44px 6px
		no-repeat;
	display: block;
	width: 54px;
	margin: 0 auto;
	padding: 2px 0 0 0;
}

/* ---- */
.listtitlebig span {
	font-size: 18px;
	color: #000;
	float: left;
}

.listtitlebig .czright {
	float: right;
}

.listtitlebig .czright a {
	width: 61px;
	height: 21px;
	line-height: 20px;
	background: url(../../../tps/i1/px.png) 9px center no-repeat #d6d6d6;
	color: #fff;
	font-size: 12px;
	text-indent: 27px;
	display: inline-block;
}

.listtitlebig .czright a.hover {
	background: url(../../../tps/i1/px_z.png) 9px center no-repeat #43a6df;
}

.listtitlebig .czright a {
	width: 61px;
	height: 21px;
	line-height: 20px;
	background: url(../../../tps/i1/px.png) 9px center no-repeat #d6d6d6;
	color: #fff;
	font-size: 12px;
	text-indent: 27px;
	display: inline-block;
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
</style>

</head>

<body>

	<!-- 引入header文件 -->
	<jsp:include page="header.jsp"></jsp:include>

	<div class="header">
		<div class="layout">
			<div class="icoHill">&nbsp;</div>
			<div class="headerL">
				<!-- <h1>
					<span class="country">论坛精选</span>
				</h1> -->
				<div class="site">
					当前位置： <a href="/travelForum/">首页</a> &gt; <span>问答</span>
				</div>
			</div>

		</div>
	</div>

	<div class="container">
		<div class="row">

			<div class="col-xs-8" style="float: left">

				<div class="searchboxall" style="margin-top: 20px;">
					<div class="searchcon">
						<form id="scform" autocomplete="off"
							action="http://so.8264.com/cse/search" target="_blank">
							<input type="hidden" name="s" value="9963133823733045431">
							<input type="hidden" name="nsid" value="4">
							<!-- <i class="fa fa-search" aria-hidden="true"></i> -->
							<input type="search" class="searchinput" name="q"
								placeholder="搜搜你想问的问题"> <input type="submit"
								class="searchbutton" value="搜索">
						</form>
					</div>
				</div>
				<div class="panel" id="main" style="width: 770px;">
					<div class="assortmentbox clear_b">
						<div class="assortmentbox-inner line">
							<div class="assortmentcon" style="height: 80px;">
								<a href="/travelForum/question/questions/IndexByCount"
									class="hover" id="all">全部</a>
								<c:forEach items="${tab}" var="tab">
									<a href="/travelForum/question/tab/${tab.id}"
										data="${tab.tabName}">${tab.tabName}</a>
								</c:forEach>
							</div>
						</div>
						<!-- <div class="assortmentmore">
							<span>更多</span>
						</div>
						<div class="u-c-more">
							<span class="more-channel"></span>
						</div> -->
					</div>
				</div>

				<div class="panel" id="main" style="width: 770px;">
					<div class="panel-heading" style="background-color: white">
						<div class="listtitlebig clear_b">
							<span>所有问题</span>
							<div class="czright">
								<a href="/travelForum/question/questions/IndexByCount" id="hot">热门</a>
								<a href="/travelForum/question/questions/Index" id="timeDesc">时间</a>

							</div>
						</div>
					</div>
					<!-- <div class="panel-heading" style="background-color: white">
						<a style="margin-right: 2%" href="/travelForum/question/questions/Index">最新</a><span
							style="width: 2px; height: 10px"></span> <a href="/travelForum/question/questions/IndexByCount"
							style="margin-right: 2%">热门</a>
					</div> -->
					<hr style="margin-top: 10px;">
					<div class="panel-body" style="margin-top: -20px;">
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
													<i class="fa fa-user-o" aria-hidden="true"></i>&nbsp;
													${questions.user.username}&nbsp; &nbsp;</li>

												<div class="ques-labels"
													style="margin-left: 50px; margin-top: 5px;">
													<a class="tagiconone"
														href="/travelForum/question/tab/${questions.tabId}">${questions.tab.tabName}</a>
												</div>

												<li class="publish" style="float: left"><i
													class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;${questions.localCreateTime}&nbsp;
													&nbsp;</li>
												<%-- <li class="view" style="float: left"><i class="fa fa-eye"
											aria-hidden="true"></i>&nbsp;${questions.click}&nbsp; &nbsp;</li> --%>
												<li class="ding" style="float: left"><i
													class="fa fa-comment-o" aria-hidden="true"></i>&nbsp;${questions.countReplies}</li>
												<div style="float: right; text-align: center;"
													class="col-xs-2">
													<span class="badge" style="height: 25px; padding: 6px;">阅读量：${questions.click}</span>
												</div>
											</ul>
										</div>
									</div>
								</li>

								<hr />
							</c:forEach>

						</ul>

					</div>
				</div>
			</div>
			<%-- <div class="row">

						<div class="col-md-6">当前第 ${pageInfo.pageNum} 页.总共
							${pageInfo.pages} 页.一共 ${pageInfo.total} 条记录</div>

						<!--点击分页-->
						<div class="col-md-6">
							<nav aria-label="Page navigation">
								<ul class="pagination">

									<li><a
										href="${pageContext.request.contextPath}/questions/IndexByCount?pn=1">首页</a></li>

									<!--上一页-->
									<li><c:if test="${pageInfo.hasPreviousPage}">
											<a
												href="${pageContext.request.contextPath}/questions/IndexByCount?pn=${pageInfo.pageNum-1}"
												aria-label="Previous"> <span aria-hidden="true">«</span>
											</a>
										</c:if></li>

									<!--循环遍历连续显示的页面，若是当前页就高亮显示，并且没有链接-->
									<c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
										<c:if test="${page_num == pageInfo.pageNum}">
											<li class="active"><a href="#">${page_num}</a></li>
										</c:if>
										<c:if test="${page_num != pageInfo.pageNum}">
											<li><a
												href="${pageContext.request.contextPath}/questions/IndexByCount?pn=${page_num}">${page_num}</a></li>
										</c:if>
									</c:forEach>

									<!--下一页-->
									<li><c:if test="${pageInfo.hasNextPage}">
											<a
												href="${pageContext.request.contextPath}/questions/IndexByCount?pn=${pageInfo.pageNum+1}"
												aria-label="Next"> <span aria-hidden="true">»</span>
											</a>
										</c:if></li>

									<li><a
										href="${pageContext.request.contextPath}/questions/IndexByCount?pn=${pageInfo.pages}">尾页</a></li>
								</ul>
							</nav>
						</div>

					</div> --%>

			<div class="col-xs-3" style="float: left">

				<div class="wyfbbox" style="margin: 20px 50px 10px;">
					<a href="/travelForum/question/new" class="wytw"><i
						class="fa fa-plus" style="margin-left: -15px;"></i>&nbsp;&nbsp;我要提问</a>
				</div>
				<div class="wyfbbox" id="sidebar1"
					style="float: left; margin: 5px 50px;">
					<div class="smallfonttitle">问答总数</div>
					<div class="numbox peoplenum">
						<span>${questionsNum}</span>
					</div>
				</div>

				<div class="wyfbbox" id="sidebar1"
					style="float: left; margin: 5px 50px;">
					<div class="rtitle">
						<a href="/travelForum/question/questions/questionNoReplyByClick">等你回答</a>
					</div>
					<div class="xgwtbox">
						<ul>

							<c:forEach items="${noReply}" var="noReply">
								<li><a
									href="/travelForum/question/questions/noReply/${noReply.id}">
										<div class="wds">
											<b>${noReply.countReplies}</b> 问答
										</div> <span>${noReply.title}</span>
								</a></li>

							</c:forEach>
						</ul>
					</div>
				</div>

				<div class="wyfbbox" id="sidebar1"
					style="float: left; margin: 5px 50px 100px;">
					<div class="rtitle">贡献排行榜</div>
					<div class="gxblist">
						<ul>
							<c:forEach items="${userByCredit}" var="userByCredit">

								<li><a class="tx48"> <img
										src="/travelForum/skins/skin/${userByCredit.avatar}">
										<span>${userByCredit.username}</span>
								</a></li>
								
							</c:forEach>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div style="display: none" id="message">${tabMessage}</div>
	<div style="display: none" id="tabName">${oneTab.tabName}</div>
	<!-- ===================================================================== -->

	<script type="text/javascript">
	var contextPath = '<%=request.getContextPath()%>';

		$(function() {
			initPageDom();
			initPageEvent();
		});

		function initPageDom() {
			var message = $("#message").text();
			if (message = "hot") {
				$("#hot").addClass("hover");
				$("#timeDesc").removeClass("hover");
			} else if (message == "timeDesc") {
				$("#timeDesc").addClass("hover");
				$("#hot").removeremoveClass("hover");
			}

			var tabName = $("#tabName").text();
			if (tabName != "" && tabName != null) {
				$(".assortmentcon a").removeClass("hover");
				$("a[data=" + tabName + "]").addClass("hover");
			}
		}

		function initPageEvent() {
			// 删除
			//$(document).on("click", "#delete", delete_question);
			$(document).on("click", "#hot", hot);
			$(document).on("click", "#timeDesc", timeDesc);
		}

		function hot() {
			$(this).addClass("hover");
			$("#timeDesc").removeClass("hover");
		}

		function timeDesc() {
			$(this).addClass("hover");
			$("#hot").removeClass("hover");
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
</body>

</html>