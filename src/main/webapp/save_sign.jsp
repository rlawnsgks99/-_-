<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String url = "jdbc:mysql://localhost:3306/odbo"; // MySQL 데이터베이스 URL
    String username = "root"; // MySQL 사용자 이름
    String password = "qwer1234"; // MySQL 비밀번호

    String user_id = request.getParameter("user_id");
    String user_pw = request.getParameter("user_pw");
    String user_pw2 = request.getParameter("user_pw2");
    String user_name = request.getParameter("user_name");
    String year = request.getParameter("year");
    String month = request.getParameter("month");
    String day = request.getParameter("day");
    String user_sex = request.getParameter("user_sex");
    String user_email = request.getParameter("user_email");
    String user_tel = request.getParameter("user_tel");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);

        // 생년월일을 합쳐서 하나의 문자열로 만듭니다.
        String birthdate = year + "-" + month + "-" + day;

        // SQL 쿼리를 작성합니다.
        String query = "INSERT INTO members (user_id, user_pw, user_name, birthdate, user_sex, user_email, user_tel) VALUES (?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, user_id);
        pstmt.setString(2, user_pw);
        pstmt.setString(3, user_name);
        pstmt.setString(4, birthdate);
        pstmt.setString(5, user_sex);
        pstmt.setString(6, user_email);
        pstmt.setString(7, user_tel);

        // 쿼리를 실행합니다.
        int affectedRows = pstmt.executeUpdate();

        if (affectedRows > 0) {
        	%>
        <script>
            alert("회원가입을 완료했습니다.");
            location.href = "login.jsp";
        </script>
        <%
        } else {
            // 회원가입 실패
            response.sendRedirect("signup_fail.jsp"); // 회원가입 실패 페이지로 리다이렉트
        }
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("signup_fail.jsp"); // 회원가입 실패 페이지로 리다이렉트
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        response.sendRedirect("signup_fail.jsp"); // 회원가입 실패 페이지로 리다이렉트
    } finally {
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