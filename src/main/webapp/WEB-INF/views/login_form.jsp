<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/common.css"/>" rel="stylesheet"/>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="container p-5 my-5 border">
	<h5 class="title">�α���</h5>
	<form>
  		<div class="input-group mb-2">
    		<span class="input-group-text title">���̵�</span>
    		<input type="text" class="form-control" placeholder="10001" name="id" id="id">
  		</div>

  		<div class="input-group mb-2">
    		<span class="input-group-text title">��й�ȣ</span>
    		<input type="password" class="form-control" name="password" id="password">
  		</div>
  		
  		<div class="d-grid">
    		<input type="submit" class="btn btn-primary" value="�α���"/>
  		</div>  		
	</form>	
</div>
</body>
</html>