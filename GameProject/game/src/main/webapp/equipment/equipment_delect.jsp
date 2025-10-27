<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장비 삭제</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: linear-gradient(135deg, #2a0f0f, #4a1f1f, #3a1a1a);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 1rem;
            position: relative;
           overflow-x: hidden; /* ✅ 가로 스크롤만 숨기기 */
             overflow-y: auto;  
        }

        /* Animated background particles - red theme */
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
            background: radial-gradient(circle, rgba(239, 68, 68, 0.1), transparent);
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
            background: rgba(40, 20, 20, 0.9);
            backdrop-filter: blur(20px);
            border: 2px solid rgba(239, 68, 68, 0.4);
            border-radius: 1.5rem;
            padding: 3rem 2.5rem;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.5),
                        0 0 100px rgba(239, 68, 68, 0.2);
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
            color: #ef4444;
            font-size: 2.25rem;
            font-weight: 800;
            margin-bottom: 0.75rem;
            text-shadow: 0 0 20px rgba(239, 68, 68, 0.5);
            letter-spacing: 0.05em;
        }

        .subtitle {
            color: #fca5a5;
            font-size: 1rem;
            opacity: 0.9;
        }

        .icon-header {
            font-size: 3rem;
            margin-bottom: 1rem;
            animation: iconShake 2s ease-in-out infinite;
        }

        @keyframes iconShake {
            0%, 100% { transform: rotate(0deg); }
            25% { transform: rotate(-10deg); }
            75% { transform: rotate(10deg); }
        }

        /* Warning Box */
        .warning-box {
            background: rgba(239, 68, 68, 0.1);
            border: 2px solid rgba(239, 68, 68, 0.3);
            border-radius: 0.75rem;
            padding: 1.25rem;
            margin-bottom: 2rem;
        }

        .warning-header {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 0.5rem;
        }

        .warning-icon {
            font-size: 1.5rem;
            animation: pulse 2s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { opacity: 1; transform: scale(1); }
            50% { opacity: 0.7; transform: scale(1.1); }
        }

        .warning-title {
            color: #fca5a5;
            font-size: 1rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .warning-text {
            color: #fecaca;
            font-size: 0.9375rem;
            line-height: 1.6;
        }

        /* Form */
        .form-group {
            margin-bottom: 1.75rem;
        }

        label {
            display: block;
            color: #fca5a5;
            font-size: 0.9375rem;
            font-weight: 600;
            margin-bottom: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        label::before {
            content: '🗑 ';
            opacity: 0.7;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 0.875rem 1.25rem;
            background: rgba(30, 20, 20, 0.6);
            border: 2px solid rgba(239, 68, 68, 0.3);
            border-radius: 0.75rem;
            color: #fecaca;
            font-size: 1rem;
            transition: all 0.3s ease;
            outline: none;
        }

        input[type="text"]:focus,
        select:focus {
            border-color: #ef4444;
            background: rgba(30, 20, 20, 0.8);
            box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.1),
                        0 0 20px rgba(239, 68, 68, 0.2);
        }

        input::placeholder {
            color: #7f1d1d;
        }

        select {
            cursor: pointer;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%23fca5a5' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 1rem center;
            background-size: 1.25rem;
            padding-right: 3rem;
        }

        select option {
            background: #1e1414;
            color: #fecaca;
            padding: 0.75rem;
        }

        /* Helper text */
        .helper-text {
            color: #991b1b;
            font-size: 0.8125rem;
            margin-top: 0.5rem;
            font-style: italic;
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
            background: linear-gradient(135deg, #dc2626, #991b1b);
            color: white;
            border: none;
            border-radius: 0.75rem;
            font-size: 1.125rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 10px 30px rgba(220, 38, 38, 0.3);
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
            box-shadow: 0 15px 40px rgba(220, 38, 38, 0.5);
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
            background: rgba(71, 85, 105, 0.6);
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
            background: rgba(71, 85, 105, 0.8);
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
            background: linear-gradient(90deg, transparent, rgba(239, 68, 68, 0.3), transparent);
            margin: 2rem 0;
        }

        /* Confirmation Modal */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            display: none;
            align-items: center;
            justify-content: center;
            z-index: 1000;
            animation: fadeIn 0.3s ease-out;
        }

        .modal-overlay.show {
            display: flex;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .modal {
            background: linear-gradient(135deg, rgba(40, 20, 20, 0.98), rgba(60, 30, 30, 0.98));
            backdrop-filter: blur(20px);
            border: 2px solid rgba(239, 68, 68, 0.5);
            border-radius: 1rem;
            padding: 2rem;
            max-width: 450px;
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

        .modal-icon {
            text-align: center;
            font-size: 4rem;
            margin-bottom: 1rem;
            animation: iconShake 1s ease-in-out infinite;
        }

        .modal-title {
            color: #ef4444;
            font-size: 1.5rem;
            font-weight: 800;
            text-align: center;
            margin-bottom: 1rem;
        }

        .modal-message {
            color: #fecaca;
            text-align: center;
            font-size: 1rem;
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }

        .modal-equipment {
            background: rgba(239, 68, 68, 0.1);
            border: 1px solid rgba(239, 68, 68, 0.3);
            border-radius: 0.5rem;
            padding: 1rem;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .modal-equipment-name {
            color: #fbbf24;
            font-size: 1.25rem;
            font-weight: 700;
        }

        .modal-buttons {
            display: flex;
            gap: 1rem;
        }

        .modal-button {
            flex: 1;
            padding: 0.875rem;
            border: none;
            border-radius: 0.5rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .modal-button-confirm {
            background: linear-gradient(135deg, #dc2626, #991b1b);
            color: white;
        }

        .modal-button-confirm:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(220, 38, 38, 0.4);
        }

        .modal-button-cancel {
            background: rgba(71, 85, 105, 0.8);
            color: #cbd5e1;
        }

        .modal-button-cancel:hover {
            background: rgba(71, 85, 105, 1);
            transform: translateY(-2px);
        }

        @media (max-width: 640px) {
            .card {
                padding: 2rem 1.5rem;
            }

            .title {
                font-size: 1.875rem;
            }

            .button-group {
                flex-direction: column;
            }

            .modal {
                padding: 1.5rem;
            }
        }
        
        #deleteBtn {
    background: linear-gradient(135deg, #ff4d4d, #cc0000);
    color: white;
    font-size: 1.1rem;
    font-weight: 600;
    border: none;
    border-radius: 12px;
    padding: 12px 24px;
    cursor: pointer;
    display: inline-flex;
    align-items: center;
    gap: 8px;
    transition: all 0.25s ease;
    box-shadow: 0 0 15px rgba(255, 0, 0, 0.4);
    text-shadow: 0 0 6px rgba(255, 255, 255, 0.3);
}

/* hover 시 네온 + 살짝 커짐 */
#deleteBtn:hover {
    transform: scale(1.05);
    box-shadow: 0 0 25px rgba(255, 50, 50, 0.8);
    background: linear-gradient(135deg, #ff6666, #e60000);
}

/* 클릭 시 살짝 눌림 */
#deleteBtn:active {
    transform: scale(0.97);
    box-shadow: 0 0 10px rgba(255, 0, 0, 0.5);
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
                <div class="icon-header">⚠️</div>
                <h1 class="title">장비 삭제</h1>
                <p class="subtitle">삭제할 장비 정보를 입력하세요</p>
            </div>

            <!-- Warning Box -->
            <div class="warning-box">
                <div class="warning-header">
                    <span class="warning-icon">⚠️</span>
                    <span class="warning-title">주의</span>
                </div>
                <p class="warning-text">
                    이 작업은 되돌릴 수 없습니다. 장비를 삭제하면 모든 강화 기록이 영구적으로 삭제됩니다.
                </p>
            </div>

            <form id="deleteForm" action="${pageContext.request.contextPath}/equipDelete.ep" method="get">
                <!-- 장비 이름 -->
                <div class="form-group">
                    <label for="equipName">삭제할 장비 이름</label>
                    <input type="text" name="equipName" id="equipName" 
                           placeholder="예: 불꽃검" required>
                    <p class="helper-text">정확한 장비 이름을 입력하세요</p>
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
                    <p class="helper-text">삭제할 장비의 타입을 선택하세요</p>
                </div>

                <div class="divider"></div>

                <!-- 버튼 -->
                <div class="button-group">
                    <button type="button" id="deleteBtn">
                        <span>🗑 장비 삭제</span>
                    </button>
                    <a href="${pageContext.request.contextPath}" class="cancel-button">
                        ↩️ 취소
                    </a>
                </div>
            </form>
        </div>
    </div>

    <!-- Confirmation Modal -->
    <div class="modal-overlay" id="modalOverlay">
        <div class="modal">
            <div class="modal-icon">⚠️</div>
            <h2 class="modal-title">정말 삭제하시겠습니까?</h2>
            <p class="modal-message">
                다음 장비가 영구적으로 삭제됩니다.
            </p>
            <div class="modal-equipment">
                <div class="modal-equipment-name" id="modalEquipmentName"></div>
            </div>
            <div class="modal-buttons">
                <button class="modal-button modal-button-cancel" onclick="closeModal()">
                    취소
                </button>
                <button class="modal-button modal-button-confirm" onclick="confirmDelete()">
                    삭제하기
                </button>
            </div>
        </div>
    </div>

    <script>
        const deleteForm = document.getElementById('deleteForm');
        const deleteBtn = document.getElementById('deleteBtn');
        const modalOverlay = document.getElementById('modalOverlay');
        const modalEquipmentName = document.getElementById('modalEquipmentName');

        // Form validation with visual feedback
        const inputs = deleteForm.querySelectorAll('input[required], select[required]');
        
        inputs.forEach(input => {
            input.addEventListener('blur', function() {
                if (this.value.trim() === '') {
                    this.style.borderColor = 'rgba(239, 68, 68, 0.7)';
                    this.style.boxShadow = '0 0 0 3px rgba(239, 68, 68, 0.1)';
                } else {
                    this.style.borderColor = 'rgba(234, 179, 8, 0.5)';
                    this.style.boxShadow = '0 0 0 3px rgba(234, 179, 8, 0.1)';
                }
            });

            input.addEventListener('focus', function() {
                this.style.borderColor = 'rgba(239, 68, 68, 0.5)';
            });
        });

        // Show confirmation modal
        deleteBtn.addEventListener('click', function() {
            const equipName = document.getElementById('equipName').value;
            const equipType = document.getElementById('equipType').value;

            if (!equipName || !equipType) {
                alert('모든 필드를 입력해주세요.');
                return;
            }

            const typeIcon = {
                'sword': '🗡',
                'shield': '🛡',
                'armor': '🪖'
            };

            modalEquipmentName.textContent = `${typeIcon[equipType] || ''} ${equipName}`;
            modalOverlay.classList.add('show');
        });

        // Close modal
        function closeModal() {
            modalOverlay.classList.remove('show');
        }

        // Confirm delete and submit form
        function confirmDelete() {
            deleteForm.submit();
        }

        // Close modal when clicking outside
        modalOverlay.addEventListener('click', function(e) {
            if (e.target === this) {
                closeModal();
            }
        });

        // Escape key to close modal
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape' && modalOverlay.classList.contains('show')) {
                closeModal();
            }
        });

        // Add ripple effect to button
        deleteBtn.addEventListener('click', function(e) {
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