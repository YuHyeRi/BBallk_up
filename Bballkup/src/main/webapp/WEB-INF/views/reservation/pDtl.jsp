<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 체육활동 모집 상세</title>
	<link rel="stylesheet" href="resources/css/layout/font.css">
	<link rel="stylesheet" href="resources/css/layout/basic.css">
	<link rel="stylesheet" href="resources/css/layout/btn.css">
	<link rel="stylesheet" href="resources/css/layout/loginout.css">
	<link rel="stylesheet" href="resources/css/layout/nav.css">
	<link rel="stylesheet" href="resources/css/layout/table.css">
	<link rel="stylesheet" href="resources/css/layout/myCard.css">
<style>
#list, #del{
	background-color: white;
    padding: 5px;
    width: 80px;
    border-radius: 5px;
    border: 2px solid #1d2088;
    cursor: pointer;
}
#attend{
	background-color: white;
    padding: 5px;
    width: 100px;
    height:50px;
    border-radius: 5px;
    border: 2px solid #1d2088;
    font-size: medium;
	cursor:pointer;
}
#attend:hover, #list:hover, #del:hover {
	background-color:#e3ecfb;
}
.attendDiv{
	text-align:center;
}
.dtlBtn{
	margin-top:50px;
}
#del{
	float:right;
}
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script>
$(document).ready(function() {
	
	$("#list").on("click", function() {
		location.href="pList";
	});
	
	$("#login").on("click",function(){
	   $("#loginForm").attr("action","login");
	   $("#loginForm").submit();
	});
		      
	$("#logout").on("click", function(){
	   $("#loginForm").attr("action","logout");
	   $("#loginForm").submit();
	});
	      
	$("#mypage").on("click", function(){
	   $("#loginForm").attr("action","myPage");
	   $("#loginForm").submit();
	});

	$("#mgrpage").on("click", function(){
	   $("#loginForm").attr("action","mgrPage");
	   $("#loginForm").submit();
	});	
	
	$("#attend").on("click", function(){
		$("#actionForm").attr("action", "pAttend");
		$("#actionForm").submit();
	});
	
	$("#del").on("click", function(){
		if(confirm("경기를 취소하시겠습니까?")) {
			var params = $("#actionForm").serialize();
			
			$.ajax({
				url: "matchDeletes",			
				type: "post",
				dataType: "json",
				data: params,
				success: function(res) {
					if(res.result == "success") {
						alert("경기를 취소하였습니다.");
						location.href = "pList";
					} else if(res.result == "failed") {
						alert("경기취소에 실패 하였습니다.");
					} else {
						alert("경기취소 중 문제가 발생하였습니다.");
					}
				},
				error: function(request, status, error) {
					console.log(error);
				}
			});
		}
	})
});

function checkVal(sel){
	if($.trim($(sel).val()) == ""){
		return true;
	} else {
		return false;
	}
}
</script>
</head>
<body>
<form action="#" id="loginForm">
<input type="hidden" name="mem_no" value="${sMNo}">
</form>
<header>
	<jsp:include page="../header.jsp" flush="true" />
</header>

<main>
<jsp:include page="../nav.jsp" flush="true" />
<div class="cardBig">
<div class="addDiv">
<h2>개인 체육활동 참가모집 상세페이지</h2>
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="mem_no" name="mem_no" value="${sMNo}">
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="match_no" value="${param.match_no}" />
	<input type="hidden" id="match_dday" name="match_dday" value="${data.MATCH_DDAY}">
	<input type="hidden" id="sport_nm" name="sport_nm" value="${data.SPORT_NM}">
	<input type="hidden" id="place_nm" name="place_nm" value="${data.PLACE_NM}">
	<input type="hidden" id="match_pay" name="match_pay" value="${data.MATCH_PAY}">
</form>
<br>
[참가모집 게시글 상세]
<br><br>
▶ 경기일 : ${data.MATCH_DDAY}<br><br>	
▶ 시설명 : ${data.SPORT_NM}<br><br>
▶ 장소 : ${data.PLACE_NM}<br><br>
▶ 총 시설 이용료는 ${data.MATCH_PAY}원이며, 참가 인원에 따라 균등하게 분할 계산되어 청구됩니다.<br>
<br><br>
[작성자 게시글]<br><br>
▶ ${data.MATCH_CON}<br><br>
<c:choose>
	<c:when test="${sMNo != 4 && sMNo != data.MEM_NO}"><!-- 작성자 제외 -->
		<c:choose>
			<c:when test="${attCnt eq 1}">
				<div class="attendDiv">
					<p>이미 참가신청이 완료되었습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<div class="attendDiv">
					<input type="button" id="attend" name="attend" value="참가하기"><br>
				</div>
			</c:otherwise>
		</c:choose>
		<div class="dtlBtn">
			<input type="button" id="list" name="list" value="목록으로">
		</div>
	</c:when>
	<c:when test="${sMNo == 4}"><!-- 관리자 -->
		<div class="dtlBtn">
			<input type="button" id="list" name="list" value="목록으로">
			<input type="button" id="del" name="del" value="경기취소">
		</div>
	</c:when>
	<c:otherwise>
		<div class="dtlBtn"><!-- 글 작성자 -->
			<input type="button" id="list" name="list" value="목록으로">
			<input type="button" id="del" name="del" value="경기취소">
		</div>
	</c:otherwise>
</c:choose>

</div>
</div>
</main>

<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>

<script type="text/javascript" src="resources/css/js/header.js"></script>
</body>
</html>