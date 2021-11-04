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
	<link rel="stylesheet" href="resources/css/layout/memupdate.css">

<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		console.log("no : " + '${data.MEM_NO}');
		$("#cancleBtn").on("click", function(){
			
			history.back();
		});
		$("#updateBtn").on("click", function(){
			
			if(checkVal("#mem_pw")){
				
				alert("비밀번호를 입력하세요.");
				$("#mem_pw").focus();
				
			}else if(checkVal("#mem_pw2")){
				
				alert("재확인용 비밀번호를 입력하세요.");
				$("#mem_pw2").focus();
				
			}else if(check()){
				
			}else{
				if(confirm("비밀번호를 변경하시겠습니까?")){
					
					console.log("tq : "+'${data.MEM_NO}');
					var params = $("#pwUpdateForm").serialize();
					
					$.ajax({
						url : "memCUDAjax",
						type : "post",
						dataType : "json",
						data : params,
						success : function(res){
							
							if(res.result == "success"){
								
								history.back();
								
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
			}
		});
	});//d
	
	function check() {
		var memPw = document.getElementById("mem_pw");
		var memPw2 = document.getElementById("mem_pw2");
		
        //비밀번호 유효성체크
        if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(memPw.value)){            
            alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
            memPw.focus();
            return true;
        }    
        var checkNumber = memPw.value.search(/[0-9]/g);
        var checkEnglish = memPw.value.search(/[a-z]/ig);
        if(checkNumber <0 || checkEnglish <0){
            alert("숫자와 영문자를 혼용하여야 합니다.");
            memPw.focus();
            return true;
        }
        if(/(\w)\1\1\1/.test(memPw.value)){
            alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
            memPw.focus();
            return true;
        }
        //비밀번호와 비밀번호 확인 일치여부 체크
        if (memPw.value != memPw2.value) {
            alert("비밀번호가 일치하지 않습니다");
            memPw2.value = ""
            memPw2.focus();
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
<form action="#" method="post" id="pwUpdateForm">
<input type="hidden" name="gbn" value="pu" >
	<c:choose>
		<c:when test="${empty sMNo }">
			<input type="hidden" name="mem_no" value="${data.MEM_NO}" >	
		</c:when>
		<c:otherwise>
			<input type="hidden" name="mem_no" value="${sMNo}" >
		</c:otherwise>
	</c:choose>
	비밀번호 재설정<br> 
	<input type="password" id="mem_pw" name="mem_pw" placeholder="비밀번호(영문, 숫자 조합)"><br>
	<input type="password" id="mem_pw2" name="mem_pw2" placeholder="비밀번호 재확인"><br><br>
	<div class="membtns">
		<input type="button" value="변경" id="updateBtn">
		<input type="button" value="취소" id="cancleBtn">
	</div>
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