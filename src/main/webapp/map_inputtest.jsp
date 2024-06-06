<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주차장 주소 등록</title>
    <style>
        #map {
            width: 1509px;
            height: 360px;
        }
        
        #icon1 {
  			 width: 200px;
  			 height: 40px;
			 background-color: #C580DA;
        }
        #icon1-1{
            text-align: center;
  			font-size: 25px;
  			font-weight: bold;
  			color: white;
  			}
  		#tt {
  			font-weight : bold;
  		}
  			
    /* 주차장 정보 입력 폼 스타일 */
    #addressForm {
        text-align: center;
    }

    #addressForm input[type="text"],
    #addressForm select,
    #addressForm textarea {
        width: 100%;
        padding: 10px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    #addressForm label {
        display: block;
        text-align: center;
        font-weight: bold; /* 글씨를 굵게 표시 */
        font-size: 16px; /* 원하는 크기로 조정 */
    }

    #addressForm button {
        display: block;
        margin: 10px auto;
        padding: 10px 20px;
        background-color: #C580DA;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    </style>
  <script defer src="./main.js"></script>
</head>
<body>
            <%
			    // 세션에서 사용자 아이디 가져오기
			    String user_id = (String) session.getAttribute("user_id");

			%>

    <img src="./images/introduce.png" width="1509" height="360">
    <br>

 <h1>주차장 등록</h1>
      
    <div class="map_wrap">
    <div id="map"></div>
    <div id="menu_wrap">
    <div id="searchBox">
        <input type="text" id="keywordInput" placeholder="장소 또는 지명을 입력하세요">
        <button id="searchButton">검색</button>
    </div>
    </div>
	</div>
    <form action="save_test.jsp" method="post" enctype="multipart/form-data">
        <label for="addressInput">주소:</label>
        <input type="text" id="addressInput" name="address" required><br><br>

        <label for="nicknameInput">상가/건물명:</label>
        <input type="text" id="nicknameInput" name="nickname" required><br><br>

        <label for="notesInput">기타 사항:</label>
        <input type="text" id="notesInput" name="notes"><br><br>

        <label for="priceInput">30분당 가격 (원):</label>
        <input type="number" id="priceInput" name="price_per_30min" required><br><br>

        <label for="capacityInput">주차 가능 차량 수:</label>
        <input type="number" id="capacityInput" name="capacity" required><br><br>

        <label>주차 가능 시간대:</label>
        <input type="radio" name="time" value="오전">오전
        <input type="radio" name="time" value="오후">오후
        <input type="radio" name="time" value="하루종일">하루종일<br><br>

        <label>주차장 층:</label>
        <input type="radio" name="location" value="지상">지상
        <input type="radio" name="location" value="지하">지하<br><br>

        <label>높이 제한:</label>
        <input type="radio" name="height_limit" value="제한없음">제한없음
        <input type="radio" name="height_limit" value="2m~3m">2m~3m
        <input type="radio" name="height_limit" value="3m~4m">3m~4m
        <input type="radio" name="height_limit" value="4m~">4m 이상<br><br>

        <label>주차 가능 차량 종류:</label>
        <input type="radio" name="vehicle_type" value="소형차">소형차
        <input type="radio" name="vehicle_type" value="중형차">중형차
        <input type="radio" name="vehicle_type" value="대형차">대형차
        <input type="radio" name="vehicle_type" value="화물차">화물차
        <input type="radio" name="vehicle_type" value="특수차량">특수차량<br><br>

        <label for="frontImage">프로필 사진:</label>
        <input type="file" id="frontImage" name="front_image" accept="image/*">
        <img id="imagePreview" src="#" alt="대문 사진 미리보기" style="max-width: 100%; max-height: 200px; display: none;">
        <br><br>

        <button type="submit">저장</button>
    </form>


<script>
function openPaymentWindow() {
    // 새 창을 열고 창의 속성을 설정합니다.
    var paymentWindow = window.open("", "_blank", "width=400, height=300");
    
    // 새 창에 표시할 HTML을 작성합니다.
    var paymentFormHTML = `
        <html>
        <head>
            <title>결제 정보 입력</title>
        </head>
        <body>
            <h2>결제 정보 입력</h2>
            <form id="paymentForm">
                <div id="tt">은행명</div>
                <input type="text" id="bankName" name="bankName" placeholder="은행명 입력">
                
                <div id="tt">예금주</div>
                <input type="text" id="accountHolder" name="accountHolder" placeholder="예금주 입력">
                
                <div id="tt">계좌 번호</div>
                <input type="text" id="accountNumber" name="accountNumber" placeholder="계좌 번호 입력">
                
                <button type="button" id="savePaymentInfo" onclick="savePaymentInfo()">저장</button>
            </form>
        </body>
        </html>
    `;

    // 새 창에 HTML을 쓰고 닫힘 이벤트를 처리합니다.
    paymentWindow.document.write(paymentFormHTML);
    paymentWindow.onunload = function() {
        // 새 창이 닫힐 때의 동작을 정의할 수 있습니다.
    };
}

