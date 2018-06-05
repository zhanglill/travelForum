<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
<title>论坛</title>
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

/* ----- */
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

/* ---- */
.block {
	margin: 0;
}

.rlinkbox ul {
	width: 400px;
}

ol, ul {
	list-style: none;
}

.rlinkbox li {
	width: 94px;
	float: left;
	margin: 0px 9px 9px 0px;
	height: 40px;
}

.rlinkbox a {
	height: 40px;
	background: #637a94;
	font-size: 14px;
	color: #fff;
	text-align: center;
	line-height: 38px;
	display: block;
}

/* ---- */
.layout {
	width: 1170px;
	margin: 0 auto;
}

.strgy-item {
	position: relative;
	padding-top: 32px;
	padding-left: 98px;
}

.module-face {
	position: absolute;
	left: 0;
}

.module-title a {
	color: #585858;
	outline: 0 none;
}

.rg-tags a {
	color: #585858;
	outline: 0 none;
}

.module-face img {
	width: 70px;
	height: 70px;
	border: 1px solid #e8e8e8;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
	padding: 4px;
}

.module-title h3 {
	font-size: 24px;
	color: #333;
	font-weight: 400;
}

.module-line {
	font-size: 14px;
	margin-top: 15px;
	color: #666;
}

.module-line .user-name {
	color: #43a6df;
	margin-right: 10px;
}

.module-line .rg-tags {
	display: inline-block;
	border: 1px solid #e0e0e0;
	height: 24px;
	line-height: 24px;
	padding: 0 10px;
	-webkit-border-radius: 12px;
	-moz-border-radius: 12px;
	border-radius: 12px;
}

.module-body {
	margin-top: 20px;
}

.module-body p {
	font-size: 14px;
	line-height: 26px;
	color: #333;
}

.module-pic {
	margin-top: 20px;
	overflow: hidden;
}

