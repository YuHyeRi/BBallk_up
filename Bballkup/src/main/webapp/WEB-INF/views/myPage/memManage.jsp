<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지>>회원관리</title>
	<link rel="stylesheet" href="resources/css/layout/font.css">
	<link rel="stylesheet" href="resources/css/layout/basic.css">
	<link rel="stylesheet" href="resources/css/layout/btn.css">
	<link rel="stylesheet" href="resources/css/layout/loginout.css">
	<link rel="stylesheet" href="resources/css/layout/nav.css">
	<link rel="stylesheet" href="resources/css/layout/table.css">
	<link rel="stylesheet" href="resources/css/layout/searchbox.css">

<style type="text/css">
.paging_wrap span {
   cursor: pointer;
}
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	if("${param.searchGbn}" != ""){
		$("#searchGbn").val("${param.searchGbn}");
	}
	
	reloadList();

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
		$("#mem_no").val($(this).attr("no"));
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#actionForm").attr("action", "memDtl");
		$("#actionForm").submit();
	});
	
});
function reloadList(){
	
	var params = $("#actionForm").serialize(); 
	
	$.ajax({
		url : "memManages",	
		type : "post",			
		dataType : "json",		
		data : params,			
		success : function(res){
			drawList(res.list);
			drawPaging(res.pb);
		},
		error : function(request, status, error){
			console.log(error);
		}
	});
}

function drawList(list){
	var html = "";
	
	for(var data of list){

		html += "<tr no=\"" + data.MEM_NO +"\">           ";
		html += "<td>" + data.MEM_NO + "</td>     ";
		html += "<td>" + data.MEM_ID + "</td>     ";
		html += "<td>" + data.MEM_NM + "</td>     ";
		html += "<td>" + data.MEM_JOIN + "</td>  ";
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
<header>
	<jsp:include page="../header.jsp" flush="true" />
</header>
<main>
<jsp:include page="../nav.jsp" flush="true" />
<h2>관리자페이지 >> 회원관리</h2>
회원검색<br>
<form action="#" id="actionForm" method="post">
		<input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}" >
		<input type="hidden" name="oldTxt" id="oldTxt" value="${param.searchTxt}" >
		<input type="hidden" name="page" id="page" value="${page}">
		<input type="hidden" name="mem_no" id="mem_no">
		
		<select name="searchGbn" id="searchGbn">
			<option value="0">아이디</option>
			<option value="1">이름</option>
		</select>
		<input type="button" value="검색" id="searchBtn">
</form>
<div>
	<table class="notice_table">
		<thead>
			<tr class = "nonetr">
				<th>회원번호</th>
				<th>아이디</th>
				<th>회원명</th>
				<th>가입일자</th>
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