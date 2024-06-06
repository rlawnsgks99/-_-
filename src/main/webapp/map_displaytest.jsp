<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주차장 찾기</title>
    <style>
        .map_wrap {
            position: relative;
            width: 100%;
            height: 500px;
        }

        #map {
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
<!-- 필터 옵션을 선택하고 적용할 버튼 -->
    <div id="filterBox">
    <label for="timeFilter">시간:</label>
    <select id="timeFilter">
        <option value="all">전체</option>
        <option value="morning">오전</option>
        <option value="afternoon">오후</option>
        <option value="allday">하루종일</option>
    </select>
    <label for="locationFilter">위치:</label>
    <select id="locationFilter">
        <option value="all">전체</option>
        <option value="aboveground">지상</option>
        <option value="underground">지하</option>
    </select>
    <label for="heightFilter">높이:</label>
    <select id="heightFilter">
    	<option value="all">전체</option>
        <option value="nolimit">제한없음</option>
        <option value="2to3">2m~3m</option>
        <option value="3to4">3m~4m</option>
        <option value="4andabove">4m 이상</option>
    </select>
    <label for="vehicleFilter">주차 가능 차종:</label>
    <select id="vehicleFilter">
        <option value="all">전체</option>
        <option value="smallcar">소형차</option>
        <option value="compactcar">중형차</option>
        <option value="largecar">대형차</option>
        <option value="trucks">화물차</option>
        <option value="specialvehicles">특수차량</option>
    </select>
    <button id="applyFiltersButton">적용</button>
</div>

    <div class="map_wrap">
        <div id="map"></div>
    </div>
    
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a47fcd486e06f79331ec9d08f91152b"></script>
<script>
    // 필터 적용 버튼 클릭 시
    document.getElementById("applyFiltersButton").addEventListener("click", function (event) {
        event.preventDefault(); // 기본 폼 제출 방지
        applyFilters(); // 필터 적용 함수 호출
    });

    // 필터 적용 함수
    function applyFilters() {
        // 필터 옵션을 가져와서 필터링할 내용을 서버로 전송
        var form = document.getElementById("filterForm");
        var formData = new FormData(form);
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "filter_parking_lots.jsp", true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // 서버에서 받은 데이터를 가지고 지도에 표시
                displayParkingLots(JSON.parse(xhr.responseText));
            }
        };
        xhr.send(formData);
    }

    // 전체 주차장 정보를 지도에 표시
    function displayAllParkingLots() {
        <%
        // JDBC 드라이버 로드 및 DB 연결 설정
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/odbo"; // DB 이름을 적절히 변경해주세요
        String username = "root"; // 사용자명을 적절히 변경해주세요
        String password = "qwer1234"; // 비밀번호를 적절히 변경해주세요
        Connection conn = DriverManager.getConnection(url, username, password);

        // 주소 정보 조회 쿼리 실행
        String sql = "SELECT * FROM address_table";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        // 지도 생성 및 마커 표시
        while (rs.next()) {
            int id = rs.getInt("id");
            String address = rs.getString("address");
            double longitude = rs.getDouble("longitude");
            double latitude = rs.getDouble("latitude");
            String nickname = rs.getString("nickname");
        %>

        //마커 마우스 이벤트 처리
        var marker<%= id %> = new kakao.maps.Marker({
            map: map,
            position: new kakao.maps.LatLng(<%= latitude %>, <%= longitude %>)
        });

        var infowindow<%= id %> = new kakao.maps.InfoWindow({
            content: '<div><strong><%= nickname %></strong></div><div><%= address %></div>'
        });

        kakao.maps.event.addListener(marker<%= id %>, 'mouseover', function() {
            infowindow<%= id %>.open(map, marker<%= id %>);
        });

        kakao.maps.event.addListener(marker<%= id %>, 'mouseout', function() {
            infowindow<%= id %>.close();
        });

        // 주소 클릭 시 페이지 이동
        kakao.maps.event.addListener(marker<%= id %>, 'click', function() {
            window.location.href = "pay_check.jsp?id=<%= id %>";
        });

        <%
        }

        // DB 연결 해제
        rs.close();
        stmt.close();
        conn.close();
        %>
    }

    function displayParkingLots(data) {
        // 필터링된 주차장 정보를 data에서 가져와서 지도에 표시
        for (var i = 0; i < data.length; i++) {
            var id = data[i].id;
            var address = data[i].address;
            var longitude = data[i].longitude;
            var latitude = data[i].latitude;
            var nickname = data[i].nickname;

            // 마커 생성
            var marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(latitude, longitude)
            });

            // 인포윈도우 생성
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div><strong>' + nickname + '</strong></div><div>' + address + '</div>'
            });

            // 마커 이벤트 처리
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                infowindow.open(map, marker);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            // 주소 클릭 시 페이지 이동
            kakao.maps.event.addListener(marker, 'click', function() {
                window.location.href = 'pay_check.jsp?id=' + id;
            });
        }
    }


    // 페이지 로드 시 지도 초기화
    var map = new kakao.maps.Map(document.getElementById("map"), {
        center: new kakao.maps.LatLng(37.566826, 126.9786567),
        level: 4
    });

    // 초기에는 전체 주차장 정보를 표시
    displayAllParkingLots();
</script>

</body>
</html>

