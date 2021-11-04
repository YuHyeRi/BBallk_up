<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객지원-질문답변게시판</title>
	<link rel="stylesheet" href="resources/css/layout/font.css">
	<link rel="stylesheet" href="resources/css/layout/basic.css">
	<link rel="stylesheet" href="resources/css/layout/btn.css">
	<link rel="stylesheet" href="resources/css/layout/loginout.css">
	<link rel="stylesheet" href="resources/css/layout/nav.css">
	<link rel="stylesheet" href="resources/css/layout/table.css">
	<link rel="stylesheet" href="resources/css/layout/searchbox.css">
	<link rel="stylesheet" href="resources/css/layout/T_board.css">
<style>
.ob_wrap {
	width: 100%;
	border: 1px solid #444444;
}
.write_area {
    display: flex;
	height: 100px;
	background-color : #e3ecfb;
	border-radius: 10px;
}
.user_info {
	width : 100px;
	text-align: center;
	padding-top: 45px;
}
.ob_data{
	display: flex;
	height: 100px;
}
.write_con_wrap, .con_info {
	width: 80%;
	height: 100px;
}
.write_con, .q_re_con {
	
	border : none;
	resize: none;
	width: 99%;
    height: 90%;
    margin: 2px;
}
.reple_wrap>.con_info {
	border: 1px solid #e3ecfb;
}
.ob_data_reple{
	display: flex;
}
.reple_wrap{
    height: 100px;
    display: flex;
    width: 100%;
}
.con_info{
	width: 80%;
    border: 1px solid #e3ecfb;
}
.btn_wrap{
	width : 20%;
	text-align: center;
}
.write_area .action_btn2 {
  display: none;
 }
 .action_btn, .action_btn4{
 	height: 90px;
 }
 .action_btn2, .action_btn3, .action_btn5, .action_btn4{
 	background-color: white;
    padding: 5px;
    width: 80px;
    border-radius: 5px;
    border: 2px solid #1d2088;
    cursor: pointer;
 }

