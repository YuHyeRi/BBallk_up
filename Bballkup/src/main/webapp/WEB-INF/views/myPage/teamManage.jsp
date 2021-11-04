<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지>>팀관리</title>
	<link rel="stylesheet" href="resources/css/layout/font.css">
	<link rel="stylesheet" href="resources/css/layout/basic.css">
	<link rel="stylesheet" href="resources/css/layout/btn.css">
	<link rel="stylesheet" href="resources/css/layout/loginout.css">
	<link rel="stylesheet" href="resources/css/layout/nav.css">
	<link rel="stylesheet" href="resources/css/layout/table.css">
	<link rel="stylesheet" href="resources/css/layout/searchbox.css">
	
<style type="text/css">

.applyBtn {
	width: 100px;
    background-color: white;
    padding: 5px;
    border-radius: 5px;
    border: 2.5px solid #1d2088;
    margin-bottom: 20px;
    cursor: pointer;
    margin: 10px;
}
tr:hover{
	background-color : #e3ecfb;
	cursor:pointer;
}
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	reloadList();
	
	$("tbody").on("click", ".applyBtn", function() {
		//console.log($(this).attr("no"));
		//console.log($(this).val());
		
		var tno = $(this).attr("no");
		$("#tno").val(tno);
		
		if($(this).val() == '승인완료'){
			alert("이미 승인된 팀입니다.");
		} else {			
			var params = $("#actionForm").serialize();
			 
			$.ajax({
				url : "teamManageUpdate",	
				type : "post",			
				dataType : "json",		
				data : params,			
				success : function(res){
					if(res.cnt > 0){
						reloadList();						
					}
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
		url : "teamManages",	
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

		html += "<tr no=\"" + data.TEAM_NO + "\">";
		html += "<td>" + data.MEM_NM + "</td>     ";
		html += "<td>" + data.TEAM_NM + "</td>  ";
		html += "<td>" + data.TEAM_JOIN_DT + "</td>  ";
		html += "<td>"		
		 if(data.TEAM_STATE == "승인완료") {
		    html += "<p style = \"color:#1d2088;\"> "+ data.TEAM_STATE ;
		  } else {
		    html += "<p style = \"color:red;\"> "+ data.TEAM_STATE ;
		  }		
		html += "</td>";
		html += "<td>"
		
			if(data.TEAM_STATE == "승인완료") {
		    	html += "<input type=\"button\" style = \"background-color:#e3ecfb;\" class=\"applyBtn\" no=\"" + data.TEAM_NO + "\" value=\""+data.TEAM_STATE+"\">  ";
		  	} else {
			  	html += "<input type=\"button\" style = \"background-color:pink;\" class=\"applyBtn\" no=\"" + data.TEAM_NO + "\" value=\""+data.TEAM_STATE+"\">  "; 
		  	}				
		html += "</td>";
		html += "<td>"
			
			if(data.TEAM_APPRO_DT == null) {
		    	html += "<p>" + "-" + "</p>";
			} else {
				html += data.TEAM_APPRO_DT;
			}
		html += "</td>";
		html += "</tr>";				
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
<h2>관리자페이지 >> 팀관리</h2>
<br>
<form action="#" id="actionForm" method="post">
	<%-- <input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}" >
	<input type="hidden" name="oldTxt" id="oldTxt" value="${param.searchTxt}" >
	<input type="hidden" name="page" id="page" value="${page}"> --%>
	<input type="hidden" name="mem_no" id="mem_no">
	<input type="hidden" name="tno" id="tno"/>
	<%-- <input type="hidden" name="tno" id="tno" value="${param.tno}"/> --%>
		
	<!-- <select name="searchGbn" id="searchGbn">
		<option value="0">팀번호</option>
		<option value="1">팀명</option>
	</select>
	<input type="button" value="검색" id="searchBtn"> -->
</form>
<div>
	<table class="notice_table">
		<thead>
			<tr class = "nonetr">
				<th>회원명</th>
				<th>팀명</th>
				<th>팀신청일자</th>
				<th>팀승인상태</th>
				<th>팀승인버튼</th>
				<th>팀승인일자</th>
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