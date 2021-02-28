<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<style>
#map{
	width:100%; height:700px;
}
</style>
 <script type="text/javascript">
 var span;
 window.onload = function(){
	 span = document.getElementById("result");
	 
	 if(navigator.geolocation){
		 span.innerHTML = "Geolocation API를 지원합니다.";
		 
		 var options = {
				 enableHighAccurcy:true,
				 timeout:5000,
				 maximumAge:3000
		 };
		 navigator.geolocation.getCurrentPosition(showPosition,showError,options);
	 }
	 else{
		 span.innerHTML = "이 브라우저는 Geolocation API를 지원하지 않습니다.";
	 }
 }
 
 var showPosition = function(position){
	 //위도를 가져오는 부분
	 var latitude = position.coords.latitude;
	 //경도를 가져오는 부분
	 var longitude = position.coords.longitude;
	 
	 //위경도를 가져온후 지도 표시
	 initMap(latitude, longitude);
 }
 
 function initMap(latVar, lngVar){
	 var uluru = {lat: latVar, lng: lngVar};
	 var map = new google.maps.Map(document.getElementById('map'),{
		 zoom: 17,
		 center: uluru
	 });
	 var marker = new google.maps.Marker({
		 position: uluru,
		 map: map
	 });
 }
 
 var showError = function(error){
	 switch(error.code){
	 	case error.UNKNOWN_ERROR:
	 		span.innerHTML = "알수없는오류발생";break;
	 	case error.PERMISSION_DENIED:
	 		span.innerHTML = "권한이 없습니다";break;
	 	case error.POSITION_UNAVAILABLE:
	 		span.innerHTML = "위치 확인불가";break;
	 	case error.TIMEOUT:
	 		span.innerHTML = "시간초과";break;
	 }
 }
</script>
</head>
<body>
 	<h2>현재위치를 지도에 표시하기</h2>
 	
 	<fieldset>
 		<legend>현재위치 - 위도, 경도</legend>
 		<span id="result" style="color:red; font-size:1.5em; font-weight:bold;"></span>
 	</fieldset>
 	
 	<div id="map"></div>
 	<script async defer src="https://maps.googleapis.com/maps/api/js?key=${apiKey }"></script>
</body>



</html>
