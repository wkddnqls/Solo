<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>⚔ 전체 장비 목록 조회 ⚔</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #0f172a 100%);
            min-height: 100vh;
            color: #e2e8f0;
            position: relative;
            overflow-x: hidden;
        }

        /* Animated background pattern */
        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background-image: 
                radial-gradient(circle at 25px 25px, rgba(255, 255, 255, 0.05) 2%, transparent 0%),
                radial-gradient(circle at 75px 75px, rgba(255, 255, 255, 0.05) 2%, transparent 0%);
            background-size: 100px 100px;
            opacity: 0.3;
            z-index: 0;
        }

        .container {
            position: relative;
            z-index: 1;
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Header */
        header {
            background: rgba(15, 23, 42, 0.8);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(100, 116, 139, 0.3);
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
        }

        .header-content {
            padding: 24px 20px;
            text-align: center;
        }

        h1 {
            font-size: 2.5rem;
            background: linear-gradient(135deg, #fbbf24 0%, #f59e0b 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            display: inline-block;
            text-shadow: 0 0 30px rgba(251, 191, 36, 0.3);
            margin: 0;
        }

        /* Equipment Section */
        .equipment-section {
            margin: 48px 0;
            background: linear-gradient(135deg, rgba(239, 68, 68, 0.05) 0%, rgba(249, 115, 22, 0.05) 100%);
            border: 1px solid rgba(100, 116, 139, 0.3);
            border-radius: 16px;
            padding: 32px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(10px);
        }

        .equipment-section.shield {
            background: linear-gradient(135deg, rgba(59, 130, 246, 0.05) 0%, rgba(6, 182, 212, 0.05) 100%);
        }

        .equipment-section.armor {
            background: linear-gradient(135deg, rgba(168, 85, 247, 0.05) 0%, rgba(236, 72, 153, 0.05) 100%);
        }

        .section-header {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 24px;
            flex-wrap: wrap;
        }

        .section-icon {
            font-size: 1.8rem;
        }

        h2 {
            font-size: 1.8rem;
            color: #f1f5f9;
            margin: 0;
        }

        .item-count {
            margin-left: auto;
            background: rgba(100, 116, 139, 0.3);
            padding: 6px 16px;
            border-radius: 20px;
            font-size: 0.9rem;
            border: 1px solid rgba(148, 163, 184, 0.3);
        }

        /* Table */
        .table-wrapper {
            overflow-x: auto;
            border-radius: 12px;
            border: 1px solid rgba(100, 116, 139, 0.3);
            background: rgba(15, 23, 42, 0.5);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead {
            background: rgba(30, 41, 59, 0.8);
        }

        th {
            padding: 16px;
            text-align: left;
            font-weight: 600;
            color: #cbd5e1;
            border-bottom: 1px solid rgba(100, 116, 139, 0.3);
        }

        tbody tr {
            border-bottom: 1px solid rgba(100, 116, 139, 0.2);
            transition: background-color 0.3s ease;
        }

        tbody tr:hover {
            background: rgba(51, 65, 85, 0.5);
        }

        td {
            padding: 16px;
            color: #e2e8f0;
        }

        .empty-message {
            text-align: center;
            padding: 48px 16px;
            color: #94a3b8;
            font-style: italic;
        }

        /* Badges */
        .badge {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 6px;
            font-size: 0.85rem;
            font-weight: 500;
            border: 1px solid;
        }

        .badge-initial {
            background: rgba(100, 116, 139, 0.2);
            color: #cbd5e1;
            border-color: rgba(148, 163, 184, 0.3);
        }

        .badge-enhancement {
            font-weight: 600;
        }

        .enhancement-low {
            background: rgba(100, 116, 139, 0.2);
            color: #cbd5e1;
            border-color: rgba(148, 163, 184, 0.3);
        }

        .enhancement-medium {
            background: rgba(34, 197, 94, 0.2);
            color: #86efac;
            border-color: rgba(34, 197, 94, 0.3);
        }

        .enhancement-high {
            background: rgba(59, 130, 246, 0.2);
            color: #93c5fd;
            border-color: rgba(59, 130, 246, 0.3);
        }

        .enhancement-legendary {
            background: rgba(168, 85, 247, 0.2);
            color: #d8b4fe;
            border-color: rgba(168, 85, 247, 0.3);
        }

        /* Pagination */
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 8px;
            margin-top: 24px;
            flex-wrap: wrap;
        }

        .pagination button,
        .pagination a {
            padding: 8px 16px;
            border: 1px solid rgba(100, 116, 139, 0.5);
            background: rgba(30, 41, 59, 0.5);
            color: #cbd5e1;
            border-radius: 8px;
            cursor: pointer;
            font-size: 0.9rem;
            transition: all 0.3s ease;
            font-family: inherit;
            text-decoration: none;
            display: inline-block;
        }

        .pagination button:hover:not(:disabled),
        .pagination a:hover {
            background: rgba(51, 65, 85, 0.8);
            color: #fff;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
        }

        .pagination button:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        .pagination button.active,
        .pagination a.active {
            background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
            color: #fff;
            border-color: #f59e0b;
            font-weight: 600;
        }

        /* Footer */
        footer {
            text-align: center;
            padding: 48px 20px;
            margin-top: 48px;
            margin-bottom: 48px;
        }

        .home-button {
            display: inline-block;
            padding: 16px 48px;
            background: linear-gradient(135deg, #f59e0b 0%, #ea580c 100%);
            color: #fff;
            text-decoration: none;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 600;
            box-shadow: 0 10px 30px rgba(245, 158, 11, 0.3);
            transition: all 0.3s ease;
        }

        .home-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 40px rgba(245, 158, 11, 0.5);
        }

        /* Alert Dialog */
        .alert-overlay {
            position: fixed;
            inset: 0;
            background: rgba(0, 0, 0, 0.7);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1000;
            animation: fadeIn 0.3s ease;
        }

        .alert-dialog {
            background: linear-gradient(135deg, #1e293b 0%, #334155 100%);
            border: 1px solid rgba(148, 163, 184, 0.3);
            border-radius: 16px;
            padding: 32px;
            max-width: 400px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.8);
            animation: slideUp 0.3s ease;
        }

        .alert-message {
            color: #f1f5f9;
            font-size: 1.1rem;
            margin-bottom: 24px;
            text-align: center;
        }

        .alert-button {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .alert-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(245, 158, 11, 0.4);
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideUp {
            from { 
                opacity: 0;
                transform: translateY(20px);
            }
            to { 
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive */
        @media (max-width: 768px) {
            h1 {
                font-size: 1.8rem;
            }

            h2 {
                font-size: 1.4rem;
            }

            .equipment-section {
                padding: 20px;
            }

            th, td {
                padding: 12px 8px;
                font-size: 0.9rem;
            }

            .pagination button,
            .pagination a {
                padding: 6px 12px;
                font-size: 0.85rem;
            }

            .home-button {
                padding: 12px 32px;
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <%
        String alertMsg = (String) session.getAttribute("alertMsg");
        if (alertMsg != null) {
            session.removeAttribute("alertMsg");
    %>
        <div class="alert-overlay" id="alertOverlay" onclick="closeAlert()">
            <div class="alert-dialog" onclick="event.stopPropagation()">
                <div class="alert-message"><%= alertMsg %></div>
                <button class="alert-button" onclick="closeAlert()">확인</button>
            </div>
        </div>
        <script>
            function closeAlert() {
                document.getElementById('alertOverlay').style.display = 'none';
            }
        </script>
    <%
        }
    %>

    <header>
        <div class="header-content">
            <h1>⚔ 전체 장비 목록 조회 ⚔</h1>
        </div>
    </header>

    <main class="container">
        <!-- Sword Section -->
        <section class="equipment-section sword">
            <div class="section-header">
                <span class="section-icon">🗡</span>
                <h2>Sword 목록</h2>
            </div>
            <div class="table-wrapper">
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
                                <tr>
                                    <td colspan="5" class="empty-message">등록된 Sword가 없습니다.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="s" items="${swordList}">
                                    <tr>
                                        <td>${s.swordName}</td>
                                        <td><span class="badge badge-initial">${s.swordInitial}</span></td>
                                        <td>
                                            <span class="badge badge-enhancement 
                                                <c:choose>
                                                    <c:when test="${s.swordNum >= 7}">enhancement-legendary</c:when>
                                                    <c:when test="${s.swordNum >= 5}">enhancement-high</c:when>
                                                    <c:when test="${s.swordNum >= 2}">enhancement-medium</c:when>
                                                    <c:otherwise>enhancement-low</c:otherwise>
                                                </c:choose>">
                                                +${s.swordNum}
                                            </span>
                                        </td>
                                        <td>${s.swordDate}</td>
                                        <td><span class="badge">${s.swordUse}</span></td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
            
            <!-- Sword Pagination -->
            <c:if test="${not empty swordList and Swordpi.maxPage > 1}">
                <div class="pagination">
                    <c:if test="${Swordpi.currentPage > 1}">
                        <a href="${pageContext.request.contextPath}/equipList.ep?swordPage=${Swordpi.currentPage - 1}&shieldPage=${Shieldpi.currentPage}&armorPage=${Armorpi.currentPage}">
                            ← 이전
                        </a>
                    </c:if>
                    <c:if test="${Swordpi.currentPage == 1}">
                        <button disabled>← 이전</button>
                    </c:if>

                    <c:forEach var="i" begin="${Swordpi.startPage}" end="${Swordpi.endPage}">
                        <c:choose>
                            <c:when test="${i == Swordpi.currentPage}">
                                <button class="active" disabled>${i}</button>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/equipList.ep?swordPage=${i}&shieldPage=${Shieldpi.currentPage}&armorPage=${Armorpi.currentPage}">
                                    ${i}
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:if test="${Swordpi.currentPage < Swordpi.maxPage}">
                        <a href="${pageContext.request.contextPath}/equipList.ep?swordPage=${Swordpi.currentPage + 1}&shieldPage=${Shieldpi.currentPage}&armorPage=${Armorpi.currentPage}">
                            다음 →
                        </a>
                    </c:if>
                    <c:if test="${Swordpi.currentPage == Swordpi.maxPage}">
                        <button disabled>다음 →</button>
                    </c:if>
                </div>
            </c:if>
        </section>

        <!-- Shield Section -->
        <section class="equipment-section shield">
            <div class="section-header">
                <span class="section-icon">🛡</span>
                <h2>Shield 목록</h2>
            </div>
            <div class="table-wrapper">
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
                                <tr>
                                    <td colspan="5" class="empty-message">등록된 Shield가 없습니다.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="sh" items="${shieldList}">
                                    <tr>
                                        <td>${sh.shieldName}</td>
                                        <td><span class="badge badge-initial">${sh.shieldInitial}</span></td>
                                        <td>
                                            <span class="badge badge-enhancement 
                                                <c:choose>
                                                    <c:when test="${sh.shieldNum >= 7}">enhancement-legendary</c:when>
                                                    <c:when test="${sh.shieldNum >= 5}">enhancement-high</c:when>
                                                    <c:when test="${sh.shieldNum >= 2}">enhancement-medium</c:when>
                                                    <c:otherwise>enhancement-low</c:otherwise>
                                                </c:choose>">
                                                +${sh.shieldNum}
                                            </span>
                                        </td>
                                        <td>${sh.shieldDate}</td>
                                        <td><span class="badge">${sh.shieldUse}</span></td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>

            <!-- Shield Pagination -->
            <c:if test="${not empty shieldList and Shieldpi.maxPage > 1}">
                <div class="pagination">
                    <c:if test="${Shieldpi.currentPage > 1}">
                        <a href="${pageContext.request.contextPath}/equipList.ep?swordPage=${Swordpi.currentPage}&shieldPage=${Shieldpi.currentPage - 1}&armorPage=${Armorpi.currentPage}">
                            ← 이전
                        </a>
                    </c:if>
                    <c:if test="${Shieldpi.currentPage == 1}">
                        <button disabled>← 이전</button>
                    </c:if>

                    <c:forEach var="i" begin="${Shieldpi.startPage}" end="${Shieldpi.endPage}">
                        <c:choose>
                            <c:when test="${i == Shieldpi.currentPage}">
                                <button class="active" disabled>${i}</button>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/equipList.ep?swordPage=${Swordpi.currentPage}&shieldPage=${i}&armorPage=${Armorpi.currentPage}">
                                    ${i}
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:if test="${Shieldpi.currentPage < Shieldpi.maxPage}">
                        <a href="${pageContext.request.contextPath}/equipList.ep?swordPage=${Swordpi.currentPage}&shieldPage=${Shieldpi.currentPage + 1}&armorPage=${Armorpi.currentPage}">
                            다음 →
                        </a>
                    </c:if>
                    <c:if test="${Shieldpi.currentPage == Shieldpi.maxPage}">
                        <button disabled>다음 →</button>
                    </c:if>
                </div>
            </c:if>
        </section>

        <!-- Armor Section -->
        <section class="equipment-section armor">
            <div class="section-header">
                <span class="section-icon">🪖</span>
                <h2>Armor 목록</h2>
            </div>
            <div class="table-wrapper">
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
                            <c:when test="${empty armorList}">
                                <tr>
                                    <td colspan="5" class="empty-message">등록된 Armor가 없습니다.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="a" items="${armorList}">
                                    <tr>
                                        <td>${a.armorName}</td>
                                        <td><span class="badge badge-initial">${a.armorInitial}</span></td>
                                        <td>
                                            <span class="badge badge-enhancement 
                                                <c:choose>
                                                    <c:when test="${a.armorNum >= 7}">enhancement-legendary</c:when>
                                                    <c:when test="${a.armorNum >= 5}">enhancement-high</c:when>
                                                    <c:when test="${a.armorNum >= 2}">enhancement-medium</c:when>
                                                    <c:otherwise>enhancement-low</c:otherwise>
                                                </c:choose>">
                                                +${a.armorNum}
                                            </span>
                                        </td>
                                        <td>${a.armorDate}</td>
                                        <td><span class="badge">${a.armorUse}</span></td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>

            <!-- Armor Pagination -->
            <c:if test="${not empty armorList and Armorpi.maxPage > 1}">
                <div class="pagination">
                    <c:if test="${Armorpi.currentPage > 1}">
                        <a href="${pageContext.request.contextPath}/equipList.ep?swordPage=${Swordpi.currentPage}&shieldPage=${Shieldpi.currentPage}&armorPage=${Armorpi.currentPage - 1}">
                            ← 이전
                        </a>
                    </c:if>
                    <c:if test="${Armorpi.currentPage == 1}">
                        <button disabled>← 이전</button>
                    </c:if>

                    <c:forEach var="i" begin="${Armorpi.startPage}" end="${Armorpi.endPage}">
                        <c:choose>
                            <c:when test="${i == Armorpi.currentPage}">
                                <button class="active" disabled>${i}</button>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/equipList.ep?swordPage=${Swordpi.currentPage}&shieldPage=${Shieldpi.currentPage}&armorPage=${i}">
                                    ${i}
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:if test="${Armorpi.currentPage < Armorpi.maxPage}">
                        <a href="${pageContext.request.contextPath}/equipList.ep?swordPage=${Swordpi.currentPage}&shieldPage=${Shieldpi.currentPage}&armorPage=${Armorpi.currentPage + 1}">
                            다음 →
                        </a>
                    </c:if>
                    <c:if test="${Armorpi.currentPage == Armorpi.maxPage}">
                        <button disabled>다음 →</button>
                    </c:if>
                </div>
            </c:if>
        </section>
    </main>

    <footer>
        <a href="http://localhost:8001/game/index.jsp" class="home-button">메인으로 돌아가기</a>
    </footer>
</body>
</html>