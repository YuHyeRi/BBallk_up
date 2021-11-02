<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
	$("#myCard").on("click", function(){
		$("#actionForm").attr("action", "myCard");
		$("#actionForm").submit();
	});
});
</script>
</head>
<body>
<h2>마이페이지</h2>
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="mem_no" name="mem_no" value="${param.mem_no}">
	<input type="hidden" id="mem_nm" name="mem_nm" value="${param.mem_nm}">
	<input type="hidden" id="mem_phone" name="mem_phone" value="${data.MEM_PHONE}">
	<div class="myInfo">
		<img src ="resources/images/kitty.png" id="myImg" alt ="야옹이">
		<div class="userdiv">
			${param.mem_nm}<br>
			${data.MEM_PHONE}<br>
		</div>
	</div>
</form>
<input type="button" id="myCard" name="myCard" value="카드등록">
<input type="button" id="myTeam" name="myTeam" value="팀가입현황">
<input type="button" id="myWrite" name="myWrite" value="내가 쓴 게시글" style="margin-bottom:10px;"><br>
<input type="button" id="myReserve" name="myReserve" value="나의 예약내역">
<input type="button" id="myInfo" name="myInfo" value="회원정보수정">
<input type="button" id="myPw" name="myPw" value="비밀번호변경">
</body>
</html>