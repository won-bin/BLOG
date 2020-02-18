<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="resources/css/blog/blog.css" />
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#loginBtn").on("click", function() {
		if($("#loginId").val() == "") {
			alert("아이디를 입력하세요");
			$("#loginId").focus();
		} else if($("#loginPw").val() == "") {
			alert("비밀번호를 입력하세요");
			$("#loginPw").focus();
		} else {
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "loginAjax",
				datatype : "json",
				data : params,
				success : function(result) {
					if(result.res == "SUCCESS"){
						var referrer =  document.referrer;
						if(referrer == "http://localhost:8090/SampleSpring/main") {
							location.href = "main";					
						}else if(referrer == "http://localhost:8090/SampleSpring/list") {
							location.href = "list";
						}else{
							location.href = "list";
						}
					} else {
						alert("로그인에 실패하였습니다.");
					}
				},
				error : function(request, status, error) {
					console.log("error : " + error);
				}
			});
		}
	});
	
	$("#loginJoinBtn").on("click", function() {
		location.href = "join";
	});
});
</script>
</head>
<body>
<div class="login_bg">
	<div class="login_area">
		<div class="login_title_txt">LOGIN</div>
		<form action="#" method="post" id="actionForm">
			<input type="text" id="loginId" name="loginId" placeholder="ID"/><br/>
			<input type="password" id="loginPw" name="loginPw" placeholder="Password"/>
			<input type="button" id="loginBtn" value="로그인" />
			<span class="login_txt">회원이 아니신가요?</span>
			<input type="button" id="loginJoinBtn" value="회원가입" />
		</form>
	</div>
</div>
</body>
</html>