<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀커뮤니티 팀소개</title>
	<link rel="stylesheet" href="resources/css/layout/font.css">
	<link rel="stylesheet" href="resources/css/layout/basic.css">
	<link rel="stylesheet" href="resources/css/layout/btn.css">
	<link rel="stylesheet" href="resources/css/layout/loginout.css">
	<link rel="stylesheet" href="resources/css/layout/nav.css">
	<link rel="stylesheet" href="resources/css/layout/table.css">
	<link rel="stylesheet" href="resources/css/layout/searchbox.css">
<style>
	.team_info, .team_sport {
		font-size: 1.3em;
	}
	
	.con_wrap {
		width: 100%;
		height: 100%;
		background-color: rgba(240, 240, 240, 10);
		min-width: 300px;
		min-height: 600px;
	}
	
	.list_wrap {
		text-align: center;
	}
	.btnzip{
		display : flex;
		justify-content: center;
		margin : 20px 30px 0px 30px ;
	}
	
	#backBtn, #regBtn, #enterBtn, #tMemManage{
		width: 100px;
		height: 30px;	
		border: 2.5px solid #1d2088;
		margin: 0px 100px 0px 100px;
	}
 	#regBtn:hover, #enterBtn:hover, #backBtn:hover, #tMemManage:hover {
		background-color:  #e3ecfb;
	}
	.img{
		margin: 40px;
	}
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script>
	$(document).ready(function() {
		
		// 팀장인 사람에게만 팀관리 버튼 노출
		if('${teamManageBtn}' > 0) {
			$("#tMemManage").show();
		} else {
			$("#tMemManage").hide();
		}
		
		// 팀 가입한 사람과 아닌사람에 따라 버튼 다르게 노출
		if('${cnt}' > 0 || '${teamManageBtn}' > 0) {
			$("#regBtn").hide();
			$("#enterBtn").show();
		} else {
			$("#regBtn").show();
			$("#enterBtn").hide();
		}
		
		// 관리자일 경우 입장하기 버튼만 노출
		if('${sMLv}' == 0) {
			$("#regBtn").hide();
			$("#enterBtn").show();
		}
		
		// 가입신청이 '승인대기'인 사람에게 버튼 비노출
		if('${applyState}' > 0) {
			alert("현재 가입승인대기 상태 입니다.");
			history.back();
			// $("#regBtn").hide();
			// $("#enterBtn").hide();
		} 
		
		// 뒤로가기 버튼
		$("#backBtn").on("click", function() {
			history.back();
		});
		
		// 가입하기 버튼 (가입되어있다면 hide)
		$("#regBtn").on("click", function() {
			
			var tno = $(".team_info").attr('no');
			$("#tno2").val(tno);
			// tno 알림용
			// alert("tno : " + $("#tno2").val());
			
			var mno = ${sMNo};
			$("#mno2").val(mno);
			// mem_no 알림용
			// alert("mno : " + $("#mno2").val());
			
			$("#actionForm").attr("action", "tReg");
			$("#actionForm").submit();
			
		});
		
		// 입장하기 버튼 (가입되어있지 않다면 hide)
		$("#enterBtn").on("click", function() {
			
			var tno = $(".team_info").attr('no');
			$("#tno2").val(tno);
			// tno 알림용
			// alert("tno : " + $("#tno2").val());
			
			var mno = ${sMNo};
			$("#mno2").val(mno);
			// mem_no 알림용
			// alert("mno : " + $("#mno2").val());
			
			$("#actionForm").attr("action", "T_boards");	// url 변경 필요
			$("#actionForm").submit();
		});
		
		$("#tMemManage").on("click",function() {
			
			var tno = $(".team_info").attr('no');
			$("#tno2").val(tno);
			
			var mno = ${sMNo};
			$("#mno2").val(mno);
			
			$("#actionForm").attr("action", "tMemManage");	
			$("#actionForm").submit();
		});
		
	}); // doc end
	
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
		
	<form action="#" id="actionForm" method="post">
		<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
		<input type="hidden" name="tno" id="tno2" />
		<input type="hidden" name="mno" id="mno2" />
		<input type="hidden" name="tnm" id="tnm" value="${data.TEAM_NM}"/>
	</form>
	
	<div class="team_info" no="${param.tno}">
		팀명: ${data.TEAM_NM}
	</div><hr>
	<div class="btnzip">
		<input type="button" id="backBtn" value="뒤로가기" />
		<!-- <div class="btn_wrap"> -->
			<input type="button" id="regBtn" value="가입하기" />
			<input type="button" id="enterBtn" value="입장하기" />
		<!-- </div> -->
	<!--주영추가  -->
	<input type="button" id="tMemManage" value="팀원관리" /><br><br>
	</div>
	
	<div class="con_wrap">
		<div class="list_wrap">
			<div class="team_img">
				<div>
					<img class="img" src="resources/images/블루타이거즈.jpg">
					<%-- <img src="resources/upload/${fn:replace(fn:replace(data.TEAM_LOGO, '[', '%5B'), ']', '%5D')}" width="100px" height="100px" /> --%>
				</div>
				<c:set var="len" value="${fn:length(data.TEAM_LOGO)}"></c:set>
				<a href="resources/upload/${fn:replace(fn:replace(data.TEAM_LOGO, '[', '%5B'), ']', '%5D')}" 
				download="${fn:substring(data.TEAM_LOGO, 20, len)}">${fn:substring(data.TEAM_LOGO, 20, len)}</a>
			</div>
			<br><br>
			<div class="team_sport">주종목 : ${data.SPORT_NM}</div><br><br>
			<div class="team_intro">${data.TEAM_INTRO}</div>
		</div>
		
	</div>
	
	</main><br><br>
	
	<footer>
		<jsp:include page="../footer.jsp" flush="true" />
	</footer>
	
	<script type="text/javascript" src="resources/css/js/header.js"></script>
</body>
</html>