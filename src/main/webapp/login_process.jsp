<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <!-- 필요한 메타 태그, 스타일시트, 스크립트 등을 추가하세요. -->
</head>
<body>
<%
    // 데이터베이스 연결 정보
    String url = "jdbc:mysql://localhost:3306/odbo";
    String username = "root";
    String password = "qwer1234";

    // 사용자가 입력한 아이디와 비밀번호 가져오기
    String user_id = request.getParameter("user_id");
    String user_pw = request.getParameter("user_pw");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        // JDBC 드라이버 로드
        Class.forName("com.mysql.jdbc.Driver");

        // 데이터베이스 연결
        conn = DriverManager.getConnection(url, username, password);

        // SQL 쿼리 작성 (실제로는 PreparedStatement를 사용하여 안전하게 해야 합니다.)
        String sql = "SELECT * FROM members WHERE user_id = ? AND user_pw = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, user_id);
        pstmt.setString(2, user_pw);

        // 쿼리 실행
        rs = pstmt.executeQuery();

        if (rs.next()) {
            // 로그인 성공
            // 세션에 사용자 정보 저장 또는 다른 작업 수행
            session.setAttribute("user_id", user_id);
            response.sendRedirect("main.jsp"); // 로그인 성공 시 이동할 페이지
        } else {
            // 로그인 실패
            out.println("<script>alert('아이디나 비밀번호가 틀렸습니다.'); location.href='login.jsp';</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 리소스 해제
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
</body>
</html>

