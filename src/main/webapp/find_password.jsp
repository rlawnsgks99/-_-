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
    width: 1400px;
    height: 150px;
    margin: 50px 0 0 225px;
  }
  
  .box_menu .box_menu_one,
  .box_menu .box_menu_two,
  .box_menu .box_menu_four {
    float: left;
    width: 238px;
    height: 100px;
    margin: 20px 0 0 20px;
    background-color: #f4f3ed;
  }
  
  .box_menu .box_menu_three {
    float: left;
    width: 238px;
    height: 100px;
    margin: 20px 0 0 10px;
    background-color: #C580DA;
  }
  
  .box_menu .box_menu_one_t1, 
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
    font-size: 20px;
    margin-top: 37px;
    font-weight: 500;
      font-weight: bold;
    color: #ffffff;
  }
  
  .content {
    height: 1000px;
  }
  
  .content .content_first {
    float: left;
    /* border: 1px solid; */
    width: 500px;
    height: 100px;
    margin: 60px 0 0 500px;
  }
  
  .content .content_first .content_first_title_t1 {
    text-align: center;
    font-size: 40px;
      font-weight: bold;
  }
  
  .content .content_first .content_first_title_t2 {
    text-align: center;
    font-size: 18px;
    margin: 20px;
  }
  
  .content .content_second {
    float: left;
    /* border: 1px solid; */
    width: 700px;
    height: 50px;
    margin-left: 160px;
    margin-top: 80px;
  }
  
  .content .content_second  .content_second_img {
    float: left;
    margin-left: 20px;
    margin-top: 8px;
  }
  
  .content .content_second .content_second_title_t1 {
    float: left;
    margin-left: 10px;
    font-size: 24px;
  }
  
  .content_third {
    float: left;
    width: 1088px;
    height: 200px;
    margin-left: 210px;
    border-radius: 37px;
    border: solid 1px #707070;
    background-color: #FEF9FF;
    margin-top: 50px;
  }
  
  .content_third .content_third_t1 {
    float: left;
    /* border: 1px solid; */
    margin-top: 35px;
    margin-left: 70px;
    /* color: #fca969; */
    font-size: 22px;
    width: 800px;
  }
  
  .content_third .content_third_t2 {
    float: left;
    /* border: 1px solid; */
    margin-top: 15px;
    margin-left: 70px;
    /* width: 800px; */
    font-size: 22px;
  }
  
  .content_fourth {
    float: left;
    width: 700px;
    height: 155.5px;
    margin-left: 390px;
    margin-top: 50px;
    border: solid 1px #707070;
    background-color: #ffffff;
    margin-bottom: 30px;
  }
  
  .content_fourth .content_fourth_one, 
  .content_fourth .content_fourth_three, 
  .content_fourth .content_fourth_five {
    float: left;
    width: 150px;
    height: 50px;
    border: solid 1px;
    background-color: #FEF9FF;
    text-align: center;
  }
  
  .content_fourth .content_fourth_one .content_fourth_one_t1 {
    margin-top: 13px;
  }
  
  .content_fourth .content_fourth_two .content_fourth_two_t1 {
    margin-top: 11px;
    margin-left: 20px;
  }
  
  .content_fourth .content_fourth_three .content_fourth_three_t1,
  .content_fourth .content_fourth_five .content_fourth_five_t1 {
    margin-top: 13px;
  }

  .content_fourth .content_fourth_two, 
  .content_fourth .content_fourth_four,
  .content_fourth .content_fourth_six {
    float: left;
    width: 546px;
    height: 50px;
    border: solid 1px;
  }  
  
  input[type="password"] {
    float: left;
    margin-top: 11px;
    margin-left: 20px;
    border: 1px solid;
    width: 300px;
    height: 25px;
    background-color: #f9f9f9;
  }
  
  .btn {
    float: left;
    width: 425px;
    height: 60px;
    margin-top: 30px;
    margin-left: 520px;
    border: none;
    color: #ffffff;
    font-size: 25px;
    object-fit: contain;
    background-color: #C580DA;
  }
  
  .box5 {
    float: left;
  }
  
  .box0 {
    float: left;
    background-color: #636363;
    width: 100%;
    height: 280px;
    margin-top:150px;
  }
  
  .a00 {
    float: left;
    /* border: 1px solid; */
    width: 150px;
    height: 120px;
    text-align: center;
    margin-top: 30px;
    margin-left: 200px;
  }
  
  .a00logo {
    margin-top: 10px;
  }
  
  .a01 {
    float: left;
    /* border: 1px solid; */
    width: 150px;
    height: 120px;
    margin-top: 30px;
    margin-left: 120px;
  }
  
  .a02, .a03, .a04, .a05 {
    float: left;
    /* border: 1px solid; */
    width: 150px;
    height: 120px;
    margin-top: 30px;
    margin-left: 40px;
  }
  
  .a01t1, .a02t1, .a03t1, .a04t1, .a05t1 {
    margin-top: 5px;
    color: #ffffff;
  }
  
  .a01t2, .a02t2, .a03t2, .a04t2, .a05t2 {
    margin-top: 7px;
    color: #ffffff;
  }
  
  .a00t1 {
    float: left;
    margin-top: 5px;
    color: #ffffff;
  }
  
  .at1 {
    float: left;
    margin-left: 550px;
    margin-top: 20px;
    color: #ffffff;
  }
  
  .at2 {
    float: left;
    margin-left: 545px;
    margin-top: 10px;
    color: #ffffff;
  }
  
  .hr0 {
    margin-top: 20px;
    float: left;
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
		<a href="login.html">
			<div class="box_menu_one">
				<div class="box_menu_one_t1">로그인</div>
			</div>
		</a>
		<a href="signup.html">
			<div class="box_menu_two">
				<div class="box_menu_two_t1">회원가입</div>
			</div>
		</a>
		<a href="find.html">
			<div class="box_menu_three">
				<div class="box_menu_three_t1">아이디 / 비밀번호 찾기</div>
			</div>
		</a>
	</div>

	<!-- content -->
	<div class="content">
    <div class="content_first">
      <div class="content_first_title_t1">아이디 / 비밀번호 찾기</div>
      <div class="content_first_title_t2">Find ID Password</div>
    </div>
    <div class="content_second">
      <div class="content_second_img"><img src="./images/rec.png" width="20" height="20"></div>
      <div class="content_second_title_t1">비밀번호 변경</div>
    </div>
    <div class="content_third">
      <div class="content_third_t1">
        <ul>
          <li>회원님의 개인정보를 안전하게 보호하고, 도용으로 인한 피해를 예방하기 위해 <br>비밀번호를 자주 <span style="color:red;">변경</span>하는것을 권장하고 있습니다.</li>
        </ul>
      </div>
      <div class="content_third_t2">
        <ul>
          <li>변경하신 후 로그인을 다시한번 해주세요.</li>
        </ul>
      </div>
    </div>
      <div class="content_fourth">
        <div class="content_fourth_one">
          <div class="content_fourth_one_t1">로그인 ID</div>
        </div>
        <div class="content_fourth_two">
          <div class="content_fourth_two_t1">ddddd</div>
        </div>
        <div class="content_fourth_three">
          <div class="content_fourth_three_t1">새 비밀번호</div>
        </div>
        <div class="content_fourth_four">
          <input type="password" name="user_pw1" style="font-size:16px;">
        </div>
        <div class="content_fourth_five">
          <div class="content_fourth_five_t1">새 비밀번호 확인</div>
        </div>
        <div class="content_fourth_six">
          <input type="password" name="user_pw2" style="font-size:16px;">
        </div>
      </div>
      <br>
      <input type="submit" class="btn" value="비밀번호 변경하기">
    <div class="box5"></div>
  </div>

</body>

</html>