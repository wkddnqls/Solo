<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>인간(유저) 생성</title>
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

        .create-container {
            width: 100%;
            max-width: 600px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            border-radius: 24px;
            padding: 40px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.4);
        }

        h1 {
            font-size: 36px;
            font-weight: 700;
            background: linear-gradient(135deg, #60a5fa 0%, #a78bfa 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 40px;
            text-align: center;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        label {
            color: #cbd5e1;
            font-size: 14px;
            font-weight: 500;
            padding-left: 4px;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 14px 16px;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 12px;
            color: white;
            font-size: 16px;
            transition: all 0.3s ease;
            outline: none;
        }

        input[type="text"]::placeholder,
        input[type="number"]::placeholder {
            color: rgba(203, 213, 225, 0.5);
        }

        input[type="text"]:focus,
        input[type="number"]:focus {
            background: rgba(255, 255, 255, 0.08);
            border-color: #60a5fa;
            box-shadow: 0 0 0 3px rgba(96, 165, 250, 0.1);
        }

        input[type="text"]:hover,
        input[type="number"]:hover {
            background: rgba(255, 255, 255, 0.07);
            border-color: rgba(255, 255, 255, 0.3);
        }

        /* Chrome, Safari, Edge, Opera - 숫자 스피너 제거 */
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* Firefox - 숫자 스피너 제거 */
        input[type=number] {
            -moz-appearance: textfield;
        }

        .btn-submit {
            width: 100%;
            padding: 16px;
            background: linear-gradient(135deg, #60a5fa, #a78bfa);
            border: none;
            border-radius: 12px;
            color: white;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 20px rgba(96, 165, 250, 0.3);
            margin-top: 8px;
        }

        .btn-submit:hover {
            background: linear-gradient(135deg, #3b82f6, #9333ea);
            transform: translateY(-2px);
            box-shadow: 0 8px 30px rgba(96, 165, 250, 0.4);
        }

        .btn-submit:active {
            transform: translateY(0);
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: #cbd5e1;
            text-decoration: none;
            font-size: 14px;
            margin-top: 24px;
            padding: 12px 16px;
            border-radius: 10px;
            transition: all 0.3s ease;
        }

        .back-link:hover {
            color: white;
            background: rgba(255, 255, 255, 0.05);
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 16px;
            margin-top: 8px;
        }

        .stat-badge {
            background: rgba(255, 255, 255, 0.05);
            padding: 8px 12px;
            border-radius: 8px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            text-align: center;
        }

        .stat-label {
            color: #94a3b8;
            font-size: 11px;
            margin-bottom: 4px;
        }

        .stat-value {
            color: white;
            font-size: 16px;
            font-weight: 600;
        }

        @media (max-width: 768px) {
            .create-container {
                padding: 30px 20px;
            }

            h1 {
                font-size: 28px;
                margin-bottom: 30px;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="create-container">
        <h1>🧬 인간(유저) 생성</h1>

        <form action="${pageContext.request.contextPath}/insertHuman.do" method="post">
            <div class="form-group">
                <label for="humanName">이름</label>
                <input type="text" id="humanName" name="humanName" placeholder="예: 아르테미스" required>
            </div>

            <div class="form-group">
                <label for="humanNum">체력</label>
                <input type="number" id="humanNum" name="humanNum" placeholder="예: 100" min="0" step="1" required>
            </div>

            <div class="form-group">
                <label for="humanPower">공격력</label>
                <input type="number" id="humanPower" name="humanPower" placeholder="예: 150" min="0" step="0.1">
            </div>

            <div class="form-group">
                <label for="humanDefensive">방어력</label>
                <input type="number" id="humanDefensive" name="humanDefensive" placeholder="예: 80" min="0" step="0.1">
            </div>

            <button type="submit" class="btn-submit">✅ 생성하기</button>
        </form>

        <a href="http://localhost:8001/game/human/human_options.jsp" class="back-link">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" style="width: 16px; height: 16px;">
                <path stroke-linecap="round" stroke-linejoin="round" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
            </svg>
            유저 메뉴로 돌아가기
        </a>
    </div>
</body>
</html>
