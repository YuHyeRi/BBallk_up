<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뽈크업 사이트소개</title>
   <link rel="stylesheet" href="resources/css/layout/font.css">
   <link rel="stylesheet" href="resources/css/layout/basic.css">
   <link rel="stylesheet" href="resources/css/layout/btn.css">
   <link rel="stylesheet" href="resources/css/layout/loginout.css">
   <link rel="stylesheet" href="resources/css/layout/nav.css">
   <link rel="stylesheet" href="resources/css/layout/siteplan.css">
<style>
.site-top1 {
   background-image: linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)),
    url("resources/images/siteplan/축구이미지.jpg");
    margin-left: 100px;
    margin-right: 100px;
}
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
   $("#login").on("click",function(){
      $("#loginForm").attr("action","login");
      $("#loginForm").submit();
   });
         
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
	
	$("#mgrpage").on("click", function(){
		$("#loginForm").attr("action","mgrPage");
		$("#loginForm").submit();
	});
   
});
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
<form action="#" id="loginForm" method="post">
   <input type="hidden" id="mem_no" name="mem_no" value="${sMNo}">
</form>
<div class="site-top1">
   <div class="site-text">
       <h1 style="font-size:50px">I am Seoul People</h1>
       <p>And I love Sports</p>
       <button class="join"><span>sign up</span></button>
   </div>
</div>
<!-- 관리자만 이미지 수정 버튼 보임 -->
<!-- <button>이미지수정</button> -->
<div class="site-top2">
    <div class="maintext">
        <div class="maintext_">
            <h1 class="maintexth1">LET'S SPORTS</h1>
            <p>체사서모에서 재밌는 운동하고 소통하자!</p>
        </div>
    </div>
    <div class="subtextdiv">
        <ul>
            <li>
                <div class="subtext">
                    <h3>같이 운동하고 싶을 때</h3>
                    <p>매치를 통해 다양한 사람들과 재밌는 경기</p>
                </div>
            </li>
            <li>
                <div class="subtext">
                    <h3>운동장 예약이 어려울 때</h3>
                    <p>다함께 진행하는 예약으로 비용부담 절감</p>
                </div>
            </li>
            <li>
                <div class="subtext">
                    <h3>팀원과 소통하고 싶을 때</h3>
                    <p>내가 속한 팀에서 커뮤니케이션</p>
                </div>
            </li>
        </ul>
    </div>
</div>
</main>
<footer>
   <jsp:include page="../footer.jsp" flush="true" />
</footer>

<script type="text/javascript" src="resources/css/js/header.js"></script>
</body>
</html>