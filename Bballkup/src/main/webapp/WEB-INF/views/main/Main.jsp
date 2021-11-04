<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뽈크업</title>
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
.title2{
	width : 200px;
}
.title{
	width : 180px;
}
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
var interval = null;
var pNum = 1;
var playTime = 5000;
$(document).ready(function(){
	$(".dots > span:nth-child(1)").css("background-color", "#1d2088");
	interval = setInterval(playImg, playTime);
		var params = $("#main2").serialize();

		$.ajax({
			url: "Mainnotice", 
			type: "post", 
			dataType: "json", 
			data: params, 
			success: function(res){ 
				drawList(res.list);
				drawList2(res.list2);
				
				if($("#mem_no").val() != "") {
					drawBtn(res.list3);
				}
			},
			error: function(request, status, error){ 
				console.log(request);
				console.log(error);
			}
		});
		
		$("#tbody2").on("click", "tr", function(){ 
			$("#no").val($(this).attr("no"));
			
			$("#main2").attr("action", "Notice");
			$("#main2").submit();
		});
		
		$("#tbody1").on("click", "tr", function(){ 
			if($(this).attr("state") == "모집마감" || $(this).attr("state") == "경기취소") {
				alert("이미 마감된 게시물입니다.");
			} else {
				$("#match_no").val($(this).attr("no"));
			
				$("#actionForm").attr("action", "pDtl");
				$("#actionForm").submit();
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
		
		$(".dots").on("click", "span", function() {
			$(".dots > span").css("background-color", "#bbb");
			$(".dots > span:nth-child(" + $(this).attr("no") + ")").css("background-color", "#1d2088");
			clearInterval(interval);
			
			pNum = $(this).attr("no");
			
			interval = setInterval(playImg, playTime);
		});
});

function playImg() {
	pNum++;
	
	if(pNum > $(".dots span").length) {
		pNum = 1;
	}
	
	$(".dots > span").css("background-color", "#bbb");
	$(".dots > span:nth-child(" + pNum + ")").css("background-color", "#1d2088");
	$(".dots > span:nth-child(" + pNum + ")").click();
	
	
}

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
	$("#tbody2").html(html);
}
function drawList2(list2){
	var html = "";
	
	for(var data of list2) {
		html += "<tr no=\"" + data.MATCH_NO + "\" state=\"" + data.MATCH_STATE + "\">  ";
		html += "<td>" + data.MATCH_DDAY + "</td>  	";
		html += "<td>" + data.SPORT_NM + "</td>  	";
		html += "<td>" + data.PLACE_NM + "</td>  	";
		html += "<td>" + data.MATCH_STATE + "</td>   	";
	/* 	html += "<td>" + data.MEM_ID + "</td>   	"; */
		html += "</tr>               			";
	}
	$("#tbody1").html(html);
	
	$("#tbody1 > tr > td:nth-child(4)").each(function() {
		switch($(this).html()) {
		case "모집중" : 
			$(this).css("color", "blue");
			break;
		}
	});
};
</script>
</head>
<body>
<header>
	<jsp:include page="../header.jsp" flush="true" />
</header>
<main>
<jsp:include page="../nav.jsp" flush="true" />

<form action="#" id="loginForm" method="post">
	<input type="hidden" name="mem_no" value="${sMNo}">
</form>
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="team_no" name="team_no" value="">
	<input type="hidden" id="mem_no" name="mem_no" value="${sMNo}">
	<input type="hidden" id="match_no" name="match_no" />
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
              <img src="resources/images/slide/메인5.jpg" style="width:100%">
            </div>
            <div class="mySlides_fade">
              <img src="resources/images/slide/메인1.jpg" style="width:100%">
            </div>
            <div class="mySlides_fade">
              <img src="resources/images/slide/메인2.jpg" style="width:100%">
            </div>
            <div class="mySlides_fade">
              <img src="resources/images/slide/메인3.jpg" style="width:100%">
            </div>
            <div class="mySlides_fade">
              <img src="resources/images/slide/메인4.jpg" style="width:100%">
            </div>
            <div class="dots" style="text-align:center">
              <span class="dot" no="1" onclick="currentSlide(1)"></span> 
              <span class="dot" no="2" onclick="currentSlide(2)"></span> 
              <span class="dot" no="3" onclick="currentSlide(3)"></span> 
              <span class="dot" no="4" onclick="currentSlide(4)"></span> 
              <span class="dot" no="5" onclick="currentSlide(5)"></span> 
            </div>
		</div>
	</div>
<div class="maincenterdiv">
	<div class="maindiv">
		 <div class="mainleft">
		 	 <div class="enter_div">
		 	 	<table class="notice_table">
					<thead>
						<tr class="nonetr">
							<th>경기일</th>
							<th>시설명</th>
							<th class="title2">장소</th>
							<th>마감여부</th>
							<!-- <th>작성자</th> -->
						</tr>
					</thead>
					<tbody id="tbody1"></tbody>
				</table>
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
							<tbody id="tbody2"></tbody>
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