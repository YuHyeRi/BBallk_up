<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#pwQ{
		display: none;
	}
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#cancleBtn").on("click", function(){
			
			history.back();
		});
		//찾기버튼
		$("#findPwBtn").on("click", function(){
			
			
			if(checkVal("#mem_id")){
				
				alert("아이디를 입력하세요.");
				$("#mem_id").focus();
				
			}else if(checkVal("#mem_nm")){
				
				alert("이름을 입력하세요.");
				$("#mem_nm").focus();
				
			}else{

				var params = $("#findPwForm").serialize();
				
				$.ajax({
					url : "memPWCntCheckAjax",
					type : "post",
					dataType : "json",
					data : params,
					success : function(res){
						if(res.cnt > 0){

							$("#pwQ").css("display", "block");
							$("#btnDiv").css("display", "none");
							
						}else{
							alert("아이디가 없습니다.");
						}
					},
					error : function(request, status, error){
						console.log(error);
					}
				});
			}
		});
		
		//재설정 버튼
		$("#updatePwBtn").on("click", function(){
			
			
			if(checkVal("#mem_id")){
				
				alert("아이디를 입력하세요.");
				$("#mem_id").focus();
				
			}else if(checkVal("#mem_nm")){
				
				alert("이름을 입력하세요.");
				$("#mem_nm").focus();
				
			}else if(checkVal("#mem_pwa")){
				
				alert("비밀번호 확인용 답변을 입력하세요.");
				$("#mem_pwa").focus();
				
			}else{

				var params = $("#findPwForm").serialize();
				
				$.ajax({
					url : "memPWAllCheckAjax",
					type : "post",
					dataType : "json",
					data : params,
					success : function(res){
						if(res.cnt > 0){
							
							$("#mem_no").val(res.data.MEM_NO);
							//alert("변경"+$("#mem_no").val());
							$("#findPwForm").attr("action", "memUpdate");
							$("#findPwForm").submit(); 
							
						}else{
							alert("틀린정보입니다.");
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
	<form action="#" id="findPwForm" method="post">
		<input type="hidden" name="gbn" value="pu"> 
		<input type="hidden" name="mem_no" id="mem_no" value="${data.MEM_NO}" >
		아이디<br> 
			<input type="text" id="mem_id" name="mem_id" placeholder="아이디입력(영문,숫자조합 5글자 이상)">
			<span id="check"></span><br><br>
		이름<br> 
			<input type="text" id="mem_nm" name="mem_nm" placeholder="이름입력(2자 이상)"><br><br>
		<div id="pwQ">
		비밀번호 확인용 질문<br>
			<select name="mem_pw_gbn" id="mem_pw_gbn">
				<option value="1">출신 초등학교는 어디인가요?</option>
				<option value="2">가장 존경하는 인물은 누구인가요?</option>
				<option value="3">자신의 보물제1호는 무엇인가요?</option>
				<option value="4">인상깊게 읽은 책은 무엇인가요?</option>
			</select><br>
		비밀번호 확인용 답변<br>
			<input type="text" id="mem_pwa" name="mem_pwa" placeholder="답변"><br><br>
			<br><br>
			<input type="button" value="재설정" id="updatePwBtn">
		</div>
	</form>
	<br><br>
	<div id="btnDiv">
	<input type="button" value="확인" id="findPwBtn">
	<input type="button" value="취소" id="cancleBtn">
	</div>
</body>
</html>