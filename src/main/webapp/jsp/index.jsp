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
</head>
<body>

	<!-- 引入header文件 -->
	<jsp:include page="header.jsp"></jsp:include>

	<!-- 热门话题 -->
	<div class="hotTravels" style="margin-top: 5px;">
		<div class="hd" style="border: 1px solid #EAEAEA; border-width: 1px 0; height: 42px; line-height: 42px; padding: 15px 0;">
			<!-- <a href="http://www.b2b2c.tourex.net.cn/travels/list.html"
				class="moreLink" style="margin-right: 125px;">查看更多游记</a> --><b
				style="color: #333; font-weight: 700; font-size: 16px; margin: 30px 100px;">热门游记</b>
		</div>
		<div class="panel panel-default col-xs-10" id="main"
			style="margin: 20px 100px;">
			<ul class="clearfix">
				<c:forEach items="${hotestTopics}" var="topic">

					<li style="list-style: none; margin-top: 18px;">
						<dl class="clearfix">
							<dt class="col-xs-3">
								<a href="http://www.b2b2c.tourex.net.cn/travels/31/"
									target="_blank" title="${topic.title}"><img
									src="/travelForum/skin/images/i2.jpg" alt="${topic.title}"
									height="164" style="display: inline; width: 100%;"></a>
							</dt>
							<dd class="col-xs-9" style="float: left">
								<div class="wrapBox">
									<h3>
										<a href="/travelForum/topic/${topic.id}" target="_blank"
											title="${topic.title}">${topic.title}</a>
									</h3>
									<div class="desc">${topic.content}</div>
									<div class="extra">
										<ul class="clearfix" style="list-style: none;">
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
	</div>

	<!-- welcome -->
	<div class="welcome">
		<div class="container">
			<div class="col-md-7 welcome-w3lleft">
				<h3>Welcome !</h3>
				<h5>Cras porttitor imperdiet volutpat nulla malesuada lectus
					eros ut convallis felis consectetur ut</h5>
				<p>Integer vitae ligula sed lectus consectetur pellentesque
					blandit nec orci. Nulla ultricies nunc et lorem semper, quis
					accumsan dui aliquam aucibus sagittis placerat. Pellentesque
					habitant morbi tristique senectus et netus et malesuada fames ac
					turpis egestas. Morbi non nibh nec enim sollicitudin
					interdum.tristique senectus et netus et malesuada fames ac turpis
					egestas</p>
				<a href="#" class="w3layouts-more" data-toggle="modal"
					data-target="#myModal">Read More</a>
			</div>
			<div class="col-md-5 welcome-w3lright">
				<div class="welcome-grids">
					<div class="service-box">
						<div class="agileits-wicon">
							<i class="fa fa-motorcycle" aria-hidden="true"></i>
						</div>
						<h5>Proin eget ipsum ultrices</h5>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="welcome-grids">
					<div class="col-md-6 col-sm-6 col-xs-6 service-box">
						<div class="agileits-wicon">
							<i class="fa fa-truck" aria-hidden="true"></i>
						</div>
						<h5>Proin eget ipsum ultrices</h5>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-6 service-box">
						<div class="agileits-wicon">
							<i class="fa fa-car" aria-hidden="true"></i>
						</div>
						<h5>Proin eget ipsum ultrices</h5>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //welcome -->
	<!-- modal-about -->
	<div class="modal bnr-modal fade" id="myModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body modal-spa">
					<h4>Blanditiis deleniti</h4>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Cras rutrum iaculis enim, non convallis felis mattis at. Donec
						fringilla lacus eu pretium rutrum. Cras aliquet congue
						ullamcorper. Etiam mattis eros eu ullamcorper volutpat. Proin ut
						dui a urna efficitur varius. uisque molestie cursus mi et congue
						consectetur adipiscing elit cras rutrum iaculis enim, Lorem ipsum
						dolor sit amet, non convallis felis mattis at. Maecenas sodales
						tortor ac ligula ultrices dictum et quis urna. Etiam pulvinar
						metus neque, eget porttitor massa vulputate in. Fusce lacus purus,
						pulvinar ut lacinia id, sagittis eu mi. Vestibulum eleifend massa
						sem, eget dapibus turpis efficitur at. Aliquam viverra quis leo et
						efficitur. Nullam arcu risus, scelerisque quis interdum eget,
						fermentum viverra turpis. Itaque earum rerum hic tenetur a
						sapiente delectus, ut aut reiciendis voluptatibus maiores alias
						consequatur aut At vero eos</p>
				</div>
			</div>
		</div>
	</div>
	<!-- //modal-about -->
	<!-- trips -->
	<div class="trips">
		<div class="container">
			<div class="trips-agileinfo">
				<div class="col-md-6 trip-agileitsimg"></div>
				<div class="col-md-6 trip-agileitstext welcome-w3lleft">
					<h3>我们的旅程</h3>
					<h5>Cras porttitor imperdiet volutpat</h5>
					<p>Pellentesque habitant morbi tristique senectus et netus et
						malesuada fames ac turpis egestas. Morbi non nibh nec enim
						sollicitudin interdum.tristique senectus et netus et malesuada
						fames ac turpis egestas</p>
					<div id="owl-demo" class="owl-carousel owl-theme">
						<div class="item agile-item">
							<img src="/travelForum/skin/images/i1.jpg" class="trip-w3img"
								alt="" />
						</div>
						<div class="item agile-item">
							<img src="/travelForum/skin/images/i2.jpg" class="trip-w3img"
								alt="" />
						</div>
						<div class="item agile-item">
							<img src="/travelForum/skin/mages/i3.jpg" class="trip-w3img"
								alt="" />
						</div>
						<div class="item agile-item">
							<img src="/travelForum/skin/images/i4.jpg" class="trip-w3img"
								alt="" />
						</div>
						<div class="item agile-item">
							<img src="/travelForum/skin/images/i1.jpg" class="trip-w3img"
								alt="" />
						</div>
						<div class="item agile-item">
							<img src="/travelForum/skin/images/i2.jpg" class="trip-w3img"
								alt="" />
						</div>
						<div class="item agile-item">
							<img src="/travelForum/skin/images/i3.jpg" class="trip-w3img"
								alt="" />
						</div>
						<div class="item agile-item">
							<img src="/travelForum/skin/images/i4.jpg" class="trip-w3img"
								alt="" />
						</div>
						<div class="item agile-item">
							<img src="/travelForum/skin/images/i1.jpg" class="trip-w3img"
								alt="" />
						</div>
						<div class="item agile-item">
							<img src="/travelForum/skin/images/i3.jpg" class="trip-w3img"
								alt="" />
						</div>
					</div>
					<script>
						$(document).ready(function() {
							$("#owl-demo").owlCarousel({
								autoPlay : 3000, //Set AutoPlay to 3 seconds

								items : 3,
								itemsDesktop : [ 768, 3 ],
								itemsDesktopSmall : [ 414, 4 ]

							});

						});
					</script>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- //trips -->
	<!-- news -->
	<%-- <div class="news">
		<div class="container">
			<h3 class="w3agileits-title">我的旅程</h3>
			<div class="new-agileinfo">
				<div class="col-md-4 news-left">
					<ul id="demo1_thumbs" class="list-inline">
						<li><a href="/travelForum/skin/images/img2.jpg"><img
								src="images/i2.jpg" alt=""
								data-desoslide-caption="<h3>Maecenas aliqua</h3> <br>Eligendi optio nam libero tempore cum soluta nobis est cumque nihil impedit quo minus id quod maxime placeat facere possimus omnis optio cumque nihil impedit quo minus id quod maxime placeat facere possimus">
								<div class="news-w3text">
									<h4>Maecenas aliqua</h4>
									<h6>
										<i class="fa fa-calendar" aria-hidden="true"></i> 05 / 09 /
										2016
									</h6>
									<p>Integer viverra eleifend neque, duis vulputate tempus
										laoreet.</p>
								</div> </a></li>
						<li><a href="/travelForum/skin/images/img1.jpg"><img
								src="images/i1.jpg" alt=""
								data-desoslide-caption="<h3>Facere possimus </h3> <br>Nam libero tempore cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus omnis optio cumque nihil impedit quo minus id quod maxime placeat facere possimus">
								<div class="news-w3text">
									<h4>Facere possimus</h4>
									<h6>
										<i class="fa fa-calendar" aria-hidden="true"></i> 05 / 09 /
										2016
									</h6>
									<p>Aliquam erat volutpat. Duis vulputate tempus laoreet.</p>
								</div> </a></li>
						<li><a href="/travelForum/skin/images/img3.jpg"><img
								src="images/i3.jpg" alt=""
								data-desoslide-caption="<h3>Nulla molestie</h3> <br>Nam libero tempore cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus omnis optio cumque nihil impedit quo minus id quod maxime placeat facere possimus">
								<div class="news-w3text">
									<h4>Nulla molestie</h4>
									<h6>
										<i class="fa fa-calendar" aria-hidden="true"></i> 05 / 09 /
										2016
									</h6>
									<p>Aliquam erat volutpat. Duis vulputate tempus laoreet.</p>
								</div> </a></li>
						<li><a href="/travelForum/skin/images/img4.jpg"><img
								src="images/i4.jpg" alt=""
								data-desoslide-caption="<h3>Duis accumsan</h3> <br>Eligendi optio nam libero tempore cum soluta nobis est cumque nihil impedit quo minus id quod maxime placeat facere possimus omnis optio cumque nihil impedit quo minus id quod maxime placeat facere possimus">
								<div class="news-w3text">
									<h4>Duis accumsan</h4>
									<h6>
										<i class="fa fa-calendar" aria-hidden="true"></i> 05 / 06 /
										2018
									</h6>
									<p>Integer viverra eleifend neque, duis vulputate tempus
										laoreet.</p>
								</div> </a></li>
					</ul>
				</div>
				<div id="demo1_main_image" class="col-md-8  news-right"></div>
			</div> --%>
	<link rel="stylesheet"
		href="/travelForum/skin/css/jquery.desoslide.css">
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
	<!-- footer -->
	<div class="footer">
		<div class="container">
			<!-- 			<div class="col-md-4 footer-grids">
				<h3>Review</h3>
				<p>Sed ut turpis elit ullamcorper in auctor non, accumsan vel
					lacus nulla auctor cursus nunc. Maecenas ultricies dolor in urna
					tempus, id egestas erat finibus interdum lectus eget scelerisque.</p>
			</div>
			<div class="col-md-3 footer-grids">
				<h3>Contact Us</h3>
				<p>
					123 NewYork City USA.<br> <span>Office: 908-0000</span>
				</p>
				<div class="footer-bottom">
					<a href="#"><i class="fa fa-facebook"> </i><span>Facebook</span></a>
					<a href="#"><i class="fa fa-twitter"> </i><span>Twitter</span></a>
					<a href="#"><i class="fa fa-google-plus"> </i><span>Google
							+</span></a> <a href="#"><i class="fa fa-dribbble"> </i><span>Dribbble</span></a>
				</div>
			</div>
			<div class="col-md-5 footer-grids">
				<h3>Flickr</h3>
				<a class="footer-img" href=""><img
					src="/travelForum/skin/images/i4.jpg" alt=""></a> <a
					class="footer-img" href=""><img
					src="/travelForum/skin/images/i2.jpg" alt=""></a> <a
					class="footer-img" href=""><img
					src="/travelForum/skin/images/i3.jpg" alt=""></a>
			</div>
			<div class="clearfix"></div> -->
			<!-- <div class="footer-copy">
				<p>Copyright &copy; 2018.Company name All rights reserved.</p>
			</div> -->
		</div>
	</div>
	<!-- //footer -->
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
	var contextPath = '<%=request.getContextPath()%>';

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