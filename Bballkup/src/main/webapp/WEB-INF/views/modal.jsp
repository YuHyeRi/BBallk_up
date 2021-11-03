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
</style>
<button id="mobtn">이용가이드</button>
<div id="modal" class="modal">
	<div class="modalcon">
		<div class="modal_header">
			<span class="close">&times;</span>
			<h2>이용가이드</h2>		
		</div>
		<div class="modal_body">
			<h3>내가 만드는 꿀잼 빅매치</h3>
			<p>시간과 날짜, 종목을 확인하고 상단 중앙의 주최하기 버튼을 눌러 직접 매치를 열어보세요!</p>
			<br><br>
			<h3></h3>
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