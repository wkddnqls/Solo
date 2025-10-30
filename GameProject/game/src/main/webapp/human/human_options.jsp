<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>유저 관리</title>
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
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .container {
            width: 100%;
            max-width: 900px;
        }

        .header {
            text-align: center;
            margin-bottom: 50px;
        }

        h1 {
            font-size: 48px;
            font-weight: 700;
            background: linear-gradient(135deg, #60a5fa 0%, #a78bfa 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 16px;
        }

        .subtitle {
            color: #cbd5e1;
            font-size: 16px;
        }

        .menu-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            margin-bottom: 40px;
        }

        form {
            width: 100%;
            height: 100%;
        }

        .menu-item {
            position: relative;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 28px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
        }

        .menu-item:hover {
            transform: translateY(-5px);
            background: rgba(255, 255, 255, 0.15);
            border-color: rgba(255, 255, 255, 0.3);
            box-shadow: 0 15px 50px rgba(0, 0, 0, 0.4);
        }

        .menu-item::before {
            content: '';
            position: absolute;
            inset: 0;
            background: linear-gradient(90deg, rgba(255, 255, 255, 0.1), transparent);
            opacity: 0;
            transition: opacity 0.3s ease;
            pointer-events: none;
        }

        .menu-item:hover::before {
            opacity: 1;
        }

        .menu-content {
            display: flex;
            align-items: center;
            gap: 20px;
            width: 100%;
        }

        .icon-wrapper {
            padding: 16px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
            flex-shrink: 0;
        }

        .menu-item:hover .icon-wrapper {
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            transform: scale(1.1);
        }

        .icon-wrapper svg {
            width: 28px;
            height: 28px;
            color: white;
            display: block;
        }

        .icon-create {
            background: linear-gradient(135deg, #3b82f6, #06b6d4);
        }

        .menu-item:hover .icon-create {
            background: linear-gradient(135deg, #2563eb, #0891b2);
        }

        .icon-view {
            background: linear-gradient(135deg, #a855f7, #ec4899);
        }

        .menu-item:hover .icon-view {
            background: linear-gradient(135deg, #9333ea, #db2777);
        }

        .icon-equip {
            background: linear-gradient(135deg, #10b981, #14b8a6);
        }

        .menu-item:hover .icon-equip {
            background: linear-gradient(135deg, #059669, #0d9488);
        }

        .icon-delete {
            background: linear-gradient(135deg, #ef4444, #f97316);
        }

        .menu-item:hover .icon-delete {
            background: linear-gradient(135deg, #dc2626, #ea580c);
        }

        .menu-text {
            flex: 1;
            text-align: left;
        }

        .menu-title {
            color: white;
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 6px;
        }

        .menu-description {
            color: #cbd5e1;
            font-size: 13px;
            line-height: 1.5;
        }

        .home-button-container {
            text-align: center;
        }

        .home-button {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 16px 32px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            color: white;
            text-decoration: none;
            border-radius: 12px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            font-size: 16px;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .home-button:hover {
            background: rgba(255, 255, 255, 0.2);
            border-color: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        }

        .home-button svg {
            width: 20px;
            height: 20px;
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 36px;
            }

            .menu-grid {
                grid-template-columns: 1fr;
            }

            .menu-item {
                padding: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>유저 관리</h1>
            <p class="subtitle">유저 계정을 생성하고 관리할 수 있습니다</p>
        </div>

        <div class="menu-grid">
            <!-- 유저 생성 -->
            <form action="http://localhost:8001/game/human/human_create.jsp" method="post">
                <div class="menu-item" onclick="this.parentElement.submit()">
                    <div class="menu-content">
                        <div class="icon-wrapper icon-create">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                            </svg>
                        </div>
                        <div class="menu-text">
                            <div class="menu-title">1. 유저 생성</div>
                            <div class="menu-description">새로운 유저 계정을 만듭니다</div>
                        </div>
                    </div>
                </div>
            </form>

            <!-- 유저 정보보기 -->
            <form action="${pageContext.request.contextPath}/humanList.ep" method="post">
                <div class="menu-item" onclick="this.parentElement.submit()">
                    <div class="menu-content">
                        <div class="icon-wrapper icon-view">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                <path stroke-linecap="round" stroke-linejoin="round" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                            </svg>
                        </div>
                        <div class="menu-text">
                            <div class="menu-title">2. 유저 정보보기</div>
                            <div class="menu-description">유저의 상세 정보를 확인합니다</div>
                        </div>
                    </div>
                </div>
            </form>

            <!-- 장비 장착하기 -->
            <form action="${pageContext.request.contextPath}/chooseHuman.ep" method="post">
                <div class="menu-item" onclick="this.parentElement.submit()">
                    <div class="menu-content">
                        <div class="icon-wrapper icon-equip">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
                            </svg>
                        </div>
                        <div class="menu-text">
                            <div class="menu-title">3. 장비 장착하기</div>
                            <div class="menu-description">유저의 장비를 관리합니다</div>
                        </div>
                    </div>
                </div>
            </form>

            <!-- 유저 삭제하기 -->
            <form action="" method="post">
                <div class="menu-item" onclick="this.parentElement.submit()">
                    <div class="menu-content">
                        <div class="icon-wrapper icon-delete">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                            </svg>
                        </div>
                        <div class="menu-text">
                            <div class="menu-title">4. 유저 삭제하기</div>
                            <div class="menu-description">유저 계정을 영구적으로 삭제합니다</div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <div class="home-button-container">
            <a href="http://localhost:8001/game/index.jsp" class="home-button">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
                </svg>
                메인으로 돌아가기
            </a>
        </div>
    </div>

</body>
</html>