</style>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	if("${page}" > "${pb.maxPcount}"){
		$("#page").val("${pb.maxPcount}");
		$("#actionForm").submit();
	}
	
	// textarea에 val가 없을때 영역 감추기 
	$(".q_re_con").each(function() {
		console.log($(this).val());
		if($(this).val() == "") {
			$(this).parent().parent().parent().children(".reple_text_area").hide();
		} else {
			$(this).parent().parent().hide();
		}
	});
	
	// 목록에서 "수정"버튼을 눌렀을때
	$(".ob_list_wrap").on("click","#updateBtn", function(){			
		var con = $(this).parent().parent().children(".con_info").children(".con").html();
		$(".write_con").val(con); // 내용 셋팅
		
		var no = $(this).parent().parent().attr("no");
		$("#no").val(no);
		
		$(".write_area .action_btn").hide(); 
		$(".write_area .action_btn2").show(); 
	});
	
	$(".write_area #cancelBtn").on("click",function(){
		$(".write_con").val(""); 
		$("#no").val("");
		
		$(".write_area .action_btn").show();
		$(".write_area .action_btn2").hide();
	});
	
	$("body").on("click","#loginBtn",function() { 
		location.href = "login";		
	});
	
	$("#logoutBtn").on("click",function() {
		location.href = "logout";
	});
	
	// 저장
	$(".write_area #addBtn").on("click",function(){	
		
		if(checkVal("#q_con")){
			alert("내용을 입력하세요.");
			$("#q_con").focus();
	  } else {
		  $("#actionForm").attr("action","T_onelineAdds");
		  $("#actionForm").submit(); 
	   }
	});
	
	// 수정 
	$(".write_area #update2Btn").on("click",function(){	
		if(checkVal("#q_con")){
			alert("내용을 입력하세요.");
			$("#q_con").focus();
		} else {
			$("#actionForm").attr("action","T_onelineUpdates");
			$("#actionForm").submit();
		}
	});
	
	//삭제
	$(".ob_list_wrap #deleteBtn").on("click",function() {	
		var no = $(this).parent().parent().attr("no");
		$("#no").val(no);
		
		if(confirm("삭제하시겠습니까?진짜?")) { 
			$("#actionForm").attr("action","T_onelineDelete"); 
			$("#actionForm").submit();
		}
	});
	
	//페이징
	$(".paging_wrap").on("click","span",function() {
		$("#actionForm").attr("action","T_oneline");
		$("#page").val($(this).attr("page"));
		$("#actionForm").submit();
	});
	
	//답변등록버튼
	$(".reple_write_area").on("click","#reple_addBtn", function() {
		var no = $(this).parent().parent().parent().attr("no");
		$("#no2").val(no);
		
		var con = $(this).parent().parent().children(".con_info").children(".q_re_con").val();
		$("#q_re_con").val(con);	
		
		if(checkObjVal($(this).parent().parent().children(".con_info").children(".q_re_con"))){
			alert("내용을 입력하세요.");
			$(this).parent().parent().children(".con_info").children(".q_re_con").focus();
		} else {
			$("#RepleForm").attr("action","T_onelineReple");
			$("#RepleForm").submit();
		}
	});
	
	//답변 수정버튼(ㅇㅇ) 
	$(".reple_text_area").on("click","#reple_text_updateBtn", function(){		
		$(this).parent().parent().hide();
		$(this).parent().parent().parent().children(".reple_write_area").show();		
	}); 
	
	$(".reple_write_area").on("click","#reple_write_updateBtn", function(){
		
		var no = $(this).parent().parent().parent().attr("no");	
		$("#no2").val(no);
		
		var con = $(this).parent().parent().children(".con_info").children(".q_re_con").val();
		$("#q_re_con").val(con);
		
		if(checkObjVal($(this).parent().parent().children(".con_info").children(".q_re_con"))){
			alert("내용을 입력하세요.");
			$(this).parent().parent().children(".con_info").children(".q_re_con").focus();
		} else {
			$("#RepleForm").attr("action","T_onelineReple");
			$("#RepleForm").submit();
		}
	});
	
	//답변 삭제
	 $(".reple_wrap").on("click","#reple_deleteBtn", function(){
		 var no = $(this).parent().parent().parent().attr("no");
		$("#no2").val(no);
		
		if(confirm("답변을 삭제하시겠습니까?")) { 
			$("#RepleForm").attr("action","T_onelineRepleDel");
			$("#RepleForm").submit();
		}
	 });
	
	//답변수정취소
	$(".reple_wrap #reple_cancelBtn").on("click",function(){
		$(this).parent().parent().parent().children(".con_info").children(".q_re_con").val($(this).parent().parent().parent().children(".reple_text_area").children(".con_info").children(".reple_con").html());
		$(this).parent().parent().hide();
		$(this).parent().parent().parent().children(".reple_text_area").show();
	});
	
	$("#tab2").on("click", function(){
		$("#actionForm").attr("action", "T_notice");
		$("#actionForm").submit();
	});
	$("#tab4").on("click", function(){
		$("#actionForm").attr("action", "tFreeList");
		$("#actionForm").submit();
	});
	$("#tab1").on("click", function(){
		$("#actionForm").attr("action", "T_teammozip");
		$("#actionForm").submit();
	});
	$("#tab3").on("click", function(){
		$("#actionForm").attr("action", "T_oneline");
		$("#actionForm").submit();
	});
});


function checkVal(sel) {
	if($.trim($(sel).val()) == "") {
		return true;
	} else {
		return false;
	}
}

function checkObjVal(obj) {
	if($.trim(obj.val()) == "") {
		return true;
	} else {
		return false;
	}
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
<div class="tabcontent">
<div>
	<h2>${param.tnm}</h2>
	<p>${sMNm}님 안녕하세요. ${param.tnm} 커뮤니티 입니다 :)</p>
</div>
<div class="bigtab">
	<jsp:include page="../T_board.jsp" flush="true" />
<div class="righttab">
<h2>팀 한줄게시판</h2>
	<!-- 작성+리스트 -->
