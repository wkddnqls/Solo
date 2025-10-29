<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
    <title>장비 강화 시스템</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: linear-gradient(135deg, #1e293b 0%, #581c87 50%, #1e293b 100%);
            min-height: 100vh;
            padding: 3rem 1rem;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .header {
            text-align: center;
            margin-bottom: 3rem;
        }

        .header-title {
            display: inline-flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1rem;
        }

        .header h1 {
            color: white;
            font-size: 2.5rem;
            font-weight: 700;
        }

        .header-icon {
            width: 48px;
            height: 48px;
            color: #fb923c;
        }

        .header-icon-flip {
            transform: scaleX(-1);
        }

        .header p {
            color: #e9d5ff;
            opacity: 0.8;
            font-size: 1.125rem;
        }

        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-bottom: 3rem;
        }

        .menu-card {
            position: relative;
            background: rgba(30, 41, 59, 0.5);
            backdrop-filter: blur(10px);
            border: 1px solid #334155;
            border-radius: 0.5rem;
            padding: 1.5rem;
            cursor: pointer;
            transition: all 0.3s ease;
            overflow: hidden;
            text-decoration: none;
            display: block;
        }

        .menu-card:hover {
            transform: scale(1.05);
            border-color: #a855f7;
            box-shadow: 0 20px 50px rgba(168, 85, 247, 0.2);
        }

        .card-gradient {
            position: absolute;
            top: 0;
            right: 0;
            width: 128px;
            height: 128px;
            border-radius: 50%;
            filter: blur(40px);
            opacity: 0.1;
            transition: opacity 0.3s ease;
        }

        .menu-card:hover .card-gradient {
            opacity: 0.2;
        }

        .icon-wrapper {
            display: inline-flex;
            padding: 0.75rem;
            border-radius: 0.5rem;
            margin-bottom: 1rem;
            transition: transform 0.3s ease;
        }

        .menu-card:hover .icon-wrapper {
            transform: scale(1.1);
        }

        .icon {
            width: 24px;
            height: 24px;
            color: white;
        }

        .card-number {
            position: absolute;
            top: 1rem;
            right: 1rem;
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background: rgba(51, 65, 85, 0.8);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #cbd5e1;
            font-size: 0.875rem;
        }

        .card-title {
            color: white;
            font-size: 1.125rem;
            font-weight: 600;
            margin-bottom: 0.75rem;
        }

        .status {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-top: 0.75rem;
        }

        .status-dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
        }

        .status-dot.available {
            background: #22c55e;
        }

        .status-dot.pending {
            background: #eab308;
            animation: pulse 2s infinite;
        }

        .status-text {
            font-size: 0.875rem;
        }

        .status-text.available {
            color: #4ade80;
        }

        .status-text.pending {
            color: #facc15;
        }

        .card-border {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 4px;
            transform: scaleX(0);
            transition: transform 0.3s ease;
        }

        .menu-card:hover .card-border {
            transform: scaleX(1);
        }

        .footer {
            text-align: center;
            margin-top: 3rem;
        }

        .footer p {
            color: #94a3b8;
            font-size: 1rem;
        }

        /* Gradient Colors */
        .gradient-orange { background: linear-gradient(135deg, #f97316 0%, #ef4444 100%); }
        .gradient-blue { background: linear-gradient(135deg, #3b82f6 0%, #06b6d4 100%); }
        .gradient-green { background: linear-gradient(135deg, #22c55e 0%, #10b981 100%); }
        .gradient-red { background: linear-gradient(135deg, #ef4444 0%, #f43f5e 100%); }
        .gradient-purple { background: linear-gradient(135deg, #a855f7 0%, #ec4899 100%); }
        .gradient-yellow { background: linear-gradient(135deg, #eab308 0%, #f97316 100%); }
        .gradient-indigo { background: linear-gradient(135deg, #6366f1 0%, #3b82f6 100%); }
        .gradient-violet { background: linear-gradient(135deg, #a855f7 0%, #8b5cf6 100%); }
        .gradient-gray { background: linear-gradient(135deg, #6b7280 0%, #64748b 100%); }

        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.5; }
        }

        @media (max-width: 768px) {
            .header h1 {
                font-size: 1.875rem;
            }
            
            .menu-grid {
                grid-template-columns: 1fr;
            }
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

    <div class="container">
        <!-- Header -->
        <div class="header">
            <div class="header-title">
                <svg class="header-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 3l-9 18-3-6-6-3 18-9z"/>
                </svg>
                <h1>장비 강화 시스템</h1>
                <svg class="header-icon header-icon-flip" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 3l-9 18-3-6-6-3 18-9z"/>
                </svg>
            </div>
            <p>게임 장비 관리 및 강화 메뉴</p>
        </div>

        <!-- Menu Grid -->
        <div class="menu-grid">
            <!-- 1. 장비 강화하기 -->
            <a href="${pageContext.request.contextPath}/equipenforce.ep" class="menu-card">
                <div class="card-gradient gradient-orange"></div>
                <div class="icon-wrapper gradient-orange">
                    <svg class="icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 3l-9 18-3-6-6-3 18-9z"/>
                    </svg>
                </div>
                <div class="card-number">1</div>
                <h3 class="card-title">장비 강화하기</h3>
                <div class="status">
                    <div class="status-dot available"></div>
                    <span class="status-text available">사용 가능</span>
                </div>
                <div class="card-border gradient-orange"></div>
            </a>

            <!-- 2. 장비 전체 목록 조회 -->
            <a href="${pageContext.request.contextPath}/equipList.ep" class="menu-card">
                <div class="card-gradient gradient-blue"></div>
                <div class="icon-wrapper gradient-blue">
                    <svg class="icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
                    </svg>
                </div>
                <div class="card-number">2</div>
                <h3 class="card-title">장비 전체 목록 조회</h3>
                <div class="status">
                    <div class="status-dot available"></div>
                    <span class="status-text available">사용 가능</span>
                </div>
                <div class="card-border gradient-blue"></div>
            </a>

            <!-- 3. 강화할 장비 이름 저장 -->
            <a href="http://localhost:8001/game/equipment/equipment_insert.jsp" class="menu-card">
                <div class="card-gradient gradient-green"></div>
                <div class="icon-wrapper gradient-green">
                    <svg class="icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
                    </svg>
                </div>
                <div class="card-number">3</div>
                <h3 class="card-title">강화할 장비 이름 저장</h3>
                <div class="status">
                    <div class="status-dot available"></div>
                    <span class="status-text available">사용 가능</span>
                </div>
                <div class="card-border gradient-green"></div>
            </a>

            <!-- 4. 강화목록 삭제하기 -->
            <a href="http://localhost:8001/game/equipment/equipment_delect.jsp" class="menu-card">
                <div class="card-gradient gradient-red"></div>
                <div class="icon-wrapper gradient-red">
                    <svg class="icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
                    </svg>
                </div>
                <div class="card-number">4</div>
                <h3 class="card-title">강화목록 삭제하기</h3>
                <div class="status">
                    <div class="status-dot available"></div>
                    <span class="status-text available">사용 가능</span>
                </div>
                <div class="card-border gradient-red"></div>
            </a>

            <!-- 5. 강화한 목록 키워드 검색 -->
            <a href="#" class="menu-card" onclick="return showAlert('강화한 목록 키워드 검색')">
                <div class="card-gradient gradient-purple"></div>
                <div class="icon-wrapper gradient-purple">
                    <svg class="icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
                    </svg>
                </div>
                <div class="card-number">5</div>
                <h3 class="card-title">장비 목록 키워드 검색</h3>
                <div class="status">
                    <div class="status-dot pending"></div>
                    <span class="status-text pending">준비 중</span>
                </div>
                <div class="card-border gradient-purple"></div>
            </a>

            <!-- 6. 강화 목록 사용처 수정하기 -->
            <a href="#" class="menu-card" onclick="return showAlert('강화 목록 사용처 수정하기')">
                <div class="card-gradient gradient-yellow"></div>
                <div class="icon-wrapper gradient-yellow">
                    <svg class="icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                    </svg>
                </div>
                <div class="card-number">6</div>
                <h3 class="card-title">강화 목록 사용처 수정하기</h3>
                <div class="status">
                    <div class="status-dot pending"></div>
                    <span class="status-text pending">준비 중</span>
                </div>
                <div class="card-border gradient-yellow"></div>
            </a>

            <!-- 7. 유저 옵션 보기 -->
            <a href="http://localhost:8001/game/human/human_options.jsp" class="menu-card" >
                <div class="card-gradient gradient-indigo"></div>
                <div class="icon-wrapper gradient-indigo">
                    <svg class="icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                    </svg>
                </div>
                <div class="card-number">7</div>
                <h3 class="card-title">유저 옵션 보기</h3>
                <div class="status">
                    <div class="status-dot available"></div>
                    <span class="status-text available">사용 가능</span>
                </div>
                <div class="card-border gradient-indigo"></div>
            </a>

            <!-- 8. 몬스터 옵션 보기 -->
            <a href="#" class="menu-card" onclick="return showAlert('몬스터 옵션 보기')">
                <div class="card-gradient gradient-violet"></div>
                <div class="icon-wrapper gradient-violet">
                    <svg class="icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z"/>
                    </svg>
                </div>
                <div class="card-number">8</div>
                <h3 class="card-title">몬스터 옵션 보기</h3>
                <div class="status">
                    <div class="status-dot pending"></div>
                    <span class="status-text pending">준비 중</span>
                </div>
                <div class="card-border gradient-violet"></div>
            </a>

            <!-- 9. 몬스터 사냥하기 -->
            <a href="#" class="menu-card" onclick="return showAlert('몬스터 사냥하기')">
                <div class="card-gradient gradient-red"></div>
                <div class="icon-wrapper gradient-red">
                    <svg class="icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/>
                    </svg>
                </div>
                <div class="card-number">9</div>
                <h3 class="card-title">몬스터 사냥하기</h3>
                <div class="status">
                    <div class="status-dot pending"></div>
                    <span class="status-text pending">준비 중</span>
                </div>
                <div class="card-border gradient-red"></div>
            </a>

            <!-- 10. 프로그램 종료 -->
            <a href="#" class="menu-card" onclick="return confirmExit()">
                <div class="card-gradient gradient-gray"></div>
                <div class="icon-wrapper gradient-gray">
                    <svg class="icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18.364 5.636a9 9 0 11-12.728 0M12 3v9"/>
                    </svg>
                </div>
                <div class="card-number">10</div>
                <h3 class="card-title">프로그램 종료</h3>
                <div class="status">
                    <div class="status-dot available"></div>
                    <span class="status-text available">사용 가능</span>
                </div>
                <div class="card-border gradient-gray"></div>
            </a>
        </div>

        <!-- Footer -->
        <div class="footer">
            <p>메뉴를 선택하여 기능을 실행하세요</p>
        </div>
    </div>

    <script>
        function showAlert(title) {
            alert('"' + title + '" 기능은 준비 중입니다.');
            return false;
        }

        function confirmExit() {
            if (confirm('프로그램을 종료하시겠습니까?')) {
                window.close();
            }
            return false;
        }
    </script>
</body>
</html>
