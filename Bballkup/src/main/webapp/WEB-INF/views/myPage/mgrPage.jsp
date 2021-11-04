<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
	<link rel="stylesheet" href="resources/css/layout/font.css">
	<link rel="stylesheet" href="resources/css/layout/basic.css">
	<link rel="stylesheet" href="resources/css/layout/btn.css">
	<link rel="stylesheet" href="resources/css/layout/loginout.css">
	<link rel="stylesheet" href="resources/css/layout/nav.css">
	<link rel="stylesheet" href="resources/css/layout/main.css">
	<link rel="stylesheet" href="resources/css/layout/mypage.css">
	
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#login").on("click",function(){
	   $("#loginForm").attr("action","login");
	   $("#loginForm").submit();});
		      
	$("#logout").on("click", function(){
	   $("#loginForm").attr("action","logout");
	   $("#loginForm").submit();
	});

	$("#join").on("click", function(){
	   $("#loginForm").attr("action","join");
	   $("#loginForm").submit();
	});
	      
	$("#mgrpage").on("click", function(){
	   $("#loginForm").attr("action","mgrPage");
	   $("#loginForm").submit();
	});
	
	$(".memManage").on("click", function(){
		location.href="memManage";
	});
	
	$(".teamManage").on("click", function(){
		location.href="teamManage";
	});
	//패스워드변경
	$(".changePw").on("click", function(){
		$("#gbn").val("pu");
		$("#actionForm").attr("action", "pwCheckGo");
		$("#actionForm").submit();
	});
	//관리자정보수정
	$(".changeInfo").on("click", function(){
		$("#gbn").val("u");
		$("#actionForm").attr("action", "pwCheckGo");
		$("#actionForm").submit();
	});
	
});
</script>
</head>
<body>
<header>
	<jsp:include page="../header.jsp" flush="true" />
</header>
<main>
<jsp:include page="../nav.jsp" flush="true" />
<h2>관리자페이지</h2>
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="mem_no" name="mem_no" value="${param.mem_no}">
	<input type="hidden" id="mem_nm" name="mem_nm" value="${param.mem_nm}">
	<input type="hidden" id="mem_phone" name="mem_phone" value="${data.MEM_PHONE}">
	<input type="hidden" id="gbn" name="gbn" value="">
</form>
<%-- 	<input type="hidden" name="searchTxt" id="searchTxt" value="${searchTxt}" >
	<input type="hidden" name="oldTxt" id="oldTxt" value="${searchTxt}" >
	<input type="hidden" name="page" id="page" value="${page}"> --%>
<div class="mypage1">
	<div class="myphoto">
		<img src="resources/images/icon/사진.png" id="myImg" alt ="야옹이">
	</div>
	<div class="userdiv">
		 <div class="myname">
		 	<%-- <p>${param.mem_nm}</p> --%>
		 	<p>${data.MEM_NM}</p>
		 </div>
		<div class="myphone">
			<p>${data.MEM_PHONE}</p>
		</div>
	</div>
</div>
<div class="mypage2">
	<div class="mybuttons1">
		<div class="mybtn memManage">
			<img id="memManage" name="memManage" src="resources/images/icon/팀가입현황.png" type="button">
			<p>회원관리</p>
		</div>
		<div class="mybtn teamManage">
			<img id="teamManage" name="teamManage" src="resources/images/icon/팀관리.png" type="button">
            <p>팀관리</p>
		</div>
		<div class="mybtn changePw">
			<img id="changePw" name="changePw" src="resources/images/icon/패스워드변경.png" type="button">
            <p>패스워드변경</p>
		</div>
		<div class="mybtn changeInfo">
            <img id="changeInfo" name="changeInfo" src="resources/images/icon/회원정보수정.png" type="button">
            <p>관리자정보수정</p>
        </div>
	</div>
</div>
	
<!-- <input type="button" id="memManage" name="memManage" value="회원관리">
<input type="button" id="teamManage" name="teamManage" value="팀관리" style="margin-bottom:10px;"><br>
<input type="button" id="changePw" name="changePw" value="비밀번호변경">
<input type="button" id="changeInfo" name="changeInfo" value="관리자정보수정"> -->
</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>
<script type="text/javascript" src="resources/css/js/header.js"></script>
</body>
</html>