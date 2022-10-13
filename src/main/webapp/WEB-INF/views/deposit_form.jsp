<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/common.css"/>" rel="stylesheet"/>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(function() {
	var response="<c:out value='${response}'/>";	
	var success="<c:out value='${success}'/>";	
	var err="<c:out value='${err}'/>";	
	if(response == "true"){
		if(success == "true"){
			$('.modal-title').text("입금 성공");
			$('.modal-body').text("입금되었습니다.");
		}else{
			$('.modal-title').text("입금 실패");
			$('.modal-body').text("입금을 실패하였습니다.("+err+")");
		}
		$('#modalbtn').click();
	}
});
</script>
</head>
<body>
<div class="container p-5 my-5 border">
	<h5 class="title">입금</h5>
	<form action="./deposit" method="post" id="deposit">
  		<div class="input-group mb-2">
    		<span class="input-group-text title">계좌번호</span>
    		<input type="text" class="form-control" name="id" id="id">
  		</div>

  		<div class="input-group mb-2">
    		<span class="input-group-text title">입금액</span>
    		<input type="number" class="form-control" name="money" id="money">
  		</div>
  		
  		<div class="d-grid">
    		<input type="submit" class="btn btn-primary" value="입금"/>
  		</div>  		
	</form>	
</div>

<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal" id="modalbtn" style="visibility: hidden;"></button>
<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title"></h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>