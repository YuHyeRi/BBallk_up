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
	<link rel="stylesheet" href="resources/css/layout/login.css">
	<link rel="stylesheet" href="resources/css/layout/memupdate.css">

<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var selectVal = '${data.MEM_PW_GBN}';
		var radioVal = '${data.MEM_GEN}';
		$('select#mem_pw_gbn option[value=' + selectVal + ']').attr('selected', 'selected');
		//$('radio.mem_gen option[value=' + selectVal + ']').attr('selected', 'selected');
		if(radioVal=='F'){
			$("#mem_genF").attr("checked", "checked");
		}else{
			$("#mem_genM").attr("checked", "checked");
		}
		
		$("#cancleBtn").on("click", function(){
			history.back();
		});
		
		$("#logout").on("click", function(){
			$("#loginForm").attr("action","logout");
			$("#loginForm").submit();
		});
		
		$("#mypage").on("click", function(){
			$("#loginForm").attr("action","Mypage");
			$("#loginForm").submit();
		});
		
		
		$("#updateBtn").on("click", function(){
			if(checkVal("#mem_phone")){
				
				alert("핸드폰번호를 입력하세요.");
				$("#mem_phone").focus();
				
			}else if(checkVal("#mem_pwa")){
				
				alert("비밀번호 확인용 답변을 입력하세요.");
				$("#mem_pwa").focus();
				
			}else{
				var params = $("#mUpdateForm").serialize();
				
				$.ajax({
					url : "memCUDAjax",
					type : "post",
					dataType : "json",
					data : params,
					success : function(res){
						if(res.result == "success"){
							
							location.href = "login";
							
						}else if(res.result == "feiled"){
							
							alert("작성에 실패했습니다.");
							
						}else{
							alert("작성중 문제가 발생했습니다.")
						}
					},
					error : function(request, status, error){
						console.log(error);
					}
				});
			}
		});
		
		//탈퇴
		$("#deleteBtn").on("click", function(){
			if(confirm("탈퇴하시겠습니까?")){
				var params = $("#mDeleteForm").serialize();
				
				$.ajax({
					url : "memCUDAjax",
					type : "post",
					dataType : "json",
					data : params,
					success : function(res){
						if(res.result == "success"){
							
							location.href = "login";
							
						}else if(res.result == "feiled"){
							
							alert("탈퇴에 실패했습니다.");
							
						}else{
							alert("탈퇴중 문제가 발생했습니다.")
						}
					},
					error : function(request, status, error){
						console.log(error);
					}
				});
			}
		});
	});//d
	
	
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
<header>
	<jsp:include page="../header.jsp" flush="true" />
</header>
<main>
<jsp:include page="../nav.jsp" flush="true" />
<div class="mainmain">
<div class="memdiv">
	<form action="#" id="mUpdateForm" method="post">
		<input type="hidden" name="gbn" value="u" >
		<input type="hidden" name="mem_no" value="${data.MEM_NO}" >
		아이디<br> 
			${sMId}<br><br>
		이름<br> 
			${sMNm}<br><br>
		생년월일<br>
			${data.MEM_BD}<br><br>
		핸드폰<br> 
			<input type="text" id="mem_phone" name="mem_phone" value="${data.MEM_PHONE}" placeholder="010-0000-0000"><br><br>
		성별<br>
			여자<input type="radio" class="mem_gen" name="mem_gen" id="mem_genF" value="F">
			남자<input type="radio" class="mem_gen" name="mem_gen" id="mem_genM" value="M"><br><br>			
		비밀번호 확인용 질문<br>
			<select name="mem_pw_gbn" id="mem_pw_gbn">
				<option value="1">출신 초등학교는 어디인가요?</option>
				<option value="2">가장 존경하는 인물은 누구인가요?</option>
				<option value="3">자신의 보물제1호는 무엇인가요?</option>
				<option value="4">인상깊게 읽은 책은 무엇인가요?</option>
			</select><br><br>
		비밀번호 확인용 답변<br>
			<input type="text" id="mem_pwa" name="mem_pwa" value="${data.MEM_PWA}" placeholder="답변"><br><br>
	</form>
	<form action="#" id="mDeleteForm" method="post">
		<input type="hidden" name="gbn" value="d" >
		<input type="hidden" name="mem_no" value="${data.MEM_NO}" >
	</form>
	<form action="#" id="loginForm" method="post">
	<input type="hidden" id="logno" name="logno" value="${sMNo}">
	<input type="hidden" id="mem_no" name="mem_no" value="${sMNo}">
	</form>
	<div class="membtns">
		<input type="button" value="수정" id="updateBtn">
		<input type="button" value="탈퇴" id="deleteBtn">
		<input type="button" value="취소" id="cancleBtn">
	</div>
</div>
</div>	
</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>
</body>
</html>