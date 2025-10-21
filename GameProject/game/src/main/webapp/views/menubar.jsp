<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>강화 관리 프로그램</title>
</head>


<style>
    body {
        font-family: "Noto Sans KR", sans-serif;
        background: linear-gradient(120deg, #2c3e50, #3498db);
        margin: 0;
        padding: 0;
        color: #fff;
        text-align: center;
    }
    h1 {
        margin: 0;
        padding: 30px 0;
        font-size: 28px;
        background: rgba(0, 0, 0, 0.3);
        text-shadow: 2px 2px 4px rgba(0,0,0,0.6);
    }
    ul {
        list-style: none;
        padding: 0;
        margin: 40px auto;
        max-width: 400px;
    }
    ul li {
        margin: 15px 0;
    }
    ul li a {
        display: block;
        padding: 15px;
        border-radius: 10px;
        background: rgba(255, 255, 255, 0.1);
        color: #fff;
        text-decoration: none;
        font-size: 18px;
        font-weight: bold;
        transition: all 0.3s ease;
    }
    ul li a:hover {
        background: #1abc9c;
        transform: scale(1.05);
        box-shadow: 0 4px 10px rgba(0,0,0,0.4);
    }
</style>
<body>

    <h1>========= 강화 관리 프로그램 ==============</h1>
    
    <%
    String alertMsg = (String) session.getAttribute("alertMsg");
    if (alertMsg != null) {
   %>
    <script>
        alert('<%= alertMsg %>');
    </script>
   <%
        session.removeAttribute("alertMsg"); // 한 번 띄운 후 세션에서 제거
    }
   %>
 <ul>
    <li><a href="${pageContext.request.contextPath}/equipenforce.ep">1. 장비 강화하기</a></li>
   <li><a href="${pageContext.request.contextPath}/equipList.ep">2. 장비 전체 목록 조회</a></li>
    <li><a href="http://localhost:8001/game/equipment/equipment_insert.jsp">3. 강화할 장비 이름 저장</a></li>
    <li><a href="http://localhost:8001/game/equipment/equipment_delect.jsp">4. 강화목록 삭제하기</a></li>
    <li><a href="">5. 강화한 목록 키워드 검색</a></li>
    <li><a href="">6. 강화 목록 사용처 수정하기</a></li>
    <li><a href="">7. 유저 옵션 보기</a></li>
    <li><a href="">8. 몬스터 옵션 보기</a></li>
    <li><a href="">9. 몬스터 사냥하기</a></li>
    <li><a href="">10. 프로그램 종료</a></li>
</ul>
</body>
</html>