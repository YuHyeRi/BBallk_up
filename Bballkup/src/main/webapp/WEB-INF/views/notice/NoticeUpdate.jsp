<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#att {
	display: none;
}
.hide_btn {
	display: none;
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
	
	$("#addForm").on("keypress", "input", function(event){
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
	
	$("#updateBtn").on("click", function(){
		$("#con").val(CKEDITOR.instances['con'].getData());
		
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
							url: "NoticeUpdates",
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
<form id="fileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
	<input type="file" name="att" id="att" />
</form>
<form action="Notice" id="backForm" method="post">
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="no" value="${param.no}" />
</form>
<form action="#" id="updateForm" method="post">
	번호 : ${data.NOTICE_NO}<input type="hidden" name="no" value="${data.NOTICE_NO}" /><br/>
	제목 <input type="text" id="title" name="title" value="${data.NOTICE_TITLE}" />
	<input type="checkbox" id="upbtn" name="upbtn"> 공지등록 <br/>
	
	작성자 : ${sMNm} <input type="hidden" name="mno" value="${sMNo}" /><br/>
	<textarea rows="5" cols="5" id="con" name="con">${data.NOTICE_CON}</textarea><br/>
	첨부파일 : 
	<c:choose>
		<c:when test="${!empty data.NOTICE_FILE}">
			<input type="button" value="첨부파일선택" id="fileBtn" class="hide_btn"/>
		</c:when>
		<c:otherwise>
			<input type="button" value="첨부파일선택" id="fileBtn"/>
		</c:otherwise>
	</c:choose>
	<c:set var="len" value="${fn:length(data.NOTICE_FILE)}"></c:set>
	<span id="fileName">${fn:substring(data.NOTICE_FILE, 20, len)}</span>
	<c:if test="${!empty data.NOTICE_FILE}">
		<input type="button" value="첨부파일삭제" id="fileDelBtn"/>
	</c:if>
	<input type="hidden" name="NFile" id="NFile" value="${data.NOTICE_FILE}" />
</form>
<input type="button" value="저장" id="updateBtn" />
<input type="button" value="취소" id="cancelBtn" />
</body>
</html>