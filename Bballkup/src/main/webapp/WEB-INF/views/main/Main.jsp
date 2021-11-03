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
	<link rel="stylesheet" href="resources/css/layout/table.css">
	<link rel="stylesheet" href="resources/css/layout/searchbox.css">
	<link rel="stylesheet" href="resources/css/layout/slideshow.css">
	<link rel="stylesheet" href="resources/css/layout/main.css">
	
<style>
	
td img {
	width : 17px;
}
.trclass{
	color: red;
	font-weight: bold;
	cursor: pointer;
}
tr:hover{
	background-color: #e3ecfb;
    cursor: pointer;
}
</style>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		//공지사항
		var params = $("#main2").serialize();

		$.ajax({
			url: "Mainnotice", 
			type: "post", 
			dataType: "json", 
			data: params, 
			success: function(res){ 
				drawList(res.list);
			},
			error: function(request, status, error){ 
				console.log(request);
				console.log(error);
			}
		});
		
		$("tbody").on("click", "tr", function(){ 
			$("#no").val($(this).attr("no"));
			
			$("#main2").attr("action", "Notice");
			$("#main2").submit();
		});
		
		//팀커뮤니티
		$.ajax({
			url: "Mainnotice", 
			type: "post", 
			dataType: "json", 
			data: params, 
			success: function(res){ 
				drawBtn(res.list3);
			},
			error: function(request, status, error){ 
				console.log(error);
			}
		});
		
		//로그인로그아웃
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
		
		$("#teambuttons").on("click", "input[type='button']", function() {
			$("#tno").val($(this).attr("no"));
			$("#main2").attr("action", "tMainIntro");
			$("#main2").submit();
		});
});

function drawBtn(list3){
	var html = "";
	
	for(var data of list3){
		html += "<input type=\"button\" no=\"" + data.TEAM_NO + "\" value=\"" + data.TEAM_NM + "\"> ";
	}
	$("#teambuttons").html(html);
}

function drawList(list){
	var html = "";
	
	for(var data of list){
		if(data.NOTICE_UP == 0){
			html += "<tr class=\"trclass\" no=\"" + data.NOTICE_NO + "\">         ";
			html += "<td>" + data.NOTICE_NO + "</td>   ";
			html += "<td>";2
			html += data.NOTICE_TITLE;
		
			 if(data.NOTICE_FILE != null) {
		         html += "<img src=\"resources/images/icon/File.png\" />";
		      }
		
			html += "</td>";
			html += "<td>" + data.MEM_NM + "</td> ";
			html += "<td>" + data.NOTICE_DT + "</td> ";
			html += "<td>" + data.NOTICE_HIT + "</td>   ";
			
			html += "</tr>        ";
		}else{
			html += "<tr no=\"" + data.NOTICE_NO + "\">         ";
			html += "<td>" + data.NOTICE_NO + "</td>   ";
			html += "<td>";
			html += data.NOTICE_TITLE;
		
			 if(data.NOTICE_FILE != null) {
		         html += "<img src=\"resources/images/icon/File.png\" />";
		      }
		
			html += "</td>";
			html += "<td>" + data.MEM_NM + "</td> ";
			html += "<td>" + data.NOTICE_DT + "</td> ";
			html += "<td>" + data.NOTICE_HIT + "</td>   ";
			
			html += "</tr>        ";
		}
	}
	$("tbody").html(html);
}

</script>
</head>
<body>
<header>
	<jsp:include page="../header.jsp" flush="true" />
</header>
<main>
<jsp:include page="../nav.jsp" flush="true" />

<form action="#" id="loginForm" method="post">
	<input type="hidden" id="mem_no" name="mem_no" value="${sMNo}">
</form>

<form action="#" id="main1" method="post">

</form>
<form action="#" id="main2" method="post">
	<!-- 공지번호 -->
	<input type="hidden" id="no" name="no"/>
	<!-- 로그인 회원번호 -->
	<input type="hidden" name="mno" value="${sMNo}"/>
	<!-- 팀번호 -->
	<input type="hidden" id="tno" name="tno"/>
</form>

<div class="mainbar">
        <div class="slideshow-container">
            <div class="mySlides_fade">
              <img src="resources/images/slide/sample3.jpg" style="width:100%">
            </div>
            <div class="mySlides_fade">
              <img src="resources/images/slide/sample2.jpg" style="width:100%">
            </div>
            <div class="mySlides_fade">
              <img src="resources/images/slide/sample1.jpg" style="width:100%">
            </div>
            <div class="mySlides_fade">
              <img src="resources/images/slide/sample4.jpg" style="width:100%">
            </div>
            <div class="dots" style="text-align:center">
              <span class="dot" onclick="currentSlide(1)"></span> 
              <span class="dot" onclick="currentSlide(2)"></span> 
              <span class="dot" onclick="currentSlide(3)"></span> 
              <span class="dot" onclick="currentSlide(4)"></span> 
            </div>
		</div>
	</div>
<div class="maincenterdiv">
	<div class="maindiv">
		 <div class="mainleft">
		 	 <div class="enter_div">
		 	 	<p>체활모</p>
		 	 </div>
		 </div>
		 <div class="mainrightdiv">
			<div class="mainright1">
				<div class="notice_div">
					<table class="T_table">
						<thead>
							<tr class="nonetr">
								<th>번호</th>
								<th class="title">제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
							<tbody>
							</tbody>
					</table>
				</div>
			</div>
				<div class="mainright2">
					<div class="team_div">
						<c:choose>
							<c:when test="${empty sMNo}">
								<p>로그인 후 이용 가능합니다</p>
							</c:when>
							<c:otherwise>
								<p>가입한 팀</p>
								<br>
								<div id="teambuttons"></div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
		</div>
	</div>
</div>
</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>
<script type="text/javascript" src="resources/css/js/slideshow.js"></script>
</body>
</html>