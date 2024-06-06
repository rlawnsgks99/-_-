<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>주소록 업데이트</title>
</head>
<body>
    <%
    // 폼에서 전달받은 데이터
    int id = Integer.parseInt(request.getParameter("id"));
    String nickname = request.getParameter("nickname");
    String address = request.getParameter("address");
    int capacity = Integer.parseInt(request.getParameter("capacity"));
    String time = request.getParameter("time");

    // 나머지 필드도 추가

    // 데이터베이스 연결 정보
    String url = "jdbc:mysql://localhost:3306/odbo";
    String username = "root";
    String password = "qwer1234";

    // 데이터베이스 연결 및 업데이트 실행
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);
        String query = "UPDATE address_table SET nickname=?, address=?, capacity=?, time=? WHERE id=?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, nickname);
        pstmt.setString(2, address);
        pstmt.setInt(3, capacity);
        pstmt.setString(4, time);
        pstmt.setInt(5, id);

        // 나머지 필드도 업데이트

        pstmt.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }

    // 업데이트 완료 후 주소록 목록 페이지로 리다이렉트
    response.sendRedirect("address_management.jsp");
    %>
</body>
</html>
