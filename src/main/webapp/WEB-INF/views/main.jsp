<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<title>HyeKyungლ(╹◡╹ლ) Bank</title>
</head>
<body>
	<div class="p-5 bg-primary text-white text-center">
		<h1>HyeKyung ლ(╹◡╹ლ) Bank</h1>
	</div>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container-fluid">
			<!-- Links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="./makeaccount">계좌개설</a></li>
				<li class="nav-item"><a class="nav-link" href="./deposit">입금</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="./withdraw">출금</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="./accinfo">계좌조회</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="./allaccinfo">전체계좌조회</a></li>
			</ul>

			<ul class="navbar-nav" style="justify-content: right;">
				<li class="nav-item">
					<c:choose>
						<c:when test="${sessionScope.id eq null}">
							<a class="nav-link" href="./login">로그인</a>
						</c:when>
						<c:otherwise>
							<a class="nav-link" href="./logout">로그아웃</a>
						</c:otherwise>
					</c:choose>
				</li>
				<li class="nav-item"><a class="nav-link" href="./join">회원가입</a>
				</li>
			</ul>
		</div>
	</nav>

	<div class="container mt-3" style="width: 100%; height: 500px; align-content: center;">
		<jsp:include page='${page}.jsp'/>
	</div>
</body>
</html>