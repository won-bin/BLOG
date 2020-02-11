<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 블로그</title>
<link rel="stylesheet" type="text/css" href="resources/css/blog/blog.css"/>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.slimscroll.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.menu_list').slimScroll({
        height: '760px',
        width: '250px'
        /* railVisible: true,
        railColor: '#222',
        railOpacity: 0.3,
        wheelStep: 10,
        allowPageScroll: false,
        disableFadeOut: false */
    });
    
	$("#bmNo").val("${bmNo}");
	getBlogNm();
	
	$("#bNo").val("${bNo}");
	if($("#bNo").val() != ""){
		reloadDetail();
	}else {
		reloadLastDetail();
	}
	
	reloadCategory();
	reloadList();
	/* if(sessionStorage.getItem('bNo') == null) {
		reloadLastDetail();
	}else {
		reloadDetail();
	} */
	
	$("html").on("click", function(e) {
		if(!$(e.target).parents(".top_search").attr("class") && $("#search_txt").val() == ""){
			$("#search_txt").stop();
			$("#search_txt").css("width", "0px");
			$("#search_txt").css("display", "none");
			$("#searchBtn").css("display", "none");
			$(".search_on_btn").val("검색");
		}
		
		if(!$(e.target).parents(".top_right").attr("class")){
			$(".mInfo").css("display", "none");
		}
	});
	
	$(".menu_btn, .menu_bg, .menu_btn_on").on("click", function(){
		$(".menu").stop();
		if($(".menu_btn").attr("class") == "menu_btn"){
			$(".menu_bg").css("visibility", "visible");
			$(".menu_btn").attr("class", "menu_btn_on");
			$(".menu_btn_on").html("X");
			$(".menu").animate({
				left: "0px"
			}, 400);
		}else {
			$(".menu_btn_on").attr("class", "menu_btn");
			$(".menu_bg").css("visibility", "hidden");
			$(".menu_btn").html("MENU");
			$(".menu").animate({
				left: "-250px"
			}, 400);
		}
	});
	
	$(".login_btn_n").on("click", function() {
		location.href = "login";
	});
	
	$(".board_paging_area").on("click", "input", function() {
		if(($(this).attr("name") != "")) {
			$("#page").val($(this).attr("name"));
			reloadList();
		}
	});
	
	$(".search_on_btn").on("click", function() {
		if($("#search_txt").css("display") == "inline-block" && $("#search_txt").val() == ""){
			$("#search_txt").stop();
			$("#searchBtn").css("display", "none");
			$("#search_txt").css("display", "none");
			$("#search_txt").css("width", "0px");
			$(".search_on_btn").addClass("off");
			$(".search_on_btn").val("검색");
		}else {
			$("#search_txt").animate({
				width: "200px"
			}, 700);
			$("#searchBtn").css("display", "inline-block");
			$("#search_txt").css("display", "inline-block");
			$("#search_txt").focus();
			$(".search_on_btn").removeClass("off");
			$(".search_on_btn").val("X");
		}
	});
	
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		reloadList();
		reloadLastDetail();
	});
	
	$(".title_txt").on("click", function() {
		/* sessionStorage.clear(); */
		location.href = "main";
	});
	
	$(".menu_bottom").on("click", "img", function() {
		location.href = "list";
	});
	
	$(".login_btn_y").on("click", function() {
		if($(".mInfo").css("display") == "block"){
			$(".mInfo").css("display", "none");
		}else {
			$(".mInfo").css("display" , "block");
		}
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
	
	$("tbody").on("click", ".board_list_title", function() {
		$(".board_list_on").removeClass();
		$(this).parents("tr").attr("class", "board_list_on");
		
		$("#bNo").val($(this).parents("tr").attr("name"));
		/* sessionStorage.setItem('bNo', $("#bNo").val()); */
		
		reloadDetail();
		reloadComment();
	});
	
	$("#commentBtn").on("click", function() {
		if("${sBmNo}" == "") {
			alert("로그인후에 작성 가능합니다.");
		}else if($.trim($("#comment_txt").val()) == ""){
			alert("내용을 입력하세요.");
			$("#comment_txt").focus();
		}else {
			var params = $("#actionForm").serialize();
				
			$.ajax({
				type : "post",
				url : "commentWriteAjax",
				datatype : "json",
				data : params,
				success : function(result) {
					reloadComment();
					reloadList();
				},
				error : function(request, error) {
					console.log("text : " + request.responseText);
					console.log("error : " + error);
				}
			});
			$("#comment_txt").val("");
		}
	});
	
	$("#comment_txt").on("keypress", function() {
		if(event.keyCode == 13){
			$("#commentBtn").click();
		}
	});
	
	$("#search_txt").on("keypress", function() {
		if(event.keyCode == 13){
			$("#searchBtn").click();
		}
	});
	
	$(".comment").on("click", ".comment_del", function() {
		if(confirm("댓글을 삭제 하시겠습니까?")) {
			$("#cmtNo").val($(this).parent("div").attr("name"));
			var params = $("#actionForm").serialize();
				
			$.ajax({
				type : "post",
				url : "commentDelAjax",
				datatype : "json",
				data : params,
				success : function(result) {
					alert("삭제 되었습니다");
					reloadComment();
					reloadList();
				},
				error : function(request, error) {
					console.log("text : " + request.responseText);
					console.log("error : " + error);
				}
			});
		}
	});
	
	$(".blog_set_btn").on("click", function() {
		location.href = "menuEdit";
	});
	
	$(".board_detail").on("click", ".board_del", function() {
		if(confirm("삭제 하시겠습니까?")){
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type: "post",
				url: "bDelAjax",
				datatype: "json",
				data: params,
				success: function(result) {
					alert("삭제되었습니다.");
					reloadList();
					reloadLastDetail();
				},
				error: function(request, error) {
					console.log("text : " + request.responseText);
					console.log("error : " + error);
				}
			});
		}
	});
	
	$(".board_detail").on("click", ".board_edit", function() {
		$("#actionForm").attr("action", "bEdit");
		$("#actionForm").submit();
	});
	
	$("#listBtn").on("click", function() {
		if($(this).val() == "목록열기"){
			$(this).val("목록닫기");
			$(".board_table").css("display", "table");
			$(".board_paging_area").css("display", "block");
		}else if($(this).val() == "목록닫기"){
			$(this).val("목록열기");
			$(".board_table").css("display", "none");
			$(".board_paging_area").css("display", "none");
		}
	});
	
	$(".menu_list").on("click", ".menu_txt", function() {
		if($(this).attr("name") == 0){
			$("#ctgNo").val('');
		}else{
			$("#ctgNo").val($(this).attr("name"));
		}
		$("#page").val("1");
		
		reloadLastDetail();
		reloadList();
	});
});

