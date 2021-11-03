<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지>>회원관리>>회원상세</title>
<style type="text/css">
#memImg{
	padding-bottom:20px;
}
.memInfo{
	display:flex;
}
.userdiv{
	margin-top:25px;
	padding-left:10px;
}
.team{
	margin-bottom:20px;
}
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
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
			drawList(res.list);
			drawMem(res.data);
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

function drawMem(data){
	var html = "";
	
	html += "<p>" + data.MEM_NM + "(" + data.MEM_ID + ")" + "</p>     ";
	html += "<p>" + data.MEM_PHONE + "</p>     ";
	
	$(".userdiv").html(html);
}
</script>
</head>
<body>
<h2>회원관리>>회원상세</h2>
<div class="memInfo">
	<img src ="resources/images/kitty.png" id="memImg" alt ="야옹이">
	<div class="userdiv">
	</div>
</div>
<form action="#" id="actionForm" method="post">
		<input type="hidden" name="mem_no" id="mem_no" value="${param.mem_no}">
		<input type="hidden" name="page" id="page" value="${param.page}">
</form>
<div class="team">
	<table>
		<thead>
			<tr>
				<th>팀번호</th>
				<th>팀명</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>
<input type="button" value="목록" id="listBtn">
</body>
</html>