<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장비 선택</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            min-height: 100vh;
            background: linear-gradient(135deg, #0f172a 0%, #581c87 50%, #0f172a 100%);
            padding: 40px 20px;
        }

        .container {
            width: 100%;
            max-width: 1400px;
            margin: 0 auto;
        }

        .page-header {
            text-align: center;
            margin-bottom: 40px;
        }

        h1 {
            font-size: 36px;
            font-weight: 700;
            background: linear-gradient(135deg, #60a5fa 0%, #a78bfa 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 12px;
        }

        .page-subtitle {
            color: #cbd5e1;
            font-size: 16px;
        }

        /* User Info Card */
        .user-info-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            border-radius: 16px;
            padding: 24px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
            margin-bottom: 40px;
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .user-avatar {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #60a5fa, #a78bfa);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
        }

        .user-details {
            flex: 1;
        }

        .user-name {
            color: white;
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .user-stats {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .user-stat {
            display: flex;
            align-items: center;
            gap: 6px;
            color: #cbd5e1;
            font-size: 14px;
        }

        .user-stat-label {
            color: #94a3b8;
        }

        .user-stat-value {
            color: white;
            font-weight: 600;
        }

        /* Equipment Section */
        .equipment-section {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 30px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.4);
            margin-bottom: 30px;
        }

        .section-header {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 24px;
        }

        .section-icon {
            font-size: 28px;
        }

        .section-title {
            color: white;
            font-size: 22px;
            font-weight: 600;
        }

        /* Table Styles */
        .table-container {
            overflow-x: auto;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }

        thead {
            background: rgba(255, 255, 255, 0.05);
        }

        th {
            color: #cbd5e1;
            font-size: 13px;
            font-weight: 600;
            text-align: left;
            padding: 14px 16px;
            border-bottom: 2px solid rgba(255, 255, 255, 0.1);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        th:first-child {
            border-top-left-radius: 10px;
        }

        th:last-child {
            border-top-right-radius: 10px;
        }

        tbody tr {
            transition: all 0.3s ease;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }

        tbody tr:hover {
            background: rgba(255, 255, 255, 0.05);
        }

        tbody tr:last-child {
            border-bottom: none;
        }

        td {
            color: white;
            padding: 14px 16px;
            font-size: 14px;
        }

        .btn-link {
            color: #60a5fa;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.2s ease;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .btn-link:hover {
            color: #93c5fd;
            text-decoration: underline;
        }

        .enhancement-badge {
            display: inline-block;
            padding: 4px 10px;
            background: rgba(34, 197, 94, 0.2);
            border: 1px solid rgba(34, 197, 94, 0.3);
            border-radius: 6px;
            color: #86efac;
            font-size: 12px;
            font-weight: 600;
        }

        .empty-message {
            text-align: center;
            color: #94a3b8;
            padding: 40px 20px !important;
            font-size: 15px;
        }

        /* Pagination */
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 8px;
            flex-wrap: wrap;
        }

        .pagination button {
            padding: 10px 16px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            color: white;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.3s ease;
            cursor: pointer;
            min-width: 40px;
            text-align: center;
        }

        .pagination button:not(:disabled):hover {
            background: rgba(255, 255, 255, 0.2);
            border-color: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
        }

        .pagination button.active {
            background: linear-gradient(135deg, #60a5fa, #a78bfa);
            border-color: transparent;
            box-shadow: 0 4px 12px rgba(96, 165, 250, 0.3);
        }

        .pagination button:disabled {
            opacity: 0.4;
            cursor: not-allowed;
            background: rgba(255, 255, 255, 0.05);
        }

        .pagination button:disabled:hover {
            transform: none;
        }

        /* Back Link */
        .back-link-container {
            text-align: center;
            margin-top: 40px;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: #cbd5e1;
            text-decoration: none;
            font-size: 14px;
            padding: 12px 20px;
            border-radius: 10px;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .back-link:hover {
            color: white;
            background: rgba(255, 255, 255, 0.1);
            border-color: rgba(255, 255, 255, 0.2);
            transform: translateY(-2px);
        }

        .back-link svg {
            width: 16px;
            height: 16px;
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 28px;
            }

            .equipment-section {
                padding: 20px;
            }

            .section-title {
                font-size: 18px;
            }

            th, td {
                padding: 10px 8px;
                font-size: 12px;
            }

            th {
                font-size: 11px;
            }

            .user-info-card {
                flex-direction: column;
                text-align: center;
            }

            .user-stats {
                justify-content: center;
            }
            
        }
        .btn-select {
            padding: 8px 16px;
            background: linear-gradient(135deg, #60a5fa, #a78bfa);
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(96, 165, 250, 0.3);
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="page-header">
            <h1>⚔️ 장비 선택</h1>
            <p class="page-subtitle">장착할 장비를 선택해주세요</p>
        </div>

        <!-- Selected User Info -->
       <c:if test="${not empty humanName}">
         <div class="user-info-card">
        <div class="user-avatar">👤</div>
        <div class="user-details">
            <div class="user-name">${humanName}</div>
            <div class="user-stats">
                <div class="user-stat">
                    <span class="user-stat-label">레벨:</span>
                    <span class="user-stat-value">${humanNum}</span>
                </div>
                <div class="user-stat">
                    <span class="user-stat-label">공격력:</span>
                    <span class="user-stat-value">${humanPower}</span>
                </div>
                <div class="user-stat">
                    <span class="user-stat-label">방어력:</span>
                    <span class="user-stat-value">${humanDefensive}</span>
                </div>
                <div class="user-stat">
                    <span class="user-stat-label">장착 장비:</span>
                    <span class="user-stat-value">
                        <c:choose>
                            <c:when test="${not empty humanSpecslist}">
                                ${humanSpecslist}
                            </c:when>
                            <c:otherwise>
                                없음
                            </c:otherwise>
                        </c:choose>
                    </span>
                </div>
            </div>
        </div>
    </div>
</c:if>
        <!-- Sword Section -->
        <div class="equipment-section">
            <div class="section-header">
                <span class="section-icon">🗡️</span>
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
                            <th style="text-align: center;">선택</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty swordList}">
                                <tr>
                                    <td colspan="6" class="empty-message">등록된 Sword가 없습니다.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="s" items="${swordList}">
                                    <tr>
                                        <td>${s.swordName}</td>
                                        <td>${s.swordInitial}</td>
                                        <td><span class="enhancement-badge">+${s.swordNum}</span></td>
                                        <td>${s.swordDate}</td>
                                        <td>${s.swordUse}</td>
                                        <td style="text-align: center;">
                                            <button class="btn-select" 
                                                onclick="location.href='${pageContext.request.contextPath}/equipped.ep?Name=${s.swordName}&currentNum=${s.swordNum}&humanName=${humanName}&type=sword'">
                                                장착하기
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>

            <c:if test="${not empty swordList and Swordpi.maxPage > 1}">
                <div class="pagination">
                    <c:if test="${Swordpi.currentPage > 1}">
                        <button onclick="location.href='${pageContext.request.contextPath}/equipenforce.ep?swordPage=${Swordpi.currentPage - 1}&shieldPage=${Shieldpi.currentPage}&armorPage=${Armorpi.currentPage}'">
                            ← 이전
                        </button>
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
                                <button onclick="location.href='${pageContext.request.contextPath}/equipenforce.ep?swordPage=${i}&shieldPage=${Shieldpi.currentPage}&armorPage=${Armorpi.currentPage}'">
                                    ${i}
                                </button>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:if test="${Swordpi.currentPage < Swordpi.maxPage}">
                        <button onclick="location.href='${pageContext.request.contextPath}/equipenforce.ep?swordPage=${Swordpi.currentPage + 1}&shieldPage=${Shieldpi.currentPage}&armorPage=${Armorpi.currentPage}'">
                            다음 →
                        </button>
                    </c:if>
                    <c:if test="${Swordpi.currentPage == Swordpi.maxPage}">
                        <button disabled>다음 →</button>
                    </c:if>
                </div>
            </c:if>
        </div>

        <!-- Shield Section -->
        <div class="equipment-section">
            <div class="section-header">
                <span class="section-icon">🛡️</span>
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
                            <th style="text-align: center;">선택</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty shieldList}">
                                <tr>
                                    <td colspan="6" class="empty-message">등록된 Shield가 없습니다.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="sh" items="${shieldList}">
                                    <tr>
                                        <td>${sh.shieldName}</td>
                                        <td>${sh.shieldInitial}</td>
                                        <td><span class="enhancement-badge">+${sh.shieldNum}</span></td>
                                        <td>${sh.shieldDate}</td>
                                        <td>${sh.shieldUse}</td>
                                        <td style="text-align: center;">
                                            <button class="btn-select" 
                                                onclick="location.href='${pageContext.request.contextPath}/equipped.ep?Name=${sh.shieldName}&currentNum=${sh.shieldNum}&humanName=${humanName}&type=shield'">
                                                장착하기
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>

            <c:if test="${not empty shieldList and Shieldpi.maxPage > 1}">
                <div class="pagination">
                    <c:if test="${Shieldpi.currentPage > 1}">
                        <button onclick="location.href='${pageContext.request.contextPath}/equipenforce.ep?swordPage=${Swordpi.currentPage}&shieldPage=${Shieldpi.currentPage - 1}&armorPage=${Armorpi.currentPage}'">
                            ← 이전
                        </button>
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
                                <button onclick="location.href='${pageContext.request.contextPath}/equipenforce.ep?swordPage=${Swordpi.currentPage}&shieldPage=${i}&armorPage=${Armorpi.currentPage}'">
                                    ${i}
                                </button>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:if test="${Shieldpi.currentPage < Shieldpi.maxPage}">
                        <button onclick="location.href='${pageContext.request.contextPath}/equipenforce.ep?swordPage=${Swordpi.currentPage}&shieldPage=${Shieldpi.currentPage + 1}&armorPage=${Armorpi.currentPage}'">
                            다음 →
                        </button>
                    </c:if>
                    <c:if test="${Shieldpi.currentPage == Shieldpi.maxPage}">
                        <button disabled>다음 →</button>
                    </c:if>
                </div>
            </c:if>
        </div>

        <!-- Armor Section -->
        <div class="equipment-section">
            <div class="section-header">
                <span class="section-icon">🦾</span>
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
                            <th style="text-align: center;">선택</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty armorList}">
                                <tr>
                                    <td colspan="6" class="empty-message">등록된 Armor가 없습니다.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="a" items="${armorList}">
                                    <tr>
                                        <td>${a.armorName}</td>
                                        <td>${a.armorInitial}</td>
                                        <td><span class="enhancement-badge">+${a.armorNum}</span></td>
                                        <td>${a.armorDate}</td>
                                        <td>${a.armorUse}</td>
                                        <td style="text-align: center;">
                                            <button class="btn-select" 
                                                onclick="location.href='${pageContext.request.contextPath}/equipped.ep?Name=${a.armorName}&currentNum=${a.armorNum}&HumanName=${humanName}&type=armor'">
                                                장착하기
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>

            <c:if test="${not empty armorList and Armorpi.maxPage > 1}">
                <div class="pagination">
                    <c:if test="${Armorpi.currentPage > 1}">
                        <button onclick="location.href='${pageContext.request.contextPath}/equipenforce.ep?swordPage=${Swordpi.currentPage}&shieldPage=${Shieldpi.currentPage}&armorPage=${Armorpi.currentPage - 1}'">
                            ← 이전
                        </button>
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
                                <button onclick="location.href='${pageContext.request.contextPath}/equipenforce.ep?swordPage=${Swordpi.currentPage}&shieldPage=${Shieldpi.currentPage}&armorPage=${i}'">
                                    ${i}
                                </button>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:if test="${Armorpi.currentPage < Armorpi.maxPage}">
                        <button onclick="location.href='${pageContext.request.contextPath}/equipenforce.ep?swordPage=${Swordpi.currentPage}&shieldPage=${Shieldpi.currentPage}&armorPage=${Armorpi.currentPage + 1}'">
                            다음 →
                        </button>
                    </c:if>
                    <c:if test="${Armorpi.currentPage == Armorpi.maxPage}">
                        <button disabled>다음 →</button>
                    </c:if>
                </div>
            </c:if>
        </div>

        <div class="back-link-container">
            <a href="http://localhost:8001/game/human/human_options.jsp" class="back-link">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                </svg>
                유저 메뉴로 돌아가기
            </a>
        </div>
    </div>
</body>
</html>

