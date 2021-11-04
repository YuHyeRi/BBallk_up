<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link rel="stylesheet" href="resources/css/layout/font.css">
	<link rel="stylesheet" href="resources/css/layout/basic.css">
	<link rel="stylesheet" href="resources/css/layout/btn.css">
	<link rel="stylesheet" href="resources/css/layout/loginout.css">
	<link rel="stylesheet" href="resources/css/layout/nav.css">
	<link rel="stylesheet" href="resources/css/layout/login.css">
	<link rel="stylesheet" href="resources/css/layout/memupdate.css">
	
<style>
#mem_id, #mem_pw, #mem_pw2, #mem_nm, #mem_phone, #mem_bd, #mem_pwa{
	width: 220px;
}
#addBtn:hover {
	background-color: #e3ecfb;
}
</style>

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
                  $("#check").html("");
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
            
         }else if(checkVal("#mem_pw2")){
            
            alert("재확인용 비밀번호를 입력하세요.");
            $("#mem_pw2").focus();
            
         }else if(checkVal("#mem_nm")){
            
            alert("이름을 입력하세요.");
            $("#mem_nm").focus();
            
         }else if(checkVal("#mem_phone")){
            
            alert("핸드폰번호를 입력하세요.");
            $("#mem_phone").focus();
            
         }else if(checkVal("#mem_bd")){
            
            alert("생년월일을 선택하세요.");
            $("#mem_bd").focus();
            
         }else if(checkVal("#mem_pwa")){
            
            alert("비밀번호 확인용 답변을 입력하세요.");
            $("#mem_pwa").focus();
            
         }else if(check()){
            
            
         }else{
            var params = $("#joinForm").serialize();
            
            $.ajax({
               url : "memCUDAjax",
               type : "post",
               dataType : "json",
               data : params,
               success : function(res){
                  if(res.result == "success"){
                     alert("회원가입이 정상적으로 처리되었습니다.");
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
   });//d
   
   function check() {
      var memId = document.getElementById("mem_id");
      var memPw = document.getElementById("mem_pw");
      var memPw2 = document.getElementById("mem_pw2");
      var memNm = document.getElementById("mem_nm");
      var memPhone = document.getElementById("mem_phone");
      
      var ch;
      
      //아이디 길이 체크 (4~12자)
        if (memId.value.length<5) {
            alert("아이디는 5자 이상 입력해주세요.");
            memId.focus();
            return true;
        }
       //아이디 유효성 검사 (영문소문자, 숫자만 허용)
       for (var i = 0; i < memId.value.length; i++) {
            ch = memId.value.charAt(i);
            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')) {
                alert("아이디는 영문 소문자, 숫자만 입력가능합니다.");
                memId.focus();
                return true;
            }
        }
        //아이디에 공백 사용하지 않기
        if (memId.value.indexOf(" ") >= 0) {
            alert("아이디에 공백을 사용할 수 없습니다.");
            memId.focus();
            return true;
        }
      //아이디에 공백 사용하지 않기
        if (memPw.value.indexOf(" ") >= 0) {
            alert("아이디에 공백을 사용할 수 없습니다.");
            memPw.focus();
            return true;
        }
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
        if(memPw.value.search(memId.value) > -1){
            alert("비밀번호에 아이디가 포함되었습니다.");
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
   <form action="#" id="joinForm" method="post">
      <input type="hidden" name="gbn" value="c" >
      아이디<br> 
         <input type="text" id="mem_id" name="mem_id" placeholder="아이디입력(영문,숫자조합 5글자 이상)">
         <span id="check"></span><br><br>
      비밀번호<br> 
         <input type="password" id="mem_pw" name="mem_pw" placeholder="비밀번호(영문, 숫자 조합)"><br>
         <input type="password" id="mem_pw2" name="mem_pw2" placeholder="비밀번호 재확인"><br><br>
      이름<br> 
         <input type="text" id="mem_nm" name="mem_nm" placeholder="이름입력(2자 이상)"><br><br>
      핸드폰<br> 
         <input type="text" id="mem_phone" name="mem_phone" maxlength="13" placeholder="010-0000-0000"><br><br>
      성별<br>
         여자<input type="radio" name="mem_gen" id="mem_genF" value="F" checked="checked">
         남자<input type="radio" name="mem_gen" id="mem_genM" value="M"><br><br>
      생년월일<br>
         <input type="text" id="mem_bd" name="mem_bd" maxlength="8" placeholder="19990101"><br><br>
      비밀번호 확인용 질문<br>
         <select name="mem_pw_gbn" id="mem_pw_gbn">
            <option value="1">출신 초등학교는 어디인가요?</option>
            <option value="2">가장 존경하는 인물은 누구인가요?</option>
            <option value="3">자신의 보물제1호는 무엇인가요?</option>
            <option value="4">인상깊게 읽은 책은 무엇인가요?</option>
         </select><br>
      비밀번호 확인용 답변<br>
         <input type="text" id="mem_pwa" name="mem_pwa" placeholder="답변"><br><br>
   </form>
   <br><br>
   <input type="button" value="저장" id="addBtn">
   <input type="button" value="취소" id="cancleBtn">
</div>
</div>	
</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>
   <script type="text/javascript" src="resources/css/js/header.js"></script>
</body>
</html>