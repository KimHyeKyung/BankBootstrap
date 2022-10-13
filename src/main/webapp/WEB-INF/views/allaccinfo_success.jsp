<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/common.css"/>" rel="stylesheet"/>
</head>
<body>
<div class="container mt-3">
	<h5 class="title">전체 계좌조회</h5>
	<br>
	<table class="table table-hover">
	  <thead class="table-primary">
	    <tr>
	      <th>계좌번호</th>
	      <th>이름</th>
	      <th>잔액</th>
	      <th>계좌구분</th>
	      <th>등급</th>
	    </tr>
	  </thead>
	  <tbody>
	  <c:forEach var="acc" items="${accs}">
	    <tr>
	      <td>${acc.id}</td>
	      <td>${acc.name}</td>
	      <td>${acc.balance}</td>
		    <c:choose>
				<c:when test="${acc.sect eq 'special'}">
					<td>특수계좌</td>
					<td>${acc.grade}</td>
				</c:when>
				<c:otherwise>
					<td>일반계좌</td>
					<td></td>
				</c:otherwise>		
			</c:choose>
	    </tr>
	    </c:forEach>
	  </tbody>
	</table>
</div>
</body>
</html>