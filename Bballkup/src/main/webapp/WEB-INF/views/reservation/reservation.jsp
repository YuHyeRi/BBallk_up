<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주최자 예약</title>
	<link rel="stylesheet" href="resources/css/layout/font.css">
	<link rel="stylesheet" href="resources/css/layout/basic.css">
	<link rel="stylesheet" href="resources/css/layout/btn.css">
	<link rel="stylesheet" href="resources/css/layout/loginout.css">
	<link rel="stylesheet" href="resources/css/layout/nav.css">
	<link rel="stylesheet" href="resources/css/layout/myCard.css">
	
<style type="text/css">
.ui-datepicker-trigger{
	cursor:pointer;
	width:40px;
}
.ui-datepicker{
	margin-top:10px;
	margin-left:60px;
}
</style>
<link rel="stylesheet" type="text/css" href="resources/css/jquery/jquery-ui.min.css" />
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script><!-- 이게 제일 상위에 있어야 한다. -->
<script type="text/javascript" src="resources/script/jquery/jquery-ui.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
   reloadList();
   
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
	
  	$.datepicker.setDefaults({
	monthNames: ['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년 9월','년 10월','년 11월','년 12월'],
	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	showMonthAfterYear:true,
	showOn: 'button',
	closeText: '닫기',
	buttonImage: 'resources/images/달력2.png',
	buttonImageOnly: true,
	dateFormat: 'yy-mm-dd',
	minDate: 1,
	maxDate: "+1M"
	});
   
 	$("#date").datepicker(); 
 	$('img.ui-datepicker-trigger').attr('align', 'absmiddle');
 	
	$("#date").on("change",function(){
		console.log($(this).val());
	});

   $("#cancel").on("click", function(){
	  location.href = "pList";
   });
   
});

function reloadList() {
   
   $.ajax({
      url : "http://openapi.seoul.go.kr:8088/487662466f706a69373145655a4c57/json/ListPublicReservationSport/1/1000",
      type : "get",
      dataType : "json",
      success : function(res) {
         redrawList(res.ListPublicReservationSport.row);
      },
      error : function(request, status, error) {
         console.log(error);
      }
   });
}

function redrawList(list) {
   
	//시설명 출력
	var sport = "";
   var sportOpt = "";
   var html = "";
   var opt = "";
   var num = 1;
   for(var i=0; i<list.length; i++){
	   if(sport.indexOf(list[i].MINCLASSNM) == -1){
			sport += list[i].MINCLASSNM;
			sportOpt = list[i].MINCLASSNM; 
			html += "<p>" + sportOpt + "</p>"; 
			opt +="<option value=" + num +">"+sportOpt+"</option>";
			num++;
	   }
   }
	$("#sport").append(opt);

	//시설 선택 시 시설에 해당하는 장소 출력
	$("#sport").on("change", function(){
		console.log($(this).val());
		console.log($("#sport option:checked").text());

		$("#place").html("");
		var place = "";
		var placeOpt = "";
		var html = "";
		var opt = "";
		for(var i=0; i<list.length; i++){
			
			if(list[i].MINCLASSNM == $("#sport option:checked").text() &&
				place.indexOf(list[i].PLACENM) == -1){
					place += list[i].PLACENM;
					placeOpt = list[i].PLACENM; 
					html += "<p>" + placeOpt + "</p>"; 
					opt +="<option>"+placeOpt+"</option>";
			 }
		}
		$("#place").append(opt);
	});
	
	$("#place").on("change", function(){
		console.log($(this).val());
	});
	
	$("#reservation").on("click", function(){
		
		if($("#sport").val() == '시설선택'){
			alert("시설을 선택해 주세요");
			
		}else if(checkVal("#date")){
			alert("날짜를 선택해 주세요");
			
		}else if(checkVal("#con")){
			alert("게시글 내용을 작성해 주세요");
			
		}else{
			
			var params = $("#actionForm").serialize();
			
			$.ajax({
				url : "reservations",
				type : "post",
				dataType : "json",
				data : params,
				success : function(res){
					if(res.result == "success"){
						alert("모임 주최가 완료되었습니다");
						location.href = "pList";
						
					}else if(res.result == "failed"){
						
						alert("모임 주최에 실패했습니다.");
						
					}else{
						alert("모임 주최 중 문제가 발생했습니다.")
					}
				},
				error : function(request, status, error){
					console.log(error);
				}
			});
		}
	});
}

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
<form action="#" id="loginForm">
	<input type="hidden" id="mem_no" name="mem_no" value="${sMNo}">
</form>
<header>
	<jsp:include page="../header.jsp" flush="true" />
</header>
<main>
<jsp:include page="../nav.jsp" flush="true" />
<div class="cardBig">
<div class="addDiv">
<h2>주최자 예약 페이지</h2>
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="mem_no" name="mem_no" value="${param.mem_no}">
	<input type="hidden" id="team_no" name="team_no" value="${param.team_no}">
	<p>▶ 시설 선택</p>
	<select id="sport" name="sport">
		<option>시설선택</option>
	</select><br>
	<p>▶ 장소 선택</p>
	<select id="place" name="place">
		<option>장소선택</option>
	</select><br>
	<p>▶ 경기일 선택</p>
	<input type="text" id="date" name="date" placeholder="날짜를 선택해주세요."><br>
	<p>▶ 게시글 내용 작성</p>
	<textarea rows="5" cols="50" id="con" name="con"></textarea><br>
</form><br>
<div class="btnDiv2">
	<input type="button" id="cancel" name="cancel" value="취소">
	<input type="button" id="reservation" name="reservation" value="주최하기">
</div>
 <table>
    <tbody></tbody>
 </table>
</div>
</div>
</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>

<script type="text/javascript" src="resources/css/js/header.js"></script>
</body>
</html>