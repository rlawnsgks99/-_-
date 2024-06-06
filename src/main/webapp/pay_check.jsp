<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주소 정보 확인</title>
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
    
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    
    <style>
    table {
        border-collapse: collapse;
        width: 1509px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    
    /* 폼 스타일링 */
#reservationInfoForm {
    display: flex;
    flex-direction: column;
    max-width: 300px;
    margin-bottom: 20px;
}

label {
    margin-bottom: 5px;
}

input[type="time"],
select {
    padding: 8px;
    margin-bottom: 10px;
    border-radius: 4px;
    border: 1px solid #ccc;
}

input[type="time"]:focus,
select:focus {
    outline: none;
    border-color: #007bff;
    box-shadow: 0 0 5px #007bff;
}

/* 버튼 스타일링 */
button {
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    background-color: #007bff;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #0056b3;
}
    
    
</style>
    <link rel="stylesheet" href="./main.css" />
    <link rel="stylesheet" href="./styles.css" />
</head>
<body>
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
			                            <h4>등록된 주차장 관리</h4>
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
    <h1>주소 정보 확인</h1>

    <table>

            <%
                // pay_check.jsp로부터 id 파라미터 가져오기
                String idParam = request.getParameter("id");
                int id = Integer.parseInt(idParam);

                // JDBC 드라이버 로드 및 DB 연결 설정
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/odbo"; // DB 이름을 적절히 변경해주세요
                String username = "root"; // 사용자명을 적절히 변경해주세요
                String password = "qwer1234"; // 비밀번호를 적절히 변경해주세요
                Connection conn = DriverManager.getConnection(url, username, password);

                // 선택한 주소 정보 조회 쿼리 실행
                String sql = "SELECT * FROM address_table WHERE id=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, id);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    String address = rs.getString("address");
                    String seller_id = rs.getString("seller_id");
                    String nickname = rs.getString("nickname");
                    int capacity = rs.getInt("capacity");
                    String time = rs.getString("time");
                    int price_per_30min = rs.getInt("price_per_30min");
                    String notes = rs.getString("notes");
                    String location = rs.getString("location");
                    String height_limit = rs.getString("height_limit");
                    String vehicle_type = rs.getString("vehicle_type");
                    String image = rs.getString("image");
                    String start_time = rs.getString("start_time");
                    String end_time = rs.getString("end_time");

            %>

    <tr>
        <th>항목</th>
        <th>내용</th>
    </tr>
    <tr>
    	<td>주소</td>
    	<td><%= address %>
    <tr>
        <td>판매자 ID</td>
        <td><%= seller_id %></td>
    </tr>
    <tr>
        <td>닉네임</td>
        <td><%= nickname %></td>
    </tr>
    <tr>
    	<td>가능시간대</td>
    	<td><%= start_time %>~<%= end_time %></td>
    </tr>
    <tr>
        <td>수용 인원</td>
        <td><%= capacity %></td>
    </tr>
    <tr>
        <td>주차 가능 시간대</td>
        <td><%= time %></td>
    </tr>
    <tr>
        <td>30분당 가격</td>
        <td><%= price_per_30min %> 원</td>
    </tr>
    <tr>
        <td>특이사항</td>
        <td><%= notes %></td>
    </tr>
    <tr>
        <td>위치</td>
        <td><%= location %></td>
    </tr>
    <tr>
        <td>높이 제한</td>
        <td><%= height_limit %></td>
    </tr>
    <tr>
        <td>차종</td>
        <td><%= vehicle_type %></td>
    </tr>
    </table>
<br><br>
    
<form id="reservationInfoForm">
    <label for="startTime">시작 시간:</label>
    <input type="time" id="startTime" required>
    
    <label for="duration">이용 기간(분):</label>
    <select id="duration" required>
        <option value="30">30분</option>
        <option value="60">60분</option>
        <option value="90">90분</option>
        <option value="120">120분</option>
        <option value="150">150분</option>
        <option value="180">180분</option>
        <option value="210">210분</option>
        <option value="240">240분</option>
        <option value="270">270분</option>
        <option value="300">300분</option>
    </select>
</form>
<button onclick="calculateAndRequestPay()">결제하기</button>
<br>
<br>
<script>
    function calculateAndRequestPay() {
        const IMP = window.IMP; // i'mport 모듈을 불러옵니다.
        IMP.init("imp48432780"); // 식별 코드를 사용하여 i'mport를 초기화합니다.
        // 이용 시작 시간과 이용 기간을 가져옵니다.
        var startTime = document.getElementById("startTime").value;
        var duration = parseInt(document.getElementById("duration").value);

        // 시작 시간과 종료 시간을 가져옵니다.
        var reservationStartTime = "<%= start_time %>";
        var reservationEndTime = "<%= end_time %>";

        // 이용 시작 시간이 유효한지 검사
        if (startTime < reservationStartTime) {
            alert("유효한 시작 시간을 선택하세요.");
            return;
        }

        // 이용 종료 시간을 계산
        var endTime = new Date(startTime);
        endTime.setMinutes(endTime.getMinutes() + duration);

        // 종료 시간이 유효한지 검사
        if (endTime > reservationEndTime) {
            alert("유효한 종료 시간을 선택하세요.");
            return;
        }

        // 이용 시간에 따른 금액 계산 (예: 30분당 가격 * 이용 시간)
        var pricePer30min = <%= price_per_30min %>;
        var price = pricePer30min * (duration / 30);

        // 결제 정보를 구성합니다.
        var payInfo = {
            pg: "html5_inicis",
            pay_method: "card",
            merchant_uid: "merchant_" + new Date().getTime(),
            name: "<%= nickname %>",
            amount: price,
            buyer_email: "", // 구매자 이메일
            buyer_name: "<%= user_id %>",
            buyer_tel: "010-1234-5678", // 구매자 전화번호
            buyer_addr: "구매자 주소", // 구매자 주소
            buyer_postcode: "12345", // 구매자 우편번호
            id: <%= id %>, // 추가: 아이디
            seller_id: "<%= seller_id %>", // 추가: 판매자 아이디
            startTime: document.getElementById("startTime").value, // 추가: 이용 시작 시간
            duration: parseInt(document.getElementById("duration").value) // 추가: 이용 기간
        };

        IMP.request_pay(payInfo, function (rsp) {
            if (rsp.success) {
            	
                var data = {
                        user_id: "<%= user_id %>",
                        nickname: "<%= nickname %>",
                        seller_id: "<%= seller_id %>",
                        startTime: document.getElementById("startTime").value,
                        duration: parseInt(document.getElementById("duration").value),
                        id : "<%= id %>"
                    };

                    // save_payment.jsp로 이동하고 데이터를 쿼리 매개변수로 전달
                    window.location.href = "save_payment.jsp?" + new URLSearchParams(data);
                    alert('주소 정보가 성공적으로 저장되었습니다.');
                
            } else {
            	//결제가 실패한 경우
            	alert('결제가 성공적으로 실패되었습니다.');
                console.error("결제 정보 저장 실패. 상태 코드: " + xhr.status);
                console.error("오류 메시지: " + xhr.responseText);
            }
        });

    }


</script>
            <%
                }

                // DB 연결 해제
                rs.close();
                pstmt.close();
                conn.close();
            %>
</body>
</html>
