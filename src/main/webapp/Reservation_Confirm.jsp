<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*" %>
    <%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<style>
.banner {
    float: left;
    width: 100%;
    height: 400px;
    margin-top: 120px;
  }
  
  /* box_menu */
  
  .box_menu {
    float: left;
    width: 1400px;
    height: 150px;
    margin: 50px 0 0 225px;
  }
  
  .box_menu .box_menu_two,
  .box_menu .box_menu_three,
  .box_menu .box_menu_four {
    float: left;
    width: 238px;
    height: 100px;
    margin: 20px 0 0 20px;
    background-color: #f4f3ed;
  }
  
  .box_menu .box_menu_one {
    float: left;
    width: 238px;
    height: 100px;
    margin: 20px 0 0 10px;
    background-color: #C580DA;
  }
  
  .box_menu .box_menu_one_t1 {
    text-align: center;
    font-size: 25px;
    margin: 35px;
    font-weight: bold;
    color: white;
  }
  
  .box_menu .box_menu_two_t1, 
  .box_menu .box_menu_four_t1 {
    text-align: center;
    font-size: 25px;
    margin: 35px;
    font-weight: 500;
    color: #4B4B4B;
  }
  
  .box_menu .box_menu_three_t1 {
      text-align: center;
    font-size: 25px;
    margin-top: 37px;
    font-weight: 500;
    color: #4B4B4B;
  }

.content {
	height: 1000px;
}

.content_first_title {
  float: left;
  /* border: 1px solid; */
  width: 600px;
  height: 100px;
  margin: 50px 0 0 450px;
}

.content_first_title_t1 {
  text-align: center;
  font-size: 40px;
  font-weight: bold;
}

.content_first_title_t2 {
  text-align: center;
  font-size: 18px;
  margin: 20px;
}

.content_second_title {
  float: left;
  /* border: 1px solid; */
  width: 1030px;
  height: 900px;
  margin-top: 70px;
  margin-left: 250px;
}

input[type=text] {
  float: left;
  margin-top: 50px;
  margin-left: 10px;
  width: 200px;
  height: 30px;
}

.btn {
  float: left;
  margin-top: 50px;
  margin-left: 5px;
}

table.type10 {
  float: left;
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  margin-top: 10px;
  margin-left: -50px;
}

table.type10 thead {
  width: 100%;
  padding: 10px;
  font-weight: bold;
  border-top: 1px solid #C580DA;
  border-bottom: 1px solid #C580DA;
  color: black;
  margin: 20px 10px;
}

table.type10 tbody th {
  /*번호칸 가로길이*/
  width: 50px;
  padding: 10px;
}

table.type10 td {
  /*내용 작성자 답변 길이*/
  padding: 10px;
  vertical-align: middle;
}

.chxbox1{
	float:left;
	margin-left: 200px;
	margin-top:5px;
}
table.type10 .ca0 {
  width: 0px;
  height: 40px;
	padding-top: 15px;
}

table.type10 .ca1,
table.type10 .ca3,
table.type10 .ca4,
table.type10 .ca5,
table.type10 .ca7 {
  width: 250px;
  height: 40px;
	padding-top: 15px;
}

table.type10 .ca2 {
  width: 180px;
  height: 40px;
	padding-top: 15px;
}

table.type10 .ca6 {
  width: 240px;
  height: 40px;
	padding-top: 15px;
}

table.type10 .even {
  background: #f9f2fb;
  height: 60px;
}

.btn1{
	float:left;
	width: 80px;
	height: 43px;
	border-radius: 10px;
	background-color: #C580DA;
	border: none;
	color:#ffffff;
	margin-left: 900px;
	margin-top: 30px;
	cursor: pointer;
	font-size: 15px;
	font-weight: 900;
}

