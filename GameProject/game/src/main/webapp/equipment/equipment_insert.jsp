<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장비 등록</title>
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
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 1rem;
            position: relative;
             overflow-x: hidden; /* ✅ 가로 스크롤만 숨기기 */
             overflow-y: auto;   /* ✅ 세로 스크롤 가능하게 */
  
        }

        /* Animated background particles */
        .particles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 0;
        }

        .particle {
            position: absolute;
            background: radial-gradient(circle, rgba(139, 92, 246, 0.1), transparent);
            border-radius: 50%;
            animation: float 20s infinite;
        }

        .particle:nth-child(1) { width: 100px; height: 100px; left: 10%; animation-delay: 0s; }
        .particle:nth-child(2) { width: 80px; height: 80px; left: 25%; animation-delay: 3s; }
        .particle:nth-child(3) { width: 120px; height: 120px; left: 50%; animation-delay: 6s; }
        .particle:nth-child(4) { width: 90px; height: 90px; left: 70%; animation-delay: 9s; }
        .particle:nth-child(5) { width: 110px; height: 110px; left: 85%; animation-delay: 12s; }

        @keyframes float {
            0%, 100% { transform: translateY(100vh) rotate(0deg); opacity: 0; }
            10% { opacity: 1; }
            90% { opacity: 1; }
            100% { transform: translateY(-100px) rotate(360deg); opacity: 0; }
        }

        .container {
            position: relative;
            z-index: 1;
            max-width: 600px;
            width: 100%;
        }

        .card {
            background: rgba(30, 30, 60, 0.9);
            backdrop-filter: blur(20px);
            border: 2px solid rgba(139, 92, 246, 0.3);
            border-radius: 1.5rem;
            padding: 3rem 2.5rem;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.5),
                        0 0 100px rgba(139, 92, 246, 0.2);
            animation: cardEntry 0.6s ease-out;
        }

        @keyframes cardEntry {
            from {
                opacity: 0;
                transform: translateY(30px) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        /* Header */
        .header {
            text-align: center;
            margin-bottom: 2.5rem;
        }

        .title {
            color: #fbbf24;
            font-size: 2.25rem;
            font-weight: 800;
            margin-bottom: 0.75rem;
            text-shadow: 0 0 20px rgba(251, 191, 36, 0.5);
            letter-spacing: 0.05em;
        }

        .subtitle {
            color: #e0e7ff;
            font-size: 1rem;
            opacity: 0.8;
        }

        .icon-header {
            font-size: 3rem;
            margin-bottom: 1rem;
            animation: iconFloat 3s ease-in-out infinite;
        }

        @keyframes iconFloat {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        /* Form */
        .form-group {
            margin-bottom: 1.75rem;
        }

        label {
            display: block;
            color: #a78bfa;
            font-size: 0.9375rem;
            font-weight: 600;
            margin-bottom: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        label::before {
            content: '⚡ ';
            opacity: 0.7;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 0.875rem 1.25rem;
            background: rgba(30, 41, 59, 0.6);
            border: 2px solid rgba(139, 92, 246, 0.3);
            border-radius: 0.75rem;
            color: #e0e7ff;
            font-size: 1rem;
            transition: all 0.3s ease;
            outline: none;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        select:focus {
            border-color: #8b5cf6;
            background: rgba(30, 41, 59, 0.8);
            box-shadow: 0 0 0 3px rgba(139, 92, 246, 0.1),
                        0 0 20px rgba(139, 92, 246, 0.2);
        }

        input::placeholder {
            color: #64748b;
        }

        input[readonly] {
            background: rgba(251, 191, 36, 0.1);
            border-color: rgba(251, 191, 36, 0.3);
            color: #fbbf24;
            cursor: not-allowed;
        }

        select {
            cursor: pointer;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%23a78bfa' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 1rem center;
            background-size: 1.25rem;
            padding-right: 3rem;
        }

        select option {
            background: #1e293b;
            color: #e0e7ff;
            padding: 0.75rem;
        }

        /* Equipment Type Icons */
        .equipment-type-selector {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 1rem;
            margin-top: 0.75rem;
        }

        .equipment-option {
            position: relative;
            display: none;
        }

        .equipment-option input[type="radio"] {
            position: absolute;
            opacity: 0;
            width: 100%;
            height: 100%;
            cursor: pointer;
        }

        .equipment-card {
            background: rgba(30, 41, 59, 0.6);
            border: 2px solid rgba(139, 92, 246, 0.3);
            border-radius: 0.75rem;
            padding: 1.25rem 0.75rem;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .equipment-option input[type="radio"]:checked + .equipment-card {
            border-color: #8b5cf6;
            background: rgba(139, 92, 246, 0.2);
            box-shadow: 0 0 20px rgba(139, 92, 246, 0.3);
            transform: scale(1.05);
        }

        .equipment-card:hover {
            border-color: #8b5cf6;
            background: rgba(139, 92, 246, 0.15);
            transform: translateY(-3px);
        }

        .equipment-icon {
            font-size: 2rem;
            margin-bottom: 0.5rem;
            display: block;
        }

        .equipment-label {
            color: #cbd5e1;
            font-size: 0.875rem;
            font-weight: 600;
        }

        /* Power Badge */
        .power-display {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.75rem;
            padding: 1rem;
            background: linear-gradient(135deg, rgba(251, 191, 36, 0.1), rgba(245, 158, 11, 0.1));
            border: 2px solid rgba(251, 191, 36, 0.3);
            border-radius: 0.75rem;
        }

        .power-icon {
            font-size: 1.5rem;
        }

        .power-value {
            font-size: 1.75rem;
            font-weight: 800;
            color: #fbbf24;
            text-shadow: 0 0 10px rgba(251, 191, 36, 0.5);
        }

        .power-text {
            color: #cbd5e1;
            font-size: 0.875rem;
        }

        /* Buttons */
        .button-group {
            display: flex;
            gap: 1rem;
            margin-top: 2.5rem;
        }

        button[type="submit"] {
            flex: 1;
            padding: 1rem 2rem;
            background: linear-gradient(135deg, #8b5cf6, #6366f1);
            color: white;
            border: none;
            border-radius: 0.75rem;
            font-size: 1.125rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 10px 30px rgba(139, 92, 246, 0.3);
            position: relative;
            overflow: hidden;
        }

        button[type="submit"]::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.2);
            transform: translate(-50%, -50%);
            transition: width 0.6s, height 0.6s;
        }

        button[type="submit"]:hover::before {
            width: 300px;
            height: 300px;
        }

        button[type="submit"]:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 40px rgba(139, 92, 246, 0.5);
        }

        button[type="submit"]:active {
            transform: translateY(-1px);
        }

        button[type="submit"] span {
            position: relative;
            z-index: 1;
        }

        .cancel-button {
            flex: 1;
            padding: 1rem 2rem;
            background: rgba(51, 65, 85, 0.6);
            color: #cbd5e1;
            border: 2px solid rgba(100, 116, 139, 0.3);
            border-radius: 0.75rem;
            font-size: 1.125rem;
            font-weight: 700;
            text-decoration: none;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .cancel-button:hover {
            background: rgba(51, 65, 85, 0.8);
            border-color: rgba(100, 116, 139, 0.5);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
        }

        .cancel-button:active {
            transform: translateY(-1px);
        }

        /* Divider */
        .divider {
            height: 2px;
            background: linear-gradient(90deg, transparent, rgba(139, 92, 246, 0.3), transparent);
            margin: 2rem 0;
        }

        /* Helper text */
        .helper-text {
            color: #94a3b8;
            font-size: 0.8125rem;
            margin-top: 0.5rem;
            font-style: italic;
        }

        @media (max-width: 640px) {
            .card {
                padding: 2rem 1.5rem;
            }

            .title {
                font-size: 1.875rem;
            }

            .equipment-type-selector {
                grid-template-columns: 1fr;
            }

            .button-group {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="particles">
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
    </div>

    <div class="container">
        <div class="card">
            <div class="header">
                <div class="icon-header">⚔️🛡️🪖</div>
                <h1 class="title">장비 등록</h1>
                <p class="subtitle">새로운 장비를 등록하여 강화를 시작하세요</p>
            </div>

            <form action="${pageContext.request.contextPath}/insertSword.ep" method="post">
                <!-- 장비 이름 -->
                <div class="form-group">
                    <label for="equipName">장비 이름</label>
                    <input type="text" name="equipName" id="equipName" 
                           placeholder="예: 불꽃검" required>
                </div>

                <!-- 장비 종류 -->
                <div class="form-group">
                    <label for="equipType">장비 종류</label>
                    <select name="equipType" id="equipType" required>
                        <option value="">선택하세요</option>
                        <option value="sword">🗡 소드</option>
                        <option value="shield">🛡 쉴드</option>
                        <option value="armor">🪖 아머</option>
                    </select>
                    <p class="helper-text">장비의 타입을 선택하세요</p>
                </div>

                <!-- 새길 이니셜 -->
                <div class="form-group">
                    <label for="equipinitial">새길 이니셜</label>
                    <input type="text" name="equipinitial" id="equipinitial" 
                           placeholder="예: KHD" required maxlength="10">
                    <p class="helper-text">장비에 새길 이니셜을 입력하세요</p>
                </div>

                <div class="divider"></div>

                <!-- 강화 수치 -->
                <div class="form-group">
                    <label for="equipPower">초기 강화 수치</label>
                    <div class="power-display">
                        <span class="power-icon">✨</span>
                        <span class="power-value">+1</span>
                        <span class="power-text">강화 레벨</span>
                    </div>
                    <input type="hidden" name="equipPower" id="equipPower" value="1">
                    <p class="helper-text">모든 장비는 +1부터 시작합니다</p>
                </div>

                <!-- 사용처 -->
                <div class="form-group">
                    <label for="equipUse">사용처</label>
                    <input type="text" name="equipUse" id="equipUse" 
                           placeholder="예: 몬스터 사냥, 보스 레이드" required>
                    <p class="helper-text">이 장비를 어디에 사용할 예정인가요?</p>
                </div>

                <!-- 버튼 -->
                <div class="button-group">
                    <button type="submit">
                        <span>🎯 장비 저장</span>
                    </button>
                    <a href="${pageContext.request.contextPath}" class="cancel-button">
                        ❌ 취소(메인으로)
                    </a>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Form validation with visual feedback
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('form');
            const inputs = form.querySelectorAll('input[required], select[required]');

            // Add validation feedback
            inputs.forEach(input => {
                input.addEventListener('blur', function() {
                    if (this.value.trim() === '') {
                        this.style.borderColor = 'rgba(239, 68, 68, 0.5)';
                    } else {
                        this.style.borderColor = 'rgba(34, 197, 94, 0.5)';
                    }
                });

                input.addEventListener('focus', function() {
                    this.style.borderColor = 'rgba(139, 92, 246, 0.5)';
                });
            });

            // Form submit animation
            form.addEventListener('submit', function(e) {
                const submitBtn = this.querySelector('button[type="submit"]');
                submitBtn.innerHTML = '<span>⏳ 저장 중...</span>';
                submitBtn.disabled = true;
            });

            // Auto-uppercase for initials
            const initialInput = document.getElementById('equipinitial');
            initialInput.addEventListener('input', function() {
                this.value = this.value.toUpperCase();
            });

            // Select change animation
            const selectElement = document.getElementById('equipType');
            selectElement.addEventListener('change', function() {
                if (this.value) {
                    this.style.borderColor = 'rgba(34, 197, 94, 0.5)';
                    this.style.background = 'rgba(34, 197, 94, 0.05)';
                }
            });
        });

        // Add ripple effect to button
        const button = document.querySelector('button[type="submit"]');
        button.addEventListener('click', function(e) {
            if (!this.disabled) {
                const ripple = document.createElement('span');
                const rect = this.getBoundingClientRect();
                const size = Math.max(rect.width, rect.height);
                const x = e.clientX - rect.left - size / 2;
                const y = e.clientY - rect.top - size / 2;
                
                ripple.style.width = ripple.style.height = size + 'px';
                ripple.style.left = x + 'px';
                ripple.style.top = y + 'px';
                ripple.style.position = 'absolute';
                ripple.style.borderRadius = '50%';
                ripple.style.background = 'rgba(255, 255, 255, 0.5)';
                ripple.style.pointerEvents = 'none';
                ripple.style.animation = 'ripple 0.6s ease-out';
                
                this.appendChild(ripple);
                
                setTimeout(() => ripple.remove(), 600);
            }
        });

        // Add ripple animation
        const style = document.createElement('style');
        style.textContent = `
            @keyframes ripple {
                from {
                    transform: scale(0);
                    opacity: 1;
                }
                to {
                    transform: scale(2);
                    opacity: 0;
                }
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>