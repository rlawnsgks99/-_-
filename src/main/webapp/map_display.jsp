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
            height: 360px;
        }

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

.search-button {
    width: 180px;
    font-size: 25px;
}

.search-button {
    font-family: Arial, sans-serif; /* 폰트 설정 */
    font-weight: normal; /* 텍스트 굵기 설정 */
    background-color: #007BFF; /* 배경색 설정 */
    color: #fff; /* 텍스트 색상 설정 */
    padding: 10px 20px; /* 내부 여백 설정 */
    border: none; /* 테두리 제거 */
    cursor: pointer; /* 마우스 커서 설정 */
    border-radius: 5px; /* 버튼 모서리 둥글게 설정 */
    transition: background-color 0.3s ease; /* 부드러운 색상 변화 설정 */
}

.search-button:hover {
    background-color: #0056b3; /* 마우스 호버 시 배경색 변경 */
}

  		
.filter-table {
    border: 1px solid #ccc;
    border-collapse: collapse;
    width: 600px;
}

.filter-table caption {
    font-weight: bold;
    padding: 10px;
    text-align: center;
    background-color: #f2f2f2;
}

.filter-table th, .filter-table td {
    border: 1px solid #ccc;
    padding: 8px;
    text-align: left;
}

.filter-table th {
    background-color: #f2f2f2;
    font-weight: bold;
    width: 25%; /* 각 열의 너비를 조절 */
}

.filter-table td {
    width: 25%; /* 각 열의 너비를 조절 */
}

.filter-table tr:nth-child(even) {
    background-color: #f9f9f9;
}

.filter-table tr:hover {
    background-color: #e3e3e3;
}


	
    </style>
    
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

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
    <div id="icon1-1"><h1>주차 예약</h1></div>
    </div>
    <br>
    <h1>예약하실 곳을 클릭해주세요.</h1>
    <h2>마커를 클릭 시 정보를 볼 수 있습니다.</h2>
    <br>
	<!-- 검색창과 버튼 추가 -->
    <div id="searchBox">
        <input type="text" id="keywordInput" placeholder="장소 또는 지명을 입력하세요">
        <button id="searchButton">이동</button>
    </div>

    <div class="map_wrap">
        <div id="map"></div>
    </div>
    <br>예약할 곳을 찾기 어려우시다면 필터를 통해 원하시는 곳을 찾아보세요.
<form action="search.jsp" method="GET" class="custom-form">
<table class="filter-table">
<caption>필터</caption>
    <tr>
        <th>위치 (지상/지하):</th>
        <td>
            <select name="location" id="location">
                <option value="">전체</option>
                <option value="지상">지상</option>
                <option value="지하">지하</option>
            </select>
        </td>
        <th>가능 시간(오전/오후/하루종일):</th>
        <td>
            <select name="time" id="time">
                <option value="">전체</option>
                <option value="오전">오전</option>
                <option value="오후">오후</option>
                <option value="하루종일">하루종일</option>
            </select>
        </td>
    </tr>
    <tr>
        <th>높이 제한 :</th>
        <td>
            <select name="height_limit" id="height_limit">
                <option value="">전체</option>
                <option value="제한없음">제한없음</option>
                <option value="2m~3m">2m~3m</option>
                <option value="3m~4m">3m~4m</option>
                <option value="4m 이상">4m 이상</option>
            </select>
        </td>
        <th>주차가능차종(~까지) :</th>
        <td>
            <select name="vehicle_type" id="vehicle_type">
                <option value="">전체</option>
                <option value="소형차">소형차</option>
                <option value="중형차">중형차</option>
                <option value="대형차">대형차</option>
                <option value="화물차">화물차</option>
                <option value="특수차">특수차</option>
            </select>
        </td>
    </tr>
</table>

    <input type="submit" value="찾기" class="search-button">
</form><br><br>


    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a47fcd486e06f79331ec9d08f91152b&libraries=services"></script>
    <script>
        var mapContainer = document.getElementById('map');
        var mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심 좌표
            level: 4 // 지도의 확대 레벨
        };

        var map = new kakao.maps.Map(mapContainer, mapOption);

        // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
        if (navigator.geolocation) {
            // GeoLocation을 이용해서 접속 위치를 얻어옵니다
            navigator.geolocation.getCurrentPosition(function(position) {
                var lat = position.coords.latitude, // 위도
                    lon = position.coords.longitude; // 경도
                var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                    message = '<div style="padding:5px;">현재 위치</div>'; // 인포윈도우에 표시될 내용입니다
                // 마커와 인포윈도우를 표시합니다
                displayMarker(locPosition, message);
            });
        } else {
            // HTML5의 GeoLocation을 사용할 수 없을 때 마커 표시 위치와 인포윈도우 내용을 설정합니다
            var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
                message = 'geolocation을 사용할수 없어요..'
            displayMarker(locPosition, message);
        }

        // 지도에 마커와 인포윈도우를 표시하는 함수입니다
        function displayMarker(locPosition, message) {

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({  
                map: map, 
                position: locPosition
            }); 
            
            var iwContent = message, // 인포윈도우에 표시할 내용
                iwRemoveable = true;

            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
                content : iwContent,
                removable : iwRemoveable
            });
            
            // 인포윈도우를 마커위에 표시합니다 
            infowindow.open(map, marker);
            
            // 지도 중심좌표를 접속위치로 변경합니다
            map.setCenter(locPosition);      
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
        <script>
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
    </script>
</body>
</html>
