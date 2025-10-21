<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>장비 삭제</title>
</head>

<style>
body {
	font-family: "Noto Sans KR", sans-serif;
	background-color: #2c3e50;
	color: #fff;
	margin: 0;
	padding: 0;
	text-align: center;
}

h1 {
	padding: 30px 0;
	font-size: 28px;
	background: rgba(0, 0, 0, 0.3);
}

form {
	max-width: 400px;
	margin: 50px auto;
	background: rgba(255, 255, 255, 0.05);
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4);
}

form p {
	margin: 20px 0;
}

form label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

form input, form select {
	width: 100%;
	padding: 10px;
	border-radius: 8px;
	border: none;
	font-size: 16px;
}

form button {
	margin-top: 20px;
	padding: 12px 25px;
	font-size: 18px;
	background-color: #e74c3c;
	color: #fff;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	transition: 0.3s;
}

form button:hover {
	background-color: #c0392b;
	transform: scale(1.05);
}

a.cancel-button {
	display: inline-block;
	margin-top: 15px;
	padding: 12px 25px;
	background-color: #1abc9c;
	color: #fff;
	border-radius: 8px;
	text-decoration: none;
	transition: 0.3s;
}

a.cancel-button:hover {
	background-color: #16a085;
	transform: scale(1.05);
}
</style>

<body>
	<h1>장비 삭제</h1>

	<form action="${pageContext.request.contextPath}/equipDelete.ep" method="get">
		<p>
			<label for="equipName">삭제할 장비 이름</label>
			<input type="text" name="equipName" id="equipName" placeholder="예: 불꽃검" required>
		</p>

		<p>
			<label for="equipType">장비 종류</label>
			<select name="equipType" id="equipType" required>
				<option value="">선택</option>
				<option value="sword">소드</option>
				<option value="shield">쉴드</option>
				<option value="armor">아머</option>
			</select>
		</p>

		<button type="submit">장비 삭제</button>
		<br>
		<a href="${pageContext.request.contextPath}" class="cancel-button">취소</a>
	</form>
</body>
</html>