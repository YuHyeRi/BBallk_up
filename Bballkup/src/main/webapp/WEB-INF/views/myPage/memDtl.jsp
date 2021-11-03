<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지>>회원관리>>회원상세</title>
	<link rel="stylesheet" href="resources/css/layout/font.css">
	<link rel="stylesheet" href="resources/css/layout/basic.css">
	<link rel="stylesheet" href="resources/css/layout/btn.css">
	<link rel="stylesheet" href="resources/css/layout/loginout.css">
	<link rel="stylesheet" href="resources/css/layout/nav.css">
	<link rel="stylesheet" href="resources/css/layout/table.css">
	<link rel="stylesheet" href="resources/css/layout/myCard.css">
	
<style type="text/css">
#memImg{
	padding-top:40px;
	width:60px;
	height:60px;
}
.memInfo{
	display:flex;
	padding-bottom:30px;
	justify-content: center;
}
.userdiv{
	margin-top:25px;
	padding-left:10px;
}
#listBtn:hover{
	background-color: #e3ecfb;
    cursor: pointer;
}
#listBtn{
	float:right;
	margin-top:20px;
}
h2{
	display:inline-block;
}
.noneDiv{
	text-align:center;
}
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#login").on("click",function(){
	   $("#loginForm").attr("action","login");
	   $("#loginForm").submit();});
		      
	$("#logout").on("click", function(){
	   $("#loginForm").attr("action","logout");
	   $("#loginForm").submit();
	});

	$("#join").on("click", function(){
	   $("#loginForm").attr("action","join");
	   $("#loginForm").submit();
	});
	      
	$("#mgrpage").on("click", function(){
	   $("#loginForm").attr("action","mgrPage");
	   $("#loginForm").submit();
	});

	$("#listBtn").on("click", function(){
		$("#actionForm").attr("action", "memManage");
		$("#actionForm").submit();
	});
	
	reloadList();
});

function reloadList(){
	
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url : "memDtls",	
		type : "post",			
		dataType : "json",		
		data : params,			
		success : function(res){
			drawMem(res.data);
			if(res.list.length == 0){
				nonMsg();
			}else{
				drawList(res.list);
			}
		},
		error : function(request, status, error){
			console.log(error);
		}
	});
}

function drawList(list){
	var html = "";
	
	for(var data of list){
		
		html += "<tr>           ";
		html += "<td>" + data.TEAM_NO + "</td>     ";
		html += "<td>" + data.TEAM_NM + "</td>     ";
		html += "</tr>          ";	
			
	}
	
	$("tbody").html(html);
}

	function nonMsg(){
	var html = "";
	
	html = "<p> 현재 소속된 팀이 없습니다 </p>";

	$(".noneDiv").html(html);
}

function drawMem(data){
	var html = "";
	
	html += "<p>" + data.MEM_NM + "(" + data.MEM_ID + ")" + "</p>     ";
	html += "<p>" + data.MEM_PHONE + "</p>     ";
	
	$(".userdiv").html(html);
}
</script>
</head>
<body>
<header>
	<jsp:include page="../header.jsp" flush="true" />
</header>
<main>
<jsp:include page="../nav.jsp" flush="true" />
<div class="cardBig">
<div class="cardDiv">
<form action="#" id="loginForm" method="post">
   <input type="hidden" id="mem_no" name="mem_no" value="${sMNo}">
</form>
<div class="topDiv">
<h2>회원관리 >> 회원상세</h2>
<input type="button" value="목록으로" id="listBtn">
</div>

<div class="memInfo">
	<img src ="resources/images/icon/사진.png" id="memImg" alt ="야옹이">
	<div class="userdiv">
	</div>
</div>
<form action="#" id="actionForm" method="post">
		<input type="hidden" name="mem_no" id="mem_no" value="${param.mem_no}">
		<input type="hidden" name="page" id="page" value="${param.page}">
</form>
<div class="team">
	<table class="notice_table">
		<thead>
			<tr class = "nonetr">
				<th>팀번호</th>
				<th>팀명</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>
<div class="noneDiv"></div>
</div>
</div>
</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>

<script type="text/javascript" src="resources/css/js/header.js"></script>
</body>
</html>