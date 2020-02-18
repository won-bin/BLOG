<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
<link rel="stylesheet" type="text/css" href="resources/css/blog/blog.css" />
<script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js" ></script>
<script type="text/javascript">
$(document).ready(function() {
	reloadCategory();
	CKEDITOR.replace("wCon", {
		resize_enabled : false,
		language : "ko",
		enterMode : "2",
		height: "530px"
	});
	
	CKEDITOR.instances.wCon.setData("${bCon}");
	
	$("#wCancleBtn").on("click", function() {
		history.back();
	});
	
	$("#writeBtn").on("click", function() {
		$("#wCon").val(CKEDITOR.instances.wCon.getData());
		if($.trim($("#wTitle").val()) == ""){
			alert("제목을 입력해주세요.");
			$("#wTitle").focus();		
		}else if($.trim($("#wCon").val()) == ""){
			alert("내용을 입력해주세요.");
			CKEDITOR.instances.wCon.focus();
		}else {
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "bEditAjax",
				datatype : "json",
				data : params,
				success : function(result) {
					alert("수정 되었습니다.");
					/* location.href = "main"; */
					$("#actionForm").attr("action", "main");
					$("#actionForm").submit();
				},
				error : function(request, status, error) {
					console.log("text : " + request.responseText);
					console.log("error : " + error);
				}
			});
		}
	});
});

function reloadCategory() {
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

function redrawCategory(category) {
	var html = "";
	
	for(var i in category){
		html += "<option value=\"" + category[i].CTG_NO + "\">" + category[i].CTG_NAME + "</option>"		
	}
	
	$(".wCategory").html(html);
}
</script>
</head>
<body>
<div class="write_area">
	<form action="#" method="post" id="actionForm">
		<select class="wCategory" name="wCategory">
		</select>
		<input type="hidden" id="bNo" name="bNo" value="${bNo}"/>
		<input type="text" id="wTitle" name="wTitle" placeholder="제목" value="${bTitle}"/> <br/>
		<input type="text" id="wCon" name="wCon"/> <br/>
		<input type="hidden" id="bmNo" name="bmNo" value="${sBmNo}"/>
		<input type="button" id="wCancleBtn" value="취소" />
		<input type="button" id="writeBtn" name="writeBtn" value="수정" />
	</form>
</div>
</body>
</html>