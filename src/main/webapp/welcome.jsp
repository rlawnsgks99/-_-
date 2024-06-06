<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>운동 계획 입력</title>
</head>
<body>
	<h1>운동 계획 입력</h1>
	<form action="exercise_plan.jsp" method="post">
		<label for="exercise-date">운동 날짜:</label>
		<input type="date" name="exercise-date" id="exercise-date" required><br><br>
		
		<label for="exercise-type">운동 종목:</label>
		<input type="text" name="exercise-type" id="exercise-type" required><br><br>
		
		<label for="exercise-time">운동 시간:</label>
		<input type="number" name="exercise-time" id="exercise-time" required> 분<br><br>
		
		<button type="submit">운동 계획 추가</button>
	</form>
</body>
</html>