<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
    <script type="text/javascript">
    /*
    Geolocation : 위치정보 서비스로써 웹브라우저가 현재 위도와 경도를
        JS코드에게 공급하는 서비스이다. PC웹, Mobile웹 모두 지원된다.
    */

    var span;
    window.onload = function(){
        span = document.getElementById("result");
        /*
        geolocation 객체를 통해 현재 접속한 브라우저의 지원여부를
        확인한다. 지원되지 않는다면 false가 반환된다.
        */
        if(navigator.geolocation){
            span.innerHTML = "Geolocation API를 지원합니다.";

            var options = {
                enableHighAccurcy:true, /* 정확도 설정 */
                timeout:5000, /* 대기시간 */
                maximumAge:3000 /* 캐쉬된 위치값을 반환받을시간. 0으로 지정하면
                                    항상 최신의 현재위치를 수집한다. */
            };
            /*
            getCurrentPosition() : 현재 위치값을 얻어오는 함수
                사용법 : getCurrentPosition(
                    위치얻기에 성공했을때 호출할 콜백메소드,
                    위치얻기에 실패했을때 호출할 콜백메소드,
                    옵션(위치파악시간, 대기시간, 위치의정확도));
            */
            navigator.geolocation.getCurrentPosition(showPosition,showError,options);
        }
        else{
            span.innerHTML = "이 브라우저는 Geolocation API를 지원하지 않습니다.";
        }
    }

    //성공시 호출할 콜백메소드
    var showPosition = function(position){
        //위도를 가져옴
        var latitude = position.coords.latitude;
        //경도를 가져옴
        var longitude = position.coords.longitude;
        //위/경도를 화면에 출력
        span.innerHTML = "위도:"+latitude+", 경도:"+longitude;

        //input태그에 입력하는 부분
        document.getElementById("lat").value = latitude;
        document.getElementById("lng").value = longitude;
    }
    //실패시 호출할 콜백메소드
    var showError = function(error){
        switch(error.code){
            case error.UNKNOWN_ERROR:
                span.innerHTML = "알수없는오류발생"; break;
            case error.PERMISSION_DENIED:
                span.innerHTML = "권한이 없습니다"; break;
            case error.POSITION_UNAVAILABLE:
                span.innerHTML = "위치 확인불가"; break;
            case error.TIMEOUT:
                span.innerHTML = "시간초과"; break;
        }
    }

    </script>
</head>
<body>
    <h2>Geolocation - 현재위치의 위도,경도 알아내기</h2>
    <fieldset>
        <legend>현재위치 - 위도, 경도</legend>
        <span id="result" style="color:red; font-size:1.5em; font-weight:bold;"></span>
    </fieldset>

    위도 : <input type="text" id="lat">
    경도 : <input type="text" id="lng">
</body>



</html>
