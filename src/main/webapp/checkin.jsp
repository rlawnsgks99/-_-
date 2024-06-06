<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Check-in 페이지</title>
</head>
<body>
    <h1>Check-in 페이지</h1>
    <%-- address 값을 받아옴 --%>
    <% String address = request.getParameter("address"); %>
    
    <%-- address 값을 출력 --%>
    <p>주소 : 인천광역시 부평구 부평동 546-133</p>
    <p>주차 가능 수 : 5 대</p>
    <p>주차 가능 시간 : 오전 10시 ~ 오후 4시</p>
    <p>세부 사항 : 지하 주차장입니다.</p>
    <p>키워드 #지하주차장 #5대 가능 #오전 오후</p>
    <p>가격 : 시간당 1600원</p>
</body>
</html>
