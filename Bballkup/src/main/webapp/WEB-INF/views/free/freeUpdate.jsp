<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인커뮤니티 자유게시판</title>
	<link rel="stylesheet" href="resources/css/layout/font.css">
	<link rel="stylesheet" href="resources/css/layout/basic.css">
	<link rel="stylesheet" href="resources/css/layout/btn.css">
	<link rel="stylesheet" href="resources/css/layout/loginout.css">
	<link rel="stylesheet" href="resources/css/layout/nav.css">
	<link rel="stylesheet" href="resources/css/layout/table.css">
	<link rel="stylesheet" href="resources/css/layout/searchbox.css">
<style>
	#att {
		display: none;
	}
	.hide_btn {
		display: none;
	}
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script> 
<script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		CKEDITOR.replace("con", {
			resize_enabled : false,		
			language : "ko",
			enterMode : "2"	
		});
		
		// 로그인
		$("#login").on("click",function(){
		    $("#loginForm").attr("action","login");
		    $("#loginForm").submit();
		});
		      
		// 로그아웃
		$("#logout").on("click", function(){
		    $("#loginForm").attr("action","logout");
		    $("#loginForm").submit();
		});
		
		// 마이페이지
		$("#mypage").on("click", function(){
			$("#loginForm").attr("action","myPage");
			$("#loginForm").submit();
		});
		
		// 관리자페이지
		$("#mgrpage").on("click", function(){
			$("#loginForm").attr("action","mgrPage");
			$("#loginForm").submit();
		});
		
		/* $("#categoryno").val('1').prop("selected", true); */
		
		// 취소버튼
		$("#cancelBtn").on("click", function() {
			$("#backForm").submit();
		});
		
		// 글작성시 엔터키 폼 실행 막기
		$("#updateForm").on("keypress", "input", function(event) {
			if(event.keyCode == 13) {
				return false;
			}
		});
		
		// 첨부파일 버튼
		$("#fileBtn").on("click", function() {
			$("#att").click();
		});
		
		// 첨부파일 선택시
		$("#att").on("change", function() {
			$("#fileName").html($(this).val().substring($(this).val().lastIndexOf("\\") + 1));
		});
		
		// 첨부파일 삭제 버튼
		$("#fileDelBtn").on("click", function() {
			$("#fileName").html("");
			$("#freeFile").val("");
			$("#fileBtn").attr("class", "");
			$(this).remove();
		});
		
		// 수정 버튼
		$("#updateBtn").on("click", function() {
			$("#con").val(CKEDITOR.instances['con'].getData());
			
			if(checkVal("#title")) {
				alert("제목을 입력하세요.");
				$("#title").focus();
			} else if(checkVal("#con")){
				alert("내용을 입력하세요.");
			} else {
				var fileForm = $("#fileForm");
				
				fileForm.ajaxForm({
					success: function(res){
						if(res.result == "SUCCESS") {
							if(res.fileName.length > 0){
								$("#freeFile").val(res.fileName[0]);
							}
							
							// 글수정
							var params = $("#updateForm").serialize();
							
							$.ajax({
								url: "freeUpdates",
								type: "post",
								data: params,
								dataType: "json",
								success: function(res){
									if(res.result == "success"){
										alert("정상적으로 수정 되었습니다.")
										$("#backForm").submit();
									} else if(res.result == "failed") {
										alert("수정에 실패 하였습니다.");
									} else {
										alert("수정 중 문제가 발생하였습니다.");
									}
								},
								error: function(request, status, error){
									console.log(erro);
								}
							}); // ajax end
						} else {
							alert("파일 업로드에 실패하였습니다.");
						}
					}, 
					error: function(req, status, error){
						console.log(error);
						alert("파일 업로드 중 문제가 발생하였습니다.");
					}
				});
				fileForm.submit();
			}
		});
	}); // doc end
	
	function checkVal(sel) {
		if($.trim($(sel).val()) == "") {	
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

	<h2>자유게시판 글수정 페이지</h2>
	<form id="fileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
		<input type="file" name="att" id="att" />
	</form>
	
	<form action="freeDtl" id="backForm" method="post">
		<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
		<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
		<input type="hidden" name="page" value="${param.page}" />
		<input type="hidden" name="no" value="${param.no}" />
		<input type="hidden" name="categoryno" value="${param.categoryno}"/>
	</form>
	
	<form action="#" id="updateForm" method="post">
		번호: ${param.no}<input type="hidden" name="no" value="${param.no}" /><br><br>
		말머리: 
		<select id="categoryno" name="categoryno">
			<option value="0" disabled>[자유수다]</option>	
			<option value="1" disabled>[용병구해요]</option>
		</select><br><br>
		제목: <input type="text" id="title" name="title" value="${data.FREE_TITLE}"/><br/><br>
		작성자: ${sMNm}<input type="hidden" name="mno" value="${sMNo}" /><br/><br>
		<textarea rows="5" cols="5" id="con" name="con">${data.FREE_CON}</textarea><br/>
		첨부파일: 
		<c:choose>
			<c:when test="${!empty data.FREE_FILE}">
				<input type="button" value="첨부파일선택" id="fileBtn" class="hide_btn">
			</c:when>
			<c:otherwise>
				<input type="button" value="첨부파일선택" id="fileBtn">
			</c:otherwise>
		</c:choose>
		<c:set var="len" value="${fn:length(data.FREE_FILE)}"></c:set>
		<span id="fileName">${fn:substring(data.FREE_FILE, 20, len)}</span>
		<c:if test="${!empty data.FREE_FILE}">
			<input type="button" value="첨부파일삭제" id="fileDelBtn">
		</c:if>
		<input type="hidden" name="freeFile" id="freeFile" value="${data.FREE_FILE}" >
	</form>
	<br>
		<input type="button" value="수정" id="updateBtn" />
		<input type="button" value="취소" id="cancelBtn" />
		
	</main>
	
	<footer>
		<jsp:include page="../footer.jsp" flush="true" />
	</footer>
		
<script type="text/javascript" src="resources/css/js/header.js"></script>
</body>
</html>