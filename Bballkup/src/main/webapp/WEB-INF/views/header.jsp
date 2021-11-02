<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <div class="logo_div">
        <img onclick="javascript:location.href='Main';" src="resources/images/logo/뽈크업로고.jpg">
        <div class="button_div">
        <c:choose>
        	<c:when test="${empty sMNo}">
        	 	<button class="btn login" id="login">로그인</button>
	            <p class="pand">또는</p>
	            <button class="btn join" id="join">회원가입</button>
        	</c:when>
        	<c:otherwise>
        		<p class="pand">${sMNm}님 반갑습니다 :)</p><br><br>
	            <button class="btn logout" id="logout">로그아웃</button>
	            <p class="pand">또는</p>
	            <button class="btn mypage" id="mypage">마이페이지</button>
        	</c:otherwise>
         </c:choose>
        </div>
    </div>

