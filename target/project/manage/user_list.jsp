<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>后台管理系统</title>
<script src="/travelForum/skin/js/jquery-2.2.3.min.js"></script>
<script src="/travelForum/skin/js/bootstrap.js"></script>
<!--   <script src="//code.jquery.com/jquery-1.9.1.js"></script>
  <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script> -->
  
  
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
 --><link href="/travelForum/skin/css/bootstrap.css" type="text/css"
	rel="stylesheet" media="all">
<link href="/travelForum/skin/css/font-awesome.css" rel="stylesheet">
<link href="/travelForum/manage/public/css/home.css" rel="stylesheet">


<style>
body {
	overflow-x: hidden;
	background: #f2f0f5;
	padding: 15px 0px 10px 5px;
}
</style>
</head>
<body>
	<div class="col-sm-10" style="display: inline; margin: 10px 20px;">
		<form method="post" action="/travelForum/user/userList"
			id="searchForm">

			<div class="form-group col-sm-8">
				<div style="float: left">
					<span>用户名</span>
				</div>
				<div class="form-group col-sm-5" style="float: left">
					<input type="text" name="searchInput" class="form-control col-sm-5" placeholder="请输入用户名称">
				</div>
				<button id="searchBtn" type="button" class="btn btn-primary"
					style="float: left;">查询</button>
			</div>

		</form>
		<div style="text-align: right;">
			<button class="btn btn-success addUser">新增管理员</button>
		</div>
	</div>

	<table class="table table-bordered table-striped table-hover"
		style="margin-left: 50px; width: 90%; border: 0; text-align: center"
		id="main-tab">
		<thead style=" border-top:2px solid #e2e1e1;">
			<tr>
				<th style="text-align: center">序号</th>
				<th style="text-align: center">用户名</th>
				<th style="text-align: center">用户类型</th>
				<th style="text-align: center">锁定</th>
				<th style="text-align: center">最后登录时间</th>
				<th style="text-align: center">操作</th>
			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>

 <div style="display:none" id="userTpye">${sessionScope.userType}</div>
