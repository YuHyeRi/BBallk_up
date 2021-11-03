<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.modal{
	/* display: none; */
	position: fixed;
	z-index: 1;
	padding-top : 100px;
	left : 0;
	top : 0;
	width: 100%;
	height: 100%;
	overflow : auto;
	background-color: rgb(0,0,0);
	background-color: rgba(0,0,0,0.4);
}
.modalcon{
	background-color: white;
	margin : auto;
	padding: 20px;
	border: 3px solid #1d2088;
	border-radius: 10px;
	width: 60%;
}
.close{
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}
.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.modal_header{
	text-align : center;
	background-color:  #e3ecfb;
	padding: 2px 16px;
	border-radius: 5px;
}
.modal_body{
	padding: 2px 20px 2px 20px;
	border-radius: 5px;
}
/* .modal_body>span{
	color : red;
} */
</style>
<button id="mobtn">이용가이드</button>
<div id="modal" class="modal">
	<div class="modalcon">
		<div class="modal_header">
			<span class="close">&times;</span>
			<h2>이용가이드</h2>		
		</div>
		<div class="modal_body">
			<h3>주최하기 버튼</h3>
			<p>상단 중앙의 주최하기 버튼을 눌러 주최자 예약 페이지를 확인하세요</p>
			<h3>시설 선택</h3>
			<p>원하는 운동 종목에 맞는 시설을 선택하여 운동구장을 확인해보세요</p>
			<h3>장소 선택</h3>
			<p>선택한 운동 매치 장소를 지원하는 목록을 확인한 후 원하는 경기장을 선택하세요<br>
			<span style="color:red">※ 지원하는 경기장이 없을 경우 목록에 선택사항이 없을 수 있습니다</span></p>
			<h3>경기일 선택</h3>
			<p>달력 아이콘을 클릭하여 경기일을 선택하세요 <br>
			<span style="color:red">※ 날짜는 한달 이내로만 예약 할 수 있습니다</span></p>
			<h3>게시글 내용 작성</h3>
			<p>체육활동을 주최하면서 참가자들에게 전달할 사항 또는 내용을 자유롭게 작성하세요</p>
		</div>
	</div>
</div>

<script>
var modal = document.getElementById("modal");
var btn = document.getElementById("mobtn");
var span = document.getElementsByClassName("close")[0];

btn.onclick = function() {
  modal.style.display = "block";
}

span.onclick = function() {
  modal.style.display = "none";
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
	
</script>