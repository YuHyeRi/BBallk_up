<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	
<style>
#att {
	display: none;
}
.hide_btn {
	display: none;
}
.teambtndiv{
	height: 470px;
}
</style>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
		src="resources/script/jquery/jquery.form.js"></script>  <!-- Ajax쓰려면 필요함 -->
<script type = "text/javascript"
		src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	CKEDITOR.replace("con",{
		resize_enabled : false,
		language : "ko",
		enterMode : "2"
	});
	
	$("#cancelBtn").on("click", function(){
		$("#backForm").submit();
	});
	
	$("#updateForm").on("keypress", "input", function(event){
		if(event.keyCode == 13){
			return false;
		}
	});
	
	$("#fileBtn").on("click", function(){
		$("#att").click();
	});
	
	$("#att").on("change", function(){
		$("#fileName").html($(this).val().substring($(this).val().lastIndexOf("\\")+ 1));
	});
	
	$("#fileDelBtn").on("click", function(){
		$("#fileName").html("");
		$("#NFile").val("");
		$("#fileBtn").attr("class", "");
		$(this).remove();
	});
	
	$("#tab2").on("click", function(){
		if(confirm("페이지를 벗어나시겠습니까?")){
			$("#updateForm").attr("action", "T_notice");
			$("#updateForm").submit();	
		}
	});
	$("#tab4").on("click", function(){
		if(confirm("페이지를 벗어나시겠습니까?")){
			$("#updateForm").attr("action", "tFreeList");
			$("#updateForm").submit();
		}
	});
	$("#tab1").on("click", function(){
		if(confirm("페이지를 벗어나시겠습니까?")){
			$("#updateForm").attr("action", "T_teammozip");
			$("#updateForm").submit();
		}
	});
	$("#tab3").on("click", function(){
		if(confirm("페이지를 벗어나시겠습니까?")){
			$("#updateForm").attr("action", "T_oneline");
			$("#updateForm").submit();
		}
	});
	
	$("#updateBtn").on("click", function(){
		$("#con").val(CKEDITOR.instances['con'].getData());
		
		if($("#upbtn2").is(":checked")){
			$("[name='upbtn']").val("0");
		}else{
			$("[name='upbtn']").val("1");
		}
		
		if(checkVal("#title")){
			alert("제목을 입력해 주세요.");
			$("#title").focus();
		}else if(checkVal("#con")){
			alrert("내용을 입력해 주세요.");
		}else {
			var fileForm= $("#fileForm");
			
			fileForm.ajaxForm({
				success : function(res){
					if(res.result == "SUCCESS"){
						if(res.fileName.length > 0 ){ 
							$("#NFile").val(res.fileName[0]);
						}
						//글 수정
						var params = $("#updateForm").serialize();
						
						$.ajax({
							url: "T_noticeUpdates",
							type: "post",
							dataType: "json",
							data: params,
							success: function(res){
								if(res.result == "success"){
									$("#backForm").submit();
								}else if (res.result == "failed"){
									alert("수정에 실패하였습니다.");
								}else{
									alert("수정중 문제가 발생했습니다.");
								}
							},
							error: function(request, status, error){
								console.log(error);
							}
						});
					}else {
						alert("파일 업로드에 실패하였습니다..");
					}
				},
				error : function(req, status, error){
					console.log(error);
					alert("파일 업로드중 문제가 발생했습니다.");
				}
			});
			fileForm.submit();
		} 
	}); 
});

function checkVal(sel) {
		   if($.trim($(sel).val())== ""){
			      return true;
			   } else {
	   return false;
	}
}
</script>
</head>
<body>
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
<h2>팀 공지사항</h2>
	<form action="#" id="loginForm">
	<input type="hidden" id="mem_no" name="mem_no" value="${sMNo}">
	</form>
	<form id="fileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
		<input type="file" name="att" id="att" />
	</form>
	<form action="T_notice" id="backForm" method="post">
		<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
		<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
		<input type="hidden" name="page" value="${param.page}" />
		<input type="hidden" name="no" value="${param.no}" />
		<input type="hidden" name="tno" value="${param.tno}" />
	</form>
	<form action="#" id="updateForm" method="post">
		<input type="hidden" name="tno" value="${param.tno}" >
		${data.TB_NO}<input type="hidden" name="no" value="${param.no}" />
		<input type="text" id="title" name="title" value="${data.TB_TITLE}" />
		<input type="hidden" id="tab" value="${sNMo}" />
		<input type="hidden" name="upbtn" value="사과" />
		<c:choose>
			<c:when test="${data.TB_UP eq 0}">
				<input type="checkbox" id="upbtn2" name="upbtn" checked> 중요공지 <br/>
			</c:when>
			<c:otherwise>
				<input type="checkbox" id="upbtn2" name="upbtn"> 중요공지 <br/>
			</c:otherwise>
		</c:choose><br>
		${sMNm} <input type="hidden" name="mno" value="${sMNo}" /><br/><br>
		<textarea rows="5" cols="5" id="con" name="con">${data.TB_CON}</textarea><br/>
		<div class ="userinfodiv">
			첨부파일 : 
			<c:choose>
				<c:when test="${!empty data.TB_FILE}">
					<input type="button" value="첨부파일선택" id="fileBtn" class="hide_btn"/>
				</c:when>
				<c:otherwise>
					<input type="button" value="첨부파일선택" id="fileBtn"/>
				</c:otherwise>
			</c:choose>
			<c:set var="len" value="${fn:length(data.TB_FILE)}"></c:set>
			<span id="fileName">${fn:substring(data.TB_FILE, 20, len)}</span>
			<c:if test="${!empty data.TB_FILE}">
				<input type="button" value="첨부파일삭제" id="fileDelBtn"/>
			</c:if>
			<input type="hidden" name="NFile" id="NFile" value="${data.TB_FILE}" />
		<div class="buttondiv">
			<input type="button" value="저장" id="updateBtn" />
			<input type="button" value="취소" id="cancelBtn" />
		</div>
		</div>	
	</form>
</div>
</div>
</div>
</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>
<script type="text/javascript" src="resources/css/js/header.js"></script>
</body>
</html>