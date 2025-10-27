<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강화 결과</title>
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
            padding: 1rem;
            position: relative;
           
        }

        /* Success Background */
        body.success-bg {
            background: linear-gradient(135deg, #1a2a0f, #2d4a1f, #1f3a1a);
        }

        /* Fail Background */
        body.fail-bg {
            background: linear-gradient(135deg, #2a0f0f, #4a1f1f, #3a1a1a);
        }

        /* Animated particles */
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
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: float 15s infinite;
        }

        /* Success particles - stars */
        .success-particle {
            background: radial-gradient(circle, #fbbf24, transparent);
            animation: sparkle 2s infinite, float 15s infinite;
        }

        /* Fail particles - smoke */
        .fail-particle {
            background: radial-gradient(circle, rgba(139, 0, 0, 0.3), transparent);
            animation: smoke 3s infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(100vh) rotate(0deg); opacity: 0; }
            10% { opacity: 0.3; }
            90% { opacity: 0.3; }
            100% { transform: translateY(-100px) rotate(360deg); opacity: 0; }
        }

        @keyframes sparkle {
            0%, 100% { opacity: 0; }
            50% { opacity: 1; }
        }

        @keyframes smoke {
            0% { transform: translateY(0) scale(1); opacity: 0.3; }
            100% { transform: translateY(-100px) scale(2); opacity: 0; }
        }

        .particle:nth-child(1) { width: 80px; height: 80px; left: 10%; animation-delay: 0s; }
        .particle:nth-child(2) { width: 60px; height: 60px; left: 20%; animation-delay: 2s; }
        .particle:nth-child(3) { width: 100px; height: 100px; left: 60%; animation-delay: 4s; }
        .particle:nth-child(4) { width: 70px; height: 70px; left: 80%; animation-delay: 6s; }
        .particle:nth-child(5) { width: 90px; height: 90px; left: 40%; animation-delay: 8s; }

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
            padding: 3rem 2rem;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.5);
            animation: cardEntry 0.8s ease-out;
            text-align: center;
        }

        .card.success {
            border-color: rgba(34, 197, 94, 0.5);
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.5),
                        0 0 100px rgba(34, 197, 94, 0.3);
        }

        .card.fail {
            border-color: rgba(239, 68, 68, 0.5);
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.5),
                        0 0 100px rgba(239, 68, 68, 0.2);
        }

        @keyframes cardEntry {
            from {
                opacity: 0;
                transform: translateY(30px) scale(0.9);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .title {
            color: #fbbf24;
            font-size: 2.5rem;
            font-weight: 800;
            margin-bottom: 2rem;
            text-shadow: 0 0 20px rgba(251, 191, 36, 0.5);
            letter-spacing: 0.1em;
        }

        .equipment-section {
            background: rgba(139, 92, 246, 0.1);
            border: 1px solid rgba(139, 92, 246, 0.3);
            border-radius: 0.75rem;
            padding: 1.5rem;
            margin-bottom: 2rem;
        }

        .equipment-label {
            color: #a78bfa;
            font-size: 1rem;
            margin-bottom: 0.5rem;
        }

        .equipment-name {
            color: #fbbf24;
            font-size: 2rem;
            font-weight: 700;
            text-shadow: 0 0 10px rgba(251, 191, 36, 0.3);
        }

        .result-section {
            margin: 3rem 0;
            position: relative;
        }

        /* Success Result */
        .result-icon.success {
            font-size: 8rem;
            margin-bottom: 1rem;
            animation: successBounce 0.8s ease-out, successGlow 2s ease-in-out infinite;
        }

        @keyframes successBounce {
            0% { transform: scale(0) rotate(0deg); }
            50% { transform: scale(1.2) rotate(180deg); }
            100% { transform: scale(1) rotate(360deg); }
        }

        @keyframes successGlow {
            0%, 100% { filter: drop-shadow(0 0 10px rgba(34, 197, 94, 0.5)); }
            50% { filter: drop-shadow(0 0 30px rgba(34, 197, 94, 0.9)); }
        }

        .success-message {
            color: #22c55e;
            font-size: 2.5rem;
            font-weight: 800;
            text-shadow: 0 0 20px rgba(34, 197, 94, 0.5);
            animation: successPulse 1.5s ease-in-out infinite;
        }

        @keyframes successPulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        /* Fail Result */
        .result-icon.fail {
            font-size: 8rem;
            margin-bottom: 1rem;
            animation: failShake 0.8s ease-out;
        }

        @keyframes failShake {
            0%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-10px); }
            20%, 40%, 60%, 80% { transform: translateX(10px); }
        }

        .fail-message {
            color: #ef4444;
            font-size: 2.5rem;
            font-weight: 800;
            text-shadow: 0 0 20px rgba(239, 68, 68, 0.5);
            animation: failFade 2s ease-in-out infinite;
        }

        @keyframes failFade {
            0%, 100% { opacity: 0.7; }
            50% { opacity: 1; }
        }

        .enhancement-badge {
            display: inline-block;
            background: linear-gradient(135deg, #fbbf24, #f59e0b);
            color: #1e293b;
            padding: 0.75rem 2rem;
            border-radius: 2rem;
            font-size: 1.5rem;
            font-weight: 800;
            margin-top: 1rem;
            box-shadow: 0 10px 30px rgba(251, 191, 36, 0.4);
            animation: badgePop 0.6s ease-out 0.5s backwards;
        }

        @keyframes badgePop {
            0% { transform: scale(0); opacity: 0; }
            50% { transform: scale(1.2); }
            100% { transform: scale(1); opacity: 1; }
        }

        .divider {
            height: 2px;
            background: linear-gradient(90deg, transparent, rgba(139, 92, 246, 0.5), transparent);
            margin: 2rem 0;
        }

        .back-button {
            display: inline-block;
            background: linear-gradient(135deg, #8b5cf6, #6366f1);
            color: white;
            padding: 1rem 3rem;
            border-radius: 0.75rem;
            font-size: 1.25rem;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 10px 30px rgba(139, 92, 246, 0.3);
            margin-top: 1rem;
        }

        .back-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 40px rgba(139, 92, 246, 0.5);
        }

        .back-button:active {
            transform: translateY(-1px);
        }

        /* Confetti for success */
        .confetti {
            position: absolute;
            width: 10px;
            height: 10px;
            background: #fbbf24;
            animation: confettiFall 3s linear infinite;
        }

        @keyframes confettiFall {
            0% { transform: translateY(-100vh) rotate(0deg); opacity: 1; }
            100% { transform: translateY(100vh) rotate(720deg); opacity: 0; }
        }

        .confetti:nth-child(1) { left: 10%; background: #fbbf24; animation-delay: 0s; }
        .confetti:nth-child(2) { left: 20%; background: #22c55e; animation-delay: 0.3s; }
        .confetti:nth-child(3) { left: 30%; background: #3b82f6; animation-delay: 0.6s; }
        .confetti:nth-child(4) { left: 40%; background: #ec4899; animation-delay: 0.9s; }
        .confetti:nth-child(5) { left: 50%; background: #a855f7; animation-delay: 1.2s; }
        .confetti:nth-child(6) { left: 60%; background: #f97316; animation-delay: 1.5s; }
        .confetti:nth-child(7) { left: 70%; background: #06b6d4; animation-delay: 1.8s; }
        .confetti:nth-child(8) { left: 80%; background: #eab308; animation-delay: 2.1s; }
        .confetti:nth-child(9) { left: 90%; background: #10b981; animation-delay: 2.4s; }

        @media (max-width: 640px) {
            .card {
                padding: 2rem 1.5rem;
            }

            .title {
                font-size: 2rem;
            }

            .equipment-name {
                font-size: 1.5rem;
            }

            .result-icon {
                font-size: 6rem !important;
            }

            .success-message,
            .fail-message {
                font-size: 1.75rem;
            }

            .enhancement-badge {
                font-size: 1.25rem;
                padding: 0.5rem 1.5rem;
            }
        }
    </style>
</head>
<body class="${success ? 'success-bg' : 'fail-bg'}">
    <div class="particles">
        <c:choose>
            <c:when test="${success}">
                <div class="particle success-particle"></div>
                <div class="particle success-particle"></div>
                <div class="particle success-particle"></div>
                <div class="particle success-particle"></div>
                <div class="particle success-particle"></div>
            </c:when>
            <c:otherwise>
                <div class="particle fail-particle"></div>
                <div class="particle fail-particle"></div>
                <div class="particle fail-particle"></div>
                <div class="particle fail-particle"></div>
                <div class="particle fail-particle"></div>
            </c:otherwise>
        </c:choose>
    </div>

    <c:if test="${success}">
        <!-- Confetti for success -->
        <div class="confetti"></div>
        <div class="confetti"></div>
        <div class="confetti"></div>
        <div class="confetti"></div>
        <div class="confetti"></div>
        <div class="confetti"></div>
        <div class="confetti"></div>
        <div class="confetti"></div>
        <div class="confetti"></div>
    </c:if>

    <div class="container">
        <div class="card ${success ? 'success' : 'fail'}">
            <h1 class="title">⚔ 강화 결과 ⚔</h1>

            <div class="equipment-section">
                <div class="equipment-label">장비</div>
                <div class="equipment-name">${swordName}</div>
            </div>

            <div class="divider"></div>

            <div class="result-section">
                <c:choose>
                    <c:when test="${success}">
                        <div class="result-icon success">✨</div>
                        <p class="success-message">강화 성공!</p>
                        <div class="enhancement-badge">+1 강화 완료</div>
                    </c:when>
                    <c:otherwise>
                        <div class="result-icon fail">💔</div>
                        <p class="fail-message">강화 실패 😢</p>
                        <p style="color: #94a3b8; margin-top: 1rem; font-size: 1.125rem;">
                            다음엔 성공할 거예요!
                        </p>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="divider"></div>

            <a href="${pageContext.request.contextPath}/equipenforce.ep" class="back-button">
                돌아가기
            </a>
        </div>
    </div>

    <script>
        // Play sound effect based on result (optional)
        document.addEventListener('DOMContentLoaded', function() {
            const isSuccess = ${success ? 'true' : 'false'};
            
            // Add screen shake on fail
            if (!isSuccess) {
                document.body.style.animation = 'shake 0.5s ease-in-out';
            }
        });

        // Add shake animation for fail
        const style = document.createElement('style');
        style.textContent = `
            @keyframes shake {
                0%, 100% { transform: translateX(0); }
                10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
                20%, 40%, 60%, 80% { transform: translateX(5px); }
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>


