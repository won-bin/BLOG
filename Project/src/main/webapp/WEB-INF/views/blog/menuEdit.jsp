<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 관리</title>
<link rel="stylesheet" type="text/css" href="resources/css/blog/blog.css"/>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
var cnt = 0;
$(document).ready(function() {
	getCategory();
	
	$("#menu_add_btn").on("click", function() {
		menuAdd();
	});
	
	$("#menu_edit_btn").on("click", function() {
		addCategory();
	});
});

function menuAdd() {
	cnt ++;
	var a = document.getElementById("category_edit_area");
	var html = "";

	html += "<div class=\"category_edit\">";
	html += "<input type=\"text\" class=\"category_name\" id=\"" + cnt + "\"placeholder=\"카테고리명을 입력해주세요.\"/>";
	html += "<input type=\"button\" class=\"menu_del_btn\" value=\"삭제\" />";
	html += "</div>";

	a.innerHTML += html;
	abc();
}

function abc(){
	$(".menu_del_btn").each(function() {
		$(this).on("click", function() {
			cnt--;
			$("#ctgNo").val($(this).attr("name"));
			$(this).parent().remove();
			if($(this).attr("name") != null){
				delCategory();
			}
		});	
	});	
}

function delCategory(){
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "delCtgAjax",
		datatype : "json",
		data : params,
		success : function(result) {
			alert("삭제되었습니다.");
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}

function addCategory() {
	for(var i = 1; i <= cnt; i++){
		$("#ctgName").val($("#"+i).val());
		
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "insertCtgAjax",
			datatype : "json",
			data : params,
			success : function(result) {
				alert("변경되었습니다.");
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
}

function getCategory() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "getCtgAjax",
		datatype : "json",
		data : params,
		success : function(result) {
			redrawCategory(result.list);
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}

function redrawCategory(list) {
	var html = "";
	
	for(var i in list){
		html += "<div class=\"category_edit\">";
		html += "<input type=\"text\" class=\"category_name\" placeholder=\"카테고리명을 입력해주세요.\"/ value=\"" + list[i].CTG_NAME + "\">";
		html += "<input type=\"button\" name=\"" + list[i].CTG_NO + "\" class=\"menu_del_btn\" value=\"삭제\" />";
		html += "</div>";
	}
	
	$("#category_edit_area").html(html);
}
</script>
</head>
<body>
<form action="#" method="post" id="actionForm">
	<input type="hidden" id="ctgName" name="ctgName"/>
	<input type="hidden" id="bmNo" name="bmNo" value="${sBmNo}" />
	<input type="hidden" id="ctgNo" name="ctgNo" />
</form>
<div class="menu_edit_area">
	<div class="menu_edit_top">
		<span class="menu_edit_txt">메뉴 관리</span>
		<div class="menu_edit_btn_area">
			<input type="button" id="menu_add_btn" value="추가" />
			<input type="button" id="menu_edit_btn" value="확인" />
		</div>
	</div>
	<div id="category_edit_area">
		
	</div>
</div>
</body>
</html>