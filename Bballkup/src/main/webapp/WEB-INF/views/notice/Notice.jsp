<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<link rel="stylesheet" href="resources/css/layout/table.css">
	<link rel="stylesheet" href="resources/css/layout/searchbox.css">

<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#listBtn").on("click", function(){
		$("#actionForm").attr("action", "NoticeList");
		$("#actionForm").submit();
	});
	
	$("#updateBtn").on("click", function(){
		$("#actionForm").attr("action", "NoticeUpdate");
		$("#actionForm").submit();
	});
	
	$("#mainlistBtn").on("click", function(){
		location.href="NoticeList";
	});
	$("#mainbtn").on("click", function(){
		history.back();
	});
	
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
	
	$("#mgrpage").on("click", function(){
		$("#loginForm").attr("action","mgrPage");
		$("#loginForm").submit();
	});
	
	$("#deleteBtn").on("click", function(){
		if(confirm("삭제하시겠습니까?")){
			var params = $("#actionForm").serialize();
			
			$.ajax({ 
				url: "NoticeDeletes",
				type: "post", 
				dataType: "json", 
				data: params, 
				success: function(res){ 
					if(res.result == "success"){
						location.href = "NoticeList"
					}else if(res.result == "failed"){
						alert("삭제에 실패하였습니다.");
					}else{
						alert("삭제중 문제가 발생했습니다.");
					}
				},
				error: function(request, status, error){
					console.log(error);
				}
			});
		}
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
<form action="#" id="loginForm" method="post">
	<input type="hidden" id="mem_no" name="mem_no" value="${sMNo}">
</form>

<form action="#" id="actionForm" method="post">
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="no" value="${param.no}" />
</form>
<div>
	<table class="notice_table">
		<thead>
			<tr>
				<th>${data.NOTICE_NO} </th>
				<th class="title">${data.NOTICE_TITLE}</th>
				<th>${data.MEM_NM}</th>
				<th>${data.NOTICE_DT}</th>
				<th>${data.NOTICE_HIT}</th>
			</tr>
		</thead>
	</table>
</div>
<div class="divcon">
	<div>
		<br/>
		${data.NOTICE_CON}
	</div>
	<c:if test="${!empty data.NOTICE_FILE}">
	<div>
		<br><br>
		<hr>
		<c:set var="len" value="${fn:length(data.NOTICE_FILE)}"></c:set>
		첨부파일 : 
		<a href="resources/upload/${fn:replace(fn:replace(data.NOTICE_FILE, '[', '%5B'), ']', '%5D')}" download="${fn:substring(data.NOTICE_FILE, 20, len)}">
		${fn:substring(data.NOTICE_FILE, 20, len)}
		</a>
	</div>
	</c:if>
	<div class="buttondiv">
		<c:if test="${data.MEM_NO eq sMNo}">
			<input type="button" value="수정" id="updateBtn" />
			<input type="button" value="삭제" id="deleteBtn" />	
		</c:if>
		<c:choose>
			<c:when test="${!empty param.searchGbn}">
				<input type="button" value="목록" id="listBtn" />
			</c:when>
			<c:otherwise>
				<input type="button" value="메인으로" id="mainbtn">
				<input type="button" value="목록" id="mainlistBtn" />
			</c:otherwise>
		</c:choose>
	</div>
</div>
</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>
</body>
</html>