</body>
<script type="text/javascript">

	var contextPath = '<%=request.getContextPath()%>';
	var searchParam = $("input[name=searchInput]").val();
	var userType = $("#userTpye").text();

	$(function() {
		initPageDom();
		initPageEvent();
	});

	function initPageDom() {
		init_searchUserList();
	}

	function initPageEvent() {
		// 查询用户列表
		$(document).on("click", "#searchBtn", searchUserList);
		// 新增用户
		$(document).on("click", ".addUser", addUser);
		// 设置管理员
		$(document).on("click", "#userRole", settingUserRole);
		// 锁定用户
		$(document).on("click", ".lock", lockUser);
		// 查看用户
		$(document).on("click", "#view", viewUser);
		// 删除用户
		$(document).on("click", "#delete", deleteUser);
		

	}

	function init_searchUserList() {
		searchUser();
	}
	
	function searchUser() {
		if(userType == 1) {
			searchUserList();
		}else if(userType == 2){
			searchAllUserList();
		}
	}
	
	//  管理员查询用户
	function searchUserList() {
		$.ajax({
			type : "GET",
			url : contextPath + "/user/userList",
			data : {
				"searchParam" : searchParam
			},
			dataType : "json",
			success : function(datas) {
				
				 $('.table tbody').empty("");  // 清空数据
				 
				if(datas.data == null | datas.data == "") {
					$('.table tbody').append("暂无相关数据");  
				}else{
					
					$.each(datas.data, function(i,result){
						
						var item;
						var loginTime = result.log.loginTime;
						
						if(loginTime == null | loginTime == "") {
							loginTime = " ";
						}else {
							loginTime = loginTime;
						}
						
						var type = result.type;
						if(type == '0') {
							type="普通用户";
						}else if(type == '1') {
							type="管理员";
						}else{
							type="超级管理员";
						}
						
						var isLocked = result.isLocked;
						var lockBtn;
						if(isLocked == '0') {
							isLocked="未锁定";
							lockBtn="锁定";
						} else{
							isLocked="锁定";
							lockBtn="解锁";
						}
						
						item = "<tr><td>"+ (i+1) +"</td><td>" + result.username + "</td><td>"+ type +"</td><td data='" +result.id + "' id='lockStatus'>"+ isLocked +"</td><td>" + loginTime + "</td><td><a userId='" +result.id + "' class='lock' href='javascript:;'> "+ lockBtn +"</a><span class='gray'>&nbsp;|&nbsp;</span><a data='" +result.id + "' id='view' href='javascript:;'>查看</a><span class='gray'>&nbsp;|&nbsp;</span><a data='" +result.id + "' id='delete' href='javascript:;'>删除</a></td></tr>";
	                    /* item = "<tr><td>"+ (i+1) +"</td><td>" + result.username + "</td>" +
	                    +"<td>" + result.type + "</td><td>锁定</td><td>" + loginTime + "</td>" +
	                    +"<td><a href='#'>锁定</a><span class='gray'>&nbsp;|&nbsp;</span>"+
	                    +"<a href='#'>删除</a></td></tr>"; */
	                    
	                    $('.table tbody').append(item);  
	                });  
				}
			}
		});
	}
	
	//  超级管理员查询用户
	function searchAllUserList() {
		$.ajax({
			type : "GET",
			url : contextPath + "/user/allUserList",
			data : {
				searchParam : searchParam
			},
			dataType : "json",
			success : function(datas) {
				
				 $('.table tbody').empty("");  // 清空数据
				 
				if(datas.data == null | datas.data == "") {
					$('.table tbody').append("暂无相关数据");  
				}else{
					
					$.each(datas.data, function(i,result){
						var item;
						var loginTime = getdate(result.log.loginTime);
						var setting;
						var type = result.type;
						if(type == '0') {
							type="普通用户";
							setting="设为管理员";
						}else if(type == '1') {
							type="管理员";
							setting="取消管理员";
						}else{
							type="超级管理员";
						}
						
						var isLocked = result.isLocked;
                        var lockBtn;
                        if(isLocked == '0') {
                            isLocked="未锁定";
                            lockBtn="锁定";
                        } else{
                            isLocked="锁定";
                            lockBtn="解锁";
                        }
                        
						item = "<tr><td>"+ (i+1) +"</td><td>" + result.username + "</td><td>"+ type +"</td><td data='" +result.id + "' id='lockStatus'>"+ isLocked +"</td><td>" + loginTime + "</td><td><a id='userRole' user='"+result.id + "' href='javascript:;'>" + setting + "</a><span class='gray'>&nbsp;|&nbsp;</span><a userId='" +result.id + "' class='lock' href='javascript:;'> "+ lockBtn +"</a><span class='gray'>&nbsp;|&nbsp;</span><a data='" +result.id + "' id='view' href='javascript:;'>查看</a><span class='gray'>&nbsp;|&nbsp;</span><a data='" +result.id + "' id='delete' href='javascript:;'>删除</a></td></tr>";
	                    /* item = "<tr><td>"+ (i+1) +"</td><td>" + result.username + "</td>" +
	                    +"<td>" + result.type + "</td><td>锁定</td><td>" + loginTime + "</td>" +
	                    +"<td><a href='#'>锁定</a><span class='gray'>&nbsp;|&nbsp;</span>"+
	                    +"<a href='#'>删除</a></td></tr>"; */
	                    
	                    $('.table tbody').append(item);  
	                });  
				}
			}
		});
	}
	
	// 时间戳格式转
	function getdate() {
        var now = new Date(),
            y = now.getFullYear(),
            m = now.getMonth() + 1,
            d = now.getDate();
        return y + "-" + (m < 10 ? "0" + m : m) + "-" + (d < 10 ? "0" + d : d) + " " + now.toTimeString().substr(0, 8);
    } 
	
	// 新增管理员
	function addUser() {
		window.top.frames['mainframe'].document.location = "/travelForum/manage/user_add.jsp";
	}
	
	
	// 设置、取消管理员
	function settingUserRole() {
		var userId = $(this).attr("user");
		var userRole = $(this).text();
		var type;

		if(userRole.trim() == "设为管理员") {
			type=1;
		}else if(userRole.trim() == "取消管理员") {
			type=0;
		}
		
		$.ajax({
	        type: "POST",
	        url : contextPath + "/user/settingUserRole",
	        data:{
	            "userId" : userId,	
	            "type" : type
	            },
	        dataType : "json",
	        success : function(datas) {
	            alert(datas.message);
	            if(datas.data == "设为管理员") {
	            	$("a[user="+userId+"]").parent().prev().prev().prev().empty();
		            $("a[user="+userId+"]").parent().prev().prev().prev().text("普通用户");
		            $("a[user="+userId+"]").empty();
		            $("a[user="+userId+"]").text("设为管理员");
	            }else if(datas.data == "取消管理员"){
	            	$("a[user="+userId+"]").parent().prev().prev().prev().empty();
	            	$("a[user="+userId+"]").parent().prev().prev().prev().text("管理员");
	            	$("a[user="+userId+"]").empty();
	            	$("a[user="+userId+"]").text("取消管理员");
	       		}
	        }
	       }); 
		}
	
	
	// 锁定用户
	function lockUser() {
		var userId = $(this).attr("userId");
		var lockStatus = $(this).text();

		if(lockStatus.trim() == "解锁") {
			$.ajax({
	            type: "POST",
	            url : contextPath + "/user/unLockUser/" + userId,
	            success : function(datas) {
	            	alert(datas.message);
	            	$("a[userId="+userId+"]").parent().prev().prev().empty();
	            	$("a[userId="+userId+"]").parent().prev().prev().text("未锁定");
	            	$("a[userId="+userId+"]").empty();
	            	$("a[userId="+userId+"]").text("锁定");
	       }
	        }); 
		}
		// 解锁用户
	    if(lockStatus.trim() == "锁定") {
			$.ajax({
	            type: "POST",
	            url : contextPath + "/user/lockUser/" + userId,
	            success : function(datas) {
	            	alert(datas.message);
	            	$("a[userId="+userId+"]").parent().prev().prev().empty();
	            	$("a[userId="+userId+"]").parent().prev().prev().text("锁定");
	            	$("a[userId="+userId+"]").empty();
	            	$("a[userId="+userId+"]").text("解锁");
	            }
	        }); 
		}
	}
	
	// 查看用户信息
	function viewUser() {
		var userId = $(this).attr("data");
    	
    	$.ajax({
    		type: "GET",
			url : contextPath + "/user/seleteUserInfo/" + userId,
			success : function(datas) {
				window.top.frames['mainframe'].document.location = "/travelForum/manage/user_detail.jsp?username="+ datas.username +"&phoneNum="+ datas.phoneNum +"&email="+ datas.email+"&type=" +datas.type+"&isLocked="+ datas.isLocked +"&createTime="+datas.createTime +"&loginTime="+datas.log.loginTime +"&ip="+datas.log.ip+"&device="+datas.log.device;
			}
		}); 
	}
	
	// 删除用户
	function deleteUser() {
		
	    	var userId = $(this).attr("data");
	    	
	    	$.ajax({
	    		type: "DELETE",
    			url : contextPath + "/user/delete/" + userId,
    			success : function(datas) {
    				alert(datas.message);
    				searchUser();
    			}
    		}); 
	}
	         
</script>



</html>