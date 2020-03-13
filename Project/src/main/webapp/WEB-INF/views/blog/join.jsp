<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="resources/css/blog/blog.css"/>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="resources/script/jquery/jquery.slimscroll.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".join_bg").slimscroll({
		height: "100%",
		width: "100%"
	});
	
	$("#joinBtn").on("click", function() {
		if($("#idVal").val() == 0){
			alert("아이디를 확인해주세요.");
			$("#joinId").focus();
		} else if($.trim($("#joinPw").val()) == ""){
			alert("비밀번호를 입력해주세요");
			$("#joinPw").focus();
		} else if($.trim($("#joinPwCheck").val()) == ""){
			alert("비밀번호를 한번 더 입력해주세요");
			$("#joinPwCheck").focus();
		} else if($.trim($("#joinName").val()) == ""){
			alert("이름을 입력해주세요");
			$("#joinName").focus();
		} else{
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type: "post",
				url: "joinAjax",
				datatype: "json",
				data: params,
				success: function(result) {
					if(result.res == "SUCCESS"){
						location.href = "login";
					} else {
						alert("가입에 실패하였습니다.");
					}
				},
				error: function(error) {
					console.log("error : " + error);
				}
			});
		}
	});
	
	$("#joinId").focusout(function() {
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "joinIdCheckAjax",
			datatype : "json",
			data : params,
			success : function(result) {
				if($.trim($("#joinId").val()) == ""){
					$("#idMsg").html("아이디를 입력해주세요.");
					$("#idMsg").css("color", "#F00");
					$("#idVal").val(0);
				}else if(result.cnt > 0){
					$("#idMsg").html("중복된 아이디가 있습니다.");
					$("#idMsg").css("color", "#F00");
					$("#idVal").val(0);
				} else {
					$("#idMsg").html("사용가능");
					$("#idMsg").css("color", "#0B0");
					$("#idVal").val(1);
				}
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	});
	
	$("#joinPw").focusout(function() {
		if($("#joinPw").val().length < 9){
			$("#pwMsg").html("9자 이상 적어주세요.");
			$("#pwMsg").css("color", "#F00");
		}else {
			$("#pwMsg").html("사용가능");
			$("#pwMsg").css("color", "#0B0");
		}
	});
	
	$("#joinPwCheck").focusout(function() {
		if($("#joinPw").val() != $("#joinPwCheck").val()){
			$("#pwCheckMsg").html("비밀번호가 일치 하지 않습니다");
			$("#pwCheckMsg").css("color", "#F00");
		}else {
			$("#pwCheckMsg").html("일치");
			$("#pwCheckMsg").css("color", "#0B0");
		}
	});
	
	$("#joinId, #joinPw, #joinPwCheck, #joinName, #blogName").focusout(function(){
		$(".a").css("border", "1px solid #CCC");
		$(".b").css("border", "1px solid #CCC");
		$(".c").css("border", "1px solid #CCC");
		$(".d").css("border", "1px solid #CCC");
		$(".e").css("border", "1px solid #CCC");
	});
	
	$("#joinId").on("focus", function(){
		$(".a").css("border", "1px solid black");
	});
	
	$("#joinPw").on("focus", function(){
		$(".a").css("border-bottom", "1px solid black");
		$(".b").css("border", "1px solid black");
	});
	
	$("#joinPwCheck").on("focus", function(){
		$(".b").css("border-bottom", "1px solid black");
		$(".c").css("border", "1px solid black");
	});
	
	$("#joinName").on("focus", function(){
		$(".c").css("border-bottom", "1px solid black");
		$(".d").css("border", "1px solid black");
	});
	
	$("#blogName").on("focus", function(){
		$(".e").css("border", "1px solid black");
	});
	
	$("#actionForm").on("click", "tr", function() {
		if($(this).attr("class") == "a"){
			$("#joinId").focus();			
		}else if($(this).attr("class") == "b") {
			$("#joinPw").focus();
		}else if($(this).attr("class") == "c") {
			$("#joinPwCheck").focus();
		}else if($(this).attr("class") == "d") {
			$("#joinName").focus();
		}else if($(this).attr("class") == "e") {
			$("#blogName").focus();
		}
	});
});
</script>
</head>
<body>
<input type="hidden" id="idVal" value=0 />
<div class="join_bg">
	<div class="join_area">
		<div class="join_title_txt">회원가입<br/></div>
		<form action="#" method="post" id="actionForm">
			<span class="join_txt">회원정보</span>
			<table>
				<colgroup>
					<col width="150">
					<col width="450">
				</colgroup>
				<tbody>
					<tr class="a">
						<th>아이디</th>
						<td><input type="text" id="joinId" name="joinId" placeholder="아이디를 입력해주세요."/><span id="idMsg"></span></td>
					</tr>
					<tr class="b">
						<th>비밀번호</th>
						<td><input type="password" id="joinPw" name="joinPw" placeholder="비밀번호를 입력해주세요."/><span id="pwMsg"></span></td>
					</tr>
					<tr class="c">
						<th>비밀번호 확인</th>
						<td><input type="password" id="joinPwCheck" name="joinPwCheck" placeholder="비밀번호를 한번더 입력해주세요."/><span id="pwCheckMsg"></span></td>
					</tr>
					<tr class="d">
						<th>이름</th>
						<td><input type="text" id="joinName" name="joinName" placeholder="이름을 입력해주세요."/></td>
					</tr>
				</tbody>
			</table>
			<span class="join_txt">블로그 정보</span>
			<table>
				<colgroup>
					<col width="150">
					<col width="450">
				</colgroup>
				<tbody>
					<tr class="e">
						<th>블로그 이름</th>
						<td><input type="text" id="blogName" name="blogName" placeholder="블로그이름을 입력해주세요."/></td>
					</tr>
				</tbody>
			</table>
			<input type="button" id="joinBtn" value="가입하기"/>
		</form>
	</div>
</div>
</body>
</html>