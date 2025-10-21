<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>전체 장비 목록 조회</title>
<style>
body {
    font-family: "Noto Sans KR", sans-serif;
    background: linear-gradient(135deg, #2c3e50, #34495e);
    color: #fff;
    margin: 0;
    padding: 0;
    text-align: center;
}

h1 {
    background: rgba(52, 152, 219, 0.8);
    padding: 30px;
    margin-bottom: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.3);
    text-shadow: 1px 1px 3px rgba(0,0,0,0.5);
}

h2 {
    margin-top: 40px;
    color: #e67e22;
    text-shadow: 1px 1px 2px rgba(0,0,0,0.5);
}

table {
    width: 85%;
    margin: 20px auto;
    border-collapse: separate;
    border-spacing: 0;
    background-color: rgba(44, 62, 80, 0.8);
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 6px 15px rgba(0,0,0,0.3);
}

th, td {
    padding: 12px 18px;
    border-bottom: 1px solid rgba(255,255,255,0.15);
}

th {
    background-color: rgba(41, 128, 185, 0.9);
    text-transform: uppercase;
    letter-spacing: 0.05em;
}

tr:hover {
    background-color: rgba(236, 240, 241, 0.1);
}

a.home-button {
    display: inline-block;
    margin: 40px 0;
    padding: 12px 25px;
    background-color: #e67e22;
    color: #fff;
    border-radius: 8px;
    text-decoration: none;
    transition: all 0.3s ease;
    box-shadow: 0 4px 8px rgba(0,0,0,0.3);
}

a.home-button:hover {
    background-color: #d35400;
    transform: scale(1.05);
}

.pagination {
    display: flex;
    justify-content: center;
    gap: 8px;
    margin: 20px 0;
    flex-wrap: wrap;
}

.pagination button {
    padding: 8px 14px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-weight: bold;
    transition: all 0.3s ease;
    box-shadow: 0 3px 6px rgba(0,0,0,0.2);
}

.pagination button.btn-primary {
    background-color: #e67e22;
    color: #fff;
}

.pagination button.btn-primary:hover {
    background-color: #d35400;
    transform: translateY(-2px);
    box-shadow: 0 6px 12px rgba(0,0,0,0.3);
}

.pagination button.btn-outline-primary {
    background-color: transparent;
    color: #e67e22;
    border: 2px solid #e67e22;
}

.pagination button.btn-outline-primary:hover {
    background-color: #e67e22;
    color: #fff;
    transform: translateY(-2px);
    box-shadow: 0 6px 12px rgba(0,0,0,0.3);
}

.pagination button:disabled {
    background-color: rgba(255,255,255,0.1);
    color: #aaa;
    cursor: default;
    box-shadow: none;
}
</style>
</head>
<body>
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

  <h1>⚔ 강화 장비 목록 조회 ⚔</h1>

<!-- Sword -->
<h2>🗡 Sword 목록</h2>
<table>
    <thead>
        <tr> 
            <th>이름</th>
            <th>이니셜</th>
            <th>강화 수치</th>
            <th>등록일</th>
            <th>사용처</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${empty swordList}">
                <tr><td colspan="6">등록된 Sword가 없습니다.</td></tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="s" items="${swordList}">
                    <tr>
                        <!-- 이름 클릭 시 /enforce.ep로 이동 -->
                        <td>
                            <a href="${pageContext.request.contextPath}/enforce.ep?swordName=${s.swordName}&currentNum=${s.swordNum}&swordUse=${s.swordUse}" style="color:#1abc9c; text-decoration:none;">
                                ${s.swordName}
                            </a>
                        </td>
                        <td>${s.swordInitial}</td>
                        <td>${s.swordNum}</td>
                        <td>${s.swordDate}</td>
                        <td>${s.swordUse}</td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </tbody>
