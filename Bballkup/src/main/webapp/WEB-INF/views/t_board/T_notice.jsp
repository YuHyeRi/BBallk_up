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
	<link rel="stylesheet" href="resources/css/layout/T_board.css">

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
	if("${param.searchGbn}" != ""){
		$("#searchGbn").val("${param.searchGbn}");
	}
	reloadList();
	
	$(".paging_wrap").on("click", "span", function(){
		$("#page").val($(this).attr("page"));
		$("#searchTxt").val($("#oldTxt").val());
		
		reloadList();
	});
	
	$("#addBtn").on("click", function(){
		$("#searchTxt").val($("#oldTxt").val());
		$("#actionForm").attr("action", "T_noticeAdd");
		$("#actionForm").submit();
	});
	
	$("#searchBtn").on("click", function(){
		$("#oldTxt").val($("#searchTxt").val());
		$("#page").val("1");
		
		reloadList();
	});
	
	$("#searchTxt").on("keypress", function(event){
		if(event.keyCode == 13) { //13=엔터키
			$("#searchBtn").click();
			return false;
		}
	});
	
	$("tbody").on("click", "tr", function(){ 
		$("#no").val($(this).attr("no"));
		
		$("#actionForm").attr("action", "T_noticeDtl");
		$("#actionForm").submit();
	});
	
/* 	$("#tab2").on("click", function(){
		$("#actionForm").attr("action", "T_notice");
		$("#actionForm").submit();
	}); */
	
	$("#tab4").on("click", function(){
		if(confirm("페이지를 벗어나시겠습니까?")){
			$("#actionForm").attr("action", "tFreeList");
			$("#actionForm").submit();
		}
	});
	/* $("#tab1").on("click", function(){
		$("#actionForm").attr("action", "T_teammozip");
		$("#actionForm").submit();
	}); */
	$("#tab3").on("click", function(){
		if(confirm("페이지를 벗어나시겠습니까?")){
			$("#actionForm").attr("action", "T_oneline");
			$("#actionForm").submit();
		}
	});
	
});


function reloadList(){
	var params = $("#actionForm").serialize();

	$.ajax({
		url: "T_notices", 
		type: "post", 
		dataType: "json", 
		data: params, 
		success: function(res){ 
			drawList(res.list);
			drawPaging(res.pb);
		},
		error: function(request, status, error){ 
			console.log(error);
		}
	});
}

function drawList(list){
	var html = "";
	
	for(var data of list){
		if(data.TB_UP == 0){
			html += "<tr class=\"trclass\" no=\"" + data.TB_NO + "\">         ";
			html += "<td>" + data.TB_NO + "</td>   ";
			html += "<td>";
			html += data.TB_TITLE;
		
			 if(data.TB_FILE != null) {
		         html += "<img src=\"resources/images/icon/File.png\" />";
		      }
		
			html += "</td>";
			html += "<td>" + data.MEM_NM + "</td> ";
			html += "<td>" + data.T_BOARD_DT + "</td> ";
			html += "<td>" + data.TB_HIT + "</td>   ";
			
			
			html += "</tr>        ";
		}else{
			html += "<tr no=\"" + data.TB_NO + "\">         ";
			html += "<td>" + data.TB_NO + "</td>   ";
			html += "<td>";
			html += data.TB_TITLE;
		
			 if(data.TB_FILE != null) {
		         html += "<img src=\"resources/images/icon/File.png\" />";
		      }
		
			html += "</td>";
			html += "<td>" + data.MEM_NM + "</td> ";
			html += "<td>" + data.T_BOARD_DT + "</td> ";
			html += "<td>" + data.TB_HIT + "</td>   ";
			
			
			html += "</tr>        ";
		}
	}
	$("tbody").html(html);
}

function drawPaging(pb){
var html ="";
	
	html += "<span page=\"1\">처음</span>         ";
	
	if($("#page").val() == "1"){
		html += "<span page=\"1\">이전</span>         ";		
	}else {
		html += "<span page=\"" + ($("#page").val() * 1 - 1) + "\">이전</span>         ";		
	}
	
	for(var i = pb.startPcount ; i <= pb.endPcount ; i++){
		if($("#page").val() == i) {
			html += "<span page=\"" + i + "\"><b>" + i + "</b></span>     ";
		}else {
			html += "<span page=\"" + i + "\">" + i + "</span>     ";
		}
	}
	
	if($("#page").val() == pb.maxPcount){
		html += "<span page=\"" + pb.maxPcount + "\">다음</span>         ";
	}else{
		html += "<span page=\"" + ($("#page").val() * 1 + 1) + "\">다음</span>         ";
	}
	html += "<span page=\"" + pb.maxPcount + "\">마지막</span>       ";
	
	$(".paging_wrap").html(html);
}
</script>
</head>
<body>
<header>
	<jsp:include page="../header.jsp" flush="true" />
</header>
<main>
<jsp:include page="../nav.jsp" flush="true" />
<div class="tabcontent">
<div>
	<h2>${param.tnm}</h2>
	<p>${sMNm}님 안녕하세요. ${param.tnm} 커뮤니티 입니다 :)</p>
</div>
<div class="bigtab">
	<jsp:include page="../T_board.jsp" flush="true" />
<div class="righttab">
<h2>팀 공지사항</h2>
<div>
	<form action="#" id="loginForm" method="post">
		<input type="hidden" name="mem_no" value="${sMNo}">
	</form>
		
	<form action="#" id="actionForm" method="post">
		<select name="searchGbn" id="searchGbn">
			<option value="0">제목</option>
		</select>
		<input type="hidden" id="tno" name="tno" value="${param.tno}" />
		
		<input type="hidden" id="mno" name="mno" value="${sMNo}">
		
		<input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}" />
		<input type="hidden" id="oldTxt" value="${param.searchTxt}" />
		<input type="hidden" name="page" id="page" value="${page}" />
		<input type="hidden" name="no" id="no" />
		<input type="hidden" value="T_notice" id="mainlist" name="mainlist">
		<input type="button" value="검색" id="searchBtn" />
		<input type="button" value="작성" id="addBtn" />
	</form>
</div>
<div>
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
<div class="paging_wrap"></div>
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