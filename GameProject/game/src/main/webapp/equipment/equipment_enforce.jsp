<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>⚔ 강화 도전 ⚔</title>
<style>
    body {
        font-family: 'Pretendard', sans-serif;
        text-align: center;
        margin-top: 100px;
        background-color: #f5f5f5;
    }
    h1 {
        color: #333;
    }
    form {
        margin-top: 40px;
    }
    button {
        width: 100px;
        height: 100px;
        font-size: 24px;
        margin: 20px;
        border-radius: 50%;
        border: none;
        cursor: pointer;
        transition: 0.3s;
    }
    .btn1 { background-color: #4caf50; color: white; }
    .btn2 { background-color: #2196f3; color: white; }
    button:hover { transform: scale(1.1); }
</style>
</head>
<body>
    <h1>⚔ 강화 도전 ⚔</h1>
    <p>1 또는 2 버튼 중 하나를 선택하세요!</p>

    <form action="${pageContext.request.contextPath}/enforce.do" method="post">
        <input type="hidden" name="name" value="${swordName}" />
        <input type="hidden" name="type" value="${type}" />
        <button class="btn1" type="submit" name="choice" value="1">1</button>
        <button class="btn2" type="submit" name="choice" value="2">2</button>
    </form>
</body>
</html>
