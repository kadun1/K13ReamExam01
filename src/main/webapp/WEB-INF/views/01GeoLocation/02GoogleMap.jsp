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
	width:800px; height:600px;
}
</style>
<script>
function initMap(){
	var uluru = {lat:37.7481109 , lng:127.05717969999999};
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom: 17,
		center: uluru
	});
	var market = new google.maps.Marker({
		position: uluru,
		map: map
	});
}
window.onload = function(){
	initMap();
}
</script>
</head>
<body>

</body>
<div class="container">
	<h2>Google Map 띄워보기</h2>
	<div id="map"></div>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=${apiKey }"></script>
</div>
</body>

</html>
