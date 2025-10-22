<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강화 결과</title>
<style>
    body { text-align: center; margin-top: 100px; font-family: 'Pretendard', sans-serif; }
    .success { color: green; font-weight: bold; font-size: 1.5em; }
    .fail { color: red; font-weight: bold; font-size: 1.5em; }
    a {
        display: inline-block;
        margin-top: 30px;
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        border-radius: 10px;
        text-decoration: none;
    }
    a:hover { background-color: #0056b3; }
</style>
</head>
<body>
    <h1>⚔ 강화 결과 ⚔</h1>
    <p>장비: <strong>${swordName}</strong></p>

    <c:choose>
        <c:when test="${success}">
            <p class="success">강화 성공! +1 ✨</p>
        </c:when>
        <c:otherwise>
            <p class="fail">강화 실패 😢</p>
        </c:otherwise>
    </c:choose>

    <a href="${pageContext.request.contextPath}/equipenforce.ep">돌아가기</a>
</body>
</html>


