<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체활모 메인</title>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	//개인 주최
	$("#PmatchAdd").on("click", function(){
		$("#actionForm").attr("action", "reservation");
		$("#actionForm").submit();
	});

	//팀 주최
	$("#TmatchAdd").on("click", function(){
		$("#actionForm").attr("action", "reservation");
		$("#actionForm").submit();
	});
	
	
});
</script>
</head>
<body>
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="mem_no" name="mem_no" value="${param.mem_no}">
</form>
<input type="button" value="개인 주최" id="PmatchAdd">	
<input type="button" value="팀 주최" id="TmatchAdd">
</body>
</html>