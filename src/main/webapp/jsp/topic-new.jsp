<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
<title>发帖</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />

<script type="text/javascript" charset="utf-8"
	src="/travelForum/utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/travelForum/utf8-jsp/ueditor.all.min.js">
	
</script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
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
<!-- //js -->
<!-- web-fonts -->
<link
	href="http://fonts.googleapis.com/css?family=Dancing+Script:400,700"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<!-- //web-fonts -->


<style type="text/css">
/* div {
	width: 100%;
} */
</style>

</head>
<body>

<!-- 引入header文件 -->
	<jsp:include page="header.jsp"></jsp:include>
	

	<div style="width: 80%; margin: 30px 150px;">
		<div class="panel panel-default" id="main" style="">
			<div class="panel-heading" style="background-color: white">
				<a href="/travelForum/">首页</a> &nbsp;›&nbsp; 发帖
			</div>

			<div class="panel-body">
				<form action="/travelForum/topic/add" method="post" id="replyForm"
					name="f">
					<div class="form-group">
						<label for="title">标题</label> <input type="text"
							class="form-control" id="title" name="title" placeholder="请输入标题"
							required="required">
					</div>
					<!-- <div class="form-group">
						<label for="content">正文</label>
						<textarea class="form-control" rows="10" id="content"
							name="content"></textarea>
					</div> -->
					<div>
						<script id="content" type="text/plain" style="height: 500px;"></script>
					</div>
					<div class="form-group" style="margin-top: 20px;">
						<label for="tab">类型</label><br />
						<div style="width: 40%">
							<select class="form-control" id="tab" name="tab">
								<c:forEach items="${tabs}" var="tab">
									<option value="${tab.id}">${tab.tabName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<br /> <input type="text" class="btn btn-default" id="save"
						style="float: right; width: 120px;" value="保存到草稿箱"
						onclick="javascript:document.f.action='/travelForum/topic/saveDraft';document.f.submit();">
					<input type="submit" class="btn btn-success"
						style="float: right; margin-right: 20px;" value="发布主题"
						onclick="javascript:document.f.action='/travelForum/topic/add';document.f.submit();">
				</form>
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

	<script src="/travelForum/skin/js/bootstrap.js"></script>



	<!-- -=============实例化编辑器=================================================== -->

	<script type="text/javascript">
		//实例化编辑器
		//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
		var ue = UE.getEditor('content');
	</script>
</body>
</html>