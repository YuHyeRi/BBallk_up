<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#att {
		display: none;	
	}
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script> 
<script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>
<script>
	$(document).ready(function() {
		CKEDITOR.replace("con", {
			resize_enabled : false,		
			language : "ko",
			enterMode : "2"				
		});
		
		// 취소버튼
		$("#cancelBtn").on("click", function() {
			$("#backForm").submit();
		});
		
		// 글작성시 엔터키 폼 실행 막기
		$("#addForm").on("keypress", "input", function(event) {
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
		
		// 저장버튼
		$("#addBtn").on("click", function() {
			$("#con").val(CKEDITOR.instances['con'].getData());
			if(checkVal("#title")){
				alert("제목을 입력하세요.");
				$("#title").focus();
			} else if(checkVal("#con")){
				alert("내용을 입력하세요.");
			} else {
				var fileForm = $("#fileForm");
				
				fileForm.ajaxForm({
					success: function(res){
						if(res.result == "SUCCESS"){
							if(res.fileName.length > 0) {
								$("#tbfile").val(res.fileName[0]);
							}
							
							// 글 저장
							var params = $("#addForm").serialize();	
							
							$.ajax({
								url: "tFreeAdds",
								type: "post",
								dataType: "json",
								data: params,
								success: function(res){
									if(res.result == "success"){
										alert("정상적으로 작성 되었습니다.")
										location.href = "tFreeList";
									} else if(res.result="failed"){
										alert("작성에 실패하였습니다.");
									} else {
										alert("작성 중 문제가 발생하였습니다.");
									}
								}, 
								error: function(request, status, error){
									console.log(error);
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
	<h2>팀 자유게시판 글작성 페이지</h2>
	<form id="fileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
		<input type="file" name="att" id="att" />
	</form>
	
	<form action="tFreeList" id="backForm" method="post">
		<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
		<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
		<input type="hidden" name="page" value="${param.page}" />
	</form>
	
	<form action="#" id="addForm" method="post">
		제목: <input type="text" id="title" name="title" /><br/>
		작성자: ${sMNm}<input type="hidden" name="mno" value="${sMNo}" /><br/>
		<textarea rows="5" cols="5" id="con" name="con"></textarea><br/>
		첨부파일: <input type="button" value="첨부파일선택" id="fileBtn" /><span id="fileName"></span>
		<input type="hidden" name="tbfile" id="tbfile" />
	</form>
	<br>
	<input type="button" value="저장" id="addBtn" />
	<input type="button" value="취소" id="cancelBtn" />
</body>
</html>