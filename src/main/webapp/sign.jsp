<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
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
  <link rel="stylesheet" href="./sign.css" />
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
		<a href="login.jsp">
			<div class="box_menu_one">
				<div class="box_menu_one_t1">로그인</div>
			</div>
		</a>
		<a href="sign.jsp">
			<div class="box_menu_two">
				<div class="box_menu_two_t1">회원가입</div>
			</div>
		</a>
		<a href="find.jsp">
			<div class="box_menu_three">
				<div class="box_menu_three_t1">아이디 / 비밀번호 찾기</div>
			</div>
		</a>
	</div>

	<!-- content -->
    <div class="content">
        <form id="signupForm" method="post" action="save_sign.jsp" onsubmit="return checkPassword();">
            <div class="content_first">
                <div class="content_first_title_t1">회원가입</div>
                <div class="content_first_title_t2">Join membership</div>
            </div>
            <div class="content_second">
                <div class="content_second_id">아이디</div>
                <div class="content_second_idbox">
                    <input type="text" name="user_id" id="uid" placeholder="&nbsp;&nbsp;아이디를 입력해주세요." style="font-size:12pt; color:#908d8b;" onFocus="javascript:this.value=''" onkeydown="onlyAlphabet(this)" required>
                    <input type="submit" class="content_second_btn" value="중복검사" onclick="checkid();">
                </div>
                <div class="content_second_pw">비밀번호</div>
                <div class="content_second_pwbox">
                    <input type="password" placeholder="&nbsp;&nbsp;비밀번호 확인" name="user_pw" style="font-size:12pt; color:#908d8b; ime-mode:active;" onFocus="javascript:this.value=''" required>
                </div>
                <div class="content_second_repwbox">
                    <input type="password" placeholder="&nbsp;&nbsp;비밀번호 재확인" name="user_pw2" style="font-size:12pt; color:#908d8b;" onFocus="javascript:this.value=''">
                </div>
                <div class="content_second_name">이름</div>
                <div class="content_second_namebox">
                    <input type="text" name="user_name" value="&nbsp;&nbsp;이름을 입력해주세요." style="font-size:12pt; color:#908d8b; " onFocus="javascript:this.value=''" id="inputkorean" onkeyup="javascript:return onlyKorean('inputkorean');" required>
                </div>
                <div class="content_second_date">생년월일</div>
                <div class="content_second_datebox">
                    <input type="text" name="year" value="&nbsp;&nbsp;년(4글자)" style="font-size:12pt; color:#908d8b; " onFocus="javascript:this.value=''" required>
                </div>
                <select class="content_second_choice_month" name="month">
				<option value="월">월
				<option value="1">1
				<option value="2">2
				<option value="3">3
				<option value="4">4
				<option value="5">5
				<option value="6">6
				<option value="7">7
				<option value="8">8
				<option value="9">9
				<option value="10">10
				<option value="11">11
				<option value="12">12
			</select>
			<select class="content_second_choice_date" name="day">
				<option value="일">일
				<option value="1">1
				<option value="2">2
				<option value="3">3
				<option value="4">4
				<option value="5">5
				<option value="6">6
				<option value="7">7
				<option value="8">8
				<option value="9">9
				<option value="10">10
				<option value="11">11
				<option value="12">12
				<option value="13">13
				<option value="14">14
				<option value="15">15
				<option value="16">16
				<option value="17">17
				<option value="18">18
				<option value="19">19
				<option value="20">20
				<option value="21">21
				<option value="22">22
				<option value="23">23
				<option value="24">24
				<option value="25">25
				<option value="26">26
				<option value="27">27
				<option value="28">28
				<option value="29">29
				<option value="30">30
				<option value="31">31
			</select>
                <div class="content_second_sex">성별</div>
                <select class="content_second_choice_sex" name="user_sex">
                    <option value="성별">성별
                    <option value="남">남
                    <option value="여">여
                </select>
                <div class="content_second_email">이메일</div>
                <div class="content_second_emailbox">
                    <input type="text" name="user_email" value="&nbsp;&nbsp;이메일을 입력해주세요." style="font-size:12pt; color:#908d8b;" onFocus="javascript:this.value=''" id="email" required>
                </div>
                <div class="content_second_telephone">휴대전화</div>
                <div class="telephonebox">
                    <input type="text" name="user_tel" size="11" maxlength="11" placeholder="&nbsp;&nbsp;-를 제외한 번호를 적어주세요." style="font-size:12pt; color:#908d8b;" onFocus="javascript:this.value=''" required>
                </div>
                <div class="content_second_btnbox">
                    <a href="login.jsp"> 
                        <input type="button" class="content_second_btn1" value="취소">
                    </a>
                    <input type="submit" class="content_second_btn2" value="가입하기">
                </div>
            </div>
         </form></div>
<script>
function checkid() {
    var user_id = document.getElementById("uid").value;

    // AJAX를 사용하여 서버로 중복 검사 요청을 보냅니다.
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "check_duplicate_id.jsp", true); // 중복 검사를 수행하는 서버 스크립트로의 경로를 지정해야 합니다.
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // 서버로부터의 응답을 처리합니다.
            var response = xhr.responseText.trim();
            if (response === "duplicate") {
                // 아이디가 중복되는 경우
                alert("이미 사용 중인 아이디입니다.")
            } else if (response === "available") {
                // 아이디가 중복되지 않는 경우
               alert("사용 가능한 아이디입니다.")
            }
        }
    };
    xhr.send("user_id=" + user_id);
}
</script>

</body>
</html>