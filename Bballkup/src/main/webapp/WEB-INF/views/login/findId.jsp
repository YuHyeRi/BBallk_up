<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
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
		
		$("#cancleBtn").on("click", function(){
			
			history.back();
		});
		
		$("#findBtn").on("click", function(){
			
			if(checkVal("#mem_nm")){
				
				alert("이름을 입력하세요.");
				$("#mem_nm").focus();
				
			}else if(checkVal("#mem_phone")){
				
				alert("핸드폰번호를 입력하세요.");
				$("#mem_phone").focus();
				
			}else if(checkVal("#mem_bd")){
				
				alert("생년월일을 선택하세요.");
				$("#mem_bd").focus();
				
			}else if(check()){
				
			}else{
				if(confirm("아이디를 찾으시겠습니까?")){
					var params = $("#findIdForm").serialize();
					
					$.ajax({
						url : "memFindIdAjax",
						type : "post",
						dataType : "json",
						data : params,
						success : function(res){
							if(res.cnt == 1){
								
								var result = confirm("아이디는 "+res.data.MEM_ID+"입니다.\n로그인 하시겠습니까?");
								
								if(result){
									location.href="login";
								}else{
									
								}
								
							}else{
								alert("아이디를 찾을 수 없습니다.");
							}
						},
						error : function(request, status, error){
							console.log(error);
						}
					});
				}
			}
		});
	});//d
	
	function check() {
		var memNm = document.getElementById("mem_nm");
		var memPhone = document.getElementById("mem_phone");
		var memBd = document.getElementById("mem_bd");
		console.log("??" + memPhone.value);
		//이름 유효성 검사
        if(memNm.value.length<2){
            alert("이름을 2자 이상 입력해주십시오.");
            memNm.focus();
            return true;
        }
		//폰번호 유효성 검사
        var patternPhone = /01[016789]{1}-[^0][0-9]{3,4}-[0-9]{4}/;

        if(!patternPhone.test(memPhone.value))
        {
            alert('핸드폰 번호를 확인 해주세요');
            memPhone.focus();
            return true;
        }
        //생년월일 유효성 검사
        if(memBd.value.length<8){
            alert("생년월일 형식은 ex)20000101 입니다.");
            memBd.focus();
            return true;
        }

	}
	
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
<div class="memdiv">
	<form action="#" id="findIdForm" method="post">
		이름<br> 
			<input type="text" id="mem_nm" name="mem_nm" placeholder="이름입력(2자 이상)"><br><br>
		핸드폰<br> 
			<input type="text" id="mem_phone" name="mem_phone" maxlength="13" placeholder="010-0000-0000"><br><br>
		생년월일<br>
			<input type="text" id="mem_bd" name="mem_bd" maxlength="8" placeholder="19990101"><br><br>
	</form>
	<br><br>
	<div class="membtns">
	<input type="button" value="찾기" id="findBtn">
	<input type="button" value="취소" id="cancleBtn">
	</div>
</div>
</div>	
</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>
<script type="text/javascript" src="resources/css/js/header.js"></script>
</body>
</html>