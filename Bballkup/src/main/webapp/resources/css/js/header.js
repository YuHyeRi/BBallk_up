/**
 * Header Javascript
 */


	//로그인로그아웃
	$("#login").on("click",function(){
		//$("#main3").attr("action","login");
		//$("#main3").submit();
		location.href="login";
	});
	
	$("#logout").on("click", function(){
		$("#loginForm").attr("action","logout");
		$("#loginForm").submit();
	});
	
	$("#join").on("click", function(){
		//$("#loginForm").attr("action","join");
		//$("#loginForm").submit();
		location.href="join";
	});
	
	$("#mypage").on("click", function(){
		$("#loginForm").attr("action","Mypage");
		$("#loginForm").submit();
	});
