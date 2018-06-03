<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link href="/project/skins/skin/css/bootstrap.min.css" rel="stylesheet">
<script src="/project/skins/js/jquery-3.2.1.js"></script>
<script src="/project/skins/js/bootstrap.min.js"></script>
<title>提问</title>
</head>
<style type="text/css">
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
	margin: -10px -30px;
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
</style>
<body>
	<!-- 引入header文件 -->
	<jsp:include page="header.jsp"></jsp:include>

	<div class="header">
		<div class="layout">
			<div class="icoHill">&nbsp;</div>
			<div class="headerL">
				<div class="site">
					当前位置： <a href="/travelForum/">首页</a> &gt; <a
						href="/travelForum/question/questions/Index">问答</a> &gt;<span>发表问答</span>
				</div>
			</div>
		</div>
	</div>

	<div style="width: 80%; margin: 30px 150px;">
		<div class="panel panel-default" id="main" style="">

			<div class="panel-heading" style="background-color: white">
				<span style="font-size: 16px;">发表问答</span>
			</div>

			<div class="panel-body">
				<form action="/travelForum/question/questions/add" method="post"
					id="replyForm">
					<div class="form-group">
						<label for="title">主题标题</label> <input type="text"
							class="form-control" id="title" name="title"
							placeholder="请输入主题标题，如果标题能够表达完整内容，则正文可以为空" required="required">
					</div>
					<div class="form-group">
						<label for="content">正文</label>
						<textarea class="form-control" rows="10" id="content"
							name="content"></textarea>
					</div>

					<div class="form-group col-sm-2" style="margin-top: 10px;">
						<label for="tab">类型</label><br /> <select class="form-control"
							id="tabId" name="tabId">
							<c:forEach items="${tabs}" var="tab">
								<option value="${tab.id}">${tab.tabName}</option>
							</c:forEach>
						</select>
					</div>
					<br /> 
					<div style="margin-top: 35px;">
						<input type="submit" class="btn btn-success"
							style="float: right; margin-right: 20px;" value="发表">
					</div>

				</form>
			</div>

		</div>



	</div>


	<!-- 引入footer文件 -->

	<script>
		function submitValidate(flag) {
			return flag;
		}
		$("#replyForm").submit(function() {
			if ($("#title").val() == '') {
				alert("请填写标题！");
				return submitValidate(false);
			} else {
				var ifSubmit = confirm("确定发表该主题吗?");
				if (ifSubmit == true) {

				} else {
					return submitValidate(false);
				}
			}
		})
	</script>
</body>
</html>