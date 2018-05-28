<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=zUlLhGzAcGweltU4iTxgVKtQYmf2tpCp"></script>
<script src="/travelForum/skins/js/jquery.min.js"></script>
<script src="/travelForum/skins/js/layer.js"></script>
<script src="/travelForum/skins/js/jquery-3.2.1.js"></script>
<script src="/travelForum/skins/js/bootstrap.min.js"></script>

<link href="/travelForum/skins/skin/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/travelForum/skins/skin/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/travelForum/skins/skin/css/layer.css" />

<title>足迹</title>

<style type="text/css">
body, html, #allmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0;
	font-family: "微软雅黑";
}
</style>

</head>

<body>

	<!-- 引入header文件 -->
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="container">
		<!-- 这是使用了bootstrap -->
		<div id="allmap"></div>
		<form class="form-horizontal" role="form" action="bpm/bmfw/addMaker"
			id="mapMsgForm" method="post">
			<div class="form-group">
				<div class="col-sm-10">
					<input type="hidden" name="labelName" value="${labelName}">
					<!-- 名称 -->
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<input type="hidden" name="date" value="${date}">
					<!-- 时间-->
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<input type="hidden" name="place" value="${place}">
					<!-- 地点 -->
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<input type="hidden" name="desc" value="${desc}">
					<!-- 描述-->
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<input type="hidden" name="pointX" value="">
					<!-- 标记坐标 -->
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<input type="hidden" name="pointY" value="">
					<!-- 标记坐标 -->
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default"></button>
				</div>
			</div>
		</form>
	</div>
</body>

