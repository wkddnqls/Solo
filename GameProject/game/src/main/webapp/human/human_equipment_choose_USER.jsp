<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>장비를 장착할 유저 선택</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;600;700&display=swap"
	rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: "Noto Sans KR", sans-serif;
	background: linear-gradient(135deg, #0f172a 0%, #581c87 50%, #0f172a 100%);
	min-height: 100vh;
	padding: 32px;
	color: #e2e8f0;
}

.container {
	max-width: 1152px;
	margin: 0 auto;
}

.card {
	background: rgba(30, 41, 59, 0.5);
	border: 1px solid rgba(168, 85, 247, 0.3);
	border-radius: 12px;
	backdrop-filter: blur(12px);
	box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
}

.card-header {
	padding: 24px;
	border-bottom: 1px solid rgba(168, 85, 247, 0.3);
}

h1 {
	text-align: center;
	font-size: 1.5em;
	font-weight: 700;
	color: #e9d5ff;
	margin: 0;
}

.card-content {
	padding: 24px;
}

.table-wrapper {
	border: 1px solid rgba(168, 85, 247, 0.2);
	border-radius: 8px;
	overflow: hidden;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 12px;
	text-align: center;
}

thead tr {
	background: rgba(88, 28, 135, 0.5);
	border-bottom: 1px solid rgba(168, 85, 247, 0.2);
}

thead th {
	color: #e9d5ff;
	font-weight: 600;
	font-size: 0.9em;
}

tbody tr {
	border-bottom: 1px solid rgba(168, 85, 247, 0.2);
	transition: background-color 0.2s;
}

tbody tr:hover {
	background: rgba(88, 28, 135, 0.2);
}

tbody tr:last-child {
	border-bottom: none;
}

tbody td {
	color: #f1f5f9;
}

.empty-message {
	text-align: center;
	padding: 48px;
	color: #94a3b8;
}

.select-button {
	padding: 8px 16px;
	border-radius: 6px;
	border: 1px solid rgba(168, 85, 247, 0.3);
	background: #9333ea;
	color: white;
	cursor: pointer;
	transition: all 0.2s;
	font-family: inherit;
	font-size: 0.9em;
	text-decoration: none;
	display: inline-block;
}

.select-button:hover {
	background: #7e22ce;
	transform: translateY(-2px);
	box-shadow: 0 4px 12px rgba(147, 51, 234, 0.4);
}

.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 8px;
	margin-top: 24px;
}

.pagination a, .pagination button {
	padding: 8px 16px;
	border-radius: 6px;
	border: 1px solid rgba(168, 85, 247, 0.3);
	background: rgba(51, 65, 85, 0.5);
	color: #e9d5ff;
	cursor: pointer;
	transition: all 0.2s;
	font-family: inherit;
	font-size: 0.9em;
	text-decoration: none;
}

.pagination a:hover {
	background: rgba(124, 58, 237, 0.3);
}

.pagination button:disabled {
	opacity: 0.5;
	cursor: not-allowed;
}

.pagination button.active {
	background: #9333ea;
	color: white;
	border-color: #9333ea;
}

.back-link-wrapper {
	text-align: center;
	margin-top: 32px;
}

.back-link {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	padding: 10px 20px;
	background: rgba(51, 65, 85, 0.5);
	border: 1px solid rgba(168, 85, 247, 0.3);
	color: #e9d5ff;
	text-decoration: none;
	border-radius: 6px;
	transition: all 0.2s;
}

.back-link:hover {
	background: rgba(124, 58, 237, 0.3);
}

.back-link svg {
	width: 16px;
	height: 16px;
}

@media ( max-width : 768px) {
	body {
		padding: 16px;
	}
	.card-content {
		padding: 16px;
	}
	th, td {
		padding: 8px;
		font-size: 0.85em;
	}
	.select-button {
		padding: 6px 12px;
		font-size: 0.8em;
	}
}
</style>
</head>

<body>
	<div class="container">
		<div class="card">
			<div class="card-header">
				<h1>장비를 장착할 유저 선택</h1>
			</div>
			<div class="card-content">
				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th>이름</th>
								<th>레벨</th>
								<th>공격력</th>
								<th>방어력</th>
								<th>장착 장비</th>
								<th>선택</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="h" items="${humanList}">
								<tr>
									<td>${h.humanName}</td>
									<td>${h.humanNum}</td>
									<td>${h.humanPower}</td>
									<td>${h.humanDefensive}</td>
									<td>${h.humanSpecslist}</td>
									<td>
										<form action="${pageContext.request.contextPath}/chooseEquipment.ep" method="post">
											<input type="hidden" name="humanName" value="${h.humanName}">
											<input type="hidden" name="humanNum" value="${h.humanNum}">
											<input type="hidden" name="humanPower" value="${h.humanPower}">
										    <input type="hidden" name="humanDefensive" value="${h.humanDefensive}"> 
											<input type="hidden" name="humanSpecslist" value="${h.humanSpecslist}">
											<button type="submit" class="select-button">선택</button>
										</form>
									</td>
								</tr>
							</c:forEach>
							<c:if test="${empty humanList}">
								<tr>
									<td colspan="6" class="empty-message">등록된 유저가 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>

				<c:if test="${not empty humanList and Humanpi.maxPage > 1}">
					<div class="pagination">
						<c:if test="${Humanpi.currentPage > 1}">
							<a
								href="${pageContext.request.contextPath}/selectUser.ep?humanPage=${Humanpi.currentPage - 1}">
								← 이전 </a>
						</c:if>
						<c:if test="${Humanpi.currentPage == 1}">
							<button disabled>← 이전</button>
						</c:if>

						<c:forEach var="i" begin="${Humanpi.startPage}"
							end="${Humanpi.endPage}">
							<c:choose>
								<c:when test="${i == Humanpi.currentPage}">
									<button class="active" disabled>${i}</button>
								</c:when>
								<c:otherwise>
									<a
										href="${pageContext.request.contextPath}/selectUser.ep?humanPage=${i}">
										${i} </a>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if test="${Humanpi.currentPage < Humanpi.maxPage}">
							<a
								href="${pageContext.request.contextPath}/selectUser.ep?humanPage=${Humanpi.currentPage + 1}">
								다음 → </a>
						</c:if>
						<c:if test="${Humanpi.currentPage == Humanpi.maxPage}">
							<button disabled>다음 →</button>
						</c:if>
					</div>
				</c:if>

				<div class="back-link-wrapper">
					<a href="http://localhost:8001/game/human/human_options.jsp"
						class="back-link"> <svg xmlns="http://www.w3.org/2000/svg"
							fill="none" viewBox="0 0 24 24" stroke="currentColor"
							stroke-width="2">
              <path stroke-linecap="round" stroke-linejoin="round"
								d="M10 19l-7-7m0 0l7-7m-7 7h18" />
            </svg> 유저 메뉴로 돌아가기
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
