<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
            overflow: hidden;
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
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: float 15s infinite;
        }

        .particle:nth-child(1) { width: 80px; height: 80px; left: 10%; animation-delay: 0s; }
        .particle:nth-child(2) { width: 60px; height: 60px; left: 20%; animation-delay: 2s; }
        .particle:nth-child(3) { width: 100px; height: 100px; left: 60%; animation-delay: 4s; }
        .particle:nth-child(4) { width: 70px; height: 70px; left: 80%; animation-delay: 6s; }
        .particle:nth-child(5) { width: 90px; height: 90px; left: 40%; animation-delay: 8s; }

        @keyframes float {
            0%, 100% { transform: translateY(100vh) rotate(0deg); opacity: 0; }
            10% { opacity: 0.3; }
            90% { opacity: 0.3; }
            100% { transform: translateY(-100px) rotate(360deg); opacity: 0; }
        }

        .container {
            position: relative;
            z-index: 1;
            max-width: 600px;
            width: 100%;
        }

        .card {
            background: rgba(30, 30, 60, 0.8);
            backdrop-filter: blur(20px);
            border: 2px solid rgba(139, 92, 246, 0.3);
            border-radius: 1.5rem;
            padding: 3rem 2rem;
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

        .header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .title {
            color: #fbbf24;
            font-size: 2.5rem;
            font-weight: 800;
            margin-bottom: 1rem;
            text-shadow: 0 0 20px rgba(251, 191, 36, 0.5),
                         0 0 40px rgba(251, 191, 36, 0.3);
            animation: glow 2s ease-in-out infinite alternate;
            letter-spacing: 0.1em;
        }

        @keyframes glow {
            from { text-shadow: 0 0 20px rgba(251, 191, 36, 0.5), 0 0 40px rgba(251, 191, 36, 0.3); }
            to { text-shadow: 0 0 30px rgba(251, 191, 36, 0.8), 0 0 60px rgba(251, 191, 36, 0.5); }
        }

        .subtitle {
            color: #e0e7ff;
            font-size: 1.25rem;
            margin-bottom: 1.5rem;
        }

        .equipment-info {
            background: rgba(139, 92, 246, 0.1);
            border: 1px solid rgba(139, 92, 246, 0.3);
            border-radius: 0.75rem;
            padding: 1.5rem;
            margin-bottom: 2rem;
            text-align: center;
        }

        .equipment-label {
            color: #a78bfa;
            font-size: 0.875rem;
            margin-bottom: 0.5rem;
            text-transform: uppercase;
            letter-spacing: 0.1em;
        }

        .equipment-name {
            color: #fbbf24;
            font-size: 1.75rem;
            font-weight: 700;
            text-shadow: 0 0 10px rgba(251, 191, 36, 0.3);
        }

        .divider {
            height: 2px;
            background: linear-gradient(90deg, transparent, rgba(139, 92, 246, 0.5), transparent);
            margin: 2rem 0;
        }

        .button-container {
            display: grid;
    grid-template-columns: 1fr 1fr;  /* → 1열 1fr, 2열 1fr (즉 반반 나눔) */
    gap: 1.5rem;
        }

        .btn {
         width: 100%;
            position: relative;
            padding: 2rem 0;
             font-size: 2.5rem;
            font-weight: 800;
            color: white;
            border: none;
            border-radius: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            overflow: hidden;
        }

        .btn::before {
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

        .btn:hover::before {
            width: 300px;
            height: 300px;
        }

        .btn span {
            position: relative;
            z-index: 1;
        }

        .btn1 {
            background: linear-gradient(135deg, #ec4899, #8b5cf6);
            border: 2px solid #ec4899;
        }

        .btn1:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 15px 40px rgba(236, 72, 153, 0.4),
                        0 0 40px rgba(236, 72, 153, 0.3);
        }

        .btn1:active {
            transform: translateY(-2px) scale(1.02);
        }

        .btn2 {
            background: linear-gradient(135deg, #3b82f6, #06b6d4);
            border: 2px solid #3b82f6;
        }

        .btn2:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 15px 40px rgba(59, 130, 246, 0.4),
                        0 0 40px rgba(59, 130, 246, 0.3);
        }

        .btn2:active {
            transform: translateY(-2px) scale(1.02);
        }

        .choice-label {
            display: block;
            color: rgba(255, 255, 255, 0.7);
            font-size: 0.875rem;
            margin-top: 0.75rem;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 0.1em;
        }

        .warning {
            text-align: center;
            color: #fbbf24;
            font-size: 0.875rem;
            margin-top: 2rem;
            padding: 1rem;
            background: rgba(251, 191, 36, 0.1);
            border-radius: 0.5rem;
            border: 1px solid rgba(251, 191, 36, 0.2);
        }

        .warning::before {
            content: '⚠️ ';
        }

        /* Sword icons animation */
        .sword-icon {
            display: inline-block;
            animation: swordBounce 1s ease-in-out infinite;
        }

        .sword-icon:nth-child(1) {
            animation-delay: 0s;
        }

        .sword-icon:nth-child(3) {
            animation-delay: 0.2s;
        }

        @keyframes swordBounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        @media (max-width: 640px) {
            .card {
                padding: 2rem 1.5rem;
            }

            .title {
                font-size: 2rem;
            }

            .subtitle {
                font-size: 1rem;
            }

            .btn {
                padding: 1.5rem 0.75rem;
                font-size: 2.5rem;
            }

            .button-container {
                gap: 1rem;
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
                <h1 class="title">
                    <span class="sword-icon">⚔</span>
                    강화 도전
                    <span class="sword-icon">⚔</span>
                </h1>
                <p class="subtitle">1 또는 2 버튼 중 하나를 선택하세요!</p>
            </div>

            <div class="equipment-info">
                <div class="equipment-label">강화 대상 장비</div>
                <div class="equipment-name">${swordName}</div>
            </div>

            <div class="divider"></div>

            <form action="${pageContext.request.contextPath}/enforce.do" method="post">
                <input type="hidden" name="name" value="${swordName}" />
                <input type="hidden" name="type" value="${type}" />
                
                <div class="button-container">
                    <div>
                        <button class="btn btn1" type="submit" name="choice" value="1">
                            <span>1</span>
                        </button>
                        <span class="choice-label">선택 1</span>
                    </div>
                    <div>
                        <button class="btn btn2" type="submit" name="choice" value="2">
                            <span>2</span>
                        </button>
                        <span class="choice-label">선택 2</span>
                    </div>
                </div>
            </form>

            <div class="warning">
                신중하게 선택하세요! 선택에 따라 강화 결과가 달라질 수 있습니다.
            </div>
        </div>
    </div>

    <script>
        // Button click effect
        document.querySelectorAll('.btn').forEach(button => {
            button.addEventListener('click', function(e) {
                // Create ripple effect
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
            });
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