.btn2{
	float:left;
	width: 80px;
	height: 43px;
	border-radius: 10px;
	background-color: #C580DA;
	border: none;
	color:#ffffff;
	margin-left: 20px;
	margin-top: 30px;
	cursor:pointer;
	font-size: 15px;
	font-weight: 900;
}
</style>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>모두의 빌라</title>

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
  <!-- banner -->
	<div class="banner">
    <img src="./images/introduce.png" width="1509" height="360">
  </div>

  <!-- box_menu -->
	<div class="box_menu">
		<a href="Reservation_Confirm.jsp">
			<div class="box_menu_one">
				<div class="box_menu_one_t1">예약내역</div>
			</div>
		</a>
		<a href="Confirm_Registration.jsp">
			<div class="box_menu_two">
				<div class="box_menu_two_t1">등록확인</div>
			</div>
		</a>
		<a href="information_Modified.jsp">
			<div class="box_menu_three">
				<div class="box_menu_three_t1">개인정보수정</div>
			</div>
		</a>
		<a href="user_remove1.jsp">
			<div class="box_menu_four">
				<div class="box_menu_four_t1">회원탈퇴</div>
			</div>
		</a>
	</div>

  <!-- content -->
	<div id="content">
		<div class="content_first_title">
			<div class="content_first_title_t1">예약내역</div>
			<div class="content_first_title_t2">My Consultation History of VIla Parking Garage Websites.</div>
		</div>
		<div class="content_second_title">
		<span style="color: green; font-weight: bold;">- 결제완료		</span><span style="color: blue; font-weight: bold;">	- 이용중</span><span style="color: red; font-weight: bold;">		- 이용완료</span>
			<table class="type10">
				<thead>
					<tr>
						<th scope="cols" align="center" class="ca0"></th>
						<th scope="cols" align="center" class="ca2">예약자명</th>
						<th scope="cols" align="center" class="ca4">시간</th>
						<th scope="cols" align="center" class="ca5">예약일</th>
						<th scope="cols" align="center" class="ca6">예약장소</th>
						<th scope="cols" align="center" class="ca7">상태</th>
					</tr>
				</thead>
				<tbody>
<%
    // 데이터베이스 연결 정보
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // JDBC 드라이버 로드
        Class.forName("com.mysql.jdbc.Driver");

        // 데이터베이스 연결 정보 설정
        String url = "jdbc:mysql://localhost:3306/odbo";
        String username = "root";
        String password = "qwer1234";
        conn = DriverManager.getConnection(url, username, password);

        // SQL 쿼리 작성 (buyer_id=user_id 조건으로 사용자의 예약 내역을 가져옴)
        String sql = "SELECT buyer_id, startTime, payment_time, duration, nickname, status, address_id FROM payment_status WHERE buyer_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, user_id);

        // SQL 쿼리 실행
        rs = pstmt.executeQuery();

        // 예약 내역을 출력
        while (rs.next()) {
            String buyer_id = rs.getString("buyer_id");
            String startTime = rs.getString("startTime");
            int duration = rs.getInt("duration");
            String nickname = rs.getString("nickname");
            String status = rs.getString("status");
            String payment_time = rs.getString("payment_time");
            int address_id = rs.getInt("address_id");
            
            //payment_time 날짜만 추출
            String truncatedDate = payment_time.substring(0, 10);
            
            //끝나는 시간 계산
            String[] timeParts = startTime.split(":");
            int hours = Integer.parseInt(timeParts[0]);
            int minutes = Integer.parseInt(timeParts[1]);

            int durationHours = duration / 60;
            int durationMinutes = duration % 60;

            hours += durationHours;
            minutes += durationMinutes;

            if (minutes >= 60) {
                hours += 1;
                minutes %= 60;
            }

            if (hours >= 24) {
                hours %= 24;
            }

            // 만약 시간이 한 자리 숫자일 경우, 앞에 0을 붙이기
            String newTime = String.format("%02d:%02d", hours, minutes);
            
            // 현재 시간과 예약 시간 비교
            // 현재 시간을 가져옵니다.
    		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    		String currenttime = sdf.format(new java.util.Date());
    		
            if (currenttime.compareTo(startTime) >= 0 && currenttime.compareTo(newTime) <= 0) {
                
            	// 사용중
                String updateSql = "UPDATE payment_status SET status = '이용중' WHERE buyer_id = ? AND status = '결제완료'";
                pstmt = conn.prepareStatement(updateSql);
                pstmt.setString(1, user_id);
                pstmt.executeUpdate();
            } else if (currenttime.compareTo(newTime) > 0) {
                // 사용완료
                String updateSql = "UPDATE payment_status SET status = '이용완료' WHERE buyer_id = ? AND status = '이용중'";
                pstmt = conn.prepareStatement(updateSql);
                pstmt.setString(1, user_id);
                pstmt.executeUpdate();
            }


            // 결과를 출력
            %>
            <tr>
            	<td class="even" align="center">
				<input type="checkbox" name="open" onclick='checkOnlyOne(this)'>
				</td>
                <td class="even" align="center"><%= buyer_id %></td>
                <td class="even" align="center"><%= startTime %>~<%= newTime %></td>
                <td class="even" align="center"><%= truncatedDate %></td>
                <td class="even" align="center">
                <a href="pay_check.jsp?id=<%= address_id %>">
                <%= nickname %>
                </a></td>
                <td class="even" align="center">
                <span style="color: <%= status.equals("결제완료") ? "green" : status.equals("이용중") ? "blue" : "red" %>; font-weight: bold;">
    				<%= status %>
				</span>
                </td>
            </tr>
            <%
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("오류 발생: " + e.getMessage());
    } finally {
        if (rs != null) {
            rs.close();
        }
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
%>
				</tbody>
			</table>
			<input type = "button" class="btn1" value = "삭제">
		</div>
	</div>
</body>

</html>