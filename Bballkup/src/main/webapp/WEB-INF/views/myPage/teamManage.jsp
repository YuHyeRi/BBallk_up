<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지>>팀관리</title>
	<link rel="stylesheet" href="resources/css/layout/font.css">
	<link rel="stylesheet" href="resources/css/layout/basic.css">
	<link rel="stylesheet" href="resources/css/layout/btn.css">
	<link rel="stylesheet" href="resources/css/layout/loginout.css">
	<link rel="stylesheet" href="resources/css/layout/nav.css">
	<link rel="stylesheet" href="resources/css/layout/table.css">
	<link rel="stylesheet" href="resources/css/layout/searchbox.css">
	
<style type="text/css">
.paging_wrap span {
   cursor: pointer;
}
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
</head>
<body>
<header>
	<jsp:include page="../header.jsp" flush="true" />
</header>
<main>
<jsp:include page="../nav.jsp" flush="true" />
<h2>관리자페이지 >> 팀관리</h2>
팀검색<br>
<form action="#" id="actionForm" method="post">
	<input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}" >
	<input type="hidden" name="oldTxt" id="oldTxt" value="${param.searchTxt}" >
	<input type="hidden" name="page" id="page" value="${page}">
	<input type="hidden" name="mem_no" id="mem_no">
	<%-- <input type="hidden" name="tno" id="tno" value="${param.tno}"/> --%>
		
	<select name="searchGbn" id="searchGbn">
		<option value="0">팀번호</option>
		<option value="1">팀명</option>
	</select>
	<input type="button" value="검색" id="searchBtn">
</form>
<div>
	<table class="notice_table">
		<thead>
			<tr class = "nonetr">
				<th>회원번호</th>
				<th>아이디</th>
				<th>회원명</th>
				<th>가입일자</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>
<div class="paging_wrap">
</div>
</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>

<script type="text/javascript" src="resources/css/js/header.js"></script>
</body>
</html>