<div class="ob_wrap">	
	<form action="#" id="actionForm" method="post">
	<input type="hidden" id="no" name="no"/>
	<input type="hidden" id="mno" name="mno" value="${sMNo}"/>
	<input type="hidden" name="page" id="page" value="${page}"/>
	<input type="hidden" id="tno" name="tno" value="${param.tno}" />
	
	<div class="write_area">
		<c:choose>
			<c:when test="${empty sMNo}">
				<div class="login_req_wrap">
					<div class="login_req"> 작성 시 로그인이 필요합니다. 
					<input type="button" value="로그인" id="loginBtn"/></div>
				</div>	
			</c:when>
			<c:otherwise>			
				<div class="user_info">
					<div class="user_name">${sMNm}</div>
				</div>
				<div class="write_con_wrap">
					<textarea class="write_con" id="q_con" name="q_con"></textarea>
				</div>
				<div class="btn_wrap" no="${data.TEAM_NO}">
					<input type="button" value="저장" class="action_btn" id="addBtn"/>
					<input type="button" value="수정" class="action_btn2" id="update2Btn"/>
					<input type="button" value="취소" class="action_btn2" id="cancelBtn"/>
				</div>			
		    </c:otherwise>
		</c:choose>
	</div>
	</form>
	<form action="#" id ="RepleForm" method="post">
		<input type="hidden" name="no" id="no2" />
		<input type="hidden" id="mno" name="mno" value="${mno}"/>
		<input type="hidden" id="tno" name="tno" value="${param.tno}" />
		<input type="hidden" name="q_re_con" id="q_re_con" />
	</form>
	<!-- List -->
	<div class="ob_list_wrap">
		<c:choose>
			<c:when test="${fn:length(list) eq 0}">
				<div class="data_req_wrap">
					<div class="data_req">데이터가 없습니다.</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="data" items="${list}">
					<div class="ob_data" no="${data.TB_NO}">
						<div class="user_info">
							<div class="user_name">${data.MEM_NM}</div>
						</div>
						<div class="con_info">
							<div class="con">${data.TB_CON}</div>
						</div>
						<div class="btn_wrap">				
							<c:if test="${data.MEM_NM eq sMNm}">
								<input type="button" value="수정" class="action_btn2" id="updateBtn" />								
								<input type="button" value="삭제" class="action_btn2" id="deleteBtn" />
							</c:if>
						</div>
					</div>
					<!-- 댓글영역 -->
					<div class="ob_data_reple" id="ob_data_reple" no="${data.TB_NO}">
						<c:if test="${!empty data.TB_Q_RE_CON}">
						<div class="reple_wrap reple_text_area" >
							<div class="user_info">
								<img src="resources/images/icon/답변.png" width="50px" height="50px">			
							</div>
							<div class="con_info">
								<div id="reple_con" class="reple_con">${data.TB_Q_RE_CON}</div>
							</div>
							<div class="btn_wrap">
								<c:if test="${sMNo eq 5}">
									<input type="button" value="수정" class="action_btn3" id="reple_text_updateBtn" />
									<input type="button" value="삭제" class="action_btn3" id="reple_deleteBtn" />					
								</c:if>
							</div>
						</div>
						</c:if>
						<c:if test="${sMNo eq 5}">
							<div class="reple_wrap reple_write_area" >
								<div class="user_info">
									<img src="resources/images/icon/답변.png" width="50px" height="50px">			
								</div>
								<div class="con_info">
									<textarea class="q_re_con" placeholder="댓글을 입력해주세요.">${data.TB_Q_RE_CON}</textarea>	
								</div>
								<div class="btn_wrap">
									<c:choose>
										<c:when test="${empty data.TB_Q_RE_CON}">
											<input type="button" value="등록" class="action_btn4" id="reple_addBtn" />
										</c:when>
										<c:otherwise>
											<input type="button" value="수정" class="action_btn5" id="reple_write_updateBtn" />
											<input type="button" value="취소" class="action_btn5" id="reple_cancelBtn"/>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</c:if>										
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>		
	</div>

<!-- Paging -->
	<div class="paging_wrap">		
		<c:choose>
			<c:when test="${page eq 1}"> 
				<span page="1">이전</span>
			</c:when>
			<c:otherwise>
				<span page="${page - 1}">이전</span>
			</c:otherwise>
		</c:choose>	
		<c:forEach var="i" begin="${pb.startPcount}" end="${pb.endPcount}" step="1">
			<c:choose>
				<c:when test="${page eq i}"> 
				<span page="${i}"><b>${i}</b></span>
				</c:when>
				<c:otherwise>
					<span page="${i}">${i}</span>
				</c:otherwise>
			</c:choose>
		</c:forEach>		
		<c:choose>
			<c:when test="${page eq pb.maxPcount}">
				<span page ="${pb.maxPcount}">다음</span>
			</c:when>
			<c:otherwise>
				<span page ="${page + 1}">다음</span>
			</c:otherwise>
		</c:choose>
	</div>
</div>
</div>
</div>
</div>
</main>	
	<script type="text/javascript" src="resources/css/js/header.js"></script>
</body>
</html>