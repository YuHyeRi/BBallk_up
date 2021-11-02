<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지-팀가입현황</title>
	<link rel="stylesheet" href="resources/css/layout/font.css">
	<link rel="stylesheet" href="resources/css/layout/basic.css">
	<link rel="stylesheet" href="resources/css/layout/btn.css">
	<link rel="stylesheet" href="resources/css/layout/loginout.css">
	<link rel="stylesheet" href="resources/css/layout/nav.css">
	<link rel="stylesheet" href="resources/css/layout/login.css">
	<link rel="stylesheet" href="resources/css/layout/table.css">
	
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	reloadList();
	
	//로그인
	$("#loginBtn").on("click", function(){
		location.href = "m1Login";
	});
	//로그아웃
	$("#logoutBtn").on("click", function(){
		location.href = "m1Logout";
	});
	
	$("tbody").on("click", "tr", function(){
		
		$("#actionForm").attr("action", "myTeamJoinAjax");
		$("#actionForm").submit();
	});
}); //document end

//데이터 취득
function reloadList(){

	var params = $("#actionForm").serialize(); // form의 데이터를 문자열로 변환
	
	$.ajax({	//jquery의 ajax 함수 호출
		url : "myTeamJoinAjax",	// 접속
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
		
		html += "<tr no=\"" + data.MEM_NO + "\">           ";
		html += "<td>" + data.MEM_NO + "</td>     ";
		html += "<td>" + data.TEAM_NO + "</td>     ";
		html += "<td>" + data.TEAM_NM + "</td>     ";
		html += "<td>" + data.APPLY_STATE + "</td>  ";
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
	<h2>내가 가입한 팀 목록</h2>
	<form action="#" id="actionForm" method="post">
	<input type="hidden" name="mem_no" id="mem_no" value="${sMNo}">
		<table>
			<thead>
				<tr>
					<th>회원번호</th>
					<th>팀번호</th>
					<th>팀명</th>
					<th>승인여부</th>
					<th>회원등급</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</form>
</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>
<script type="text/javascript" src="resources/css/js/header.js"></script>
</body>
</html>