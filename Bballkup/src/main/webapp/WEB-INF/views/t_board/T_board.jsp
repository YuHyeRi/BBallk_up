<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style>
* {box-sizing: border-box}

.tab {
  float: left;
  border: 1px solid #ccc;
  width: 15%;
  min-width : 150px;
  height: 300px;
}

.tablinks {
  /* display: block; */
  background-color: inherit;
  color: black;
  padding: 22px 16px;
  width: 100%;
  border: none;
  outline: none;
  text-align: left;
  cursor: pointer;
  transition: 0.3s;
  font-size: 17px;
}

.tablinks:hover {
  background-color: #e3ecfb;
}

.tablinks.active {
  background-color: #e3ecfb;
}

.tabcontent {
  padding: 0px 12px;
  border-left: none;
  height: 300px;
  border: 1px solid #ccc;
}
.tabbox{
	min-width : 800px;
	margin-bottom: 40px;
}

</style>
</head>
<body>
<header>
	<jsp:include page="../header.jsp" flush="true" />
</header>
<main>
<jsp:include page="../nav.jsp" flush="true" />
<div class="tabbox">

	<h2>부천FC</h2>
	<p>뜨거운 열정! 부천FC 커뮤니티 입니다</p>
	<div class="tab">
	  <button class="tablinks" onclick="opentab(event, 'team')" id="defaultOpen">팀체육활동참가</button>
	  <button class="tablinks" onclick="opentab(event, 'notice')">공지사항</button>
	  <button class="tablinks" onclick="opentab(event, 'oneline')">한줄게시판</button>
	</div>
	
	<div id="team" class="tabcontent">
	  <jsp:include page="T_teammozip.jsp" flush="true" />
	</div>
	
	<div id="notice" class="tabcontent">
	<jsp:include page="../header.jsp" flush="true" />
	   <%-- <jsp:include page="T_notice.jsp" flush="true" /> --%>
	</div>
	
	<div id="oneline" class="tabcontent">
	  <jsp:include page="T_oneline.jsp" flush="true" />
	</div>
</div>
</main>
<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>

<script type="text/javascript" src="resources/css/js/tabcontent.js"></script>

</body>
</html>