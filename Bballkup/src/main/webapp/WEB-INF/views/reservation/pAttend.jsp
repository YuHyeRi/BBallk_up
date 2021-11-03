<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참가신청</title>
<link rel="stylesheet" href="resources/css/layout/font.css">
<link rel="stylesheet" href="resources/css/layout/basic.css">
<link rel="stylesheet" href="resources/css/layout/btn.css">
<link rel="stylesheet" href="resources/css/layout/loginout.css">
<link rel="stylesheet" href="resources/css/layout/nav.css">
<link rel="stylesheet" href="resources/css/layout/main.css">
<link rel="stylesheet" href="resources/css/layout/myCard.css">

<style type="text/css">
.addCon{
	text-align: left;
}
</style>
<script src="resources/script/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
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
	      
	$("#mypage").on("click", function(){
	   $("#loginForm").attr("action","myPage");
	   $("#loginForm").submit();
	});
		
	$("#cancelBtn").on("click", function(){
		history.back();
	});
 	
	$("#addBtn").on("click", function(){
	
		var params = $("#addForm").serialize();
		
		$.ajax({
			url : "pAttends",
			type : "post",
			dataType : "json",
			data : params,
			success : function(res){
				if(res.result == "success"){
					alert("참가신청이 완료되었습니다.");
					$("#addForm").attr("action","pDtl");
					$("#addForm").submit();
					
				}else if(res.result == "failed"){
					alert("참가신청에 실패했습니다.");
					
				}else{
					alert("참가신청 중 문제가 발생했습니다.");
				}
			},
			error : function(request, status, error){
				console.log(error);
			}
		});
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
<main>
<jsp:include page="../nav.jsp" flush="true" />
<div class="cardBig">
<div class="addDiv">
<form action="#" id="loginForm" method="post">
   <input type="hidden" name="mem_no" value="${sMNo}">
</form>
	<div class = "addCon">
	<h2>체육활동 참가신청</h2>
				<br>
				<br>
▶ 경기일 : ${param.match_dday}<br><br>	
▶ 시설명 : ${param.sport_nm}<br><br>
▶ 장소 : ${param.place_nm}<br><br>
▶ 총 시설 이용료는 ${param.match_pay}원이며, 참가 인원에 따라 균등하게 분할 계산되어 청구됩니다.<br>
	</div>
<form action="#" id="addForm" method="post">
	<input type="hidden" id="match_no" name="match_no" value="${param.match_no}">
	<input type="hidden" id="mem_no" name="mem_no" value="${sMNo}">
</form>
<div class = "addBtn">
	<input type="button" value="취소" id="cancelBtn">
	<input type="button" value="참가신청" id="addBtn">
</div>
</div>
</div>
</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>
</body>
</html>