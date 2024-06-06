<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- 필요한 메타 태그, 스타일시트, 스크립트 등을 추가하세요. -->
</head>
<body>
<%
    // 세션에서 사용자 정보 삭제
    session.invalidate();
%>
<script>
    alert("로그아웃되었습니다.");
    location.href = "main.jsp"; // 로그아웃 후 이동할 페이지
</script>
</body>
</html>
