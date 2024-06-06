<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>등록된 주차장 관리</title>
    <style>
table.type10 {
    border-collapse: collapse;
    width: 1509px;
}

table.type10 th, table.type10 td {
    border: 1px solid #4B4B4B;
    text-align: center;
    padding: 10px;
}

table.type10 thead {
    background-color:#f4f3ed;
    color: black; /* 텍스트 색상 */
}

        
        #icon1 {
  			 width: 350px;
  			 height: 40px;
			 background-color: #C580DA;
        }
        #icon1-1{
            text-align: center;
  			font-size: 25px;
  			font-weight: bold;
  			color: white;
  			}
        
    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>빌라의 주차장</title>
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
    <header>
        <div class="inner">
            <!-- Header 내용 -->
            <%
			    // 세션에서 사용자 아이디 가져오기
			    String user_id = (String) session.getAttribute("user_id");
            	String seller_id = user_id;

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
	  <!-- banner -->
	<div class="banner">
    <img src="./images/introduce.png" width="1509" height="360">
  </div><br><br>
  
    <div id="icon1">
    <div id="icon1-1"><h1>등록된 주차장 관리</h1></div>
    </div><br>
    <%
    if (session.getAttribute("user_id") == null) {
    %>
       로그인 후 이용해주세요.
    <%
    } else {
    %>
       <%= user_id %> 님의 등록된 주차장 내역입니다.
    <%
    }
    %>
    <table class="type10">
        <thead>
            <tr>
                <th scope="col" align="center" class="ca1">상가/건물명</th>
                <th scope="col" align="center" class="ca2">주소</th>
                <th scope="col" align="center" class="ca3">수정</th>
                <th scope="col" align="center" class="ca4">삭제</th>
            </tr>
        </thead>
        <tbody>
            <%

            // 데이터베이스 연결 정보
            String url = "jdbc:mysql://localhost:3306/odbo";
            String username = "root";
            String password = "qwer1234";

            try {
                // 데이터베이스 연결
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url, username, password);

                // SQL 쿼리
                String query = "SELECT * FROM address_table WHERE seller_id=?";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setString(1, seller_id);

                // 쿼리 실행
                ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
                    String nickname = rs.getString("nickname");
                    String address = rs.getString("address");
                    int id = rs.getInt("id");
            %>
                <tr>
                    <td><%= nickname %></td>
                    <td><%= address %></td>
                    <td><a href="address_edit.jsp?id=<%= id %>">수정</a></td>
                    <td><a href="address_delete.jsp?id=<%= id %>">삭제</a></td>
                </tr>
            <%
                }

                rs.close();
                pstmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </tbody>
    </table>
<br><br>
<div style="float: left;">
    <a href="map_input.jsp">
        <button type="button" style="width: 200px; height: 40px; background-color: #C580DA; color: white; font-size: 15px; border: none;">주차장 더 등록하러 가기</button>
    </a>
</div>
</body>
</html>
