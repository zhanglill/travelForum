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
  
<link href="/travelForum/skin/css/bootstrap.css" type="text/css"
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
					<span>名称</span>
				</div>
				<div class="form-group col-sm-5" style="float: left">
					<input type="text" name="searchInput" class="form-control col-sm-5" placeholder="请输入公告名称">
				</div>
				<button id="searchBtn" type="button" class="btn btn-primary"
					style="float: left;">查询</button>
			</div>

		</form>
		<div style="text-align: right;">
			<button class="btn btn-success" id="addNotice">新增公告</button>
		</div>
	</div>

	<table class="table table-bordered table-striped table-hover"
		style="margin-left: 50px; width: 90%; border: 0; text-align: center"
		id="main-tab">
		<thead style=" border-top:2px solid #e2e1e1;">
			<tr>
				<th style="text-align: center">序号</th>
				<th style="text-align: center">名称</th>
				<th style="text-align: center">创建时间</th>
				<th style="text-align: center">编辑时间</th>
				<th style="text-align: center">操作</th>
			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>
</body>
<script type="text/javascript">

	var contextPath = '<%=request.getContextPath()%>';
	

	$(function() {
		initPageDom();
		initPageEvent();
	});

	function initPageDom() {
		init_searchNoticeList();
	}

	function initPageEvent() {
		// 查询列表
		$(document).on("click", "#searchBtn", searchNoticeList);
		// 新增
		$(document).on("click", "#addNotice", addNotice);
		// 查看
		$(document).on("click", "#view", viewNotice);
		// 删除
		$(document).on("click", "#delete", deleteNotice);
		// 编辑
		$(document).on("click", "#edit", updateNotice);
		

	}

	function init_searchNoticeList() {
		searchNoticeList();
	}
	
	//  公告列表
	function searchNoticeList() {
		var searchParam = $("input[name=searchInput]").val();
		
		$.ajax({
			type : "GET",
			url : contextPath + "/notice/listSytemNotice",
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
						/* var createTime = getdate(result.createTime);
						var updateTime = getdate(result.updateTime); */
						var updateTime;
						if(result.updateTime == null | result.updateTime == "") {
							updateTime = " ";
						}else {
							updateTime = result.updateTime;
						}
						
						item = "<tr><td>"+ (i+1) +"</td><td>" + result.title + "</td><td>" + result.createTime + "</td><td>" + updateTime + "</td><td><a id='view' data=" + result.id + " href='javascript:;'>查看</a><span class='gray'>&nbsp;|&nbsp;</span><a dataId=" + result.id + " id='edit' href='javascript:;'>编辑</a><span class='gray'>&nbsp;|&nbsp;</span><a noticeId=" + result.id + " id='delete' href='javascript:;'>删除</a></td></tr>";
	                    
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
	
	// 新增公告
	function addNotice() {
		window.top.frames['mainframe'].document.location = "/travelForum/manage/systemNotice_add.jsp";
	}
	
	// 查看信息
	function viewNotice() {
		var noticeId = $(this).attr("data");
    	
    	$.ajax({
    		type: "GET",
			url : contextPath + "/notice/selectById/" + noticeId,
			success : function(datas) {
				window.top.frames['mainframe'].document.location = "/travelForum/manage/systemNotice_detail.jsp?noticeId="+ datas.data.noticeId+"&noticeTitle="+ datas.data.title +"&noticeContent="+ datas.data.content +"&createTime="+datas.data.createTime +"&updateTime="+ datas.data.updateTime;
				//window.top.frames['mainframe'].document.location = "/travelForum/manage/systemNotice_detail.jsp?noticeTitle="+ datas.title +"&noticeContent="+ datas.content +"&userName=" + datas.user.username + "&createTime="+datas.createTime +"&updateTime="+ datas.updateTime;
			}
		}); 
	}
	
	// 编辑
	function updateNotice() {
		var noticeId = $(this).attr("dataId");
	    	
	    	$.ajax({
	    		type: "GET",
    			url : contextPath + "/notice/selectById/" + noticeId,
    			success : function(datas) {
    				window.top.frames['mainframe'].document.location = "/travelForum/manage/systemNotice_edit.jsp?noticeId="+ datas.data.id +"&noticeTitle="+ datas.data.title +"&noticeContent="+ datas.data.content +"&createTime="+datas.data.createTime +"&updateTime="+ datas.data.updateTime;
    			}
    		}); 
	}
	
	// 删除
	function deleteNotice() {
		
	    	var noticeId = $(this).attr("noticeId");
	    	
	    	$.ajax({
	    		type: "DELETE",
    			url : contextPath + "/notice/delete/" + noticeId,
    			success : function(datas) {
    				alert(datas.message);
    				searchNoticeList();
    			}
    		}); 
	}
	         
</script>



</html>