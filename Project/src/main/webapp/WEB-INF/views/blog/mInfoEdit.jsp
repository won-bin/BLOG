<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" type="text/css" href="resources/css/blog/blog.css" />
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js" ></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#exitBtn").on("click", function() {
		if(confirm("정말 탈퇴하시겠습니까")){
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type: "post",
				url: "exitAjax",
				datatype: "json",
				data: params,
				success: function(result) {
					if(result.res == "SUCCESS"){
						alert("탈퇴 되었습니다.");
						location.href = "mLogout";
					} else {
						alert("탈퇴에 실패하였습니다.");
					}
				},
				error: function(error) {
					console.log("error : " + error);
				}
			});
		}
	});
	
	$("#bmPwCheck").on("focusout", function() {
		if($("#bmPw").val() != $("#bmPwCheck").val()) {
			$("#PwTxt").html("비밀번호가 일치하지 않습니다.");
		}else {
			$("#PwTxt").html("일치");
		}
	});
	
	$("#mEditBtn").on("click", function() {
		if($.trim($("#bmNm").val()) == ""){
			alert("이름을 입력해주세요");
			$("#bmNm").focus();
		} else if($.trim($("#bmBn").val()) == ""){
			alert("블로그 이름을 입력해주세요");
			$("#bmBn").focus();
		} else{
			if($("#bmPw").val() != $("#bmPwCheck").val()) {
				$("#PwTxt").html("비밀번호가 일치하지 않습니다.");
			}else {
				var params = $("#actionForm").serialize();
				
				$.ajax({
					type: "post",
					url: "editAjax",
					datatype: "json",
					data: params,
					success: function(result) {
						if(result.res == "SUCCESS"){
							alert("수정 되었습니다.");
						} else {
							alert("수정에 실패하였습니다.");
						}
					},
					error: function(error) {
						console.log("error : " + error);
					}
				});
			}
		}
	});
	
	$("#mCancleBtn").on("click", function() {
		var referrer =  document.referrer;
		if(referrer == "http://localhost:8090/SampleSpring/main") {
			location.href = "main";					
		}else if(referrer == "http://localhost:8090/SampleSpring/list") {
			location.href = "list";
		}else{
			location.href = "list";
		}
	});
	
	$("#pwBtn").on("click", function() {
		$(".pw_edit_area").css("display", "inline-block");
		$("#pwBtn").css("display", "none");
	});
	
	$("#pwCancleBtn").on("click", function() {
		$("#bmPwCheck, #bmPw").val("");
		$("#PwTxt").html("");
		$(".pw_edit_area").css("display", "none");
		$("#pwBtn").css("display", "inline-block");
	});
	
	$("#pwEditBtn").on("click", function() {
		if($.trim($("#bmPw").val()) == ""){
			alert("비밀번호를 입력해주세요");
			$("#bmPw").focus();
		} else if($.trim($("#bmPwCheck").val()) == ""){
			alert("비밀번호를 한번더 입력해주세요");
			$("#bmPwCheck").focus();
		} else {
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type: "post",
				url: "pwEditAjax",
				datatype: "json",
				data: params,
				success: function(result) {
					if(result.res == "SUCCESS"){
						alert("수정 되었습니다.");
						$("#pwCancleBtn").click();
					} else {
						alert("수정에 실패하였습니다.");
					}
				},
				error: function(error) {
					console.log("error : " + error);
				}
			});
		}
	})
});
</script>
</head>
<body>
<div class="mInfo_edit_area">
	<span class="mInfo_title">회원정보 수정 </span>
	<span id="exitBtn">회원탈퇴</span>
	<form action="#" method="post" id="actionForm">
		<input type="hidden" id="bmNo" name="bmNo" value="${sBmNo}" />
		<table class="mInfo_edit_table">
			<tbody>
				<colgroup>
					<col width="200px" />
					<col width="500px" />
				</colgroup>
				<tr>
					<th>회원번호</th>
					<td>${sBmNo}</td>	
				</tr>
				<tr>
					<th>아이디</th>
					<td>${sBmId}</td>	
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" id="bmNm" name="bmNm" value="${sBmNm}" /></td>
				</tr>
				<tr>
					<th>블로그이름</th>
					<td><input type="text" id="bmBn" name="bmBn" value="${sBmBn}" /></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="button" id="pwBtn" value="변경" /> <br/>
						<div class="pw_edit_area">
							비밀번호<br/><input type="password" id="bmPw" name="bmPw"/> <br/><br/>
							비밀번호 확인<br/> <input type="password" id="bmPwCheck"/> <br/>
							<span id="PwTxt"></span><br/>
							<input type="button" id="pwEditBtn" value="변경"/>
							<input type="button" id="pwCancleBtn" value="취소" /> <br/>	
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	<input type="button" id="mCancleBtn" value="취소" />
	<input type="button" id="mEditBtn" value="수정" />
</div>
</body>
</html>