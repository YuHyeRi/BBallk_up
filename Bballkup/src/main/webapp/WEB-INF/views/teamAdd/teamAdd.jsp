<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀장신청</title>
<link rel="stylesheet" href="resources/css/layout/font.css">
<link rel="stylesheet" href="resources/css/layout/basic.css">
<link rel="stylesheet" href="resources/css/layout/btn.css">
<link rel="stylesheet" href="resources/css/layout/loginout.css">
<link rel="stylesheet" href="resources/css/layout/nav.css">
<link rel="stylesheet" href="resources/css/layout/main.css">
<link rel="stylesheet" href="resources/css/layout/myCard.css">

<style type="text/css">
#att{
	display:none;
}

img{
	width:80px;
}
</style>
<script src="resources/script/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#login").on("click",function(){
	   $("#loginForm").attr("action","login");
	   $("#loginForm").submit();});
		      
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
		
 	//신청취소
	$("#cancelBtn").on("click", function(){
		history.back();
	});
	
 	//팀명 중복체크
 	$("#tNmChk").on("click", function(){
	 	var params = $("#addForm").serialize();
				
	 	$.ajax({
			url : "tNmChk",
			type : "post",
			dataType : "json",
			data : params,
			success : function(res){
				if(res.result == "overlap"){
					alert("팀명이 중복됩니다.");
				}else if(res.result == "success"){
					alert("사용가능한 팀명입니다.")
				}else{
					
				}
			},
			error : function(request, status, error){
				console.log(error);
			}
		});
 	});
 	
	//첨부파일 버튼
	$("#fileBtn").on("click", function(){
		
		$("#att").click();
	});
	
	//첨부파일 선택시
	$("#att").on("change", function(){
		
		var fileForm = $("#fileForm");
		
		fileForm.ajaxForm({
			
			success : function(res){
				
				if(res.result == "SUCCESS"){
					
					if(res.fileName.length > 0){
						
						var teamImg = res.fileName[0].replace('[', '%5B').replace(']', '%5D');
						$("#teamImg").val(res.fileName[0]);
						$("#fileName").html(res.fileName[0].substr(20, res.fileName[0].length));
						$("#imgView").html("<img src=\"resources/upload/"+ teamImg + "\" >");
					}
				}else{
					alert("이미지 업로드에 실패했습니다.");
				}
			},
			error : function(req, status, error){
				console.log(error);
				alert("처리 중 오류가 발생했습니다.");
			}
		});
		
		fileForm.submit();
	});
	
	//저장
	$("#addBtn").on("click", function(){
		
		if(checkVal("#teamNm")){
			alert("팀명을 입력해 주세요");
			$("#teamNm").focus();
			
		}else if(checkVal("#att")){
			alert("팀 로고를 등록해 주세요");
			
		}else if(checkVal("#teamIntro")){
			alert("팀 소개를 입력해 주세요");
			$("#teamIntro").focus();
			
		}else{
			var params = $("#addForm").serialize();
			
			$.ajax({
				url : "teamAdds",
				type : "post",
				dataType : "json",
				data : params,
				success : function(res){
					if(res.result == "reChk"){
						alert("팀명 중복확인을 해주세요.");
					}else{
						if(res.result == "success"){
							alert("팀장신청이 완료되었습니다.");
							$("#addForm").attr("action","Main");
							$("#addForm").submit();
						}else if(res.result == "failed"){
							alert("팀장신청에 실패했습니다.");
						}else{
							alert("팀장신청 중 문제가 발생했습니다.");
						}
					}
				},
				error : function(request, status, error){
					console.log(error);
				}
			});
		}
	});
	
}); 

//값이 들어있는지 체크
function checkVal(sel){
	if($.trim($(sel).val()) == ''){
		return true;
	}else{
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
<div class="cardBig">
<div class="addDiv">
<form action="#" id="loginForm" method="post">
   <input type="hidden" name="mem_no" value="${sMNo}">
</form>
<form id="fileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
	<input type="file" name="att" id="att">
</form>
	<div class = "addCon">
	<h2>팀 커뮤니티 >> 팀장신청</h2>
				<br>
				<br>
	</div>
<form action="#" id="addForm" method="post">
	<input type="hidden" id="mem_no" name="mem_no" value="${sMNo}">
	팀명 <input type="text" id="teamNm" name="teamNm">
	<input type="button" id="tNmChk" name="tNmChk" value="중복확인">
	<br>
	<br>
	팀 로고 : <input type="button" value="이미지선택" id="fileBtn" >
	<span id="fileName">${fn:substring(data.TEAM_LOGO, 20, len)}</span><br><br>
	<input type="hidden" name="teamImg" id="teamImg" >
	<div id = "imgView"></div>
	<br>
	주 이용시설
	<select id="sport" name="sport">
		<option value="1">테니스장</option>
		<option value="2">축구장</option>
		<option value="3">풋살장</option>
		<option value="4">다목적경기장</option>
		<option value="5">체육관</option>
		<option value="6">야구장</option>
		<option value="7">족구장</option>
		<option value="8">농구장</option>
		<option value="9">배구장</option>
		<option value="10">배드민턴장</option>
		<option value="11">교육시설</option>
		<option value="12">탁구장</option>
		<option value="13">골프장</option>
	</select><br><br>
	팀 소개<br><br>
	<textarea rows="5" cols="5" id="teamIntro" name="teamIntro" style="width:300px;"></textarea><br>
</form>
<div class = "addBtn">
	<input type="button" value="취소" id="cancelBtn">
	<input type="button" value="저장" id="addBtn">
</div>
</div>
</div>
</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>
</body>
</html>