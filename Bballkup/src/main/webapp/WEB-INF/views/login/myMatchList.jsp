<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지>>나의예약내역</title>
<link rel="stylesheet" href="resources/css/layout/font.css">
	<link rel="stylesheet" href="resources/css/layout/basic.css">
	<link rel="stylesheet" href="resources/css/layout/btn.css">
	<link rel="stylesheet" href="resources/css/layout/loginout.css">
	<link rel="stylesheet" href="resources/css/layout/nav.css">
	<link rel="stylesheet" href="resources/css/layout/table.css">
	<link rel="stylesheet" href="resources/css/layout/searchbox.css">
<style>
	#paging_wrap span {
		cursor: pointer;
	}
	
	table {
		text-align: center;
	}
	
	td img {
		width: 15px;
	}
	
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if("${param.searchGbn}" != ""){
		$("#searchGbn").val("${param.searchGbn}");
	}
	
	reloadList();
	
	//글작성
	$("#addBtn").on("click", function(){
		
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#actionForm").attr("action", "testABAdd");
		$("#actionForm").submit();
	});
	//로그인
	$("#loginBtn").on("click", function(){
		location.href = "m1Login";
	});
	//로그아웃
	$("#logoutBtn").on("click", function(){
		location.href = "m1Logout";
	});
	//검색
	$("#searchBtn").on("click", function(){
		$("#oldTxt").val($("#searchTxt").val());
		$("#page").val("1");
		
		reloadList();
	});
	
	$("#searchTxt").on("keypress", function(){
		if(event.keyCode == 13){
			$("#searchBtn").click();
			return false;
		}
	});
	
	$(".paging_wrap").on("click", "span", function(){
		
		$("#page").val($(this).attr("page"));
		$("#searchTxt").val($("#oldTxt").val());
		
		reloadList();
	});
	
	$("tbody").on("click", "tr", function(){
		
		$("#match_no").val($(this).attr("no"));

		$("#boardGoForm").attr("action", "pDtl");
		$("#boardGoForm").submit();
	});
	
});

//데이터 취득
function reloadList(){

	var params = $("#actionForm").serialize(); // form의 데이터를 문자열로 변환
	
	$.ajax({	//jquery의 ajax 함수 호출
		url : "myMatchListAjax",	// 접속
		type : "post",			// 전송방식
		dataType : "json",		// 받아올 데이터의 형태
		data : params,			// 보낼 데이터(문자열 형태)
		success : function(res){// 성공(ajax통신성공)시 다음 함수 발생
			drawList(res.list);
			drawPaging(res.pb);
		},
		error : function(request, status, error){// 실패시 다음 함수 발생
			console.log(error);
		}
	});
}

//목록 그리기
function drawList(list){
	var html = "";

	for(var data of list){
		
		html += "<tr no=\"" + data.MATCH_NO + "\">";
		html += "<td>" + data.MATCH_NO + "</td>     ";
		html += "<td>" + data.MATCH_DT + "</td>     ";
		html += "<td>" + data.TEAM_NM + "</td>     ";
		html += "<td>" + data.SPORT_NM + "</td>     ";
		html += "<td>" + data.PLACE_NM + "</td>  ";
		html += "<td>" + data.MATCH_PAY + "</td>  ";
		html += "<td>" + data.MATCH_STATE + "</td>  ";
		html += "</tr>          ";
	}
	
	$("tbody").html(html);
}

function drawPaging(pb){
	var html = "";
	
	html += "<span page=\"1\">처음</span>       ";
	
	if($("#page").val() == "1"){
		
		html += "<span page=\"1\">이전</span>       ";	
	}else{
		html += "<span page=\"" + ($("#page").val() * 1 - 1) + "\">이전</span>       ";
	}
	
	for(var i = pb.startPcount ; i <= pb.endPcount; i++){
		if($("#page").val() == i){
			html += "<span page=\"" + i + "\"><b>" + i + "</b></span>  ";
		}else{
			html += "<span page=\"" + i + "\">" + i + "</span>  ";
		}
	}
	
	if($("#page").val() == pb.maxPcount){
		html += "<span page=\"" + pb.maxPcount + "\">다음</span>       ";
	}else{
		html += "<span page=\"" + ($("#page").val() * 1 + 1) + "\">다음</span>       ";
	}
	
	
	html += "<span page=\"" + pb.maxPcount + "\">마지막</span>      ";
	
	$(".paging_wrap").html(html);
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
	<h2>나의 예약 내역</h2>
<div>
	<form action="#" id="boardGoForm" method="post">
		<input type="hidden" name="no" id="no" value="${sMNo}">
		<input type="hidden" id="team_no" name="team_no" value="">
		<input type="hidden" name="mem_no" value="${sMNo}">
		<input type="hidden" id="page" name="page" value="${page}" />
		<input type="hidden" id="match_no" name="match_no" />
	</form>
	<form action="#" id="actionForm" method="post">
		<input type="hidden" name="mem_no" id="mem_no" value="${sMNo}">
		<select name="searchGbn" id="searchGbn">
			<option value="0">종목</option>
			<option value="1">장소명</option>
		</select>
		<input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt }" >
		<input type="hidden" name="oldTxt" id="oldTxt" value="${param.searchTxt }" >
		<input type="hidden" name="page" id="page" value="${page}">
		<input type="hidden" name="no" id="no">
		<input type="button" value="검색" id="searchBtn">
	</form>
</div><br><br>
<div>
	<table class="notice_table">
		<thead>
			<tr class="nonetr">
				<th>번호</th>
				<th>날짜</th>
				<th>커뮤니티</th>
				<th>종목</th>
				<th class="title">제목</th>
				<th>결제금액</th>
				<th>진행사항</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>
<div class="paging_wrap">
</div>
</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>
<script type="text/javascript" src="resources/css/js/header.js"></script>
</body>
</html>









