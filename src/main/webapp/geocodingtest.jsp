<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>지오코딩과 지도 표시</title>
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
    <h2>주소 입력</h2>
    <input type="text" id="inputAddress">
    <button onclick="searchAddr()">검색</button>
    
    <h1>지오코딩과 지도 표시</h1>
    <div class="map_wrap">
        <div id="map"></div>
        <div class="hAddr">
            <span class="title">지도중심기준 행정동 주소정보</span>
            <span id="centerAddr"></span>
        </div>
    </div>

    <h2>저장될 정보</h2>
    <div>
        경도: <span id="longitude"></span><br>
        위도: <span id="latitude"></span><br>
        주소: <span id="address"></span>
    </div>
    <form action="save_address" method="POST">
        <input type="hidden" id="address" name="address">
        <input type="hidden" id="longitude" name="longitude">
        <input type="hidden" id="latitude" name="latitude">
        <button type="submit">저장</button>
    </form>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a47fcd486e06f79331ec9d08f91152b&libraries=services"></script>
    <script>
        var mapContainer = document.getElementById('map');
        var mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567),
            level: 1
        };

        var map = new kakao.maps.Map(mapContainer, mapOption);

        var geocoder = new kakao.maps.services.Geocoder();

        var marker = new kakao.maps.Marker();
        var infowindow = new kakao.maps.InfoWindow({ zindex: 1 });

        kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
            searchDetailAddrFromCoords(mouseEvent.latLng, function (result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
                    detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';

                    var content = '<div class="bAddr">' +
                        '<span class="title">법정동 주소정보</span>' +
                        detailAddr +
                        '</div>';

                    marker.setPosition(mouseEvent.latLng);
                    marker.setMap(map);

                    infowindow.setContent(content);
                    infowindow.open(map, marker);

                    // 주소 정보를 가져와서 입력 폼에 표시
                    var centerAddr = result[0].address.address_name;
                    document.getElementById('inputAddress').value = centerAddr;

                    // 경도, 위도 저장
                    var longitude = mouseEvent.latLng.getLng();
                    var latitude = mouseEvent.latLng.getLat();
                    document.getElementById('longitude').innerText = longitude;
                    document.getElementById('latitude').innerText = latitude;

                    // 주소 저장
                    document.getElementById('address').innerText = centerAddr;
                }
            });
        });

        function searchAddr() {
            var inputAddress = document.getElementById('inputAddress').value;

            geocoder.addressSearch(inputAddress, function (result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    map.setCenter(coords);

                    // 주소 정보를 가져와서 입력 폼에 표시
                    var centerAddr = result[0].address.address_name;
                    document.getElementById('inputAddress').value = centerAddr;

                    // 경도, 위도 저장
                    var longitude = result[0].x;
                    var latitude = result[0].y;
                    document.getElementById('longitude').innerText = longitude;
                    document.getElementById('latitude').innerText = latitude;

                    // 주소 저장
                    document.getElementById('address').innerText = centerAddr;
                }
            });
        }

        function searchDetailAddrFromCoords(coords, callback) {
            geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
        }
    </script>
</body>
</html>
