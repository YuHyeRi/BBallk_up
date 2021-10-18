<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#loginBtn").on("click", function(){
			if(checkVal("#mem_id")){
				alert("아이디를 입력해주세여");
				$("#mem_id").focus();
				
			}else if(checkVal("#mem_pw")){
				alert("비밀번호를 입력해주세여");
				$("#mem_pw").focus();
			}else{
				$("#loginForm").submit();
			}
			
		});
		$("#pw").on("keypress", function(){
			if(event.keyCode == 13){
				$("#loginBtn").click();
				return false;
			}
		});
		
		//가입
		$("#joinBtn").on("click", function(){
			
			location.href="join";
		});
		//로그아웃
		$("#logoutBtn").on("click", function(){
			location.href = "logout";
		});
	});
	
	//값이 들어있는지 체크
	function checkVal(sel){
		if($.trim($(sel).val()) == ''){
			return true;
		}else{
			return false;
		}
	}
	
	
</script>
</head>
<body>
<div>
	<c:choose>
		<c:when test="${empty sMId }">
			<form action="logins" id="loginForm" method="post">
				아이디 : <input type="text" id="mem_id" name="mem_id" ><br>
				비밀번호 : <input type="password" id="mem_pw" name="mem_pw" >
			</form>
			<input type="button" value="로그인" id="loginBtn">
			<input type="button" value="회원가입" id="joinBtn">
		</c:when>
		<c:otherwise>
			${sMNm}님 어서오세오.  <input type="button" value="로그아웃" id="logoutBtn">
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>