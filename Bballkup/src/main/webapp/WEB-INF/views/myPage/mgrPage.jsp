<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<style>
#myImg{
	padding-bottom:20px;
}
.myInfo{
	display:flex;
}
.userdiv{
	margin-top:50px;
	padding-left:10px;
}
</style>
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
	
	$("#memManage").on("click", function(){
		location.href="memManage";
	});
});
</script>
</head>
<body>
<h2>마이페이지</h2>
<form action="#" id="loginForm" method="post">
   <input type="hidden" id="mem_no" name="mem_no" value="${sMNo}">
</form>
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="mem_no" name="mem_no" value="${param.mem_no}">
	<input type="hidden" id="mem_nm" name="mem_nm" value="${param.mem_nm}">
	<input type="hidden" id="mem_phone" name="mem_phone" value="${data.MEM_PHONE}">
<%-- 	<input type="hidden" name="searchTxt" id="searchTxt" value="${searchTxt}" >
	<input type="hidden" name="oldTxt" id="oldTxt" value="${searchTxt}" >
	<input type="hidden" name="page" id="page" value="${page}"> --%>
	<div class="myInfo">
		<img src ="resources/images/kitty.png" id="myImg" alt ="야옹이">
		<div class="userdiv">
			${param.mem_nm}<br>
			${data.MEM_PHONE}<br>
		</div>
	</div>
</form>
<input type="button" id="memManage" name="memManage" value="회원관리">
<input type="button" id="teamManage" name="teamManage" value="팀관리" style="margin-bottom:10px;"><br>
<input type="button" id="changePw" name="changePw" value="비밀번호변경">
<input type="button" id="changeInfo" name="changeInfo" value="관리자정보수정">
</body>
</html>