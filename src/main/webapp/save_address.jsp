<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.file.*, javax.imageio.*" %>

<%
String url = "jdbc:mysql://localhost:3306/odbo";
String username = "root";
String password = "qwer1234";

String address = request.getParameter("address");
String nickname = request.getParameter("nickname");
int capacity = Integer.parseInt(request.getParameter("capacity"));
String time = request.getParameter("time");
int price_per_30min = Integer.parseInt(request.getParameter("price_per_30min")); // 30분당 가격 (원)
String notes = request.getParameter("notes");
String location = request.getParameter("location");
String height_limit = request.getParameter("height_limit");
String vehicle_type = request.getParameter("vehicle_type");
String seller_id = request.getParameter("seller_id");
String start_time = request.getParameter("start_time");
String end_time = request.getParameter("end_time");

double longitude = Double.parseDouble(request.getParameter("longitude"));
double latitude = Double.parseDouble(request.getParameter("latitude"));


Connection conn = null;
PreparedStatement pstmt = null;
try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, username, password);
    String query = "INSERT INTO address_table (address, nickname, capacity, time, price_per_30min, notes, location, height_limit, vehicle_type, longitude, latitude, seller_id, start_time, end_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    pstmt = conn.prepareStatement(query);
    pstmt.setString(1, address);
    pstmt.setString(2, nickname);
    pstmt.setInt(3, capacity);
    pstmt.setString(4, time);
    pstmt.setInt(5, price_per_30min);
    pstmt.setString(6, notes);
    pstmt.setString(7, location);
    pstmt.setString(8, height_limit);
    pstmt.setString(9, vehicle_type);
    pstmt.setDouble(10, longitude);
    pstmt.setDouble(11, latitude);
    pstmt.setString(12, seller_id);
    pstmt.setString(13, start_time);
    pstmt.setString(14, end_time);
    pstmt.executeUpdate();

    response.setStatus(HttpServletResponse.SC_OK);
} catch (Exception e) {
    e.printStackTrace();
    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
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
