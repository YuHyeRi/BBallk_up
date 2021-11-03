<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용가이드</title>
	<link rel="stylesheet" href="resources/css/layout/font.css">
	<link rel="stylesheet" href="resources/css/layout/basic.css">
	<link rel="stylesheet" href="resources/css/layout/btn.css">
	<link rel="stylesheet" href="resources/css/layout/loginout.css">
	<link rel="stylesheet" href="resources/css/layout/nav.css">
	<link rel="stylesheet" href="resources/css/layout/siteplan.css">
<style>
	body {
		text-align: center;
	}

	.total-area img {
		width: auto;
		height: 500px;
	}

	.area-1 {
	 
	}
	
	.area-2 {
	
	}
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#login").on("click",function(){
			$("#loginForm").attr("action","login");
			$("#loginForm").submit();
		});
				
		$("#logout").on("click", function(){
			$("#loginForm").attr("action","logout");
			$("#loginForm").submit();
		});
		
		$("#join").on("click", function(){
			$("#loginForm").attr("action","join");
			$("#loginForm").submit();
		});
				
		$("#mypage").on("click", function(){
			$("#loginForm").attr("action","Mypage");
			$("#loginForm").submit();
		});
		
		
	}); // doc end
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
	
	<div class="total-area">
		<div class="area-1">
			<h2>내가 만드는 매치!</h2>
			<div><img src="resources/images/used_sport2.jpg"></div>
			<p>개인 커뮤니티에서는 개인끼리 경기를 주최하고</p>
			<p>개인끼리 경기를 할 수 있습니다 !</p>
		</div>
		<br><br><br>
		<div class="area-2">
			<h2>내가 하고 싶은 사람들과!</h2>
			<div><img src="resources/images/used_sport.jpg"></div>
			<p>팀 커뮤니티에서는 팀끼리 경기를 주최하고</p>
			<p>팀끼리 경기를 할 수 있습니다 !</p>
		</div>
	</div>
</main><br><br><br>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>
</body>
</html>