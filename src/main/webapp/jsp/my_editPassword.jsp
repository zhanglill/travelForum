<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<title>Home</title>
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

<style type="text/css">
a {
	color: #8A8A8A;
	cursor: pointer;
}

body {
	overflow-x: hidden;
	background: #f2f0f5;
	padding: 15px 0px 10px 5px;
}
</style>

</head>
<body>

<!-- 引入header文件 -->
	<jsp:include page="header.jsp"></jsp:include>

	<div style="width: 70%; margin: 1% 2% 1% 15%; align: center;">
		<div class="panel panel-default" id="main" style="">
			<div class="panel-heading" style="background-color: white">
				<a href="/travelForum/">首页</a>> 密码修改
			</div>

			<div class="panel-body">

				<div class="row">
					<div class="col-sm-10" style="margin: 20px 150px;">
						<form class="form-horizontal">
							<div class="form-group">
								<label for="password" class="col-sm-2 control-label">原始密码</label>
								<div class="col-sm-6">
									<input type="password" class="form-control" id="oldPassword"
										name="password" placeholder="请输入原始密码" required="required">
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-sm-2 control-label">新密码</label>
								<div class="col-sm-6">
									<input type="password" class="form-control" id="newPassword"
										name="password" placeholder="请输入新密码" required="required">
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-sm-2 control-label">密码确认</label>
								<div class="col-sm-6">
									<input type="password" class="form-control" id="secondPassword"
										name="password" placeholder="请再次输入密码" required="required">
								</div>
							</div>
							<div class="form-group">
								<input type="submit" class="btn btn-success" id="updatePassword"
									style="margin-left: 270px;" value="保存"> <input
									type="reset" class="btn btn-default" id="reset2"
									style="margin-left: 30px;" value="重置">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="display: none" id="userId">${sessionScope.userId}</div>
	<div style="display: none" id="message">${"message"}</div>

</body>

<script type="text/javascript">
    var contextPath = '<%=request.getContextPath()%>';
	var userId = $("#userId").text();

	$(function() {
		initPageEvent();
	});

	function initPageEvent() {
		// 修改密码
		$(document).on("click", "#updatePassword", updatePassword);
	}

	function updatePassword() {

		var oldPassword = $("#oldPassword").val();
		var newPassword = $("#newPassword").val();
		var secondPassword = $("#secondPassword").val();

		if(oldPassword == '' || newPassword == '' | secondPassword == ''){
			alert("请将信息填写完整！")
		}else{
			if (newPassword == secondPassword) {
				$.ajax({
					type : "POST",
					url : contextPath + "/user/updatePassword",
					dataType : "json",
					data : {
						"oldPassword" : oldPassword,
						"newPassword" : newPassword,
						"secondPassword" : secondPassword
					},
					success : function(datas) {
						if (datas.message == "no") {
							alert("输入的原始密码不正确！");
						} else if (datas.message == "success") {
							alert("密码修改成功！");
						} else {
							alert("密码修改失败！");
						}
					}
				});
			} else {
				alert("两次密码不一致！");
			}
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

<link rel="stylesheet" href="/travelForum/skin/css/jquery.desoslide.css">
<script src="/travelForum/skin/js/jquery.desoslide.js"></script>
<script>
	$('#demo1_thumbs').desoSlide({
		main : {
			container : '#demo1_main_image',
			cssClass : 'img-responsive'
		},
		effect : 'sideFade',
		caption : true
	});
</script>
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
</html>