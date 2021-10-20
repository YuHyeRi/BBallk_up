<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<form action="#" id="actionForm" method="post">
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="no" value="${param.no}" />
</form>
<div>
	<table>
		<thead>
			<tr>
				<th>번호 :${data.NOTICE_NO} </th>
				<th>글제목 :${data.NOTICE_TITLE}</th>
				<th>작성자 :${data.MEM_NM}</th>
				<th>작성일 :${data.NOTICE_DT}</th>
				<th>조회수 :${data.NOTICE_HIT}</th>
			</tr>
		</thead>
	</table>
</div>
<div>
내용<br/>
${data.NOTICE_CON}
</div>
<c:if test="${!empty data.NOTICE_FILE}">
<div>
	<c:set var="len" value="${fn:length(data.NOTICE_FILE)}"></c:set>
	첨부파일 : 
	<a href="resources/upload/${fn:replace(fn:replace(data.NOTICE_FILE, '[', '%5B'), ']', '%5D')}" download="${fn:substring(data.NOTICE_FILE, 20, len)}">
	${fn:substring(data.NOTICE_FILE, 20, len)}
	</a>
</div>
</c:if>
<c:if test="${data.MEM_NO eq sMNo}">
	<input type="button" value="수정" id="updateBtn" />
	<input type="button" value="삭제" id="deleteBtn" />	
</c:if>
<input type="button" value="목록" id="listBtn" />
</body>
</html>