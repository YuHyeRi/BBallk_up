<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<link rel="stylesheet" href="resources/css/layout/login.css">
	
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		//회원정보수정
		$("#memUpdateBtn").on("click", function(){
			//alert("???");
			var chPw = $("#pwCheck").val();
			
				var params = $("#pwCheckForm").serialize();
				
				$.ajax({
					url : "memPwCheckAjax",
					type : "post",
					dataType : "json",
					data : params,
					success : function(res){
						if(res.data.MEM_PW == chPw){

							$("#pwCheckForm").attr("action", "memUpdate");
							$("#pwCheckForm").submit();
						}else{
							alert("틀린 비밀번호 입니다.");
						}
					},
					error : function(request, status, error){
						console.log(error);
					}
				});
		});
	});
	
	//값이 들어있는지 체크
	function checkVal(sel){
		if($.trim($(sel).val()) == ''){
			return true;
		}else{
			return false;
		}
	}
	
	
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
<div class="mainmain">
<div class="logindiv">
<form action="#" id="pwCheckForm" method="post">
	<input type="hidden" id="gbn" name="gbn" value="${param.gbn}">
	<input type="hidden" id="mem_no" name="mem_no" value="${sMNo}">
	<div class="idpassForm">
	<br><br>비밀번호 확인<br><br><input type="password" id="pwCheck" name="pwCheck" ><br>
	</div>
	<input type="button" value="정보수정" id="memUpdateBtn">
</form>
</div>
</div>
</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>
<script type="text/javascript" src="resources/css/js/header.js"></script>
</body>
</html>