<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>장소 상세보기</title>
<link rel="stylesheet" href="resources/css/layout/font.css">
<style type="text/css">
#back{
	background-color: white;
    padding: 5px;
    width: 80px;
    border-radius: 5px;
    border: 2px solid #1d2088;
    cursor: pointer;
}
.mapInfo{
    margin-top: 10px;
    margin-left: 100px;
}
</style>
</head>
<body>
<input type="hidden" id="y" name="y" value="${param.y}">
<input type="hidden" id="x" name="x" value="${param.x}">
<div id="staticMap" style="width:600px;height:350px;"></div>
<div class="mapInfo">
	이미지 클릭 시 카카오맵으로 이동합니다.
	<input type="button" id="back" name="back" value="지도닫기">
</div>

<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4fe50337f4490ee150d96eadf9b9c740"></script>
<script>
//이미지 지도에서 마커가 표시될 위치 
var markerPosition  = new kakao.maps.LatLng($("#y").val(), $("#x").val()); //(Y,X)

// 이미지 지도에 표시할 마커
var marker = {
    position: markerPosition
};

var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
    staticMapOption = { 
        center: new kakao.maps.LatLng($("#y").val(), $("#x").val()), // 이미지 지도의 중심좌표
        level: 3, // 이미지 지도의 확대 레벨
        marker: marker // 이미지 지도에 표시할 마커 
 };    

// 이미지 지도 생성
var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);

$("#back").on("click", function(){
	history.back();
});
</script>
</body>
</html>