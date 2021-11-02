<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지-팀가입현황</title>
	<link rel="stylesheet" href="resources/css/layout/font.css">
	<link rel="stylesheet" href="resources/css/layout/basic.css">
	<link rel="stylesheet" href="resources/css/layout/btn.css">
	<link rel="stylesheet" href="resources/css/layout/loginout.css">
	<link rel="stylesheet" href="resources/css/layout/nav.css">
	<link rel="stylesheet" href="resources/css/layout/login.css">
	<link rel="stylesheet" href="resources/css/layout/memupdate.css">
	
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
}); //document end

</script>
</head>
<body>
<header>
	<jsp:include page="../header.jsp" flush="true" />
</header>
<main class="mainmain">
<jsp:include page="../nav.jsp" flush="true" />
	<form action="#" id="mTeamJoninForm" method="post">
		<table>
			<thead>
				<tr>
					<th>팀명</th>
					<th>회원등급</th>
					<th>승인여부</th>
				</tr>
			</thead>
		</table>
	</form>
</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>
</body>
</html>