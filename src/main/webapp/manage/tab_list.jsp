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
					<span>模块名称</span>
				</div>
				<div class="form-group col-sm-5" style="float: left">
					<input type="text" name="searchInput" class="form-control col-sm-5" placeholder="请输入模块名称">
				</div>
				<button id="searchBtn" type="button" class="btn btn-primary"
					style="float: left;">查询</button>
			</div>

		</form>
		<div style="text-align: right;">
			<button class="btn btn-success" id="addTab">新增模块</button>
		</div>
	</div>

	<table class="table table-bordered table-striped table-hover"
		style="margin-left: 50px; width: 90%; border: 0; text-align: center"
		id="main-tab">
		<thead style=" border-top:2px solid #e2e1e1;">
			<tr>
				<th style="text-align: center">序号</th>
				<th style="text-align: center">模块名称</th>
				<th style="text-align: center">模块英文名</th>
				<th style="text-align: center">操作</th>
			</tr>
		</thead>
		<tbody style="overflow: auto">

		</tbody>
	</table>

</body>
<script type="text/javascript">

	var contextPath = '<%=request.getContextPath()%>';
	var searchParam = $("input[name=searchInput]").val();

	$(function() {
		initPageDom();
		initPageEvent();
	});

	function initPageDom() {
		init_searchTabList();
	}

	function initPageEvent() {
		// 查询tab列表
		$(document).on("click", "#searchBtn", searchTabList);
		// 新增tab
		$(document).on("click", "#addTab", addTab);
		// 编辑tab
		$(document).on("click", "#edit", updateTab);
		// 删除tab
		$(document).on("click", "#delete", deleteTab);
		
	}

	function init_searchTabList() {
		searchTabList();
	}
	
	//  查询tab列表
	function searchTabList() {
		$.ajax({
			type : "GET",
			url : contextPath + "/tab/search",
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
						
						item = "<tr><td>"+ (i+1) +"</td><td>" + result.tabName + "</td><td>"+ result.tabNameEn +"</td><td><a data='" + result.id + "' id='edit' href='javascript:;'>编辑</a><span class='gray'>&nbsp;|&nbsp;</span><a data='" + result.id + "' id='delete' href='javascript:;'>删除</a></td></tr>";

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
	
	// 新增tab
	function addTab() {
		window.top.frames['mainframe'].document.location = "/travelForum/manage/tab_add.jsp";
	}

	// 更新tab
	function updateTab() {
		var tabId = $(this).attr("data");
	    	
	    	$.ajax({
	    		type: "POST",
    			url : contextPath + "/tab/getTabById/" + tabId,
    			success : function(datas) {
    				window.top.frames['mainframe'].document.location = "/travelForum/manage/tab_edit.jsp?tabId1=" + datas.data.id +"&tabName1="+ datas.data.tabName + "&tabNameEn1="+ datas.data.tabNameEn;
    			}
    		}); 
	}
	
	// 删除tab
	function deleteTab() {
		
	    	var userId = $(this).attr("data");
	    	$.ajax({
	    		type: "DELETE",
    			url : contextPath + "/tab/delete/" + userId,
    			success : function(datas) {
    				alert(datas.message);
    				searchTabList();
    			}
    		}); 
	}
	         
</script>



</html>