<script type="text/javascript">
var contextPath = '<%=request.getContextPath()%>';

	var marker;
	var time = 0;
	var labelName = $("input[name='labelName']").val();
	var date = $("input[name='date']").val();
	var place = $("input[name='place']").val();
	var desc = $("input[name='desc']").val();
	var pointX;
	var pointY;

	// 百度地图API功能
	var map = new BMap.Map("allmap"); // 创建Map实例
	map.centerAndZoom(new BMap.Point(116.404, 39.915), 14); // 初始化地图,设置中心点坐标和地图级别
	map.setCurrentCity("北京"); // 设置地图显示的城市 此项是必须设置的
	map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放 
	map.enableInertialDragging();

	// 自动定位
	var geolocation = new window.BMap.Geolocation();
	geolocation.getCurrentPosition(function(r) {
		if (this.getStatus() == BMAP_STATUS_SUCCESS) {
			var mk = new BMap.Marker(r.point);
			map.addOverlay(mk);
			map.panTo(r.point);
			alert('您的位置：' + r.point.lng + ',' + r.point.lat);
		} else {
			alert('failed' + this.getStatus());
		}
	});

	var size = new window.BMap.Size(70, 20);
	var setSize = new window.BMap.Size(20, 60);

	// 城市切换控件
	map.addControl(new window.BMap.CityListControl({
		anchor : BMAP_ANCHOR_TOP_LEFT,
		offset : size,
	}));

	// 缩放控件
	map.addControl(new window.BMap.NavigationControl({
		anchor : BMAP_ANCHOR_TOP_LEFT,
		type : BMAP_NAVIGATION_CONTROL_LARGE,
		offset : setSize,
	}));

	// 向地图中添加缩略图控件    
	map.addControl(new window.BMap.OverviewMapControl({
		anchor : BMAP_ANCHOR_BOTTOM_RIGHT,
		isOpen : 1
	}));

	// 向地图中添加比例尺控件 
	map.addControl(new window.BMap.ScaleControl({
		anchor : BMAP_ANCHOR_BOTTOM_LEFT,
		offset : setSize,
	}));

	/* var opts = {    
		    width : 250,     // 信息窗口宽度    
		    height: 100,     // 信息窗口高度    
		    title : "Hello"  // 信息窗口标题   
		}    
		var infoWindow = new BMap.InfoWindow("World", opts);  // 创建信息窗口对象    
		map.openInfoWindow(infoWindow, map.getCenter());      // 打开信息窗口 */

	//点击地图并在此添加标记
	map.addEventListener("click", function(e) {
		// popLayer(e);
		if (time >= 1) {
			return;
		} else {
			popLayer(e);
		}

	});

	var removeMarker = function(e, ee, marker) {//删除标记

		$.ajax({
			type : 'POST',
			async : true,
			url : contextPath +'/label/delete',
			data : {
				"id" : id
			},
			success : function(result) {
				console.log("删除成功");
				//成功的话向地图上创建标记和标注
				map.removeOverlay(marker);
				time = time - 1;
			},
			error : function() {
				console.log("删除标注失败！");
			}
		});
	}
	var commitMapMsg = function(e, ee, marker) {//提交地图信息

		$("#mapMsgForm").submit();

	}

	function popLayer(e) {

		//将经纬度存入form中  
		$("input[name='pointX']").val(e.point.lng);
		$("input[name='pointY']").val(e.point.lat);

		//取出经纬度
		pointX = $("input[name='pointX']").val();
		pointY = $("input[name='pointY']").val();

		layer.open({
					title : '确认在此地标注？',
					content : '<div style="align:center:"><div class="input-group">名称<input class="form-control" type="text" name="labelName"></div>'
							+ '<div class="input-group" style="clear:left">时间:<input class="form-control" type="date" name="date"></div>'
							+ '<div class="input-group" style="clear:left">地点:<input class="form-control" type="text" name="place"></div>'
							+ '<div class="input-group" style="clear:left">描述:<textarea class="form-control" rows="3" name="desc"></textarea></div></div>',
					area : ['150px', '200px'],
					btn : [ '确定', '取消' ],
					/* content : '<p>许可证号：111</p><p>申请人/单位：213</p><p>许可事项：33</p>', */
					/* content : '<p>许可证号：' + bjh + '</p><p>申请人/单位：' + sqr
					        + '</p><p>许可事项：' + sx + '</p>', */
					yes : function(index, layero) {
						createMaker(e);

						//点击确认,即提交信息
						 $.ajax({
						    type : 'POST',
						    async : true,
						    url : contextPath +'/label/add',
						    data : {
						            "labelName":labelName,
						            "date":date,
						            "place":place,
						            "desc":desc,
						            "pointX":pointX,
						            "pointY":pointY
						    },success : function(result){
						        console.log("成功");
						        //成功的话向地图上创建标记和标注
						        createMaker(e);
						    },error : function(){
						        console.log("创建标注失败！");
						    }
						}); 
						layer.close(index);
					}
				});
	}

	function createMaker(e) {
		marker = new BMap.Marker(e.point);
		map.addOverlay(marker);
		map.panTo(e.point);
		//marker.setAnimation(BMAP_ANIMATION_BOUNCE);//跳动的标记 
		//创建右键菜单
		var markerMenu = new BMap.ContextMenu();
		markerMenu.addItem(new BMap.MenuItem('删除', removeMarker.bind(marker)));
		marker.addContextMenu(markerMenu);
		/* markerMenu.addItem(new BMap.MenuItem('提交', commitMapMsg
		        .bind(marker)));

		marker.addContextMenu(markerMenu); */

		//标注
		/* var text = "<p>许可证号：" + bjh + "</p><p>申请人/单位：" + sqr
		        + "</p><p>许可事项：" + sx + "</p>"; */

		var text = "<p>名称："+ labelName +"</p><p>时间："+ date +"</p><p>地点："+ place +"</p><p>描述："+ desc +"</p>";

		var label = new BMap.Label(text, {
			offset : new BMap.Size(-40, -120)
		});
		
		//设置label(标注的样式)
		label.setStyle({
			color : "black",
			fontSize : "12px",
			height : "110px",
			//lineHeight : "20px",
			fontFamily : "微软雅黑",
			maxWidth : "none",
			border : "none"
		});
		marker.setLabel(label);

		time = time + 1;
	}
</script>
</html>