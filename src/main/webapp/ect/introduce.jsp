<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>모두의 빌라</title>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
  <link rel="stylesheet" href="../main.css" />
  <link rel="stylesheet" href="./introduce.css" />
  

  <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

  <!-- GSAP & ScrollToPlugin -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.0/gsap.min.js" integrity="sha512-GQ5/eIhs41UXpG6fGo4xQBpwSEj9RrBvMuKyE2h/2vw3a9x85T1Bt0JglOUVJJLeyIUl/S/kCdDXlE/n7zCjIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.0/ScrollToPlugin.min.js" integrity="sha512-TxuhgzYZZCsKL8STS5wmzau5RF3EotX6lAOZPkOJwfy7q9fXMzhlEHfQI4iUuxVMgkbG5XUtzbjshNCKYL+VXw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

  <!-- SWIPER -->
  <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
  <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
  
  <!-- ScrollMagic -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js" integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

  <script defer src="../main.js"></script>
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
            <a href="../main.jsp" class="logo">
                <img src="../images/villa_Logo.png" alt="Everybody's villa" />
            </a>
				<div class="sub-menu">
    				<ul class="menu">
        				<li>
            				<%
            				if (session.getAttribute("user_id") == null) {
            				%>
                				<a href="../login.jsp">로그인</a>
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
                				<a href="../sign.jsp">회원가입</a>
            				<%
            				} else {
            				%>
                				<a href="../logout.jsp">로그아웃</a>
            				<%
            				}
            				%>
        				</li>
        				<li><a href="introduce.jsp">회사소개</a></li>
    				</ul>
				</div>

			<ul class="main-menu">
			    <li class="item">
			        <div class="item__name">고객센터</div>
			        <div class="item__contents">
			            <div class="contents__menu">
			                <ul class="inner">
			                    <li>
			                        <a href="introduce.jsp">
			                            <h4>이용소개</h4>
			                        </a>
			                    </li>
			                    <li>
			                        <a href="notice1.jsp">
			                            <h4>공지사항</h4>
			                        </a>
			                    </li>
			                    <li>
			                        <a href="question.jsp">
			                            <h4>문의하기</h4>
			                        </a>
			                    </li>
			                </ul>
			            </div>
			        </div>
			    </li>
			    <li class="item">
			        <div class="item__name">건물주페이지</div>
			        <div class="item__contents">
			            <div class="contents__menu">
			                <ul class="inner">
			                    <li>
			                        <a href="../map_input.jsp">
			                            <h4>주차장 등록</h4>
			                        </a>
			                    </li>
			                    <li>
			                        <a href="../address_management.jsp">
			                            <h4>주차장 예약 관리</h4>
			                        </a>
			                    </li>
			                </ul>
			            </div>
			        </div>
			    </li>
			    <li class="item">
			        <div class="item__name">예약하기</div>
			        <div class="item__contents">
			            <div class="contents__menu">
			                <ul class="inner">
			                    <li>
			                        <a href="../map_display.jsp">
			                            <h4>예약하기</h4>
			                        </a>
			                    </li>
			                </ul>
			            </div>
			        </div>
			    </li>
			    <li class="item">
			        <div class="item__name">마이페이지</div>
			        <div class="item__contents">
			            <div class="contents__menu">
			                <ul class="inner">
			                    <li>
			                        <a href="../Reservation_Confirm.jsp">
			                            <h4>예약확인</h4>
			                        </a>
			                    </li>
			                    <li>
			                        <a href="../Confirm_Registration.jsp">
			                            <h4>등록확인</h4>
			                        </a>
			                    </li>
			                    <li>
			                        <a href="../information_Modified.jsp">
			                            <h4>개인 정보 수정</h4>
			                        </a>
			                    </li>
			                    <li>
			                        <a href="../user_remove1.jsp">
			                            <h4>회원탈퇴</h4>
			                        </a>
			                    </li>
			                </ul>
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
			                        <a href="../login.jsp">
			                            <h4>로그인</h4>
			                        </a>
			                    </li>
			                    <li>
			                        <a href="../sign.jsp">
			                            <h4>회원가입</h4>
			                        </a>
			                    </li>
			                    <li>
			                        <a href="../find.jsp">
			                            <h4>아이디 / 비밀번호 찾기</h4>
			                        </a>
			                    </li>
			                </ul>
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
    <img src="../images/introduce.png" width="1509" height="360">
  </div>

  <!-- box_menu -->
	<div class="box_menu">
		<a href="introduce.jsp">
			<div class="box_menu_one">
				<div class="box_menu_one_t1">이용소개</div>
			</div>
		</a>
		<a href="notice1.jsp">
			<div class="box_menu_two">
				<div class="box_menu_two_t1">공지사항</div>
			</div>
		</a>
		<a href="question.jsp">
			<div class="box_menu_three">
				<div class="box_menu_three_t1">문의하기</div>
			</div>
		</a>
	</div>

  <!-- content -->
	<div class="content">
		<div class="content_first">
			<div class="content_first_title_t1">이용소개</div>
			<div class="content_first_title_t2">Information on the use of VIla Parking Garage Websites.</div>
			<div class="content_first_logo"><img src="../images/villa_Logo.png" width="180" height="100"></div>
			<div class="content_first_place">
				<div class="content_first_text">
					건물주가 주차공간을 내어주고 그 공간을 이용자들이 
					<br><br><br>공용주차장보다 좀 더 저렴하게 또는 적정 가격에 예약을
					<br><br><br>통해 주차를 할 수 있는 사이트.
				</div>
			</div>
		</div>
		<div class="content_second">
			<div class="content_second_title">
				<div class="content_second_title_t1">이용대상</div>
				<div class="content_second_title_t2">VIla Parking Garage target</div>
			</div>
			<div class="content_second_text3">주차가 가능한 <span style="color:red">성인</div>
		</div>
		<div class="content_third">
			<div class="content_third_title">
				<div class="content_third_title_t1">이용절차</div>
				<div class="content_third_title_t2">Healing Concealing Usage Procedure.</div>
			</div>
			<div class="content_third_one">
				<div class="content_third_one_img"><img src="../images/number1_img.png" width="70" height="70"></div>
				<div class="content_third_one_t1">사이트 접속</div>
				<div class="content_third_one_t2">홈페이지 접속을 하여<br> 회원가입을 합니다.</div>
			</div>
			<div class="content_third_two">
				<div class="content_third_two_img"><img src="../images/number2_img.png" width="70" height="70"></div>
				<div class="content_third_two_t1">자가진단 테스트</div>
				<div class="content_third_two_t2">심리검사 페이지를 눌러 나오는 <br>자가진단 테스트를 작성합니다.</div>
			</div>
			<div class="content_third_three">
				<div class="content_third_three_img"><img src="../images/number3_img.png" width="70" height="70"></div>
				<div class="content_third_three_t1">커뮤니티/예약 입장</div>
				<div class="content_third_three_t2">사이트 상단의 커뮤니티/예약을 <br>클릭합니다.</div>
			</div>
			<div class="content_third_four">
				<div class="content_third_four_img"><img src="../images/number4_img.png" width="70" height="70"></div>
				<div class="content_third_four_t1">예약</div>
				<div class="content_third_four_t2">사이트 상단의 커뮤니티/예약을 <br>클릭합니다.</div>
			</div>
			<div class="content_third_five">
				<div class="content_third_five_img"><img src="../images/number4_img.png" width="70" height="70"></div>
				<div class="content_third_five_t1">상담</div>
				<div class="content_third_five_t2">전문가와의 <br>방문 상담, 온라인 상담, 전화 상담</div>
			</div>
			<div class="content_third_six">
				<div class="content_third_six_img"><img src="../images/number5_img.png" width="70" height="70"></div>
				<div class="content_third_six_t1">주차</div>
				<div class="content_third_six_t2">자신이 주차하기로 한 장소와 시간을 <br> 맞춰서 주차합니다. </div>
			</div>
			<img class="content_third_number1" src="../images/number1.png" width="30" height="30">
			<img class="content_third_number2" src="../images/number2.png" width="30" height="30">
			<img class="content_third_number3" src="../images/number3.png" width="30" height="30">
			<img class="content_third_number4" src="../images/number4.png" width="30" height="30">
			<img class="content_third_number5" src="../images/number4.png" width="30" height="30">
			<img class="content_third_number6" src="../images/number5.png" width="30" height="30">
		</div>
		<div class="content_fourth">
			<div class="content_fourth_title">
				<div class="content_fourth_title_t1">이용시간</div>
				<div class="content_fourth_title_t2">VIla Parking Garage usage time</div>
			</div>
			<div class="content_fourth_t1">평일 09:00 ~ 18:00 ( 점심시간 12:00 ~ 13:00 )</div>
		</div>
	</div>
  
  <!-- footer -->
  <div class="footer">
    <footer>
      <div class="inner">
  
        <ul class="menu">
          <li><a href="javascript:void(0)" class="purple">개인정보처리방침</a></li>
          <li><a href="javascript:void(0)">홈페이지 이용약관</a></li>
          <li><a href="javascript:void(0)">위치정보 이용약관</a></li>
          <li><a href="javascript:void(0)">영상정보처리기기 운영관리 방침</a></li>
        </ul>
  
        <div class="btn-group">
          <a href="javascript:void(0)" class="btn btn--white">회사소개</a>
          <a href="javascript:void(0)" class="btn btn--white">예약하기</a>
          <a href="javascript:void(0)" class="btn btn--white">회원가입</a>
        </div>
  
        <div class="info">
          <span>사업자등록번호 224-14-28727</span>
          <span>(주)빌라의 주차장 대표이사 김준한</span>
          <span>TEL : 02 )525-2503 / FAX : 02 )3029-1029  </span>
        </div>
  
        <p class="copyright">
          &copy; <span class="this-year"></span> 2023 VIla Parking Garage Company.  All Rights Reserved. 
        </p>
      </div>
    </footer> 
  </div>
</body>

</html>