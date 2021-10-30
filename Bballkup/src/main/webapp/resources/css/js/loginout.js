/**
 * 
 */
$("#logout").on("click", function(){
	location.href = "Main";
	alert("로그아웃 되었습니다.")
	session.invalidate();
	session.invalidate();
	response.sendRedirect("Main") 
});