<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

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
  <link rel="stylesheet" href="./question.css" />
  

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
			<div class="content_first_title_t1">문의하기</div>
			<div class="content_first_title_t2">Frequently Asked Questions of VIla Parking Garage Websites.</div>
		</div>
    <div class="question">
      <div class="question_one">
        <div class="question_one_circle">Question</div>
        <img class="question_one_img" src="../images/arrow.png">
        <div class="question_one_t1">Q1. 아이디/비밀번호를 잊어버렸어요. 어떻게 찾을 수 있나요?</div>
        <div class="question_one_answer">
          <div class="question_one_answer_circle">answer</div>
          <div class="question_one_answer_t1">홈페이지에 접속 한 후 로그인 화면에서 아이디와 비밀번호 찾기를 확인 할 수 있습니다.</div>
        </div>
      </div>
      <div class="question_two">
        <div class="question_two_circle">Question</div>
        <img class="question_two_img" src="../images/arrow.png">
        <div class="question_two_t1">Q2. 건물주도 이용이 가능한가요?</div>
        <div class="question_two_answer">
          <div class="question_two_answer_circle">answer</div>
          <div class="question_two_answer_t1">홈페이지에 접속 한 후 로그인 화면에서 아이디와 비밀번호 찾기를 확인 할 수 있습니다.</div>
        </div>
      </div>
      <div class="question_three">
        <div class="question_three_circle">Question</div>
        <img class="question_three_img" src="../images/arrow.png">
        <div class="question_three_t1">Q3. 예약은 제가 했는데 다른사람이 주차를 해도 되나요?</div>
        <div class="question_three_answer">
          <div class="question_three_answer_circle">answer</div>
          <div class="question_three_answer_t1">홈페이지에 접속 한 후 로그인 화면에서 아이디와 비밀번호 찾기를 확인 할 수 있습니다.</div>
        </div>
      </div>
      <div class="question_four">
        <div class="question_four_circle">Question</div>
        <img class="question_four_img" src="../images/arrow.png">
        <div class="question_four_t1">Q4. 예약 취소를 하면 수수료가 있나요?</div>
        <div class="question_four_answer">
          <div class="question_four_answer_circle">answer</div>
          <div class="question_four_answer_t1">홈페이지에 접속 한 후 로그인 화면에서 아이디와 비밀번호 찾기를 확인 할 수 있습니다.</div>
        </div>
      </div>
      <div class="question_five">
        <div class="question_five_circle">Question</div>
        <img class="question_five_img" src="../images/arrow.png">
        <div class="question_five_t1">Q5. 정기권은 없나요?</div>
        <div class="question_five_answer">
          <div class="question_five_answer_circle">answer</div>
          <div class="question_five_answer_t1">홈페이지에 접속 한 후 로그인 화면에서 아이디와 비밀번호 찾기를 확인 할 수 있습니다.</div>
        </div>
      </div>
      <div class="question_six">
        <div class="question_six_circle">Question</div>
        <div class="question_six_t1">Q6. 위 질의응답에도 해결이 되지 않았을 경우 02.444.3232으로 연락주시기 바랍니다.</div>
      </div>
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