</table>

    <div class="pagination">
    <c:if test="${Swordpi.currentPage > 1}">
        <button class="btn btn-primary"
                onclick="location.href='${pageContext.request.contextPath}/equipenforce.ep?swordPage=${Swordpi.currentPage - 1}'">
            &lt; 이전
        </button>
    </c:if>

    <c:forEach var="i" begin="${Swordpi.startPage}" end="${Swordpi.endPage}">
        <c:choose>
            <c:when test="${i == Swordpi.currentPage}">
                <button class="btn btn-outline-primary" disabled>${i}</button>
            </c:when>
            <c:otherwise>
                <button class="btn btn-outline-primary"
                        onclick="location.href='${pageContext.request.contextPath}/equipenforce.ep?swordPage=${i}'">
                    ${i}
                </button>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${Swordpi.currentPage < Swordpi.maxPage}">
        <button class="btn btn-primary"
                onclick="location.href='${pageContext.request.contextPath}/equipenforce.ep?swordPage=${Swordpi.currentPage + 1}'">
            다음 &gt;
        </button>
    </c:if>
</div>

    <!-- Shield -->
    <h2>🛡 Shield 목록</h2>
    <table>
        <thead>
            <tr>
               
                <th>이름</th>
                <th>이니셜</th>
                <th>강화 수치</th>
                <th>등록일</th>
                <th>사용처</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${empty shieldList}">
                    <tr><td colspan="6">등록된 Shield가 없습니다.</td></tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="sh" items="${shieldList}">
                        <tr>
                        <td>${sh.shieldName}</td>
                        <td>${sh.shieldInitial}</td>
                        <td>${sh.shieldNum}</td>
                        <td>${sh.shieldDate}</td>
                        <td>${sh.shieldUse}</td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
<div class="pagination">
    <c:if test="${Shieldpi.currentPage > 1}">
        <button class="btn btn-primary"
                onclick="location.href='${pageContext.request.contextPath}/equipenforce.ep?shieldPage=${Shieldpi.currentPage - 1}'">
            &lt; 이전
        </button>
    </c:if>

    <c:forEach var="i" begin="${Shieldpi.startPage}" end="${Shieldpi.endPage}">
        <c:choose>
            <c:when test="${i == Shieldpi.currentPage}">
                <button class="btn btn-outline-primary" disabled>${i}</button>
            </c:when>
            <c:otherwise>
                <button class="btn btn-outline-primary"
                        onclick="location.href='${pageContext.request.contextPath}/equipenforce.ep?shieldPage=${i}'">
                    ${i}
                </button>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${Shieldpi.currentPage < Shieldpi.maxPage}">
        <button class="btn btn-primary"
                onclick="location.href='${pageContext.request.contextPath}/equipenforce.ep?shieldPage=${Shieldpi.currentPage + 1}'">
            다음 &gt;
        </button>
    </c:if>
</div>

    <!-- Armor -->
    <h2>🪖 Armor 목록</h2>
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>이름</th>
                <th>이니셜</th>
                <th>강화 수치</th>
                <th>등록일</th>
                <th>사용처</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${empty armorList}">
                    <tr><td colspan="6">등록된 Armor가 없습니다.</td></tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="a" items="${armorList}">
                        <tr>
                           <td>${a.armorName}</td>
                        <td>${a.armorInitial}</td>
                        <td>${a.armorNum}</td>
                        <td>${a.armorDate}</td>
                        <td>${a.armorUse}</td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
<div class="pagination">
    <c:if test="${Armorpi.currentPage > 1}">
        <button class="btn btn-primary"
                onclick="location.href='${pageContext.request.contextPath}/equipenforce.ep?armorPage=${Armorpi.currentPage - 1}'">
            &lt; 이전
        </button>
    </c:if>

    <c:forEach var="i" begin="${Armorpi.startPage}" end="${Armorpi.endPage}">
        <c:choose>
            <c:when test="${i == Armorpi.currentPage}">
                <button class="btn btn-outline-primary" disabled>${i}</button>
            </c:when>
            <c:otherwise>
                <button class="btn btn-outline-primary"
                        onclick="location.href='${pageContext.request.contextPath}/equipenforce.ep?armorPage=${i}'">
                    ${i}
                </button>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${Armorpi.currentPage < Armorpi.maxPage}">
        <button class="btn btn-primary"
                onclick="location.href='${pageContext.request.contextPath}/equipenforce.ep?armorPage=${Armorpi.currentPage + 1}'">
            다음 &gt;
        </button>
    </c:if>
</div>

    <a href="http://localhost:8001/game/index.jsp" class="home-button">메인으로 돌아가기</a>
</body>
</html>
