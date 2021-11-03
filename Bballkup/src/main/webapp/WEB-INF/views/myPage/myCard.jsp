<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지>>카드등록</title>
<link rel="stylesheet" href="resources/css/layout/font.css">
<link rel="stylesheet" href="resources/css/layout/basic.css">
<link rel="stylesheet" href="resources/css/layout/btn.css">
<link rel="stylesheet" href="resources/css/layout/loginout.css">
<link rel="stylesheet" href="resources/css/layout/nav.css">
<link rel="stylesheet" href="resources/css/layout/main.css">
<link rel="stylesheet" href="resources/css/layout/myCard.css">

<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#login").on("click",function(){
	   $("#loginForm").attr("action","login");
	   $("#loginForm").submit();});
		      
	$("#logout").on("click", function(){
	   $("#loginForm").attr("action","logout");
	   $("#loginForm").submit();
	});

	$("#join").on("click", function(){
	   $("#loginForm").attr("action","join");
	   $("#loginForm").submit();
	});
	      
	$("#mypage").on("click", function(){
	   $("#loginForm").attr("action","myPage");
	   $("#loginForm").submit();
	});
	
	$("#cancel1").on("click", function(){
		$("#deleteForm").attr("action","myPage");
		$("#deleteForm").submit();
	});
	
	$("#cancel2").on("click", function(){
		$("#addForm").attr("action","myPage");
		$("#addForm").submit();
	});
	
	//카드등록
	$("#cardAdd").on("click", function(){
		if(checkVal("#cardNum1")){
			alert("카드번호 앞 8자리를 입력해주세요");
			$("#cardNum1").focus();
		}else if(checkVal("#cardNum2")){
			alert("카드번호 뒤 8자리를 입력해주세요");
			$("#cardNum2").focus();
		}else if(checkVal("#cardMon")){
			alert("유효기간(월)을 입력해주세요");
			$("#cardMon").focus();
		}else if(checkVal("#cardYear")){
			alert("유효기간(년)을 입력해주세요");
			$("#cardYear").focus();
		}else if(checkVal("#cardCVC")){
			alert("카드 뒷면 CVC 번호를 입력해주세요");
			$("#cardCVC").focus();
		}else if(checkVal("#cardPw")){
			alert("카드 비밀번호 앞 2자리를 입력해주세요");
			$("#cardPw").focus();
		}else{
			var params = $("#addForm").serialize();
			
			$.ajax({
				url : "cardCUD",
				type : "post",
				dataType : "json",
				data : params,
				success : function(res){
					if(res.result == "success"){
						alert("카드등록이 완료되었습니다.");
						$("#addForm").attr("action", "myPage");
						$("#addForm").submit();
					}else if(res.result == "failed"){
						alert("카드등록에 실패했습니다.");
					}else{
						alert("카드등록 중 문제가 발생했습니다.")
					}
				},
				error : function(request, status, error){
					console.log(error);
				}
			});
		}
	});
	
	//카드삭제
	$("#deleteCard").on("click", function(){
		if(confirm("삭제하시겠습니까?")){
			var params = $("#deleteForm").serialize();
			
			$.ajax({
				url : "cardCUD",
				type : "post",
				dataType : "json",
				data : params,
				success : function(res){
					if(res.result == "success"){
						alert("카드정보 삭제가 완료되었습니다.");
						$("#deleteForm").attr("action", "myPage");
						$("#deleteForm").submit();
					}else if(res.result == "failed"){
						
						alert("삭제에 실패했습니다.");
						
					}else{
						alert("삭제중 문제가 발생했습니다.")
					}
				},
				error : function(request, status, error){
					console.log(error);
				}
			});
		}
	});
		
	/* 유효성 검사
	- 입력값 한 글자씩 검사 : keyup
	- 입력값 전체를 검사 : change
	- alert이 아니라 스팬태그에 디자인 넣어서 show 해줘도 됨
	*/
	//카드정보 숫자만 입력
	$(".numberOnly").on("keyup", function(event) {
        if (event.which && (event.which  > 47 && event.which  < 58 || event.which == 8)) {   
        }else{
        	alert("숫자만 입력 가능합니다.");
            $(this).val($(this).val().replace(/[^0-9]/g,""));
        }
    });
	
	//카드번호 8글자
	$("#cardNum1").on("change", function(event){
		var cardNum1 = document.getElementById("cardNum1");
		
		if(cardNum1.value.length < 8){
			alert("8자리를 입력해주세요.");
			cardNum1.focus();
			return true;
		}
	});
	
	$("#cardNum2").on("change", function(event){
		var cardNum2 = document.getElementById("cardNum2");
		
		if(cardNum2.value.length < 8){
			alert("8자리를 입력해주세요.");
			cardNum2.focus();
			return true;
		}
	});
	
	//1월부터 12월까지만 입력
	$("#cardMon").on("keyup", function() {
		var val= $(this).val();
		
		if(val.replace(/[0-9]/g, "").length > 0) {
	        alert("숫자만 입력 가능합니다.");
	        $(this).val("");
	    }
		
        if(val < 1 || val > 12) {
            alert("1~12 사이의 값을 입력해 주세요.");
            $(this).val("");
        }
    });
	
	//현재년도 이후의 년도만 입력
	$("#cardYear").on("change", function() {
		var now = new Date();
		var year = now.getFullYear(); 

		var val= $(this).val();
		
	    var numVal = Number(val)+2000;
	    
        if(numVal < year) {
            alert("현재년도 이후의 값을 입력해 주세요.");
            $(this).val("");
            $(this).focus();
        }
    });
	
	//cvc 3글자
	$("#cardCVC").on("change", function(event){
		var cardCVC = document.getElementById("cardCVC");
		
		if(cardCVC.value.length < 3){
			alert("3자리를 입력해주세요.");
			cardCVC.focus();
			return true;
		}
	});
	
	//비밀번호 2글자
	$("#cardPw").on("change", function(event){
		var cardPw = document.getElementById("cardPw");
		
		if(cardPw.value.length < 2){
			alert("2자리를 입력해주세요.");
			cardPw.focus();
			return true;
		}
	});
	

});

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
<div class="cardBig">
<div class="cardDiv">
<form action="#" id="loginForm" method="post">
   <input type="hidden" name="mem_no" value="${sMNo}">
