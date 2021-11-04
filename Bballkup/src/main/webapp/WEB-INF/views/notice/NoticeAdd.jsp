<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글쓰기 페이지</title>
	<link rel="stylesheet" href="resources/css/layout/font.css">
	<link rel="stylesheet" href="resources/css/layout/basic.css">
	<link rel="stylesheet" href="resources/css/layout/btn.css">
	<link rel="stylesheet" href="resources/css/layout/loginout.css">
	<link rel="stylesheet" href="resources/css/layout/nav.css">
	<link rel="stylesheet" href="resources/css/layout/table.css">
	<link rel="stylesheet" href="resources/css/layout/searchbox.css">
	
<style type="text/css">
#att {
	display: none;
}
.btndiv{
	margin : 20px 0 20px 0
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
	
	$("#login").on("click",function(){
		$("#loginForm").attr("action","login");
		$("#loginForm").submit();
	});
			
	$("#logout").on("click", function(){
		$("#loginForm").attr("action","logout");
		$("#loginForm").submit();
	});
	
	$("#join").on("click", function(){
		$("#loginForm").attr("action","join");
		$("#loginForm").submit();
	});
			
	$("#mypage").on("click", function(){
		$("#loginForm").attr("action","myPage");
		$("#loginForm").submit();
	});
	
	$("#mgrpage").on("click", function(){
		$("#loginForm").attr("action","mgrPage");
		$("#loginForm").submit();
	});
	
	$("#fileBtn").on("click", function(){
		$("#att").click();
	});
	
	$("#att").on("change", function(){
		$("#fileName").html($(this).val().substring($(this).val().lastIndexOf("\\")+ 1));
	});

	$("#addBtn").on("click", function(){
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
						
						var params = $("#addForm").serialize();
						
						$.ajax({
							url: "NoticeAdds",
							type: "post",
							dataType: "json",
							data: params,
							success: function(res){
								if(res.result == "success"){
									location.href = "NoticeList";
								}else if (res.result == "failed"){
									alert("작성에 실패하였습니다.");
								}else{
									alert("작성중 문제가 발생했습니다.");
								}
							},
							error: function(request, status, error){
								console.log(error);
							}
						});
					}else {
						alert("파일 업로드중 문제가 발생했습니다.");
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
<form action="#" id="loginForm" method="post">
	<input type="hidden" id="mem_no" name="mem_no" value="${sMNo}">
</form>
<form id="fileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
	<input type="file" name="att" id="att" />
</form>
<form action="bballkup" id="backForm" method="post">
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	<input type="hidden" name="page" value="${param.page}" />
</form>
<form action="#" id="addForm" method="post">
	제목 <input type="text" id="title" name="title" />
	
	<input type="checkbox" id="upbtn2"> 중요공지 <br/>
	<input type="hidden" name="upbtn" value="사과" />
	
	<input type="hidden" name="mno" id="mno" value="${sMNo}" />
	<textarea rows="5" cols="5" id="con" name="con"></textarea><br/>
	첨부파일 : <input type="button" value="첨부파일선택" id="fileBtn" >
	<span id="fileName"></span>
	<input type="hidden" name="NFile" id="NFile" />
</form>
<div class="btndiv">
	<input type="button" value="저장" id="addBtn" />
	<input type="button" value="취소" id="cancelBtn" />
</div>
</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>
</body>
</html>