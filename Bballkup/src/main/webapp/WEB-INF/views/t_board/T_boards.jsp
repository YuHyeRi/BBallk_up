<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		// 탭 클릭시 이동
		// 공지사항
		$("#tab2").on("click", function(){
			// 추가한 부분
			var tno = $(".team_no_list").attr('no');
			$("#tno3").val(tno);
			
			$("#actionForm").attr("action", "T_notice");
			$("#actionForm").submit();
		});
		
		// 자유게시판
		$("#tab4").on("click", function(){
			// 추가한 부분
			var tno = $(".team_no_list").attr('no');
			$("#tno3").val(tno);
			// alert("tno : " + $("#tno3").val());
			
			$("#actionForm").attr("action", "tFreeList");
			$("#actionForm").submit();
		});
		
		// 체활모
		$("#tab1").on("click", function(){
			// 추가한 부분
			var tno = $(".team_no_list").attr('no');
			$("#tno3").val(tno);
			
			$("#actionForm").attr("action", "T_teammozip");
			$("#actionForm").submit();
		});
		
		// 질문게시판(한줄게시판)
		$("#tab3").on("click", function(){
			// 추가한 부분
			var tno = $(".team_no_list").attr('no');
			$("#tno3").val(tno);
			
			$("#actionForm").attr("action", "T_oneline");
			$("#actionForm").submit();
		});
	
	});	// doc end
</script>
</head>
<body>
	<header>
		<jsp:include page="../header.jsp" flush="true" />
	</header>
	
	<main>
		<jsp:include page="../nav.jsp" flush="true" />
		<jsp:include page="../T_board.jsp" flush="true" />
		
		<div class="tabcontent">
			<div class="team_no_list" no="${param.tno}">
				<form action="#" id="actionForm" method="post">
					<input type="hidden" id="tab" value="${sNMo}" />
					<input type="hidden" id="tno3" name="tno">
					<input type="hidden" id="tnm" name="tnm" value="${param.tnm}">
				</form>
			</div>
		</div>
	</main>
	
	<footer>
		<jsp:include page="../footer.jsp" flush="true" />
	</footer>
</body>
</html>