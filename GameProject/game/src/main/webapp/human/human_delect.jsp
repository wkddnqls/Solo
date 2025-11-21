<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>유저 삭제</title>
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
            padding: 40px 20px;
        }

        .container {
            width: 100%;
            max-width: 600px;
        }

        .card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            border-radius: 24px;
            padding: 40px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.4);
        }

        .header {
            text-align: center;
            margin-bottom: 32px;
        }

        .icon-header {
            font-size: 48px;
            margin-bottom: 16px;
            animation: pulse 2s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
        }

        .title {
            font-size: 32px;
            font-weight: 700;
            background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 8px;
        }

        .subtitle {
            color: #cbd5e1;
            font-size: 15px;
        }

        /* Warning Box */
        .warning-box {
            background: rgba(239, 68, 68, 0.1);
            border: 1px solid rgba(239, 68, 68, 0.3);
            border-radius: 12px;
            padding: 16px;
            margin-bottom: 32px;
        }

        .warning-header {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 8px;
        }

        .warning-icon {
            font-size: 20px;
        }

        .warning-title {
            color: #fca5a5;
            font-weight: 600;
            font-size: 15px;
        }

        .warning-text {
            color: #fecaca;
            font-size: 14px;
            line-height: 1.6;
            margin-left: 28px;
        }

        /* Form Styles */
        .form-group {
            margin-bottom: 24px;
        }

        label {
            display: block;
            color: #cbd5e1;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        input[type="text"] {
            width: 100%;
            padding: 14px 16px;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            color: white;
            font-size: 15px;
            transition: all 0.3s ease;
            outline: none;
        }

        input[type="text"]::placeholder {
            color: #64748b;
        }

        input[type="text"]:focus {
            background: rgba(255, 255, 255, 0.08);
            border-color: rgba(239, 68, 68, 0.5);
            box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.1);
        }

        .helper-text {
            margin-top: 6px;
            color: #94a3b8;
            font-size: 13px;
        }

        .divider {
            height: 1px;
            background: rgba(255, 255, 255, 0.1);
            margin: 32px 0;
        }

        /* Button Group */
        .button-group {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        button[type="button"],
        button[type="submit"] {
            width: 100%;
            padding: 14px 24px;
            background: linear-gradient(135deg, #ef4444, #dc2626);
            border: none;
            border-radius: 12px;
            color: white;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(239, 68, 68, 0.3);
        }

        button[type="button"]:hover,
        button[type="submit"]:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(239, 68, 68, 0.4);
        }

        button[type="button"]:active,
        button[type="submit"]:active {
            transform: translateY(0);
        }

        .cancel-button {
            display: block;
            width: 100%;
            padding: 14px 24px;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 12px;
            color: #cbd5e1;
            font-size: 15px;
            font-weight: 600;
            text-align: center;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .cancel-button:hover {
            background: rgba(255, 255, 255, 0.1);
            border-color: rgba(255, 255, 255, 0.3);
            color: white;
        }

        /* Confirmation Message */
        .confirmation-box {
            background: rgba(34, 197, 94, 0.1);
            border: 1px solid rgba(34, 197, 94, 0.3);
            border-radius: 12px;
            padding: 16px;
            margin-bottom: 24px;
            display: none;
        }

        .confirmation-box.show {
            display: block;
            animation: slideDown 0.3s ease;
        }

        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .confirmation-text {
            color: #86efac;
            font-size: 14px;
            line-height: 1.6;
        }

        .checkbox-group {
            display: flex;
            align-items: start;
            gap: 12px;
            margin-bottom: 24px;
            padding: 16px;
            background: rgba(239, 68, 68, 0.05);
            border: 1px solid rgba(239, 68, 68, 0.2);
            border-radius: 10px;
        }

        .checkbox-group input[type="checkbox"] {
            margin-top: 2px;
            width: 18px;
            height: 18px;
            cursor: pointer;
            accent-color: #ef4444;
        }

        .checkbox-group label {
            margin: 0;
            color: #fca5a5;
            font-size: 14px;
            line-height: 1.5;
            cursor: pointer;
        }

        @media (max-width: 640px) {
            .card {
                padding: 28px 20px;
            }

            .title {
                font-size: 26px;
            }

            .icon-header {
                font-size: 40px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="header">
                <div class="icon-header">⚠️</div>
                <h1 class="title">유저 삭제</h1>
                <p class="subtitle">삭제할 유저 정보를 입력하세요</p>
            </div>

            <!-- Warning Box -->
            <div class="warning-box">
                <div class="warning-header">
                    <span class="warning-icon">⚠️</span>
                    <span class="warning-title">주의</span>
                </div>
                <p class="warning-text">
                    이 작업은 되돌릴 수 없습니다. 유저를 삭제하면 모든 레벨, 스탯, 장착 장비 정보가 영구적으로 삭제됩니다.
                </p>
            </div>

            <form id="deleteForm" action="${pageContext.request.contextPath}/humanDelete.ep" method="post">
                <!-- 유저 이름 -->
                <div class="form-group">
                    <label for="humanName">삭제할 유저 이름</label>
                    <input type="text" name="humanName" id="humanName" 
                           placeholder="예: 아르테미스" required>
                    <p class="helper-text">정확한 유저 이름을 입력하세요</p>
                </div>

                <!-- 확인 체크박스 -->
                <div class="checkbox-group">
                    <input type="checkbox" id="confirmDelete" name="confirmDelete" required>
                    <label for="confirmDelete">
                        위의 유저를 영구적으로 삭제하는 것에 동의합니다. 이 작업은 되돌릴 수 없음을 이해합니다.
                    </label>
                </div>

                <div class="divider"></div>

                <!-- 버튼 -->
                <div class="button-group">
                    <button type="submit" id="deleteBtn">
                        <span>🗑️ 유저 삭제</span>
                    </button>
                    <a href="http://localhost:8001/game/human/human_options.jsp" class="cancel-button">
                        ↩️ 취소
                    </a>
                </div>
            </form>
        </div>
    </div>

    <script>
        // 폼 제출 전 최종 확인
        document.getElementById('deleteForm').addEventListener('submit', function(e) {
            const humanName = document.getElementById('humanName').value;
            const confirmDelete = document.getElementById('confirmDelete').checked;

            if (!confirmDelete) {
                e.preventDefault();
                alert('삭제를 진행하려면 확인 체크박스를 선택해주세요.');
                return false;
            }

            const confirmed = confirm(
                '정말로 "' + humanName + '" 유저를 삭제하시겠습니까?\n\n' +
                '이 작업은 되돌릴 수 없습니다.'
            );

            if (!confirmed) {
                e.preventDefault();
                return false;
            }
        });

        // 엔터키로 폼 제출 방지 (명시적인 버튼 클릭 요구)
        document.getElementById('humanName').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
            }
        });
    </script>
</body>
</html>
