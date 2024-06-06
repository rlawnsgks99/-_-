<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String url = "jdbc:mysql://localhost:3306/odbo"; // MySQL 데이터베이스 URL
    String username = "root"; // MySQL 사용자 이름
    String password = "qwer1234"; // MySQL 비밀번호

    String user_id = request.getParameter("user_id");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);

        // SQL 쿼리를 작성하여 아이디 중복 여부를 확인합니다.
        String query = "SELECT COUNT(*) AS count FROM members WHERE user_id=?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, user_id);
        rs = pstmt.executeQuery();

        int count = 0;
        if (rs.next()) {
            count = rs.getInt("count");
        }

        if (count > 0) {
            // 아이디가 중복되는 경우
            out.print("duplicate");
        } else {
            // 아이디가 중복되지 않는 경우
            out.print("available");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        // 오류 발생 시 처리
        out.print("error");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        // 오류 발생 시 처리
        out.print("error");
    } finally {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
