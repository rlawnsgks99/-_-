<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주차 예약 웹사이트</title>
    <style>
        .map_wrap, .map_wrap * {
            margin: 0;
            padding: 0;
            font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
            font-size: 12px;
        }

        .map_wrap a, .map_wrap a:hover, .map_wrap a:active {
            color: #000;
            text-decoration: none;
        }

        .map_wrap {
            position: relative;
            width: 50%;
            height: 500px;
        }

        #map {
            width: 100%;
            height: 100%;
            position: relative;
            overflow: hidden;
        }

        #menu_wrap {
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            width: 250px;
            margin: 10px 0 30px 10px;
            padding: 5px;
            overflow-y: auto;
            z-index: 1;
            font-size: 12px;
            border-radius: 10px;
        }

        #menu_wrap .option {
            text-align: center;
        }

        #menu_wrap .option p {
            margin: 10px 0;
        }

        #menu_wrap .option button {
            margin-left: 5px;
        }
    </style>
</head>
<body>

    <img src="./images/introduce.png" width="1509" height="360">

    <div id="icon1">
        <div id="icon1-1">
            <h1>주차 예약</h1>
        </div>
    </div>

    <div class="map_wrap">
        <div id="map"></div>
    </div>
    
<form action="search.jsp" method="GET">
    <label for="location">Location (지상/지하):</label>
    <select name="location" id="location">
        <option value="">전체</option>
        <option value="지상">지상</option>
        <option value="지하">지하</option>
    </select>

    <label for="time">Time (오전/오후/하루종일):</label>
    <select name="time" id="time">
        <option value="">전체</option>
        <option value="오전">오전</option>
        <option value="오후">오후</option>
        <option value="하루종일">하루종일</option>
    </select>

    <label for="height_limit">Height Limit (제한없음/2m~3m/3m~4m/4m 이상):</label>
    <select name="height_limit" id="height_limit">
        <option value="">전체</option>
        <option value="제한없음">제한없음</option>
        <option value="2m~3m">2m~3m</option>
        <option value="3m~4m">3m~4m</option>
        <option value="4m 이상">4m 이상</option>
    </select>

    <label for="vehicle_type">Vehicle Type (소형차/중형차/대형차/화물차/특수차):</label>
    <select name="vehicle_type" id="vehicle_type">
        <option value="">전체</option>
        <option value="소형차">소형차</option>
        <option value="중형차">중형차</option>
        <option value="대형차">대형차</option>
        <option value="화물차">화물차</option>
        <option value="특수차">특수차</option>
    </select>
    
    <input type="submit" value="찾기">
</form>


    <!-- 카카오 지도 API 스크립트 -->
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a47fcd486e06f79331ec9d08f91152b"></script>

    <!-- JavaScript 코드 -->
    <script>
        var mapContainer = document.getElementById('map');
        var mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567),
            level: 4
        };
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 사용자 위치 가져오기
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                var lat = position.coords.latitude;
                var lon = position.coords.longitude;
                var locPosition = new kakao.maps.LatLng(lat, lon);
                var message = '<div style="padding:5px;">현재 위치</div>';
                displayMarker(locPosition, message);
            });
        } else {
            var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);
            var message = 'Geolocation을 사용할 수 없어요..';
            displayMarker(locPosition, message);
        }

        // 마커와 인포윈도우 표시 함수
        function displayMarker(locPosition, message) {
            var marker = new kakao.maps.Marker({
                map: map,
                position: locPosition
            });
            var iwContent = message;
            var iwRemoveable = true;
            var infowindow = new kakao.maps.InfoWindow({
                content: iwContent,
                removable: iwRemoveable
            });
            infowindow.open(map, marker);
            map.setCenter(locPosition);
        }
    </script>

    <!-- 서버 측 코드와 데이터베이스 연동 -->
    <%
        // JDBC 드라이버 로드 및 DB 연결 설정
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/odbo";
        String username = "root";
        String password = "qwer1234";
        Connection conn = DriverManager.getConnection(url, username, password);

        // 주소 정보 조회 쿼리 실행
        String sql = "SELECT * FROM address_table";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
            int id = rs.getInt("id");
            String address = rs.getString("address");
            double longitude = rs.getDouble("longitude");
            double latitude = rs.getDouble("latitude");
            String nickname = rs.getString("nickname");
    %>

        <script>
            // 마커와 인포윈도우 표시
            var marker<%= id %> = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(<%= latitude %>, <%= longitude %>)
            });

            var infowindow<%= id %> = new kakao.maps.InfoWindow({
                content: '<div><strong><%= nickname %></strong></div><div><%= address %></div>'
            });

            // 마커 마우스 이벤트 처리
            kakao.maps.event.addListener(marker<%= id %>, 'mouseover', function () {
                infowindow<%= id %>.open(map, marker<%= id %>);
            });

            kakao.maps.event.addListener(marker<%= id %>, 'mouseout', function () {
                infowindow<%= id %>.close();
            });

            // 주소 클릭 시 페이지 이동
            kakao.maps.event.addListener(marker<%= id %>, 'click', function () {
                window.location.href = "pay_check.jsp?id=<%= id %>";
            });
        </script>

    <%
        }

        // DB 연결 해제
        rs.close();
        stmt.close();
        conn.close();
    %>
    </body>
</html>