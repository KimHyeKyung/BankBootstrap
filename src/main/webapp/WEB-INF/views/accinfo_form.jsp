<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/common.css"/>" rel="stylesheet"/>
</head>
<body>
<div class="container p-5 my-5 border">
	<h5 class="title">계좌조회</h5>
	<form action="./acc_info" method="post" id="acc_info">
  		<div class="input-group mb-2">
    		<span class="input-group-text title">계좌번호</span>
    		<input type="text" class="form-control" name="id" id="acc_info_id">
  		</div>
  		<div class="d-grid">
    		<input type="submit" class="btn btn-primary" value="계좌조회"/>
  		</div>  		
	</form>	
</div>
</body>
</html>