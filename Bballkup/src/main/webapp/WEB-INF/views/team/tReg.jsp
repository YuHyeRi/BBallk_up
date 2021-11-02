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
<style>
	.total_wrap {
		width: 100%;
		height: 400px;
		background-color: rgba(240, 240, 240, 10);
		min-width: 300px;
	}
	#backBtn:hover{
		background-color: #e3ecfb;
    	cursor: pointer;
	}
	#regBtn {
		width: 100px;
		height: 40px;
		background-color: rgb(210, 210, 210);
		border-radius: 10px 10px;
	}
	
	#regBtn:hover {
		background-color: #1d2088;
		color: white;
		cursor: pointer;
	}
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script>
	$(document).ready(function() {
		
		// 가입신청 버튼
		$("#regBtn").on("click", function() {
			if(confirm("가입신청을 하시겠습니까?")) {
				$("#regForm").submit();
				alert("정상적으로 가입신청이 되었습니다.");
			} else {
				history.go();
			}
		});
		
		// 뒤로가기 버튼
		$("#backBtn").on("click", function() {
			history.back();
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
		
	<input type="button" id="backBtn" value="뒤로가기" /><br><br>
	<div class="total_wrap">
		<form action="tRegs" id="regForm" method="post">
			<input type="hidden" name="tno" id="tno" value="${param.tno}"/>
			<input type="hidden" name="mno" id="mno" value="${param.mno}" />
			팀명 : ${param.tnm}<br><br>
			아이디 : ${sMId}<br><br>
			이름 : ${sMNm}<br><br>
			※ 입력된 개인정보가 다를 경우 마이페이지에서 수정 후 다시 팀가입신청을 해주세요.<br>
			※ 가입신청 후 해당 팀장 승인 후 최종 가입완료 처리 됩니다.<br><br>
		</form>
			<input type="button" id="regBtn" value="가입신청" />
	</div>
	
	</main>
	<br><br>
	
	<footer>
		<jsp:include page="../footer.jsp" flush="true" />
	</footer>
	
	<script type="text/javascript" src="resources/css/js/header.js"></script>
</body>
</html>