function savePaymentInfo() {
    // 사용자가 입력한 결제 정보를 가져와서 처리
    var bankName = document.getElementById("bankName").value;
    var accountHolder = document.getElementById("accountHolder").value;
    var accountNumber = document.getElementById("accountNumber").value;

    // 여기에서 서버로 결제 정보를 전송 또는 저장하는 로직을 추가
    // 예를 들어, AJAX를 사용하여 서버에 데이터를 전송합니다.
    
    // 창을 닫습니다.
    window.close();
}
</script>

	
	
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a47fcd486e06f79331ec9d08f91152b&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map');
    var mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 서울시청 좌표
        level: 3
    };

    var map = new kakao.maps.Map(mapContainer, mapOption);
    var marker;

    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
        var latlng = mouseEvent.latLng;

        if (marker) {
            marker.setPosition(latlng);
        } else {
            marker = new kakao.maps.Marker({
                position: latlng,
                map: map
            });
        }
        
        document.getElementById('addressForm').addEventListener('submit', function(event) {
            event.preventDefault(); // 폼의 기본 동작(페이지 이동)을 막음
            
            var seller_id = document.getElementById('user_id').textContent.trim(); // 사용자 ID 가져오기
            
            var address = document.getElementById('addressInput').value;
            var nickname = document.getElementById('nicknameInput').value;
            var capacity = document.getElementById('capacityInput').value;
            // 주차 가능 시간대 값을 가져오기
            var timeInputs = document.getElementsByName('time');
            var time;
            for (var i = 0; i < timeInputs.length; i++) {
                if (timeInputs[i].checked) {
                    time = timeInputs[i].value;
                    break;
                }
            }
            
            var price_per_30min = document.getElementById('priceInput').value; // 30분당 가격 (원)
            var notes = document.getElementById('notesInput').value; // 기타 특이사항
            
            var locationInputs = document.getElementsByName('location');
            var location;
            for (var i = 0; i < locationInputs.length; i++) {
                if (locationInputs[i].checked) {
                    location = locationInputs[i].value;
                    break;
                }
            }
            
            var heightLimitInputs = document.getElementsByName('height_limit');
            var height_limit;
            for (var i = 0; i < heightLimitInputs.length; i++) {
                if (heightLimitInputs[i].checked) {
                    height_limit = heightLimitInputs[i].value;
                    break;
                }
            }
            
            var vehicle_typeInputs = document.getElementsByName('vehicle_type');
            var vehicle_type;
            for (var i=0; i < vehicle_typeInputs.length; i++){
            	if ( vehicle_type = vehicle_typeInputs[i].checked) {
            		vehicle_type = vehicle_typeInputs[i].value;
            		break;
            	}
            }// 가능 차종

            if (!marker || !address || !nickname || !capacity || !time || !price_per_30min || !notes || !location || !height_limit || !vehicle_type || !seller_id) {
                alert('필수로 작성해야하는 정보가 비어있습니다.');
                return;
            }

            var latitude = marker.getPosition().getLat();
            var longitude = marker.getPosition().getLng();

            // 주소 정보를 서버로 전송
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'save_address.jsp', true);
            xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        alert('주소 정보가 성공적으로 저장되었습니다.');
                        // 페이지 이동 또는 필요한 처리 수행
                        openPaymentWindow()
                    } else {
                        alert('주소 정보 저장 중 오류가 발생했습니다.');
                    }
                }
            };
            xhr.send('address=' + encodeURIComponent(address) + '&nickname=' + encodeURIComponent(nickname) + '&capacity=' + encodeURIComponent(capacity) + '&time=' 
            		+ encodeURIComponent(time) + '&price_per_30min=' + encodeURIComponent(price_per_30min) + '&notes=' + encodeURIComponent(notes) + '&location=' 
            		+ encodeURIComponent(location) + '&height_limit=' + encodeURIComponent(height_limit) + '&vehicle_type=' + encodeURIComponent(vehicle_type) + 
            		'&longitude=' + longitude + '&latitude=' + latitude + '&seller_id=' + encodeURIComponent(seller_id));
        });

        // Reverse geocoding to get the address
        var geocoder = new kakao.maps.services.Geocoder();
        geocoder.coord2Address(latlng.getLng(), latlng.getLat(), function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                document.getElementById('addressInput').value = result[0].address.address_name;
            }
        });

    });
    
    // 이미지 업로드 컨트롤에 변경 이벤트 리스너 추가
    document.getElementById('imageUpload').addEventListener('change', function() {
        previewImage(this);
    });

    // 이미지 미리보기 함수
    function previewImage(input) {
        var imagePreview = document.getElementById('imagePreview');
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                imagePreview.src = e.target.result;
                imagePreview.style.display = 'block'; // 미리보기 이미지 표시
            };

            reader.readAsDataURL(input.files[0]);
        } else {
            imagePreview.src = '#';
            imagePreview.style.display = 'none'; // 이미지가 없으면 숨김
        }
    }
    
    
    // 검색 기능 구현
    const searchButton = document.getElementById('searchButton');
    const keywordInput = document.getElementById('keywordInput');

    searchButton.addEventListener('click', function () {
        const keyword = keywordInput.value;

        if (keyword) {
            // 검색 키워드를 이용해 장소 검색 요청
            const places = new kakao.maps.services.Places();

            places.keywordSearch(keyword, function (result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    // 검색 결과 중 첫 번째 장소의 좌표로 지도 이동
                    const coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    map.panTo(coords);
                }
            });
        }
    });
</script>

</body>
</html>