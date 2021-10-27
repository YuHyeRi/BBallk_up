<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="resources/css/layout/T_board.css">

<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#tab2").on("click", function(){
		$("#actionForm").attr("action", "T_notice");
		$("#actionForm").submit();
	});
	$("#tab4").on("click", function(){
		$("#actionForm").attr("action", "tFreeList");
		$("#actionForm").submit();
	});
	$("#tab1").on("click", function(){
		$("#actionForm").attr("action", "T_teammozip");
		$("#actionForm").submit();
	});
	$("#tab3").on("click", function(){
		$("#actionForm").attr("action", "T_oneline");
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
<jsp:include page="../T_board.jsp" flush="true" />
<div class="tabcontent">
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="tab" value="${sNMo}" />
	
</form>
</div>
</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>
</body>
</html>