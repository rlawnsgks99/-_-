<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>주소록 삭제</title>
</head>
<body>
    <%
    int id = Integer.parseInt(request.getParameter("id"));
    String confirmMessage = "정말로 삭제하시겠습니까?";

    // JavaScript로 삭제 확인 대화상자 표시
    out.println("<script>");
    out.println("var userConfirmed = confirm(\"" + confirmMessage + "\");");
    out.println("if (userConfirmed) {");
    
    // 데이터베이스 연결 정보
    String url = "jdbc:mysql://localhost:3306/odbo";
    String username = "root";
    String password = "qwer1234";
    
    // 데이터베이스 연결 및 삭제 실행
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);
        String query = "DELETE FROM address_table WHERE id=?";
        pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, id);
        
        pstmt.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
    
    // 삭제 완료 후 주소록 목록 페이지로 리다이렉트
    out.println("window.location.href = 'address_management.jsp'; // 삭제 완료 후 리다이렉트");
    out.println("} else {");
    out.println("  // 사용자가 취소를 클릭한 경우 이전 페이지로 이동");
    out.println("  window.history.back();");
    out.println("}");
    out.println("</script>");
    %>
</body>
</html>

