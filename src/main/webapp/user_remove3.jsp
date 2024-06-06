<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	width: 100%;
	height: 150px;
	margin: 50px 0 0 0px;
}

.box_menu .box_menu_one {
	float: left;
	width: 238px;
	height: 100px;
	margin: 20px 0 0 260px;
	background-color: #f4f3ed;
}

.box_menu .box_menu_two,
.box_menu .box_menu_three {
	float: left;
	width: 238px;
	height: 100px;
	margin: 20px 0 0 10px;
	background-color: #f4f3ed;
}

.box_menu .box_menu_four {
	float: left;
	width: 238px;
	height: 100px;
	margin: 20px 0 0 10px;
	background-color: #C580DA;
}

.box_menu .box_menu_four_t1 {
	text-align: center;
	font-size: 25px;
	margin: 35px;
	font-weight: bold;
	color: white;
}

.box_menu .box_menu_one_t1,
.box_menu .box_menu_two_t1, 
.box_menu .box_menu_three_t1 {
	text-align: center;
	font-size: 25px;
	margin: 35px;
	font-weight: 500;
	color: #4B4B4B;
}

.content {
	height: 1000px;
	width: auto;
}

.content_first_title {
	float: left;
	/* border: 1px solid; */
	width: 1200px;
	height: 100px;
	margin: 60px 0 0 150px;
	text-align:center;
}

.content_first_title_t1 {
	text-align: center;
	font-size:40px;
}

.content_second {
	float:left;
	/* border: 1px solid; */
	width: 900px;
	height: 450px;
	margin-top: 10px;
	margin-left: 300px;
}

.content_second_circle {
	float:left;
	width:200px;
	height:200px;
	margin-left:350px;
	margin-top:30px;
	border-radius: 50%;
	border: 1px solid;
}

.content_second_secession {
	text-align: center;
	margin-top: 40px;
	margin-left: 35px;
}

.content_second_t1 {
	float:left;
	margin-left:280px;
	margin-top:90px;
	font-size:30px;
}

.content_third_title {
	float: left;
	border-top: 1px solid #e5e5e5;
	border-bottom: 1px solid #e5e5e5;
	width: 1200px;
	height: 250px;
	margin: 60px 0 0 150px;
	text-align:center;
	background-color: #f9f2fb;
}

.content_third_title_t1 {
	text-align:center;
	margin-top:50px;
	font-size:21px;
}

.content_third_title_t2 {
	text-align:center;
	margin-top:20px;
	font-size:21px;
}


.btn1 {
  width: 100px;
  height: 50px;
  margin-top: 30px;
  border-radius: 17px;
  border:none;
  background-color: #C580DA;
}
</style>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>모두의 빌라</title>

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
			                        <a href="introduce.html">
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
		<a href="Reservation_Confirm.html">
			<div class="box_menu_one">
				<div class="box_menu_one_t1">예약확인</div>
			</div>
		</a>
		<a href="Confirm_Registration.html">
			<div class="box_menu_two">
				<div class="box_menu_two_t1">등록확인</div>
			</div>
		</a>
		<a href="Information_Modified.html">
			<div class="box_menu_three">
				<div class="box_menu_three_t1">개인정보수정</div>
			</div>
		</a>
		<a href="terms.html">
			<div class="box_menu_four">
				<div class="box_menu_four_t1">회원탈퇴</div>
			</div>
		</a>
	</div>

  <!-- content -->
	<div class="content">
		<div class="content_first_title">
			<div class="content_first_title_t1">회원 탈퇴</div>
		</div>
		<div class="content_second">
			<div class="content_second_circle">
				<div class="content_second_secession"><img src="images/secession.png" width="130" height="130"></div>
			</div>
			<div class="content_second_t1">회원탈퇴가 완료되었습니다.</div>
		</div>
		<div class="content_third_title">
			<div class="content_third_title_t1">그동안 저희 서비스를 이용해 주셔서 감사합니다.</div>
			<div class="content_third_title_t2">보다 나은 서비스로 다시 찾아 뵙겠습니다.</div>
			<a href="/"><input type = "button" class="btn1" value = "메인으로"></a>
		</div>
	
	</div>
</body>
</html>