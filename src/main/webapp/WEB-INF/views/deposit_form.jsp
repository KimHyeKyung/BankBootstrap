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
			$('.modal-title').text("�Ա� ����");
			$('.modal-body').text("�ԱݵǾ����ϴ�.");
		}else{
			$('.modal-title').text("�Ա� ����");
			$('.modal-body').text("�Ա��� �����Ͽ����ϴ�.("+err+")");
		}
		$('#modalbtn').click();
	}
});
</script>
</head>
<body>
<div class="container p-5 my-5 border">
	<h5 class="title">�Ա�</h5>
	<form action="./deposit" method="post" id="deposit">
  		<div class="input-group mb-2">
    		<span class="input-group-text title">���¹�ȣ</span>
    		<input type="text" class="form-control" name="id" id="id">
  		</div>

  		<div class="input-group mb-2">
    		<span class="input-group-text title">�Աݾ�</span>
    		<input type="number" class="form-control" name="money" id="money">
  		</div>
  		
  		<div class="d-grid">
    		<input type="submit" class="btn btn-primary" value="�Ա�"/>
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
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">�ݱ�</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>