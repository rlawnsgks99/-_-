<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제 정보 저장</title>
</head>
<body>
<%
    String buyer_id = request.getParameter("user_id");
    String nickname = request.getParameter("nickname");
    String seller_id = request.getParameter("seller_id");
    String startTime = request.getParameter("startTime");
    int duration = Integer.parseInt(request.getParameter("duration"));
    int address_id = Integer.parseInt(request.getParameter("id"));
    String status = "결제완료";
    
    // 현재 시간을 가져옵니다.
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String paymentTime = sdf.format(new java.util.Date());

    // 여기에 데이터베이스 연결 및 결제 정보 저장 로직을 작성합니다.
    // JDBC 드라이버 로드, DB 연결, 결제 정보 저장 등을 수행합니다.

    // 예시: 데이터베이스에 결제 정보 저장
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/odbo";
        String username = "root";
        String password = "qwer1234";
        conn = DriverManager.getConnection(url, username, password);

        String sql = "INSERT INTO payment_status (buyer_id, nickname, seller_id, startTime, duration, status, payment_time, address_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, buyer_id);
        pstmt.setString(2, nickname);
        pstmt.setString(3, seller_id);
        pstmt.setString(4, startTime);
        pstmt.setInt(5, duration);
        pstmt.setString(6, status);
        pstmt.setString(7, paymentTime);
        pstmt.setInt(8, address_id);
        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
        	//성공 시
        	response.sendRedirect("main.jsp");
        } else {
        	//실패 시
            out.println("결제 정보 저장 실패.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("오류 발생: " + e.getMessage());
    } finally {
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
%>
</body>
</html>

