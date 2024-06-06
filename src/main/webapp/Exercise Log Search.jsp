<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Exercise Log Search</title>
</head>
<body>
	<h1>Exercise Log Search</h1>
	
	<form action="exerciseLog.jsp" method="post">
		<label for="date">Date: </label>
		<input type="date" id="date" name="date" required><br><br>
		
		<input type="submit" value="Search">
	</form>
	
	<br>
	<a href="exerciseLog.jsp">View All Logs</a>
</body>
</html>