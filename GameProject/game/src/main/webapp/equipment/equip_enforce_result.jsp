<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강화 결과</title>
</head>
<body>
<h1>⚔ 강화 결과 ⚔</h1>

<p>장비: ${swordName}</p>

<c:choose>
    <c:when test="${success}">
        <p style="color:green; font-weight:bold;">강화 성공! +1</p>
    </c:when>
    <c:otherwise>
        <p style="color:red; font-weight:bold;">강화 실패 😢</p>
    </c:otherwise>
</c:choose>

<a href="${pageContext.request.contextPath}/equipList.ep">돌아가기</a>
</body>
</html>
