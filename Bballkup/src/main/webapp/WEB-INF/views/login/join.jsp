<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#mem_id").on("change", function(){
			
			var params = $("#joinForm").serialize();
			
			$.ajax({
				url : "memCntCheckAjax",
				type : "post",
				dataType : "json",
				data : params,
				success : function(res){
					if(res.cnt > 0){

						$("#check").html("중복!!");
						$("#check").css("color", "red");
						$("#checkId").val("false");
						
					}else{
						$("#check").html("사용가능~");
						$("#check").css("color", "green");
						$("#checkId").val("true");
					}
				},
				error : function(request, status, error){
					console.log(error);
				}
			});
		});
		
		$("#cancleBtn").on("click", function(){
			
			history.back();
		});
		
		$("#addBtn").on("click", function(){
			
			if(checkVal("#mem_id")){
				
				alert("아이디를 입력하세요.");
				$("#mem_id").focus();
				
			}else if(checkVal("#mem_pw")){
				
				alert("비밀번호를 입력하세요.");
				$("#mem_pw").focus();
				
			}else if(checkVal("#mem_nm")){
				
				alert("이름을 입력하세요.");
				$("#mem_nm").focus();
				
			}else{
				
				check();
				//$("#addForm").submit();
			}
			/*
			비밀번호, 비밀번호 확인 일치하는지 확인
			else if($("#pw").val() != $("#repw").val()){

				alert("비밀번호가 일치하지 않습니다.");
				$("pw").val("");
				$("repw").val("");
				$("pw").focus();
			}
			*/
		});
	});//d
	
	function check() {
		var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		var memId = document.getElementById("mem_id");
		var msg, ss, cc;
		//정규표현식
		//alert("??"+document.getElementById("mem_id").value.length);
     
       //아이디 유효성 검사 (영문소문자, 숫자만 허용)
       for (var i = 0; i < memId.value.length; i++) {
            ch = memId.value.charAt(i)
            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')) {
                alert("아이디는 영문 소문자, 숫자만 입력가능합니다.");
                memId.focus();
                memId.select();
                return false;
            }
        }
        //아이디에 공백 사용하지 않기
        if (memId.value.indexOf(" ") >= 0) {
            alert("아이디에 공백을 사용할 수 없습니다.");
            memId.focus();
            memId.select()
            return false;
        }
        //아이디 길이 체크 (4~12자)
       if (memId.value.length<4 || memId.value.length>12) {
            alert("아이디를 4~12자까지 입력해주세요.");
            memId.focus();
            memId.select();
            return false;
        }
           //비밀번호 입력여부 체크
        if (document.f.password.value == "") {
            alert("비밀번호를 입력하지 않았습니다.");
            document.f.password.focus();
            return false;
        }
        if (f.password.value == f.id.value) {
            alert("아이디와 비밀번호가 같습니다.");
            document.f.password.focus();
            return false;
        }
        //비밀번호 길이 체크(4~8자 까지 허용)
        if (document.f.password.value.length<4 || document.f.password.value.length>12) {
            alert("비밀번호를 4~12자까지 입력해주세요.");
            document.f.password.focus();
            document.f.password.select();
            return false;
        }
        //비밀번호와 비밀번호 확인 일치여부 체크
        if (document.f.password.value != document.f.password1.value) {
            alert("비밀번호가 일치하지 않습니다");
            document.f.password1.value = ""
            document.f.password1.focus();
            return false;
        }
 
        if (document.f.mail.value == "") {
            alert("이메일을 입력하지 않았습니다.");
            document.mail.focus();
            return false;
        }
        if (regex.test(mail) === false) {
            alert("잘못된 이메일 형식입니다.");
            document.f.mail.value=""
            document.f.mail.focus();
            return false;
        }
 
        for (var i = 0; i < document.f.mail.value.length; i++) {
            chm = document.f.mail.value.charAt(i)
            if (!(chm >= '0' && chm <= '9') && !(chm >= 'a' && chm <= 'z')&&!(chm >= 'A' && chm <= 'Z')) {
                alert("이메일은 영문 대소문자, 숫자만 입력가능합니다.");
                document.f.mail.focus();
                document.f.mail.select();
                return false;
            }
        }
 
        if (document.f.name.value == "") {
            alert("이름을 입력하지 않았습니다.");
            document.f.name.focus();
            return false;
        }
 
        if(document.f.name.value.length<2){
            alert("이름을 2자 이상 입력해주십시오.");
            document.f.name.focus();
            return false;
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
	<form action="#" id="joinForm" method="post">
		아이디 <input type="text" id="mem_id" name="mem_id" placeholder="아이디입력(영문,숫자조합 5글자 이상)">
			  <span id="check"></span><br>
		비밀번호 <input type="text" id="mem_pw" name="mem_pw"><br>
		비밀번호 재확인<input type="text" id="m_pw" name="m_pw"><br>
		이름 <input type="text" id="mem_nm" name="mem_nm"><br>
		핸드폰 <input type="text" id="m_phone" name="m_phone"><br>
	</form>
	<input type="button" value="저장" id="addBtn">
	<input type="button" value="취소" id="cancleBtn">
</body>
</html>