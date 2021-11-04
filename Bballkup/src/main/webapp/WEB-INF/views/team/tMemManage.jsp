<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀장 - 팀원관리</title>
	<link rel="stylesheet" href="resources/css/layout/font.css">
	<link rel="stylesheet" href="resources/css/layout/basic.css">
	<link rel="stylesheet" href="resources/css/layout/btn.css">
	<link rel="stylesheet" href="resources/css/layout/loginout.css">
	<link rel="stylesheet" href="resources/css/layout/nav.css">
	<link rel="stylesheet" href="resources/css/layout/table.css">
<style>
#applyBtn:hover{
	background-color: #e3ecfb;
}
</style>	
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script>
	$(document).ready(function() {
		reloadList();
		
		$("tbody").on("click", "#applyBtn", function() {
			//console.log($(this).attr("no"));
			//console.log($(this).val());
			
			var no = $(this).attr("no");
			$("#mno").val(no);
			
			if($(this).val() == '승인완료'){
				alert("이미 승인된 팀원입니다.");
			} else {
				$("#actionForm").attr("action","tMemManageUpdate");
				$("#actionForm").submit(); 
				 
				var params = $("#actionForm").serialize();
				 
				$.ajax({
					url : "tMemManageUpdate",	
					type : "post",			
					dataType : "json",		
					data : params,			
					success : function(res){
						drawList(res.list);
					},
					error : function(request, status, error){
						console.log(error);
					}
				});
			}
		});
	});
	
	function reloadList(){		
		var params = $("#actionForm").serialize(); 
		
		$.ajax({
			url : "tMemManageAjax",	
			type : "post",			
			dataType : "json",		
			data : params,			
			success : function(res){
				drawList(res.list);
			},
			error : function(request, status, error){
				console.log(error);
			}
		});
	}
	
	function drawList(list){
		var html = "";
		
		for(var data of list){

			html += "<tr no=\"" + data.MEM_NO + "\">           ";
			html += "<td>" + data.MEM_NO + "</td>     ";
			html += "<td>" + data.MEM_NM + "</td>     ";
			html += "<td>" + data.T_MEM_DT + "</td>  ";
			html += "<td>" + data.APPLY_STATE + "</td>  ";
			html += "<td><input type=\"button\" id=\"applyBtn\" no=\"" + data.MEM_NO + "\" value=\""+data.APPLY_STATE+"\"></td>  ";
			html += "</tr>          ";				
		}
		
		$("tbody").html(html);
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
	
	<h2>팀원관리</h2>
	<form action="#" id="actionForm" method="post">
		<input type="hidden" id="mno" name="mno" />
		<input type="hidden" name="tno" id="tno" value="${param.tno}"/>
	</form>
		<table class="notice_table">
			<thead>
				<tr class="nonetr">
					<th>회원번호</th>
					<th>회원명</th>
					<th>신청날짜</th>
					<th>승인여부</th>
					<th>승인/추방버튼</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table> 
		<br><br>
</main>
<br><br>
	
	<footer>
		<jsp:include page="../footer.jsp" flush="true" />
	</footer>
	
	<script type="text/javascript" src="resources/css/js/header.js"></script>
</body>
</html>