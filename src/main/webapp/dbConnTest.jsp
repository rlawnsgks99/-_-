<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 	String driverName="com.mysql.jdbc.Driver";
 	String url = "jdbc:mysql://localhost:3306/odbo";
 	String username = "root";
 	String password = "qwer1234";
 	Connection conn = null;
 	try{
 		Class.forName(driverName);
 		
 		conn = DriverManager.getConnection(url, username, password);
 		
 		out.println("성공" + conn);
 		} catch(ClassNotFoundException e){
 		  out.println("드라이버 문제");
 		} catch(SQLException e){
 		  out.println("SQL 문제");
 		} finally{
 		  try{
 		  if(conn != null)
 		     conn.close();
 		  }  catch(SQLException e){
 		     ;
 		  }
 		}
 %>
</body>
</html>