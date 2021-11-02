<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#non{
	display: none;
}
</style>
<div class="nav_drop">
    <div class="dropdown 1">
        <button class="dropbtn">사이트소개</button>
        <div class="dropdown-con">
            <a href="javascript:location.href='Siteplan';">사이트소개</a>
            <a href="javascript:location.href='Used';">이용가이드</a>
        </div>
    </div>
    <div class="dropdown 2">
        <button class="dropbtn">개인커뮤니티</button>
        <div class="dropdown-con">
            <a href="javascript:location.href='freeList';">자유게시판</a>
            <a href="#" class="siteplan">체육활동<br>참가모집</a>
        </div>
    </div>
    <div class="dropdown 3">
        <button class="dropbtn">팀커뮤니티</button>
        <div class="dropdown-con">
            	<a href="javascript:location.href='tMain';">팀별게시판</a>
	       <c:if test="${sTCnt eq 0}">
		        <a href="teamAdd">팀장신청</a>
		   </c:if>
        </div>
    </div>
    <div class="dropdown 4">
        <button class="dropbtn">고객지원</button>
        <div class="dropdown-con">
            <a href="javascript:location.href='NoticeList';">공지사항</a>
            <a href="javascript:location.href='Question';">질문게시판</a>
        </div>
    </div>
</div>
