<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/layout/font.css">
	<link rel="stylesheet" href="resources/css/layout/basic.css">
	<link rel="stylesheet" href="resources/css/layout/btn.css">
	<link rel="stylesheet" href="resources/css/layout/loginout.css">
	<link rel="stylesheet" href="resources/css/layout/nav.css">
	<link rel="stylesheet" href="resources/css/layout/login.css">
	
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
				$("#loginForm").attr("action", "logins");
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
		//회원정보수정
		$("#memUpdateBtn").on("click", function(){
			location.href = "memUpdate";
			//$("#sMNo").val($(this).attr("no"));
			
			$("#loginForm").attr("action", "memUpdate");
			$("#loginForm").submit();
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
<header>
	<jsp:include page="../header.jsp" flush="true" />
</header>
<main class="mainmain">
<jsp:include page="../nav.jsp" flush="true" />
<div class="logindiv">
<form action="#" id="loginForm" method="post">
<input type="hidden" id="mem_no" name="mem_no" value="${sMNo}">
	<h2>Login</h2>
		<div class="idpassForm">
			<input type="text" id="mem_id" name="mem_id" placeholder="ID" >
			<input type="password" id="mem_pw" name="mem_pw" placeholder="PW">
		</div>
			<input type="button" value="LOG IN" id="loginBtn">
		<div class="btntext">
			Don't you have ID? <a href="join"> sign up</a>		
			<!-- <input type="button" value="회원가입" id="joinBtn"> -->
		</div>
</form>
</div>
</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>
</body>
</html>