<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀커뮤니티 메인</title>
	<link rel="stylesheet" href="resources/css/layout/font.css">
	<link rel="stylesheet" href="resources/css/layout/basic.css">
	<link rel="stylesheet" href="resources/css/layout/btn.css">
	<link rel="stylesheet" href="resources/css/layout/loginout.css">
	<link rel="stylesheet" href="resources/css/layout/nav.css">
	<link rel="stylesheet" href="resources/css/layout/table.css">
	<link rel="stylesheet" href="resources/css/layout/searchbox.css">
<style>
	body {
		min-width: 800px;
	}
	
	.hidden_wrap img {
		width: 20px;
		height: 20px;
	}
	
	.list_wrap {
		display: flex;
		align-items: center;
		background-color: rgba(240, 240, 240, 10);
		width: 100%;
		/* height: 100%; */
		height: 400px;
		min-width: 300px;
	}
	
	.list_wrap td {
		font-size: 1.2rem;
		color: black;
		width: 300px;
		height: 30px;
		text-align: center;
		background-color: rgb(210, 210, 210);
		border-radius: 10px;
	}
	
	.list_wrap td:hover {
		background-color: #e3ecfb;;
		color: white;
		cursor: pointer;
	}
	
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script>
 	$(document).ready(function() {
 		
 		// 검색버튼
 		$("#searchBtn").on("click", function() {
 			$("#oldTxt").val($("#searchTxt").val());
 			$("#actionForm").submit();
 		});
 		
 		// 검색버튼 엔터 방지
		$("#searchTxt").on("keypress", function(event) {
			if(event.keyCode == 13) {
				$("#searchBtn").click();
				return false;
			}
		});
 		
 		// 상세보기
		$(".table_list td").on("click", function() {
			
			var tno = $(this).attr('no');
			$("#tno").val(tno);
			// team_no 알림용
			// alert("tno : " + $("#tno").val());
		
			var mno = ${sMNo};
			$("#mno").val(mno);
			// mem_no 알림용
			// alert("mno : " + $("#mno").val());
			
			$("#searchTxt").val($("#oldTxt").val());
			$("#actionForm").attr("action", "tMainIntro");
			$("#actionForm").submit();
		});
 		
 	}); // doc end
 </script>	
</head>
<body>
<form action="#" id="loginForm">
<input type="hidden" id="mem_no" name="mem_no" value="${sMNo}">
</form>

	<header>
		<jsp:include page="../header.jsp" flush="true" />
	</header>
	
	<main>
		<jsp:include page="../nav.jsp" flush="true" />
		
		<h2>팀 커뮤니티</h2>
		<div class="hidden_wrap">
		<form action="#" id="actionForm" method="post">
			<img src="resources/images/zoom.png">
			<input type="text" id="searchTxt" name="searchTxt" value="${param.searchTxt}" placeholder="팀명으로 검색해보세요."/>
			<input type="hidden" id="oldTxt" value="${param.searchTxt}" />
			<input type="hidden" id="tno" name="tno" />
			<input type="hidden" id="mno" name="mno" />
			<input type="button" value="검색" id="searchBtn" />
		</form>
		</div><br><br>
		
		<div class="list_wrap">
			<c:choose>
				<c:when test="${fn:length(list) eq 0}">
					<div>등록된 팀이 없습니다.</div>
				</c:when>
				<c:otherwise>
					<c:set var="i" value="0" />
					<c:set var="j" value="5" />
					<table class="table_list">
						<c:forEach var="data" items="${list}">
							<c:if test="${i%j == 5}">
								<tr>
							</c:if>
								<td no="${data.TEAM_NO}">${data.TEAM_NM}</td>
							<c:if test="${i%j == j-1}">
								</tr>
							</c:if>
						<c:set var="i" value="${i+1}" />
						</c:forEach>
					</table>
				</c:otherwise>
			</c:choose>
		</div><br><br>
		
	</main>
	
	<footer>
		<jsp:include page="../footer.jsp" flush="true" />
	</footer>
	
	<script type="text/javascript" src="resources/css/js/header.js"></script>
</body>
</html>