</form>
<c:choose>
	<c:when test="${!empty data.CARD_NUM}">
		
		<div class="cardInfo">
			<h2>마이페이지 >> 카드 등록 정보</h2>
			<br>
			<br>
			<br>
			${data.CARD_NUM} (앞 8자리) ****-**** (뒤 8자리)
		</div>
		<form action="#" id="deleteForm" method="post">
			<input type="hidden" id="mem_no" name="mem_no" value="${param.mem_no}">
			<input type="hidden" id="mem_nm" name="mem_nm" value="${param.mem_nm}">
			<input type="hidden" id="mem_phone" name="mem_phone" value="${param.mem_phone}">
			<input type="hidden" id="gbn" name="gbn" value="d">
		</form>
		<div class="btnDiv1">
			<input type="button" id="cancel1" name="cancel1" value="돌아가기">
			<input type="button" id="deleteCard" name="deleteCard" value="카드삭제">
		</div>
	</c:when>
	<c:otherwise>
		<form action="#" id="addForm" method="post">
			<input type="hidden" id="mem_no" name="mem_no" value="${param.mem_no}">
			<input type="hidden" id="mem_nm" name="mem_nm" value="${param.mem_nm}">
			<input type="hidden" id="mem_phone" name="mem_phone" value="${param.mem_phone}">
			<input type="hidden" id="gbn" name="gbn" value="c">
			<h2>마이페이지 >> 카드 등록</h2>
			카드번호<br>
			<input type="text" id="cardNum1" name="cardNum1" maxlength='8' placeholder="카드번호 앞 8자리 입력" style="margin:10px;" class="numberOnly">
			<input type="password" id="cardNum2" name="cardNum2" maxlength='8' placeholder="카드번호 뒤 8자리 입력" class="numberOnly"><br><br>
			유효기간<br>
			<input type="text" id="cardMon" name="cardMon" maxlength='2' placeholder="월" style="margin:10px;width:30px;">
			/
			<input type="text" id="cardYear" name="cardYear" maxlength='2' placeholder="년" style="margin:10px;width:30px;" class="numberOnly"><br><br>
			CVC(카드 뒷면 3자리)<br>
			<input type="password" id="cardCVC" name="cardCVC" maxlength='3' style="margin:10px;" class="numberOnly"><br><br>
			비밀번호(앞 2자리)<br>
			<input type="password" id="cardPw" name="cardPw" maxlength='2' style="margin:10px;" class="numberOnly"><br><br>
		</form>
		<div class="btnDiv2">
			<input type="button" id="cancel2" name="cancel2" value="취소">
			<input type="button" id="cardAdd" name="cardAdd" value="카드등록">
		</div>
	</c:otherwise>
</c:choose>
</div>
</div>
</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>
</body>
</html>