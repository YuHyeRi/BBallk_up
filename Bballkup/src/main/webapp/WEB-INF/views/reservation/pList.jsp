<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 체육활동 모집</title>
	<link rel="stylesheet" href="resources/css/layout/font.css">
	<link rel="stylesheet" href="resources/css/layout/basic.css">
	<link rel="stylesheet" href="resources/css/layout/btn.css">
	<link rel="stylesheet" href="resources/css/layout/loginout.css">
	<link rel="stylesheet" href="resources/css/layout/nav.css">
	<link rel="stylesheet" href="resources/css/layout/table.css">
<style type="text/css">
#addBtn{
	width:auto;
	height:50px;
	margin-bottom:10px;
	font-size: medium;
	cursor:pointer;
}
#addBtn:hover{
	background-color:#e3ecfb;
}
.pAdd{
	text-align:center;
	margin-bottom: 0.83em;
}

tr:hover{
	cursor:pointer;
}
.pIntro>h2{
	display: inline-block;
	margin-right: 30px;
}
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script>
$(document).ready(function() {
	reloadList();
	
	$("#login").on("click",function(){
	   $("#loginForm").attr("action","login");
	   $("#loginForm").submit();});
	      
	$("#logout").on("click", function(){
	   $("#loginForm").attr("action","logout");
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
	
	$("#addBtn").on("click", function(){
		 $("#actionForm").attr("action","reservation");
		 $("#actionForm").submit();
	});
	
	$("tbody").on("click", "tr", function() {
		$("#match_no").val($(this).attr("no"));
		$("#actionForm").attr("action", "pDtl");
		$("#actionForm").submit();
	});
});
function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({					
		url: "pLists",
		type: "post",			
		data: params,			
		dataType: "json",		
		success: function(res) {
			drawList(res.list);
			drawPaging(res.pb);
		},
		error: function(request, status, error) {
			console.log(error);
		}
	});
};

function drawList(list) {
	var html = "";
	
	for(var data of list) {
		html += "<tr no=\"" + data.MATCH_NO + "\">  ";
		html += "<td>" + data.MATCH_DDAY + "</td>  	";
		html += "<td>" + data.SPORT_NM + "</td>  	";
		html += "<td>" + data.PLACE_NM + "</td>  	";
		html += "<td>" + data.MATCH_STATE + "</td>   	";
		html += "<td>" + data.MEM_ID + "</td>   	";
		html += "</tr>               			";
	}
	$("tbody").html(html);
};

function drawPaging(pb) {
	var html = "";
	
	html += "<span page=\"1\">처음</span>	";
	if($("#page").val() == "1") {
		html += "<span page=\"1\">이전</span>	";
	} else {
		html += "<span page=\"" + ($("#page").val() * 1 - 1) + "\">이전</span>	";
	} 
	for(var i=pb.startPcount; i<=pb.endPcount; i++) {
		if($("#page").val() == i) {
			html += "<span page=\"" + i + "\"><b>" + i + "</b></span>	";
		} else {
			html += "<span page=\"" + i + "\">" + i + "</span>	";
		}
	}
	if($("#page").val() == pb.maxPcount) {
		html += "<span page=\"" + pb.maxPcount + "\">다음</span>	";
	} else {
		html += "<span page=\"" + ($("#page").val() * 1 + 1) + "\">다음</span>	";
	}
	html += "<span page=\"" + pb.maxPcount + "\">마지막</span>	";
	
	$("#paging_wrap").html(html);
};
</script>
</head>
<body>
<form action="#" id="loginForm">
	<input type="hidden" name="mem_no" value="${sMNo}">
</form>
<header>
	<jsp:include page="../header.jsp" flush="true" />
</header>
<main>
<jsp:include page="../nav.jsp" flush="true" />
<div class="pIntro">
<h2>개인 체육활동 참가모집 게시판</h2>
	<jsp:include page="../modal.jsp" flush="true" />
</div>
	<div>
		<form action="#" id="actionForm" method="post">
			<input type="hidden" id="team_no" name="team_no" value="">
			<input type="hidden" id="mem_no" name="mem_no" value="${sMNo}">
			<input type="hidden" id="page" name="page" value="${page}" />
			<input type="hidden" id="match_no" name="match_no" />
		</form>
	</div>
	<c:if test="${sMNo != 4}">
		<div class="pAdd">
			<input type="button" id="addBtn" name="addBtn" value="모임 주최하기">
		</div>
	</c:if>
	<div>
		<table class="notice_table">
			<thead>
				<tr class="nonetr">
					<th>경기일</th>
					<th>시설명</th>
					<th class="title">장소</th>
					<th>마감여부</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div><br><br>
	
	<div id="paging_wrap"></div>
	</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>

<script type="text/javascript" src="resources/css/js/header.js"></script>
</body>
</html>