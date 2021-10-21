<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="resources/css/layout/font.css">
	<link rel="stylesheet" href="resources/css/layout/basic.css">
	<link rel="stylesheet" href="resources/css/layout/btn.css">
	<link rel="stylesheet" href="resources/css/layout/loginout.css">
	<link rel="stylesheet" href="resources/css/layout/nav.css">
	<link rel="stylesheet" href="resources/css/layout/searchbox.css">
	<link rel="stylesheet" href="resources/css/layout/slideshow.css">
	<link rel="stylesheet" href="resources/css/layout/table.css">
<style>
	.maincenterdiv{
	display: flex;
	justify-content: center;
	}
	
	.maindiv {
        display: flex;
        width: 100%;
        /* div 세로길이 */
        height: auto;
        margin-bottom: 50px;
        margin-top: 50px;
        /* 갓종인 */
        min-width: 800px;
        max-width: 1000px;
        justify-content: center;
    }
    .mainrightdiv {
        flex-direction: column; 
        width: 50%;
        height: 100%;
    }
    .mainleft {
        width: 50%;
    }
    .mainright1 {
        height: 50%;
    }
    .mainright2 {
        height: 50%;
    }
</style>
</head>
<body>
<header>
	<jsp:include page="header.jsp" flush="true" />
</header>
<main>
<jsp:include page="nav.jsp" flush="true" />
	<!-- 여기부터 main contents  -->
	<div class="mainbar">
        <div class="slideshow-container">
            <div class="mySlides_fade">
              <img src="resources/images/slide/sample3.jpg" style="width:100%">
            </div>
            <div class="mySlides_fade">
              <img src="resources/images/slide/sample2.jpg" style="width:100%">
            </div>
            <div class="mySlides_fade">
              <img src="resources/images/slide/sample1.jpg" style="width:100%">
            </div>
            <div class="mySlides_fade">
              <img src="resources/images/slide/sample4.jpg" style="width:100%">
            </div>
            <div class="dots" style="text-align:center">
              <span class="dot" onclick="currentSlide(1)"></span> 
              <span class="dot" onclick="currentSlide(2)"></span> 
              <span class="dot" onclick="currentSlide(3)"></span> 
              <span class="dot" onclick="currentSlide(4)"></span> 
            </div>
		</div>
	</div>
	<div class="maincenterdiv">
		<div class="maindiv">
	       <div class="mainleft">
	           <div class="enter_div">
	               <table class="enter_table">
	                   <tr>
	                       <th>일시</th>
	                       <th>종목/장소</th>
	                       <th>시간</th>
	                       <th>인원/정원</th>
	                   </tr>
	                   <tr class="tr">
	                       <td>2021-09-18</td>
	                       <td>야구-잠실구장</td>
	                       <td>10:00</td>
	                       <td>7/20</td>
	                   </tr>
	                   <tr class="tr">
	                       <td>2021-09-18</td>
	                       <td>야구-잠실구장</td>
	                       <td>10:00</td>
	                       <td>7/20</td>
	                   </tr>
	                   <tr class="tr">
	                       <td>2021-09-18</td>
	                       <td>야구-잠실구장</td>
	                       <td>10:00</td>
	                       <td>7/20</td>
	                   </tr>
	                   <tr class="tr">
	                       <td>2021-09-18</td>
	                       <td>야구-잠실구장</td>
	                       <td>10:00</td>
	                       <td>7/20</td>
	                   </tr>
	                   <tr class="tr">
	                       <td>2021-09-18</td>
	                       <td>야구-잠실구장</td>
	                       <td>10:00</td>
	                       <td>7/20</td>
	                   </tr>
	                   <tr class="tr">
	                       <td>2021-09-18</td>
	                       <td>야구-잠실구장</td>
	                       <td>10:00</td>
	                       <td>7/20</td>
	                   </tr>
	                   <tr class="tr">
	                       <td>2021-09-18</td>
	                       <td>야구-잠실구장</td>
	                       <td>10:00</td>
	                       <td>7/20</td>
	                   </tr>
	               </table>
	           </div>
	       </div>
	       <div class="mainrightdiv">
	           <div class="mainright1">
	               <div class="notice_div">
	                   <table class="notice_table">
	                       <tr>
	                           <th>공지사항</th>
	                           <th>제목</th>
	                           <th>작성일</th>
	                       </tr>
	                       <tr class="tr">
	                           <td style="font-weight: bold;">중요공지</td>
	                           <td style="font-weight: bold;">코로나 관련 공지사항</td>
	                           <td style="font-weight: bold;">2021-10-05</td>
	                       </tr>
	                       <tr class="tr">
	                           <td>공지사항</td>
	                           <td>이용시설 공지사항</td>
	                           <td>2021-07-10</td>
	                       </tr>
	                   </table>
	               </div>
	           </div>
	           <div class="mainright2">
	               <div class="team_div">
	                   <table class="team_table">
	                       <tr>
	                           <th>팀커뮤니티</th>
	                       </tr>
	                       <tr>
	                           <td>로그인 후 이용가능합니다</td>
	                       </tr>
	                   </table>
	               </div>
	           </div>
	       </div>
		</div>
   </div>
   <!-- 여기까지 -->
<footer>
	<jsp:include page="footer.jsp" flush="true" />
</footer>
</main>

<script type="text/javascript" src="resources/css/js/slideshow.js"></script>
</body>
</html>