.module-pic .pic-item {
	float: left;
	width: 168px;
	height: 126px;
	margin-right: 8px;
	text-align: center;
	background:
		url(http://static.8264.com/static/images/forum/readmodelTravel/lazy-img-270x128.jpg)
		no-repeat;
	overflow: hidden;
}

.module-pic img {
	max-width: 100%;
	-webkit-transition: all 1.2s ease;
	-moz-transition: all 1.2s ease;
	-o-transition: all 1.2s ease;
	-ms-transition: all 1.2s ease;
	transition: all 1.2s ease;
}

/* ----- */
.mui-mbar-outer {
	position: fixed;
	top: 0;
	right: -452px;
	bottom: 0;
	background:
		url(http://static.8264.com/static/images/forum/readmodelTravel/fx-bg.jpg)
		no-repeat left top;
	box-shadow: -2px 0 8px rgba(4, 0, 0, .25);
	z-index: 1040;
	-webkit-transition: all 500ms cubic-bezier(.7, 0, .3, 1) 0s;
	-moz-transition: all 500ms cubic-bezier(.7, 0, .3, 1) 0s;
	-o-transition: all 500ms cubic-bezier(.7, 0, .3, 1) 0s;
	-ms-transition: all 500ms cubic-bezier(.7, 0, .3, 1) 0s;
	transition: all 500ms cubic-bezier(.7, 0, .3, 1) 0s;
}

.close-menu {
	position: absolute;
	width: 23px;
	height: 74px;
	left: -23px;
	top: 50%;
	margin-top: -37px;
	background:
		url(http://static.8264.com/static/images/forum/readmodelTravel/close-bg.png)
		no-repeat;
}

.close-menu a {
	color: #fff;
	padding: 22px 0 24px 8px;
	line-height: 14px;
	display: block;
}

.mui-mbar-standard {
	position: relative;
	width: 490px;
	height: 100%;
	overflow-y: auto;
}

.mui-mbar-tab-hot {
	padding-top: 80px;
}

.mui-mbar-tab {
	padding: 45px 42px 0;
}

.mui-mbar-tab-title {
	font-size: 22px;
	color: #fff;
	line-height: 32px;
	margin-bottom: 20px;
}

.label-list {
	margin: -8px 0 0;
	overflow: hidden;
}

.label-list a.active, .label-list a:hover {
	background:
		url(http://static.8264.com/static/images/forum/readmodelTravel/corner.png)
		no-repeat top right;
	color: #99afbf;
}

.label-list a {
	display: inline-block;
	float: left;
	white-space: nowrap;
	background-color: #7790a2;
	color: #333;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	height: 28px;
	line-height: 28px;
	padding: 0 10px;
	margin: 8px 8px 0 0;
	font-size: 14px;
	border: 1px solid #7790a2;
}

.mui-mbar-tab-title .all-link {
	font-size: 12px;
	color: #bad0df;
	display: inline-block;
	margin-left: 10px;
	border: 1px solid #637685;
	height: 24px;
	line-height: 24px;
	vertical-align: middle;
	padding: 0 12px;
	-webkit-border-radius: 12px;
	-moz-border-radius: 12px;
	border-radius: 12px;
}

.card-label-list {
	width: 422px;
	height: 132px;
	overflow: hidden;
}

.card-label-list li {
	width: 132px;
	height: 132px;
	float: left;
	background-color: #fff;
	margin-right: 8px;
	font-size: 0;
	text-align: center;
}

.card-label-list .art-tit {
	font-size: 20px;
	font-weight: bolder;
	color: #333;
	margin-top: 20px;
}

.card-label-list .art-count {
	font-size: 12px;
}

.card-label-list .pipe-line {
	width: 24px;
	height: 2px;
	display: inline-block;
	background-color: #d1d7db;
	margin: 5px 0 10px;
}

.card-label-list .usr-list img {
	display: inline-block;
	width: 22px;
	height: 22px;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
	margin: 0 2px;
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
					当前位置： <a href="/travelForum/">首页</a> &gt; <span>游记</span>
				</div>
			</div>

		</div>
	</div>

	<!-- <div class="lineSearch">
		<div class="container">
			<div class="startCity">
					
						<div class="curCity"><i class="fa fa-map-marker"></i><span>出发</span><input type="text" class="inputText2 inputCity" value="北京" placeholder="目的地城市" id="lineCityName" name="lineCityName" module="line" readonly=""><p id="lineCityName" module="line">北京</p></div>
						<div id="lineCategoryCityBox" class="dropDestination" style="display: none;"><div class="dropMenu">    <div class="headDest box">        <div class="searchCityBox">            <input type="hidden" id="cityid" name="cityid" value="undefined">            <input type="text" id="cityKey" name="cityKey" autocomplete="off" value="北京" placeholder="搜索城市（支持汉字、首字母查询）">            <div id="searchCityList" class="searchCityResult"></div>        </div>        <div class="block china">            <ul class="tabMenu clearfix" tag="cn"><li class="on"><a cid="1" href="javascript:;">热门城市</a></li><li><a cid="2" href="javascript:;">ABCDEFG</a></li><li><a cid="3" href="javascript:;">HIJKLMN</a></li><li><a cid="4" href="javascript:;">OPQRSTU</a></li><li><a cid="5" href="javascript:;">VWXYZ</a></li>            </ul>            <div class="tabLists">                <div class="item">                    <span><a cid="237" href="/line/list.aspx?cid=237">北京</a></span>                    <span><a cid="238" href="/line/list.aspx?cid=238">天津</a></span>                    <span><a cid="239" href="/line/list.aspx?cid=239">上海</a></span>                    <span><a cid="428" href="/line/list.aspx?cid=428">深圳</a></span>                    <span><a cid="435" href="/line/list.aspx?cid=435">广州</a></span>                </div>                <div class="item">                    <div><span>A</span>                    <span indexcode="A">                    <span><a cid="623" href="/line/list.aspx?cid=623">阿坝</a></span>                    <span><a cid="536" href="/line/list.aspx?cid=536">阿克苏区</a></span>                    <span><a cid="263" href="/line/list.aspx?cid=263">阿拉善盟</a></span>                    <span><a cid="533" href="/line/list.aspx?cid=533">阿勒泰</a></span>                    <span><a cid="498" href="/line/list.aspx?cid=498">阿里</a></span>                    <span><a cid="215" href="/line/list.aspx?cid=215">安徽</a></span>                    <span><a cid="505" href="/line/list.aspx?cid=505">安康</a></span>                    <span><a cid="340" href="/line/list.aspx?cid=340">安庆</a></span>                    <span><a cid="283" href="/line/list.aspx?cid=283">鞍山</a></span>                    <span><a cid="485" href="/line/list.aspx?cid=485">安顺</a></span>                    <span><a cid="398" href="/line/list.aspx?cid=398">安阳</a></span>                    <span><a cid="236" href="/line/list.aspx?cid=236">澳门</a></span></span></div>                    <div><span>B</span>                    <span indexcode="B">                    <span><a cid="286" href="/line/list.aspx?cid=286">白城</a></span>                    <span><a cid="453" href="/line/list.aspx?cid=453">百色</a></span>                    <span><a cid="288" href="/line/list.aspx?cid=288">白山</a></span>                    <span><a cid="523" href="/line/list.aspx?cid=523">白银</a></span>                    <span><a cid="345" href="/line/list.aspx?cid=345">蚌埠</a></span>                    <span><a cid="246" href="/line/list.aspx?cid=246">保定</a></span>                    <span><a cid="511" href="/line/list.aspx?cid=511">宝鸡</a></span>                    <span><a cid="493" href="/line/list.aspx?cid=493">保山</a></span>                    <span><a cid="269" href="/line/list.aspx?cid=269">包头</a></span>                    <span><a cid="466" href="/line/list.aspx?cid=466">巴中</a></span>                    <span><a cid="458" href="/line/list.aspx?cid=458">北海</a></span>                    <span><a cid="237" href="/line/list.aspx?cid=237">北京</a></span>                    <span><a cid="281" href="/line/list.aspx?cid=281">本溪</a></span>                    <span><a cid="483" href="/line/list.aspx?cid=483">毕节地区</a></span>                    <span><a cid="369" href="/line/list.aspx?cid=369">滨州</a></span>                    <span><a cid="333" href="/line/list.aspx?cid=333">亳州</a></span></span></div>                    <div><span>C</span>                    <span indexcode="C">                    <span><a cid="249" href="/line/list.aspx?cid=249">沧州</a></span>                    <span><a cid="293" href="/line/list.aspx?cid=293">长春</a></span>                    <span><a cid="421" href="/line/list.aspx?cid=421">常德</a></span>                    <span><a cid="501" href="/line/list.aspx?cid=501">昌都</a></span>                    <span><a cid="427" href="/line/list.aspx?cid=427">长沙</a></span>                    <span><a cid="259" href="/line/list.aspx?cid=259">长治</a></span>                    <span><a cid="316" href="/line/list.aspx?cid=316">常州</a></span>                    <span><a cid="335" href="/line/list.aspx?cid=335">巢湖</a></span>                    <span><a cid="273" href="/line/list.aspx?cid=273">朝阳</a></span>                    <span><a cid="439" href="/line/list.aspx?cid=439">潮州</a></span>                    <span><a cid="248" href="/line/list.aspx?cid=248">承德</a></span>                    <span><a cid="482" href="/line/list.aspx?cid=482">成都</a></span>                    <span><a cid="418" href="/line/list.aspx?cid=418">郴州</a></span>                    <span><a cid="268" href="/line/list.aspx?cid=268">赤峰</a></span>                    <span><a cid="332" href="/line/list.aspx?cid=332">池州</a></span>                    <span><a cid="449" href="/line/list.aspx?cid=449">崇左</a></span>                    <span><a cid="338" href="/line/list.aspx?cid=338">滁州</a></span></span></div>                    <div><span>D</span>                    <span indexcode="D">                    <span><a cid="619" href="/line/list.aspx?cid=619">大理</a></span>                    <span><a cid="284" href="/line/list.aspx?cid=284">大连</a></span>                    <span><a cid="280" href="/line/list.aspx?cid=280">丹东</a></span>                    <span><a cid="301" href="/line/list.aspx?cid=301">大庆</a></span>                    <span><a cid="261" href="/line/list.aspx?cid=261">大同</a></span>                    <span><a cid="294" href="/line/list.aspx?cid=294">大兴安岭</a></span>                    <span><a cid="468" href="/line/list.aspx?cid=468">达州</a></span>                    <span><a cid="621" href="/line/list.aspx?cid=621">德宏</a></span>                    <span><a cid="478" href="/line/list.aspx?cid=478">德阳</a></span>                    <span><a cid="371" href="/line/list.aspx?cid=371">德州</a></span>                    <span><a cid="515" href="/line/list.aspx?cid=515">定西</a></span>                    <span><a cid="615" href="/line/list.aspx?cid=615">迪庆</a></span>                    <span><a cid="436" href="/line/list.aspx?cid=436">东莞</a></span>                    <span><a cid="380" href="/line/list.aspx?cid=380">东营</a></span></span></div>                    <div><span>E</span>                    <span indexcode="E">                    <span><a cid="266" href="/line/list.aspx?cid=266">鄂尔多斯</a></span>                    <span><a cid="816" href="/line/list.aspx?cid=816">恩施</a></span>                    <span><a cid="408" href="/line/list.aspx?cid=408">鄂州</a></span></span></div>                    <div><span>F</span>                    <span indexcode="F">                    <span><a cid="457" href="/line/list.aspx?cid=457">防城港</a></span>                    <span><a cid="429" href="/line/list.aspx?cid=429">佛山</a></span>                    <span><a cid="216" href="/line/list.aspx?cid=216">福建</a></span>                    <span><a cid="282" href="/line/list.aspx?cid=282">抚顺</a></span>                    <span><a cid="277" href="/line/list.aspx?cid=277">阜新</a></span>                    <span><a cid="337" href="/line/list.aspx?cid=337">阜阳</a></span>                    <span><a cid="356" href="/line/list.aspx?cid=356">福州</a></span>                    <span><a cid="358" href="/line/list.aspx?cid=358">抚州</a></span></span></div>                    <div><span>G</span>                    <span indexcode="G">                    <span><a cid="230" href="/line/list.aspx?cid=230">甘肃</a></span>                    <span><a cid="361" href="/line/list.aspx?cid=361">赣州</a></span>                    <span><a cid="564" href="/line/list.aspx?cid=564">高雄</a></span>                    <span><a cid="581" href="/line/list.aspx?cid=581">高雄</a></span>                    <span><a cid="469" href="/line/list.aspx?cid=469">广安</a></span>                    <span><a cid="222" href="/line/list.aspx?cid=222">广东</a></span>                    <span><a cid="223" href="/line/list.aspx?cid=223">广西</a></span>                    <span><a cid="476" href="/line/list.aspx?cid=476">广元</a></span>                    <span><a cid="435" href="/line/list.aspx?cid=435">广州</a></span>                    <span><a cid="455" href="/line/list.aspx?cid=455">贵港</a></span>                    <span><a cid="460" href="/line/list.aspx?cid=460">桂林</a></span>                    <span><a cid="488" href="/line/list.aspx?cid=488">贵阳</a></span>                    <span><a cid="226" href="/line/list.aspx?cid=226">贵州</a></span>                    <span><a cid="529" href="/line/list.aspx?cid=529">固原</a></span></span></div>                </div>                <div class="item">                    <div><span>H</span>                    <span indexcode="H">                    <span><a cid="306" href="/line/list.aspx?cid=306">哈尔滨</a></span>                    <span><a cid="526" href="/line/list.aspx?cid=526">海东</a></span>                    <span><a cid="463" href="/line/list.aspx?cid=463">海口</a></span>                    <span><a cid="224" href="/line/list.aspx?cid=224">海南</a></span>                    <span><a cid="825" href="/line/list.aspx?cid=825">海南省</a></span>                    <span><a cid="538" href="/line/list.aspx?cid=538">哈密地区</a></span>                    <span><a cid="244" href="/line/list.aspx?cid=244">邯郸</a></span>                    <span><a cid="330" href="/line/list.aspx?cid=330">杭州</a></span>                    <span><a cid="507" href="/line/list.aspx?cid=507">汉中</a></span>                    <span><a cid="207" href="/line/list.aspx?cid=207">河北</a></span>                    <span><a cid="397" href="/line/list.aspx?cid=397">鹤壁</a></span>                    <span><a cid="451" href="/line/list.aspx?cid=451">河池</a></span>                    <span><a cid="347" href="/line/list.aspx?cid=347">合肥</a></span>                    <span><a cid="304" href="/line/list.aspx?cid=304">鹤岗</a></span>                    <span><a cid="296" href="/line/list.aspx?cid=296">黑河</a></span>                    <span><a cid="212" href="/line/list.aspx?cid=212">黑龙江</a></span>                    <span><a cid="219" href="/line/list.aspx?cid=219">河南</a></span>                    <span><a cid="251" href="/line/list.aspx?cid=251">衡水</a></span>                    <span><a cid="424" href="/line/list.aspx?cid=424">衡阳</a></span>                    <span><a cid="537" href="/line/list.aspx?cid=537">和田地区</a></span>                    <span><a cid="444" href="/line/list.aspx?cid=444">河源</a></span>                    <span><a cid="368" href="/line/list.aspx?cid=368">菏泽</a></span>                    <span><a cid="452" href="/line/list.aspx?cid=452">贺州</a></span>                    <span><a cid="312" href="/line/list.aspx?cid=312">淮安</a></span>                    <span><a cid="342" href="/line/list.aspx?cid=342">淮北</a></span>                    <span><a cid="416" href="/line/list.aspx?cid=416">怀化</a></span>                    <span><a cid="344" href="/line/list.aspx?cid=344">淮南</a></span>                    <span><a cid="561" href="/line/list.aspx?cid=561">花莲</a></span>                    <span><a cid="405" href="/line/list.aspx?cid=405">黄冈</a></span>                    <span><a cid="339" href="/line/list.aspx?cid=339">黄山</a></span>                    <span><a cid="413" href="/line/list.aspx?cid=413">黄石</a></span>                    <span><a cid="220" href="/line/list.aspx?cid=220">湖北</a></span>                    <span><a cid="270" href="/line/list.aspx?cid=270">呼和浩特</a></span>                    <span><a cid="438" href="/line/list.aspx?cid=438">惠州</a></span>                    <span><a cid="272" href="/line/list.aspx?cid=272">葫芦岛</a></span>                    <span><a cid="265" href="/line/list.aspx?cid=265">呼伦贝尔</a></span>                    <span><a cid="221" href="/line/list.aspx?cid=221">湖南</a></span>                    <span><a cid="326" href="/line/list.aspx?cid=326">湖州</a></span></span></div>                    <div><span>I</span>                    <span indexcode="I"></span></div>                    <div><span>J</span>                    <span indexcode="J">                    <span><a cid="298" href="/line/list.aspx?cid=298">佳木斯</a></span>                    <span><a cid="360" href="/line/list.aspx?cid=360">吉安</a></span>                    <span><a cid="433" href="/line/list.aspx?cid=433">江门</a></span>                    <span><a cid="213" href="/line/list.aspx?cid=213">江苏</a></span>                    <span><a cid="217" href="/line/list.aspx?cid=217">江西</a></span>                    <span><a cid="395" href="/line/list.aspx?cid=395">焦作</a></span>                    <span><a cid="327" href="/line/list.aspx?cid=327">嘉兴</a></span>                    <span><a cid="567" href="/line/list.aspx?cid=567">嘉义</a></span>                    <span><a cid="576" href="/line/list.aspx?cid=576">嘉义</a></span>                    <span><a cid="521" href="/line/list.aspx?cid=521">嘉峪关</a></span>                    <span><a cid="211" href="/line/list.aspx?cid=211">吉林</a></span>                    <span><a cid="440" href="/line/list.aspx?cid=440">揭阳</a></span>                    <span><a cid="292" href="/line/list.aspx?cid=292">吉林</a></span>                    <span><a cid="580" href="/line/list.aspx?cid=580">基隆</a></span>                    <span><a cid="384" href="/line/list.aspx?cid=384">济南</a></span>                    <span><a cid="524" href="/line/list.aspx?cid=524">金昌</a></span>                    <span><a cid="258" href="/line/list.aspx?cid=258">晋城</a></span>                    <span><a cid="366" href="/line/list.aspx?cid=366">景德镇</a></span>                    <span><a cid="407" href="/line/list.aspx?cid=407">荆门</a></span>                    <span><a cid="411" href="/line/list.aspx?cid=411">荆州</a></span>                    <span><a cid="324" href="/line/list.aspx?cid=324">金华</a></span>                    <span><a cid="377" href="/line/list.aspx?cid=377">济宁</a></span>                    <span><a cid="256" href="/line/list.aspx?cid=256">晋中</a></span>                    <span><a cid="279" href="/line/list.aspx?cid=279">锦州</a></span>                    <span><a cid="364" href="/line/list.aspx?cid=364">九江</a></span>                    <span><a cid="517" href="/line/list.aspx?cid=517">酒泉</a></span>                    <span><a cid="302" href="/line/list.aspx?cid=302">鸡西</a></span>                    <span><a cid="385" href="/line/list.aspx?cid=385">济源</a></span></span></div>                    <div><span>K</span>                    <span indexcode="K">                    <span><a cid="401" href="/line/list.aspx?cid=401">开封</a></span>                    <span><a cid="535" href="/line/list.aspx?cid=535">喀什地区</a></span>                    <span><a cid="540" href="/line/list.aspx?cid=540">克拉玛依</a></span>                    <span><a cid="496" href="/line/list.aspx?cid=496">昆明</a></span></span></div>                    <div><span>L</span>                    <span indexcode="L">                    <span><a cid="450" href="/line/list.aspx?cid=450">来宾</a></span>                    <span><a cid="373" href="/line/list.aspx?cid=373">莱芜</a></span>                    <span><a cid="250" href="/line/list.aspx?cid=250">廊坊</a></span>                    <span><a cid="525" href="/line/list.aspx?cid=525">兰州</a></span>                    <span><a cid="503" href="/line/list.aspx?cid=503">拉萨</a></span>                    <span><a cid="473" href="/line/list.aspx?cid=473">乐山</a></span>                    <span><a cid="313" href="/line/list.aspx?cid=313">连云港</a></span>                    <span><a cid="370" href="/line/list.aspx?cid=370">聊城</a></span>                    <span><a cid="210" href="/line/list.aspx?cid=210">辽宁</a></span>                    <span><a cid="276" href="/line/list.aspx?cid=276">辽阳</a></span>                    <span><a cid="290" href="/line/list.aspx?cid=290">辽源</a></span>                    <span><a cid="491" href="/line/list.aspx?cid=491">丽江</a></span>                    <span><a cid="489" href="/line/list.aspx?cid=489">临沧</a></span>                    <span><a cid="253" href="/line/list.aspx?cid=253">临汾</a></span>                    <span><a cid="372" href="/line/list.aspx?cid=372">临沂</a></span>                    <span><a cid="497" href="/line/list.aspx?cid=497">林芝</a></span>                    <span><a cid="320" href="/line/list.aspx?cid=320">丽水</a></span>                    <span><a cid="334" href="/line/list.aspx?cid=334">六安</a></span>                    <span><a cid="487" href="/line/list.aspx?cid=487">六盘水</a></span>                    <span><a cid="461" href="/line/list.aspx?cid=461">柳州</a></span>                    <span><a cid="819" href="/line/list.aspx?cid=819">溧阳</a></span>                    <span><a cid="514" href="/line/list.aspx?cid=514">陇南</a></span>                    <span><a cid="349" href="/line/list.aspx?cid=349">龙岩</a></span>                    <span><a cid="415" href="/line/list.aspx?cid=415">娄底</a></span>                    <span><a cid="392" href="/line/list.aspx?cid=392">漯河</a></span>                    <span><a cid="400" href="/line/list.aspx?cid=400">洛阳</a></span>                    <span><a cid="479" href="/line/list.aspx?cid=479">泸州</a></span>                    <span><a cid="252" href="/line/list.aspx?cid=252">吕梁</a></span></span></div>                    <div><span>M</span>                    <span indexcode="M">                    <span><a cid="343" href="/line/list.aspx?cid=343">马鞍山</a></span>                    <span><a cid="445" href="/line/list.aspx?cid=445">茂名</a></span>                    <span><a cid="471" href="/line/list.aspx?cid=471">眉山</a></span>                    <span><a cid="442" href="/line/list.aspx?cid=442">梅州</a></span>                    <span><a cid="477" href="/line/list.aspx?cid=477">绵阳</a></span>                    <span><a cid="571" href="/line/list.aspx?cid=571">苗栗</a></span>                    <span><a cid="299" href="/line/list.aspx?cid=299">牡丹江</a></span></span></div>                    <div><span>N</span>                    <span indexcode="N">                    <span><a cid="367" href="/line/list.aspx?cid=367">南昌</a></span>                    <span><a cid="472" href="/line/list.aspx?cid=472">南充</a></span>                    <span><a cid="319" href="/line/list.aspx?cid=319">南京</a></span>                    <span><a cid="462" href="/line/list.aspx?cid=462">南宁</a></span>                    <span><a cid="350" href="/line/list.aspx?cid=350">南平</a></span>                    <span><a cid="314" href="/line/list.aspx?cid=314">南通</a></span>                    <span><a cid="568" href="/line/list.aspx?cid=568">南投</a></span>                    <span><a cid="390" href="/line/list.aspx?cid=390">南阳</a></span>                    <span><a cid="502" href="/line/list.aspx?cid=502">那曲</a></span>                    <span><a cid="474" href="/line/list.aspx?cid=474">内江</a></span>                    <span><a cid="209" href="/line/list.aspx?cid=209">内蒙古</a></span>                    <span><a cid="329" href="/line/list.aspx?cid=329">宁波</a></span>                    <span><a cid="348" href="/line/list.aspx?cid=348">宁德</a></span>                    <span><a cid="232" href="/line/list.aspx?cid=232">宁夏</a></span></span></div>                </div>                <div class="item">                    <div><span>O</span>                    <span indexcode="O"></span></div>                    <div><span>P</span>                    <span indexcode="P">                    <span><a cid="275" href="/line/list.aspx?cid=275">盘锦</a></span>                    <span><a cid="480" href="/line/list.aspx?cid=480">攀枝花</a></span>                    <span><a cid="560" href="/line/list.aspx?cid=560">澎湖</a></span>                    <span><a cid="399" href="/line/list.aspx?cid=399">平顶山</a></span>                    <span><a cid="563" href="/line/list.aspx?cid=563">屏东</a></span>                    <span><a cid="518" href="/line/list.aspx?cid=518">平凉</a></span>                    <span><a cid="365" href="/line/list.aspx?cid=365">萍乡</a></span>                    <span><a cid="490" href="/line/list.aspx?cid=490">普洱</a></span>                    <span><a cid="354" href="/line/list.aspx?cid=354">莆田</a></span>                    <span><a cid="394" href="/line/list.aspx?cid=394">濮阳</a></span></span></div>                    <div><span>Q</span>                    <span indexcode="Q">                    <span><a cid="383" href="/line/list.aspx?cid=383">青岛</a></span>                    <span><a cid="231" href="/line/list.aspx?cid=231">青海</a></span>                    <span><a cid="516" href="/line/list.aspx?cid=516">庆阳</a></span>                    <span><a cid="443" href="/line/list.aspx?cid=443">清远</a></span>                    <span><a cid="243" href="/line/list.aspx?cid=243">秦皇岛</a></span>                    <span><a cid="456" href="/line/list.aspx?cid=456">钦州</a></span>                    <span><a cid="305" href="/line/list.aspx?cid=305">齐齐哈尔</a></span>                    <span><a cid="297" href="/line/list.aspx?cid=297">七台河</a></span>                    <span><a cid="352" href="/line/list.aspx?cid=352">泉州</a></span>                    <span><a cid="495" href="/line/list.aspx?cid=495">曲靖</a></span>                    <span><a cid="323" href="/line/list.aspx?cid=323">衢州</a></span></span></div>                    <div><span>R</span>                    <span indexcode="R">                    <span><a cid="499" href="/line/list.aspx?cid=499">日喀则</a></span>                    <span><a cid="374" href="/line/list.aspx?cid=374">日照</a></span></span></div>                    <div><span>S</span>                    <span indexcode="S">                    <span><a cid="391" href="/line/list.aspx?cid=391">三门峡</a></span>                    <span><a cid="353" href="/line/list.aspx?cid=353">三明</a></span>                    <span><a cid="826" href="/line/list.aspx?cid=826">三沙市</a></span>                    <span><a cid="208" href="/line/list.aspx?cid=208">山西</a></span>                    <span><a cid="464" href="/line/list.aspx?cid=464">三亚</a></span>                    <span><a cid="827" href="/line/list.aspx?cid=827">三亚市</a></span>                    <span><a cid="355" href="/line/list.aspx?cid=355">厦门</a></span>                    <span><a cid="218" href="/line/list.aspx?cid=218">山东</a></span>                    <span><a cid="239" href="/line/list.aspx?cid=239">上海</a></span>                    <span><a cid="504" href="/line/list.aspx?cid=504">商洛</a></span>                    <span><a cid="389" href="/line/list.aspx?cid=389">商丘</a></span>                    <span><a cid="357" href="/line/list.aspx?cid=357">上饶</a></span>                    <span><a cid="500" href="/line/list.aspx?cid=500">山南</a></span>                    <span><a cid="431" href="/line/list.aspx?cid=431">汕头</a></span>                    <span><a cid="441" href="/line/list.aspx?cid=441">汕尾</a></span>                    <span><a cid="229" href="/line/list.aspx?cid=229">陕西</a></span>                    <span><a cid="432" href="/line/list.aspx?cid=432">韶关</a></span>                    <span><a cid="325" href="/line/list.aspx?cid=325">绍兴</a></span>                    <span><a cid="423" href="/line/list.aspx?cid=423">邵阳</a></span>                    <span><a cid="285" href="/line/list.aspx?cid=285">沈阳</a></span>                    <span><a cid="428" href="/line/list.aspx?cid=428">深圳</a></span>                    <span><a cid="241" href="/line/list.aspx?cid=241">石家庄</a></span>                    <span><a cid="412" href="/line/list.aspx?cid=412">十堰</a></span>                    <span><a cid="531" href="/line/list.aspx?cid=531">石嘴山</a></span>                    <span><a cid="303" href="/line/list.aspx?cid=303">双鸭山</a></span>                    <span><a cid="257" href="/line/list.aspx?cid=257">朔州</a></span>                    <span><a cid="225" href="/line/list.aspx?cid=225">四川</a></span>                    <span><a cid="291" href="/line/list.aspx?cid=291">四平</a></span>                    <span><a cid="287" href="/line/list.aspx?cid=287">松原</a></span>                    <span><a cid="295" href="/line/list.aspx?cid=295">绥化</a></span>                    <span><a cid="475" href="/line/list.aspx?cid=475">遂宁</a></span>                    <span><a cid="403" href="/line/list.aspx?cid=403">随州</a></span>                    <span><a cid="315" href="/line/list.aspx?cid=315">苏州</a></span></span></div>                    <div><span>T</span>                    <span indexcode="T">                    <span><a cid="534" href="/line/list.aspx?cid=534">塔城</a></span>                    <span><a cid="376" href="/line/list.aspx?cid=376">泰安</a></span>                    <span><a cid="575" href="/line/list.aspx?cid=575">台北</a></span>                    <span><a cid="582" href="/line/list.aspx?cid=582">台北</a></span>                    <span><a cid="562" href="/line/list.aspx?cid=562">台东</a></span>                    <span><a cid="565" href="/line/list.aspx?cid=565">台南</a></span>                    <span><a cid="578" href="/line/list.aspx?cid=578">台南</a></span>                    <span><a cid="234" href="/line/list.aspx?cid=234">台湾</a></span>                    <span><a cid="262" href="/line/list.aspx?cid=262">太原</a></span>                    <span><a cid="570" href="/line/list.aspx?cid=570">台中</a></span>                    <span><a cid="579" href="/line/list.aspx?cid=579">台中</a></span>                    <span><a cid="308" href="/line/list.aspx?cid=308">泰州</a></span>                    <span><a cid="321" href="/line/list.aspx?cid=321">台州</a></span>                    <span><a cid="242" href="/line/list.aspx?cid=242">唐山</a></span>                    <span><a cid="572" href="/line/list.aspx?cid=572">桃园</a></span>                    <span><a cid="204" href="/line/list.aspx?cid=204">特别行政区</a></span>                    <span><a cid="238" href="/line/list.aspx?cid=238">天津</a></span>                    <span><a cid="522" href="/line/list.aspx?cid=522">天水</a></span>                    <span><a cid="274" href="/line/list.aspx?cid=274">铁岭</a></span>                    <span><a cid="512" href="/line/list.aspx?cid=512">铜川</a></span>                    <span><a cid="289" href="/line/list.aspx?cid=289">通化</a></span>                    <span><a cid="267" href="/line/list.aspx?cid=267">通辽</a></span>                    <span><a cid="341" href="/line/list.aspx?cid=341">铜陵</a></span>                    <span><a cid="484" href="/line/list.aspx?cid=484">铜仁地区</a></span>                    <span><a cid="539" href="/line/list.aspx?cid=539">吐鲁番</a></span></span></div>                    <div><span>U</span>                    <span indexcode="U"></span></div>                </div>                <div class="item">                    <div><span>V</span>                    <span indexcode="V"></span></div>                    <div><span>W</span>                    <span indexcode="W">                    <span><a cid="378" href="/line/list.aspx?cid=378">潍坊</a></span>                    <span><a cid="375" href="/line/list.aspx?cid=375">威海</a></span>                    <span><a cid="509" href="/line/list.aspx?cid=509">渭南</a></span>                    <span><a cid="328" href="/line/list.aspx?cid=328">温州</a></span>                    <span><a cid="271" href="/line/list.aspx?cid=271">乌海</a></span>                    <span><a cid="414" href="/line/list.aspx?cid=414">武汉</a></span>                    <span><a cid="346" href="/line/list.aspx?cid=346">芜湖</a></span>                    <span><a cid="541" href="/line/list.aspx?cid=541">乌鲁木齐</a></span>                    <span><a cid="520" href="/line/list.aspx?cid=520">武威</a></span>                    <span><a cid="318" href="/line/list.aspx?cid=318">无锡</a></span>                    <span><a cid="530" href="/line/list.aspx?cid=530">吴忠</a></span>                    <span><a cid="459" href="/line/list.aspx?cid=459">梧州</a></span></span></div>                    <div><span>X</span>                    <span indexcode="X">                    <span><a cid="513" href="/line/list.aspx?cid=513">西安</a></span>                    <span><a cid="409" href="/line/list.aspx?cid=409">襄樊</a></span>                    <span><a cid="235" href="/line/list.aspx?cid=235">香港</a></span>                    <span><a cid="425" href="/line/list.aspx?cid=425">湘潭</a></span>                    <span><a cid="636" href="/line/list.aspx?cid=636">湘西</a></span>                    <span><a cid="404" href="/line/list.aspx?cid=404">咸宁</a></span>                    <span><a cid="510" href="/line/list.aspx?cid=510">咸阳</a></span>                    <span><a cid="406" href="/line/list.aspx?cid=406">孝感</a></span>                    <span><a cid="228" href="/line/list.aspx?cid=228">西藏</a></span>                    <span><a cid="264" href="/line/list.aspx?cid=264">兴安盟</a></span>                    <span><a cid="245" href="/line/list.aspx?cid=245">邢台</a></span>                    <span><a cid="527" href="/line/list.aspx?cid=527">西宁</a></span>                    <span><a cid="233" href="/line/list.aspx?cid=233">新疆</a></span>                    <span><a cid="396" href="/line/list.aspx?cid=396">新乡</a></span>                    <span><a cid="388" href="/line/list.aspx?cid=388">信阳</a></span>                    <span><a cid="363" href="/line/list.aspx?cid=363">新余</a></span>                    <span><a cid="254" href="/line/list.aspx?cid=254">忻州</a></span>                    <span><a cid="573" href="/line/list.aspx?cid=573">新竹</a></span>                    <span><a cid="577" href="/line/list.aspx?cid=577">新竹</a></span>                    <span><a cid="617" href="/line/list.aspx?cid=617">西双版纳</a></span>                    <span><a cid="307" href="/line/list.aspx?cid=307">宿迁</a></span>                    <span><a cid="336" href="/line/list.aspx?cid=336">宿州</a></span>                    <span><a cid="331" href="/line/list.aspx?cid=331">宣城</a></span>                    <span><a cid="393" href="/line/list.aspx?cid=393">许昌</a></span>                    <span><a cid="317" href="/line/list.aspx?cid=317">徐州</a></span></span></div>                    <div><span>Y</span>                    <span indexcode="Y">                    <span><a cid="467" href="/line/list.aspx?cid=467">雅安</a></span>                    <span><a cid="508" href="/line/list.aspx?cid=508">延安</a></span>                    <span><a cid="311" href="/line/list.aspx?cid=311">盐城</a></span>                    <span><a cid="448" href="/line/list.aspx?cid=448">阳江</a></span>                    <span><a cid="260" href="/line/list.aspx?cid=260">阳泉</a></span>                    <span><a cid="310" href="/line/list.aspx?cid=310">扬州</a></span>                    <span><a cid="379" href="/line/list.aspx?cid=379">烟台</a></span>                    <span><a cid="470" href="/line/list.aspx?cid=470">宜宾</a></span>                    <span><a cid="410" href="/line/list.aspx?cid=410">宜昌</a></span>                    <span><a cid="300" href="/line/list.aspx?cid=300">伊春</a></span>                    <span><a cid="359" href="/line/list.aspx?cid=359">宜春</a></span>                    <span><a cid="574" href="/line/list.aspx?cid=574">宜兰</a></span>                    <span><a cid="532" href="/line/list.aspx?cid=532">银川</a></span>                    <span><a cid="278" href="/line/list.aspx?cid=278">营口</a></span>                    <span><a cid="362" href="/line/list.aspx?cid=362">鹰潭</a></span>                    <span><a cid="419" href="/line/list.aspx?cid=419">益阳</a></span>                    <span><a cid="417" href="/line/list.aspx?cid=417">永州</a></span>                    <span><a cid="422" href="/line/list.aspx?cid=422">岳阳</a></span>                    <span><a cid="454" href="/line/list.aspx?cid=454">玉林</a></span>                    <span><a cid="506" href="/line/list.aspx?cid=506">榆林</a></span>                    <span><a cid="255" href="/line/list.aspx?cid=255">运城</a></span>                    <span><a cid="446" href="/line/list.aspx?cid=446">云浮</a></span>                    <span><a cid="566" href="/line/list.aspx?cid=566">云林</a></span>                    <span><a cid="227" href="/line/list.aspx?cid=227">云南</a></span>                    <span><a cid="494" href="/line/list.aspx?cid=494">玉溪</a></span></span></div>                    <div><span>Z</span>                    <span indexcode="Z">                    <span><a cid="381" href="/line/list.aspx?cid=381">枣庄</a></span>                    <span><a cid="569" href="/line/list.aspx?cid=569">彰化</a></span>                    <span><a cid="420" href="/line/list.aspx?cid=420">张家界</a></span>                    <span><a cid="247" href="/line/list.aspx?cid=247">张家口</a></span>                    <span><a cid="519" href="/line/list.aspx?cid=519">张掖</a></span>                    <span><a cid="351" href="/line/list.aspx?cid=351">漳州</a></span>                    <span><a cid="434" href="/line/list.aspx?cid=434">湛江</a></span>                    <span><a cid="447" href="/line/list.aspx?cid=447">肇庆</a></span>                    <span><a cid="492" href="/line/list.aspx?cid=492">昭通</a></span>                    <span><a cid="214" href="/line/list.aspx?cid=214">浙江</a></span>                    <span><a cid="402" href="/line/list.aspx?cid=402">郑州</a></span>                    <span><a cid="309" href="/line/list.aspx?cid=309">镇江</a></span>                    <span><a cid="203" href="/line/list.aspx?cid=203">直辖市</a></span>                    <span><a cid="240" href="/line/list.aspx?cid=240">重庆</a></span>                    <span><a cid="437" href="/line/list.aspx?cid=437">中山</a></span>                    <span><a cid="528" href="/line/list.aspx?cid=528">中卫</a></span>                    <span><a cid="387" href="/line/list.aspx?cid=387">周口</a></span>                    <span><a cid="322" href="/line/list.aspx?cid=322">舟山</a></span>                    <span><a cid="430" href="/line/list.aspx?cid=430">珠海</a></span>                    <span><a cid="386" href="/line/list.aspx?cid=386">驻马店</a></span>                    <span><a cid="426" href="/line/list.aspx?cid=426">株洲</a></span>                    <span><a cid="382" href="/line/list.aspx?cid=382">淄博</a></span>                    <span><a cid="481" href="/line/list.aspx?cid=481">自贡</a></span>                    <span><a cid="465" href="/line/list.aspx?cid=465">资阳</a></span>                    <span><a cid="486" href="/line/list.aspx?cid=486">遵义</a></span></span></div>                </div>        </div>    </div></div></div></div>
					</div>
			<div class="searchBox">
				<div class="inner clearfix">
					<div class="searchContent">
						<div class="searchInput">
							<div class="wrap">
								<div class="inputBox">
									<div class="wrapBox">
										<input type="text" class="inputText"
											placeholder="请输入目的地名称或线路关键词" name="key" id="key">
									</div>
								</div>
							</div>
						</div>
						<div class="searchBtn">
							<input type="submit" value="搜 索" class="inputBtn"
								onclick="Search(this,'cid,key')"
								url="http://www.b2b2c.tourex.net.cn/line/list.html?cid=237">
						</div>
					</div>
					<div class="hotKey">
						<dl class="clearfix">
							<dt>热门：</dt>
							<dd>
								<a href="http://www.b2b2c.tourex.net.cn/line/list.html?cid=237"
									title="北京">北京</a>
							</dd>
							<dd>
								<a href="http://www.b2b2c.tourex.net.cn/line/list.html?cid=238"
									title="天津">天津</a>
							</dd>
							<dd>
								<a href="http://www.b2b2c.tourex.net.cn/line/list.html?cid=239"
									title="上海">上海</a>
							</dd>
							<dd>
								<a href="http://www.b2b2c.tourex.net.cn/line/list.html?cid=428"
									title="深圳">深圳</a>
							</dd>
							<dd>
								<a href="http://www.b2b2c.tourex.net.cn/line/list.html?cid=435"
									title="广州">广州</a>
							</dd>
						</dl>
					</div>
				</div>
			</div>
		</div>
	</div> -->

	<%-- <div class="container">
		<div class="row">

			<div class="col-xs-8" style="float: left">
				<div class="panel" id="main" style="width: 770px;">
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
												<a href="/travelForum/topic/${topic.id}"
													title="${topic.title}">${topic.title}</a>
											</h3>
											<div class="desc" style="margin-top: 10px;">${topic.content}</div>
											<div class="extra">
												<ul class="clearfix"
													style="list-style: none; margin-top: 10px;">
													<li class="author" style="float: left"><span
														class="badge"> ${topic.tab.tabName}&nbsp; </span></li>
													<li class="author" style="float: left">
														<img
													href="/travelForum/user/member/${topic.user.username}"
													width="16" height="16"> <i class="fa fa-user-o"
														aria-hidden="true"></i>&nbsp; ${topic.user.username}&nbsp;
														&nbsp;
													</li>
													<li class="author" style="float: left"><i
														class="fa fa-map-marker"></i>&nbsp;${topic.province},${topic.city}&nbsp;
														</span></li>
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

					</ul>

				</div>

			</div>
			<div class="col-xs-3" style="float: left">

				<div id="portal_block_7064" class="block move-span">
					<div id="portal_block_7064_content" class="content">
						<div class="portal_block_summary">
							<div class="rlinkbox clear_b">
								<ul>
									<li><a href="/list/242">徒步</a></li>
									<li><a href="/list/950">露营</a></li>
									<li><a href="/list/931">安全急救</a></li>
									<li><a href="/list/920">领队</a></li>
									<li><a href="/list/915">登雪山</a></li>
									<li><a href="/list/916">攀岩</a></li>
									<li><a href="/list/917">骑行</a></li>
									<li><a href="/list/918">跑步</a></li>
									<li><a href="/list/919">滑雪</a></li>
									<li><a href="/list/921">水上运动</a></li>
									<li><a href="/list/951">钓鱼</a></li>
									<li><a href="/list/952">潜水</a></li>
									<li><a href="/list/953">攀冰</a></li>
									<li><a href="/list/966">冲浪</a></li>
									<li><a href="/list/967">网球</a></li>
									<li><a href="/list/968">绳索知识</a></li>
									<li><a href="/list/969">高尔夫</a></li>
									<li><a href="/list/970">马术</a></li>
									<li><a href="/list/973">户外摄影</a></li>
									<li><a href="/list/971">羽毛球</a></li>
									<li><a href="/list/974">游泳</a></li>
									<li><a href="/list/975">溯溪</a></li>
									<li><a href="/list/976">健身</a></li>
									<li><a href="/list/977">瑜伽</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>

			</div> 
			</div>
	</div>
	--%>

	<div class="container" style="background-color: white; width: 100%;">
		<div class="row">
			<div class="layout w980">
				<div class="strgy-list-wrap" style="margin-bottom: 100px;">

					<c:forEach items="${topics}" var="topic">
						<c:if test="${topics}= null | ${topics} = ''">
							<div class="strgy-item">
								<div class="module-face">未查询到相关游记</div>
							</div>
						</c:if>
						<!--一个游记-->
						<div class="strgy-item">
							<div class="module-face">
								<a href="/travelForum/topic/tab/${topic.tabId}"><img
									src="/travelForum/skins/skin/${topic.user.avatar}"></a>
							</div>
							<div class="module-title">
								<h3>
									<a href="/travelForum/topic/${topic.id}"> ${topic.title}</a>
								</h3>
							</div>
							<div class="module-line">
								<a href="/travelForum/user/member/${topic.user.username}"
									class="user-name">${topic.user.username}</a> <span
									class="rg-tags"><a
									href="/travelForum/topic/tab/${topic.tabId}">${topic.tab.tabName}</a></span>
								&nbsp;&nbsp;&nbsp;<i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;&nbsp;<span
									class="dt-date">${topic.localCreateTime}</span>

								&nbsp;&nbsp;&nbsp;<i class="fa fa-eye" aria-hidden="true"></i><span
									class="dt-date">&nbsp;&nbsp;${topic.click}</span>
								&nbsp;&nbsp;&nbsp;<i class="fa fa-comment-o" aria-hidden="true"></i><span
									class="dt-date">&nbsp;&nbsp;${topic.countReplies}</span>

							</div>
							<div class="module-body">
								<p>${topic.content}</p>
							</div>
							<div class="module-pic">
								<a href="/travelForum/topic/${topic.id}" class="pic-item"> 
									<c:forEach items="${srcList}" var="srcList">
										<img src="${srcList}">
									</c:forEach>
								</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<%-- <div class="col-md-5">当前第 ${pageInfo.pageNum} 页.总共
				${pageInfo.pages} 页.一共 ${pageInfo.total} 条记录</div>

			<div class="col-md-3">
				<nav aria-label="Page navigation">
					<ul class="pagination">

						<li><a
							href="${pageContext.request.contextPath}/topic/Index?pn=1">首页</a></li>

						<!--上一页-->
						<li><c:if test="${pageInfo.hasPreviousPage}">
								<a
									href="${pageContext.request.contextPath}/topic/Index?pn=${pageInfo.pageNum-1}"
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
									href="${pageContext.request.contextPath}/topic/Index?pn=${page_num}">${page_num}</a></li>
							</c:if>
						</c:forEach>

						<!--下一页-->
						<li><c:if test="${pageInfo.hasNextPage}">
								<a
									href="${pageContext.request.contextPath}/topic/Index?pn=${pageInfo.pageNum+1}"
									aria-label="Next"> <span aria-hidden="true">»</span>
								</a>
							</c:if></li>

						<li><a
							href="${pageContext.request.contextPath}/topic/Index?pn=${pageInfo.pages}">尾页</a></li>
					</ul>
				</nav>

			</div> --%>

			<div id="J-MuiCatebar" class="mui-mbar-outer" style="right: -452px;">
				<div class="close-menu">
					<a href="javascript:void(0);" class="close-button">展开</a>
				</div>
				<div class="mui-mbar-standard">
					<div class="mui-mbar-tab mui-mbar-tab-hot">
						<div class="mui-mbar-tab-title">
							热门旅行地<a href="http://www.8264.com/youji/" title="查看全部热门旅行地"
								class="all-link">全部</a>
						</div>
						<ul class="card-label-list">
							<li>
								<h3 class="art-tit">
									<a
										href="http://www.8264.com/youji/list-370976926840480-2-1.html">四川</a>
								</h3>
								<p class="art-count">1757篇</p> <span class="pipe-line"></span>
								<div class="usr-list">
									<a href="#"><img
										src="#"></a>
									<a href="#"><img
										src="#"></a>
									<a href="#"><img
										src="#"></a>
								</div>
							</li>
							<li>
								<h3 class="art-tit">
									<a
										href="http://www.8264.com/youji/list-371031142404000-2-1.html">西藏</a>
								</h3>
								<p class="art-count">1633篇</p> <span class="pipe-line"></span>
								<div class="usr-list">
									<a href="#"><img
										src="#"></a>
									<a href="#"><img
										src="#"></a>
									<a href="#"><img
										src="#"></a>
								</div>
							</li>
							<li>
								<h3 class="art-tit">
									<a
										href="http://www.8264.com/youji/list-370866516119456-2-1.html">云南</a>
								</h3>
								<p class="art-count">932篇</p> <span class="pipe-line"></span>
								<div class="usr-list">
									<a href="#"><img
										src="#"></a>
									<a href="#"><img
										src="#"></a>
									<a href="#"><img
										src="#"></a>
								</div>
							</li>
						</ul>
					</div>
					<div class="mui-mbar-tab mui-mbar-tab-domestic">
						<div class="mui-mbar-tab-title">游记类型</div>
						<div class="label-list">
							<a href="/travelForum/topic/Index" class="active" id="all">全部</a>
							<c:forEach items="${tab}" var="tab">
								<a href="/travelForum/topic/tab/${tab.id}" data="${tab.tabName}">${tab.tabName}</a>
							</c:forEach>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="display: none" id="tabName">${oneTab.tabName}</div>

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
	<%-- var contextPath = '<%=request.getContextPath()%>'; --%>

		$(function() {
			initPageDom();
			initPageEvent();
		});

		function initPageDom() {
			var tabName = $("#tabName").text();
			if (tabName != "" && tabName != null) {
				$(".assortmentcon a").removeClass("active");
				$("#all").removeClass("active");
				$("a[data=" + tabName + "]").addClass("active");
			}

		}

		function initPageEvent() {

		}
	</script>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="/travelForum/skin/js/bootstrap.js"></script>

	<script type="text/javascript">
		jQuery(document).ready(
				function($) {
					$("#J-MuiCatebar").mouseover(
							function() {
								$(this).find(".close-button").html("收起").end()
										.css("right", "0");
							}).mouseleave(
							function() {
								$(this).find(".close-button").html("展开").end()
										.css("right", "-452px");
							});
				});
		jQuery(function() {
			var ua = navigator.userAgent.toLowerCase();
			var isIE6 = ua.indexOf('msie 6.0') > -1;
			if (!isIE6) {
				var wh = jQuery(window).height();
				var ch = jQuery('.strgy-list-wrap').height();
				var calch = wh - 195 - ch;
				if (ch < (wh - 195)) {
					jQuery('.strgy-list-wrap').css("margin-bottom", calch);
				}
			}
		});
	</script>

</body>
</html>