<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>몬스터 관리 대시보드</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            color: #e2e8f0;
            min-height: 100vh;
            padding: 2rem;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
        }

        .header {
            margin-bottom: 2rem;
        }

        .header h1 {
            font-size: 2rem;
            font-weight: 700;
            color: #fff;
            margin-bottom: 0.5rem;
        }

        .header p {
            color: #94a3b8;
            font-size: 1rem;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: #1e293b;
            border: 1px solid #334155;
            border-radius: 12px;
            padding: 1.5rem;
            transition: all 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }

        .stat-header {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: #cbd5e1;
            font-size: 0.875rem;
            margin-bottom: 0.75rem;
        }

        .stat-icon {
            width: 20px;
            height: 20px;
        }

        .stat-value {
            font-size: 2rem;
            font-weight: 700;
            color: #fff;
            margin-bottom: 0.25rem;
        }

        .stat-label {
            font-size: 0.875rem;
            color: #64748b;
        }

        .main-card {
            background: #1e293b;
            border: 1px solid #334155;
            border-radius: 12px;
            overflow: hidden;
        }

        .card-header {
            padding: 1.5rem;
            border-bottom: 1px solid #334155;
        }

        .card-header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: #fff;
            margin-bottom: 0.25rem;
        }

        .card-description {
            color: #94a3b8;
            font-size: 0.875rem;
        }

        .header-actions {
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        .search-box {
            position: relative;
        }

        .search-input {
            padding: 0.5rem 0.75rem 0.5rem 2.5rem;
            background: #0f172a;
            border: 1px solid #475569;
            border-radius: 8px;
            color: #fff;
            font-size: 0.875rem;
            width: 250px;
            outline: none;
            transition: border-color 0.2s;
        }

        .search-input:focus {
            border-color: #06b6d4;
        }

        .search-input::placeholder {
            color: #64748b;
        }

        .search-icon {
            position: absolute;
            left: 0.75rem;
            top: 50%;
            transform: translateY(-50%);
            width: 16px;
            height: 16px;
            color: #64748b;
        }

        .btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 8px;
            font-size: 0.875rem;
            font-weight: 500;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.2s;
        }

        .btn-primary {
            background: #06b6d4;
            color: #fff;
        }

        .btn-primary:hover {
            background: #0891b2;
        }

        .btn-danger {
            background: #dc2626;
            color: #fff;
        }

        .btn-danger:hover {
            background: #b91c1c;
        }

        .btn-secondary {
            background: transparent;
            color: #cbd5e1;
            border: 1px solid #475569;
        }

        .btn-secondary:hover {
            background: #0f172a;
        }

        .btn-ghost {
            background: transparent;
            color: #94a3b8;
            padding: 0.5rem;
        }

        .btn-ghost:hover {
            background: #0f172a;
            color: #fff;
        }

        .btn-ghost.danger:hover {
            background: #7f1d1d;
            color: #fca5a5;
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead {
            background: #0f172a;
        }

        th {
            padding: 1rem;
            text-align: left;
            font-weight: 500;
            color: #94a3b8;
            font-size: 0.875rem;
            border-bottom: 1px solid #334155;
        }

        th:last-child {
            text-align: right;
        }

        td {
            padding: 1rem;
            border-bottom: 1px solid #334155;
            color: #cbd5e1;
        }

        td:last-child {
            text-align: right;
        }

        tbody tr {
            transition: background 0.2s;
        }

        tbody tr:hover {
            background: rgba(15, 23, 42, 0.5);
        }

        .badge {
            display: inline-flex;
            align-items: center;
            padding: 0.25rem 0.75rem;
            border-radius: 6px;
            font-size: 0.75rem;
            font-weight: 500;
        }

        .badge-outline {
            border: 1px solid #0e7490;
            color: #22d3ee;
        }

        .badge-green {
            background: #064e3b;
            color: #6ee7b7;
        }

        .stat-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .icon-sm {
            width: 16px;
            height: 16px;
        }

        .text-orange {
            color: #fb923c;
        }

        .text-blue {
            color: #60a5fa;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.7);
            z-index: 1000;
            align-items: center;
            justify-content: center;
            padding: 1rem;
        }

        .modal.active {
            display: flex;
        }

        .modal-content {
            background: #1e293b;
            border: 1px solid #334155;
            border-radius: 12px;
            max-width: 500px;
            width: 100%;
            max-height: 90vh;
            overflow-y: auto;
        }

        .modal-header {
            padding: 1.5rem;
            border-bottom: 1px solid #334155;
        }

        .modal-title {
            font-size: 1.25rem;
            font-weight: 700;
            color: #fff;
            margin-bottom: 0.25rem;
        }

        .modal-description {
            color: #94a3b8;
            font-size: 0.875rem;
        }

        .modal-body {
            padding: 1.5rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            color: #cbd5e1;
            font-weight: 500;
            font-size: 0.875rem;
        }

        .form-input {
            width: 100%;
            padding: 0.75rem;
            background: #0f172a;
            border: 1px solid #475569;
            border-radius: 8px;
            color: #fff;
            font-size: 1rem;
            outline: none;
            transition: border-color 0.2s;
        }

        .form-input:focus {
            border-color: #06b6d4;
        }

        .form-input::placeholder {
            color: #64748b;
        }

        .modal-footer {
            display: flex;
            gap: 0.75rem;
            padding: 1.5rem;
            border-top: 1px solid #334155;
        }

        .modal-footer .btn {
            flex: 1;
        }

        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            color: #64748b;
        }

        .progress-bar {
            width: 100%;
            height: 12px;
            background: #0f172a;
            border-radius: 6px;
            overflow: hidden;
            margin-top: 0.5rem;
        }

        .progress-fill {
            height: 100%;
            border-radius: 6px;
            transition: width 0.3s ease;
        }

        .progress-orange {
            background: linear-gradient(to right, #ea580c, #fb923c);
        }

        .progress-blue {
            background: linear-gradient(to right, #2563eb, #60a5fa);
        }

        .detail-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .detail-item {
            background: #0f172a;
            padding: 1rem;
            border-radius: 8px;
        }

        .detail-label {
            color: #94a3b8;
            font-size: 0.875rem;
            margin-bottom: 0.5rem;
        }

        .detail-value {
            color: #fff;
            font-weight: 500;
        }

        .stat-box {
            margin-bottom: 1rem;
        }

        .stat-box-header {
            display: flex;
            justify-content: between;
            align-items: center;
            margin-bottom: 0.5rem;
        }

        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }

        @media (max-width: 768px) {
            body {
                padding: 1rem;
            }

            .header h1 {
                font-size: 1.5rem;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .search-input {
                width: 100%;
            }

            .card-header-content {
                flex-direction: column;
                align-items: flex-start;
            }

            .header-actions {
                width: 100%;
                flex-direction: column;
            }

            .search-box {
                width: 100%;
            }

            .detail-grid {
                grid-template-columns: 1fr;
            }

            table {
                font-size: 0.875rem;
            }

            th, td {
                padding: 0.75rem 0.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <h1>몬스터 관리 대시보드</h1>
            <p>몬스터 생성, 정보 보기, 삭제 관리</p>
        </div>

        <!-- Stats Cards -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-header">
                    <svg class="stat-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24" style="color: #22d3ee">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 20l4-16m2 16l4-16M6 9h14M4 15h14"/>
                    </svg>
                    총 몬스터
                </div>
                <div class="stat-value" id="totalMonsters">0</div>
                <div class="stat-label">등록됨</div>
            </div>

            <div class="stat-card">
                <div class="stat-header">
                    <svg class="stat-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="color: #fb923c">
                        <path d="M14.5 2.5l5 5L6 21l-4 1 1-4L16.5 4.5z"/>
                        <path d="M13.5 6.5l4 4"/>
                    </svg>
                    평균 공격력
                </div>
                <div class="stat-value" id="avgPower">0</div>
                <div class="stat-label">POWER</div>
            </div>

            <div class="stat-card">
                <div class="stat-header">
                    <svg class="stat-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24" style="color: #60a5fa">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20.618 5.984A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/>
                    </svg>
                    평균 방어력
                </div>
                <div class="stat-value" id="avgDefensive">0</div>
                <div class="stat-label">DEFENSIVE</div>
            </div>

            <div class="stat-card">
                <div class="stat-header">
                    <svg class="stat-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24" style="color: #6ee7b7">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"/>
                    </svg>
                    총 전투력
                </div>
                <div class="stat-value" id="totalCombat">0</div>
                <div class="stat-label">합산</div>
            </div>
        </div>

        <!-- Main Table -->
        <div class="main-card">
            <div class="card-header">
                <div class="card-header-content">
                    <div>
                        <div class="card-title">몬스터 목록</div>
                        <div class="card-description">등록된 모든 몬스터 정보</div>
                    </div>
                    <div class="header-actions">
                        <div class="search-box">
                            <svg class="search-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
                            </svg>
                            <input type="text" class="search-input" id="searchInput" placeholder="몬스터 검색...">
                        </div>
                        <button class="btn btn-primary" onclick="openCreateModal()">
                            <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
                            </svg>
                            몬스터 생성
                        </button>
                    </div>
                </div>
            </div>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>MONSTER_NUM</th>
                            <th>MONSTER_NAME</th>
                            <th>MONSTER_POWER</th>
                            <th>MONSTER_DEFENSIVE</th>
                            <th>전투력</th>
                            <th>작업</th>
                        </tr>
                    </thead>
                    <tbody id="monsterTableBody">
                        <tr>
                            <td colspan="6" class="empty-state">등록된 몬스터가 없습니다</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Create Modal -->
    <div class="modal" id="createModal">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">새 몬스터 생성</div>
                <div class="modal-description">몬스터의 정보를 입력하세요</div>
            </div>
            <form id="createForm" onsubmit="createMonster(event)">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="form-label" for="monsterName">MONSTER_NAME</label>
                        <input type="text" class="form-input" id="monsterName" placeholder="몬스터 이름을 입력하세요" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="monsterNum">MONSTER_NUM</label>
                        <input type="number" class="form-input" id="monsterNum" placeholder="몬스터 번호" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="monsterPower">MONSTER_POWER</label>
                        <input type="number" class="form-input" id="monsterPower" placeholder="공격력" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="monsterDefensive">MONSTER_DEFENSIVE</label>
                        <input type="number" class="form-input" id="monsterDefensive" placeholder="방어력" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="closeCreateModal()">취소</button>
                    <button type="submit" class="btn btn-primary">생성하기</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Detail Modal -->
    <div class="modal" id="detailModal">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">몬스터 상세 정보</div>
                <div class="modal-description" id="detailModalDescription"></div>
            </div>
            <div class="modal-body">
                <div class="detail-grid">
                    <div class="detail-item">
                        <div class="detail-label">MONSTER_NUM</div>
                        <div class="detail-value" id="detailNum"></div>
                    </div>
                    <div class="detail-item">
                        <div class="detail-label">MONSTER_NAME</div>
                        <div class="detail-value" id="detailName"></div>
                    </div>
                </div>

                <div class="stat-box">
                    <div class="stat-box-header" style="display: flex; justify-content: space-between; align-items: center;">
                        <label class="form-label" style="margin: 0; display: flex; align-items: center; gap: 0.5rem;">
                            <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24" style="color: #fb923c">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 3l-9 9m0 0l-9-9m9 9V21"/>
                            </svg>
                            MONSTER_POWER
                        </label>
                        <span class="text-orange" id="detailPowerValue"></span>
                    </div>
                    <div class="progress-bar">
                        <div class="progress-fill progress-orange" id="detailPowerBar"></div>
                    </div>
                </div>

                <div class="stat-box">
                    <div class="stat-box-header" style="display: flex; justify-content: space-between; align-items: center;">
                        <label class="form-label" style="margin: 0; display: flex; align-items: center; gap: 0.5rem;">
                            <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24" style="color: #60a5fa">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20.618 5.984A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/>
                            </svg>
                            MONSTER_DEFENSIVE
                        </label>
                        <span class="text-blue" id="detailDefensiveValue"></span>
                    </div>
                    <div class="progress-bar">
                        <div class="progress-fill progress-blue" id="detailDefensiveBar"></div>
                    </div>
                </div>

                <div class="detail-item">
                    <div style="display: flex; justify-content: space-between; align-items: center;">
                        <span class="detail-label">총 전투력</span>
                        <span style="color: #6ee7b7;" id="detailTotalCombat"></span>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="closeDetailModal()">닫기</button>
                <button type="button" class="btn btn-danger" onclick="deleteMonsterFromDetail()">
                    <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
                    </svg>
                    삭제
                </button>
            </div>
        </div>
    </div>

    <script>
        // Data storage
        let monsters = [
            {
                id: '1',
                MONSTER_NAME: '골렘',
                MONSTER_NUM: 101,
                MONSTER_POWER: 850,
                MONSTER_DEFENSIVE: 920
            },
            {
                id: '2',
                MONSTER_NAME: '와이번',
                MONSTER_NUM: 203,
                MONSTER_POWER: 1200,
                MONSTER_DEFENSIVE: 650
            },
            {
                id: '3',
                MONSTER_NAME: '오크',
                MONSTER_NUM: 45,
                MONSTER_POWER: 450,
                MONSTER_DEFENSIVE: 380
            }
        ];

        let selectedMonsterId = null;

        // Initialize
        function init() {
            renderMonsters();
            updateStats();
            document.getElementById('searchInput').addEventListener('input', handleSearch);
        }

        // Update statistics
        function updateStats() {
            const total = monsters.length;
            const totalPower = monsters.reduce((sum, m) => sum + m.MONSTER_POWER, 0);
            const totalDefensive = monsters.reduce((sum, m) => sum + m.MONSTER_DEFENSIVE, 0);
            const avgPower = total > 0 ? Math.round(totalPower / total) : 0;
            const avgDefensive = total > 0 ? Math.round(totalDefensive / total) : 0;
            const totalCombat = totalPower + totalDefensive;

            document.getElementById('totalMonsters').textContent = total;
            document.getElementById('avgPower').textContent = avgPower;
            document.getElementById('avgDefensive').textContent = avgDefensive;
            document.getElementById('totalCombat').textContent = totalCombat;
        }

        // Render monsters table
        function renderMonsters(filter = '') {
            const tbody = document.getElementById('monsterTableBody');
            const filteredMonsters = monsters.filter(m => 
                m.MONSTER_NAME.toLowerCase().includes(filter.toLowerCase()) ||
                m.MONSTER_NUM.toString().includes(filter)
            );

            if (filteredMonsters.length === 0) {
                tbody.innerHTML = `
                    <tr>
                        <td colspan="6" class="empty-state">
                            ${filter ? '검색 결과가 없습니다' : '등록된 몬스터가 없습니다'}
                        </td>
                    </tr>
                `;
                return;
            }

            tbody.innerHTML = filteredMonsters.map(monster => `
                <tr>
                    <td>
                        <span class="badge badge-outline">#${monster.MONSTER_NUM}</span>
                    </td>
                    <td style="color: #fff;">${monster.MONSTER_NAME}</td>
                    <td>
                        <div class="stat-item">
                            <svg class="icon-sm" fill="none" stroke="currentColor" viewBox="0 0 24 24" style="color: #fb923c">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 3l-9 9m0 0l-9-9m9 9V21"/>
                            </svg>
                            <span class="text-orange">${monster.MONSTER_POWER}</span>
                        </div>
                    </td>
                    <td>
                        <div class="stat-item">
                            <svg class="icon-sm" fill="none" stroke="currentColor" viewBox="0 0 24 24" style="color: #60a5fa">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20.618 5.984A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/>
                            </svg>
                            <span class="text-blue">${monster.MONSTER_DEFENSIVE}</span>
                        </div>
                    </td>
                    <td>
                        <span class="badge badge-green">${monster.MONSTER_POWER + monster.MONSTER_DEFENSIVE}</span>
                    </td>
                    <td>
                        <div class="action-buttons" style="justify-content: flex-end;">
                            <button class="btn btn-ghost" onclick="openDetailModal('${monster.id}')">
                                <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                                </svg>
                            </button>
                            <button class="btn btn-ghost danger" onclick="deleteMonster('${monster.id}')">
                                <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
                                </svg>
                            </button>
                        </div>
                    </td>
                </tr>
            `).join('');
        }

        // Search handler
        function handleSearch(e) {
            renderMonsters(e.target.value);
        }

        // Modal functions
        function openCreateModal() {
            document.getElementById('createModal').classList.add('active');
        }

        function closeCreateModal() {
            document.getElementById('createModal').classList.remove('active');
            document.getElementById('createForm').reset();
        }

        function openDetailModal(id) {
            const monster = monsters.find(m => m.id === id);
            if (!monster) return;

            selectedMonsterId = id;
            document.getElementById('detailModalDescription').textContent = `${monster.MONSTER_NAME}의 정보`;
            document.getElementById('detailNum').textContent = `#${monster.MONSTER_NUM}`;
            document.getElementById('detailName').textContent = monster.MONSTER_NAME;
            document.getElementById('detailPowerValue').textContent = monster.MONSTER_POWER;
            document.getElementById('detailDefensiveValue').textContent = monster.MONSTER_DEFENSIVE;
            document.getElementById('detailTotalCombat').textContent = monster.MONSTER_POWER + monster.MONSTER_DEFENSIVE;

            const powerPercent = Math.min((monster.MONSTER_POWER / 2000) * 100, 100);
            const defensivePercent = Math.min((monster.MONSTER_DEFENSIVE / 2000) * 100, 100);
            
            document.getElementById('detailPowerBar').style.width = powerPercent + '%';
            document.getElementById('detailDefensiveBar').style.width = defensivePercent + '%';

            document.getElementById('detailModal').classList.add('active');
        }

        function closeDetailModal() {
            document.getElementById('detailModal').classList.remove('active');
            selectedMonsterId = null;
        }

        // Create monster
        function createMonster(e) {
            e.preventDefault();
            
            const newMonster = {
                id: Date.now().toString(),
                MONSTER_NAME: document.getElementById('monsterName').value,
                MONSTER_NUM: parseInt(document.getElementById('monsterNum').value),
                MONSTER_POWER: parseInt(document.getElementById('monsterPower').value),
                MONSTER_DEFENSIVE: parseInt(document.getElementById('monsterDefensive').value)
            };

            monsters.push(newMonster);
            renderMonsters();
            updateStats();
            closeCreateModal();
        }

        // Delete monster
        function deleteMonster(id) {
            if (confirm('이 몬스터를 삭제하시겠습니까?')) {
                monsters = monsters.filter(m => m.id !== id);
                renderMonsters();
                updateStats();
            }
        }

        function deleteMonsterFromDetail() {
            if (selectedMonsterId && confirm('이 몬스터를 삭제하시겠습니까?')) {
                monsters = monsters.filter(m => m.id !== selectedMonsterId);
                renderMonsters();
                updateStats();
                closeDetailModal();
            }
        }

        // Close modals on background click
        document.getElementById('createModal').addEventListener('click', function(e) {
            if (e.target === this) closeCreateModal();
        });

        document.getElementById('detailModal').addEventListener('click', function(e) {
            if (e.target === this) closeDetailModal();
        });

        // Initialize on load
        init();
    </script>
</body>
</html>
