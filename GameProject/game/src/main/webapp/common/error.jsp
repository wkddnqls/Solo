<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>에러 발생</title>
<style>
    body {
        font-family: "Noto Sans KR", sans-serif;
        background: linear-gradient(135deg, #2c3e50, #8e44ad);
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        color: #fff;
    }
    .error-box {
        text-align: center;
        padding: 40px;
        border-radius: 20px;
        background: rgba(0, 0, 0, 0.5);
        box-shadow: 0 8px 20px rgba(0,0,0,0.6);
        max-width: 500px;
        width: 90%;
    }
    .error-box h1 {
        font-size: 60px;
        margin: 0;
        color: #e74c3c;
        text-shadow: 2px 2px 6px rgba(0,0,0,0.8);
    }
    .error-box h2 {
        margin: 15px 0;
        font-size: 24px;
    }
    .error-box p {
        margin: 10px 0 20px;
        font-size: 16px;
        color: #f1f1f1;
    }
    .error-box a {
        display: inline-block;
        margin-top: 15px;
        padding: 12px 25px;
        background: #1abc9c;
        color: #fff;
        text-decoration: none;
        font-weight: bold;
        border-radius: 8px;
        transition: all 0.3s ease;
    }
    .error-box a:hover {
        background: #16a085;
        transform: scale(1.05);
        box-shadow: 0 4px 12px rgba(0,0,0,0.5);
    }
</style>
</head>
<body>
    <div class="error-box">
        <h1>⚠  ERROR</h1>
        <h2>문제가 발생했습니다!</h2>
        <p>죄송합니다. 요청하신 작업을 처리하는 중 오류가 발생했습니다.<br>
           잠시 후 다시 시도해주세요.</p>
        <a href="<%=request.getContextPath()%>/index.jsp">홈으로 돌아가기</a>
    </div>
</body>
</html>
