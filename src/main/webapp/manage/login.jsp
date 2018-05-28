<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>后台管理系统登录界面</title>
<link href="public/css/base.css" rel="stylesheet" type="text/css">
<link href="public/css/login.css" rel="stylesheet" type="text/css">
<!-- jQuery文件,务必在bootstrap.min.js 之前引入 -->
<script src="/travelForum/skin/js/jquery-2.2.3.min.js"></script>
<script src="/travelForum/skin/js/jquery.min.js"></script>
<script src="/travelForum/skin/js/bootstrap.min.js"></script>
</head>
<body>

<div class="login">
<form id="form">
	<div class="logo"></div>
    <div class="login_form">
    	<div class="user">
        	<input placeholder="请输入用户名" class="text_value" value="" name="username" type="text" id="username" required="required" error>
            <input placeholder="请输入密码" class="text_value" value="" name="password" type="password" id="password" required="required">
        </div>
        <button class="button" id="submit" type="button">登录</button>
    </div>
    
    <div id="tip"></div>
    <div class="foot">
	Copyright &copy; 2018.Company name All rights reserved.<a target="_blank" ></a>
    </div>
    </form>
</div>
<!-- <script>var basedir='public/ui/';</script>
<script src="public/ui/do.js"></script>
<script src="public/ui/config.js"></script> -->
<script type="text/javascript">
/* Do.ready('form', function() {
	$("#form").Validform({
			ajaxPost:true,
			postonce:true,
			tiptype:function(msg,o,cssctl){
				if(!o.obj.is("form")){
					var objtip=o.obj.siblings(".Validform_checktip");
					cssctl(objtip,o.type);
					objtip.text(msg);
				}else{
					var objtip=o.obj.find("#tip");
					cssctl(objtip,o.type);
					if(o.type==2){
						window.location.href='index.php?r=admin/index/index';
					}else{
						objtip.text(msg);
					}
				}
			}
	});
}); */
var contextPath = '<%=request.getContextPath()%>';
$("#submit").on("click", function() {
	var username=$("#username").val();
	var password=$("#password").val();
	if (username == '' && password == '') {
		$("input[type=text]").attr("message","账号和密码不能为空!");
	} else if (username == '') {
		$("input[type=text]").attr("message","用户名不能为空!");
	} else if (password == '') {
		$("input[type=password]").attr("message","密码不能为空!");
	} else {
		$.ajax({
			type : "POST",
			url : contextPath + "/user/userLoginCheck",
			data : {
				username : username,
				password : password
			},
			dataType : "json",
			success : function(data) {
				/* alert(data); */
				if (data.stateCode == "0") {
					$("input[type=text]").attr("message","提示:用户名不存在!");
				} else if (data.stateCode == "1") {
					$("input[type=password]").attr("message","提示:密码错误!");
				} else {
					window.location.href = contextPath + "/manage/index.jsp";
				}
			}
		});
	}
})
</script>
</body>
</html>