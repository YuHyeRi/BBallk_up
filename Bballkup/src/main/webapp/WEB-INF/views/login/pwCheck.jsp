<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<div>
<form action="#" id="pwCheckForm" method="post">
	<input type="hidden" id="gbn" name="gbn" value="${param.gbn}">
	<input type="hidden" id="mem_no" name="mem_no" value="${sMNo}">
	비밀번호 확인 : <input type="password" id="pwCheck" name="pwCheck" ><br>
	<input type="button" value="정보수정" id="memUpdateBtn">
</form>
</div>
</body>
</html>