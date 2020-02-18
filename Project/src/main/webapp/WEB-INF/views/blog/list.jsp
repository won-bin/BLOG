<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블로그 리스트</title>
<link rel="stylesheet" type="text/css" href="resources/css/blog/blog.css" />
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js" ></script>
<script type="text/javascript">
$(document).ready(function() {
	reloadList();
	reloadBlogCtg();
	
	$("html").on("click", function(e) {
		if(!$(e.target).parents(".top_right").attr("class")){
			$(".mInfo").css("display", "none");
		}
	});
	
	$(".login_btn_n").on("click", function() {
		location.href = "login";
	});
	
	$(".login_btn_y").on("click", function() {
		if($(".mInfo").css("display") == "block"){
			$(".mInfo").css("display", "none");
		}else {			
			$(".mInfo").css("display" , "block");
		}
	});
	
	$(".blog_list_area").on("click", ".blog_list_m", function() {
		$("#bmNo").val($(this).parents(".blog_list").attr("name"));
		$("#blogName").val($(this).prev().val());
		
		$("#actionForm").attr("action", "main");
		$("#actionForm").submit();
	});
	
	$(".blog_list_area").on("click", ".blog_list_con", function() {
		$("#bmNo").val($(this).parents(".blog_list").attr("name"));
		$("#blogName").val($(this).prev().val());
		
		$("#actionForm").attr("action", "main");
		$("#actionForm").submit();
	});
	
	$(".blog_category").on("click", "li", function() {
		$(".on").removeClass();
		$(this).addClass("on");
		$("#lCtgNo").val($(this).attr("name"));
		reloadList();
	});
	
	$("#logoutBtn").on("click", function() {
		location.href = "mLogout";
	});
	
	$("#goEditBtn").on("click", function() {
		location.href = "mInfoEdit";
	});
	
	$("#goWriteBtn").on("click", function() {
		location.href = "write";
	});
	
	$(".blog_set_btn").on("click", function() {
		location.href = "menuEdit";
	});
});

function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type: "post",
		url: "getBlogAjax",
		datatype: "json",
		data: params,
		success: function(result){
			redrawBlogList(result.list);
		},
		error: function() {
			
		}
	});
}

function redrawBlogList(list) {
	var html = "";
	
	if(list.length == 0){
		html += "<div class=\"blog_list_con\">조회된 리스트가 없습니다.</div></div>";
	}
	for(var i in list){
		html += "<div class=\"blog_list\" name=\"" + list[i].BM_NO + "\">";
		html += "<div class=\"blog_list_top\">";
		html += "<div class=\"blog_list_title\">" + list[i].B_TITLE + "</div>";
		html += "<div class=\"blog_list_con\">" + list[i].B_CON + "	</div></div>";
		html += "<div class=\"blog_list_bottom\">";
		html += "<div><input type=\"hidden\" value=\"" + list[i].BLOG_NAME + "\" /><div class=\"blog_list_m\" >" + list[i].NAME + "</div>";
		html += "</div>";
		html += "<div class=\"blog_list_date\">" + list[i].B_DT + "<div class=\"blog_list_coment\"><span>댓글 " + list[i].CNT + "</span></div></div></div></div>";
	}
	
	$(".blog_list_area").html(html);
}

function reloadBlogCtg() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type: "post",
		url: "getBlogCtgAjax",
		dataType: "json",
		data: params,
		success: function(result) {
			redrawBlogCtg(result.list)
		}
	});
}

function redrawBlogCtg(list) {
	var html = "";
	
	html += "<li class=\"on\">전체</li>";
	for(var i in list){
		html += "<li name=\"" + list[i].L_CTG_NO + "\">" + list[i].L_CTG_NAME + "</li>";		
	}
	
	$(".category_list").html(html);
}
</script>
</head>
<body>
<form action="#" method="post" id="actionForm">
	<input type="hidden" id="lCtgNo" name="lCtgNo" />
	<input type="hidden" id="bmNo" name="bmNo"/>
	<input type="hidden" id="blogName" name="blogName" />
</form>
<div class="list_top">
	<div class="top_right">
		<c:choose>
			<c:when test="${sBmNm eq null}">
				<span class="login_btn_n">로그인</span>
			</c:when>
			<c:otherwise>
				<span class="login_btn_y">${sBmNm}</span>
			</c:otherwise>
		</c:choose>
		<div class="mInfo">
			<div class="mPhoto"></div>
			<div class="mInfo_txt_area">
				<div class="mInfo_txt">${sBmId}</div>
				<div class="mInfo_txt">${sBmNm}</div>
				<div class="blog_btn_area">
					<span class="blog_btn">${sBmBn}</span>
					<span class="blog_set_btn">관리</span>			
				</div>
			</div>
			<div class="mInfoBtn_area">
				<input type="button" id="goWriteBtn" value="글쓰기" />
				<input type="button" id="goEditBtn" value="회원정보 수정" />
				<input type="button" id="logoutBtn" value="로그아웃" />		
			</div>
		</div>
	</div>
</div>
<div class="blog_category">
	<ul class="category_list">
	</ul>
</div>
<div class="blog_list_bg">
	<div class="blog_list_area">
	</div>
</div>
</body>
</html>