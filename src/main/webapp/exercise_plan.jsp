<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>운동 계획 추가 결과</title>
</head>
<body>
	<%
		String date = request.getParameter("exercise-date");
		String type = request.getParameter("exercise-type");
		int time = Integer.parseInt(request.getParameter("exercise-time"));

		out.println("<h1>운동 계획 추가 결과</h1>");
		out.println("<p>운동 날짜: " + date + "</p>");
		out.println("<p>운동 종목: " + type + "</p>");
		out.println("<p>운동 시간: " + time + " 분</p>");
	%>
</body>
</html>