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
    outline: 1.5px solid #1d2088;
}
.nonetr{
	style: none;
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
	
	$("#addBtn").on("click", function(){
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#actionForm").attr("action", "NoticeAdd");
		$("#actionForm").submit();
	});
	
	$("#loginBtn").on("click",function(){
		
		$("#actionForm").attr("action","login");
		$("#actionForm").submit();
	});
	
	/* $("#loginBtn").on("click",function(){
		location.href = "login";
	}); */
	$("#logoutBtn").on("click", function(){
		location.href = "logout";
	});
	
	//검색
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
	
	//페이징
	$(".paging_wrap").on("click", "span", function(){
		$("#page").val($(this).attr("page"));
		$("#searchTxt").val($("#oldTxt").val());
		
		reloadList();
	});
	
	$("tbody").on("click", "tr", function(){ 
		$("#no").val($(this).attr("no"));
		
		$("#actionForm").attr("action", "Notice");
		$("#actionForm").submit();
	});
	
});

function reloadList(){
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url: "NoticeLists", 
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
//List
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
<h2>공지사항 목록</h2>
<div>
	<c:choose>
		<c:when test="${empty sMNo}">
			<input type="button" value="로그인" id="loginBtn" class="loginBtn"/>
		</c:when>
		<c:otherwise>
			${sMNm}님 어서오세요.<input type="button" value="로그아웃" id="logoutBtn" class="logoutBtn" />
		</c:otherwise>
	</c:choose>
</div>
<div>
	<form action="#" id="actionForm" method="post">
		<select name="searchGbn" id="searchGbn">
			<option value="0">제목</option>
			<!-- <option value="1"></option> -->
		</select>
		
		<input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}" />
		<input type="hidden" id="oldTxt" value="${param.searchTxt}" />
		<input type="hidden" name="page" id="page" value="${page}" />
		<input type="hidden" name="no" id="no" />
		<input type="hidden" value="Notice" id="mainlist" name="mainlist">
		<input type="button" value="검색" id="searchBtn" class="searchBtn" />
		<c:if test="${sMLv eq 0}">
			<input type="button" value="작성" id="addBtn" />
		</c:if>
	</form>
</div>
<div>
	<table class="notice_table">
		<thead>
			<tr class="nonetr">
				<th>번호</th>
				<th>제목</th>
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
</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>
</body>
</html>