<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주차장 주소 등록</title>
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
table.type10 {
    border-collapse: collapse;
    width: 1509px;
}

table.type10 th, table.type10 td {
    border: none; /* 모든 테두리 선을 없앰 */
    text-align: center;
    padding: 10px;
}

table.type10 thead {
    background-color: #f4f3ed;
    color: black;
}

    </style>
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <link rel="stylesheet" href="./favicon.png">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
  <link rel="stylesheet" href="./main.css" />
  <link rel="stylesheet" href="./styles.css" />
  

  <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

  <!-- GSAP & ScrollToPlugin -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.0/gsap.min.js" integrity="sha512-GQ5/eIhs41UXpG6fGo4xQBpwSEj9RrBvMuKyE2h/2vw3a9x85T1Bt0JglOUVJJLeyIUl/S/kCdDXlE/n7zCjIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.0/ScrollToPlugin.min.js" integrity="sha512-TxuhgzYZZCsKL8STS5wmzau5RF3EotX6lAOZPkOJwfy7q9fXMzhlEHfQI4iUuxVMgkbG5XUtzbjshNCKYL+VXw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

  <!-- SWIPER -->
  <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
  <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
  
  <!-- ScrollMagic -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js" integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

  <script defer src="./main.js"></script>
</head>
<body>
	<!-- header -->
    <header>
        <div class="inner">
            <!-- Header 내용 -->
            <%
			    // 세션에서 사용자 아이디 가져오기
			    String user_id = (String) session.getAttribute("user_id");

			%>
            <a href="main.jsp" class="logo">
                <img src="./images/villa_Logo.png" alt="Everybody's villa" />
            </a>
				<div class="sub-menu">
    				<ul class="menu">
        				<li>
            				<%
            				if (session.getAttribute("user_id") == null) {
            				%>
                				<a href="login.jsp">로그인</a>
            				<%
            				} else {
            				%>
                				어서오세요 <%= user_id %> 님
            				<%
            				}
            				%>
        				</li>
        				<li>
            				<%
            				if (session.getAttribute("user_id") == null) {
            				%>
                				<a href="sign.jsp">회원가입</a>
            				<%
            				} else {
            				%>
                				<a href="logout.jsp">로그아웃</a>
            				<%
            				}
            				%>
        				</li>
        				<li><a href="./ect/introduce.jsp">회사소개</a></li>
    				</ul>
				</div>

			<ul class="main-menu">
			    <li class="item">
			        <div class="item__name">고객센터</div>
			        <div class="item__contents">
			            <div class="contents__menu">
			                <ul class="inner">
			                    <li>
			                        <a href="./ect/introduce.jsp">
			                            <h4>이용소개</h4>
			                        </a>
			                    </li>
			                    <li>
			                        <a href="./ect/notice1.jsp">
			                            <h4>공지사항</h4>
			                        </a>
			                    </li>
			                    <li>
			                        <a href="./ect/question.jsp">
			                            <h4>문의하기</h4>
			                        </a>
			                    </li>
			                </ul>
			            </div>
			            <div class="contents__texture">
			                <div class="inner">
			                    <h4>자신이 살고 있는 집의 주차공간이 있다면?</h4>
			                    <p>모빌이 여러분에게 주차장을 좀 더 효율적으로 사용할 수 있게 해드립니다.</p>
			                    <h4>주변 주차장이 너무 비싸다면?</h4>
			                    <p>모빌을 이용해보세요! 남는 자리를 적은 비용으로 사용이 가능해요.</p>
			                </div>
			            </div>
			        </div>
			    </li>
			    <li class="item">
			        <div class="item__name">건물주페이지</div>
			        <div class="item__contents">
			            <div class="contents__menu">
			                <ul class="inner">
			                    <li>
			                        <a href="map_input.jsp">
			                            <h4>주차장 등록</h4>
			                        </a>
			                    </li>
			                    <li>
			                        <a href="address_management.jsp">
			                            <h4>주차장 예약 관리</h4>
			                        </a>
			                    </li>
			                </ul>
			            </div>
			            <div class="contents__texture">
			                <div class="inner">
			                    <h4>건물 등록</h4>
			                    <p>보다 빠르게 주차장을 등록해보세요.</p>
			                </div>
			            </div>
			        </div>
			    </li>
			    <li class="item">
			        <div class="item__name">예약하기</div>
			        <div class="item__contents">
			            <div class="contents__menu">
			                <ul class="inner">
			                    <li>
			                        <a href="map_display.jsp">
			                            <h4>예약하기</h4>
			                        </a>
			                    </li>
			                </ul>
			            </div>
			            <div class="contents__texture">
			                <div class="inner">
			                    <h4>예약하기</h4>
			                    <p>보다 빠르게 주차장을 찾아보세요.</p>
			                </div>
			            </div>
			        </div>
			    </li>
			    <li class="item">
			        <div class="item__name">마이페이지</div>
			        <div class="item__contents">
			            <div class="contents__menu">
			                <ul class="inner">
			                    <li>
			                        <a href="Reservation_Confirm.jsp">
			                            <h4>예약확인</h4>
			                        </a>
			                    </li>
			                    <li>
			                        <a href="Confirm_Registration.jsp">
			                            <h4>등록확인</h4>
			                        </a>
			                    </li>
			                    <li>
			                        <a href="information_Modified.jsp">
			                            <h4>개인 정보 수정</h4>
			                        </a>
			                    </li>
			                    <li>
			                        <a href="user_remove1.jsp">
			                            <h4>회원탈퇴</h4>
			                        </a>
			                    </li>
			                </ul>
			            </div>
			            <div class="contents__texture">
			                <div class="inner">
			                    <h4>마이페이지</h4>
			                    <p>내 개인정보를 수정해보세요.</p>
			                </div>
			            </div>
			        </div>
			    </li>
			    <li class="item">
			    <%
			    if(session.getAttribute("user_id") == null){
			    	%>
			        <div class="item__name">회원등록</div>
			        <div class="item__contents">
			            <div class="contents__menu">
			                <ul class="inner">
			                    <li>
			                        <a href="login.jsp">
			                            <h4>로그인</h4>
			                        </a>
			                    </li>
			                    <li>
			                        <a href="sign.jsp">
			                            <h4>회원가입</h4>
			                        </a>
			                    </li>
			                    <li>
			                        <a href="find.jsp">
			                            <h4>아이디 / 비밀번호 찾기</h4>
			                        </a>
			                    </li>
			                </ul>
			            </div>
			            <div class="contents__texture">
			                <div class="inner">
			                    <h4>어서오세요!</h4>
			                    <p>로그인 해보시고 안된다면 회원가입을 하시거나 찾아보세요!</p>
			                </div>
			            </div>
			        </div>
			        <%
			    } else {
			    %>
			    <%
			    }
			    %>
			    </li>
			</ul>
		</div>
	</header>
  			

    <img src="./images/introduce.png" width="1509" height="360">
    <br>

    <div id="icon1">
    <div id="icon1-1"><h1>주차장 등록</h1></div>
    </div><br>
    <%
    if (session.getAttribute("user_id") == null) {
    %>
       <center>로그인 후 이용해주세요.</center><br>
    <%
    } else {
    %>
       <%= user_id %> 님.
    <%
    }
    %>
    <div class="map_wrap">
    <div id="map"></div>
    <div id="menu_wrap">
    <div id="searchBox">
        <input type="text" id="keywordInput" placeholder="장소 또는 지명을 입력하세요">
        <button id="searchButton">검색</button>
    </div>
    </div>
	</div>
    <form id="addressForm" action="save_address.jsp" method="POST" enctype="multipart/form-data">
    <div class="table-container">
    <table class="type10">
    <tr>
	<td><div id ="tt">아이디</div></td><td><div id="user_id"><%= user_id %></div></td>
    </tr>
    <tr>
    <td><div id ="tt">주소</div></td>
    <td><input type="text" id="addressInput" name="address" placeholder="주소를 지도에 클릭해주세요."></td>    
    </tr>
    <tr>
    <td><div id="tt">상가/건물명</div></td>
    <td><input type="text" id="nicknameInput" name="nickname" placeholder="주차장 별칭을 입력하세요"></td>
    </tr>
    <tr>
    <td><div id="tt">기타 시항</div></td>
    <td><input type="text" id="notesInput" name="notes" placeholder="기타 특이사항"></td>
    </tr>
    <tr>
    <td><div id="tt">30분당 가격</div></td>
    <td><input type="number" id="priceInput" name="price_per_30min" placeholder="30분당 가격 (원)"></td>
    </tr>
    <tr>
    <td><div id="tt">주차 가능 차량 수</div></td>
    <td><input type="number" id="capacityInput" name="capacity" placeholder="주차 가능 차량 수(숫자로만 입력해주세요.)"> <!-- 추가: 주차 가능 차량 수 입력 필드 --></td>
	</tr>
	<tr>
        <td><div id="tt"><label>주차 가능 시간대</label></div></td>
        <td>
        <input type="radio" id="morningTime" name="time" value="오전">오전
        <input type="radio" id="afternoonTime" name="time" value="오후">오후
        <input type="radio" id="fullDayTime" name="time" value="하루종일">하루종일
        </td>
    </tr>
    <tr>
	<td><div id="tt">주차장 층</div></td>
	<td>
    <input type="radio" name="location" value="지상">지상
    <input type="radio" name="location" value="지하">지하
    </td>
    </tr>
    <tr>
	<td><div id="tt">높이 제한</div></td>
	<td>
    <input type="radio" name="height_limit" value="제한없음">제한없음
    <input type="radio" name="height_limit" value="2m~3m">2m~3m
    <input type="radio" name="height_limit" value="3m~4m">3m~4m
    <input type="radio" name="height_limtt" value="4m~">4m 이상
    </td>
    </tr>
    
    <tr>
    <td><div id="tt">주차 가능 차총</div></td>
    <td>
    <input type="radio" name="vehicle_type" value="소형차">소형차
    <input type="radio" name="vehicle_type" value="중형차">중형차
    <input type="radio" name="vehicle_type" value="대형차">대형차
    <input type="radio" name="vehicle_type" value="화물차">화물차
    <input type="radio" name="vehicle_type" value="특수차량">특수차량
    </td>
    </tr>
    
    <tr>
    <td><div id="tt">프로필 사진</div></td>
    <td>
    <input type="file" id="imageUpload" name="front_image" accept="image/*">
    <img id="imagePreview" src="#" alt="대문 사진 미리보기" style="max-width: 100%; max-height: 200px; display: none;">
    </td>
    </tr>
    
    <tr>
    <td><div id="tt">주차 가능 시작 시간</div></td>
    <td>
        <input type="time" id="startTimeInput" name="start_time" required>
    </td>
	</tr>
	<tr>
    <td><div id="tt">주차 가능 종료 시간</div></td>
    <td>
        <input type="time" id="endTimeInput" name="end_time" required>
    </td>
	</tr>
    
    
    </table>
    </div>
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

        // Reverse geocoding to get the address
        var geocoder = new kakao.maps.services.Geocoder();
        geocoder.coord2Address(latlng.getLng(), latlng.getLat(), function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                document.getElementById('addressInput').value = result[0].address.address_name;
            }
        });

    });

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
        
        var start_time = document.getElementById('startTimeInput').value;
        var end_time = document.getElementById('endTimeInput').value;
        

        if (!marker || !address || !nickname || !capacity || !time || !price_per_30min || !notes || !location || !height_limit || !vehicle_type || !seller_id || !start_time || !end_time) {
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
                    window.location.href = 'main.jsp';
                    // 페이지 이동 또는 필요한 처리 수행
                    //openPaymentWindow()
                } else {
                    alert('주소 정보 저장 중 오류가 발생했습니다.');
                }
            }
        };
        xhr.send('address=' + encodeURIComponent(address) + '&nickname=' + encodeURIComponent(nickname) + '&capacity=' + encodeURIComponent(capacity) + '&time=' 
        		+ encodeURIComponent(time) + '&price_per_30min=' + encodeURIComponent(price_per_30min) + '&notes=' + encodeURIComponent(notes) + '&location=' 
        		+ encodeURIComponent(location) + '&height_limit=' + encodeURIComponent(height_limit) + '&vehicle_type=' + encodeURIComponent(vehicle_type) + 
        		'&longitude=' + longitude + '&latitude=' + latitude + '&seller_id=' + encodeURIComponent(seller_id) + '&start_time=' + encodeURIComponent(start_time) + '&end_time=' + encodeURIComponent(end_time));
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