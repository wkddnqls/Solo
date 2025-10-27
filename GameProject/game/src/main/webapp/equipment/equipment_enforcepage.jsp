<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강화 장비 목록</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            min-height: 100vh;
            padding: 2rem 1rem;
            position: relative;
           overflow-x: hidden;
        }

        /* Animated background */
        .background-animation {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0;
            pointer-events: none;
        }

        .bg-particle {
            position: absolute;
            background: rgba(139, 92, 246, 0.05);
            border-radius: 50%;
            animation: float 20s infinite;
        }

        .bg-particle:nth-child(1) { width: 100px; height: 100px; left: 10%; animation-delay: 0s; }
        .bg-particle:nth-child(2) { width: 80px; height: 80px; left: 30%; animation-delay: 3s; }
        .bg-particle:nth-child(3) { width: 120px; height: 120px; left: 50%; animation-delay: 6s; }
        .bg-particle:nth-child(4) { width: 90px; height: 90px; left: 70%; animation-delay: 9s; }
        .bg-particle:nth-child(5) { width: 110px; height: 110px; left: 85%; animation-delay: 12s; }

        @keyframes float {
            0%, 100% { transform: translateY(100vh) rotate(0deg); opacity: 0; }
            10% { opacity: 1; }
            90% { opacity: 1; }
            100% { transform: translateY(-100px) rotate(360deg); opacity: 0; }
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            position: relative;
            z-index: 1;
        }

        /* Header */
        .header {
            text-align: center;
            margin-bottom: 3rem;
            animation: fadeInDown 0.6s ease-out;
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .title {
            color: #fbbf24;
            font-size: 2.5rem;
            font-weight: 800;
            margin-bottom: 1rem;
            text-shadow: 0 0 20px rgba(251, 191, 36, 0.5);
            letter-spacing: 0.05em;
        }

        .subtitle {
            color: #e0e7ff;
            font-size: 1.125rem;
            opacity: 0.8;
        }

        /* Section */
        .equipment-section {
            background: rgba(30, 30, 60, 0.8);
            backdrop-filter: blur(20px);
            border: 2px solid rgba(139, 92, 246, 0.3);
            border-radius: 1rem;
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            animation: fadeInUp 0.6s ease-out;
            animation-fill-mode: backwards;
        }

        .equipment-section:nth-child(2) { animation-delay: 0.1s; }
        .equipment-section:nth-child(3) { animation-delay: 0.2s; }
        .equipment-section:nth-child(4) { animation-delay: 0.3s; }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .section-header {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid rgba(139, 92, 246, 0.2);
        }

        .section-icon {
         color: #ffe082; /* 밝은 노란색 */
            font-size: 2rem;
            filter: drop-shadow(0 0 10px rgba(251, 191, 36, 0.3));
        }

        .section-title {
            color: #fbbf24;
            font-size: 1.75rem;
            font-weight: 700;
        }

        /* Table */
        .table-container {
          
            border-radius: 0.5rem;
            margin-bottom: 1.5rem;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }

        thead {
            background: linear-gradient(135deg, rgba(139, 92, 246, 0.3), rgba(99, 102, 241, 0.3));
        }

        th {
            padding: 1rem;
            text-align: left;
            color: #e0e7ff;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.875rem;
            letter-spacing: 0.05em;
        }

        th:first-child {
            border-top-left-radius: 0.5rem;
        }

        th:last-child {
            border-top-right-radius: 0.5rem;
        }

        tbody tr {
            background: rgba(30, 41, 59, 0.5);
            border-bottom: 1px solid rgba(139, 92, 246, 0.1);
            transition: all 0.3s ease;
        }

        tbody tr:hover {
            background: rgba(139, 92, 246, 0.2);
            transform: scale(1.01);
            box-shadow: 0 5px 15px rgba(139, 92, 246, 0.2);
        }

        tbody tr:last-child {
            border-bottom: none;
        }

        tbody tr:last-child td:first-child {
            border-bottom-left-radius: 0.5rem;
        }

        tbody tr:last-child td:last-child {
            border-bottom-right-radius: 0.5rem;
        }

        td {
            padding: 1rem;
            color: #cbd5e1;
        }

        .empty-message {
            text-align: center;
            color: #94a3b8;
            font-style: italic;
            padding: 2rem;
        }

        /* Link Button in Table */
        .btn-link {
            color: #fbbf24;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn-link:hover {
            color: #f59e0b;
            text-shadow: 0 0 10px rgba(251, 191, 36, 0.5);
        }

        .btn-link::after {
            content: '⚔';
            opacity: 0;
            transform: translateX(-10px);
            transition: all 0.3s ease;
        }

        .btn-link:hover::after {
            opacity: 1;
            transform: translateX(0);
        }

        /* Pagination */
        .pagination {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            flex-wrap: wrap;
        }

        .btn {
            padding: 0.75rem 1.25rem;
            border: none;
            border-radius: 0.5rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 0.875rem;
        }

        .btn-primary {
            background: linear-gradient(135deg, #8b5cf6, #6366f1);
            color: white;
            box-shadow: 0 4px 15px rgba(139, 92, 246, 0.3);
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(139, 92, 246, 0.4);
        }

        .btn-primary:active {
            transform: translateY(0);
        }

        .btn-outline-primary {
            background: rgba(139, 92, 246, 0.1);
            color: #a78bfa;
            border: 2px solid rgba(139, 92, 246, 0.3);
        }

        .btn-outline-primary:hover:not(:disabled) {
            background: rgba(139, 92, 246, 0.2);
            border-color: #8b5cf6;
        }

        .btn-outline-primary:disabled {
            background: linear-gradient(135deg, #8b5cf6, #6366f1);
            color: white;
            border-color: transparent;
            cursor: not-allowed;
            box-shadow: 0 4px 15px rgba(139, 92, 246, 0.4);
        }

        /* Home Button */
        .footer {
            text-align: center;
            margin-top: 3rem;
            animation: fadeIn 0.6s ease-out 0.5s backwards;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .home-button {
            display: inline-block;
            background: linear-gradient(135deg, #ec4899, #8b5cf6);
            color: white;
            padding: 1rem 2.5rem;
            border-radius: 0.75rem;
            font-size: 1.125rem;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 10px 30px rgba(236, 72, 153, 0.3);
        }

        .home-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 40px rgba(236, 72, 153, 0.5);
        }

        .home-button:active {
            transform: translateY(-1px);
        }

        /* Badge for enhancement level */
        .enhancement-badge {
            display: inline-block;
            background: linear-gradient(135deg, #fbbf24, #f59e0b);
            color: #1e293b;
            padding: 0.25rem 0.75rem;
            border-radius: 1rem;
            font-size: 0.875rem;
            font-weight: 700;
            box-shadow: 0 2px 8px rgba(251, 191, 36, 0.3);
        }

        /* Alert Modal Styling */
        .alert-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            display: none;
            align-items: center;
            justify-content: center;
            z-index: 1000;
            animation: fadeIn 0.3s ease-out;
        }

        .alert-overlay.show {
            display: flex;
        }

        .alert-box {
            background: linear-gradient(135deg, rgba(30, 30, 60, 0.95), rgba(45, 45, 75, 0.95));
            backdrop-filter: blur(20px);
            border: 2px solid rgba(139, 92, 246, 0.5);
            border-radius: 1rem;
            padding: 2rem;
            max-width: 500px;
            width: 90%;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.5);
            animation: slideUp 0.3s ease-out;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .alert-icon {
            text-align: center;
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        .alert-message {
            color: #e0e7ff;
            text-align: center;
            font-size: 1.125rem;
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }

        .alert-button {
            display: block;
            width: 100%;
            background: linear-gradient(135deg, #8b5cf6, #6366f1);
            color: white;
            padding: 0.875rem;
            border: none;
            border-radius: 0.5rem;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .alert-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(139, 92, 246, 0.4);
        }

        @media (max-width: 768px) {
            .title {
                font-size: 2rem;
            }

            .equipment-section {
                padding: 1.5rem;
            }

            .section-title {
                font-size: 1.5rem;
            }

            table {
                font-size: 0.875rem;
            }

            th, td {
                padding: 0.75rem 0.5rem;
            }

            .btn {
                padding: 0.5rem 0.875rem;
                font-size: 0.8125rem;
            }

            .home-button {
                padding: 0.875rem 2rem;
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="background-animation">
        <div class="bg-particle"></div>
        <div class="bg-particle"></div>
        <div class="bg-particle"></div>
        <div class="bg-particle"></div>
        <div class="bg-particle"></div>
    </div>

    <%
    String alertMsg = (String) session.getAttribute("alertMsg");
    if (alertMsg != null) {
    %>
    <!-- Custom Alert Modal -->
    <div class="alert-overlay show" id="alertOverlay">
        <div class="alert-box">
            <div class="alert-icon">⚠️</div>
            <div class="alert-message"><%=alertMsg%></div>
            <button class="alert-button" onclick="closeAlert()">확인</button>
        </div>
    </div>
    <%
    session.removeAttribute("alertMsg");
    }
    %>

    <div class="container">
        <!-- Header -->
        <div class="header">
            <h1 class="title">⚔ 강화 장비 목록 조회 ⚔</h1>
            <p class="subtitle">장비 이름을 클릭하여 강화를 진행하세요</p>
        </div>

        <!-- Sword Section -->
        <div class="equipment-section">
            <div class="section-header">
                <span class="section-icon">🗡</span>
                <h2 class="section-title">Sword 목록</h2>
            </div>

            <div class="table-container">
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
                                        <td>
                                            <a href="${pageContext.request.contextPath}/enforce.ep?swordName=${s.swordName}&currentNum=${s.swordNum}&swordUse=${s.swordUse}&type=sword" 
                                               class="btn-link">${s.swordName}</a>
                                        </td>
                                        <td>${s.swordInitial}</td>
                                        <td><span class="enhancement-badge">+${s.swordNum}</span></td>
                                        <td>${s.swordDate}</td>
                                        <td>${s.swordUse}</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>

            <div class="pagination">
                <c:if test="${Swordpi.currentPage > 1}">
                    <button class="btn btn-primary"
                        onclick="location.href='${pageContext.request.contextPath}/equipenforce.ep?swordPage=${Swordpi.currentPage - 1}'">
                        < 이전
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
                        다음 >
                    </button>
                </c:if>
            </div>
        </div>

        <!-- Shield Section -->
        <div class="equipment-section">
            <div class="section-header">
                <span class="section-icon">🛡</span>
                <h2 class="section-title">Shield 목록</h2>
            </div>

            <div class="table-container">
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
                                        <td>
                                            <a href="${pageContext.request.contextPath}/enforce.ep?shieldName=${sh.shieldName}&currentNum=${sh.shieldNum}&shieldUse=${sh.shieldUse}&type=shield" 
                                               class="btn-link">${sh.shieldName}</a>
                                        </td>
                                        <td>${sh.shieldInitial}</td>
                                        <td><span class="enhancement-badge">+${sh.shieldNum}</span></td>
                                        <td>${sh.shieldDate}</td>
                                        <td>${sh.shieldUse}</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>

            <div class="pagination">
                <c:if test="${Shieldpi.currentPage > 1}">
                    <button class="btn btn-primary"
                        onclick="location.href='${pageContext.request.contextPath}/equipenforce.ep?shieldPage=${Shieldpi.currentPage - 1}'">
                        < 이전
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
                        다음 >
                    </button>
                </c:if>
            </div>
        </div>

        <!-- Armor Section -->
        <div class="equipment-section">
            <div class="section-header">
                <span class="section-icon">🪖</span>
                <h2 class="section-title">Armor 목록</h2>
            </div>

            <div class="table-container">
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
                                        <td>
                                            <a href="${pageContext.request.contextPath}/enforce.ep?armorName=${a.armorName}&currentNum=${a.armorNum}&armorUse=${a.armorUse}&type=armor" 
                                               class="btn-link">${a.armorName}</a>
                                        </td>
                                        <td>${a.armorInitial}</td>
                                        <td><span class="enhancement-badge">+${a.armorNum}</span></td>
                                        <td>${a.armorDate}</td>
                                        <td>${a.armorUse}</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>

            <div class="pagination">
                <c:if test="${Armorpi.currentPage > 1}">
                    <button class="btn btn-primary"
                        onclick="location.href='${pageContext.request.contextPath}/equipenforce.ep?armorPage=${Armorpi.currentPage - 1}'">
                        < 이전
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
                        다음 >
                    </button>
                </c:if>
            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            <a href="http://localhost:8001/game/index.jsp" class="home-button">
                메인으로 돌아가기
            </a>
        </div>
    </div>

    <script>
        function closeAlert() {
            document.getElementById('alertOverlay').classList.remove('show');
        }

        // Close alert when clicking outside the box
        document.getElementById('alertOverlay')?.addEventListener('click', function(e) {
            if (e.target === this) {
                closeAlert();
            }
        });

        // Add hover effect to table rows
        document.addEventListener('DOMContentLoaded', function() {
            const tables = document.querySelectorAll('tbody tr');
            tables.forEach(row => {
                if (!row.querySelector('.empty-message')) {
                    row.addEventListener('mouseenter', function() {
                        this.style.transform = 'translateX(5px)';
                    });
                    row.addEventListener('mouseleave', function() {
                        this.style.transform = 'translateX(0)';
                    });
                }
            });
        });
    </script>
</body>
</html>