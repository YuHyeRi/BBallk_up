/**
 * Header Javascript
 */


	//로그인
	$("#login").on("click",function(){
		//$("#main3").attr("action","login");
		//$("#main3").submit();
		location.href="login";
	});
	//로그아웃
	$("#logout").on("click", function(){
		$("#loginForm").attr("action","logout");
		$("#loginForm").submit();
	});
	//가입
	$("#join").on("click", function(){
		//$("#loginForm").attr("action","join");
		//$("#loginForm").submit();
		location.href="join";
	});
	//마이페이지
	$("#mypage").on("click", function(){
		$("#loginForm").attr("action","myPage");
		$("#loginForm").submit();
	});
	//관리자페이지
	$("#mgrpage").on("click", function(){
		$("#loginForm").attr("action","mgrPage");
		$("#loginForm").submit();
	});
	
