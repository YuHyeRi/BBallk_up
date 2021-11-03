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
	    		<c:choose>
	     		<c:when test="${sMLv eq 0}">
	     			<button class="btn logout" id="logout">로그아웃</button>
	           <p class="pand">또는</p>
	           <button class="btn mgrpage" id="mgrpage">관리자페이지</button>
	     		</c:when>
	     		<c:otherwise>
	           <button class="btn logout" id="logout">로그아웃</button>
	           <p class="pand">또는</p>
	           <button class="btn mypage" id="mypage">마이페이지</button>
	     		</c:otherwise>
	     	</c:choose>
	    	</c:otherwise>
	     </c:choose>
	    </div>
	    <c:choose>
	    	<c:when test="${!empty sMNo}">
	     	<p class="pclass">${sMNm}님 환영합니다 :)</p>
	    	</c:when>
	    </c:choose>
	</div>