function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "listAjax",
		datatype : "json",
		data : params,
		success : function(result) {
			if(result.list.length == 0){
				alert("글이 없습니다.");
			}else{
				$(".menu_btn_on").click();
				redrawList(result.list);
				redrawPaging(result.pb);				
			}
		},
		error : function(request, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}

function reloadDetail() {
	/* $("#bNo").val(sessionStorage.getItem('bNo')); */
	
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "detailAjax",
		datatype : "json",
		data : params,
		success : function(result) {
			redrawDetail(result.data);
		},
		error : function(request, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}

function reloadLastDetail() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "lastDetailAjax",
		datatype : "json",
		data : params,
		success : function(result) {
			if(result.data != null){
				redrawLastB(result.data);
				reloadComment(result.data);				
			}
		},
		error : function(request, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}

function redrawList(list){
	var html = "";
	
	if(list.length == 0) {
		html += "<tr>";
		html += "<td colspan=\"5\">조회된 데이터가 없습니다.</td>";
		html += "</tr>";
	} else {
		for(var i in list){
			if($("#bNo").val() == list[i].B_NO){
				html += "<tr class=\"board_list_on\" name=\"" + list[i].B_NO + "\">";
			}
			/* if(list[i].B_NO == sessionStorage.getItem('bNo')){
				html += "<td><span class=\"board_list_title_on\">" + list[i].B_TITLE + "</span></td>";
			}else if(sessionStorage.getItem('bNo') == null && i == 0){
				html += "<td><span class=\"board_list_title_on\">" + list[i].B_TITLE + "</span></td>";
			} */else{
				html += "<tr name=\"" + list[i].B_NO + "\">";
			}
			html += "<td><span class=\"board_list_title\">" + list[i].B_TITLE +"</span><span> (" + list[i].CNT + ")</span></td>";				
			html += "<td class=\"board_list_date\">" + list[i].B_DT + "</td>";
			html += "</tr>";
		}
	}
	
	if($("#ctgNo").val() == '' && $("#search_txt").val() == ''){
		$(".category_title").html("\'전체 글\'");
	}else if($("#search_txt").val() != ''){
		$(".category_title").html("\'" + $("#search_txt").val() + "\'");
		$(".category_txt").html("검색 결과");
		$("#search_txt").val("");
		$(".search_on_btn").click();
	}else{
		$(".category_title").html("\'" + $("#ctgNm").val() + "\'");
	}
	$("tbody").html(html);
}

function redrawLastB(data){
	var html = "";

	$("#bNo").val(data.B_NO);
	$("#bTitle").val(data.B_TITLE);
	$("#bCon").val(data.B_CON);
	$("#ctgNm").val(data.CTG_NAME);
	
	if(data.CTG_NAME == null){
		html += "<span>카테고리 미지정</span>";		
	}else{
		html += "<span>" + data.CTG_NAME + "</span>";	
	}
	html += "<div class=\"board_title\">" + data.B_TITLE + "</div>";
	html += "<div class=\"board_bottom \"><span class=\"board_date\">" + data.B_DT + "</span>";
	if(data.BM_NO == "${sBmNo}"){
		html += "<div class=\"board_del\">삭제</div>";
		html += "<div class=\"board_edit\">수정</div>";	
	}
	html += "</div>";
	html += "<div class=\"board_content\">" + data.B_CON + "</div>";
	
	$(".board_detail").html(html);
}

function redrawDetail(data) {
	$("#bNo").val(data.B_NO);
	$("#bTitle").val(data.B_TITLE);
	$("#bCon").val(data.B_CON);
	var html = "";
	
	if(data.CTG_NAME == null){
		html += "<span>카테고리 미지정</span>";		
	}else{
		html += "<span>" + data.CTG_NAME + "</span>";		
	}
	html += "<div class=\"board_title\">" + data.B_TITLE + "</div>";
	html += "<div class=\"board_bottom \"><span class=\"board_date\">" + data.B_DT + "</span>";
	if(data.BM_NO == "${sBmNo}"){
		html += "<div class=\"board_del\">삭제</div>";
		html += "<div class=\"board_edit\">수정</div>";	
	}
	html += "</div>";
	html += "<div class=\"board_content\">" + data.B_CON + "</div>";
	
	$(".board_detail").html(html);
}

function reloadComment(data) {
	if($("#bNo").val() == ""){
		$("#bNo").val(data.B_NO);
	}
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "commentAjax",
		datatype : "json",
		data : params,
		success : function(result) {
			redrawComment(result.list);
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}

function redrawComment(list) {
	var html = "";
	
	if(list.length == 0){
		html += "<div class=\"comment_name\">댓글이 없습니다.</div>";
	}
	for(var i in list){
		html += "<div name=\"" + list[i].CMT_NO + "\"><div class=\"comment_name\">" + list[i].NAME + "</div>";
		html += "<div class=\"comment_date\">" + list[i].CMT_DT + "</div>";
		if(list[i].NAME == "${sBmNm}"){
			html += "<div class=\"comment_del\">" + "삭제" + "</div>";
		}
		html += "<div class=\"comment_con\">" + list[i].CMT_CON + "</div></div>";
	}
	
	$(".comment").html(html);
}

function redrawPaging(pb) {
	var html = "";
	if(pb.maxPcount > 10 && pb.startPcount > "1") {
		//처음
		html += "<input type=\"button\" class=\"arrow\" name=\"1\" value=\"<<\"/>";	
		
		//이전 페이지
		html += "<input type=\"button\" class=\"arrow\" name=\"" + (pb.startPcount * 1 - 1) + "\" value=\"<\" />";
	}
	
	//숫자
	for(var i = pb.startPcount; i <= pb.endPcount; i++) {
		if($("#page").val() == i) {
			html += "<input type=\"button\" class=\"num_on\" value=\"" + i + "\"/>";
		} else {
			html += "<input type=\"button\" class=\"num\" name=\"" + i + "\" value=\"" + i + "\"/>";
		}
	}
	
	if(pb.maxPcount > 10 && pb.endPcount != pb.maxPcount) {
		//다음
		html += "<input type=\"button\" class=\"arrow\" name=\"" + (pb.startPcount * 1 + 10) + "\" value=\">\" />";
		
		//마지막
		html += "<input type=\"button\" class=\"arrow\" name=\"" + pb.maxPcount + "\" value=\">>\"/>";
	}
	
	$(".board_paging_area").html(html);
}

function reloadCategory() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "getCtgAjax",
		datatype : "json",
		data : params,
		success : function(result) {
			redrawCategory(result.list, result.cnt);
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}

function redrawCategory(list, cnt) {
	var html = '';
	
	html += "<div class=\"menu_area\"><span class=\"menu_txt\" name=\"0\">전체 글" + " (" + cnt + ")" +"</span></div>";
	for(var i in list){
		html += "<div class=\"menu_area\"><span class=\"menu_txt\" name=\"" + list[i].CTG_NO + "\">" + list[i].CTG_NAME + " (" + list[i].CNT + ")" + "</span></div>";	
	}
	
	$(".menu_list").html(html);
}

function getBlogNm() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "getBlogNmAjax",
		datatype : "json",
		data : params,
		success : function(result) {
			$(".title_txt").html(result.data.BLOG_NAME);
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}
</script>
</head>
<body>
<form action="#" method="post" id="actionForm">
	<input type="hidden" id="bTitle" name="bTitle"/>
	<input type="hidden" id="bCon" name="bCon"/>	
	<input type="hidden" name="page" id="page" value="1" />
	<input type="hidden" id="bNo" name="bNo" />
	<input type="hidden" id="cmtNo" name="cmtNo"/>
	<input type="hidden" id="bmNo" name="bmNo"/>
	<input type="hidden" id="ctgNo" name="ctgNo"/>
	<input type="hidden" id="ctgNm" name="ctgNm" />
<div class="main_top">
	<div class="menu_btn">MENU</div>
	<div class="top_search">
		<input type="button" class="search_on_btn off" value="검색"/>
		<input type="text" id="search_txt" name="search_txt" placeholder="검색어를 입력하세요." />
		<input type="button" id="searchBtn" value="검색" />
	</div>
	<span class="title_txt"></span>
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
<div class="a">
<div class="main_cover">

</div>
<div class="contents_area">
	<div class="board_list">
		<div class="category_txt_area">
			<span class="category_title">'전체 글'</span>
			<span class="category_txt">카테고리의 다른 글</span>
			<input type="button" id="listBtn" value="목록열기"/>
		</div>
		<table class="board_table">
			<colgroup>
				<col width="1000">
				<col width="200">
			</colgroup>
			<tbody>
				
			</tbody>
		</table>
		<div class="board_paging_area">
			
		</div>
	</div>
	<div class="board_detail">
		
	</div>
	<div class="comment_area">
		<input type="text" id="comment_txt" name="comment_txt" placeholder="내용을 입력하세요." />
		<input type="button" id="commentBtn" value="댓글 쓰기"/>
		<div class="comment">
			
		</div>
	</div>
</div>
</div>
<div class="menu">
	<div class="menu_top"></div>
	<div class="menu_list">
		
	</div>
	<div class="menu_bottom">
		<img src="resources/images/blog/home.png" />
	</div>
</div>
<div class="menu_bg"></div>
</form>
</body>
</html>