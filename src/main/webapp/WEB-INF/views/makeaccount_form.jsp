<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/common.css"/>" rel="stylesheet"/>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<title>코스타 은행</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(function() {
	var response="<c:out value='${response}'/>";	
	var success="<c:out value='${success}'/>";	
	var name="<c:out value='${acc.name}'/>";	
	var id="<c:out value='${acc.id}'/>";	
	var err="<c:out value='${err}'/>";	
	if(response == "true"){
		if(success == "true"){
			$('.modal-title').text("계좌개설 성공");
			$('.modal-body').text(name + "님 계좌가 개설되었습니다.(계좌번호: "+id+")");
		}else{
			$('.modal-title').text("계좌개설 실패");
			$('.modal-body').text("계좌 개설을 실패하였습니다.("+err+")");
		}
		$('#modalbtn').click();
	}
	
	$('input[type=radio]').change(function() {
		if($(this).val()=='normal') {
			$('select').attr('disabled','disabled');
		} else {
			$('select').removeAttr('disabled');
		}
	});
	
	$('#double').click(function(){
		var id = $("#make_id").val();
		$.ajax({
			type:"post",
			url:"http://localhost:8088/bank/accountId",
			data:{id:id},
			success:function(data,textStatus){
				if(data == "true"){
					$('.modal-body').text("이미 존재하는 계좌번호입니다.");
					$("#make_id").val("");
				}else{
					$('.modal-body').text("사용가능한 계좌번호 입니다.");
				}
				$('#modalbtn').click();
			}
		});
	});
	
});
</script>
</head>
<body>
<div class="container p-5 my-5 border">
	<h5 class="title">계좌 개설</h5>
	<form action="./make_account" method="post" id="make_acc">
  		<div class="input-group mb-2">
    		<span class="input-group-text title">계좌번호</span>
    		<input type="text" class="form-control" placeholder="10001" name="id" id="make_id">
    		<input type="button" id="double" class="btn btn-info" value="중복"/>
  		</div>

  		<div class="input-group mb-2">
    		<span class="input-group-text title">이름</span>
    		<input type="text" class="form-control" placeholder="홍길동" name="name" id="name">
  		</div>
  		
  		<div class="input-group mb-2">
    		<span class="input-group-text title">입금액</span>
    		<input type="text" class="form-control" placeholder="100000" name="balance" id="balance">
  		</div>
  		
  		<div class="input-group mb-2">
    		<span class="input-group-text title">계좌구분</span>
    		<span class="form-control">
    			<input type="radio" value="normal" name="sect" checked class="form-check-input">&nbsp;일반계좌&nbsp;&nbsp;&nbsp;&nbsp;
    			<input type="radio" value="special" name="sect"  class="form-check-input">&nbsp;특수계좌
    		</span>
  		</div>
  		
  		<div class="input-group mb-2">
    		<span class="input-group-text title">등급</span>
    		<select class="form-select" id="grade" name="grade" disabled="disabled">
    			<option value="VIP">VIP</option> 
    			<option value="Gold">Gold</option> 
    			<option value="Silver">Silver</option> 
    			<option value="Normal">Normal</option> 
    		</select>
  		</div>
  		<div class="d-grid">
    		<input type="submit" class="btn btn-primary" value="계좌개설"/>
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